Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EB96871B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787836.1197300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5qV-0003ll-E3; Mon, 02 Sep 2024 12:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787836.1197300; Mon, 02 Sep 2024 12:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5qV-0003ik-B7; Mon, 02 Sep 2024 12:07:47 +0000
Received: by outflank-mailman (input) for mailman id 787836;
 Mon, 02 Sep 2024 12:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl5qU-0003ic-Eb
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:07:46 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f45bc4ac-6923-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 14:07:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c251ba0d1cso1058820a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 05:07:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24eaf7a32sm2359572a12.67.2024.09.02.05.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 05:07:40 -0700 (PDT)
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
X-Inumbo-ID: f45bc4ac-6923-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725278861; x=1725883661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+bQnAijdPKIysnLRDaV6GkF41XyzGbrkY3lPkwigNFw=;
        b=H8w9bOnm6jYOxNoLmv/7xKm+9GSeVc71wpWHomlbMk5Fl2i55EsiCEazmNeDytvLiX
         nzWGF0GSsDyGmJVDz55lREB7/ju6mDdTUo/2KV9U5J85VyVqJZiOCFMGWCf/aw4ZuFxk
         bmamouZq7s9lkTDVew5poiE5F+uUVynjSFE+fxLJ6oXabuNRZSO3s6IV37YyXqVrFeo1
         ht2MtHJ6p66NlDM+A2tqEFGA3lsKSkediJZApnJ7mlZloeSuxVXZl5vt3qG9QTEFU+nI
         tQJy93BK39NAUwOshWrRxXSXXXXLTCZ0kg5xRdKFAvuCMXKcA3g9rP7BGor3SCgA5T/e
         J7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278861; x=1725883661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bQnAijdPKIysnLRDaV6GkF41XyzGbrkY3lPkwigNFw=;
        b=oStmwaqOsZ/dIbad+WfRVua0kGzJt22C17lpQ8TFy3gcltjaH6fS2ZOEjiXN+cFs66
         gzw0Y+Fzq7nL3tpDYmmAMocrWO7OkOQB71JIHrOglGRkv829SduUFSKB4H71O6g9kskg
         n3uIC+gNBb3NR5atmjsM5Am+IevCVUrZGutLtUfMdMleFL9WdJrwk8CCkfdrk+vZrAdr
         WMD9fq3RJIHwHm5lhJEbDmS0CN7hF1bRxhsM5uegn2axacLPjoA3Ozk8sX9X2xlVeg8i
         GoeVENRtjb+kO6pw4XUpns8mowLPV+EnrEKrXc6Vmbdt7tFEz/PAZna+4TleJsz+4oDt
         yy8A==
X-Forwarded-Encrypted: i=1; AJvYcCXo14lMOyDp2gqYOTsA3nCtaHayo5p0BH55o2f43TqLfF3+5foUmMK/565FsaPfFfkysctI9QgBH2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzpr9f9Gg/wVAAiLYS6MoShwESpKorLp4DsvaUoAft6t23xvYnn
	ncOrr17UaaVGumR4Ejr+qtcbx/w5PQI4HCMx7wn3M1ivGAdd04GTHBMSCdf7J+AQcmPqiYL4rcE
	=
X-Google-Smtp-Source: AGHT+IGsEuYNszCjulMKGQ3ztO7khK9jgoiHNvYpolVnST400BBPSpW5RtdDAZQl1VbDwCG4Z5KNow==
X-Received: by 2002:a50:8d85:0:b0:5bf:7dc:bbaa with SMTP id 4fb4d7f45d1cf-5c25f26998emr1330920a12.26.1725278861009;
        Mon, 02 Sep 2024 05:07:41 -0700 (PDT)
Message-ID: <bbc0be08-690b-467c-9f77-193d3fa38bb9@suse.com>
Date: Mon, 2 Sep 2024 14:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Use <xen/types.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902115912.3145737-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240902115912.3145737-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 13:59, Andrew Cooper wrote:
> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -31,6 +31,8 @@ asm (
>      );
>  
>  #include <xen/kconfig.h>
> +#include <xen/types.h>

And why not include the file centrally ...

> --- a/xen/arch/x86/boot/defs.h
> +++ b/xen/arch/x86/boot/defs.h
> @@ -20,14 +20,10 @@
>  #ifndef __BOOT_DEFS_H__
>  #define __BOOT_DEFS_H__
>  
> -#include <xen/stdbool.h>

... here? Both above and ...

> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -26,6 +26,8 @@ asm (
>      "    jmp  reloc                    \n"
>      );
>  
> +#include <xen/types.h>
> +
>  #include "defs.h"

... here you have the inclusion ahead of that of defs.h, so there aren't
any other dependencies (unless something subtle is going on).

Jan

