Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7F960917
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783873.1193169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuaA-0003TF-Gn; Tue, 27 Aug 2024 11:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783873.1193169; Tue, 27 Aug 2024 11:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuaA-0003Qv-DG; Tue, 27 Aug 2024 11:41:54 +0000
Received: by outflank-mailman (input) for mailman id 783873;
 Tue, 27 Aug 2024 11:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siua8-0003Qn-TZ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:41:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 595d790a-6469-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 13:41:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so568979866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 04:41:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549ce0dsm100047666b.60.2024.08.27.04.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 04:41:49 -0700 (PDT)
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
X-Inumbo-ID: 595d790a-6469-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724758910; x=1725363710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/bHfEEyVYzSSYEBlTJgpv6g284H8wooJj00XUhug/k=;
        b=gPfKJIliYbIqXy7rEwpu5KJho3aGbQq/xwcRJGoCs5kD3g64cRg7DswSf06Rz1C0e1
         ojQQDEQJoioezaJSiYzjjZBrbAhTFckrctnJsr9tbKEQ8c1L2fAUWqI8xVS5QCv4mP0m
         EUeUCl8OgKmMGJWB3rHFX4u8XTaFEDliaDenQLY0p0yP/gbgBFAed77yjuBex+IW6juI
         zZCc9QP139ul6q6cgIasWlD40V58VTPOyIOsC3rZqSYORgzeW/0jF/XG9bPw8lsOpNd/
         7/v46dQsku7QDLJ2LFZkIURGa1/cazBAR1EuZQ5erPpesBc0mYHbhS2mttcYNM//qK3V
         BL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758910; x=1725363710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/bHfEEyVYzSSYEBlTJgpv6g284H8wooJj00XUhug/k=;
        b=m7a6z4git0RUCFNBo8ZM5Xl0cQ6Ti7ZdETD5MtHVFv9CpzigMbIn9GBd2ScGmR9HUJ
         wsWabfCPStj2XuoIJsI3Lcp2ZF8KHJlocLrWGmC4m1zUsG8agRdrSZmmGxHnUOs+BlDn
         fZITvNBYxMDKzW/fYB5E7m77DBbFZ+JoXQhTq2vjmwOHqmlxf6OnkxbnQFhJJdIBS+WB
         LwTFHLwqRppBdpk5qIKxJaG6i1qbOhOW1ifJ7oAsI+6AzA6tc24HZsb1MniyqvUo1EEg
         dKVHo+rsInHP4C0F90Tjsi3WsQ5EeHVPOvObg3CU5OjYQoZibKxoWq33lisYp8OOQtpv
         S14A==
X-Forwarded-Encrypted: i=1; AJvYcCVLBGLJqc4iKsODzm0qZ5+JZ81A9mFEbLDV5OvjTeHy0ArqAKnM68rFGKp8zFwPAiI+i1ut5ts+rTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5TJXRMhS+LNPxnxTdrSoQIHkWvsRyibc+vKAaw4ywMNVUtK4j
	T44L9/EfUX2gNXGqotckZcksz1KrSbX9RvOseEWTI5PhR5AXOIiiWUoTp0e0FQ==
X-Google-Smtp-Source: AGHT+IHwpgTcYAQ3XuYdWXktS1RzaimHnG//f+wWwVplaBzx+kknh8NXoetphMG0u6LWKloVWS2jBQ==
X-Received: by 2002:a17:907:2cc6:b0:a86:7021:1368 with SMTP id a640c23a62f3a-a86e39dc9b2mr199287966b.21.1724758909956;
        Tue, 27 Aug 2024 04:41:49 -0700 (PDT)
Message-ID: <265ea113-5e9e-4829-9a22-24ed9e1cae69@suse.com>
Date: Tue, 27 Aug 2024 13:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xen/bitops: Introduce generic_hweightl() and
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-6-andrew.cooper3@citrix.com>
 <14c385ce-c61d-48e3-aa09-7b450af34b6c@suse.com>
 <f5bac01b-74d6-41c4-b3c5-ad595d6de378@citrix.com>
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
In-Reply-To: <f5bac01b-74d6-41c4-b3c5-ad595d6de378@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 12:39, Andrew Cooper wrote:
> On 26/08/2024 12:40 pm, Jan Beulich wrote:
>> On 23.08.2024 01:06, Andrew Cooper wrote:
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
>>  unsigned int __pure generic_ffsl(unsigned long x);
>>  unsigned int __pure generic_flsl(unsigned long x);
>>  
>>> +/*
>>> + * Hamming Weight, also called Population Count.  Returns the number of set
>>> + * bits in @x.
>>> + */
>>> +unsigned int __pure generic_hweightl(unsigned long x);
>> Aren't this and ...
>>
>>> @@ -284,6 +290,18 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>>>          (_v & (_v - 1)) != 0;                   \
>>>      })
>>>  
>>> +static always_inline __pure unsigned int hweightl(unsigned long x)
>> ... this even __attribute_const__?
> 
> Hmm.  This is following fls(), but on further consideration, they should
> be const too.
> 
> I'll do a prep patch fixing that, although I'm going to rename it to
> __attr_const for brevity.
> 
> Much as I'd prefer __const, I expect that is going too far, making it
> too close to regular const.

I was actually going to suggest using that name, if we want to shorten
__attribute_const__. Yes, gcc treats __const (and __const__) as
keywords, but do we care (much)? All it requires is that we don't start
using __const as a (real) keyword.

Of course __const is a good example of why really we shouldn't use
double-underscore prefixed names anywhere. Any of them can be assigned
a meaning by the compiler, and here that's clearly the case. Therefore,
taking your planned rename, maybe better make it attr_const then? And
eventually switch stuff like __packed, __pure, and __weak to attr_* as
well? Or even introduce something like

#define attr(attr...) __attribute__((attr))

and use attr(const) here?

>>> +{
>>> +    if ( __builtin_constant_p(x) )
>>> +        return __builtin_popcountl(x);
>> How certain are you that compilers (even old ones) will reliably fold
>> constant expressions here, and never emit a libgcc call instead? The
>> conditions look to be more tight than just __builtin_constant_p(); a
>> pretty absurd example:
>>
>> unsigned ltest(void) {
>>     return __builtin_constant_p("") ? __builtin_popcountl((unsigned long)"") : ~0;
>> }
> 
> How do you express that in terms of a call to hweightl()?

hweightl((unsigned long)"");

Yet as said - it's absurd. It merely serves to make the point that what
__builtin_constant_p() returns true for doesn't necessarily constant-
fold in expressions.

> Again, this is following the layout started with fls() in order to avoid
> each arch opencoding different versions of constant folding.
> 
> https://godbolt.org/z/r544c49oY
> 
> When it's forced through the hweightl() interface, even GCC 4.1 decides
> that it's non-constant and falls back to generic_hweightl().
> 
> 
> I did spend a *lot* of time with the fls() series checking that all
> compilers we supported did what we wanted in this case, so I don't
> expect it to be a problem.

Right, and I guess I was pointlessly more concerned about popcount than
I was for ffs() / fls(). The criteria upon which gcc decides whether to
constant-fold the uses is exactly the same.

>  But, if a library call is emitted, it will
> be very obvious (link failure), and we can re-evaluate.

Indeed, we certainly would notice, albeit the diagnostic may be cryptic
to people.

Bottom line - keep it as is.

Jan

