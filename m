Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A3A5FABA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912710.1318926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl3N-0001ZT-JZ; Thu, 13 Mar 2025 16:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912710.1318926; Thu, 13 Mar 2025 16:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsl3N-0001Wp-GL; Thu, 13 Mar 2025 16:05:01 +0000
Received: by outflank-mailman (input) for mailman id 912710;
 Thu, 13 Mar 2025 16:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsl3M-0001Wj-7b
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:05:00 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9c837c4-0024-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:04:59 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso751463f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:04:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb93csm2477824f8f.86.2025.03.13.09.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:04:57 -0700 (PDT)
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
X-Inumbo-ID: e9c837c4-0024-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881898; x=1742486698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mht0CqFatkavZUCujSOMKWBb+34y0o2M1haVteYrMFI=;
        b=UKbxjEOBuzczaMTbGqm8XX+jSVuao1uVoelnVqcZSGQs7al9A0xqfYGs8ynjoESyaF
         KpN/WsgOySpKH2vi1QYUZI1VKHAuv8UNlnaNF54hPdZS5LSSgvf24MTIt2TBUhBcYHl/
         N4XO5YHndjfozYj8JoYfxTP4VwuyeV63zA9CO8+sy9tTSVhP7znjxQLUtuglPyoqrPwO
         TMRdeotg211oaUExJnXTEZEyxshM07LZ6RwNFQ89e385OP9CHMt8zk7GBTxCXUAln+QQ
         /OSBcRcAZHo5WCoOMktLqHdu9JikOIw1ZOPTLw17PUelW/0HuLGiP5Mbu+/VQJcXTBNY
         m3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881898; x=1742486698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mht0CqFatkavZUCujSOMKWBb+34y0o2M1haVteYrMFI=;
        b=EFflVfxWh7fO6N1+ZNsLxY9XtK0sQQJQRBEQh5US3Vg37wOkHtxrn5z4U9+/jfqBTj
         TRhasgfPKkmajAAbkfIQLAjB/nVwrrCm2QvKC4dIL8AjqcmRKE00jEAdBJS/RKo03GQD
         RsSSHH7ZORVQj6NFvEF11lKRE0kN/ALA3HGGxDmW7WHCuOv8YI2AX0nI0X5bKHfRpv4U
         j1B1j7YtEg6fNhTwR2mpfjA9SbmVtB+N3Huz0uNe+Cl0nKb7tDXHUOWBZpP2cHs/xAHp
         0BkWotwePzfRhF/vZ6WALFN9lZOZUhqfmUEA96MBSY4c6uzP7iUm3/irXaXBpnEap5is
         Mg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw/zoiOL8ox783aT1APpi4pOE3ahyDhTEWs/3Bz5SRt7JhAbGEF4OIA4u4KuWAXhST7OK1JA2Vp/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx30bvDSYC97Q1KakMNxZGk4R0loljjY60X7kq7NObWBUJRpohD
	gKnqtFWMF0zlcodI6uzHfv54J3hXWe7lHGetR2FtS/ejampKXZNUk1m7b3CLGA==
X-Gm-Gg: ASbGncuM4vL7lBOUgAUtJYXbCTwHBLKIuXsVmcrEYJsFZW1IiW7mUj4Ob8X7Q25y4SW
	2aZQPZJi+HJGnrLGfFIy42ZExKscumR7J4UXx2cce5mX9pYxUX22SbS6xgOFYgQKAp8lM+LErEf
	9QViPLtPtFekse9LnbhewgWw94IS0AHi7y4X1IXb2TLC9LX1UL3BvJ9m8OvkDh4i2GojFjJiQjD
	ECMD7g1ZK3qPEJOKPHt9GxuRZ6E1tm+10o0D8HNv0bEs9EC0ghRCV5mRjqoMCXMh288UfRt3hcc
	XVz48WOGxw8ewi3Mrp0fEisjnT/v4urh2dh42ZdI/965xqWt2ZwC2ba2pHKdWaZhFP9axHnrfRH
	+JmLhym3C+6WsVPWoGVM2KBRMGqLzlg==
