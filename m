Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAE7F5AB7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639452.996843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65cE-0005kX-16; Thu, 23 Nov 2023 09:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639452.996843; Thu, 23 Nov 2023 09:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65cD-0005iH-Ug; Thu, 23 Nov 2023 09:03:17 +0000
Received: by outflank-mailman (input) for mailman id 639452;
 Thu, 23 Nov 2023 09:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r65cC-0005hv-Cy
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:03:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2246dc09-89df-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 10:03:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b344101f2so3499165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 01:03:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0040b360cc65csm1280037wmq.0.2023.11.23.01.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:03:13 -0800 (PST)
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
X-Inumbo-ID: 2246dc09-89df-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700730194; x=1701334994; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dDZG0Ru8F1zXYrV7g7ilvrqlP3Zf1sj77aGL6JGCDbA=;
        b=c08pw61v1CzgAXXWoqM44HCv/dmaHNItSWSU4LGDCtNxJicnY2BA+Jd0FYb8DDBTt7
         y0J68+hUd65lRS1oj4GMMZkHCWa78mHkcf1viIi3lfcQCVR0nY4HwgtotNfnaWlxqNdy
         ws1bRexueQYvh7y2V7Ayu9hb+3iWzJCVdSrmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700730194; x=1701334994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDZG0Ru8F1zXYrV7g7ilvrqlP3Zf1sj77aGL6JGCDbA=;
        b=UTu18JaPKaRaTZxhtMWdcMxu4+j4zPT21daluEH7o4NSS+BJVnaeBMfMDe/8kcd03L
         TIlDuqdD5EDZTARZbr/kp7SglIyyUjg2ATnNZnrPnUnOvvZLr1EDFMMYA21GOT5jkueI
         BDF7tzS3qDEdTFHhzvEu/iLw/fw31FqyI3DhC9o5tJU7g2oRVZ6PIml8k6VglPpdi8eJ
         UoLJmDAjJ0cGtTylPD1kvBEfcIA7fOoycWyvRafEB+BZNxFROEqnclm+Nn7hdRaQ5ZEF
         hbFdLZp7BEFvvZOqoj6wsT9zOa0WeWZdOHM+x6vxBqk9fiCd30UjokCGplPVrSF2j877
         7gXA==
X-Gm-Message-State: AOJu0YwXdYcQqVT8c1nWUBMvJXqwVZLGUZK94J8KiR3p1Ex4L5bfjOeK
	bSwyFFHTbICSey79AGMAj8n9Bg==
X-Google-Smtp-Source: AGHT+IFJwacrcJt3bDS1qBeoRDM1XjTHQ+85W2ux5zGAY29PD28exo2RPIeO8RbvwFsMgGv131SYXQ==
X-Received: by 2002:a05:600c:3587:b0:3fe:1fd9:bedf with SMTP id p7-20020a05600c358700b003fe1fd9bedfmr1638699wmq.11.1700730193602;
        Thu, 23 Nov 2023 01:03:13 -0800 (PST)
Date: Thu, 23 Nov 2023 10:03:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
Message-ID: <ZV8VUFmNe30prv7_@macbook>
References: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122160817.15266-1-alejandro.vallejo@cloud.com>

On Wed, Nov 22, 2023 at 04:08:17PM +0000, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC ID and internally derive LDR (or the other way around)
> 
> This patch fixes the implementation so we follow the rules in the x2APIC
> spec(s) and covers migrations from broken hypervisors, so LDRs are
> preserved even for hotppluggable CPUs and across APIC resets.
> 
> While touching that area, I removed the existing printk statement in
> vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
> mode and wouldn't affect the outcome) and put another printk as an else
> branch so we get warnings trying to load nonsensical LDR values we don't
> know about.
> 
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Mostly some style nits, and one comment adjustment.

