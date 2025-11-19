Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33474C6D17A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165547.1492261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcZ0-0002GD-Ij; Wed, 19 Nov 2025 07:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165547.1492261; Wed, 19 Nov 2025 07:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLcZ0-0002DT-F7; Wed, 19 Nov 2025 07:25:14 +0000
Received: by outflank-mailman (input) for mailman id 1165547;
 Wed, 19 Nov 2025 07:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLcYy-0002DN-Mp
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 07:25:12 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e199f010-c518-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 08:25:10 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso244576366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 23:25:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f880fsm14684281a12.11.2025.11.18.23.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 23:25:08 -0800 (PST)
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
X-Inumbo-ID: e199f010-c518-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763537110; x=1764141910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O95jTT8eeuh49JH71XrU2PXo6LAZ9sVvPph8+ApeHsU=;
        b=Ww5OekMjR4atVqGb+4WX+LSYazRwwBwXxZNFkOy1+2+eai2pPNDyAryqgam3IR3RAr
         YSl9gucVLTySkh337PN5izhLpwCFu/Kxr6ueR8S6/ox+pIiLykcvAZTLZ95RKtSDz29z
         UllqRuooyyE3+iwaxD8kB0Lwi8dBpUAwzbORXv7oMbhp0hd4AJ5MCxZhxqEghoNK82iF
         XsMIuOwYf10yyajOVSwMbOiqtBL/TNQ5sSBc340Vd6cgjR6eAJc7bWBqZ9SQa9NKOP/w
         eJqimGbSwK+PJmiXDaYZJ3oPOTRe/Z9dsLOzh/87GOiakZLEFV3ewE+mpaTJITdznH3e
         D8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537110; x=1764141910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O95jTT8eeuh49JH71XrU2PXo6LAZ9sVvPph8+ApeHsU=;
        b=L7AXPXMVUX4wB9BV5tAvyvXvI0lK9qG6lJ0U33wbZ7GT2qxABsMCnhYUwBmljW3DRy
         lmLJjHlwUGjQCBD3CgpmO8vlSUanvgMzTNIaIc7pHW4zKF5l10ziYou2vQucdQG7brxP
         IwU79B2kkDKzb7Th+26qtkGIXELmGOgAWqM4GmJGbY+xfID2guzaLgfw7yIUlSgihOFO
         LF+9aOSNG7lp2Oz8kOF16Fdk/+KDTmODceazl/Sg0hh04Pnvs2rnK0rOksQStyq0qPmF
         TTB2PEvN+XPy8EjiPBe+Z/Vqg/5TyCdq7d0AsvjGS0g+ZK+cv+UMD5SLvaKNk7l/AUvp
         OO+w==
X-Forwarded-Encrypted: i=1; AJvYcCU0njOQ6UBjTsLZWJaIOq4ShALBtc/bzvy4AvGrTfxu+XJ3xvPcyfJAdkrKvd7pKXKk4syQrmuYI/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrCJRdwPDQdEMLWVeI+hI/Tn578xdFnX/b67RvZ7Yj5npApAcY
	GIiQayMQ7kIRztlHuzteQEGvwwAC0gLmiW2ZCFH2EhntPKvZMn8R6Y24X3mm/s8lTw==
X-Gm-Gg: ASbGncttPhsIgXquole2cMj3tjywS8NB6bWxOFzd1BDzV0JGUPsnHrx46hgRyCZyizn
	3TjiPA5ZsMou0Fp5ylrGmc4MNe/JdZ0nEfMFxM+fSZn14CbFnKsfj+5Wh6Q1bFvtY8oAGaHtfGP
	S55jJp9z6vQMYktSM0dsXmGsCygT/XMFEMxtOpFrhuuvuNb6UTj2Um0Bh4aHxyTncOS4/jv9QTt
	alfNm2FsGlrKtf/JvIA2tVwkiedO7s19tlDf5X/tkWKFHOgwh4DhSlTYJCl8lvC6GOPybod5tsn
	sjNhcv2GBpSEVoq/5JEKn/s05MXRohc5H73wSr277fs4IZBRZKdRUaDygPm9abVALfpB2hjk0W8
	vDTAphMMiao2ZPvyf6qZz6RSy5LeOkosaYaLlfWMtQiTKdwkKCxWFbWKoz+JYxxjaVfufSXtdXw
	1N58qAyAQVqvgIdb2rSKqt2I5dYqlYlFWy4M2UhoGZgIX4J3GLtHOoZz4QdqAvPid2Lizq8L6aK
	JE=
X-Google-Smtp-Source: AGHT+IHZPGNq/eVaON2hqs6++jSxBp76vTZoGnxBw+P7lmeV0Xoy/Vf2GIFzsn/TlSd5+jX7a4N5ww==
X-Received: by 2002:a17:907:a44:b0:b73:544d:ba2e with SMTP id a640c23a62f3a-b736780d5bamr2272943966b.25.1763537109804;
        Tue, 18 Nov 2025 23:25:09 -0800 (PST)
Message-ID: <d32700af-909c-44e0-afe9-c7f54fe9b332@suse.com>
Date: Wed, 19 Nov 2025 08:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86: replace APERFMPERF synthetic feature bit
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <505029ff-cb2e-425c-bf5c-3ac364f32140@suse.com>
 <8c704f68-591c-4605-a649-86ca0ada411f@citrix.com>
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
In-Reply-To: <8c704f68-591c-4605-a649-86ca0ada411f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 16:41, Andrew Cooper wrote:
> On 18/11/2025 3:07 pm, Jan Beulich wrote:
>> Use the respective host CPU policy bit instead.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Right now, the synthetic features get levelled across the system.  Now,
> we take the BSP's copy.
> 
> This change is broadly fine, but it does need mentioning in the commit
> message.

"Use the respective host CPU policy bit instead. This has the (tolerable,
 as we generally assume symmetry anyway) effect of using the BSP's
 (unleveled) setting, rather than the result of leveling (as is done by
 identify_cpu() on boot_cpu_data, rendering the variable name somewhat
 misleading)."

?

> One thing we may want to do is take greater care to get the
> masking/levelling MSRs properly level.  Right now, if they're asymmetric
> for any reason, we would previously end up using the common subset.

Possibly; I'd prefer to leave that to you, though.

>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -11,7 +11,9 @@
>>  #include <xen/macros.h>
>>  
>>  #ifndef __ASSEMBLY__
>> +#include <asm/cpu-policy.h>
>>  #include <asm/cpuid.h>
>> +#include <xen/lib/x86/cpu-policy.h>
> 
> Why both?

The former declares host_cpu_policy, while the latter defines struct cpu_policy.
And neither of the two #include-s the other, afaics.

Jan

