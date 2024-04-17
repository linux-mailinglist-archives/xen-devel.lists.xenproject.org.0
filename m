Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A987F8A867B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707597.1105649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Yl-0002ip-76; Wed, 17 Apr 2024 14:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707597.1105649; Wed, 17 Apr 2024 14:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Yl-0002fb-3r; Wed, 17 Apr 2024 14:46:51 +0000
Received: by outflank-mailman (input) for mailman id 707597;
 Wed, 17 Apr 2024 14:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx6Yj-0002fI-6k
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:46:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a0c87a-fcc9-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 16:46:48 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so4518549f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 07:46:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00341b7d5054bsm17850447wrf.72.2024.04.17.07.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 07:46:47 -0700 (PDT)
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
X-Inumbo-ID: 51a0c87a-fcc9-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713365208; x=1713970008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6f+wnBbHvXT2TBkylxXSNwMB9miy6uzllFdO+L5EaJE=;
        b=fN3ZZ6SuucXadvHkxHzI0UzPTSu9igK8gR89HxcoWLSiDT70meRtoWVByzi5nss9lR
         uhaMwqmwz84GsRaikIMTLzjCpAtvLUZkAtc01Zvf0lxcznFe/ClNlIwHAs3AkTbn6HEc
         g7srZH2cU++ZbHBvLKQ/q/GGLnkW822OMsd3CRW6m4MPbkU1cBow0jcD6Idhy5iTs4zx
         4Sw7DipOvW/oxvrrSCJaztiipA0lTRTPhPCsi2ZBb/zZwa0wv3Rfv/srpWVfq+QuuaNP
         1/B+mAiSIQjEdtNW8IUxBvOy+cY5GItUCLy6I4IDr+ztdczHGZHzk+QFI01NYN2zfnLO
         bMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713365208; x=1713970008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6f+wnBbHvXT2TBkylxXSNwMB9miy6uzllFdO+L5EaJE=;
        b=l6+EXENeXvyHdV5mdGTj1dZEZuo/cmDeBJB3cuyBndWsbcw2ggZ0Q4EsCsg640cQHA
         S8VIwq4A0b9MsbOdswGcP4GZa7KNyd8AwDarBZgaHkSXqIKrlW7mqE4zLjoj7U9m09j1
         sdPh+42aDfeR5To0HmKMl7y9OxlGyLVBZ6IOnEct57MUsMo0yqpl25DlA043x21YLc8M
         H/3TC/F/W14B7k7t/Dgn3/duVg6pJRuUVhjbgZub8NrjfusbB1XCwwvX4dM0w4lxGtBL
         axXNzC7qUL6dtReMrXg7APUd3LinAhHRr4n5jfsMtZsILH9sILow65Cpwr598r6yatKi
         /U1w==
X-Forwarded-Encrypted: i=1; AJvYcCVliLZbGTInGq5yuFjOa1OQj8XWvllQbY+21B4AY0OoYemc/yqADoMXmvlngh5aRorz+07ZqF+5UoMNE+p6UentP3RrW6FOJD0PmoP3aAI=
X-Gm-Message-State: AOJu0YwwjXnk4VDbqEbPLufi4GPX94hUJ9IR2QAvPE66thgxvrZiURIm
	vPmnmoiFSQ01o7ox2WFdiDsWDFA52E+/Vy1n+q5cr2CI7LRDOab9GVfBmkMzfw==
X-Google-Smtp-Source: AGHT+IFH8VV2y4gFkYcf5oqKNebnmk95So00zw9WrAV5gkWKpdsbr7cmGO1rYPp9Rq4iN8Hfe9nVTw==
X-Received: by 2002:a05:6000:c44:b0:33e:363b:a7dd with SMTP id do4-20020a0560000c4400b0033e363ba7ddmr12502547wrb.20.1713365207894;
        Wed, 17 Apr 2024 07:46:47 -0700 (PDT)
Message-ID: <9f00278c-b205-4afd-950f-857b75004c3e@suse.com>
Date: Wed, 17 Apr 2024 16:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 00/15] x86: make cpu virtualization support
 configurable
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <20240416061845.3467822-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240416061845.3467822-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:18, Sergiy Kibrik wrote:
> This series aims to continue what Xenia started a year ago:
> 
> https://lore.kernel.org/xen-devel/20230213145751.1047236-1-burzalodowa@gmail.com/
> 
> Here's an attempt to provide a means to render the cpu virtualization
> technology support in Xen configurable.
> Currently, irrespectively of the target platform, both AMD-V and Intel VT-x
> drivers are built.
> The series adds two new Kconfig controls, SVM and VMX, that can be
> used to switch to a finer-grained configuration for a given platform, and
> reduce dead code.
> 
> The code separation is done using the new config guards.
> 
> Since the initial RFC series felt rather welcomed, I took a courage naming
> it v1 and continuing from there. New changes are:
> 
> v1:
>  * changed Kconfig options naming
>  * use IS_ENABLED() instead of #ifdef where possible
>  * move altp2m code apart from p2m & hide under VMX option
>  * introduce helper in cpu_has_vmx_* macros
>  * and address other comments from Jan
> 
> Sergiy Kibrik (6):
>   x86/monitor: guard altp2m usage
>   x86/p2m: guard altp2m init/teardown
>   x86/p2m: move altp2m-related code to separate file
>   x86/p2m: guard altp2m code with CONFIG_VMX option
>   x86/vpmu: separate amd/intel vPMU code
>   x86/vmx: introduce helper function for vmcs macro
> 
> Xenia Ragiadakou (9):
>   x86: introduce AMD-V and Intel VT-x Kconfig options
>   x86/hvm: guard AMD-V and Intel VT-x hvm_function_table initializers
>   x86/p2m: guard vmx specific ept functions with CONFIG_VMX
>   x86/traps: guard vmx specific functions with CONFIG_VMX
>   x86/domain: guard svm specific functions with CONFIG_SVM
>   x86/oprofile: guard svm specific symbols with CONFIG_SVM
>   x86: wire cpu_has_{svm/vmx}_* to false when svm/vmx not enabled
>   x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
>   x86/hvm: make AMD-V and Intel VT-x support configurable

Going forward, can you please make sure you send patch series as threads
(i.e. individual patches with Reply-to: referencing the cover letter)?

Jan

