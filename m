Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BD7F85C8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 23:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640960.999753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6eJI-0001b8-PR; Fri, 24 Nov 2023 22:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640960.999753; Fri, 24 Nov 2023 22:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6eJI-0001ZN-Mk; Fri, 24 Nov 2023 22:06:04 +0000
Received: by outflank-mailman (input) for mailman id 640960;
 Fri, 24 Nov 2023 22:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Spf=HF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6eJI-0001ZH-0a
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 22:06:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6a353b5-8b15-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 23:06:01 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b2afd049aso16213595e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 14:06:00 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0040b30be6244sm6182326wmq.24.2023.11.24.14.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 14:05:58 -0800 (PST)
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
X-Inumbo-ID: a6a353b5-8b15-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700863560; x=1701468360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pztvtz7Mem9/nCOY2LQsG6s0Hmtvkt037Gm1ogHRzQg=;
        b=ThdXlV6j8Y0i7EaaaeV4M94Xwvh4FOw0ksQtDASv4yuGxD8KtMqTyX32DSKYNaIlP3
         7FUqon7Tl5a+q8uAZzcU+P6I/tRpDRPKisN3qKx3WCmY9EnPoqAtthviNHNO7+9QujZs
         uZgMcNFJyML3chWmVKbqBky267Hyj+j1hBsSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700863560; x=1701468360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pztvtz7Mem9/nCOY2LQsG6s0Hmtvkt037Gm1ogHRzQg=;
        b=w+ZKrWvNGg6vAVUmQR1P06SBuF08gY07SJctK5VRijXOxXofboEgWfvIw72cXsygnZ
         iEQSkvvurbMjadnHMIB/pLLY8GX9acQVyS0kFz40jyLV54Dh+Hy1C5qsT2bquTnGY/SY
         Pkvetp8YlOl6sl47WQykfvwWa/s3XH1tsd6nhWRybC3EcYNq1DCk7t4mzKZP7FJIFc0L
         3sHrx4o7M1dsmNCnHFCcm0+EznT/Jkmvas+QLSeXz2ihv1ZXsD3mR+UcTKQscxVfCrS6
         8/phOmvA0Isov7V0VJfhUKaFyGp1Q6ePTNLWXfssPn4z0gh1t3dY4xA9u44ikiLsYbYW
         iA1w==
X-Gm-Message-State: AOJu0YyQluaPRYjK/Tb7jUUhm8uvAsvbB2yAOFrwIXekm7na3AeW1tFI
	6vpqe3nV4lLeKhrCJGNFTu4DfRogvcNdlyRIBww=
X-Google-Smtp-Source: AGHT+IHFf74aTLj91CRDZ4Apo7tq/ZzjoYE2w+6hlzrPvmEtJr9n0ITwf2xnO14psKQw22nsF979eA==
X-Received: by 2002:a05:600c:450b:b0:405:9666:5242 with SMTP id t11-20020a05600c450b00b0040596665242mr3705961wmo.31.1700863558968;
        Fri, 24 Nov 2023 14:05:58 -0800 (PST)
Message-ID: <e96e7f7b-d2d5-496a-9a2b-e8da2017a282@citrix.com>
Date: Fri, 24 Nov 2023 22:05:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few minor grammar notes.

"x86/vlapic: In x2APIC ..."


On 23/11/2023 5:30 pm, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
>
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC ID and internally derive LDR (or the other way around)

Missing full stop.  But I'd also phrase this explicitly as "violating
the spec", rather than "problematic".

Intel is crystal clear on the matter:

  Logical x2APIC ID = [(x2APIC ID[19:4] « 16) | (1 « x2APIC ID[3:0])]

and Xen isn't implementing this.

> This patch fixes the implementation so we follow the rules in the x2APIC
> spec(s) and covers migrations from broken hypervisors, so LDRs are
> preserved even for hotppluggable CPUs and across APIC resets.

"This patch fixes the implementation so we follow the x2APIC spec for
new VMs, while preserving the behaviour (buggy or fixed) for migrated-in
VMs."

