Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362B8B6F37
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 12:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714706.1115997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kQd-0001et-2K; Tue, 30 Apr 2024 10:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714706.1115997; Tue, 30 Apr 2024 10:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kQc-0001d2-VC; Tue, 30 Apr 2024 10:09:38 +0000
Received: by outflank-mailman (input) for mailman id 714706;
 Tue, 30 Apr 2024 10:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1kQb-0001cu-5y
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 10:09:37 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb1c659-06d9-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 12:09:35 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41a72f3a20dso39063255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 03:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b0041bf29ab003sm10947748wmb.30.2024.04.30.03.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 03:09:34 -0700 (PDT)
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
X-Inumbo-ID: beb1c659-06d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714471774; x=1715076574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TdYpJg9fhWqoYyn9W+QzPuis2GdVxiLEc7CMqx49L8=;
        b=OKVX9cgaX+pGmFlWEuHXXktFHsTtNPwEDOoCmwCLJslXZ0yyConP8lMP3jLvMtRn1D
         DzIypGSXBA5+xv+QrNyrdthKtKJMAgGzR6qM5ZEiJViKdnqu2ruDfg99BTHw5hfgromw
         kJ5l4LMo4t8NLHzNdqDRB2oO6z6wugpkealymF5Alib4zHtvKU7dYM5esmhLqHyWHYXT
         ihBbNfznCsGdixon16WjHPct5zMZ2JqbCRdmaa4x/baRKpIgaEj1gn+JXg3XD3tP+UnQ
         OI1/lOAke7Jwvhj5JHNrnWW4k9SbuizxY0P80CUxjC/xDPRPhJewf/CrQlA9GAiA8IiN
         BWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471774; x=1715076574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TdYpJg9fhWqoYyn9W+QzPuis2GdVxiLEc7CMqx49L8=;
        b=dD7KZbXjC+Qk814RrSVeKbZQZ8BKpECm78VyXI1mTgtFj0VX8R8NuJOzALtHVHGCoh
         VMKX6KB8wOBbUmtUKoQdB0WQwdiD3DySYNzMKsSENxwK5eM5Z/LspJ0/j27b/027KhzL
         5mfiXcK8aMRyNZ5yjLlkTRQwXhepjJEIGO5bjG3up/p3pjlHVr7WP66zz2KHkovP1OjU
         UWJGsCojS/nYCAb5LZ8Nb/J/liPx2pTPbzO+j4Po2HTqAMf8Is6Yxt1hcJTdYg2WC6j0
         2s+2gsRWcnufQFT33AeAN5PNM0LAglY9ToifEGZLsqXcYui9jqskz1zfyG79yB1ODBQX
         17og==
X-Forwarded-Encrypted: i=1; AJvYcCU9C0UaaS9uQNMRu7Zkj/CFCoKnNfalkmedJvxmEDOFihfoWbr9XhCjngNy0Rv+BJ4SN66sTk25pP4zpt06lelseJUTtIurxG2pvtJG8LQ=
X-Gm-Message-State: AOJu0YxhbpGhGfJXMK4xzr76P7KJiAbLMXAKAq0KMoSFwl4geHBvRUzC
	F2cABGQpywCqoS0UJLsvpi/uJKd2EdLbAJkJonm+IvOYprnjot7kqqjsQ1Lp9UL4aeRze6qgmeA
	=
X-Google-Smtp-Source: AGHT+IHCxAaPbbnK0Q1elcLq0j1crSzAObgaMVLg3Fn/GiRzxpqTKGIG4FCHPIXbpaSgWIsYbq737Q==
X-Received: by 2002:a05:600c:468c:b0:41b:7d6f:1f24 with SMTP id p12-20020a05600c468c00b0041b7d6f1f24mr10662976wmo.21.1714471774392;
        Tue, 30 Apr 2024 03:09:34 -0700 (PDT)
Message-ID: <59db1750-6714-40e6-a40c-31a0821bae5f@suse.com>
Date: Tue, 30 Apr 2024 12:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b819bd65
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6630a5ea2588_2c1971e1c10965b@gitlab-sidekiq-catchall-v2-ddbc855b7-4zkpr.mail>
 <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
 <17589fc4-9755-4822-9092-f53078488363@citrix.com>
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
In-Reply-To: <17589fc4-9755-4822-9092-f53078488363@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 11:58, Andrew Cooper wrote:
> On 30/04/2024 10:00 am, Jan Beulich wrote:
>> On 30.04.2024 10:03, GitLab wrote:
>>>
>>> Pipeline #1272869158 has failed!
>>>
>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>>
>>> Commit: b819bd65 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b819bd65f4fb25be582f66ba2e4134f61d86f459 )
>>> Commit Message: revert "x86/mm: re-implement get_page_light() u...
>>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>>>
>>>
>>> Pipeline #1272869158 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1272869158 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>>> had 3 failed jobs.
>>>
>>> Job #6745823842 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823842/raw )
>>>
>>> Stage: test
>>> Name: adl-pci-hvm-x86-64-gcc-debug
>>> Job #6745823720 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823720/raw )
>>>
>>> Stage: analyze
>>> Name: eclair-x86_64
>> This flags start_nested_{svm,vmx}() as regressions, when the regression was
>> previously spotted already. Is that intended?
> 
> Yes.
> 
>>  I.e. shouldn't the comparison
>> be to the previous pipeline run, such that issues are pointed out only for
>> what is actually being added anew with the patch / batch under test?
> 
> Why should it be?

I understand what you say below, but to answer this question: It results in
wasted time looking at failures. I don't think it would be a good takeaway
of mine if, from now on, I simply ignored such failures. Thus I'd like it to
be the case that known failures can be easily told from new ones.

Jan

>  That's unlike every other CI we use, even OSSTest.
> 
> Gitlab, like many others, is stateless between runs.
> 
> These violations are ones where we had got down to 0 in Xen, and Xen was
> marked as "clean" for these rules.  Any nonzero count (in the subset of
> things we think we've fixed fully) is a failure.
> 
> This is no different to e.g. a panic on boot.  OSSTest will keep on
> complaining of a regression until it gets fixed.
> 
> ~Andrew


