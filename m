Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151FB97A9C3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 01:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799760.1209770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLSc-0000iH-Sq; Mon, 16 Sep 2024 23:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799760.1209770; Mon, 16 Sep 2024 23:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqLSc-0000fk-QB; Mon, 16 Sep 2024 23:48:50 +0000
Received: by outflank-mailman (input) for mailman id 799760;
 Mon, 16 Sep 2024 23:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqLSb-0000TP-6E
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 23:48:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 374e3bb8-7486-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 01:48:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CD885C2DAE;
 Mon, 16 Sep 2024 23:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E61C4CEC4;
 Mon, 16 Sep 2024 23:48:45 +0000 (UTC)
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
X-Inumbo-ID: 374e3bb8-7486-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726530526;
	bh=XyAe+H4z6/oaTcsJNFRVYs80s5u8wMYSBLvm3nLc+E0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sX8pRVVtbMlpDqxfqDy6ahs0y189+0/SrJw9c9IJ1lGCqWQSG1eo4w8budveszqNh
	 90r4BzGgJ7+DCPIsycZX/4eLF2jT206ojT+AIuqmQbTahLK0aeoRwejZ/mRSY9hKXE
	 J4dbgUeLhyVLRDHfC+3Zn/m0UXf3GZyNl3k9RU4zMU8VA91hsQqyEGZ7GlDwcjZD5k
	 Jj5f/WCWAeWEurRcskvT0beHvH7/YWYr4gMy/2nZ8WFyvl9O97un1hpQ4/gBD1xDOB
	 1pxzsJhTiF7cHVY1KEJ5DamhzRbidefrEalcGUHyANB1SRlzvdH8usmnZz67ys+pEL
	 6ruRu5g6C4Prw==
Date: Mon, 16 Sep 2024 16:48:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/4] hw/xen: xenpvh: Add pci-intx-irq-base property
In-Reply-To: <20240916150853.1216703-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409161648370.1417852@ubuntu-linux-20-04-desktop>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com> <20240916150853.1216703-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  hw/xen/xen-pvh-common.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 76a9b2b945..218ac851cf 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -218,6 +218,11 @@ static void xen_pvh_init(MachineState *ms)
>              error_report("pci-ecam-size only supports values 0 or 0x10000000");
>              exit(EXIT_FAILURE);
>          }
> +        if (!s->cfg.pci_intx_irq_base) {
> +            error_report("PCI enabled but pci-intx-irq-base not set");
> +            exit(EXIT_FAILURE);
> +        }
> +
>          xenpvh_gpex_init(s, xpc, sysmem);
>      }
>  
> @@ -273,6 +278,30 @@ XEN_PVH_PROP_MEMMAP(pci_ecam)
>  XEN_PVH_PROP_MEMMAP(pci_mmio)
>  XEN_PVH_PROP_MEMMAP(pci_mmio_high)
>  
> +static void xen_pvh_set_pci_intx_irq_base(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    xp->cfg.pci_intx_irq_base = value;
> +}
> +
> +static void xen_pvh_get_pci_intx_irq_base(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
> +    uint32_t value = xp->cfg.pci_intx_irq_base;
> +
> +    visit_type_uint32(v, name, &value, errp);
> +}
> +
>  void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
>  {
>      ObjectClass *oc = OBJECT_CLASS(xpc);
> @@ -318,6 +347,13 @@ do {                                                                      \
>          OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
>          OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
>          OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
> +
> +        object_class_property_add(oc, "pci-intx-irq-base", "uint32_t",
> +                                  xen_pvh_get_pci_intx_irq_base,
> +                                  xen_pvh_set_pci_intx_irq_base,
> +                                  NULL, NULL);
> +        object_class_property_set_description(oc, "pci-intx-irq-base",
> +                                  "Set PCI INTX interrupt base line.");
>      }
>  
>  #ifdef CONFIG_TPM
> -- 
> 2.43.0
> 

