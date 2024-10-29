Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEE9B53AC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 21:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827871.1242626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5srx-0008Jd-EI; Tue, 29 Oct 2024 20:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827871.1242626; Tue, 29 Oct 2024 20:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5srx-0008H1-BU; Tue, 29 Oct 2024 20:31:13 +0000
Received: by outflank-mailman (input) for mailman id 827871;
 Tue, 29 Oct 2024 20:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5srw-0008Gv-3o
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 20:31:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65fbf13-9634-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 21:31:01 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso742984366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 13:31:01 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm503715066b.191.2024.10.29.13.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 13:31:00 -0700 (PDT)
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
X-Inumbo-ID: b65fbf13-9634-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2NWZiZjEzLTk2MzQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjMzODYxLjY0Njk0Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730233861; x=1730838661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XVVUJIm/r84iGitm46QUO5gyEZksBfEP/2zhvi4ATT8=;
        b=GRT94EcMdbPq0g6Mmir/awvwA5ATQovpJ2Y2u+gEU1SGiQF3T4Q/0jbeB1DHM4yCBd
         Lka3P5FD0uF/h7/h5QRIaxpe+EyKvVGH2ablAIYj6faTK8hEYwyCbnu//A7/mLRohxCj
         n8V7LJBhX9V4anYkYgPRgpVd533sKGTG8biy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233861; x=1730838661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVVUJIm/r84iGitm46QUO5gyEZksBfEP/2zhvi4ATT8=;
        b=O0mqkWg58Mwdg78GPwjgOCybyJhRDpmq2sh3JnSSbdSo/GAQQoiSwjTDmHOtT1E2ej
         ky8QkXnjsfQXpGLOCy8QdI8foKa906z5ngINLZvwpw83zZwBvAaQQX+wY4rkYo5Xvqq/
         Ujp5vMumhRSqANsOEA+fLGKGBLdtDD7p0f6tvEZyEKtZTAY6qGcAIKNH6r9nWDkyiai4
         6JHPinygOKP7D3VmD+116QTi0bocSq/HEcoPzQpuaymPcR65esZ2VI9Ppu87UbdG2PMo
         Z3Qf35yiS4FUyashIxkBPSSEpuoueULupzKSnHU+lez9UvNu3SQ9uW/UMS69uoUe/B9z
         b9nA==
X-Forwarded-Encrypted: i=1; AJvYcCVnAmgpbewtefEa7uJR4j3n0ajgWupz2m28cQZnxjH29cJ39WMrkHQaz6o+ZZ/JiZZJlbESqstnHbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmTRD8XMUrJedNNhu+O9xLe4IHh/H3sRtIzPLYVc0lrW/JeoWg
	RgHGkTw/N07bMl7cRPo3c95sQa+tjl9STpII+EuY6rA0+batLUofidd8bajl2rA=
X-Google-Smtp-Source: AGHT+IErAEG8BG93nr3pNuAXhzCCSgpHsOq5KkzqeOCMNavjFSlSwesnPZzQ3A1ETBiSo6shfwOEYA==
X-Received: by 2002:a17:907:e8d:b0:a9a:55dd:bc23 with SMTP id a640c23a62f3a-a9de5d6f205mr1306648766b.8.1730233860714;
        Tue, 29 Oct 2024 13:31:00 -0700 (PDT)
Message-ID: <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>
Date: Tue, 29 Oct 2024 20:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-3-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021154600.11745-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> This allows the initial x2APIC ID to be sent on the migration stream.
> This allows further changes to topology and APIC ID assignment without
> breaking existing hosts. Given the vlapic data is zero-extended on
> restore, fix up migrations from hosts without the field by setting it to
> the old convention if zero.
>
> The hardcoded mapping x2apic_id=2*vcpu_id is kept for the time being,
> but it's meant to be overriden by toolstack on a later patch with
> appropriate values.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

I'm going to request some changes, but I think they're only comment
changes. [edit, no sadly, one non-comment change.]

It's unfortunate that Xen uses an instance of hvm_hw_lapic for it's
internal state, but one swamp at a time.


In the subject, there's no such thing as the "initial" x2APIC ID. 
There's just "the x2APIC ID" and it's not mutable state as far as the
guest is concerned  (This is different to the xAPIC id, where there is
an architectural concept of the initial xAPIC ID, from the days when
OSes were permitted to edit it).  Also, it's x86/hvm, seeing as this is
an HVM specific change you're making.