X-Google-Smtp-Source: AGHT+IHSam/va56o6PJHmcF5F9ImBqrMbEdPRzP9dMlPoeoJw17vUCosc68Dkf2qQoWw2OOpVuaZKw==
X-Received: by 2002:a5d:5f45:0:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-396c175433amr93697f8f.12.1741881897926;
        Thu, 13 Mar 2025 09:04:57 -0700 (PDT)
Message-ID: <7dc4edc7-7d2c-4108-bc3d-d5a5e125205e@suse.com>
Date: Thu, 13 Mar 2025 17:04:56 +0100
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
 <e455a54f-d2d9-4b6e-833f-67b62b8f6a88@suse.com>
 <344d9f0a-4b91-4af7-b0aa-b5fbe730477d@citrix.com>
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
In-Reply-To: <344d9f0a-4b91-4af7-b0aa-b5fbe730477d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 16:44, Andrew Cooper wrote:
> On 13/03/2025 3:39 pm, Jan Beulich wrote:
>> On 13.03.2025 16:35, Andrew Cooper wrote:
>>> On 13/03/2025 1:52 pm, Jan Beulich wrote:
>>>> ... before making changes to the involved logic.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
>>>> when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
>>>> arrange $(all_symbols) calculation" would want pulling ahead.)
>>>>
>>>> --- a/xen/common/symbols.c
>>>> +++ b/xen/common/symbols.c
>>>> @@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
>>>>      return 0;
>>>>  }
>>>>  
>>>> +#ifdef CONFIG_SELF_TESTS
>>>> +
>>>> +static void __init test_lookup(unsigned long addr, const char *expected)
>>>> +{
>>>> +    char buf[KSYM_NAME_LEN + 1];
>>>> +    const char *name, *symname;
>>>> +    unsigned long size, offs;
>>>> +
>>>> +    name = symbols_lookup(addr, &size, &offs, buf);
>>>> +    if ( !name )
>>>> +        panic("%s: address not found\n", expected);
>>>> +    if ( offs )
>>>> +        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);
>>>> +
>>>> +    /* Cope with static symbols, where varying file names/paths may be used. */
>>>> +    symname = strchr(name, '#');
>>>> +    symname = symname ? symname + 1 : name;
>>>> +    if ( strcmp(symname, expected) )
>>>> +        panic("%s: unexpected symbol name: '%s'\n", expected, symname);
>>>> +
>>>> +    offs = symbols_lookup_by_name(name);
>>>> +    if ( offs != addr )
>>>> +        panic("%s: address %#lx unexpected; wanted %#lx\n",
>>>> +              expected, offs, addr);
>>>> +}
>>>> +
>>>> +static void __init __constructor test_symbols(void)
>>>> +{
>>>> +    /* Be sure to only try this for cf_check functions. */
>>> I'm very happy to see the take-up of SELF_TESTs.  Although I probably
>>> ought to tie it into a Kconfig option to make the errors non-fatal,
>>> which I've been meaning to do for a bit.
>>>
>>> One question though.  cf_check is an x86-ism, even if it leaks out into
>>> common code.
>>>
>>> I think you mean "functions emitted into the final image"?  If so, I
>>> don't think this is relevant then, because ...
>>>
>>>> +    test_lookup((unsigned long)dump_execstate, "dump_execstate");
>>>> +    test_lookup((unsigned long)test_symbols, __func__);
>>> ... taking the function address here forces it to be emitted even if it
>>> would otherwise have been inlined.
>> No, I really mean cf_check. If we took the address of a non-cf_check
>> function, the special gcc13 build's checking would trigger, aiui.
> 
> It's GCC-11 sadly.  cf_check is part of the function type, and triggers
> when a function type check would be relevant.  Just casing to an integer
> won't trigger it, I don't think.

Is there a way to double check? I'd be happy to drop that comment (and
use some other, maybe less random function), but I don't have a compiler
available that includes that patch.

Jan

