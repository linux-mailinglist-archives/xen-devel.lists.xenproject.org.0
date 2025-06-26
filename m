Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F51AE9D35
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026242.1401446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlNQ-0000WA-UK; Thu, 26 Jun 2025 12:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026242.1401446; Thu, 26 Jun 2025 12:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlNQ-0000U3-Ra; Thu, 26 Jun 2025 12:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1026242;
 Thu, 26 Jun 2025 12:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUlNO-0000P7-Tw
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:06:46 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c3595a-5286-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 14:06:46 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so859667f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:06:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5386e67sm4324596a91.3.2025.06.26.05.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:06:44 -0700 (PDT)
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
X-Inumbo-ID: 07c3595a-5286-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750939605; x=1751544405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dcdunHN2ZTZuC2Jvl8j4xdpkRodv1OL3Trto6r3lA4A=;
        b=InztHen6+KkMCLduBQVr081U6w0nuFsMUT8mrumMylN6F/lhJg00Z6Tdty8kRkZ1Fu
         0YFNuk2bKUdztbINfBaRTElVR1o7OSN8fK1O71isTuAEKD/nTQLnf47Ty604+2dO8AIb
         YqRcHJTapDVj2M/nqukJrW+ASpGvzbkgSQgCNzBeq7vXs50sZcNyv5k8kyQaSZESgOvL
         F06xAEwXx74enddzuPOgaoZ2OY/k2FpFiw37A25JJYRsb1C3fpoz+Lx4Y7iMREmBs2g1
         /Xyd7Vi3OatEvH5PN45L1engIxNWRrijN85PKl+7KscjKz+DYGQabl0V7/aMgnRR/xV1
         HuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939605; x=1751544405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcdunHN2ZTZuC2Jvl8j4xdpkRodv1OL3Trto6r3lA4A=;
        b=OaMx01YcnXHVp7X/wVspFkFWv9iZf9dekimmVcIAKJKoBQWRr8nimheRKkkX/DofSu
         gQQeu8NKdspl3ftEiLJ2YOfnUXiyeO0tkUMcNWD6tL58gjfe+W7qU+cHZJYkE3uf5nix
         WpTSOeLaoy95CMynGEJCVqn2vy2lUTlohTpl8oDkXZExf98WxXDSVJvL1jZLAmplvvEJ
         v+CqHdgZRvhzIYBGTP/q7UfDx7f2GlBDANyv7TStYlO8kMEyw6sjERpzC+5GwzA8Z7mt
         GbSpM0pvo9dJG8VlRvof6uCJ8yqnB6w5pyIsJ36xk4t1TlIFQ62yFCSLsrzBbXkob39c
         TYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGSaglt8uyDdnE2SgqSyo0U33vjpph+6zqSxtInXdQnc7bFMn8kmEJQAWYIaQbGv4ZHNfypkbZ50=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh0plPkvQFw9IDDEGl6I4PYUY3uKu8lyjc0hPjfg+jzZDNlWGT
	MsDTdpc2L+zbbJ0/umytgcYvKf2zvZDl0CktGoWwSR/dSR5K9yB1ZZzMkHcVdHyH6g==
X-Gm-Gg: ASbGncuFy9EObLxc2+YHMKVVcJ372+VpKcRj7K5O03hNKrV2BjQ7lFiJsz+8SqnovO7
	/iKKf79Z9h0V84+1ZKi3DgTw76qHlrWbwABU7UF5WMQXptDycQ8l/4puR1gvuS65/cVlnRisDpJ
	H078902549eGxDIomr/II5S3Vjrgy952pRG2p0oPoqFXhoLcqtUlWdixrmwTuI8QZFuTdHAZzqi
	3QDSyYI2ur2+LcTKBDMS9uLmATxLo20NaZUOjmWOnBV4/Xh3RjKsqxAh3A0uAa+a0V7fAbdlprW
	UlDkKANjANWeTDqX4X19KWEdU1A+4PCDVTBITRMXeDzBnt7LpEztG9gRR2oxHJ3uXiv4bQtFweo
	lOLjw5xVEt6Lr9AhC+tGgthNrSEiBnIyAtKezj2aBfXwYXdJXKZdFBLbtXw==
X-Google-Smtp-Source: AGHT+IEB++qs8mTz710/kOIXzFLiiseR8vhzbMPicNBhE9z82aNEVjVlyP7FbWjs7H8Ama9ZBq/c4w==
X-Received: by 2002:a05:6000:2dc6:b0:3a6:ec1b:5742 with SMTP id ffacd0b85a97d-3a6ed5dd5famr5724727f8f.22.1750939605145;
        Thu, 26 Jun 2025 05:06:45 -0700 (PDT)
Message-ID: <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
Date: Thu, 26 Jun 2025 14:06:35 +0200
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
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 10:03, Chen, Jiqian wrote:
> On 2025/6/25 22:07, Jan Beulich wrote:
>> On 25.06.2025 12:16, Chen, Jiqian wrote:
>>> On 2025/6/25 18:03, Jan Beulich wrote:
>>>> Also, as said - you will need to check whether other architectures are
>>>> different from x86-64 in this regard. We better wouldn't leave a trap here,
>>>> for them to fall into when they enable vPCI support. I.e. my recommendation
>>>> would be that if in doubt, we put the __aligned() there unconditionally.

Note how I used __aligned() here. Why would you ...

>>> That's difficult for me to check on all different platforms since I don't have them all.
>>
>> You don't need to have them. You'd need to carefully go through the respective
>> section(s) of their psABI-s.
>>
>>> So you mean I should remove "#ifdef CONFIG_X86"? Just let __aligned(16) for all platforms?
>>
>> Yes. And, as also said, with a suitable comment please.
> Ah, my comment definitely needs your change suggestion.
> I wrote a draft as below:
> 
> /*
>  * Size of vpci_capability is lager than 8 bytes. When it is used as the entry
>  * of __start_vpci_array in section, it is 16-byte aligned by assembler, that
>  * causes the array length (__end_vpci_array - __start_vpci_array) wrong, so
>  * force its definition to use 16-byte aligned here.
>  */
> struct vpci_capability {
>     unsigned int id;
>     bool is_ext;
>     int (* init)(const struct pci_dev *pdev);
>     int (* cleanup)(const struct pci_dev *pdev);
> } __attribute__((aligned(16)));

... open-code that here?

As to the comment: First, it wants to be as close to what is being commented as
possible. Hence

struct __aligned(16) vpci_capability {

is likely the better placement. Second, there's nothing here the assembler does
on its own. It's the compiler which does something (insert alignment directives),
and only to follow certain rules. (See "x86: don't have gcc over-align data"
that I Cc-ed you on for some of the relevant aspects.) That is, you don't want
to "blame" any part of the tool chain, at least not where it's the underlying
ABI that mandates certain behavior. There's also no strong need to talk about
the specific effects that it would have if we didn't arrange things properly.
That is, talking about the effect on arrays in general is fine and helpful.
Talking about __{start,end}_vpci_array imo is not.

While further playing with the compiler, I noticed that adding __aligned(16)
actually has a negative effect as long as that other patch isn't in use: The
struct instances then are being aligned to even 32-byte boundaries (which means
__start_vpci_array would then also need aligning as much). When that other
patch is in use, the __aligned() becomes unnecessary. Therefore I'm no longer
convinced using __aligned() is the best solution here. Instead I think you want
to base your patch on top of mine. Which in turn would eliminate the need for
any commentary here.

Jan

