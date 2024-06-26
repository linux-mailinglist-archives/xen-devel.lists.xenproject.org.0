Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A75917CE6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748676.1156468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPHa-0007KA-SR; Wed, 26 Jun 2024 09:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748676.1156468; Wed, 26 Jun 2024 09:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPHa-0007Ii-Po; Wed, 26 Jun 2024 09:49:42 +0000
Received: by outflank-mailman (input) for mailman id 748676;
 Wed, 26 Jun 2024 09:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPHZ-0007Ic-ON
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:49:41 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67c76f26-33a1-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:49:40 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so71870591fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 02:49:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7066a0d913dsm7549558b3a.112.2024.06.26.02.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:49:38 -0700 (PDT)
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
X-Inumbo-ID: 67c76f26-33a1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719395379; x=1720000179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hjZ8gZ8VXhpK2mb2cf5pt8UpBO9uKk+k7+sLzgIR+Ew=;
        b=RCSWj5W2gnRjk2fp1evYXyHe6lDEpYv1peo1rGIYnU2oJgKNui0Z8+Wq/rGClAlXus
         IJQbYfgRPBmQQvcDJJ+GWq3eZV4ZRZNBqD4SxbeUVUZU5hbqQ3S99jsRaq615Pj6zeUM
         82NRtJe0Pj6Um2sVomvRITmVLy4Woo389LYtN2bdq+WOKAZgz2GtS+ledR02LC1eg3SJ
         aHwhIpGIWpcCuRVxd4kijl3Z7fWL7q/FufQJQdDsq0c7x+kugn/PtGGUpyTxLKFVqSdQ
         SIP1d6e/ZLpQodW0VySWJ5/inLDQwOhF4x4VxTfk2rGkcD3ec+6kbOLy+ZSgav3mchDh
         NUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719395379; x=1720000179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjZ8gZ8VXhpK2mb2cf5pt8UpBO9uKk+k7+sLzgIR+Ew=;
        b=QQZDTt9A5w5yPCrGrjiSNvljIzBcgbTuDuwbUXBeH2rYhbCUN5O/c0DU/7ZoUK5kkZ
         /CGAdXO3MCXL/NlBJm/FsSbeyQaES5RtS3aXZPKpfnlJ+81hKRqVY6UnTvsvdwKvgF1f
         FTnG2tymVOqolclLL9j8ovh2us6m+S42cUEeQQXqqIdMUgCPSE0SHhNv3T1FdbaTJYpc
         du0UlJZpdz+1spSw/iiJAOPocNaJPTW1eWakVC+7+5K4640AWXOvYIxZwKsk0JpK0N6q
         fYfB1Poj2c1wsSpWZET2CYEwLCA4K3h66NLY7s3mPxLuvJ1H8j7x1xFXv3xAFmWwBHuY
         /ZxA==
X-Forwarded-Encrypted: i=1; AJvYcCV/sLdq4j6MnvAKZs/q/J+2bKU9SKgHikyD5ciUWLeE0bvJ6bH+eL6Q4PHM+51pTh31QKuarq9HYwFkpWZP8WOx2C+3p9OZVncbYmz3QVQ=
X-Gm-Message-State: AOJu0Ywm4lrIN4QaAmnv45Sr5aEAa3G+VJsES871sFRPnF8xYhtSxaI+
	vW2c5eMJaPyiUd4wx8bwFunVFXaoftwlYQ9x2TxwgorMD6vjxq/z69UT3qRAoA==
X-Google-Smtp-Source: AGHT+IEsZFr2IZgZiVfRy9tm4jrdGJABiS5dlyyiQYcyvfT6uQ+TAQ+HZndfIa+480lNiQQw9OL7rw==
X-Received: by 2002:a2e:730b:0:b0:2ec:5a25:16e9 with SMTP id 38308e7fff4ca-2ec5b3884b4mr55726391fa.34.1719395379060;
        Wed, 26 Jun 2024 02:49:39 -0700 (PDT)
Message-ID: <fc04af37-6ef6-4c91-a625-d541f9f9bfe5@suse.com>
Date: Wed, 26 Jun 2024 11:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
> the CPU and dirties it even if there's nothing outstanding, but the final
> for_each_set_bit() is O(256) when O(8) would do, and would avoid multiple
> atomic updates to the same IRR word.

The way it's worded (grammar wise) it appears as if the 2nd issue is missing
from this description. Perhaps you meant to break the sentence at "but" (and
re-word a little what follows), which feels a little unmotivated to me (as a
non-native speaker, i.e. may not mean anything) anyway? Or maybe something
simply got lost in the middle?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2321,18 +2321,63 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>  
>  static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
>  {
> -    struct vlapic *vlapic = vcpu_vlapic(v);
> -    unsigned int group, i;
> -    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
> +    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
> +    union {
> +        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];
> +        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
> +    } vec;
> +    uint32_t *irr;
> +    bool on;
>  
> -    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
> +    /*
> +     * The PIR is a contended cacheline which bounces between the CPU and
> +     * IOMMU.  The IOMMU updates the entire PIR atomically, but we can't
> +     * express the same on the CPU side, so care has to be taken.
> +     *
> +     * First, do a plain read of ON.  If the PIR hasn't been modified, this
> +     * will keep the cacheline Shared and not pull it Excusive on the CPU.
> +     */
> +    if ( !pi_test_on(desc) )
>          return;
>  
> -    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
> -        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
> +    /*
> +     * Second, if the plain read said that ON was set, we must clear it with
> +     * an atomic action.  This will bring the cachline to Exclusive on the
> +     * CPU.
> +     *
> +     * This should always succeed because noone else should be playing with
> +     * the PIR behind our back, but assert so just in case.
> +     */

Isn't "playing with" more strict than what is the case, and what we need
here? Aiui nothing should _clear this bit_ behind our back, while PIR
covers more than just this one bit, and the bit may also become reset
immediately after we cleared it.

> +    on = pi_test_and_clear_on(desc);
> +    ASSERT(on);
>  
> -    for_each_set_bit(i, pending_intr, X86_NR_VECTORS)
> -        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
> +    /*
> +     * The cacheline is now Exclusive on the CPU, and the IOMMU has indicated
> +     * (via ON being set) thatat least one vector is pending too.

This isn't quite correct aiui, and hence perhaps better not to state it
exactly like this: While we're ...

>  Atomically
> +     * read and clear the entire pending bitmap as fast as we, to reduce the
> +     * window that the IOMMU may steal the cacheline back from us.
> +     *
> +     * It is a performance concern, but not a correctness concern.  If the
> +     * IOMMU does steal the cacheline back, we'll just wait to get it back
> +     * again.
> +     */
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
> +        vec._64[i] = xchg(&desc->pir[i], 0);

... still ahead of or in this loop, new bits may become set which we then
may handle right away. The "on" indication on the next entry into this
logic may then be misleading, as we may not find any set bit.

All the code changes look good to me, otoh.

Jan

> +    /*
> +     * Finally, merge the pending vectors into IRR.  The IRR register is
> +     * scattered in memory, so we have to do this 32 bits at a time.
> +     */
> +    irr = (uint32_t *)&vcpu_vlapic(v)->regs->data[APIC_IRR];
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._32); ++i )
> +    {
> +        if ( !vec._32[i] )
> +            continue;
> +
> +        asm ( "lock or %[val], %[irr]"
> +              : [irr] "+m" (irr[i * 0x10])
> +              : [val] "r" (vec._32[i]) );
> +    }
>  }
>  
>  static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)


