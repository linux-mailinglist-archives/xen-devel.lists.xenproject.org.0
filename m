Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AACCCEB20
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 08:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190442.1510889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWUT7-00058s-8o; Fri, 19 Dec 2025 07:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190442.1510889; Fri, 19 Dec 2025 07:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWUT7-00055V-4y; Fri, 19 Dec 2025 07:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1190442;
 Fri, 19 Dec 2025 07:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWUT5-0004NF-F2
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 07:00:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 566f1995-dca8-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 08:00:01 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477632d9326so8719755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 23:00:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830fesm3200474f8f.20.2025.12.18.23.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 23:00:00 -0800 (PST)
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
X-Inumbo-ID: 566f1995-dca8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766127601; x=1766732401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iNo0ZykmgEP3MTSjbwBOXsKs6TDDnu99SaBarTHYw8I=;
        b=Lp+IbrXLn2hqW3yvDH2OBA7n+MK31KjGfR/QmU1UX82ucSkBaSOOyuAfXxj74wCs5R
         PgZrmuiFdrJXuSGDrBOF/3v6YBKKyAr/VbByrH6wKxNkBAUcrrqWT9lYbRMq9JhKlm5v
         lLYL3ID+uRejBqZm01JEqVtX/dPGTBHXZMCA0vkMgY8kIzpOBxqjQx3hLjmK2A1QPmrR
         /9i3zcdQi8t5Omnsp8OIwAkd97J3St7He3bvpJgYgo4/K6Luy67E2ulxZuMSe0UWZA9F
         kwtg7WoZ/RWYct9eWwSyKDOKDJA3CYLWbbAFG6g17zNx39JSAiSjinTsTr2WMsw3AAsr
         Wx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127601; x=1766732401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNo0ZykmgEP3MTSjbwBOXsKs6TDDnu99SaBarTHYw8I=;
        b=YN5Bv+7k49+4+bVFoHPf8zIh65oOjZe9t9P2/WdXJxf5WBnm+i1MxVnT5MLjL49s6S
         3vn6wLj0HnmTq/MCkAHsPRPdTSygrvzDJIP4VTlzGkafDaCIr4+YsBu9IVd9KCZh+rLp
         Z2FeZ55bTXX2XCt4/H/FCkXrpuDYsF83dfVcRNIfurU9St+z0Wump8aBb0BEtjr8gh+O
         XIxySAWVA9xzztnlIlgOqNpTtYTirfjXQiRrDOTGsqghq3g9HcqDZtZCnfEca4Rpo6IZ
         Gz07+9iddo8sayGSkmtegXeyv9YimUtLTHuz+26Z1XzqQHr92wM4L5NH3y3pMrKIkNzp
         9V1g==
X-Forwarded-Encrypted: i=1; AJvYcCWeNeoLi31SL7yc0ZRAQIxvPzXw/mM2ioUkeAnxpx4uvrK7Z80OMV4DUlafUPClHmqNmK8JyvdMXtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH3IOh6nvsei3fH7pqFfEKusoVeuqQhU5mVc0TrYxzaEvTmeAV
	mN9IfoEwv16BY+sj+V9AhZTvnn1qYMKoPvQy9L/9TtZtzv2ui4q75N2pcgpk2BCMQA==
X-Gm-Gg: AY/fxX4RSvKAFF0KI+UyBcFdNCKH0fXWDLSd9gU5jsfZZtfbVp7mhNSQD0vle98F7WF
	e67jpP/Q94Z+0MNSQSjNSg6erle+kTLQSP87lwCmqxSWILRwixTnk2SAKhtBgb+9Lnba9WgIEUX
	FuPBVYot2kORI1i2DnYGWcKMg/2rUzwQVtUAw0RkhidR0eIn4gSbwjK3u5QAFqF8N2KMKE4ZAtl
	+iTrgjTrFPC2Kod+kEDWUGBhCNarX1oaQhWq08i5kItrMzQjhxCzMR258lL58xdg5XBAMrlsjpQ
	r4TNIPfx6r3oP7+r0O7ZsBj0lZdeN1WqiAk9WjuIeGvv6FcQIrbtYJDCNkaN09OVv5VUgD+omoh
	57hXXZ1ebuxucl2k4/7WHtKKAAb/Wsqw3zTYxpgNLj47Ey+m5XbllJFu1/PV/6zwCzvulZgJB08
	b0X4wMehaT4CyuCnEaTGO9ZQMcLOpHAsHOId96zJhjBy9zHBBaxyfWFyPyQ0fMNv2HBoa0SMo7S
	Rc=
X-Google-Smtp-Source: AGHT+IHfKVQLqC1JS7+s+c2VJwtV8ctgmDFTwLOPz5EOfd4z9agP22uFApulpFsV+warxArnX1nnXQ==
X-Received: by 2002:a05:600c:820d:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47d1955b971mr12433685e9.7.1766127600794;
        Thu, 18 Dec 2025 23:00:00 -0800 (PST)
Message-ID: <9a3c25a5-16fb-4f4c-a2cb-9d881271a63e@suse.com>
Date: Fri, 19 Dec 2025 07:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libs/xg: allow caller to provide extra memflags for
 populate physmap
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20251218151728.28339-1-roger.pau@citrix.com>
 <b9e1d2d9-22c9-4574-9f83-46ab649d28af@suse.com>
 <70177c8f-63b1-4c6e-8b4e-52b7435e9197@citrix.com>
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
In-Reply-To: <70177c8f-63b1-4c6e-8b4e-52b7435e9197@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 22:34, Andrew Cooper wrote:
> On 18/12/2025 3:27 pm, Jan Beulich wrote:
>> On 18.12.2025 16:17, Roger Pau Monne wrote:
>>> --- a/tools/libs/guest/xg_dom_x86.c
>>> +++ b/tools/libs/guest/xg_dom_x86.c
>>> @@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
>>>      /* allocate guest memory */
>>>      for ( i = 0; i < nr_vmemranges; i++ )
>>>      {
>>> -        unsigned int memflags;
>>> +        unsigned int memflags = dom->memflags;
>>>          uint64_t pages, super_pages;
>>>          unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
>>>          xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
>>>          xen_pfn_t pfn_base_idx;
>>>  
>>> -        memflags = 0;
>>> -        if ( pnode != XC_NUMA_NO_NODE )
>>> +        if ( pnode != XC_NUMA_NO_NODE &&
>>> +             /* Only set the node if the caller hasn't done so. */
>>> +             XENMEMF_get_node(memflags) == 0xFFU )
>>>              memflags |= XENMEMF_exact_node(pnode);
>> I'd like to suggest to avoid open-coding the 0xff here and elsewhere.
>> XENMEMF_get_node(0) will be less fragile overall, imo.
> 
> XENMEMF_get_node(0) is even more meaningless than 0xFF, which is at
> least obviously a sentinel value.

How that? XENMEMF_get_node(0) is the node that is used when no flags (0)
were specified. I.e. the equivalent of NUMA_NO_NODE. The underlying
(pretty abstract) point being that if we ever made a binary-incompatible,
but source-compatible change to how wide the node representation is in
the flags (e.g. by the consumer defining some manifest constant to
engage the alternate behavior), XENMEMF_get_node(0) will continue to
work while 0xFF won't.

Otherwise at the very least I would strongly suggest libxg to make itself
a #define for this (repeatedly used) 0xFFU.

Jan

