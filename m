Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E11A7F546
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941463.1340940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22nN-0003CN-Ks; Tue, 08 Apr 2025 06:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941463.1340940; Tue, 08 Apr 2025 06:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22nN-00036t-Hy; Tue, 08 Apr 2025 06:50:53 +0000
Received: by outflank-mailman (input) for mailman id 941463;
 Tue, 08 Apr 2025 06:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u22nM-0002yu-2p
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:50:52 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd81cf08-1445-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 08:50:48 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so35281735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 23:50:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300968a1sm14217908f8f.11.2025.04.07.23.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 23:50:47 -0700 (PDT)
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
X-Inumbo-ID: cd81cf08-1445-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744095048; x=1744699848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YfrqCOY2pWP4kifq5dH2ChpWjHzTgqUtvgIWp/8bsQk=;
        b=WP052pL8C7e6OJhrCd7ElDejL/Trz5vUlTdaH+921p53G1IIty/7hqghwORWlh2Pe7
         YDFTL7nH6F5/Py3CGqfHN0J8R3fVgOQshTLzlS+l1ui9+PaUmmbgv6HPsu5ru33WIJCU
         JwSAr9Zx0832zdt/RQAtkbYzXSdE+iPXkQeFGA6Zxeu46SZn9l7qxqsz1is3R11tJ7qe
         VOhPOeF8DsKGVWcGPBnOcnIyaIk8is4zCsuxsDvnsqBUWat924eHUzrHjdRSQ1FPkHV9
         +rADJfJfypz1BM5MG3TrUVG1qyxGAOpkpkf0wMhObTK/7QYuBf64aGzq9jeAAgGuPBsN
         7MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095048; x=1744699848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfrqCOY2pWP4kifq5dH2ChpWjHzTgqUtvgIWp/8bsQk=;
        b=T7cSK3ebVgDmwO/aBfd67Rbjj9FYODF7d3ESRKx94CF6wXAmSNs/YL8bsqfl19pcpN
         00/ABysBv9PkJS0sYoROWbswShfxzOqasI4VfBbSIxFk8va44XPzXEHUcbGQRgdJ/6vD
         tjYIiNW77HGIMpfEzGqgG9l+93ACq/tXLvyZzdoC58981tpKTj+Lj2NN33wiPqp+jc+B
         LWyls6DmFlUuvR443lE0RcPP9/AiqbC9e4+nXY/qupNM/V+RVmf/eNsu09tcj30ehmVA
         k6FxEAdFAOPG8WJ5zDxgldHKy66rlIbD1VKHyriNsunigviSds5pxuvsCrjdPsVFM2tr
         ylBA==
X-Forwarded-Encrypted: i=1; AJvYcCXXuU9KFR4cB2uM7EE9NYmCFxnyV2OgZJNjKmuNhj7Kny6mv+Q7/o90pYh3K2HTw1BphwWoU4QwScw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyrr/c/9Plpcyk4mRZLMfdXXdE0DeA3NeZE2b04Tt/N6YYsxDGQ
	74BSQ9RLHb21ykHR9Lj2VtK9O7sDzgCabT2/2/hss8oJ97ONjL6mAMpNNyZ0tA==
X-Gm-Gg: ASbGncvxWc1e30OdQlRJE95bsSqUO9jrKoZo3M9Xj+ukzSBBSGQEnIq4L8Y2HchGG5B
	s7vibWyKyAldFqknadQ9bap2TUIHMhgX/CTXeX9tj6jVKsC25exWT+dqFBHOSCDJ0z/ocscgNDQ
	AsYFxluad3S/JtfgxChMk3LjrQ/ZZKfpYIHTGaQ8TKISTSJNa15n2V4UyV3cP0i9mLrQsEtUZJA
	CAmltQK3Ytio+23gcOg+orhhXnLXUUsFj8tlLHt7qyVYPaledVxrjRjexb+TajS0ooNMQ2b0Q0m
	4wq1CApE3kk4f6gtd2yWYpXGIzjzJF/xrM0NXiPlR4B1WuF2ZkMTX0RWuMqpfhFRcyeDfrbqyLg
	sign/zxddK4lxhECrhUcm63VXDaCxPg==
