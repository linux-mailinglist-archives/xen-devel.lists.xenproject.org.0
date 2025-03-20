Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D7A6AA24
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922702.1326559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI34-0005wx-Bd; Thu, 20 Mar 2025 15:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922702.1326559; Thu, 20 Mar 2025 15:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI34-0005ty-8z; Thu, 20 Mar 2025 15:43:10 +0000
Received: by outflank-mailman (input) for mailman id 922702;
 Thu, 20 Mar 2025 15:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvI32-0005tc-MH
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:43:08 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 044ffc0a-05a2-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:43:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so10734175e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:43:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3ae04a94sm40729935e9.0.2025.03.20.08.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:43:05 -0700 (PDT)
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
X-Inumbo-ID: 044ffc0a-05a2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742485386; x=1743090186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FrT5ug9Rmu5na7Br3xiwXHNr9C5YNZojXjZI9+IL39E=;
        b=RT6I/660jh7wV3sweWKWOOdbAY0ZTjakV4mvRoX2+NcAseVoaurISkRSbsLfsn2Uvn
         gbOo6uNXIfPkzmXeyJ4QkX2FYalGaIhw42cKP3i6VYj642QYvebPAKIF5Sj/PVxc/LiJ
         kUK1FrdxUW6Qzr8kHxiDOab9cfKj7kvaFFrbbm7DR/kO/hdZ1Ky2zKM4zPQGSLy56LPQ
         un13Uy0q6iy73i7qsDSCKmI9LVRi5r2SsSg8FkxvEtFizlL9hmT68XUQLRu9jlF2M+WT
         ufAa0yBBuJZhwY1UMSNyLsOigHKBvwGCTqAO4CMlRH2G2C4U1bha8DqzcOXbsH0axywy
         B5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485386; x=1743090186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrT5ug9Rmu5na7Br3xiwXHNr9C5YNZojXjZI9+IL39E=;
        b=LKu+giT+y7cyK4uYkEuhjQ1drzSTDLc7/zXSIZeJV2Q1MplhKctTLpdLuNI26/vcVQ
         CzGjzZc878LyPRlQ0HV7kykKHhxamwdwuKi68XOcB1hTyKANHxxlu3pv72FUa6LaxHnU
         zRlPlwOekacgQnHuJu1CEmXE+ZMTDEGvZR+CE0SLCR0hqK+voH0gfIjR85nad+gMeq3G
         G2lGpg7MWQHYdQxNc1xNI5ngDb407Sd3j63aeHIB4/l3EgSywzcF+PSZLy3N5IBsqWfa
         flTAuNl/SgNk12rKKS3HcQ8xV5LzaKPNpk/bCIiP71cC9qObxThZokEZYUfJedmvmy+3
         H6wA==
X-Forwarded-Encrypted: i=1; AJvYcCUjiRjvB/eq+GUenv3Poqem1Saq3M0wmVCY8rNA8uI478DgM5hF3RtbPNW5Ync1fD2gtmHYKpNzCow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwojwWl7A/rsZeg+7dTjeJirvDUwGg1gtAFZMC7Bv6EHd9Su2GK
	OupwEFHP/aXJMupOufPGmTiLT+x/c+TtlS6SRYHt1WpULpiaXRRFh+7QC+qA0A==
X-Gm-Gg: ASbGncuDZTqXEFrnJZeUF4LcI+f4j3H0PKFEMbJuCc/eGMTBnR4zsH19goat4rg/HtE
	IfG6vWrm174zweGAI8ApQKPoYzsAAPXT05+x1jUrRc9n2bky9lqrF93iAttvKZM3gYwLL8IyGNT
	IThv6Dg+0domgiuNpll25vO+Q7TuUfN563o+Ew187MigLC+YO5bIUzscF0O/vAW8OZci135YFWT
	8CTfAMMjDSD22FyBbkv7DAaE/wuif0bR1XPZCI6aUz+doDglArwoChh/pfpCQZpXX3wSq7o4Svt
	as0DZpDprbWNwO8PL+DSmfGiz8p8BEtTAh1CUyt4WxOmnwfzTgMfe1tY1h0xGU+glMzN0Iv2AZH
	IZ0VCNuewdAAodv4cxN04qt6T15AV7g==
X-Google-Smtp-Source: AGHT+IFAbaJJWcQym+Pik1Vl080f4HyBryrGXBU+UIN3M20A4wC9QBW6o/eQuMOI59VnKGVIiqCOwA==
X-Received: by 2002:a05:600c:5248:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43d495aba92mr30429585e9.28.1742485385846;
        Thu, 20 Mar 2025 08:43:05 -0700 (PDT)
Message-ID: <0d0197b1-61d2-48ef-94a9-d2fbf1d7d073@suse.com>
Date: Thu, 20 Mar 2025 16:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Xen: Update compiler checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250320153241.43809-1-andrew.cooper3@citrix.com>
 <20250320153241.43809-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250320153241.43809-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 16:32, Andrew Cooper wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -1,18 +1,10 @@
>  #ifndef __LINUX_COMPILER_H
>  #define __LINUX_COMPILER_H
>  
> -#if !defined(__GNUC__) || (__GNUC__ < 4)
> -#error Sorry, your compiler is too old/not recognized.
> -#elif CONFIG_CC_IS_GCC
> -# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
> -#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> -# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> -/*
> - * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> - * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> - */
> -#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> -# endif
> +#if CONFIG_CC_IS_GCC && CONFIG_GCC_VERSION < 50100
> +# error Sorry, your version of GCC is too old - please use 5.1 or newer
> +#elif CONFIG_CC_IS_CLANG && CONFIG_CLANG_VERSION < 110000
> +# error Sorry, your version of Clang is too old - please use 11 or newer
>  #endif

While the Arm special cases can now indeed go away, shouldn't a RISC-V one
appear instead, seeing what ./README says?

Jan