If you are OK with those:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3:
>   * Removed underscores from (x2)APIC_ID in commit message
>   * Added commit msg explaining the removal of the vlapic_load_fixup() printk
>   * Restored lowercase to hex "F"s
>   * Refactored a bit vlapic_load_fixup() so it has a trailing printk in
>     case of spotting a nonsensical LDR it doesn't understand.
>   * Moved field in domain.h with the other booleans
>   * Trimmed down field name in domain.h
>   * Trimmed down field comment in domain.h
> 
> If the field name in domain.h still seems too long I'm happy for it to be
> trimmed further down, but I do want to preserve the "_bug_" part of it.

I think the _with_ part is redundant, but it's certainly shorter than
previously :).

> ---
>  xen/arch/x86/hvm/vlapic.c             | 62 +++++++++++++++++----------
>  xen/arch/x86/include/asm/hvm/domain.h |  3 ++
>  2 files changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 5cb87f8649..cd929c3716 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
>      .write = vlapic_mmio_write,
>  };
>  
> +static uint32_t x2apic_ldr_from_id(uint32_t id)
> +{
> +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
> +}
> +
>  static void set_x2apic_id(struct vlapic *vlapic)
>  {
> -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> +    uint32_t apic_id = vcpu_id * 2;
> +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> +
> +    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */

Line length > 80 cols.

I try to avoid referencing function names in comments, as they tend to
get out of sync without noticing.  It's much easier to use cscope to
grep for x2apic_ldr_bug_with_vcpu_id and find the comment itself.

> +    if ( vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id )
> +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
>  
> -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>  }
>  
>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> @@ -1498,27 +1508,35 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>   */
>  static void lapic_load_fixup(struct vlapic *vlapic)
>  {
> -    uint32_t id = vlapic->loaded.id;
> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> +    if ( !vlapic_x2apic_mode(vlapic) ||
> +         (vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)) )
> +        return;
>  
> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> -    {
> +    if ( vlapic->loaded.ldr == 1 )
> +       /*
> +        * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC
> +        * mode got LDR = 1. We can't leave it as-is because it assigned the
> +        * same LDR to every CPU.  We'll fix fix the bug now and assign an
> +        * LDR value consistent with the APIC ID.
> +        */
> +        set_x2apic_id(vlapic);
> +    else if ( vlapic->loaded.ldr ==
> +              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
>          /*
> -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> -         * to aid in eventual debugging of issues arising from the fixup done
> -         * here, but can be dropped as soon as it is found to conflict with
> -         * other (future) changes.
> +         * This is a migration from a broken Xen between 4.4 and 4.18 and
> +         * we must _PRESERVE_ LDRs so new vCPUs use consistent derivations.

Not sure if we should try to avoid mentioning specific versions in the
comments, as I this fix will be backported to stable branches (I hope),
and hence those will no longer be affected.

> +         * This is so existing running guests that may have already read
> +         * the LDR at the source host aren't surprised when IPIs stop
> +         * working as they did at the other end. To address this, we set
> +         * this domain boolean so future CPU hotplugs derive an LDR
> +         * consistent with the older Xen's broken idea of consistency.

I think this is possibly too verbose, I would be fine with just the
first sentence TBH.  If we want the full comment however, the wording
should be slightly addressed: it's not just IPIs that would possibly
fail to be delivered, but any interrupt attempting to target the APIC
using the previous LDR addressing (either an IPI or an external
interrupt).

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
> +        vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id = true;
> +    else
> +        printk(XENLOG_G_WARNING
> +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x\n",
> +               vlapic_vcpu(vlapic), vlapic->loaded.id, vlapic->loaded.ldr);

Could you write the expected values while at it:

"%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected id=%#x ldr=%#x)\n"

>  }
>  
>  static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 6e53ce4449..2fee3874cd 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -106,6 +106,9 @@ struct hvm_domain {
>  
>      bool                   is_s3_suspended;
>  
> +    /* Compat setting for a bug in x2APIC LDR. See vlapic_load_fixup() */
> +    bool x2apic_ldr_bug_with_vcpu_id;

I think you already mentioned in a followup reply that using
bug_x2apic_ldr_vcpu_id would be fine.

Thanks, Roger.

