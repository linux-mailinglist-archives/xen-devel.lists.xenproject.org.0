Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB89766BC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797265.1207172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soh9h-0005UC-6Q; Thu, 12 Sep 2024 10:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797265.1207172; Thu, 12 Sep 2024 10:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soh9h-0005Sg-2Y; Thu, 12 Sep 2024 10:34:29 +0000
Received: by outflank-mailman (input) for mailman id 797265;
 Thu, 12 Sep 2024 10:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwC5=QK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1soh9f-0005Sa-SS
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:34:27 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 941a6d41-70f2-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:34:25 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1726137252482211.4187017535096;
 Thu, 12 Sep 2024 03:34:12 -0700 (PDT)
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
X-Inumbo-ID: 941a6d41-70f2-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1726137255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V00ygqaliTdZslMoZMmSJvOb/9PKLXbZX3QQn2Lw1cy9pqoaWGknnHaw1RVvU1cHOXgDVe7YdVdusuo+8FDKkuCAL4DF0F2ZboF7w9s4ltr9LbrDWb0bJzFTUGQ6IKc+kyXP2hhqvatZSK1T4JnTnoZbiXRPUuOorBE+dmFj1+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726137255; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YF74UEe0QKvB38pwNJSN8S7QGqXe3eYlcPoqg8pVcQg=; 
	b=THFgFS6mczY/iUWpcTQKB3JQQhF1+6qRSp/amnnIdU4RUBH8PCZvCOZAJ1RkMPmB+zwfemwWBAscCzfELu1H44qGcBW5rK6ZdbN4dPu5fjgVRIcz0KYyIeP7G5J+2+7yO8Q7gMSr6lrUavW6bGRXcPbeEdmxQZMqsCES8NKe/lo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726137255;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YF74UEe0QKvB38pwNJSN8S7QGqXe3eYlcPoqg8pVcQg=;
	b=hhPvjfGD52R76gYR92nUQZtyxsarBDZL+8sGbKnNG/7aQWcj9EL1Pu2zZ5LutwQB
	i9AL6yah3XWbkWaBOQpWGYDSLr4FbyKOkJyeVbVlz2vQE/RqZ8XrerAPKTnElJzq0SH
	wxDCoZKAlsvELsPnu6kcQbIN1HeX8HiiQHo+T3ds=
Message-ID: <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
Date: Thu, 12 Sep 2024 06:34:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Huang Rui <ray.huang@amd.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-3-Jiqian.Chen@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20240911065832.1591273-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Greetings!

On 9/11/24 02:58, Jiqian Chen wrote:
> Some domains are not aware of the pIRQ abstraction layer that maps
> interrupt sources into Xen space interrupt numbers.  pIRQs values are
> only exposed to domains that have the option to route physical
> interrupts over event channels.
> 
> This creates issues for PCI-passthrough from a PVH domain, as some of
> the passthrough related hypercalls use pIRQ as references to physical
> interrupts on the system.  One of such interfaces is
> XEN_DOMCTL_irq_permission, used to grant or revoke access to
> interrupts, takes a pIRQ as the reference to the interrupt to be
> adjusted.
> 
> Since PVH doesn't manage interrupts in terms of pIRQs, introduce a new
> hypercall that allows setting interrupt permissions based on GSI value
> rather than pIRQ.
> 
> Note the GSI hypercall parameters is translated to an IRQ value (in
> case there are ACPI overrides) before doing the checks.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> CC: Daniel P . Smith <dpsmith@apertussolutions.com>
> Remaining comment @Daniel P . Smith:
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
> +            break;
> Is it okay to issue the XSM check using the translated value(irq),
> not the one(gsi) that was originally passed into the hypercall?

I don't see why this should be an issue. What is important is that 
labeling and access checks are in alignment. To my knowledge, it is 
expected that GSI are evaluated to their IRQ for determining the 
appropriate label.

