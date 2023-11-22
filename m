Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83077F47F3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 14:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638770.995667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5nSZ-0008D4-Os; Wed, 22 Nov 2023 13:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638770.995667; Wed, 22 Nov 2023 13:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5nSZ-0008BR-MA; Wed, 22 Nov 2023 13:40:07 +0000
Received: by outflank-mailman (input) for mailman id 638770;
 Wed, 22 Nov 2023 13:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5nSY-00081m-0C
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 13:40:06 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a443be18-893c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 14:40:04 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b344101f2so941355e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 05:40:04 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b0040b2b86c712sm2261014wms.30.2023.11.22.05.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 05:40:03 -0800 (PST)
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
X-Inumbo-ID: a443be18-893c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700660404; x=1701265204; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bi4rG5j2IbjTZ/QvvHMWXbtzgBdCRmqNjxczb6NydiI=;
        b=ObQdDdTUO4dwXV9DERkRuIx48hEGE2VyQBFERgbYxMr4X/uw1EmathckFUV433qUWJ
         95yUubFNmnZ1TrmhiXskoWa+bdho3NtUpIJEsW4oWscCKTedrbPP5icoKRTGAwm0AKJC
         KtXk+MC89Y9Da1jJZn5/g70uGyCSvE3qvjIaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660404; x=1701265204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi4rG5j2IbjTZ/QvvHMWXbtzgBdCRmqNjxczb6NydiI=;
        b=vjcnj8kSPtqOBIukMdf2yP1lVJ6iSm8/jQ2KZBWJN8TsQmkm6sEv7dqqCHs8H7y6Yb
         zUwZlHcUAQrFv5s28Z6mcqDRt8vDaCf7EOXSzZHUOXrfZi/u59jmkYxAyQNHPm6JsJxD
         ZbHFuAYNY+c8yJWWVWbGT80/G8asrjk8mhmhpA96xp8hSt+hKFGsiPNEZhF3JK92r7uu
         mmM1BAYzDQMHSL0qiT9Ls7sFMtGsl0y2JTFMCXzSlCGg84RN6pnJccYM1+jDV9mWrNcX
         ixUDPa1kQMyPRUbAiF//y1NRa+2mr3fybkfY3xyZ7YX6PDsGOvBWRXhXzEJGwx5SBYpT
         NmOA==
X-Gm-Message-State: AOJu0YzUyhMvmvYUBRdpjKmL+eyxMGrdlu8jXh7AKl+QHWsTstAkSME9
	cSlS962CXqCummDuYPBc/wLSxw==
X-Google-Smtp-Source: AGHT+IGejTdKONEyD2aOiy12H/Z3YzHOYN91hqd7rXHDa0DPXFdVf3VnIcFU47iBN30MqN9An3+Aog==
X-Received: by 2002:a05:600c:3b02:b0:40b:29e7:c150 with SMTP id m2-20020a05600c3b0200b0040b29e7c150mr2489412wms.0.1700660403682;
        Wed, 22 Nov 2023 05:40:03 -0800 (PST)
Date: Wed, 22 Nov 2023 14:40:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Message-ID: <ZV4EsjpoPThN5YME@macbook>
References: <20231121162604.19405-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231121162604.19405-1-alejandro.vallejo@cloud.com>

On Tue, Nov 21, 2023 at 04:26:04PM +0000, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC_ID and internally derive LDR (or the other way around)
> 
> This patch fixes the implementation so we follow the rules in the x2APIC
> spec(s).
> 
> The patch also covers migrations from broken hypervisors, so LDRs are
> preserved even for hotppluggable CPUs and across APIC resets.
> 
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

LGTM, just a couple of style comments.

