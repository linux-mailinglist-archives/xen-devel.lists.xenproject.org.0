Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A835E97A9C7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 01:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799764.1209780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLU4-0002Ax-6S; Mon, 16 Sep 2024 23:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799764.1209780; Mon, 16 Sep 2024 23:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLU4-00028D-3G; Mon, 16 Sep 2024 23:50:20 +0000
Received: by outflank-mailman (input) for mailman id 799764;
 Mon, 16 Sep 2024 23:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqLU2-00027j-S1
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 23:50:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c8510cc-7486-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 01:50:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B23245C3114;
 Mon, 16 Sep 2024 23:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154FDC4CEC4;
 Mon, 16 Sep 2024 23:50:13 +0000 (UTC)
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
X-Inumbo-ID: 6c8510cc-7486-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726530616;
	bh=EcihBU2MW+o0k8STiYL5wfgfRi+z+e3ydSW7l+a5gAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RGB2J96z0XM6/2N1YgdJL1hrET9dwWbaDhoLTvF8NJVBBzsOIyCxVhID0f9Mm7/FI
	 MDo1dFqc2ihsQb+75KauXTS95u5y7oB7kHJmJ8qMOv8nogC7ApweXU5PWRTKrTJmKE
	 azIVOi20Ms9eLdjkPk9P9apALizLi5pnnfCeq5+PgYXW9V2UT0yYWQdaRsX13sOmq1
	 KXrKpowqs+eUrVw1K5icr9oY6KsCKXROLDykw+7TaV3Aa9ntu0FHeOvv5ND1S1MtDZ
	 FgW1X7STNq2ASK9rVzamI1jlbQulGfwtsbf0dJ7EJZzgndGWQg8LL4YmVGQ9Zaewpx
	 BQmMWPto4BNxA==
Date: Mon, 16 Sep 2024 16:50:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org
Subject: Re: [PATCH v1 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
In-Reply-To: <20240916150853.1216703-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409161649590.1417852@ubuntu-linux-20-04-desktop>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com> <20240916150853.1216703-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Enable PCI support for the ARM Xen PVH machine.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen-pvh.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 28af3910ea..33f0dd5982 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -39,6 +39,16 @@ static void xen_arm_instance_init(Object *obj)
>                                           VIRTIO_MMIO_DEV_SIZE };
>  }
>  
> +static void xen_pvh_set_pci_intx_irq(void *opaque, int intx_irq, int level)
> +{
> +    XenPVHMachineState *s = XEN_PVH_MACHINE(opaque);
> +    int irq = s->cfg.pci_intx_irq_base + intx_irq;
> +
> +    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> +        error_report("xendevicemodel_set_pci_intx_level failed");
> +    }
> +}
> +
>  static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>  {
>      XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
> @@ -69,7 +79,11 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      /* Xen/ARM does not use buffered IOREQs.  */
>      xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
>  
> +    /* PCI INTX delivery.  */
> +    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
> +
>      /* List of supported features known to work on PVH ARM.  */
> +    xpc->has_pci = true;
>      xpc->has_tpm = true;
>      xpc->has_virtio_mmio = true;
>  
> -- 
> 2.43.0
> 

