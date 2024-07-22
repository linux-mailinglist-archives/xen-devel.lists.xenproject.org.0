Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9577939649
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 00:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762497.1172662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW1Em-0003rT-Gw; Mon, 22 Jul 2024 22:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762497.1172662; Mon, 22 Jul 2024 22:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW1Em-0003pM-Df; Mon, 22 Jul 2024 22:10:32 +0000
Received: by outflank-mailman (input) for mailman id 762497;
 Mon, 22 Jul 2024 22:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sW1Ek-0003pG-S5
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 22:10:30 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 335aee86-4877-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 00:10:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CCD30CE0B11;
 Mon, 22 Jul 2024 22:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBE9C116B1;
 Mon, 22 Jul 2024 22:10:22 +0000 (UTC)
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
X-Inumbo-ID: 335aee86-4877-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721686224;
	bh=jiBY1x0XRDdteK+1eAi0Ug1rqeicw82ku9SrGsK8GC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kZpQGqeE17HOi2FdecvHq94Wyspe0RHTL0dhZBBDqWRQdhRJEVzVTDtrFjTIHJsGn
	 hx5qwOlD1olQQoPrKgkXpoWptuI5xWafuw25Wrc69/IIlbP35vutjGe4nCDECyOBwK
	 KSd7MNuh1i2TrTEYFsyxf4WTb5Hf46aUO2otVQb2lgKoNXIucUQb1qQlRtbtb0kjog
	 HjNOEw9Hbckd+1CcNCxglC885VK0XLfUI7/fQLQt34BrF8YctgDYKaJ9SN+pmOuchI
	 ofOJhiJJdCQdDk8lIKhClOsmXmd1eJjUdBshjhHWEu1CZ+JtgEu2z6Pslt+dbVS0BY
	 s8oDldLT0fKkQ==
Date: Mon, 22 Jul 2024 15:10:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
In-Reply-To: <20240708114124.407797-5-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407221505440.4857@ubuntu-linux-20-04-desktop>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-5-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jul 2024, Jiqian Chen wrote:
> Some type of domains don't have PIRQs, like PVH, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest base on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> irq on Xen side.
> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> passing in pirq to set the access of irq, it is not suitable for
> dom0 that doesn't have PIRQs.
> 
> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
> the permission of irq(translate from x86 gsi) to dumU when dom0
> has no PIRQs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> CC: Daniel P . Smith <dpsmith@apertussolutions.com>
> Remaining comment @Daniel P . Smith:
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
> +            goto gsi_permission_out;
> Is it okay to issue the XSM check using the translated value, 
> not the one that was originally passed into the hypercall?
> ---
>  xen/arch/x86/domctl.c              | 32 ++++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/io_apic.h |  2 ++
>  xen/arch/x86/io_apic.c             | 17 ++++++++++++++++
>  xen/arch/x86/mpparse.c             |  5 ++---
>  xen/include/public/domctl.h        |  9 +++++++++
>  xen/xsm/flask/hooks.c              |  1 +
>  6 files changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 9190e11faaa3..4e9e4c4cfed3 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -36,6 +36,7 @@
>  #include <asm/xstate.h>
>  #include <asm/psr.h>
>  #include <asm/cpu-policy.h>
> +#include <asm/io_apic.h>
>  
>  static int update_domain_cpu_policy(struct domain *d,
>                                      xen_domctl_cpu_policy_t *xdpc)
> @@ -237,6 +238,37 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        int irq;
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        uint8_t access_flag = domctl->u.gsi_permission.access_flag;
> +
> +        /* Check all bits and pads are zero except lowest bit */
> +        ret = -EINVAL;
> +        if ( access_flag & ( ~XEN_DOMCTL_GSI_PERMISSION_MASK ) )
> +            goto gsi_permission_out;
> +        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
> +            if ( domctl->u.gsi_permission.pad[i] )
> +                goto gsi_permission_out;
> +
> +        if ( gsi > highest_gsi() || (irq = gsi_2_irq(gsi)) <= 0 )

gsi is unsigned int but it is passed to gsi_2_irq which takes an int as
parameter. If gsi >= INT32_MAX we have a problem. I think we should
explicitly check for the possible overflow and return error in that
case.


