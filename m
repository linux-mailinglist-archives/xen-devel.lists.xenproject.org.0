Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED06A1A12A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 10:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876111.1286474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tatqH-0000jB-15; Thu, 23 Jan 2025 09:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876111.1286474; Thu, 23 Jan 2025 09:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tatqG-0000g3-UY; Thu, 23 Jan 2025 09:49:40 +0000
Received: by outflank-mailman (input) for mailman id 876111;
 Thu, 23 Jan 2025 09:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tatqF-0000fx-IT
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 09:49:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5befa02f-d96f-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 10:49:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so6760905e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 01:49:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31ddef8sm54926105e9.35.2025.01.23.01.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 01:49:36 -0800 (PST)
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
X-Inumbo-ID: 5befa02f-d96f-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737625777; x=1738230577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1LygtcFDAU1z8CMYGmvaUpsVoDP57AchSXyWewGKPgM=;
        b=MGaa2OYIoVqkVpqwF7ndQo4ktMPv7GJb47cnu/yfHToWna+CKf2okGgDXW7iq732Sz
         t2gy4sLGlNJMWSNHHyd1RLUyLV0ajJv5vayEYSF52ZJpy46U440YtxG8omIwjE8D/M+r
         FVAcx68bYhdjHsDv8WfLlrtRADW9813cd01zxPdJXTlJ1XaOoJUzA1wysIJ7As3pzBMB
         bIRfIi//zs16K2a3cWpZ4WXxe85YVNtlmj8IUhp5HrqziIn8G5rhvZlrppTanOt/XB+9
         8nX2W76x4GOmNJ9E8U41AHSBIqe5g02CfwXQul2qyW7XHnWlLp8jDcc44BzNXQJ6yL+P
         ITSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625777; x=1738230577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LygtcFDAU1z8CMYGmvaUpsVoDP57AchSXyWewGKPgM=;
        b=HmHNN363FbCPfV3i3+7NXTIWPorROoGkqY1OdOGHVAA9SGB5LbgTd+JplWigmKh7Rd
         7OupjxEtZlPjFp14kIa1ulwGV/Av1U/ruWHzSZq3/aRFOudoLx/lTTAH9UR2Zdvn9Ojc
         O7aum1Tw2zXXHYDom2gxwdEbi03i3PYey2iY9u5UvYRySZK1o9btc+zfyZaRD5GxsTg4
         kDFPFSWBTNXDdTQTaA+zDB+u9j2kOIYmeZ3/VSREdrWYsv6w39yr1XCSq0tjXQ41QTxL
         YJoJtorV8cRLcyxgu/cQo7JjnTQ2d9gFPBDEUqGJzCMOm72nJ2friAFnojcXmtpgRTpr
         CVzA==
X-Gm-Message-State: AOJu0YwI3aIBj9oCrIIRh1zHrDIZdXnjAZp0zkFDuYnVY6qd/l3wRVle
	5Cw7S3h8yJk5Mpt0qfvKs5qi2JE9tsOtt5XfuRYc33gRm+siLy4hh2fzRlhiPA==
X-Gm-Gg: ASbGncvnSUadtI2WW7vF+Fd8LnfBwjd1zd+VhBG8/u//rEyDKJx/7DfzR1UqH3NUJjq
	pVhw26c/PoSJUlD+wVV1iDC4EKbVCxAKTStSdntenc0QwqcUEL21XIjPGXO4baHM941wocJYMo3
	NLEDvCOGcPfWfl8KZyOJKOqyXriHhVR2b6IeVHyoG1szZQ9sFw9R2Iov7J424lxET0B2OuHXY3+
	mIt92s+j7M9iWElJIPR0U8XEcd0a36wI+h/ciTzf0v2xZ+PCgWLZ5LaeutNRLB2IBFRj1dXI4lW
	pkzYX3r1dTXr/45z7cmoyqpQOwHfFI9OMOipTU9Z4Z/YBE8zp2w6mx2vrEXcvMCKUA==
X-Google-Smtp-Source: AGHT+IE4LxbkZ37r/V0zkEhESf7PJtGARK5SXTxdC+coikfBbCF9o4g6uesG5UofvLK7HTsz1BXSnw==
X-Received: by 2002:a05:600c:1f8c:b0:436:fb02:e90 with SMTP id 5b1f17b1804b1-438913cdaa8mr271546785e9.10.1737625777235;
        Thu, 23 Jan 2025 01:49:37 -0800 (PST)
