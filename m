Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A09DA55A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844593.1260086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEv6-0002AH-3Y; Wed, 27 Nov 2024 10:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844593.1260086; Wed, 27 Nov 2024 10:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGEv5-00027r-Vs; Wed, 27 Nov 2024 10:05:15 +0000
Received: by outflank-mailman (input) for mailman id 844593;
 Wed, 27 Nov 2024 10:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGEv5-0001bw-1F
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:05:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 165e1c15-aca7-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 11:05:10 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3824446d2bcso5849757f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 02:05:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbf2b29sm15874392f8f.107.2024.11.27.02.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 02:05:09 -0800 (PST)
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
X-Inumbo-ID: 165e1c15-aca7-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE2NWUxYzE1LWFjYTctMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzAxOTEwLjg1MDM2MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732701910; x=1733306710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XbN0fTqnwZN/9GMSVARgsA9xzl0rOvRlu2VemrrXBqo=;
        b=Ha0BcRzyps5jr9eeFyjltz+vIgvbYKobcsOvyYN+uUEhQix7tLAgN9i5P7JrT0pE9k
         zTTPKQLXkomcODBcYAy8hZ9lMkEW/eMkG/5WUbhZkgL8wEmdmbH9OnmbqbipSJ6QJmfb
         hFkRvSQsfhsLnEGlvVHVaxybnxb/aj+m29x7l107KjTP2bKWgPxtzXxJ990cnkEMl91d
         kUUrXPkTvfnX5rTomoS7v9qIGKSpxt71YJtyucMHqDa8mlL0NOFUGaj5pklnfy4fhSOt
         duKAl1erbQEoCb0o4C6BwRN4DHGJ/5PQTh3O7gp4YfbQUIUq6K6n8L+4O+Tvc3kPkOyJ
         mG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701910; x=1733306710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbN0fTqnwZN/9GMSVARgsA9xzl0rOvRlu2VemrrXBqo=;
        b=VEJmqHp8cmrNX4bHIOZmX0xOofW56jpg3c1DTD2HseqEIoPyn1pWIkjNEl8aQQyAo+
         ACCFKHcV762Qn9aijcrvOb86b7xHAMj2txEUqFTDDspIxouF2lizaMHoY7A+xSEv9aXL
         xhXAKqwyPW7dgjh3Wtz31S++4DB48VR2KXeRBctra0eWFnXZdBTEEjjAPMB3EXKPGyJd
         myWzlwnKoF4fr5I+ORFl1sVekQtYvx4mOPjpgHehkcMgQJDGiMukpeih+fLsrAh9HyX2
         hXbSNv4G3qBJ6vepAhAz4Ogcfb9PVmK8noidtc58hx1yGtRIpgMpMGrLwkckd4pDTFQW
         ZW9g==
X-Forwarded-Encrypted: i=1; AJvYcCV20Aswt0xhZp/mzfpo14OsPELO18yyL6NnEgz79mDdTWv1VFucOTK9KI1C6tSD9Pbe5PebUKsEM8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzDM64/oJQkkaVcNwqq4fm+Z8u57hHQCCmP4wP8Yjj5CPi6oPK
	HKstpBQ7HL7SM3LtbsaO2caUC+DgwkWcsLNGGKyAFjA2mCk0XpRAbPZ8SpleqQ==
X-Gm-Gg: ASbGnct8Y/xE/s0auZ8SQae0Np10JTf4ABfFVuV/GdSn6UnODzO/l9Fp8SX5wPwElw9
	MGK8KXHqCId3srWmNBDXTldLspCDKGVF8Wbem/Ua8X8X/Qp8aPTsunrINRpLa0GnpE8VJP/bki9
	r8nyrZ43aKJfNw1QdgZLknCtJTGRMzCRkkqhELgJ/TaNEcR9G4nHEtqOD9cHIn6YVgNIUTGbI02
	RZ3puaaOBqA2q6AehHYwEba0DXwp4hZsKx236wGgb3YjumfXghK8mc8RYo8ebwxdXCMi7rH0HAn
	zviMdri/KoRD4JRdwBR0bKMaGY2NHrpnPrQ=
X-Google-Smtp-Source: AGHT+IGncZKls3asm/pUuE5CeZx6sbvc4b8607Ecs9neY3O8quJyH/QidD1ZukbHwCAqPD1UU1Ks7g==
X-Received: by 2002:a5d:584c:0:b0:382:4f7a:7a87 with SMTP id ffacd0b85a97d-385c6edd128mr1965953f8f.48.1732701910172;
        Wed, 27 Nov 2024 02:05:10 -0800 (PST)