X-Google-Smtp-Source: AGHT+IFdt7fghVsyDdhzubgAiGkXME76nSDlqUSoqO9/643pK5mMbVIaRVbqVRdQlGI7SwgbjuUu1w==
X-Received: by 2002:a05:6000:18af:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-39d0de62221mr10667891f8f.37.1744095047660;
        Mon, 07 Apr 2025 23:50:47 -0700 (PDT)
Message-ID: <5c770c10-8c0c-4f13-bae7-386820279484@suse.com>
Date: Tue, 8 Apr 2025 08:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
 <20250407224009.2577560-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250407224009.2577560-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 00:40, Volodymyr Babchuk wrote:
> Both GCC and Clang support -fstack-protector feature, which add stack
> canaries to functions where stack corruption is possible. This patch
> makes general preparations to enable this feature on different
> supported architectures:
> 
>  - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
>    can enable this feature individually
>  - Added user-selectable CONFIG_STACK_PROTECTOR option
>  - Implemented code that sets up random stack canary and a basic
>    handler for stack protector failures
> 
> Stack guard value is initialized in two phases:
> 
> 1. Pre-defined randomly-selected value.
> 
> 2. Own implementation of linear congruent random number generator. It
> relies on get_cycles() being available very early. If get_cycles()
> returns zero, it would leave pre-defined value from the previous step.
> 
> boot_stack_chk_guard_setup() is declared as always_inline to ensure
> that it will not trigger stack protector by itself. And of course,
> caller should ensure that stack protection code will not be reached
> later. It is possible to call the same function from an ASM code by
> introducing simple trampoline in stack-protector.c, but right now
> there is no use case for such trampoline.
> 
> As __stack_chk_fail() is not called by Xen source code directly, and
> only called by compiler-generated code, it does not needed to be
> declared separately. So we need separate MISRA deviation for it.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v8:
>  - Code formatting fixes
>  - Added an explicit MISRA deviation for __stack_chk_fail()
>  - Marked __stack_chk_fail() as noreturn
> 
> Changes in v7:
>  - declared boot_stack_chk_guard_setup as always_inline
>  - moved `#ifdef CONFIG_STACK_PROTECTOR` inside the function
> 
> Changes in v6:
>  - boot_stack_chk_guard_setup() moved to stack-protector.h
>  - Removed Andrew's r-b tag
> 
> Changes in v5:
>  - Fixed indentation
>  - Added stack-protector.h
> ---
>  docs/misra/safe.json              |  8 +++++++
>  xen/Makefile                      |  4 ++++
>  xen/common/Kconfig                | 15 ++++++++++++
>  xen/common/Makefile               |  1 +
>  xen/common/stack-protector.c      | 22 +++++++++++++++++
>  xen/include/xen/stack-protector.h | 39 +++++++++++++++++++++++++++++++
>  6 files changed, 89 insertions(+)
>  create mode 100644 xen/common/stack-protector.c
>  create mode 100644 xen/include/xen/stack-protector.h
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3d68b59169..e249bcbf81 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -108,6 +108,14 @@
>          },
>          {
>              "id": "SAF-13-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R8.4"
> +            },
> +            "name": "Rule 8.4: compiler-called function",
> +            "text": "A function, for which compiler generates calls to do not need to have a visible declaration prior to its definition."

Nit: s/ do / does /. Not being a native speaker, I'm still uncertain of the need for
the comma in the place you put it - it reads odd this way to me (at least without a
2nd comma). I'm anyway inclined to word this differently, to be more precise
(otherwise the deviation here would equally apply to the data item
"__stack_chk_guard"):

"A function, all invocations of which are compiler generated, does not need ..."

With this suitably sorted (can be adjusted on commit to whatever the final outcome
is going to be):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

