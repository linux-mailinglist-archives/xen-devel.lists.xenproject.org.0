Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3909802CDE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646572.1008954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA45X-0007HG-Pi; Mon, 04 Dec 2023 08:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646572.1008954; Mon, 04 Dec 2023 08:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA45X-0007FY-Mf; Mon, 04 Dec 2023 08:13:59 +0000
Received: by outflank-mailman (input) for mailman id 646572;
 Mon, 04 Dec 2023 08:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYKC=HP=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1rA45W-0007F0-CO
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:13:58 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11a8a102-927d-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:13:56 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 11a8a102-927d-11ee-9b0f-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701677635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMNsPU3Juib2yJf6SWQqDXaxEhWmoFOPHWoGv9RWmGg=;
	b=c9Sil9zKcRmAM17YdNijnJ738PZPkK/vFPXvfZqAahgs6pPDG3sDKWQXOdww6YNmkHldsI
	vjwOnAXB+bYEjHmN1RamCkmOVTAX2fGQdmvw2pNYjUI0MxdPmd4T1YHOg6v27La0V6EFgU
	shnYxpZ7VtqifbKRJUw+fltnGt8KchZV9aqpZBYYCcSMPwCNLOTLDHzMzJ3OMeRCm6gji/
	ZBI7XVm6Xe+uzjQsA5VNiKpVTduqxYnPjwbaeWpGWrT98UaiypT/oFki+dXe3gGk7j402j
	xblTjyWiv/lL2Vg+dWyUHVVUVgRYDX3x98dOizKDaWFwW3nuPFqS5GwLQ0e/Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701677635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMNsPU3Juib2yJf6SWQqDXaxEhWmoFOPHWoGv9RWmGg=;
	b=zBwXBxP/CtRum3O7TXJpoQS0cbxSZPFzNqDfrXvR7wNiGLNFMWJgE3xAEKIaSQKeV6xH6I
	vHV1cGfsxAipPcAw==
To: Jiqian Chen <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Roger
 Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, Alex Deucher
 <Alexander.Deucher@amd.com>, Christian Koenig <Christian.Koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
 <xenia.ragiadakou@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia
 Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
 <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
In-Reply-To: <20231124103123.3263471-3-Jiqian.Chen@amd.com>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com>
 <20231124103123.3263471-3-Jiqian.Chen@amd.com>
Date: Mon, 04 Dec 2023 09:13:54 +0100
Message-ID: <87bkb6xu4d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 24 2023 at 18:31, Jiqian Chen wrote:
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 5a96b6c66c07..b83d02bcc76c 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -357,6 +357,7 @@ static int pcistub_match(struct pci_dev *dev)
>  static int pcistub_init_device(struct pci_dev *dev)
>  {
>  	struct xen_pcibk_dev_data *dev_data;
> +	struct irq_desc *desc = NULL;
>  	int err = 0;
>  
>  	dev_dbg(&dev->dev, "initializing...\n");
> @@ -399,6 +400,12 @@ static int pcistub_init_device(struct pci_dev *dev)
>  	if (err)
>  		goto config_release;
>  
> +	if (xen_initial_domain() && xen_pvh_domain()) {
> +		if (dev->irq <= 0 || !(desc = irq_to_desc(dev->irq)))

Driver code has absolutely no business to access irq_desc.

> +			goto config_release;
> +		unmask_irq(desc);

Or to invoke any internal function.

> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -439,6 +439,7 @@ void unmask_irq(struct irq_desc *desc)
>  		irq_state_clr_masked(desc);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(unmask_irq);

Not going to happen.

> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -380,7 +380,7 @@ struct irq_desc *irq_to_desc(unsigned int irq)
>  {
>  	return mtree_load(&sparse_irqs, irq);
>  }
> -#ifdef CONFIG_KVM_BOOK3S_64_HV_MODULE
> +#if defined CONFIG_KVM_BOOK3S_64_HV_MODULE || defined CONFIG_XEN_PVH

Neither that.

This all smells badly like a XEN internal issue and we are not going to
hack around it by exposing interrupt internals.

Thanks,

        tglx

