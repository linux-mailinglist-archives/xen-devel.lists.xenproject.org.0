Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5867908CCB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 15:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740721.1147813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Q2-0002vG-B1; Fri, 14 Jun 2024 13:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740721.1147813; Fri, 14 Jun 2024 13:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Q2-0002tk-7u; Fri, 14 Jun 2024 13:56:42 +0000
Received: by outflank-mailman (input) for mailman id 740721;
 Fri, 14 Jun 2024 13:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI7Q1-0002te-13
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 13:56:41 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec628a70-2a55-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 15:56:39 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso3092222e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 06:56:39 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db5bbcsm186315566b.82.2024.06.14.06.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 06:56:38 -0700 (PDT)
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
X-Inumbo-ID: ec628a70-2a55-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718373399; x=1718978199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QjN60CHXWEs5C3gxYG/+9+0tbqixkJhfEtFYsb6OZO0=;
        b=mPkS332nJOrdZWM7Dfjb67nSllE/bWFycCwmA+qnvMj+e3CuzJvPBkVjzR+xHwBuwh
         r+udQDomqW/txyeeVn9kMJN01WcTjLqIwaNlAZ8hoYwia8FMrEklHK4KLMmDHIFDDp8z
         x6+kZ0MKKjn3JVTebPZc6kNZZLalQWm7SPw90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373399; x=1718978199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjN60CHXWEs5C3gxYG/+9+0tbqixkJhfEtFYsb6OZO0=;
        b=tozX/q6wkWYhEo3HKFnkxkgRij4P91/+2W4ANLEMGT+EDJ4kxEpa8E+l3ACjyLbnNj
         MHuomAXc2v7loB+ZOTsbiGfUB44EeOOdIKhiEf/O6z47khzzYo5xRdwQp9Bf8SZWIhXH
         8vTvVJd2h+G81373anIjvX8fdwdrfazpUzo2/dt2wBBIrLXStUbxS18wvPZQu4IPenCP
         dHmfbvx/NwADsyTm43kxmFdnHkAmopH5NwJKXDRaLrSwN/5NKUSrA1hEEnJ2yWZ2Sgr/
         gBApQCbKZP6of/YsGzcrd36Pegk/yEVJx/IyL311GbJE6t2TarfIqjD77gPvVhuX5gJc
         oQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVzhfBMRJBXLjjGEMr179MknU9emTD6lNkktn2ML7EssVtS0gG6oBGVJZpU4m69GcjBwee9JMxsZpowboFrkyGFpJaG7BC3W0auYQ2vEns=
X-Gm-Message-State: AOJu0YxgBiaLVBzFVPKUKPspxwZJw2MR22/mV6InmfGpSdnJze78ZOek
	RdQpIwsqLwpXWeBUhn4dq38x1UobCGYarLMliQKumselmEhvCmgzeWSvuCPx7gI=
X-Google-Smtp-Source: AGHT+IEp1XVBpuZjiSiq1ZKqSI7AJWEQdVC9olJ+QflF/zR4KZZXS23VqR3uoJ65kjrOCicRkhxUmg==
X-Received: by 2002:a05:6512:3f27:b0:52c:9ae0:beed with SMTP id 2adb3069b0e04-52ca6e92a3cmr2751951e87.52.1718373399276;
        Fri, 14 Jun 2024 06:56:39 -0700 (PDT)
Message-ID: <71cbc846-527d-45f0-bd0b-df3f0294e7cd@citrix.com>
Date: Fri, 14 Jun 2024 14:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-3-andrew.cooper3@citrix.com>
 <22e0473a-aca8-4645-a3f4-21a9d9e0ebd3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <22e0473a-aca8-4645-a3f4-21a9d9e0ebd3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 4:34 pm, Jan Beulich wrote:
