Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAB944A0A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769584.1180474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTdy-0004Md-5J; Thu, 01 Aug 2024 11:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769584.1180474; Thu, 01 Aug 2024 11:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTdy-0004KQ-2U; Thu, 01 Aug 2024 11:06:50 +0000
Received: by outflank-mailman (input) for mailman id 769584;
 Thu, 01 Aug 2024 11:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZTdx-0004El-9Z
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:06:49 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 246989f5-4ff6-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 13:06:47 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-44fe106616eso36952511cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:06:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8413194sm67802861cf.86.2024.08.01.04.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 04:06:45 -0700 (PDT)
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
X-Inumbo-ID: 246989f5-4ff6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722510406; x=1723115206; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgzb+TZ9Po27HM+BnMzUWmZDEDD/y3UpKctRfE6X46E=;
        b=rDzl0IBXBX9YdeYRtoyZOXQn7LYNb5JySoE2TRQlldHEoy4Ogqhk4iSvXkOBpQ4gPt
         7IVncs3IY8PceYJjfCT+hDVzWT8TlRrMYMmOHP9jSfWZLTvFjhnG34RnfrftKZRtXq/W
         Wdy5DEVunNnE4el0qdUfWwV+aBHekLQwR7MWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510406; x=1723115206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgzb+TZ9Po27HM+BnMzUWmZDEDD/y3UpKctRfE6X46E=;
        b=IvouzHRjKe7MH/14iR4u6dvnR+l35bSX0q7U+3hXf03pORpa3HzfBZ4Bo4ieN5knoy
         CBzTf4R1fZsbNYJmVUx5gOS9Yg+RFaBlOnOgoxfTeMjhZNIKb9qsoXYk/ngXE4qILxp6
         0sWxKPl2smOazqpZvvafx/3Ipak7tmDYgJe5EelhnOXmj1xdNlJD4yLH77hWJXZIDWm4
         ezv8jHCu5VO0JkTpuE8c5d3S0uvdvaiMI2yAdMmuWCi8kKlUE4dva7666OUOcJMBvhOl
         BDNrpewL0xVibzlQ7duZ8aaGpYgw2TeHuu7XvvHzUj3ykuB46TQcjXr0aumOjOqagjPi
         s8aA==
X-Gm-Message-State: AOJu0YwvnUsOET1JaG0Mca2w8L+3x/wl3c36weaNej9SMRiMlPsW5BkJ
	4UUH7e4ZbJzBL7Tc4pU8sr0gxG9BUJS4+9eTq3BLQpqYJTiAMY2rErXmH0cKBIU=
X-Google-Smtp-Source: AGHT+IH85pGQTbTArrDdVy66lv03MA+OqIanZkWK7tzAg9o4v6DqNGczKOi/yaPDY8CCcvhJs1+8YQ==
X-Received: by 2002:ac8:7d47:0:b0:44f:f7be:4d3e with SMTP id d75a77b69052e-4514f9bd62bmr23416611cf.5.1722510405543;
        Thu, 01 Aug 2024 04:06:45 -0700 (PDT)
Date: Thu, 1 Aug 2024 13:06:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <ZqtsQwZNyFzflDQt@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240708114124.407797-5-Jiqian.Chen@amd.com>

On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
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
                       ^ missing space, and s/translate/translated/

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

FWIW, I don't see the GSI -> IRQ translation much different from the
pIRQ -> IRQ translation done by pirq_access_permitted(), which is also
ahead of the xsm check.

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
                              ^ unneeded parentheses and spaces.
> +            goto gsi_permission_out;
> +        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
> +            if ( domctl->u.gsi_permission.pad[i] )
> +                goto gsi_permission_out;
> +
> +        if ( gsi > highest_gsi() || (irq = gsi_2_irq(gsi)) <= 0 )

FWIW, I would place the gsi > highest_gsi() check inside gsi_2_irq().
There's no reason to open-code it here, and it could help other
users of gsi_2_irq().  The error code could also be ERANGE here
instead of EINVAL IMO.

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

Why do you need a label when it just contains a break?  Instead of the
goto gsi_permission_out just use break directly.

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

unsigned int for gsi.

> +{
> +    int ioapic, pin, irq;

pin would better be unsigned int also.

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

If you are changing this, you might as well make the gsi parameter
unsigned int.

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

IMO this would be better named GRANT or similar, maybe something like:

/* Low bit used to signal grant/revoke action. */
#define XEN_DOMCTL_GSI_REVOKE 0
#define XEN_DOMCTL_GSI_GRANT  1

> +    uint8_t access_flag;    /* flag to specify enable/disable of x86 gsi access */
> +    uint8_t pad[3];

We might as well declare the flags field as uint32_t and avoid the
padding field.

Thanks, Roger.