Message-ID: <41e6c4a5-d5c4-40a2-a8c6-f6b5bba70f8c@suse.com>
Date: Thu, 23 Jan 2025 10:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/HVM: correct read/write split at page
 boundaries
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <fde70079-4084-4aa6-b76e-becd62a71ddb@suse.com>
 <Z5Euyc91PZsyMP6f@macbook.local>
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
In-Reply-To: <Z5Euyc91PZsyMP6f@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.01.2025 18:45, Roger Pau Monné wrote:
> On Tue, Oct 01, 2024 at 10:49:40AM +0200, Jan Beulich wrote:
>> The MMIO cache is intended to have one entry used per independent memory
>> access that an insn does. This, in particular, is supposed to be
>> ignoring any page boundary crossing. Therefore when looking up a cache
>> entry, the access'es starting (linear) address is relevant, not the one
>> possibly advanced past a page boundary.
>>
>> In order for the same offset-into-buffer variable to be usable in
>> hvmemul_phys_mmio_access() for both the caller's buffer and the cache
>> entry's it is further necessary to have the un-adjusted caller buffer
>> passed into there.
>>
>> Fixes: 2d527ba310dc ("x86/hvm: split all linear reads and writes at page boundary")
>> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This way problematic overlaps are only reduced (to ones starting at the
>> same address), not eliminated: Assumptions in hvmemul_phys_mmio_access()
>> go further - if a subsequent access is larger than an earlier one, but
>> the splitting results in a chunk to cross the end "boundary" of the
>> earlier access, an assertion will still trigger. Explicit memory
>> accesses (ones encoded in an insn by explicit or implicit memory
>> operands) match the assumption afaict (i.e. all those accesses are of
>> uniform size, and hence they either fully overlap or are mapped to
>> distinct cache entries).
>>
>> Insns accessing descriptor tables, otoh, don't fulfill these
>> expectations: The selector read (if coming from memory) will always be
>> smaller than the descriptor being read, and if both (insanely) start at
>> the same linear address (in turn mapping MMIO), said assertion will kick
>> in. (The same would be true for an insn trying to access itself as data,
>> as long as certain size "restrictions" between insn and memory operand
>> are met. Except that linear_read() disallows insn fetches from MMIO.) To
>> deal with such, I expect we will need to further qualify (tag) cache
>> entries, such that reads/writes won't use insn fetch entries, and
>> implicit-supervisor-mode accesses won't use entries of ordinary
>> accesses. (Page table accesses don't need considering here for now, as
>> our page walking code demands page tables to be mappable, implying
>> they're in guest RAM; such accesses also don't take the path here.)
>> Thoughts anyone, before I get to making another patch?
>>
>> Considering the insn fetch aspect mentioned above I'm having trouble
>> following why the cache has 3 entries. With insn fetches permitted,
>> descriptor table accesses where the accessed bit needs setting may also
>> fail because of that limited capacity of the cache, due to the way the
>> accesses are done. The read and write (cmpxchg) are independent accesses
>> from the cache's perspective, and hence we'd need another entry there.
>> If, otoh, the 3 entries are there to account for precisely this (which
>> seems unlikely with commit e101123463d2 ["x86/hvm: track large memory
>> mapped accesses by buffer offset"] not saying anything at all), then we
>> should be fine in this regard. If we were to permit insn fetches, which
>> way to overcome this (possibly by allowing the write to re-use the
>> earlier read's entry in this special situation) would remain to be
>> determined.
> 
> I'm not that familiar with the emulator logic for memory accesses, but
> it seems like we are adding more and more complexity and special
> casing.  Maybe it's the only way to go forward, but I wonder if there
> could be some other way to solve this.  However, I don't think I
> will have time to look into it, and hence I'm not going to oppose to
> your proposal.

I'll see what I can do; it's been quite a while, so I'll first need to
swap context back in.

> Are there however some tests, possibly XTF, that we could use to
> ensure the behavior of accesses is as we expect?

Manuel's report included an XTF test, which I expect will become a part
of XTF once this fix went in. I fear though that there is an issue
Andrew has been pointing out, which may prevent this from happening
right away (even if with osstest having disappeared that's now only a
latent issue, until gitlab CI would start exercising XTF): With the
issue unfixed on older trees (i.e. those remaining after this series
was backported as appropriate), the new test would fail there.

>> @@ -1030,7 +1040,11 @@ static struct hvm_mmio_cache *hvmemul_fi
>>              return cache;
>>      }
>>  
>> -    if ( !create )
>> +    /*
>> +     * Bail if a new entry shouldn't be allocated, utilizing that ->space has
>                                                       ^rely on ->space having ...
> Would be easier to read IMO.

Changed; I'm not overly fussed, yet at the same time I also don't really
agree with your comment.

>> @@ -1064,12 +1079,14 @@ static void latch_linear_to_phys(struct
>>  
>>  static int hvmemul_linear_mmio_access(
>>      unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
>> -    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool known_gpfn)
>> +    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
>> +    unsigned long start, bool known_gpfn)
> 
> I think start is a bit ambiguous, start_gla might be clearer (same
> below for the start parameter).

Fine with me - changed for all three hvmemul_linear_mmio_*(). It wasn't
clear to me whether you also meant the local variables in
linear_{read,write}(); since you said "parameter" I assumed you didn't.
If you did, I fear I'd be less happy to make the change there too, for
"addr" then preferably also wanting to change to "gla". Yet that would
cause undue extra churn.

>> @@ -1182,8 +1202,17 @@ static int linear_read(unsigned long add
>>       * an access that was previously handled as MMIO. Thus it is imperative that
>>       * we handle this access in the same way to guarantee completion and hence
>>       * clean up any interim state.
>> +     *
>> +     * Care must be taken, however, to correctly deal with crossing RAM/MMIO or
>> +     * MMIO/RAM boundaries. While we want to use a single cache entry (tagged
>> +     * by the starting linear address), we need to continue issuing (i.e. also
>> +     * upon replay) the RAM access for anything that's ahead of or past MMIO,
>> +     * i.e. in RAM.
>>       */
>> -    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_READ, false) )
>> +    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
>> +    if ( !cache ||
>> +         addr + bytes <= start + cache->skip ||
>> +         addr >= start + cache->size )
> 
> Seeing as this bound checks is also used below, could it be a macro or
> inline function?
> 
> is_cached() or similar?

Hmm. Yes, it's twice the same expression, yet that helper would require
four parameters. That's a little too much for my taste; I'd prefer to
keep things as they are. After all there are far more redundancies between
the two functions.

Jan