> On 23.05.2024 13:16, Andrew Cooper wrote:
>> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
>> every call.  This is expensive, being used for domain create/migrate, as well
>> as to service certain guest CPUID instructions.
>>
>> Instead, arrange to check the sizes once at boot.  See the code comments for
>> details.  Right now, it just checks hardware against the algorithm
>> expectations.  Later patches will add further cross-checking.
>>
>> Introduce the missing X86_XCR0_* and X86_XSS_* constants, and a couple of
>> missing CPUID bits.  This is to maximise coverage in the sanity check, even if
>> we don't expect to use/virtualise some of these features any time soon.  Leave
>> HDC and HWP alone for now.  We don't have CPUID bits from them stored nicely.
> Since you say "the missing", ...
>
>> --- a/xen/arch/x86/include/asm/x86-defns.h
>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>> @@ -77,7 +77,7 @@
>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>>  
>>  /*
>> - * XSTATE component flags in XCR0
>> + * XSTATE component flags in XCR0 | MSR_XSS
>>   */
>>  #define X86_XCR0_FP_POS           0
>>  #define X86_XCR0_FP               (1ULL << X86_XCR0_FP_POS)
>> @@ -95,11 +95,34 @@
>>  #define X86_XCR0_ZMM              (1ULL << X86_XCR0_ZMM_POS)
>>  #define X86_XCR0_HI_ZMM_POS       7
>>  #define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
>> +#define X86_XSS_PROC_TRACE        (_AC(1, ULL) <<  8)
>>  #define X86_XCR0_PKRU_POS         9
>>  #define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
>> +#define X86_XSS_PASID             (_AC(1, ULL) << 10)
>> +#define X86_XSS_CET_U             (_AC(1, ULL) << 11)
>> +#define X86_XSS_CET_S             (_AC(1, ULL) << 12)
>> +#define X86_XSS_HDC               (_AC(1, ULL) << 13)
>> +#define X86_XSS_UINTR             (_AC(1, ULL) << 14)
>> +#define X86_XSS_LBR               (_AC(1, ULL) << 15)
>> +#define X86_XSS_HWP               (_AC(1, ULL) << 16)
>> +#define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
>> +#define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
> ... I'm wondering if you deliberately left out APX (bit 19).

It was deliberate.  APX isn't in the SDM yet, so in principle is still
subject to change.

I've tweaked the commit message to avoid using the word 'missing'.

> Since you're re-doing some of what I have long had in patches already,
> I'd also like to ask whether the last underscores each in the two AMX
> names really are useful in your opinion. While rebasing isn't going
> to be difficult either way, it would be yet simpler with
> X86_XCR0_TILECFG and X86_XCR0_TILEDATA, as I've had it in my patches
> for over 3 years.

I'm torn here.  I don't want to deliberately make things harder for you,
but I would really prefer that we use the more legible form...
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -604,9 +604,156 @@ static bool valid_xcr0(uint64_t xcr0)
>>      if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
>>          return false;
>>  
>> +    /* TILE_CFG and TILE_DATA must be the same. */
>> +    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
>> +        return false;
>> +
>>      return true;
>>  }
>>  
>> +struct xcheck_state {
>> +    uint64_t states;
>> +    uint32_t uncomp_size;
>> +    uint32_t comp_size;
>> +};
>> +
>> +static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
>> +{
>> +    uint32_t hw_size;
>> +
>> +    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
>> +
>> +    BUG_ON(s->states & new); /* States only increase. */
>> +    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
>> +    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
>> +    BUG_ON((new & X86_XCR0_STATES) &&
>> +           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
>> +
>> +    s->states |= new;
>> +    if ( new & X86_XCR0_STATES )
>> +    {
>> +        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
>> +            BUG();
>> +    }
>> +    else
>> +        set_msr_xss(s->states & X86_XSS_STATES);
>> +
>> +    /*
>> +     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
>> +     * prior holes in the state area, so we check that the size doesn't
>> +     * decrease.
>> +     */
>> +    hw_size = cpuid_count_ebx(0xd, 0);
>> +
>> +    if ( hw_size < s->uncomp_size )
>> +        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
>> +              s->states, &new, hw_size, s->uncomp_size);
>> +
>> +    s->uncomp_size = hw_size;
>> +
>> +    /*
>> +     * Check the compressed size, if available.  All components strictly
>> +     * appear in index order.  In principle there are no holes, but some
>> +     * components have their base address 64-byte aligned for efficiency
>> +     * reasons (e.g. AMX-TILE) and there are other components small enough to
>> +     * fit in the gap (e.g. PKRU) without increasing the overall length.
>> +     */
>> +    hw_size = cpuid_count_ebx(0xd, 1);
>> +
>> +    if ( cpu_has_xsavec )
>> +    {
>> +        if ( hw_size < s->comp_size )
>> +            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
>> +                  s->states, &new, hw_size, s->comp_size);
>> +
>> +        s->comp_size = hw_size;
>> +    }
>> +    else
>> +        BUG_ON(hw_size); /* Compressed size reported, but no XSAVEC ? */
> I'm not quite happy with this being fatal to booting. Maybe just WARN_ON()?

It's going to trigger on every pass.   I've reworked it to be an
opencoded WARN_ONCE() (as we don't have this construct yet), but it's
ended up as a plain WARN().

~Andrew

