Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5295F327
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 15:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783477.1192813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siZxl-0006xu-8l; Mon, 26 Aug 2024 13:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783477.1192813; Mon, 26 Aug 2024 13:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siZxl-0006wO-66; Mon, 26 Aug 2024 13:40:53 +0000
Received: by outflank-mailman (input) for mailman id 783477;
 Mon, 26 Aug 2024 13:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siZxj-0006wI-8M
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 13:40:51 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb1cbcc-63b0-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 15:40:47 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so68291501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 06:40:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f47c446sm667525866b.156.2024.08.26.06.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 06:40:46 -0700 (PDT)
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
X-Inumbo-ID: ccb1cbcc-63b0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724679647; x=1725284447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=APHpimh9QRyPzBsIDrJ1nOWEF8yafTjY+JrjFQGykj4=;
        b=WUDfnvJRxPTzTL+cRaNDFENkfa3ffyYetavbM0SDPGyDB7jxl8esOmnpm+pRqFGGH7
         CsMRgKWsm88UoLujIRmBtDtZdF2sb7TwqPgYQLu3fjSsJD/xgs9F/yqQqorhnAvwNDKE
         y7D4ywOHb5VXpWELwTcg2KoKbQYNvIaRnoB0foaUK4X/7494mEGcz0I6xBVTIU+IWb9g
         kCMiwFA3J0WEa+5zX6EGVrl5hM2s8/fYnGZf5wOA0KUz1bD4c7Vwo94LjRwScFy58qe8
         XsLfr/9+PvdRG0+H1iaHNQ3xW9ZtnJ6lOpQ1WT+PrO8UCIic/39TQmInFa0jSHDiGu3W
         B8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724679647; x=1725284447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APHpimh9QRyPzBsIDrJ1nOWEF8yafTjY+JrjFQGykj4=;
        b=XDWBF0qg/CYrHIeazdYWNz3IToeZixLgsBv87eKYD5BZ8Uho9YmUWF5tbtt5HPUx4q
         OxmJkSjQefxYmb3t2D4AFZq9pwzqYD/1Eckp72Hig2XhgVw4p/kEX24cfbe1NuSPOMrm
         RSFToTBmQv6OzciYTBW6d7k8BANm3BtfNbO9wIQdWZ2DkEVAaU4/J8romyzSrB2adWeX
         XlhG0wmTEWauVP9MGxLE586K7zmvKFyq+293lJA80Ktym40//MLRd+Z5IKAgxqA5uGBg
         bdn0qzN1rcvDax4AQ+YymFcCPIRvqiS7eQuPPVuaNb3Pk44HyoQ1SF71yUy/Q0sSA6oV
         YOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrdtXmZXhgzyrwobXmwsLcVjZcNZcfpAMk1N60cjONAdabuAfp9hdDwh6x+xrJ1M2o4Bg8d6dCHJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6CwhJvO2+e6Q7cGGei2O1SXfsR1eLBkCtATtTKv/5XTlEBurs
	4tPpq+TisAVsohTjmkUaWpO726Gno7yuGSUG1l/jV4LM/hlmhvdK4e+wc15t5w==
X-Google-Smtp-Source: AGHT+IFyMV1vc79GQVa9ampMUUlsDhuqhtQ2iHTDqQBCbYI14T2mxMWKJZVDybbqBhuph9Cyp5qy3A==
X-Received: by 2002:a2e:b704:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f4f5750715mr69378551fa.16.1724679646375;
        Mon, 26 Aug 2024 06:40:46 -0700 (PDT)
Message-ID: <0849576f-1a21-4e46-989b-e8b21026eb65@suse.com>
Date: Mon, 26 Aug 2024 15:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] x86emul/test: rename "cp"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
 <fb9e2081-16d5-4dc4-92f5-fb55f313304b@suse.com>
 <4d88b5d1-592e-4756-b093-6cbf1ca08948@citrix.com>
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
In-Reply-To: <4d88b5d1-592e-4756-b093-6cbf1ca08948@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.08.2024 17:08, Andrew Cooper wrote:
> On 14/08/2024 9:51 am, Jan Beulich wrote:
>> In preparation of introducing a const struct cpu_policy * local in
>> x86_emulate(), rename that global variable to something more suitable:
>> "cp" is our commonly used name for function parameters or local
>> variables of type struct cpu_policy *, and the present name of the
>> global could hence have interfered already.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Re-base over dropping of Xeon Phi support.
> 
> Bah - still need to reinstate part of that patch.  The model numbers
> need to stay.  /me adds it to the todo list.
> 
> For this patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,
> with one request for this patch a couple of thoughts for separate patches.

Thanks; see below for a clarifying question as to which one is which.

>> --- a/tools/tests/x86_emulator/x86-emulate.h
>> +++ b/tools/tests/x86_emulator/x86-emulate.h
>> @@ -123,7 +123,7 @@ static inline uint64_t xgetbv(uint32_t x
>>  }
>>  
>>  /* Intentionally checking OSXSAVE here. */
>> -#define cpu_has_xsave     (cp.basic.raw[1].c & (1u << 27))
>> +#define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
> 
> Right now we deliberately don't emit names for APIC, OSXSAVE and OSPKE,
> because the values won't be correct in a guest's policy.  But this is a
> legitimate corner case.
> 
> What about this?
> 
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index 601eec608983..1b56958f07e7 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -382,10 +382,11 @@ def crunch_numbers(state):
>              if name and name[0] in "0123456789":
>                  name = "_" + name
>  
> -            # Don't generate names for features fast-forwarded from other
> -            # state
> +            # For dynamic features (fast forwarded from other state), also
> +            # prefix with an underscore to highlight that extra care
> needs to
> +            # be taken.
>              if name in ("APIC", "OSXSAVE", "OSPKE"):
> -                name = ""
> +                name = "_" + name
>  
>              names.append(name.lower())
>  
> which would make the expression become cpu_policy.basic._osxsave and
> avoid the opencoded number.

