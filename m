Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8865A5FA2A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912596.1318856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsken-0005Oo-5r; Thu, 13 Mar 2025 15:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912596.1318856; Thu, 13 Mar 2025 15:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsken-0005MP-2v; Thu, 13 Mar 2025 15:39:37 +0000
Received: by outflank-mailman (input) for mailman id 912596;
 Thu, 13 Mar 2025 15:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskem-0005MJ-Bq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:39:36 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bb78f1c-0021-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:39:32 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so940890f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:39:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b748bsm2527483f8f.39.2025.03.13.08.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:39:33 -0700 (PDT)
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
X-Inumbo-ID: 5bb78f1c-0021-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741880374; x=1742485174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sUnEOnR1zyTLTcZwPe45QpQ9c6dxOs1+SiaaUG4/NsU=;
        b=QGuHI/RY2paJitKhT6hg9EDhbBhewAfdkBggKHN1CtiRGZC8OqbkkvdIUqnGN2aNCI
         yhMu62bc5Gw9pkdU/DeCSEwlyOGcxE5y+770kreYdbkDZPzxAw3yJ+iGGFF13T+5v0M8
         CZ9hNa0Q+0UifNyWx3W6RIoUklC4HjyQ04KEOu4PZB2cEfk34k9hk/5Ynmt5wf2fmM1l
         SR1FhOM6FKdppAcZoscH+MCLw/Hk+68Het/NR7WZRc3JkGdjptIgCukaxirR1wDmOzYK
         txN2ID8qWobg1DwCPIiNl6jc3xBkV5nO9IhuxSNFSN/Lw0G/kvV07/oRDemj7B6jSrdm
         4iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880374; x=1742485174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUnEOnR1zyTLTcZwPe45QpQ9c6dxOs1+SiaaUG4/NsU=;
        b=lIT7xdAH2MQ+QbKdxI5hkMbNq7Vsm7kvSel8qLws2rj/a1pdi9IY8uLNhvokM63T5D
         zeQhiTS/2JOoRMStTZZgSka75emAUKUZiFE5P92+oB34EV8A+tRPhpEydLAZjIPvk4F3
         BGCwtkKa7H/w6krOcsY7G8iNrolWM1eqWA2wnbCC8l7pYoJtJKXzffonxiAWKDSDIV6C
         WpYlis/FpDcIELo99EKaLYobDXCIa73vtuE9jxln4kgbHxKMF/nlXgjqQ4X5J6TKVdSQ
         r2gz9DasQKHPbNi4nh+WtbuH7w1wgLINPgmHV4ENR1zJphqs1MKr84tL1ES1hZQ3H7jQ
         inzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDAK7nbbdz/vo/4eIMeEq7TzM4joptfPA5P3GH0LmyRZ/d2aHle+o2dWIVoZgxdmuUAIahWayNepk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIVNis7P1h5MpOJgUy8daWVKEQbSsH1y7W7/oBpWLlbBMQKOYM
	MZigcdYET+sgx5Dn02ZlxASQK9yOSpBqiCE7o4Q6Q1RV9wbGj02mUfVC4co4dQ==
X-Gm-Gg: ASbGnctLqXaAQAg6VYl0WOuAzZNy94uQO1A/JnyDDrkb2eyIc0xYHeU9QypojKoMaWR
	CSGhF4St7p/xQfYQ6SeFRwZttIPg0g1S6+MgviXc2ycPQZwXGrVZSFcstze5HxZwNL7p4Pru7bU
	jxPNKREtZpdStbmfQLkkZkvUQBCCtHkpvlvMrwZumh24Vp2XjaDKI1hFD8XOJS1jUqzNiojdek8
	KlXSvnl2Gb2iT0hQluSRKHyuTq55W4C9ml7aLwLL2XyE4nBWr3xIPDmnV/MCjeBpEvqWD6prHAv
	489RAI0VlNDF7QZIlF+4rGTWgKBwcAT3P3m+fwZQZsYbdw9ytzlqLouDUead3xVQptOejD7+Zsd
	y8ulOcSq1tjQe9lYCloeZQuLUJHoJJw==
X-Google-Smtp-Source: AGHT+IGDMOLfPauwxHT4FwMIs/9gGdptDrbZnOVxQ1iNbl9oOK1GazWczXlJsT7Dbr7XYCMpTp+K9A==
X-Received: by 2002:a5d:6d09:0:b0:38f:4fa6:68df with SMTP id ffacd0b85a97d-39132dbca7amr24322718f8f.51.1741880373826;
        Thu, 13 Mar 2025 08:39:33 -0700 (PDT)
Message-ID: <e455a54f-d2d9-4b6e-833f-67b62b8f6a88@suse.com>
Date: Thu, 13 Mar 2025 16:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] symbols: add minimal self-test
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <a556439c-b652-4789-bbdd-6d6402b2a124@suse.com>
 <7bc1c3c9-3c00-4b67-b4fd-9baf3e0f9cdb@citrix.com>
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
In-Reply-To: <7bc1c3c9-3c00-4b67-b4fd-9baf3e0f9cdb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 16:35, Andrew Cooper wrote:
> On 13/03/2025 1:52 pm, Jan Beulich wrote:
>> ... before making changes to the involved logic.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
>> when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
>> arrange $(all_symbols) calculation" would want pulling ahead.)
>>
>> --- a/xen/common/symbols.c
>> +++ b/xen/common/symbols.c
>> @@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
>>      return 0;
>>  }
>>  
>> +#ifdef CONFIG_SELF_TESTS
>> +
>> +static void __init test_lookup(unsigned long addr, const char *expected)
>> +{
>> +    char buf[KSYM_NAME_LEN + 1];
>> +    const char *name, *symname;
>> +    unsigned long size, offs;
>> +
>> +    name = symbols_lookup(addr, &size, &offs, buf);
>> +    if ( !name )
>> +        panic("%s: address not found\n", expected);
>> +    if ( offs )
>> +        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);
>> +
>> +    /* Cope with static symbols, where varying file names/paths may be used. */
>> +    symname = strchr(name, '#');
>> +    symname = symname ? symname + 1 : name;
>> +    if ( strcmp(symname, expected) )
>> +        panic("%s: unexpected symbol name: '%s'\n", expected, symname);
>> +
>> +    offs = symbols_lookup_by_name(name);
>> +    if ( offs != addr )
>> +        panic("%s: address %#lx unexpected; wanted %#lx\n",
>> +              expected, offs, addr);
>> +}
>> +
>> +static void __init __constructor test_symbols(void)
>> +{
>> +    /* Be sure to only try this for cf_check functions. */
> 
> I'm very happy to see the take-up of SELF_TESTs.  Although I probably
> ought to tie it into a Kconfig option to make the errors non-fatal,
> which I've been meaning to do for a bit.
> 
> One question though.  cf_check is an x86-ism, even if it leaks out into
> common code.
> 
> I think you mean "functions emitted into the final image"?  If so, I
> don't think this is relevant then, because ...
> 
>> +    test_lookup((unsigned long)dump_execstate, "dump_execstate");
>> +    test_lookup((unsigned long)test_symbols, __func__);
> 
> ... taking the function address here forces it to be emitted even if it
> would otherwise have been inlined.

No, I really mean cf_check. If we took the address of a non-cf_check
function, the special gcc13 build's checking would trigger, aiui.

Jan