> ---
> I tested this by creating 3 checkpoints.
>  1. One with pre-4.4 broken state (every LDR=1, by hacking save_regs)
>  2. One with 4.4 onwards broken state (LDRs packed in their clusters)
>  3. One with correct LDR values
> 
> (1) and (3) restores to the same thing. Consistent APIC_ID+LDR
> (2) restores to what it previously had and hotplugs follow the same logic
> ---
>  xen/arch/x86/hvm/vlapic.c             | 81 +++++++++++++++++++--------
>  xen/arch/x86/include/asm/hvm/domain.h | 13 +++++
>  2 files changed, 72 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index a8e87c4446..7f169f1e5f 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
>      .write = vlapic_mmio_write,
>  };
>  
> +static uint32_t x2apic_ldr_from_id(uint32_t id)
> +{
> +    return ((id & ~0xF) << 12) | (1 << (id & 0xF));

Seeing other usages in vlapic.c I think the preference is to use lower
case for hex numbers.

> +}
> +
>  static void set_x2apic_id(struct vlapic *vlapic)
>  {
> -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> +    uint32_t apic_id = vcpu_id * 2;
> +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
>  
> -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> +    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
> +    if ( vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug )
> +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
> +
> +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>  }
>  
>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> @@ -1495,30 +1505,57 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>  /*
>   * Following lapic_load_hidden()/lapic_load_regs() we may need to
>   * correct ID and LDR when they come from an old, broken hypervisor.
> + *
> + * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC mode
> + * got LDR = 1. This was fixed back then, but another bug was introduced
> + * causing APIC ID and LDR to break the consistency they are meant to have
> + * according to the specs (LDR was derived from vCPU ID, rather than APIC
> + * ID)
> + *
> + * Long story short, we can detect both cases here. For the LDR=1 case we
> + * want to fix it up on migrate, as IPIs just don't work on non-physical
> + * mode otherwise. For the other case we actually want to preserve previous
> + * behaviour so that existing running instances that may have already read
> + * the LDR at the source host aren't surprised when IPIs stop working as
> + * they did at the other end.
> + *
> + * Note that "x2apic_id == 0" has always been correct and can't be used to
> + * discriminate these cases.
> + *

I think it's best if this big comment was split between the relevant
parts of the if below used to detect the broken states, as that makes
the comments more in-place with the code.

> + * Yuck!
>   */
>  static void lapic_load_fixup(struct vlapic *vlapic)
>  {
> -    uint32_t id = vlapic->loaded.id;
> +    /*
> +     * This LDR would be present in broken versions of Xen 4.4 through 4.18.
> +     * It's correct for the cpu with x2apic_id=0 (vcpu0), but invalid for
> +     * any other.
> +     */
> +    uint32_t bad_ldr = x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id);
>  
> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> -    {
> +    /*
> +     * No need to perform fixups in non-x2apic mode, and x2apic_id == 0 has
> +     * always been correct.
> +     */
> +    if ( !vlapic_x2apic_mode(vlapic) || !vlapic->loaded.id )

You could replace the !vlapic->loaded.id check and instead use:

vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)

As that will allow returning early from the function if the LDR is
correct.  Then if none of the fixups below apply we could print a
warning message that the LDR is incorrect, but cannot be fixed up.

> +        return;
> +
> +    if ( vlapic->loaded.ldr == 1 )
> +       /*
> +        * Migration from a broken Xen 4.4 or earlier. We can't leave it
> +        * as-is because it assigned the same LDR to every CPU. We'll fix
> +        * the bug now and assign LDR values consistent with the APIC ID.
> +        */
> +        set_x2apic_id(vlapic);

Previous code also did some checks here related to APIC ID sanity,
which are now dropped?

Might be worth mentioning in the commit message, if that was intended.

> +    else if ( bad_ldr == vlapic->loaded.ldr )
>          /*
> -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> -         * to aid in eventual debugging of issues arising from the fixup done
> -         * here, but can be dropped as soon as it is found to conflict with
> -         * other (future) changes.
> +         * This is a migration from a broken Xen between 4.4 and 4.18 and we
> +         * must _PRESERVE_ LDRs so new vCPUs use consistent derivations. In
> +         * this case we set this domain boolean so future CPU hotplugs
> +         * derive an LDR consistent with the older Xen's broken idea of
> +         * consistency.
>           */
> -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
> -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
> -                   vlapic_vcpu(vlapic), id);
> -        set_x2apic_id(vlapic);
> -    }
> -    else /* Undo an eventual earlier fixup. */
> -    {
> -        vlapic_set_reg(vlapic, APIC_ID, id);
> -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
> -    }
> +        vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug = true;
>  }
>  
>  static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 6e53ce4449..a42a6e99bb 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -61,6 +61,19 @@ struct hvm_domain {
>      /* Cached CF8 for guest PCI config cycles */
>      uint32_t                pci_cf8;
>  
> +    /*
> +     * Xen had a bug between 4.4 and 4.18 by which the x2APIC LDR was
> +     * derived from the vcpu_id rather than the x2APIC ID. This is wrong,
> +     * but changing this behaviour is tricky because guests might have
> +     * already read the LDR and used it accordingly. In the interest of not
> +     * breaking migrations from those hypervisors we track here whether
> +     * this domain suffers from this or not so a hotplugged vCPU or an APIC
> +     * reset can recover the same LDR it would've had on the older host.
> +     *
> +     * Yuck!
> +     */
> +    bool has_inconsistent_x2apic_ldr_bug;

Could you place the new field after the existing boolean fields in the
struct? (AFAICT there's plenty of padding left there)

I also think the field name is too long, I would rather use
x2apic_ldr_vcpu_id for example (to note that LDR is calculated from
vCPU ID rather than APIC ID).

I think it would be good if we could trim a bit the comments, as I get
the impression it's a bit repetitive.

So I would leave the big explanation in lapic_load_fixup(), and just
comment here:

/* Compatibility setting for a bug in x2APIC LDR format. */

Thanks, Roger.