I have one code style comment below, but beyond that:

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> ---
> v13->v15 changes:
> Change to use the commit message wrote by Roger.
> Change the code comment from "Check all bits are zero except lowest bit" to "Check only valid bits are set".
> Change the end return sentence of gsi_2_irq to "return irq ?: -EINVAL;" to preserve the error code from apic_pin_2_gsi_irq().
> 
> v12->v13 changes:
> For struct xen_domctl_gsi_permission, rename "access_flag" to "flags", change its type from uint8_t to uint32_t, delete "pad", add XEN_DOMCTL_GSI_REVOKE and XEN_DOMCTL_GSI_GRANT macros.
> Move "gsi > highest_gsi()" into function gsi_2_irq.
> Modify parameter gsi in function gsi_2_irq and mp_find_ioapic to unsigned int type.
> Delete unnecessary spaces and brackets around "~XEN_DOMCTL_GSI_ACTION_MASK".
> Delete unnecessary goto statements and change to direct break.
> Add description in commit message to explain how gsi to irq isconverted.
> 
> v11->v12 changes:
> Change nr_irqs_gsi to highest_gsi() to check gsi boundary, then need to remove "__init" of highest_gsi function.
> Change the check of irq boundary from <0 to <=0, and remove unnecessary space.
> Add #define XEN_DOMCTL_GSI_PERMISSION_MASK 1 to get lowest bit.
> 
> v10->v11 changes:
> Extracted from patch#5 of v10 into a separate patch.
> Add non-zero judgment for other bits of allow_access.
> Delete unnecessary judgment "if ( is_pv_domain(currd) || has_pirq(currd) )".
> Change the error exit path identifier "out" to "gsi_permission_out".
> Use ARRAY_SIZE() instead of open coed.
> 
> v9->v10 changes:
> Modified the commit message to further describe the purpose of adding XEN_DOMCTL_gsi_permission.
> Added a check for all zeros in the padding field in XEN_DOMCTL_gsi_permission, and used currd instead of current->domain.
> In the function gsi_2_irq, apic_pin_2_gsi_irq was used instead of the original new code, and error handling for irq0 was added.
> Deleted the extra spaces in the upper and lower lines of the struct xen_domctl_gsi_permission definition.
> 
> v8->v9 changes:
> Change the commit message to describe more why we need this new hypercall.
> Add comment above "if ( is_pv_domain(current->domain) || has_pirq(current->domain) )" to explain why we need this check.
> Add gsi_2_irq to transform gsi to irq, instead of considering gsi == irq.
> Add explicit padding to struct xen_domctl_gsi_permission.
> 
> v5->v8 changes:
> Nothing.
> 
> v4->v5 changes:
> New implementation to add new hypercall XEN_DOMCTL_gsi_permission to grant gsi.
> ---
>   xen/arch/x86/domctl.c              | 29 +++++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/io_apic.h |  2 ++
>   xen/arch/x86/io_apic.c             | 19 +++++++++++++++++++
>   xen/arch/x86/mpparse.c             |  7 +++----
>   xen/include/public/domctl.h        | 10 ++++++++++
>   xen/xsm/flask/hooks.c              |  1 +
>   6 files changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 68b5b46d1a83..939b1de0ee59 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -36,6 +36,7 @@
>   #include <asm/xstate.h>
>   #include <asm/psr.h>
>   #include <asm/cpu-policy.h>
> +#include <asm/io_apic.h>
>   
>   static int update_domain_cpu_policy(struct domain *d,
>                                       xen_domctl_cpu_policy_t *xdpc)
> @@ -237,6 +238,34 @@ long arch_do_domctl(
>           break;
>       }
>   
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        int irq;
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        uint32_t flags = domctl->u.gsi_permission.flags;
> +
> +        /* Check only valid bits are set */
> +        ret = -EINVAL;
> +        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
> +            break;
> +
> +        ret = irq = gsi_2_irq(gsi);

I was recently informed that a = b = c; form is not MISRA compliant. 
Since you just overwrite ret after the check, why not drop the 
assignment to ret and mae the next check against irq instead.

