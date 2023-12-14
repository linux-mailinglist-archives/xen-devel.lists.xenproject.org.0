Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0786813601
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654678.1021855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoNp-0002kr-Io; Thu, 14 Dec 2023 16:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654678.1021855; Thu, 14 Dec 2023 16:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoNp-0002iK-G4; Thu, 14 Dec 2023 16:16:21 +0000
Received: by outflank-mailman (input) for mailman id 654678;
 Thu, 14 Dec 2023 16:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDoNo-0002iE-C7
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:16:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c812ca3-9a9c-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:16:18 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f8f470903so670092466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:16:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rm6-20020a1709076b0600b00a1bec12448csm9546273ejc.150.2023.12.14.08.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:16:17 -0800 (PST)
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
X-Inumbo-ID: 1c812ca3-9a9c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702570577; x=1703175377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0dF8FAdH10Q8hinICWOsI7Ckkeic9tLUQyzW8L08mU=;
        b=Uo7wMbqZeZUBWoTGB4lCcGOW2XvPkYkH/h6GLVcEN8dCZ+pndN0f8i6MnmPJoMsgbS
         zbXFCBElMZ+egWigAhrxW8dZl4v+203GliClEjZn5VcYxb1sUhgcqUf/1XQmR0jlTsOA
         l7Fqt8C3aA+Ny1fZvuNvuiVQmI3ZToTOIqtATI2km+iIraIOnh25Hg2b3O3bYZ+ooACY
         qNQaMocLqysNxe4WI69uXiuRQb0Qt4skUX6vLlBqjxTODFTjHJB2bpX2fKXZFtLDf+OJ
         kzsKidgIuSeKi60BhadrFasGnvOraJrRrS9I0lfTRdX7D5xNS5ukd12hSbz9Rrs/ZmPy
         FjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702570577; x=1703175377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0dF8FAdH10Q8hinICWOsI7Ckkeic9tLUQyzW8L08mU=;
        b=RetJ2IbrJ5nvhAInzT8WzZ2ZkVf0TZwnUbD8k47d2T9br45PDyaTwzY4VpHrcZOxsp
         RWxrxR2RrKf5XAe+OHvbWobMZBZNNyGW12ZpvkZz1yYPKVwnv4+QUgQ+1pKK5o0C1A0v
         7Blo1fcDftxHZIi+qHZp5al0DIdB76vS9JcgU2WV7AC1bQUCeJ743lTHTVLdhpj0jsOI
         Kic2wMiSzXOZbWe7z5OyjTCShsDUotN9Zf69hnzkwTaRgOYx+9oqkB/wJD//ahaM5eGZ
         0FN65d0yXisL5BzeS/M0Hkynj1rEVUPpHbyKgNJkfhJmsx2C5A0puFwLOKIVJP19ucch
         7gZA==
X-Gm-Message-State: AOJu0Yy5hWvhxr/0G8YPSVVtlvT8mWF7GUgyVFaJe56vVfpGUpDzke1w
	mg+kYED+wdLcqz7cH2zT3MwN
X-Google-Smtp-Source: AGHT+IH80IQDQIvpiO+9AGVV/3Os7myTiGO49dSMTc26qk8vWKXmSArR5xo5eVPUNP6ArZfTPnfwHA==
X-Received: by 2002:a17:906:118:b0:a1d:b924:1042 with SMTP id 24-20020a170906011800b00a1db9241042mr5079515eje.13.1702570577563;
        Thu, 14 Dec 2023 08:16:17 -0800 (PST)
Message-ID: <ce90b4dc-20b7-41ea-ae51-9e99d4a3c07f@suse.com>
Date: Thu, 14 Dec 2023 17:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/39] xen: add RISCV support for pmu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <55a47c6b5df5ea8c7dbe38995616b997f587880e.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <55a47c6b5df5ea8c7dbe38995616b997f587880e.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I think though that this would make sense to fold into patch 4, which is
where the relevant (stub) structure appears.

Jan

> --- a/xen/include/public/pmu.h
> +++ b/xen/include/public/pmu.h
> @@ -13,6 +13,8 @@
>  #include "arch-arm.h"
>  #elif defined (__powerpc64__)
>  #include "arch-ppc.h"
> +#elif defined(__riscv)
> +#include "arch-riscv.h"
>  #else
>  #error "Unsupported architecture"
>  #endif