Hotpluggable isn't relevant.  We have the state, and it's either as it
was before, or it's fixed.


>
> While touching that area, I removed the existing printk statement in
> vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
> mode and wouldn't affect the outcome) and put another printk as an else
> branch so we get warnings trying to load nonsensical LDR values we don't
> know about.
>
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> v4:
>   * Removed "See <function>()" part of comment in set_x2apic_id()
>   * Removed _with_ in field name
>   * Trimmed down comments further
>   * Rephrased the Xen versions in the comments so it's implied not every
>     Xen 4.X is affected (as they won't be after this patch is backported)
>   * Replace Xen 4.18 reference with date+4.19 dev window
> ---
>  xen/arch/x86/hvm/vlapic.c             | 66 ++++++++++++++++++---------
>  xen/arch/x86/include/asm/hvm/domain.h |  3 ++
>  2 files changed, 47 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 5cb87f8649..cd4701c5a2 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1061,13 +1061,26 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
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

const struct vcpu *v = vlapic_vcpu(vlapic);

seeing as you've got the expression used twice already.

With that, the following logic is shorter too; you can get away with
dropping the vcpu_id variable as v->vcpu_id is the more common form to
use in Xen.


> -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> +    uint32_t apic_id = vcpu_id * 2;

/* TODO: Fix topology */ as a suffix here.

Just to make it clear that we're aware that this *2 logic is faulty, but
it needs to remain like this in the short term.

> +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> +
> +    /*
> +     * Workaround for migrated domains to derive LDRs as the source host
> +     * would've.
> +     */
> +    if ( vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id )
> +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
>  
> -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>  }
>  
>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> @@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>   */
>  static void lapic_load_fixup(struct vlapic *vlapic)
>  {

Again, const struct vcpu *v = vlapic_vcpu(vlapic); here helps legibility.

> -    uint32_t id = vlapic->loaded.id;
> +    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>  
> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> -    {
> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> +    if ( !vlapic_x2apic_mode(vlapic) ||
> +         (vlapic->loaded.ldr == good_ldr) )
> +        return;
> +
> +    if ( vlapic->loaded.ldr == 1 )
> +       /*
> +        * Xen <= 4.4 may have a bug by which all the APICs configured in
> +        * x2APIC mode got LDR = 1. We can't leave it as-is because it
> +        * assigned the same LDR to every CPU.  We'll fix fix the bug now
> +        * and assign an LDR value consistent with the APIC ID.
> +        */
> +        set_x2apic_id(vlapic);
> +    else if ( vlapic->loaded.ldr ==

I know these are single statement if's, and the coding style permits
them without braces, but the comment makes it visually awkward to follow.

This is an example where braces help readability generally, but also (as
it happens) help make a more readable diff.


> +              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
>          /*
> -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> -         * to aid in eventual debugging of issues arising from the fixup done
> -         * here, but can be dropped as soon as it is found to conflict with
> -         * other (future) changes.
> +         * Migrations from Xen 4.4 to date (4.19 dev window, Nov 2023) may
> +         * show this bug.

"may have had LDR derived from the vCPU_ID, not the APIC_ID."

Better to clearly state what the bug is.

>  We must preserve LDRs so new vCPUs use consistent
> +         * derivations and existing guests, which may have already read the
> +         * LDR at the source host, aren't surprised when interrupts stop
> +         * working the way they did at the other end.
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
> +        vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
> +    else
> +        printk(XENLOG_G_WARNING
> +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected ldr=%#x)\n",

%pv: bogus loaded x2APIC ID %#x, LDR %#x, expected LDR %#x\n

If you properly capitalise x2APIC, you should capitalise ID and LDR. 
The other changes are matter of taste, but make for a less cluttered log
message IMO.


This is a long list of minor niggles, but they're all style/comment
issues, and nothing to do with the logic itself.  I'm happy to fix them
all up on commit, and here is the result with them merged:

https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=953dcb0317d20959ffee14e404595cfbb66c607a

for you to glance over.

~Andrew

