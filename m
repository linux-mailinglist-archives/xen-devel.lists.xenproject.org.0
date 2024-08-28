Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A096233E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784559.1193932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqM-0003ty-66; Wed, 28 Aug 2024 09:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784559.1193932; Wed, 28 Aug 2024 09:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqM-0003rP-2Q; Wed, 28 Aug 2024 09:19:58 +0000
Received: by outflank-mailman (input) for mailman id 784559;
 Wed, 28 Aug 2024 09:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjEqL-0003rJ-28
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:19:57 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe40007-651e-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 11:19:54 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso4989501e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:19:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e548624asm216155866b.42.2024.08.28.02.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:19:53 -0700 (PDT)
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
X-Inumbo-ID: afe40007-651e-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724836794; x=1725441594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gzAfXzTdCHjqWg+HQHn50qpCjr6L3XGf7gdJY3A+lgQ=;
        b=L5CKOFabTYdbAxKXVLzujKFGykIeugOYsziLsYe3UUvlOlrzKPHvJ7I5MfjkW54V/T
         3hgEbgjeNCCo2kjy9QgpRV/MtmP1C878kOXIIpASqxiWfV4IrO0Awu2i55bBfMHAHjdx
         wgSH9xfV2gZiQcDav1Pipu1AWonwykcS++xhdgjmHZKxEDfYOkSVHyZNkl/o9KhT06G8
         9ToSnh3z2hJrgZCVgORAe+WAicX3tfRt7uUT9Z+LNjSSlZoiPt5v6YAwkS0evDDt+kQm
         8tx5UdnZhrZYHgH1FgpBkEz2JTkH5EhHemsfGJ8cw5p+dayFdmAGh3yXWw6up3QFViW5
         AOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836794; x=1725441594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzAfXzTdCHjqWg+HQHn50qpCjr6L3XGf7gdJY3A+lgQ=;
        b=rveuXuCciS2XbSk8Mfn7/GqWseV8+AHunGLMjGTY4wklzmxyc2x/3apwN5sQU24/2O
         PLe23WWY0ZbcVNCktyJYtRHN7MTFzspfVmHAHDywP15y9q05PwtiujjzbfcGsF1cebiX
         3QwSC6Cd33erbbRRVa3COSNjH4HrVQK/O4ycfyv/jd+43Q+8UlIadwd4ErrmLQ9odhG8
         yTN1MmmlFr0fVm3o/bmafj9+RYSKORhrmM1Hl074HpJI4rz4ecS3sq1AxIqStqWyX2U6
         lucotJn2famigyLaE5EdX2vwS1NFSqYFxaSbvIKelQ/c1owa0OVRmhLTxiOvTOMFsNQU
         pmqA==
X-Forwarded-Encrypted: i=1; AJvYcCU5VcVfSInWKjXZitblcmojcX9qyUI6/6fJjtinpulSJeyKWrPoJxi6F/JEugswT2ZAVKGxCA8m+xI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQt2VTwVVCLTGUB/4ASltji9M8JnjH5k/C/+Bpv82a86lcci+J
	XLkWg1OBX/EJcrRhf5T3jZXDal1mLvYHEtBoGQiKuqx/adng6s2RF28He6U5mw==
X-Google-Smtp-Source: AGHT+IEkhPX0eVXKuw1C0qpQQpNqZBGtT/JvuUkbb8i51BGQya+3f+OPPPWjVRuN0DjemfngLl7+eQ==
X-Received: by 2002:a05:6512:ba7:b0:52b:c0b1:ab9e with SMTP id 2adb3069b0e04-5343875589fmr10580294e87.5.1724836793941;
        Wed, 28 Aug 2024 02:19:53 -0700 (PDT)
Message-ID: <d022a5b1-c0ca-4399-b972-b01d834a95ec@suse.com>
Date: Wed, 28 Aug 2024 11:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240827135746.1908070-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 15:57, Andrew Cooper wrote:
> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
> the CPU and dirties it even if there's nothing outstanding, but the final
> for_each_set_bit() is O(256) when O(8) would do,

Nit: That's bitmap_for_each() now, I think. And again ...

> and would avoid multiple
> atomic updates to the same IRR word.
> 
> Rewrite it from scratch, explaining what's going on at each step.
> 
> Bloat-o-meter reports 177 -> 145 (net -32), but the better aspect is the
> removal calls to __find_{first,next}_bit() hidden behind for_each_set_bit().

... here, and no underscore prefixes on the two find functions.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2317,18 +2317,72 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>  
>  static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
>  {
> -    struct vlapic *vlapic = vcpu_vlapic(v);
> -    unsigned int group, i;
> -    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
> +    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
> +    union {
> +        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];

Using unsigned long here would imo be better, as that's what matches
struct pi_desc's DECLARE_BITMAP().

> +        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
> +    } vec;
> +    uint32_t *irr;
> +    bool on;
>  
> -    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
> +    /*
> +     * The PIR is a contended cacheline which bounces between the CPU(s) and
> +     * IOMMU(s).  An IOMMU updates the entire PIR atomically, but we can't
> +     * express the same on the CPU side, so care has to be taken.
> +     *
> +     * First, do a plain read of ON.  If the PIR hasn't been modified, this
> +     * will keep the cacheline Shared and not pull it Excusive on the current
> +     * CPU.
> +     */
> +    if ( !pi_test_on(desc) )
>          return;
>  
> -    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
> -        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
> +    /*
> +     * Second, if the plain read said that ON was set, we must clear it with
> +     * an atomic action.  This will bring the cachline to Exclusive on the

Nit (from my spell checker): cacheline.

> +     * current CPU.
> +     *
> +     * This should always succeed because noone else should be playing with
> +     * the PIR behind our back, but assert so just in case.
> +     */
> +    on = pi_test_and_clear_on(desc);
> +    ASSERT(on);
> +
> +    /*
> +     * The cacheline is now Exclusive on the current CPU, and because ON was

"is" is pretty ambitious. We can only hope it (still) is.

> +     * set, some other entity (an IOMMU, or Xen on another CPU) has indicated
> +     * that at PIR needs re-scanning.

Stray "at"?

> +     *
> +     * Note: Entities which can't update the entire cacheline atomically
> +     *       (i.e. Xen on another CPU) are required to update PIR first, then
> +     *       set ON.  Therefore, there is a corner case where we may have
> +     *       found and processed the PIR updates "last time around" and only
> +     *       found ON this time around.  This is fine; the logic still
> +     *       operates correctly.
> +     *
> +     * Atomically read and clear the entire pending bitmap as fast as we, to

Missing "can" before the comma?

> +     * reduce the window where another entity may steal the cacheline back
> +     * from us.  This is a performance concern, not a correctness concern.  If
> +     * the another entity does steal the cacheline back, we'll just wait to

"the other"?

> +     * get it back again.
> +     */
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
> +        vec._64[i] = xchg(&desc->pir[i], 0);
> +
> +    /*
> +     * Finally, merge the pending vectors into IRR.  The IRR register is
> +     * scattered in memory, so we have to do this 32 bits at a time.
> +     */
> +    irr = (uint32_t *)&vcpu_vlapic(v)->regs->data[APIC_IRR];
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._32); ++i )
> +    {
> +        if ( !vec._32[i] )
> +            continue;
>  
> -    bitmap_for_each ( i, pending_intr, X86_NR_VECTORS )
> -        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
> +        asm ( "lock or %[val], %[irr]"
> +              : [irr] "+m" (irr[i * 0x10])

This wants to be irr * 4 only, to account for sizeof(*irr) == 4.

Jan