Next, while it's true that this allows the value to move in the
migration stream, the more important point is that this allows the
toolstack to configure the x2APIC ID for each vCPU.

So, for the commit message, I recommend:

---%<---
Today, Xen hard-codes x2APIC_ID = vcpu_id * 2, but this is unwise and
interferes with providing accurate topology information to the guest.

Introduce a new x2apic_id field into hvm_hw_lapic.  This is immutable
state from the guest's point of view, but it allows the toolstack to
configure the value, and for the value to move on migrate.

For backwards compatibility, we treat incoming zeroes as if they were
the old hardcoded scheme.
---%<---

> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 2a777436ee27..e2489ff8e346 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -138,10 +138,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          const struct cpu_user_regs *regs;
>  
>      case 0x1:
> -        /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;
>          if ( is_hvm_domain(d) )
> -            res->b |= (v->vcpu_id * 2) << 24;
> +            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;

There wants to be some kind of note here, especially as you're feeding
vlapic_x2apic_id() into a field called xAPIC ID.  Perhaps

/* Large systems do wrap around 255 in the xAPIC_ID field. */

?


>  
>          /* TODO: Rework vPMU control in terms of toolstack choices. */
>          if ( vpmu_available(v) &&
> @@ -310,19 +309,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          break;
>  
>      case 0xb:
> -        /*
> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
> -         * to guests on AMD hardware as well.
> -         *
> -         * TODO: Rework topology logic.
> -         */
>          if ( p->basic.x2apic )
>          {
>              *(uint8_t *)&res->c = subleaf;
>  
> -            /* Fix the x2APIC identifier. */
> -            res->d = v->vcpu_id * 2;
> +            /*
> +             * Fix the x2APIC identifier. The PV side is nonsensical, but
> +             * we've always shown it like this so it's kept for compat.
> +             */

In hindsight I should changed "Fix the x2APIC identifier." when I
reworked this logic, but oh well - better late than never.

/* The x2APIC_ID is per-vCPU, and fixed irrespective of the requested
subleaf. */

I'd also put a little more context in the PV side:

/* Xen 4.18 and earlier leaked x2APIC into PV guests.  The value shown
is nonsensical but kept as-was for compatibility. */

> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 3363926b487b..33b463925f4e 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1538,6 +1538,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>      const struct vcpu *v = vlapic_vcpu(vlapic);
>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>  
> +    /*
> +     * Loading record without hw.x2apic_id in the save stream, calculate using
> +     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
> +     * that vCPU0 always has x2APIC0, which is true for the old relation, and
> +     * still holds under the new x2APIC generation algorithm. While that case
> +     * goes through the conditional it's benign because it still maps to zero.
> +     */

It's not an implicit assumption; it's very explicit.

/* Xen 4.19 and earlier had no x2APIC_ID in the migration stream, and
hard-coded "vcpu_id * 2".  Default back to this if we have a
zero-extended record.  */

But, this will go malfunction if the toolstack tries to set v!0's
x2APIC_ID to 0.

What you need to know is whether lapic_load_hidden() had to zero-extend
the record or not (more specifically, over this field), so you want
h->size <= offsetof(x2_apicid) as the gating condition.

This should be safe for the toolstack, I think.  Hypercalls prior to
this patch will get a shorter record, and hypercalls from this patch
onwards will get a longer record with the default x2APIC_ID = vcpu_id *
2 filled in.

> +    if ( !vlapic->hw.x2apic_id )
> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
> +
>      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>      if ( !vlapic_x2apic_mode(vlapic) ||
>           (vlapic->loaded.ldr == good_ldr) )
> @@ -1606,6 +1616,13 @@ static int cf_check lapic_check_hidden(const struct domain *d,
>           APIC_BASE_EXTD )
>          return -EINVAL;
>  
> +    /*
> +     * Fail migrations from newer versions of Xen where
> +     * rsvd_zero is interpreted as something else.
> +     */

This comment isn't necessary.  We've got no shortage of reserved
checks.  However ...

> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
> index 7ecacadde165..1c2ec669ffc9 100644
> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>      uint32_t             timer_divisor;
>      uint64_t             tdt_msr;
> +    uint32_t             x2apic_id;
> +    uint32_t             rsvd_zero;

... we do normally spell it _rsvd; to make it extra extra clear that
people shouldn't be doing anything with it.

~Andrew

