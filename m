Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00393B0F9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 14:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764171.1174510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbGG-0000RM-NT; Wed, 24 Jul 2024 12:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764171.1174510; Wed, 24 Jul 2024 12:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbGG-0000Oo-Ke; Wed, 24 Jul 2024 12:38:28 +0000
Received: by outflank-mailman (input) for mailman id 764171;
 Wed, 24 Jul 2024 12:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWbGF-0000Oh-Ma
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 12:38:27 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f05a4ab-49b9-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 14:38:25 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef2c109eabso38216731fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 05:38:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a7f5349cc5sm4257230a12.13.2024.07.24.05.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 05:38:24 -0700 (PDT)
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
X-Inumbo-ID: 9f05a4ab-49b9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721824705; x=1722429505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yl1wq62E2OWmmxs2B6fPZ+78OhF7H2md4Qsr4Igmt90=;
        b=WOAnjYzDEa6IIt4NpUDRpX/1LVIubSkhsasL7+v6zKeK0m52+cekkaVpk3qVR0ZZEu
         vmj8Z9fK0M85NDTOglnyhuRpiSzVp8360PCPM4Oe1GEvFkWK9KY/5LPR6Chv4sONAUgr
         1srkGchhnEL5tafHQr6ljQL/QzV+kM+Lp6cuPQxWjzj28oYW38UvScW4ipWnn4APwb7Q
         IIgG4Y2z+M2AyQJViBvPJtxhZ9YXUjrlnEUHQYpdpcgc9k8A/jbrOCw/bWV8xYB2rZuJ
         0JbOp1z91E+YHafAAHgpaiAgArawxj0hbgmIh5U8xysh4+4cskeeFOdTug7nJZDf82t4
         UVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721824705; x=1722429505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl1wq62E2OWmmxs2B6fPZ+78OhF7H2md4Qsr4Igmt90=;
        b=nVALybSO1MksgcH2cIIkA44b5VByALrOBZjMIfG0bzY93WAO9qMEUaZ6iDx/tXagbN
         rABf3fNRv3aKSPTHvwedQJvHz6FFOJMX/vQWmVwfuwEGzWh4/tZck/aYcCr8MjsdkCBc
         WYYhrEbLdLtybPT7TRvzKnrtQ3V0iba9aj/kCn4epRKODhQ6jlcNR6CHXpieukwmdzN6
         lUBYP/sBjZeni5qz+6A5J5SLJNki5YRxfg8OJWDBYoa3u8vgTlTzf5AtG69QLgf0zwN1
         5zsmpEGgImQ3aLWpD9flWiERqI00OmKpHUdlhP798FzJnI2PQCac/mccAi90bbJIkLgU
         CO3g==
X-Forwarded-Encrypted: i=1; AJvYcCUDfnCg3nuUfUjR3x40AyfCO8O0JKg37QwwWdo6HOycg19wG1KLYhRyw8xL3JrascgVqxC993SsbkyT03GYptJyVGKVlMoei+YNn5kze6A=
X-Gm-Message-State: AOJu0YymoY/4Xwt4Br4XkAJsBblOuh2S//WSV01NK/dBT/J3GmMMGFVa
	4DKgbotYmJFVr2hg/DpaoEwuyfWXWzt+R1ArJTr3sdQ8+WGWGziwkcPYPSlTlA==
X-Google-Smtp-Source: AGHT+IFjqbWpmuQc9COMPEZiGX2jooP4sx1DsxDe1a8nraqmFWQaArEYzxxP0C+UkYAQ6y1g5LsBuw==
X-Received: by 2002:a2e:7d15:0:b0:2ef:2483:5659 with SMTP id 38308e7fff4ca-2ef24836095mr74736691fa.5.1721824705264;
        Wed, 24 Jul 2024 05:38:25 -0700 (PDT)
Message-ID: <313a4ce6-e080-4d9e-8f08-ba40be98a7a9@suse.com>
Date: Wed, 24 Jul 2024 14:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/9] automation/eclair: fix deviation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <490e1a84b1b4b8d983dc41af147191f79506cdbd.1721050709.git.federico.serafini@bugseng.com>
 <d39e4fd8-ce54-48b2-8b20-b22b5c70fe73@suse.com>
 <efb0d95f-2feb-419f-92fb-ff2d1c199cb9@bugseng.com>
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
In-Reply-To: <efb0d95f-2feb-419f-92fb-ff2d1c199cb9@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 13:32, Federico Serafini wrote:
> On 24/07/24 11:45, Jan Beulich wrote:
>> On 15.07.2024 18:48, Federico Serafini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -499,7 +499,7 @@ safe."
>>>   -doc_end
>>>   
>>>   -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
>>> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
>>>   -doc_end
>>>   
>>>   -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
>>
>> This patch doesn't apply. There's a somewhat similar entry, but its doc_begin
>> line is sufficiently different. I have no idea what's going on here; there's
>> no dependency stated anywhere.
> 
> Right, this patch depends on [1] which has not been committed yet.
> 
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2024-06/msg01347.html

Which in turn isn't ready to be committed yet afaict, due to a pending
question regarding ASSERT_UNREACHABLE().

In any event - please make sure you prominently state dependencies on
uncommitted patches (outside of the same series of course).

Jan

