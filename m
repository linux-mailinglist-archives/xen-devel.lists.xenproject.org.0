Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6C88BF11
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 11:16:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697989.1089287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3qV-0004Hv-0o; Tue, 26 Mar 2024 10:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697989.1089287; Tue, 26 Mar 2024 10:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3qU-0004Fu-U3; Tue, 26 Mar 2024 10:15:54 +0000
Received: by outflank-mailman (input) for mailman id 697989;
 Tue, 26 Mar 2024 10:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp3qT-0004Fo-79
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 10:15:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2554d85-eb59-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 11:15:51 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso5352125a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 03:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fg15-20020a056402548f00b0056bff5bc492sm3207811edb.8.2024.03.26.03.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 03:15:50 -0700 (PDT)
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
X-Inumbo-ID: d2554d85-eb59-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711448151; x=1712052951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6RyjBNLe/K7sFGgYxD45aFc5w1lg2bAYE2382XAceY=;
        b=FlUkR04LMrzEA33wAVR0dV6Gx7HJj6aH7gVqX1gNfYVo1VgA6GNcreMfG+poXF6WRX
         S7rLT8rllx07uBqUa4VrapG4HLcn6J5uHarK3Q4xNVIUQJdYUUWmVk0VvtalSOiHuSbW
         mCoGV4/pXc0dR35BUYOKOmYgp7ePlSQPJF3i4CIfutFbA90RY9WjnAOm0YUue5xJSYgf
         9Uv2jl2KMpCdxd818LaFEK/PxsrXAb/fxALBrvYIBH3aPpG/li4Ir+62a+iLnDapww+7
         EchfdzqofQhjUqkDi3PPhZ9qyc2UJJSM1IwGSTGFrX95Vs68f8f9sKV7u8SbIXIoh/Cn
         DHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711448151; x=1712052951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6RyjBNLe/K7sFGgYxD45aFc5w1lg2bAYE2382XAceY=;
        b=TNsF4WcNOLQEc912wb3GVSlCXoowtOwUtImgLFQO+saH19V6YS/XpyjUe542b0KU0I
         Z64dwReyP0ioSXl0q7NIXMfIak0xqG6T56CAOWpLHvgQBj9BY+vEusmM5iseA03rLo4+
         DmEDNHNaNA+Xgd8h0wQKsXw8B3Wd+mGkL0YHjqbWFLmsHABribq6+CpxcuYDVotPTOvq
         w0bkVwHU4F8CVhreuuMuj9LAYXkRKJzGxptVOmzEHQaB1CRvUyvDUnf6FTJwTz5K9Hb8
         jpqZS+4hvzHaD9+cmDOcCNaalbJ7blI31DO9S6ONGJ95WUTUm7BxwoWDQ7wZ/I9T+us+
         Wz+A==
X-Forwarded-Encrypted: i=1; AJvYcCW+ujpiNz1iusveJ7FiXXCoRE71TzKKdu2cOaDMj6MOLudzAW36BI0mOj61djCtiuCwRLVMoKFEZIYMKHcpqWUi3GZWaVkt+xo17QsWYuc=
X-Gm-Message-State: AOJu0Ywwv6unr4TdOBVUZOMqNmtfyBWOsNjuRxrpwS1c/4b/dKwrUNLs
	dFw4REUGS+iVtEy8PAvf69tJ/CGzoyUz/dFwYxhdqX/6xLknvQxqkzg0KGGLgw==
X-Google-Smtp-Source: AGHT+IHBG0F/lU4wrrO0FdkWmaQOTNcnwUm14w7QuLFAt6acVBB9E0fgM+GEav07HtFgX0gmoMDnOA==
X-Received: by 2002:a50:8706:0:b0:56c:19d2:85b2 with SMTP id i6-20020a508706000000b0056c19d285b2mr637000edb.35.1711448150622;
        Tue, 26 Mar 2024 03:15:50 -0700 (PDT)
Message-ID: <77f8990e-5809-4429-92d6-53bbddc89caa@suse.com>
Date: Tue, 26 Mar 2024 11:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 11/11] x86/public: hvm: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <d9342b2a0390cf3128487cfe885940682bf9442e.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d9342b2a0390cf3128487cfe885940682bf9442e.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:02, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -36,7 +36,7 @@
>  #define __XEN_GUEST_HANDLE(name)        __guest_handle_ ## name
>  #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>  #define XEN_GUEST_HANDLE_PARAM(name)    XEN_GUEST_HANDLE(name)
> -#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = val; } while (0)
> +#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = (val); } while (0)
>  #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
>  
>  #if defined(__i386__)

Would have been nice though to do the same thing for Arm at the same time.
PPC and RISC-V already have "val" parenthesized there.

Jan

