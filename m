Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26DAEAEB0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 08:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027266.1401976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2D3-0003HY-W6; Fri, 27 Jun 2025 06:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027266.1401976; Fri, 27 Jun 2025 06:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2D3-0003FS-Ry; Fri, 27 Jun 2025 06:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1027266;
 Fri, 27 Jun 2025 06:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uV2D3-0003FM-5W
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 06:05:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afab9360-531c-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 08:05:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so1017292f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 23:05:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c1392096sm1433319a91.8.2025.06.26.23.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 23:05:10 -0700 (PDT)
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
X-Inumbo-ID: afab9360-531c-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751004311; x=1751609111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71BtaHv2rHGfs3Kxlsalek4YVZ/ViyaMH5Z00NaP3H8=;
        b=Am77YHdd56HzgjatoQtXc9U+yoxF1eERBKea5AzeSBkc5L85wY2nOLyjOjympk+NC3
         yp5/3QD57uHBZwql0SSHempYgV2k+xVOf5nMMHCwGDY0aE5Gg45CnUxLsmzhXZZihpbL
         PI5X99Xn7qHwT7vbMQDCB7po52c6CAGInjOyViZFl64RRYddEUGebd0La6dPKZ9hqTZM
         twzZ5o/jGJ5oC+Yu6GbqHA4gjlAwgwzviBRq/rlIs5AJ7kWAGm7yQLvWlbxPYD5EDKY3
         jnDB/Wi4cLhnLKgDUZbsT9Sc0zLJBNTIXGcXmE1G0aLY1VU2ctDlVidPfYhKUaPsgVKz
         WI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751004311; x=1751609111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71BtaHv2rHGfs3Kxlsalek4YVZ/ViyaMH5Z00NaP3H8=;
        b=SLhjB0I9znGhH3OxJSjPETL9FTmcxfi5dUXTjV0nk9OFn180vY/qsKyayOMRvJEY5j
         BQ4gI3MKnqIuudpy6JqOdrxHQXIyBVwK6/HQf8cYKX5ou+1iATcx3cdh3JfX+G6krKrL
         8gGGlnJux9FIYw4LvuaWNFxg3wp0OS4y9nuVA/OS2X0LJTlIzoUcWuoFTwqWMX3GYuRK
         RbHQ2esKMTN2NOt7aCQfiMRe7L8iXgXPBr6+qTyi7sNYcPgR1xxw87K90KM5ccQfHSWD
         TaQ0SX5Z+v5x6wTgNlcrC6VR1+rTw7XIfzAKlgnkW+8Qt5SmiJ+8k2mt14bmsDrLzlvM
         2Krw==
X-Forwarded-Encrypted: i=1; AJvYcCWwXqDpyolSyTdHpu2mmavr4ZI6Cq5Z1XlACbvsx8F2O9YObBg2DHauR4D/RDH1cLh/4BuaAKzdJeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzujO1KBHs/WRCGTtCaNC6+ftHPKx/UcI+bLSn6Z9f8yOFLhSNW
	9uM3FVlfjrW2cpupxrZGJx4xIdmF4Ximh49P/l45WJf26T8VunVWkomFGMBYjp5U2w==
X-Gm-Gg: ASbGnctE/1mb0t/+QakF5P6O470DzkT4osv7c4Odf462/H7egdrwDr7R0miYNhT7sCu
	/0/kCfpD0pnieVB58xGd1qI7yBNmao5JzurlNw4OCFrfsZqo1UzaZothfATZbNgXk1l3gq2FeTZ
	joca7sSzylnKXpUpbjP6J6km3RRi1BMyYjoNnzHBCdUQmfsFj2meJUFmRt189vz9IWlZpUbAXVR
	oEYZ8jaLOJZdE9h9uso2RPsaCgDNEXDRLu56InzpbNUJW5fmCp7oT8zWrC1X8STf/bQpS4fPjnT
	0sF1TRRZJAXEizhVGARiYYwAa0L14OWlOj+pHCXrZmGXaGBR0yMv4jdL3m59W0mNYFerhsViSkV
	bBAo0x2L9UBFBuIynAAdjTHSM08gMQDm+EQ9+KIhtYDZx5K4=
