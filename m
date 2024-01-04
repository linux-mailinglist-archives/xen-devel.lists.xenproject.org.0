Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0582401C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661490.1031199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLTu-0007ZC-3l; Thu, 04 Jan 2024 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661490.1031199; Thu, 04 Jan 2024 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLTu-0007XI-1C; Thu, 04 Jan 2024 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 661490;
 Thu, 04 Jan 2024 11:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLLTs-0007X9-1V
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:01:44 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3713519-aaf0-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:01:40 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd0c151cdcso4485141fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:01:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 15-20020a5ea50f000000b007b6ea31bb14sm7864751iog.34.2024.01.04.03.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:01:39 -0800 (PST)
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
X-Inumbo-ID: a3713519-aaf0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704366100; x=1704970900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhH2TVX8jN54GBBzY6zIKmHsfVoMq1tKOHf+jzK3nCs=;
        b=EtpKjVCfGCDEpeqf6ERGdsUxWiwDpNHJfuqLemD8X6gkoMNU1+Nbfyt83Tzh0b2nw8
         ug46OO8sMv8nJ6cVMd/HMBexg216tYs2ZuCfAQhoYd11fr5nyMkS+vmpAFEroRuHOLlo
         N4PlYtJCp9PfNHfTYeINCv/6fa7wfWbHTwc1bi58oXLfa3kYDIot9DCjh7mckpfy38TU
         gx+zaAfGtGZ0vm8tusYZyexA1iQd39PeZZADfvxTAC2tQSEV9ajMoITLmBzBqPgMWVV0
         xurHY3JdOggp/yOET1WMsmwt7jiBM3EpERM+9oFrhXIhYb1ni+bR0mt2wNMV44wkLUGf
         HsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704366100; x=1704970900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhH2TVX8jN54GBBzY6zIKmHsfVoMq1tKOHf+jzK3nCs=;
        b=UMx++eRG4SBeM1aQBrAA/UhSXpcn7klk08eIoK9gEfR2wQ8iQBfz6rP9rpoRcLMTsU
         oU9h+mJf5jPQ3iaNBvPoQvKkpV66PGZEknetWpiW0BWTjRwC9OG7Yil/ZvMsycL2XApi
         +QX2i59R1OeANSHdlIMxCTVurWjfUaHwjGS+C/mtwWPv2hPYYM/tziaZ7zoO2777z5wj
         ce6kbzukKZeiaODfMMCYHTAMkiDdem7lzoTi3mlX9VdBJ6g6uurLOIqqWFbBz/4P+2Rd
         yt4VNyZZKmNRWuw7PTvrUo/09H2UK3jT8aK5Axy86f5sxWpx/ZglhyJAzhh8J5s4SvpL
         P+7w==
X-Gm-Message-State: AOJu0Yz6xkdqZjXKhU7oKaRSiBmikf9RSbUndT4cfJoPzD/TsaBIjv2B
	6WYhQaMkzH2ZxwIXK3FFXgdnVWSII+GB
X-Google-Smtp-Source: AGHT+IGRqp8CiKhOFODq3AcJHuS66zizR1bLSM2CN4TyWvgHe4ECETSq8dQEj7RDpQ3Lia8R+qc9tg==
X-Received: by 2002:ac2:4307:0:b0:50e:885d:4d1d with SMTP id l7-20020ac24307000000b0050e885d4d1dmr227543lfh.37.1704366100165;
        Thu, 04 Jan 2024 03:01:40 -0800 (PST)
Message-ID: <e506cc91-c03c-436e-bfbe-8ff5a3039dc8@suse.com>
Date: Thu, 4 Jan 2024 12:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/34] xen: add support in public/hvm/save.h for PPC
 and RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <365d4ab4591129af3a52176d991146b2f64f944b.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <365d4ab4591129af3a52176d991146b2f64f944b.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Since you change how PPC is handled, this can't go without description (i.e.
justification).

Jan

> --- a/xen/include/public/hvm/save.h
> +++ b/xen/include/public/hvm/save.h
> @@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>  #include "../arch-x86/hvm/save.h"
>  #elif defined(__arm__) || defined(__aarch64__)
>  #include "../arch-arm/hvm/save.h"
> -#elif defined(__powerpc64__)
> -#include "../arch-ppc.h"
> +#elif defined(__powerpc64__) || defined(__riscv)
> +/* no specific header to include */
>  #else
>  #error "unsupported architecture"
>  #endif


