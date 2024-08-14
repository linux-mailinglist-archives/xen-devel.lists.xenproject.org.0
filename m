Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAB951B57
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777162.1187353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDfv-0002Mh-BO; Wed, 14 Aug 2024 13:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777162.1187353; Wed, 14 Aug 2024 13:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDfv-0002Kv-8V; Wed, 14 Aug 2024 13:04:27 +0000
Received: by outflank-mailman (input) for mailman id 777162;
 Wed, 14 Aug 2024 13:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seDft-0002Km-W7
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:04:25 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab29f77-5a3d-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 15:04:24 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7aa4ca9d72so799623966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 06:04:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e069sm171809366b.178.2024.08.14.06.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 06:04:23 -0700 (PDT)
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
X-Inumbo-ID: bab29f77-5a3d-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723640664; x=1724245464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/IJYD1EyEk7jcVWEg2Wzk668lwUCheNZ0SMeFsc9Ys=;
        b=F/7MjmxT57Lw5cbBj2QTfmSdBJgjAI+yapXQvqnf3H9Qe/WyPXRma2m4TWIwJMCeks
         3xSNeQqH6H/3maZ4TslRjjwhvkpZ+t9HlFldSQqpsKG0S2R5qJWrVqVf4pl1tqfcc2KO
         fyGlg9LeFgCPwuyAD53SIeCmug2iJLfqnzzFI5NTjoixAX1FqN36k0vZpSC3FkgtbHXG
         uNLF7KmlGRe8bZmKcpPA+/alxW9HzX595BksMAzuXyQk2I5FBuRiNlTBA2lOQkAaVNJY
         RO7+e4iqNt9GJ1aFZZnw/xxRlrG75rENIkVSvBMzjxYlGYTFSkGnZ8bfJ1DXwWl7XVI6
         bxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723640664; x=1724245464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/IJYD1EyEk7jcVWEg2Wzk668lwUCheNZ0SMeFsc9Ys=;
        b=cy6SH/W2BELmCXrC9Z98BUgyV+VSggfGimUFjM9vcWGkuPutQLAW9pUEVe2t+auYJq
         3xo8GjYfgPAFj+ikHrDhTYCNVg/7FH7z7OE5pjEt9Mc9vvq0lA9b9OiNpMK2fGw3G8wU
         Fe/IT/jiSaCum0mL5oZArYfFA+5ZEBqUHYBOn7hGS6wgD8K43VCPDP5R4mlU6NhsoZ8c
         nbka5q5hKLT6+9qn0kZ+lv73mO50XgVcG+6I7Rl9V8Z0RrenVltVWzFgE2AwcMRC+9Rb
         9MN6Gl71wRC7cTGtuAHK74LymNEzirppLUpC7m0Q1gGlBGmVfApILog/5yTxvcPlxMGH
         4KSA==
X-Gm-Message-State: AOJu0YwG97Ratj0JGDl1mB7HSsngbUtMAmLnAm6FGmRYSDAlVBEx5ggX
	eF/ngakygStYUWAWDaatChU8iVdDqUFs7ufKAgZRemPvrEcrDpMNoecRg5WG7g==
X-Google-Smtp-Source: AGHT+IGv2wocqvhsd6bnRlLLycPovY5DGcRN8nkXt9LniFO+csXthUyI//hbe9mTfYgkk41E5f5gIA==
X-Received: by 2002:a17:907:efcb:b0:a7a:b643:654b with SMTP id a640c23a62f3a-a8366ff3f92mr173225866b.50.1723640663667;
        Wed, 14 Aug 2024 06:04:23 -0700 (PDT)
Message-ID: <d68440cd-32b4-4221-a569-ba1b7530781c@suse.com>
Date: Wed, 14 Aug 2024 15:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
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
In-Reply-To: <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 14:33, Ayan Kumar Halder wrote:
> On 14/08/2024 12:35, Jan Beulich wrote:
>> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>>> On 14/08/2024 07:37, Jan Beulich wrote:
>>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>>
>>>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>>
>>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>>>> with new memory attributes. Since this is highly dependent on virtual
>>>>> address translation, we choose to fold VMAP in MMU system.
>>>>>
>>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>>> depends on VMAP.
>>>>>
>>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>>>>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>>>> While I'm not an Arm expert and hence I'm likely missing aspects, I question
>>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>>> conclusion towards the usefulness of branch hardening. I would advise
>>>> against encoding such a connection in the Kconfig dependencies.
>>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was
>>> added.
>>>
>>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/
>>>
>>> And from
>>> https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>>
>>> Spectre is valid on MMU based systems.
>> Since then various other issues / flavors were found. I've been focusing
>> on the x86 side of things, but I'd be very surprised if some didn't
>> affect other architectures as well.
> 
> We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is specific 
> to Arm.
> 
> https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability 
> covers all the flavours and it does not include Cortex-R82 or R52.
> 
> It says the following :-
> 
> "Cortex-R cores typically use a closed software stack. In those 
> environments, applications or processes are strictly controlled, and 
> therefore not exploitable"
> 
>> Plus branch hardening can be a pre-
>> cautionary measure, too, I think.
> 
> The first two Arm non MMU cores that we wish to support in the 
> forthcoming series is Cortex-R82 and R52.
> 
> As seen in https://developer.arm.com/documentation/ka005109/latest/, it 
> explicitly states the following about R82
> 
> The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not 
> vulnerable. The Cortex-R82 behaves differently than vulnerable A-class 
> CPUs when speculatively executing past an instruction that authenticates 
> PAC, and that behavior does not allow the attack software to create the 
> "oracle".
> 
> We can re-enable branch hardening if we know there is a valid non MMU 
> Arm core which is vulnerable.
> 
> Let me know if you are ok with the rationale.

I'm okay with any rationale. As indicated, I'm likely missing (large) parts
of the picture here. The connection between the two Kconfig settings merely
seemed questionable to me, hence the comment.

Jan

