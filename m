Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242E9260EA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 14:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753014.1161273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzSx-0004CK-L1; Wed, 03 Jul 2024 12:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753014.1161273; Wed, 03 Jul 2024 12:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzSx-0004Aq-Hc; Wed, 03 Jul 2024 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 753014;
 Wed, 03 Jul 2024 12:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOzSw-0004Ai-HG
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 12:52:06 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb9e5bb-393b-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 14:52:05 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so59822511fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 05:52:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1598d35sm102457675ad.285.2024.07.03.05.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:52:04 -0700 (PDT)
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
X-Inumbo-ID: 0cb9e5bb-393b-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720011125; x=1720615925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yWJft89OUvjJ2DNfmsxFb/6eIYWoRUGx9ZU0U7exwxY=;
        b=A+zEEUJFJ2FHrtDVAjRLFRmVoJW5pqMo2w8yZlplkVyU/Q4EFpCfvDeMRVA69T8epu
         hTYCRm+2+ITE8Dq5pYkzxv+KjmwBA+Khjums7S+ben6Mx7JW6NDRv/nqtK5ydhbNDwW5
         GoW7gxzTdVuyIwN6H9c+o/10WETWooLnw9+pW5M8AsH5GD376plmO2x+DtzikPaB7oci
         5L+YBU5ZO3sjEK5Cn6Jo+EzGAezjyE+XH5mXBV4er84BfuYh34i+nEpryrDeXu472tvt
         N9LdlR/TSg3JieXiWA7tsZUPPpg4/uonwd083oTKp+48jYUpV5D+Fixt71h/kpJ++b5c
         QdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011125; x=1720615925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWJft89OUvjJ2DNfmsxFb/6eIYWoRUGx9ZU0U7exwxY=;
        b=KdlZx7kLGHEyt016Xr1Jwmbs2uYnx8oa5tTD2yo99dj3mgWR6pjtayG/kUOtV3Yn+k
         HPRNvL+dqkxzRSIvwpAFUbfXCaATeJZD4kUj6aiOjPs5MLemplf0KtGwLX2FhHMPFT1U
         uEcafLKJCrtCSisljEqwfD+T9rni3O40N0g9MaxaSO2GOv2iHIEfCVxg5dgLk810jcH7
         iQfLZZp203i95Ob1um2O2dyV9B6kC3zzyGt9Oh9jFbvMYNGfc2aYfQVPkrkW/UrFcilm
         Jw+UIIThjNsE2GZ1dHpXdMv79cZHnC3k2Z5oMDfCfJQoc5wo0xop8RJiI1lPfUsY5BWL
         H03g==
X-Forwarded-Encrypted: i=1; AJvYcCUvaigcrHPtXSgfsT0AD6JjI5+FcrfPZ19Q90DuBR4q192ari4uGEGTf/iuwJOZReCy6+IAABemdkDxVeg+tM/QoufNYkdRXe4/jAr6grQ=
X-Gm-Message-State: AOJu0YxHEV9mLr165CTHOAmkAZJ0K1odpfhpkKzv74QjcGheth+bBoIo
	IuMpLl/wa1fzC3V9HSxGM8brRu/VDyFWbGiP7yPDrjtghyl3W63R8sYzLcp3AA==
X-Google-Smtp-Source: AGHT+IEzCFzbCG7gi8Lxa38rtXXEzepGJetetKRQemHeAoiIjTGgdp9NNr7hHPXZNZZgvrCp7EGuzg==
X-Received: by 2002:a2e:a549:0:b0:2ee:4a63:e927 with SMTP id 38308e7fff4ca-2ee5e6f2be5mr94450961fa.39.1720011124772;
        Wed, 03 Jul 2024 05:52:04 -0700 (PDT)
Message-ID: <ac3885eb-ae04-4362-b94d-117694fbdaac@suse.com>
Date: Wed, 3 Jul 2024 14:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] xen: address violations of MISRA C:2012 Directive
 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <8305a914d1f1ee01d1b0b83cb86c2a48a2a2be0b.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <8305a914d1f1ee01d1b0b83cb86c2a48a2a2be0b.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:43, Alessandro Zucchelli wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Modify creation rule for asm-offsets.h to conform to
> the new standard and to not generate conflicting guards
> between architectures (which is a violation of the directive).
> Modify generic-y creation rule to generate code without violations
> and to conform to the new standard.
> 
> Mechanical change.
> ---
> Changes in v4:
> - improve inclusion guard generation
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> ---
>  xen/build.mk                     | 7 ++++---
>  xen/scripts/Makefile.asm-generic | 8 +++++++-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/build.mk b/xen/build.mk
> index 0f490ca71b..bbd4c2970f 100644
> --- a/xen/build.mk
> +++ b/xen/build.mk
> @@ -47,6 +47,7 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
>  
>  arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
>  	@(set -e; \
> +	  guard=$$(echo ASM_${SRCARCH}_ASM_OFFSETS_H | tr a-z A-Z); \

Was this and ...

> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -32,7 +32,13 @@ old-headers := $(wildcard $(obj)/*.h)
>  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  
>  quiet_cmd_wrap = WRAP    $@
> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> +cmd_wrap = \
> +    guard=$$(echo ASM_GENERIC_${SRCARCH}_$*_H | tr a-z A-Z); \

... this mean to be using $(ARCHDIR) as well then?

Jan