I'm not overly happy with that, not the least because of the pre-existing
case where an underscore is being prepended. If at all, I'd like these to
stand out even more. And I would have less reservations if we could limit
this to the header(s) that are generated for the tool stack, keeping the
hypervisor "immune" to mistakes in this area.

If it's just the open-coded number, I could probably introduce
cpufeat_mask() locally here. Not sure in how far the open-coding of the
field is also of concern to you.

>> @@ -133,63 +133,63 @@ static inline bool xcr0_mask(uint64_t ma
>>  unsigned int rdpkru(void);
>>  void wrpkru(unsigned int val);
>>  
>> -#define cache_line_size() (cp.basic.clflush_size * 8)
>> -#define cpu_has_fpu        cp.basic.fpu
>> -#define cpu_has_mmx        cp.basic.mmx
>> -#define cpu_has_fxsr       cp.basic.fxsr
>> -#define cpu_has_sse        cp.basic.sse
>> -#define cpu_has_sse2       cp.basic.sse2
>> -#define cpu_has_sse3       cp.basic.sse3
>> -#define cpu_has_pclmulqdq  cp.basic.pclmulqdq
>> -#define cpu_has_ssse3      cp.basic.ssse3
>> -#define cpu_has_fma       (cp.basic.fma && xcr0_mask(6))
>> -#define cpu_has_sse4_1     cp.basic.sse4_1
>> -#define cpu_has_sse4_2     cp.basic.sse4_2
>> -#define cpu_has_popcnt     cp.basic.popcnt
>> -#define cpu_has_aesni      cp.basic.aesni
>> -#define cpu_has_avx       (cp.basic.avx  && xcr0_mask(6))
>> -#define cpu_has_f16c      (cp.basic.f16c && xcr0_mask(6))
>> -
>> -#define cpu_has_avx2      (cp.feat.avx2 && xcr0_mask(6))
>> -#define cpu_has_bmi1       cp.feat.bmi1
>> -#define cpu_has_bmi2       cp.feat.bmi2
>> -#define cpu_has_avx512f   (cp.feat.avx512f  && xcr0_mask(0xe6))
>> -#define cpu_has_avx512dq  (cp.feat.avx512dq && xcr0_mask(0xe6))
>> -#define cpu_has_avx512_ifma (cp.feat.avx512_ifma && xcr0_mask(0xe6))
>> -#define cpu_has_avx512cd  (cp.feat.avx512cd && xcr0_mask(0xe6))
>> -#define cpu_has_sha        cp.feat.sha
>> -#define cpu_has_avx512bw  (cp.feat.avx512bw && xcr0_mask(0xe6))
>> -#define cpu_has_avx512vl  (cp.feat.avx512vl && xcr0_mask(0xe6))
>> -#define cpu_has_avx512_vbmi (cp.feat.avx512_vbmi && xcr0_mask(0xe6))
>> -#define cpu_has_avx512_vbmi2 (cp.feat.avx512_vbmi2 && xcr0_mask(0xe6))
>> -#define cpu_has_gfni       cp.feat.gfni
>> -#define cpu_has_vaes      (cp.feat.vaes && xcr0_mask(6))
>> -#define cpu_has_vpclmulqdq (cp.feat.vpclmulqdq && xcr0_mask(6))
>> -#define cpu_has_avx512_vnni (cp.feat.avx512_vnni && xcr0_mask(0xe6))
>> -#define cpu_has_avx512_bitalg (cp.feat.avx512_bitalg && xcr0_mask(0xe6))
>> -#define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
>> -#define cpu_has_movdiri    cp.feat.movdiri
>> -#define cpu_has_movdir64b  cp.feat.movdir64b
>> -#define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
>> -#define cpu_has_serialize  cp.feat.serialize
>> -#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
>> -#define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
>> -#define cpu_has_sm3        (cp.feat.sm3 && xcr0_mask(6))
>> -#define cpu_has_sm4        (cp.feat.sm4 && xcr0_mask(6))
>> -#define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
>> -#define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
>> -#define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
>> -#define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
>> -#define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
>> -#define cpu_has_avx_vnni_int16 (cp.feat.avx_vnni_int16 && xcr0_mask(6))
> 
> Can we take the opportunity to realign these vertically?

I've done this, and I assume that this was the "for this patch" request. I'm
not overly happy with the result, because of the now definitely necessary
line wrapping, but it's perhaps still an improvement. (It's likely going to
bite me when re-basing this ahead of other patches I have it sit behind of
right now.)

> Also, we have X86_XCR0_* constants in a helpful place now.  Could we do
> something like:
> 
> #define XCR0_AVX xcr0_mask(X86_XCR0_YMM | X86_XCR0_SSE)
> #define XCR0_AVX512 ...
> 
> So that these expressions now read
> 
> #define cpu_has_$X (... && XCR0_AVX)
> 
> rather than forcing the reader to know %xcr0 by raw hex?

I can do that, yet I probably wouldn't want to fold the xcr0_mask()
invocations into the macro expansions. Would that be okay with you?

Jan

