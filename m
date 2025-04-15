Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536ADA89EA0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953834.1348238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fmp-0006sf-Ah; Tue, 15 Apr 2025 12:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953834.1348238; Tue, 15 Apr 2025 12:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fmp-0006q9-7z; Tue, 15 Apr 2025 12:53:11 +0000
Received: by outflank-mailman (input) for mailman id 953834;
 Tue, 15 Apr 2025 12:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4fmn-0006q3-Oq
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:53:09 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9318ba59-19f8-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 14:53:06 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso3365538f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 05:53:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fca5sm216279375e9.32.2025.04.15.05.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 05:53:05 -0700 (PDT)
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
X-Inumbo-ID: 9318ba59-19f8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744721585; x=1745326385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dnszDQn5Xo6ChQ0rXoeOfKQrt7j2g43pgFTe4oRVQFU=;
        b=C164j6rEXmv50ID9zWJ6DMCk9XUIXFpRtqPZCCUGzFaIbOaXVWlQ3rI86J9xv1twmS
         DdKHdogym90oObqTV8CkJGxdUrAlsKhSWnOCUV4POQg1pWnwQ+LJdQ8/5ELN0Ch1iCT2
         +S2Ki6pUgQ/Wozux+D3Soff2oU1WsXV7pKybf7YVlyWHourB+GsPwfbWsevZBW5AkzHz
         +nMaY29vFOzxUgIRw96EURDLel2oR24247L9aIavQenVHctbEyZMdk9WTN2K2IpzKUdc
         OrBDekyXTJZnQBy3tEEVuQ6kOvYjDI6gBcHSpHwrUgQ/eLBoXalaTRvODUr7N8iHKG+j
         e+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721585; x=1745326385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnszDQn5Xo6ChQ0rXoeOfKQrt7j2g43pgFTe4oRVQFU=;
        b=eRYEjy1xDc2/yM6ZjBH7ImWQz+3SMcaLKuW8I2ZA4bQL34+kmuvbskGzDgjDlSkqn+
         DsGw66fScY7XExUbVwtLenDLxjOjPfigr0AILLWritpglGTDxJWkkv5u0afceZD2w4FF
         YjKmAH6vH+9H8dapXrDqM1InVitN2i4pTGv8j5AyZwROqawlPOBT7GdJZElrmXJjVumL
         6+DZ0txktQ1KiGh3BHdjuyG+RFoGnRl1zQPC89YAoXpvwFwTp5ItIw8bZNc71ZcoO1j8
         k8114+e27ztjB5m8Ajx9pzVMS+bpUaGEUCrg74UDFZm4hgk9VYDJbY6FlEINjAKpMpwl
         j0mA==
X-Forwarded-Encrypted: i=1; AJvYcCV+agcahnQaSg/ZEKCyzbakfpd5E9Dvq5s2OMSkmLFve8CzyL/KhRBN1WCIVbOeJUxgHpIYQLS97ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOeE7m76VYvMWy2hJot9HJmX0Ic4r/KuvpMmI+J4SDYnk8ANhZ
	bMok7yeH+KTgpPM6PJxLRDAds6mgJPN5ip1XaNJ/jmGQHYMSyR9ihBsgTtI1ew==
X-Gm-Gg: ASbGncuwb+fY01MuynXk8uQWnvU4b8PHZqRyY9/pebgE6+ie7LQZxVdtoaZKBpnNUGC
	gjNoRkaIXyDxBObbr6Xk4FJrA3ftVQ67AnbRerNH7ZRWclFAwKjx06Y0jE1nEMUOCPOS3eyBur5
	a1hgaLB+7soHGWiknUN/0GMyo4ftzBAF8pVhOFFNQwDfREimJAvBkqvIcKXIa8JddAYVzFWYmVj
	i52X6N+7K5vBlaOydPuO0BBBQIIYqQjJScAqmbeoMTUsCQwvPlzL2/e4Qfbnt5usCymKamgmtIg
	O9QkWRnC1lTNWF0jTecE56IM+tu+U2CHWrixd3uhSwi5E7Nd/TMxhYG1uDjd/04PEas05P3j+Rn
	xtrH4LP0nv3nd3j5eSxkl6yaRqg==
X-Google-Smtp-Source: AGHT+IGGt0/uQSUgIgDOQBmgVAA0mNKASPZFhzqPeQ+tdQK7nCBhly1KFXcMi6tZqgJVRjmKTwpKZA==
X-Received: by 2002:a5d:64e7:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39edc3057ddmr2781404f8f.11.1744721585360;
        Tue, 15 Apr 2025 05:53:05 -0700 (PDT)
