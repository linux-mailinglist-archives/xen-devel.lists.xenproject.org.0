Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655866C7E3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478860.742316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSSA-0008Fi-Vx; Mon, 16 Jan 2023 16:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478860.742316; Mon, 16 Jan 2023 16:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSSA-0008Cw-Sl; Mon, 16 Jan 2023 16:35:22 +0000
Received: by outflank-mailman (input) for mailman id 478860;
 Mon, 16 Jan 2023 16:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHax=5N=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pHSS9-0008Cp-Ih
 for xen-devel@lists.xen.org; Mon, 16 Jan 2023 16:35:21 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2dbec27-95bb-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 17:35:19 +0100 (CET)
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
X-Inumbo-ID: c2dbec27-95bb-11ed-91b6-6bf2151ebd3b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673886917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5aBMbxFAFIdStpWd8PjTw92BwcyzNQZ6KDghf5lWME=;
	b=WcOzXIZhvSGHI4kvKmeXfaaJdxjdle5MVf1vpbxI/AmUPipq+r7qwkITTv//VM9mg2PMc7
	LJyptKIS3yd4uD1y6XgEyOBdnZINhLk4pwbRiAJcb7tXuvov9dJEQxirB+Wi2tCA8f1eIa
	h2cO72zuZ79rBMwZaKUf4/SNsPtLgaWlTBOzrBSUW7ykALM+MBfG/QKRYEG1fzOv6vMTSa
	yJY53J3efC7hTx+lqxx5IvHLGh81f78i2M2JK9nKssO6CgT8pgnSPs0ravGlqLQ+uozKD7
	9S28aL/s/ATwBDcokK0dTbo+ezQyz5JBswbnBs3R4ZIqdf2rLtC9muKIMPPjcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673886917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5aBMbxFAFIdStpWd8PjTw92BwcyzNQZ6KDghf5lWME=;
	b=9t2m2hJfCfUhEd3ewF1n6zPM2zYK0sf7ZNxJnZ3SeXx+vQAZEnM9dxnpLeYBFOWDXJwYSF
	lbgkBHygutn1QsAw==
To: David Woodhouse <dwmw2@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xen.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc
 Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe
 <logang@deltatee.com>, Ashok Raj <ashok.raj@intel.com>, Jon Mason
 <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>
Subject: Re: [patch V3 16/22] genirq/msi: Provide new domain id based
 interfaces for freeing interrupts
In-Reply-To: <1901d84f8f999ac6b2f067360f098828cb8c17cf.camel@infradead.org>
References: <20221124225331.464480443@linutronix.de>
 <20221124230314.337844751@linutronix.de>
 <1901d84f8f999ac6b2f067360f098828cb8c17cf.camel@infradead.org>
Date: Mon, 16 Jan 2023 17:35:16 +0100
Message-ID: <875yd6o2t7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David!

On Mon, Jan 16 2023 at 09:56, David Woodhouse wrote:
> On Fri, 2022-11-25 at 00:24 +0100, Thomas Gleixner wrote:
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ops->domain_free_irqs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ops->domain_free_irqs(domain, dev);
>
> Do you want a call to msi_free_dev_descs(dev) here? In the case where
> the core code calls ops->domain_alloc_irqs() it *has* allocated the
> descriptors first... but it's expecting the irqdomain to free them?

No. Let me stare at it.

> However, it's not quite as simple as adding msi_free_dev_descs()...

Correct.

> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index 955267bbc2be..812e1ec1a633 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1533,9 +1533,10 @@ static void msi_domain_free_locked(struct device *=
dev, struct msi_ctrl *ctrl)
>  	info =3D domain->host_data;
>  	ops =3D info->ops;
>=20=20
> -	if (ops->domain_free_irqs)
> +	if (ops->domain_free_irqs) {
>  		ops->domain_free_irqs(domain, dev);
> -	else
> +		msi_free_msi_descs(dev);

This is just wrong. I need to taxi my grandson. Will have a look
afterwards.

Thanks,

        tglx

