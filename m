Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92B8A5FA59
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912652.1318876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskjQ-00017w-1u; Thu, 13 Mar 2025 15:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912652.1318876; Thu, 13 Mar 2025 15:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskjP-000157-VM; Thu, 13 Mar 2025 15:44:23 +0000
Received: by outflank-mailman (input) for mailman id 912652;
 Thu, 13 Mar 2025 15:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tskjO-0000S3-RH
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:44:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 086b5c9b-0022-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:44:22 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso684540f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:44:22 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74d339sm56912695e9.14.2025.03.13.08.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:44:21 -0700 (PDT)
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
X-Inumbo-ID: 086b5c9b-0022-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741880661; x=1742485461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iu9WPGDK0FsN/SDx/oCEs9/ZX5gZ0imqRRSjrtNjX2E=;
        b=wFKu75CeT/GjFLHF6Vp8m8l2qUCf4GGU1PXz4DrZeGWZXRrbSHljLs5MtE5yjBSLLK
         YbvZb4vPiN/T5NJykvu29R/0L+QxGerar9p8UspSt9BL+6B6VGJPV/Vfozqqlarf3JWq
         fTLcSGIpKqBw8JhqR6bqreutLFsg0CrLstj54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880661; x=1742485461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu9WPGDK0FsN/SDx/oCEs9/ZX5gZ0imqRRSjrtNjX2E=;
        b=tQOL+Us/hBkotQQO2xCBmEyL+L1MMN+IPuZOaRAP7ZePsPC9oS8IfFdG23KVDPUcAI
         2p/6W74caZDpXwFg0Weaj+2R7+L+Os494s0L2wEzijf8Dd2wlM9GEvphVqQWI0SaIgm5
         /xQOe7qXhVPul4D+dSwj5UPs+cJxHP6gLT4EkSQ7NJiz6LYBnQFaz36BPVwzAVZY8Sr7
         WRma/viy2N8jSbl+SqyI9ucjlRLj0BY4zyHkvSFMVag3/gJRCwkSiWBQl0412m6XU+pr
         3b01nyhV0xj9ML3Hemw+O4HlORi3QneyxXDoxfOx0TETaESE+7y+Y8KsW26ymmBsBf67
         W0tg==
X-Forwarded-Encrypted: i=1; AJvYcCWQzSElWSvanVObkR5CBbXUGl9bOHg/zxCTtsv7bJrBH6gsdGpk4SaaFHILc6vTj4T/7k3k8k3m5Sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMGp2/CYAn0uuWf+Xdwmzd61CqgIV95QTvC7ErANmZJOZYfhr0
	xH0hYNFHulL7JLlapnMnQHyk8/+EluWlLk06kgebcLeS8icG0NVQzepPLJTNk8I=
X-Gm-Gg: ASbGncvVK7vaVvzHb13VE2rSDz+Mpb1lkgeQZUZlfKt6s11D6INuaryNDNkMyW2YMoY
	wNvu1zk6piEs0jEwZv7Pu9SYKaLL/bC1pojMaoMR4M1sCcc4tBEQDIi51oLympQ5EKntestPQPf
	IkSGbib573lz2MJwtUzu28+EZT+/BasMGUnk+YL4EBRCZ40Bn0neh7V9kSL4GSmOJGsvsNSYTYA
	GS3MtpN8POx+pTF/lQSVj2YtqQkzctl5scIZTvpF9MMMZyhYCGPh0pW8rmztWQ0Bom1LTj9Ztep
	STIMz4Bsfo5uSoR1YY4ddtfdEFTF/7pBIsKRyp1wKfmfcR3JwDtuhKxMD+Xft41S5dG4LLDo8bK
	6IEfYQ6P9
X-Google-Smtp-Source: AGHT+IH5JUoCzZb++hWWautoD2HpdzP1Vo6n0bE/MqwRgIVvp6ufmpcCH4Xo6DbHCfykHWmqp1fthw==
X-Received: by 2002:a05:6000:156a:b0:391:3fd2:610f with SMTP id ffacd0b85a97d-392641bcbfcmr12533978f8f.13.1741880661370;
        Thu, 13 Mar 2025 08:44:21 -0700 (PDT)
Message-ID: <344d9f0a-4b91-4af7-b0aa-b5fbe730477d@citrix.com>
Date: Thu, 13 Mar 2025 15:44:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] symbols: add minimal self-test
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <a556439c-b652-4789-bbdd-6d6402b2a124@suse.com>
 <7bc1c3c9-3c00-4b67-b4fd-9baf3e0f9cdb@citrix.com>
 <e455a54f-d2d9-4b6e-833f-67b62b8f6a88@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e455a54f-d2d9-4b6e-833f-67b62b8f6a88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:39 pm, Jan Beulich wrote:
> On 13.03.2025 16:35, Andrew Cooper wrote:
>> On 13/03/2025 1:52 pm, Jan Beulich wrote:
>>> ... before making changes to the involved logic.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
>>> when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
>>> arrange $(all_symbols) calculation" would want pulling ahead.)
>>>
>>> --- a/xen/common/symbols.c
>>> +++ b/xen/common/symbols.c
>>> @@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
>>>      return 0;
>>>  }
>>>  
>>> +#ifdef CONFIG_SELF_TESTS
>>> +
>>> +static void __init test_lookup(unsigned long addr, const char *expected)
>>> +{
>>> +    char buf[KSYM_NAME_LEN + 1];
>>> +    const char *name, *symname;
>>> +    unsigned long size, offs;
>>> +
>>> +    name = symbols_lookup(addr, &size, &offs, buf);
>>> +    if ( !name )
>>> +        panic("%s: address not found\n", expected);
>>> +    if ( offs )
>>> +        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);
>>> +
>>> +    /* Cope with static symbols, where varying file names/paths may be used. */
>>> +    symname = strchr(name, '#');
>>> +    symname = symname ? symname + 1 : name;
>>> +    if ( strcmp(symname, expected) )
>>> +        panic("%s: unexpected symbol name: '%s'\n", expected, symname);
>>> +
>>> +    offs = symbols_lookup_by_name(name);
>>> +    if ( offs != addr )
>>> +        panic("%s: address %#lx unexpected; wanted %#lx\n",
>>> +              expected, offs, addr);
>>> +}
>>> +
>>> +static void __init __constructor test_symbols(void)
>>> +{
>>> +    /* Be sure to only try this for cf_check functions. */
>> I'm very happy to see the take-up of SELF_TESTs.  Although I probably
>> ought to tie it into a Kconfig option to make the errors non-fatal,
>> which I've been meaning to do for a bit.
>>
>> One question though.  cf_check is an x86-ism, even if it leaks out into
>> common code.
>>
>> I think you mean "functions emitted into the final image"?  If so, I
>> don't think this is relevant then, because ...
>>
>>> +    test_lookup((unsigned long)dump_execstate, "dump_execstate");
>>> +    test_lookup((unsigned long)test_symbols, __func__);
>> ... taking the function address here forces it to be emitted even if it
>> would otherwise have been inlined.
> No, I really mean cf_check. If we took the address of a non-cf_check
> function, the special gcc13 build's checking would trigger, aiui.

It's GCC-11 sadly.  cf_check is part of the function type, and triggers
when a function type check would be relevant.  Just casing to an integer
won't trigger it, I don't think.

~Andrew