> +        if ( ret <= 0 )
> +            break;
> +
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
> +            break;
> +
> +        if ( flags )
> +            ret = irq_permit_access(d, irq);
> +        else
> +            ret = irq_deny_access(d, irq);
> +
> +        break;
> +    }
> +
>       case XEN_DOMCTL_getpageframeinfo3:
>       {
>           unsigned int num = domctl->u.getpageframeinfo3.num;
> diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
> index 78268ea8f666..62456806c7af 100644
> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -213,5 +213,7 @@ unsigned highest_gsi(void);
>   
>   int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
>   int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
> +int mp_find_ioapic(unsigned int gsi);
> +int gsi_2_irq(unsigned int gsi);
>   
>   #endif
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 772700584639..e40d2f7dbd75 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -955,6 +955,25 @@ static int pin_2_irq(int idx, int apic, int pin)
>       return irq;
>   }
>   
> +int gsi_2_irq(unsigned int gsi)
> +{
> +    int ioapic, irq;
> +    unsigned int pin;
> +
> +    if ( gsi > highest_gsi() )
> +        return -ERANGE;
> +
> +    ioapic = mp_find_ioapic(gsi);
> +    if ( ioapic < 0 )
> +        return -EINVAL;
> +
> +    pin = gsi - io_apic_gsi_base(ioapic);
> +
> +    irq = apic_pin_2_gsi_irq(ioapic, pin);
> +
> +    return irq ?: -EINVAL;
> +}
> +
>   static inline int IO_APIC_irq_trigger(int irq)
>   {
>       int apic, idx, pin;
> diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
> index 306d8ed97a83..e13b83bbe9dd 100644
> --- a/xen/arch/x86/mpparse.c
> +++ b/xen/arch/x86/mpparse.c
> @@ -842,8 +842,7 @@ static struct mp_ioapic_routing {
>   } mp_ioapic_routing[MAX_IO_APICS];
>   
>   
> -static int mp_find_ioapic (
> -	int			gsi)
> +int mp_find_ioapic(unsigned int gsi)
>   {
>   	unsigned int		i;
>   
> @@ -854,7 +853,7 @@ static int mp_find_ioapic (
>   			return i;
>   	}
>   
> -	printk(KERN_ERR "ERROR: Unable to locate IOAPIC for GSI %d\n", gsi);
> +	printk(KERN_ERR "ERROR: Unable to locate IOAPIC for GSI %u\n", gsi);
>   
>   	return -1;
>   }
> @@ -915,7 +914,7 @@ void __init mp_register_ioapic (
>   	return;
>   }
>   
> -unsigned __init highest_gsi(void)
> +unsigned highest_gsi(void)
>   {
>   	unsigned x, res = 0;
>   	for (x = 0; x < nr_ioapics; x++)
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 2a49fe46ce25..e1028fc524cf 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -464,6 +464,14 @@ struct xen_domctl_irq_permission {
>       uint8_t pad[3];
>   };
>   
> +/* XEN_DOMCTL_gsi_permission */
> +struct xen_domctl_gsi_permission {
> +    uint32_t gsi;
> +#define XEN_DOMCTL_GSI_REVOKE      0
> +#define XEN_DOMCTL_GSI_GRANT       1
> +#define XEN_DOMCTL_GSI_ACTION_MASK 1
> +    uint32_t flags;
> +};
>   
>   /* XEN_DOMCTL_iomem_permission */
>   struct xen_domctl_iomem_permission {
> @@ -1306,6 +1314,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_get_paging_mempool_size       85
>   #define XEN_DOMCTL_set_paging_mempool_size       86
>   #define XEN_DOMCTL_dt_overlay                    87
> +#define XEN_DOMCTL_gsi_permission                88
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1328,6 +1337,7 @@ struct xen_domctl {
>           struct xen_domctl_setdomainhandle   setdomainhandle;
>           struct xen_domctl_setdebugging      setdebugging;
>           struct xen_domctl_irq_permission    irq_permission;
> +        struct xen_domctl_gsi_permission    gsi_permission;
>           struct xen_domctl_iomem_permission  iomem_permission;
>           struct xen_domctl_ioport_permission ioport_permission;
>           struct xen_domctl_hypercall_init    hypercall_init;
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 278ad38c2af3..dfa23738cd8a 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -695,6 +695,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
>       case XEN_DOMCTL_shadow_op:
>       case XEN_DOMCTL_ioport_permission:
>       case XEN_DOMCTL_ioport_mapping:
> +    case XEN_DOMCTL_gsi_permission:
>   #endif
>   #ifdef CONFIG_HAS_PASSTHROUGH
>       /*

