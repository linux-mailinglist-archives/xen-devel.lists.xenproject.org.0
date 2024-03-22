Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F388699C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 10:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696735.1087880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnbSG-0001ZD-Ex; Fri, 22 Mar 2024 09:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696735.1087880; Fri, 22 Mar 2024 09:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnbSG-0001We-Bt; Fri, 22 Mar 2024 09:44:52 +0000
Received: by outflank-mailman (input) for mailman id 696735;
 Fri, 22 Mar 2024 09:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnbSF-0001WX-BK
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 09:44:51 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2f3bd35-e830-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 10:44:49 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46de423039so115364266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 02:44:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056402428300b0056be85c253fsm250579edc.95.2024.03.22.02.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 02:44:48 -0700 (PDT)
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
X-Inumbo-ID: d2f3bd35-e830-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711100688; x=1711705488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qw8S7K1Hm4gAHHaOUPt/F7r8qcv9cqpwWMiXnqfyoV0=;
        b=Tkz8M/yrbOEUwcI4B6WLwM1+vNDVQ3Tm896qx7A3CGQLMa5TYThnQJmwBTAR8BEtv2
         kpLfbnKYTNBVP9OTfOwjmm5v5XOttfKqtvqM2vPvU3BhSnMVDOtzmbEnEK1nKpbokrcw
         MtUxSz1VDzjXFjUt7+/OW/6yxej3mdjjPRpOBLPAGSWRRqRjfTqLgIQvl7/ltGZ+vcou
         w+YoHAoovgNK+qh4tR/K7dVhVZj2DUBGc2QEzV1gPXOXPP0ZtWQGUlcY9+p4/kAjdEkH
         J31m1nzTyxgnt1dmuiWNb7g20V6x1loXMleCZtqRd80T1mMLjsGrOxUsC2lu3WnE1SXp
         XJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711100688; x=1711705488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw8S7K1Hm4gAHHaOUPt/F7r8qcv9cqpwWMiXnqfyoV0=;
        b=uaHup0u8OziWTOs1WBIXOJnZ/dMla4Gw5uRuYNkBwBxP8D1c3rd62/8yq6nKiAa1uS
         FmBZyXvEEwZ/9EaAGmMdPln2Uj3PFm4SPdSwx55E+bmvKOHAH6WGAqCBNHfun7VaSs7L
         Ae67DqCRgE95GOmMDvkzBa7xbpSKteho9Tl4pVmjFHpCZpPAqcebwyA/P2xmSnuaU/dd
         PTrZ8M9Gbj4nz+gJYsLtfEQhVrm+h2cWEeSL8kOwd9VaqaUwPuXNtI/V/j8GqMQCUiU4
         o88h4T01fbwfKYt00JBgkACcrcdPLSkzUdyvppVh4ppo1sHVqOirUQRQgNmAx5N0o6Rt
         TJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCU4945Am1feJePUv2m1APBP1zgPMLBdx8PI3AB0eWzLVxfvPNq+L5bxjn8JAa32H2xkWIdrAmy/qeE150yqT6b30Kj8EZDChLqpTuAn2UE=
X-Gm-Message-State: AOJu0YydW6eqbVep7UUHlnXnOGIh/+7v/VRn3ATiIXT5GvBoNqu8LUd7
	qWVrzdGCnwa34dCysP9GbBJJhbVEMLh6cLi7QudTlyD322+fHg5S1HlVGRpMDw==
X-Google-Smtp-Source: AGHT+IEquf/1Y0Q48cmuK2snk2JD7hr3KFcS/fWJ5wg7PRKkKaE4n28ReLHPoFBOM9PdtdXidu4OwA==
X-Received: by 2002:a50:8e56:0:b0:568:a90f:2e67 with SMTP id 22-20020a508e56000000b00568a90f2e67mr1511062edx.34.1711100688608;
        Fri, 22 Mar 2024 02:44:48 -0700 (PDT)
Message-ID: <9c6f4afd-00af-41f0-86dc-4f4558cb739c@suse.com>
Date: Fri, 22 Mar 2024 10:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] automation/eclair: add deviation for MISRA
 C:2012 Rule 17.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1711096695.git.simone.ballarin@bugseng.com>
 <dc3c8f2913a9efd54767828bf11fc5767afbbfa5.1711096695.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <dc3c8f2913a9efd54767828bf11fc5767afbbfa5.1711096695.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 09:46, Simone Ballarin wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>  -doc_end
>  
> +#
> +# Series 17.
> +#
> +
> +-doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> +-doc_end

Repeating v1 comments which weren't addressed:

Is there a reason xyzprintk() are all listed individually? Surely if
we'd introduce a new flavor, we'd want that excluded too.

{,g}dprintk() in neither of their incarnation use any of the va_*
items listed. Why do they need mentioning here?

Jan