Message-ID: <1fccb300-ffec-40c2-8eff-c8a7a97c29c7@suse.com>
Date: Wed, 27 Nov 2024 11:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86: re-work memcpy()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <c2aa4307-230b-4287-b9e4-6d7d84dba490@suse.com>
 <2cb12ee6-3acd-4667-9882-4d36466a7da8@citrix.com>
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
In-Reply-To: <2cb12ee6-3acd-4667-9882-4d36466a7da8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 20:16, Andrew Cooper wrote:
> On 25/11/2024 2:28 pm, Jan Beulich wrote:
>> Move the function to its own assembly file. Having it in C just for the
>> entire body to be an asm() isn't really helpful. Then have two flavors:
>> A "basic" version using qword steps for the bulk of the operation, and an
>> ERMS version for modern hardware, to be substituted in via alternatives
>> patching.
>>
>> Alternatives patching, however, requires an extra precaution: It uses
>> memcpy() itself, and hence the function may patch itself. Luckily the
>> patched-in code only replaces the prolog of the original function. Make
>> sure this remains this way.
>>
>> Additionally alternatives patching, while supposedly safe via enforcing
>> a control flow change when modifying already prefetched code, may not
>> really be. Afaict a request is pending to drop the first of the two
>> options in the SDM's "Handling Self- and Cross-Modifying Code" section.
>> Insert a serializing instruction there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We may want to consider branching over the REP MOVSQ as well, if the
>> number of qwords turns out to be zero.
>> We may also want to consider using non-REP MOVS{L,W,B} for the tail.
> 
> My feedback for patch 2 is largely applicable here too.

Sure, and I'll apply here whatever we decide to do there.

>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -153,12 +153,14 @@ void init_or_livepatch add_nops(void *in
>>   * executing.
>>   *
>>   * "noinline" to cause control flow change and thus invalidate I$ and
>> - * cause refetch after modification.
>> + * cause refetch after modification.  While the SDM continues to suggest this
>> + * is sufficient, it may not be - issue a serializing insn afterwards as well.
> 
> Did you find a problem in practice, or is this just in case?

It's been too long, so I can now only guess that it's just in case. The
comment change, otoh, suggests otherwise.

> I suspect if you are seeing problems, then it's non-atomicity of the
> stores into memcpy() rather than serialisation.

How would atomicity (or not) matter here? There shouldn't be any difference
between a single and any number of stores into the (previously executed)
insn stream.

>>   */
>>  static void init_or_livepatch noinline
>>  text_poke(void *addr, const void *opcode, size_t len)
>>  {
>>      memcpy(addr, opcode, len);
>> +    cpuid_eax(0);
> 
> This whole function is buggy in a couple of ways, starting with the
> comments.
> 
> The comment about noinline and control flow changes is only really
> relevant to 32bit processors; we inherited that comment from Linux, and
> they're not applicable to Xen.
> 
> AMD64 (both the APM, and SDM) guarantee that Self Modifying Code will be
> dealt with on your behalf, with no serialisation needed.
> 
> Cross-modifying code needs far more severe serialisation than given
> here.  We get away with it because alternative_{instructions,branches}()
> are pre-SMP, and apply_alternatives() is on livepatches prior to them
> becoming live.
> 
> 
> I happen to know there's an AMD CPU which has an erratum regarding Self
> Modifying Code and genuinely does need a serialising instruction, but I
> don't know which exact CPU it is.

Maybe I ran into that on one of the two older AMD systems I routinely
test on every once in a while?

> If we're going to put a serialising instruction, it should be a write to
> CR2.  We don't care about 486 compatibility, and it's faster than CPUID
> and much much faster if virtualised because it's unlikely to be
> intercepted even under shadow paging.
> 
> But, it would be nice not to put serialisation in the general case to
> begin with, especially not into the livepatching case.

If you're aware of an erratum there, how can we get away without any
serialization? I can surely switch to a CR2 write, and I can also make
this dependent upon system_state (thus excluding the LP case).

I notice that arch_livepatch_{apply,revert}() indeed use plain memcpy()
with just the noinline "protection". I wonder how well that works if a
livepatch actually touched the tail of either of these functions
(however unlikely that may be).

Jan