> +            goto gsi_permission_out;
> +
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
> +            goto gsi_permission_out;
> +
> +        if ( access_flag )
> +            ret = irq_permit_access(d, irq);
> +        else
> +            ret = irq_deny_access(d, irq);
> +
> +    gsi_permission_out:
> +        break;
> +    }
> +
>      case XEN_DOMCTL_getpageframeinfo3:
>      {
>          unsigned int num = domctl->u.getpageframeinfo3.num;
> diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
> index 78268ea8f666..7e86d8337758 100644
> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -213,5 +213,7 @@ unsigned highest_gsi(void);
>  
>  int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
>  int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
> +int mp_find_ioapic(int gsi);
> +int gsi_2_irq(int gsi);
>  
>  #endif
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index d2a313c4ac72..5968c8055671 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -955,6 +955,23 @@ static int pin_2_irq(int idx, int apic, int pin)
>      return irq;
>  }
>  
> +int gsi_2_irq(int gsi)
> +{
> +    int ioapic, pin, irq;
> +
> +    ioapic = mp_find_ioapic(gsi);
> +    if ( ioapic < 0 )
> +        return -EINVAL;
> +
> +    pin = gsi - io_apic_gsi_base(ioapic);
> +
> +    irq = apic_pin_2_gsi_irq(ioapic, pin);
> +    if ( irq <= 0 )
> +        return -EINVAL;
> +
> +    return irq;
> +}
> +
>  static inline int IO_APIC_irq_trigger(int irq)
>  {
>      int apic, idx, pin;
> diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
> index d8ccab2449c6..7786a3337760 100644
> --- a/xen/arch/x86/mpparse.c
> +++ b/xen/arch/x86/mpparse.c
> @@ -841,8 +841,7 @@ static struct mp_ioapic_routing {
>  } mp_ioapic_routing[MAX_IO_APICS];
>  
>  
> -static int mp_find_ioapic (
> -	int			gsi)
> +int mp_find_ioapic(int gsi)
>  {
>  	unsigned int		i;
>  
> @@ -914,7 +913,7 @@ void __init mp_register_ioapic (
>  	return;
>  }
>  
> -unsigned __init highest_gsi(void)
> +unsigned highest_gsi(void)
>  {
>  	unsigned x, res = 0;
>  	for (x = 0; x < nr_ioapics; x++)
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 2a49fe46ce25..877e35ab1376 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -464,6 +464,13 @@ struct xen_domctl_irq_permission {
>      uint8_t pad[3];
>  };
>  
> +/* XEN_DOMCTL_gsi_permission */
> +struct xen_domctl_gsi_permission {
> +    uint32_t gsi;
> +#define XEN_DOMCTL_GSI_PERMISSION_MASK 1
> +    uint8_t access_flag;    /* flag to specify enable/disable of x86 gsi access */
> +    uint8_t pad[3];
> +};
>  
>  /* XEN_DOMCTL_iomem_permission */
>  struct xen_domctl_iomem_permission {
> @@ -1306,6 +1313,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_get_paging_mempool_size       85
>  #define XEN_DOMCTL_set_paging_mempool_size       86
>  #define XEN_DOMCTL_dt_overlay                    87
> +#define XEN_DOMCTL_gsi_permission                88
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1328,6 +1336,7 @@ struct xen_domctl {
>          struct xen_domctl_setdomainhandle   setdomainhandle;
>          struct xen_domctl_setdebugging      setdebugging;
>          struct xen_domctl_irq_permission    irq_permission;
> +        struct xen_domctl_gsi_permission    gsi_permission;
>          struct xen_domctl_iomem_permission  iomem_permission;
>          struct xen_domctl_ioport_permission ioport_permission;
>          struct xen_domctl_hypercall_init    hypercall_init;
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 5e88c71b8e22..a5b134c91101 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -685,6 +685,7 @@ static int cf_check flask_domctl(struct domain *d, int cmd)
>      case XEN_DOMCTL_shadow_op:
>      case XEN_DOMCTL_ioport_permission:
>      case XEN_DOMCTL_ioport_mapping:
> +    case XEN_DOMCTL_gsi_permission:
>  #endif
>  #ifdef CONFIG_HAS_PASSTHROUGH
>      /*
> -- 
> 2.34.1
> 