X-Google-Smtp-Source: AGHT+IFDUn5auWwwt+IPXCCCt0j5Q6fk1UAaGWG/FRTATzzkgFo/k8KwVLusnndCySxjZPzEZa/YZg==
X-Received: by 2002:a5d:5f55:0:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3a90b8c9779mr1974743f8f.57.1751004311441;
        Thu, 26 Jun 2025 23:05:11 -0700 (PDT)
Message-ID: <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
Date: Fri, 27 Jun 2025 08:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
 <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2025 04:59, Chen, Jiqian wrote:
> On 2025/6/26 20:06, Jan Beulich wrote:
>> On 26.06.2025 10:03, Chen, Jiqian wrote:
>>> On 2025/6/25 22:07, Jan Beulich wrote:
>>>> On 25.06.2025 12:16, Chen, Jiqian wrote:
>>>>> On 2025/6/25 18:03, Jan Beulich wrote:
>>>>>> Also, as said - you will need to check whether other architectures are
>>>>>> different from x86-64 in this regard. We better wouldn't leave a trap here,
>>>>>> for them to fall into when they enable vPCI support. I.e. my recommendation
>>>>>> would be that if in doubt, we put the __aligned() there unconditionally.
>>
>> Note how I used __aligned() here. Why would you ...
>>
>>>>> That's difficult for me to check on all different platforms since I don't have them all.
>>>>
>>>> You don't need to have them. You'd need to carefully go through the respective
>>>> section(s) of their psABI-s.
>>>>
>>>>> So you mean I should remove "#ifdef CONFIG_X86"? Just let __aligned(16) for all platforms?
>>>>
>>>> Yes. And, as also said, with a suitable comment please.
>>> Ah, my comment definitely needs your change suggestion.
>>> I wrote a draft as below:
>>>
>>> /*
>>>  * Size of vpci_capability is lager than 8 bytes. When it is used as the entry
>>>  * of __start_vpci_array in section, it is 16-byte aligned by assembler, that
>>>  * causes the array length (__end_vpci_array - __start_vpci_array) wrong, so
>>>  * force its definition to use 16-byte aligned here.
>>>  */
>>> struct vpci_capability {
>>>     unsigned int id;
>>>     bool is_ext;
>>>     int (* init)(const struct pci_dev *pdev);
>>>     int (* cleanup)(const struct pci_dev *pdev);
>>> } __attribute__((aligned(16)));
>>
>> ... open-code that here?
> That because when using __aligned() without CONFIG_X86, I got compile error
> vpci.h:18:13: error: expected declaration specifiers or ‘...’ before numeric constant
>    18 | } __aligned(16);
>       |             ^~
> I tried some methods, only open-code can fix it.

Well, that's odd. In e.g. xen/sched.h we have

struct domain
{
    ...
} __aligned(PAGE_SIZE);

which clearly must be working fine. The error message from the compiler
doesn't say very much alone. For informational diagnostics the compiler
normally also emits may help, or else it would take looking at the
pre-processed output to understand what's going on here.

>> As to the comment: First, it wants to be as close to what is being commented as
>> possible. Hence
>>
>> struct __aligned(16) vpci_capability {
> This also got the compile error.
>>
>> is likely the better placement. Second, there's nothing here the assembler does
>> on its own. It's the compiler which does something (insert alignment directives),
>> and only to follow certain rules. (See "x86: don't have gcc over-align data"
>> that I Cc-ed you on for some of the relevant aspects.) That is, you don't want
>> to "blame" any part of the tool chain, at least not where it's the underlying
>> ABI that mandates certain behavior. There's also no strong need to talk about
>> the specific effects that it would have if we didn't arrange things properly.
>> That is, talking about the effect on arrays in general is fine and helpful.
>> Talking about __{start,end}_vpci_array imo is not.
>>
>> While further playing with the compiler, I noticed that adding __aligned(16)
>> actually has a negative effect as long as that other patch isn't in use: The
>> struct instances then are being aligned to even 32-byte boundaries (which means
>> __start_vpci_array would then also need aligning as much). When that other
>> patch is in use, the __aligned() becomes unnecessary. Therefore I'm no longer
>> convinced using __aligned() is the best solution here.
> Em, changing __start_vpci_array to be struct vpci_capability array cause those concerns, maybe keeping using struct pointer is a compromise method.

It would be a last resort, yes, but imo (a) we ought to strive to avoid
unnecessary indirection and (b) the same underlying issue could become a
problem elsewhere as well.

Jan

