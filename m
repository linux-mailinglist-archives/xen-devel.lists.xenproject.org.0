Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B759F2FFE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857876.1270075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9n6-00048d-KM; Mon, 16 Dec 2024 12:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857876.1270075; Mon, 16 Dec 2024 12:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9n6-00046p-HQ; Mon, 16 Dec 2024 12:01:36 +0000
Received: by outflank-mailman (input) for mailman id 857876;
 Mon, 16 Dec 2024 12:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN9n5-00046j-73
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:01:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e06b1a4-bba5-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:01:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so25472535e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:01:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602d76fsm82147465e9.18.2024.12.16.04.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:01:32 -0800 (PST)
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
X-Inumbo-ID: 7e06b1a4-bba5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734350492; x=1734955292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eru0yi5UTg7G8gcdUMXhgut/0ygz8qe/9NCcR7BjtcE=;
        b=Ben+ya9snnLNwnkAuC3O+iGgtd38xqYFp5FvlugxgJHtgizxV0UWkma5B4IpF2x5dX
         0JnCjpB4bmwUVASjApKNODVFMyjKW3ESzOm0M+8P78gGs6r8TCW1k+DaxSRRcyKzcVZJ
         fvkbQIyWUH2A40aD9LnbjSQjlYmApd9rFXMZ8PBt9EWgnzpW5ut5YbMGjEkLnx1GY/iV
         ocZ63eWHkjeGQOzyyTJLbiyZ7+KgVI+/aNeSXBvzS2F0bA5ADUQgbWL21Klb5KhyCjBi
         RubRaAnj20+txm5k6PzhdIL/fKwfli283MPMZEe95u6DaAAFcgNXnCf86Sl+jE9SgeA8
         LE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350492; x=1734955292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eru0yi5UTg7G8gcdUMXhgut/0ygz8qe/9NCcR7BjtcE=;
        b=Jkq2LbRKnY2e28L20ZlMBnb+dJyI6ZFzJYBvNNZ1pTDBiWSseMZWXK0W1yOolMSM5d
         3iIWOSNAK/ElRDXKxcqpJG0o345ozibchq2z6+NED36swQDU3PRyQi3x1hmYMswgt8Lr
         Sm290WXiTlZDKKhiVLEyyZ+LqLUqTeDIvIb/eLtqIg5vM3mvh7DzssL2krUquV2+ZbQm
         br8AmykfWRDASaeqK/19yRnc0g8gSkZZM4t3vXW8L9tIGWkjHz0MTjOa7zdrGNQ28ZFC
         +IDig8SGbVx8Rue4vqET1GvdfIVVyO9eeZu88MM3SEOlYTbdBaPmf2LxgBk9PnJNaIuw
         KSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGAJUIzfwp2Ig06LwBJTfZWF2LIMD/J38jerE7nIArli0YxZ7b0PaP0Gkm7BmqAw3dtE1VjI1WWFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymd4CKEchEmtPRSL1yddzHEnt1bcJtiy8Xl/Tcckb6nIDoQpbA
	o7B4FP+u5qqGIWfKueyv/vndzpTpwbHiUmN90G5pTAQAcX9wRAWBhFQVJFuSDA==
X-Gm-Gg: ASbGnctpazCwd20sY8FaL8uxFR1mhjPfw6P6Y2UkxxsY8dkU3/Z/Ha/Jjml2s/Gd90V
	V2vqA5augivIK8jl2dE755srqxkE/K6eSq3Xd/yLzPnHpF+brfL6EvxUAFmz1dVdtWhr7w4vlPm
	6qc+i4770n7c33k/AWLY3NHOrVK/QXHtZh4yVZD6PJ3etd0YQjMpVe3RX2Bg3pwvlCRiPssuwpP
	J5l8nEH5ruFvomWOkISqC9VUNm8t4TELuFDGY1MpapSlm4fEXHbl9bfIus7RhG6x/W+gjzKRu+0
	Sh6oqE649bx9RRJgXCX5wtGq7nsGMq82wLimIzPI0g==
X-Google-Smtp-Source: AGHT+IEa62phwZgzIwE3N2wcURHjJ+2Vm5Hfgs0EXv4ZqwyxSBP21VnklcyYazM1uPegKOhSZfiYvg==
X-Received: by 2002:a05:600c:5397:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-4362aa34e4cmr89337155e9.5.1734350492552;
        Mon, 16 Dec 2024 04:01:32 -0800 (PST)
Message-ID: <96c6dbc9-05f3-4e55-acee-5e9f9e2c93e5@suse.com>
Date: Mon, 16 Dec 2024 13:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-10-alejandro.vallejo@cloud.com>
 <bc308e63-5791-4e29-a218-0c83728c116a@suse.com>
 <D6D3VA6T02AX.3PVLA7M6C30H@cloud.com>
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
In-Reply-To: <D6D3VA6T02AX.3PVLA7M6C30H@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 12:58, Alejandro Vallejo wrote:
> On Mon Dec 9, 2024 at 4:26 PM GMT, Jan Beulich wrote:
>> On 05.11.2024 15:33, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/x86_emulate/blk.c
>>> +++ b/xen/arch/x86/x86_emulate/blk.c
>>> @@ -11,9 +11,12 @@
>>>      !defined(X86EMUL_NO_SIMD)
>>>  # ifdef __XEN__
>>>  #  include <asm/xstate.h>
>>> -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
>>> +/* has a fastpath for `current`, so there's no actual map */
>>> +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
>>> +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(currt ent, x)
>>
>> The typo of the first argument strongly suggests that the macro should
>> already now evaluate its parameters, also pleasing Misra.
> 
> Not an unreasonable takeaway. I can expand as follows instead:
> 
> #define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (void)(v); x; })
> 
> Thoughts?

Why would x not also be cast to void?

Jan

