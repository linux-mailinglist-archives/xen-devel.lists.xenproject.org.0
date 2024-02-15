Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC2855C0E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 09:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681376.1060136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raWpR-0001kJ-6y; Thu, 15 Feb 2024 08:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681376.1060136; Thu, 15 Feb 2024 08:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raWpR-0001hq-3R; Thu, 15 Feb 2024 08:10:45 +0000
Received: by outflank-mailman (input) for mailman id 681376;
 Thu, 15 Feb 2024 08:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raWpQ-0001hk-21
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 08:10:44 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5cf3e8b-cbd9-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 09:10:41 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-411e5f21c0bso5066725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 00:10:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bk30-20020a0560001d9e00b0033cff6da10bsm977600wrb.89.2024.02.15.00.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 00:10:40 -0800 (PST)
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
X-Inumbo-ID: b5cf3e8b-cbd9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707984641; x=1708589441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFKq6tUiKQaY/aBQSjO+MQHA3hkBWmNRwqZcUU0D4Q0=;
        b=Pz7xpWHAzZhv047d1m0i/n35X8ALZVpiZXvbfLu/3Td2Od9La2bnJ+dc8AuD/gGIAX
         toMe/w27snwwDEXx+9JO92uvsygbAd1CVo+BTeTmsqgOQ19uUrjaIEuRNusrZ25gP1nM
         9fWV5ld+fISWZod04ZMO97KTRpPG2eA07HkuZxCzf6WLxpBwPLVgyqzTGKPjKNSr4LQd
         PtKj5ETIBxWufO+ZeA9XMhW+omuknrUIJTWvPbz74YuM5fZjhkiHT34fD0Qx6aEFFbq1
         T0D+J5QWX+YoN9D2S9uIG1XZ6IlF/A+rX09/AFv7xcTK7lJpAwooh/OhjvYOypS6MC57
         UteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707984641; x=1708589441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFKq6tUiKQaY/aBQSjO+MQHA3hkBWmNRwqZcUU0D4Q0=;
        b=oMwI69iuSX/YYjCeeBAJdNqESov2mtODTdvazzkH8/+ZePB05S++bFDNwsGlrRse5a
         S9vymSIOw4usjjJPopk42KWTCSKcruBHSDZCmQgEZ5hYMZexh5R2jba8+q+wQL4ps5jD
         TbgfRejPAZpxFbb52bn8DNQGMOPb7I6X+3ELZJn34POkq9Q4CYdvbS4lGaGlURQDbdmY
         0VEV43w3K+wEWYCJbv0Vv8D28dEUS21Svh3PD396Wkcoy+/YMnN4zEN9vHs0Ekl0pHUB
         UJqoR8O2ROnC7n7bLLnh/kNhRGmmun1chH4cs/b6luizvyqn78mFiU96zXWtLZFStvVc
         8sBg==
X-Forwarded-Encrypted: i=1; AJvYcCUYA1Kzh7hXUFWUH1ydjxyDE+1BP9yICG8gPO5UAVNqCNQc/bUuRWBHGWNFuqB+9+a3kin+GdQp4e6HxJeqQFWhRbugvifSSEFY3zOtheA=
X-Gm-Message-State: AOJu0YwCOBdG7orBBxDaaDEqKYM/IDp6ESNzCr0fvDERgr287l49oR43
	0NYxJ+VzjrCNgmK0C7jaECxIzbxTiobImeqcZwnDAlrqX3ZsfW6f+OaftDqDjQ==
X-Google-Smtp-Source: AGHT+IGOWyJqS9NYs0B/yS14vLtYA8JD0PB4LWgwqp0KCMZxQGnQiKAnjGQKwk2sWWiT8XyLDe2uHw==
X-Received: by 2002:a05:600c:46cd:b0:410:cf60:d857 with SMTP id q13-20020a05600c46cd00b00410cf60d857mr762245wmo.18.1707984641008;
        Thu, 15 Feb 2024 00:10:41 -0800 (PST)
Message-ID: <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
Date: Thu, 15 Feb 2024 09:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
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
In-Reply-To: <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 17:11, Federico Serafini wrote:
> I did some tries with example programs
> and the assembler error always points to file and line
> of the most enclosing function that caused the failure.
> If I am not missing something, using __FILE__ and __LINE__ does not add
> any information.
> 
> Therefore, if the new macro is used within the body of other macros,
> then the resulting assembler error will point to the source of
> the problem (e.g., the site of a bogus call to put_guest()).
> 
> In my opinion, converting put_guest() &Co. to inline functions is not
> convenient: the assembler error will point to the most enclosing
> function that would be put_unsafe_size(), instead of pointing to the
> source of the problem.

The assembler error will point to where the inline function was expanded,
sure. __FILE__ / __LINE__ ought to point to that inline function (where
the macro was used) then, though?

Jan