Message-ID: <f9ba3402-ede8-4852-b3fc-041fa04d9253@suse.com>
Date: Tue, 15 Apr 2025 14:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO
 pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
 <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
 <Z_4vE1qHlvGliqXY@macbook.lan>
 <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com>
 <Z_5DKdVBG52mTN0U@macbook.lan>
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
In-Reply-To: <Z_5DKdVBG52mTN0U@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 14:47, Roger Pau Monné wrote:
> On Tue, Apr 15, 2025 at 12:18:04PM +0200, Jan Beulich wrote:
>> On 15.04.2025 12:04, Roger Pau Monné wrote:
>>> On Tue, Apr 15, 2025 at 11:41:27AM +0200, Jan Beulich wrote:
>>>> On 15.04.2025 10:34, Roger Pau Monné wrote:
>>>>> On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
>>>>>> On 14.04.2025 18:13, Roger Pau Monné wrote:
>>>>>>> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
>>>>>>>> On 14.04.2025 15:53, Roger Pau Monné wrote:
>>>>>>>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
>>>>>>>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
>>>>>>>>>> p2m_mmio_direct.
>>>>>>>>>
>>>>>>>>> But that won't go into hvm_hap_nested_page_fault() when using
>>>>>>>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
>>>>>>>>> mapped as p2m_mmio_direct)?
>>>>>>>>>
>>>>>>>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
>>>>>>>>> differently?
>>>>>>>>
>>>>>>>> All true as long as things work as expected (potentially including the guest
>>>>>>>> also behaving as expected). Also this was explicitly only an example I could
>>>>>>>> readily think of. I'm simply wary of handle_mmio_with_translation() now
>>>>>>>> getting things to handle it's not meant to ever see.
>>>>>>>
>>>>>>> How was access to MMIO r/o regions supposed to be handled before
>>>>>>> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
>>>>>>> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
>>>>>>> (~2010), yet I can't figure out how writes would be handled back then
>>>>>>> that didn't result in a p2m fault and crashing of the domain.
>>>>>>
>>>>>> Was that handled at all before said change?
>>>>>
>>>>> Not really AFAICT, hence me wondering how where write accesses to r/o
>>>>> MMIO regions supposed to be handled by (non-priv) domains.  Was the
>>>>> expectation that those writes trigger an p2m violation thus crashing
>>>>> the domain?
>>>>
>>>> I think so, yes. Devices with such special areas weren't (aren't?) supposed
>>>> to be handed to DomU-s.
>>>
>>> Oh, I see.  That makes stuff a bit clearer.  I think we would then
>>> also want to add some checks to {ept_}p2m_type_to_flags()?
>>>
>>> I wonder why handling of mmio_ro_ranges was added to the HVM p2m code
>>> in ~2010 then.  If mmio_ro_ranges is only supposed to be relevant for
>>> the hardware domain in ~2010 an HVM dom0 was not even in sight?
>>
>> I fear because I was wrong with what I said in the earlier reply: There's
>> one exception - the MSI-X tables of devices. DomU-s (and even Dom0) aren't
>> supposed to access them directly, but we'd permit reads (which, at least
>> back at the time, were also required to keep qemu working).
> 
> Hm, but reads to the MSI-X table for HVM domains will go through QEMU,
> and hence not hit the r/o MMIO path, because the MSI-X table will
> never be mapped to an HVM guest p2m?

Right, just wanted to be on the safe side there.

>>>>>>> I'm happy to look at other ways to handling this, but given there's
>>>>>>> current logic for handling accesses to read-only regions in
>>>>>>> hvm_hap_nested_page_fault() I think re-using that was the best way to
>>>>>>> also handle accesses to MMIO read-only regions.
>>>>>>>
>>>>>>> Arguably it would already be the case that for other reasons Xen would
>>>>>>> need to emulate an instruction that accesses a read-only MMIO region?
>>>>>>
>>>>>> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
>>>>>> p2m_mmio_direct (after all, "direct" means we expect no emulation is
>>>>>> needed; while arguably wrong for the introspection case, I'm not sure
>>>>>> that and pass-through actually go together). Hence it's down to
>>>>>> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
>>>>>> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
>>>>>> which means that if hvm_io_intercept() can't handle it, the access
>>>>>> will be forwarded to the responsible DM, or be "processed" by the
>>>>>> internal null handler.
>>>>>>
>>>>>> Given this, perhaps what you do is actually fine. At the same time
>>>>>> note how several functions in hvm/emulate.c simply fail upon
>>>>>> encountering p2m_mmio_direct. These are all REP handlers though, so
>>>>>> the main emulator would then try emulating the insn the non-REP way.
>>>>>
>>>>> I'm open to alternative ways of handling such accesses, just used what
>>>>> seemed more natural in the context of hvm_hap_nested_page_fault().
>>>>>
>>>>> Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
>>>>> perspective, that would "just" result in the guest getting a #GP
>>>>> injected.
>>>>
>>>> That's not the part I'm worried about. What worries me is that we open up
>>>> another (or better: we're widening a) way to hit the emulator in the first
>>>> place. (Plus, as said, the issue with the not really tidy P2M type system.)
>>>
>>> But the hit would be limited to domains having r/o p2m_mmio_direct
>>> entries in the p2m, as otherwise the path would be unreachable?
>>
>> I fear I don't follow - all you look for in the newly extended conditional
>> is the type being p2m_mmio_direct. There's no r/o-ness being checked for
>> until we'd make it through the emulator and into subpage_mmio_accept().
> 
> Well, it's a write page-fault of a type with p2m_mmio_direct.  What
> about limiting the path even further by checking for mmio_ro_ranges:
> 
>     if ( (p2mt == p2m_mmio_dm) ||
>          (npfec.write_access &&
>           (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
>            /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
>            (p2mt == p2m_mmio_direct &&
>             rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn))))) )
>     {

Yes, this would make me quite a bit less nervous.

Jan

