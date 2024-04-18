Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F718A97AA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708206.1106868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPFm-0007fm-Ao; Thu, 18 Apr 2024 10:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708206.1106868; Thu, 18 Apr 2024 10:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPFm-0007dS-8G; Thu, 18 Apr 2024 10:44:30 +0000
Received: by outflank-mailman (input) for mailman id 708206;
 Thu, 18 Apr 2024 10:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPFk-0007dM-Uy
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:44:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1205026-fd70-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 12:44:27 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-418dc00a31aso4910425e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 03:44:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfc842000000b00346cc85c821sm1508135wrh.89.2024.04.18.03.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 03:44:27 -0700 (PDT)
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
X-Inumbo-ID: a1205026-fd70-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713437067; x=1714041867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyTMC05f8zIiysE3K7QC8zs3oYC74Bt+N2EiLX734UE=;
        b=WLIADQ9a4LvAoKYgAm8OEyDpzHlyBMnV/bYiIxD+OC3yPgdVS2M6wZMYsTnug1B5q8
         DNkAX0jJpnGlA1akOgsnegzHrgS4LdkTJbYnJebhrP0jBopiOTUCkSUJ+EB+oj2kV9d8
         VYAGmZUgvax0dWp+rrBgjAxu72nCfKSETviXSnVHcQr4BKJHm2+9qlm3tgqy9RjopDcU
         6OeqfF1nfaAQ0436QzZ3FxxQXDrkgWgWOyw9X4vQm130j9FJxAFrxgBaqlA9aCkqHinl
         wuQjDsx6BzQkmCtBJMkUYFPKWJ9Rno9DW/MwZN7DrcjZ6X29C6ERCFukxsF2h2GuB4a2
         M/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713437067; x=1714041867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyTMC05f8zIiysE3K7QC8zs3oYC74Bt+N2EiLX734UE=;
        b=RUdZvM/HSm8RWioKKe0aoz2pAjj3+v/GiKJghp0qpRC9uo+bofN9BKPSxFCLFHu7ZX
         wsUh1lPL68zGxH/5FX6rPupV99Du/e5kAu+Zgzq5fhT/GNHCbsF+O1U4FihuWCk1AikD
         kozrSwjsISuoKE1NBDinsL03X3nvCihLySu+/hLKA0nzKu4yuuIoVrKTh7STXcLhct9c
         P4bC+b3Oh39ws0JlbPY1UqT1aeV8aqOmIcBve+fCtrEJ/8obB3CLWT8U/2hyR5QHTSMm
         8+/ZwuT/RRmsU8mhXw3jelxmh7M1UI8cYkaBKKf0HsMY1TPujorasKKse574yPmWnnic
         KPaw==
X-Forwarded-Encrypted: i=1; AJvYcCWbxcOmmEizgCSLti7+uO7/9QRl8ELLVwezilg0UOmnQYS9az3JVSUz0K0AR3zitiLwoRHfpu1GJqMSFs2+GcUt1E9ly7SbsR13jbDW8yw=
X-Gm-Message-State: AOJu0Yx5Kxpdu1/nnvh7XhyJoqiI6SuQDQLzqPl62ekcsXIk8609vCDE
	L/9Y1EyvwOZsSTrmFAZynt1+1bHT9A59g0sVbl78Yysf2r+BIZFxOTFLYAPT1Q==
X-Google-Smtp-Source: AGHT+IGQ7Xyqwg5jmRj54XHXG0RKOP25un7IysIq/xeFBvWgfTEhLaBrzar70uHu2hD3Lxy/YLF+zQ==
X-Received: by 2002:a05:600c:3d9b:b0:418:a620:15a1 with SMTP id bi27-20020a05600c3d9b00b00418a62015a1mr1754121wmb.30.1713437067246;
        Thu, 18 Apr 2024 03:44:27 -0700 (PDT)
Message-ID: <cc211dbe-9d95-46aa-8167-558acac7a3d3@suse.com>
Date: Thu, 18 Apr 2024 12:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec: fix reporting of BHB clearing usage from guest
 entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240415141737.88236-1-roger.pau@citrix.com>
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
In-Reply-To: <20240415141737.88236-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 16:17, Roger Pau Monne wrote:
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -643,7 +643,7 @@ static void __init print_details(enum ind_thunk thunk)
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_verw_hvm                              ? " VERW"          : "",
>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
> -           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
> +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
>  
>  #endif
>  #ifdef CONFIG_PV
> @@ -658,7 +658,7 @@ static void __init print_details(enum ind_thunk thunk)
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_verw_pv                               ? " VERW"          : "",
>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> -           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
> +           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
>  
>      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
>             opt_xpti_hwdom ? "enabled" : "disabled",

For one the surrounding if() conditions need similar adjustment.

But then I wonder whether the further uses of cpu_has_bhb_seq don't
need switching, too (when determining whether to force
X86_SPEC_NO_LFENCE_ENTRY_*). At which point the question is why
cpu_has_bhb_seq exists in the first place: It in particular does not
affect the default calculation of opt_bhb_entry_*, afaics.

Jan

