Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E01971317
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794061.1202742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaUw-0002q5-9i; Mon, 09 Sep 2024 09:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794061.1202742; Mon, 09 Sep 2024 09:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaUw-0002nC-6U; Mon, 09 Sep 2024 09:15:50 +0000
Received: by outflank-mailman (input) for mailman id 794061;
 Mon, 09 Sep 2024 09:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snaUu-0002n4-Hk
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:15:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 196f5f80-6e8c-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 11:15:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso3997578a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:15:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea395sm315211366b.144.2024.09.09.02.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 02:15:45 -0700 (PDT)
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
X-Inumbo-ID: 196f5f80-6e8c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725873347; x=1726478147; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TnFV/hILzgcFHHmufz4f8KxzWlnoYr6W/V2jrLq15dU=;
        b=r9xvRBwxRPW8K8gVpw4jOHXxFxN+nW0BTrPdVk6EM6n7IIf0dsF1HlwiXyRvItCw/s
         AdTGg5968NrfeN+uLrUE3N0MYfJnUI149erJCVSDVAUMKbfTuKLNmD9WthK7XYMgdTuP
         s69doDwhC0IUkaNtmZh4aPB3pt5VZx9mlhblI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725873347; x=1726478147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnFV/hILzgcFHHmufz4f8KxzWlnoYr6W/V2jrLq15dU=;
        b=iZWjcX4o3+Z6RpBzvYhLS7ZXmko5UUrb3WAwAP+AWCV475CIxoXEdSisQmsijRWe/k
         lRO4WEvE7jPUQhrHnT/7FhtCCHo4Yy5HJeGycV62IZeqvGa/48N69/s8hF2Y9HMSJi9G
         h/RlsRyu2nA3snwrKIhmVe2W96Vus1fd3VEXb6zUeBxXwpYmzyhRSOMf9D3NoSKGgqGj
         SpNs+KDfs2f25eqIStgRWpG5sBy+9LQ/AhAuJCz+EGlWQyG8eqNZe4o77NCYMruQ0EO/
         S7tR+Cj6mqKsk/7gRnTvBmVDA0QuubmywxiHo1U3fYqr8+aZZotQjQcknKdJY80owrC/
         9sdg==
X-Gm-Message-State: AOJu0YyX2UmrjbkAAGYQlpCNV5KY7owC3/0y3rKDArwOnQ+UGSas8GYw
	UMsZUMoKzpG6+Y9hDkmcyZT5eNuwSoyUDrXr2ksypi15RCLj8FTcCZfCuc9ZfsQ=
X-Google-Smtp-Source: AGHT+IHKbkNR9IvIVUFlgKK6JM3CG7Nlw17ZV2bE2UlUxFCknNuKRKtlkXOA9LCDg995YBVHYX8Z7w==
X-Received: by 2002:a17:907:1c1f:b0:a8d:4e26:c9b9 with SMTP id a640c23a62f3a-a8d4e26ca94mr256886566b.17.1725873345881;
        Mon, 09 Sep 2024 02:15:45 -0700 (PDT)
Date: Mon, 9 Sep 2024 11:15:44 +0200
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
Subject: Re: [XEN PATCH v14 3/5] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <Zt68wCp4nADYJVvu@macbook.local>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903070424.982218-4-Jiqian.Chen@amd.com>

On Tue, Sep 03, 2024 at 03:04:22PM +0800, Jiqian Chen wrote:
> Some type of domains don't have PIRQs, like PVH, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest base on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> irq on Xen side.
> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> passing in pirq to set the access of irq, it is not suitable for
> dom0 that doesn't have PIRQs.

I think the above commit message is a bit confusing, I would rather
write it as:

x86/irq: allow setting IRQ permissions from GSI instead of pIRQ

Some domains are not aware of the pIRQ abstraction layer that maps
interrupt sources into Xen space interrupt numbers.  pIRQs values are
only exposed to domains that have the option to route physical
interrupts over event channels.

This creates issues for PCI-passthrough from a PVH domain, as some of
the passthrough related hypercalls use pIRQ as references to physical
interrupts on the system.  One of such interfaces is
XEN_DOMCTL_irq_permission, used to grant or revoke access to
interrupts, takes a pIRQ as the reference to the interrupt to be
adjusted.

Since PVH doesn't manage interrupts in terms of pIRQs, introduce a new
hypercall that allows setting interrupt permissions based on GSI value
rather than pIRQ.

Note the GSI hypercall parameters is translated to an IRQ value (in
case there are ACPI overrides) before doing the checks.

> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/revoke
> the permission of irq (translated from x86 gsi) to dumU when dom0
> has no PIRQs.
> 
> Regarding the translation from gsi to irq, it is that if there are
> ACPI overrides entries then get translation from them, if not gsi
> are identity mapped into irq.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> CC: Daniel P . Smith <dpsmith@apertussolutions.com>
> Remaining unsolved comment @Daniel P . Smith:
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
> +            break;
> Is it okay to issue the XSM check using the translated value(irq),
> not the one(gsi) that was originally passed into the hypercall?
> ---
> v13->v14 changes:
> No.
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
>  xen/arch/x86/domctl.c              | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/io_apic.h |  2 ++
>  xen/arch/x86/io_apic.c             | 21 +++++++++++++++++++++
>  xen/arch/x86/mpparse.c             |  7 +++----
>  xen/include/public/domctl.h        | 10 ++++++++++
>  xen/xsm/flask/hooks.c              |  1 +
>  6 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 68b5b46d1a83..60b5578c47f8 100644
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
> @@ -237,6 +238,34 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        int irq;
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        uint32_t flags = domctl->u.gsi_permission.flags;
> +
> +        /* Check all bits are zero except lowest bit */

Nit: I would instead use: "Check only valid bits are set" in order to
avoid the comment going stale if more bits are used in the flags
field.

> +        ret = -EINVAL;
> +        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
> +            break;
> +
> +        ret = irq = gsi_2_irq(gsi);
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
>      case XEN_DOMCTL_getpageframeinfo3:
>      {
>          unsigned int num = domctl->u.getpageframeinfo3.num;
> diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
> index 78268ea8f666..62456806c7af 100644
> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -213,5 +213,7 @@ unsigned highest_gsi(void);
>  
>  int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
>  int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
> +int mp_find_ioapic(unsigned int gsi);
> +int gsi_2_irq(unsigned int gsi);
>  
>  #endif
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 772700584639..5859484875cc 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -955,6 +955,27 @@ static int pin_2_irq(int idx, int apic, int pin)
>      return irq;
>  }
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
> +    if ( irq <= 0 )
> +        return -EINVAL;
> +
> +    return irq;

I think you could simplify this as:

return irq ?: -EINVAL;

So that the error code is possibly preserved from
apic_pin_2_gsi_irq(), or otherwise -EINVAL is returned if irq == 0.

pin_2_irq() is IMO broken in returning irq == 0 when the bus is
unknown, as irq == 0 is a valid irq, but let's not get into that here.

Thanks, Roger.

