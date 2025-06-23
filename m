Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BFAE3844
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022154.1397883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcQA-0006KF-OS; Mon, 23 Jun 2025 08:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022154.1397883; Mon, 23 Jun 2025 08:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcQA-0006Hq-Lh; Mon, 23 Jun 2025 08:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1022154;
 Mon, 23 Jun 2025 08:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTcQ9-0006GM-1y
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:20:53 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f350bf3b-500a-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 10:20:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so2313194f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 01:20:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71c4bsm7354868a91.2.2025.06.23.01.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 01:20:40 -0700 (PDT)
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
X-Inumbo-ID: f350bf3b-500a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750666840; x=1751271640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bAIMvD61wph0ZIV+5MeDvox+/jllPfWb/wMgyKZjCpk=;
        b=XCdLG9Cvnf4hFz6VI1RxnKwksHC5si4i3ByokLra6nfQiar5TeJ19Ifo01peIiFuM6
         ZPpOnFQF8/s4ZrQuFKWoI56IhBolIdT7PZIFUKyK8WM5zfNyJGNAmp/cw+W8bfOG2/FJ
         kNFUM91YCKVnZrZHcW6ZVBZdKjYulOjaaaCLYKYfOVB5WAwb7kCQ2KCPlki6uy6322cp
         hbPAaSfcselSCbKCxiQ2ZqWIG4iKN7ziKLoG7wYHYxXAs8Y1GBJawQTqVOuBrn5U/Gbl
         JaaHNo0wInlAYBKx3/dAwEMxOlSapO8JllBCJyidCkDCfz04B/jJTgAUL2m45AZxfVHF
         +EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666840; x=1751271640;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAIMvD61wph0ZIV+5MeDvox+/jllPfWb/wMgyKZjCpk=;
        b=lm89uZei8r3t+apX60lDPJL3VVcq4Oph2d+9ibDLLvzQlc68YR8O0OTgbl3xiD2KIA
         RFNuvNKlXWrva/iiKjawEKlWG0nR6JFKWArxOmASROqCrJOm7EaEGJwlPGFNJLQKyzUf
         1IHj4W3lOjBxR7iewLTruaE75jlrZ1aQdN6qWz9O6UFqdJvIlD0jmYbE1N18MF9rYQ+B
         fOmZ1WpTWZyAIImMM+qcM4AuqXRiAEYBcjsQVnEjyoxaKQb8V+oTFbBGGj3CM2t7cCZZ
         BqtHUN3o5K7YquTsROenRL2F4Vqm7KMPyESpnSGmZHyrcv9HteElmezNuIC68X6izbQR
         pzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL02/Br47k4vweKZ8jmnCIPVWh+mXWf8VI0fTBC+9/nFZPmrmenou8/GJBj5aQjQAYUlisVKWYLZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHL6WeV60GLhgIb6JGdwy5uEcZUEUD4zT5F55Hv5P1vTuYQC/3
	mPByv0fehrCe1+gleBD6pVeV+zVbAf3nE6wlnglKhaXwAKJtHFQa7j5gSnn86DpuDQ==
X-Gm-Gg: ASbGncvHw4zWCTF+zT/fHG+4rISuGkVRLsPcfihSSCerMaysO2RNSbjFJ9XfkyNkNty
	mYqMRSzGkDFiDitVeCn9IukhFW89dRm88o8U3GdfCA4b5+v3dilHehIahVxJfYF4AsdYaaWx/er
	R/lqFreWdnxOWb06qb8fpUG2nDLERGrjU3aQuUFqhITjgJ3WNJ8KIk3PX76b7qeSfnZADoxp+HC
	D7GZ+Ny0fwvrOlpMHdMoGXf9enKPizWIsZvTjTpJ7pH/XG8qA5ZOIRt2c34//RHhbP7Sge/Mtgu
	KvuhwGLNl5QQPEH/VqTj8semtVRO6hJhLwSJWV/iKNbz69wj5P3owDD2dI/DFlEC9H4uLg+jpAC
	sMqUPkv03+x3ZN28/DnhWWAon/Rfx7f5TzTd7MannEHRRE9o=
X-Google-Smtp-Source: AGHT+IHdpkwP+uxGdZkNpklxpM9Ih8cnjGSuleeOKKG4oA7ElN0AiV/5YfyGhWoeuhsXcCRGMbj8Bg==
X-Received: by 2002:a05:6000:4186:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a6d1307670mr8547616f8f.38.1750666840469;
        Mon, 23 Jun 2025 01:20:40 -0700 (PDT)
Message-ID: <28e3a8bf-79c4-42d4-a0e6-9458ee31f24f@suse.com>
Date: Mon, 23 Jun 2025 10:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: fix header guard generation for asm-generic
 headers
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
 <45b33975-be79-40eb-a860-ca3eb71443b0@suse.com>
Content-Language: en-US
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
In-Reply-To: <45b33975-be79-40eb-a860-ca3eb71443b0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 09:51, Jan Beulich wrote:
> On 21.06.2025 11:58, Nicola Vetrini wrote:
>> Dashes were wrongly not translated into underscores, thus generating
>> an unexpected guard identifier.
>>
>> Fixes: ee79f378311b ("xen: add header guards to generated asm generic headers")
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/scripts/Makefile.asm-generic | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
>> index b0828018080d..f6850758c54b 100644
>> --- a/xen/scripts/Makefile.asm-generic
>> +++ b/xen/scripts/Makefile.asm-generic
>> @@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>>  quiet_cmd_wrap = WRAP    $@
>>        cmd_wrap = \
>>  	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
>> -	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
>> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \
> 
> Aiui the other argument also needs to change, to '___'. While some tr implementations
> may cope, the spec is quite clear:
> 
> "When the -d option is not specified:
> 
>     Each input character found in the array specified by string1 shall be replaced by the character in the same relative position in the array specified by string2. When the array specified by string2 is shorter that the one specified by string1, the results are unspecified."
> 
> Easy enough to adjust while committing, I suppose.

Except that I notice that this was committed already. Will require another
fixup then, I expect.

Jan

