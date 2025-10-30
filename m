Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E010BC1ED6C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153354.1483714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENMv-0006Yi-N7; Thu, 30 Oct 2025 07:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153354.1483714; Thu, 30 Oct 2025 07:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENMv-0006X5-KQ; Thu, 30 Oct 2025 07:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1153354;
 Thu, 30 Oct 2025 07:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vENMv-0006Wz-3D
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:46:49 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9629b631-b564-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 08:46:47 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4285169c005so397299f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:46:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df3c7sm30044856f8f.40.2025.10.30.00.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:46:46 -0700 (PDT)
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
X-Inumbo-ID: 9629b631-b564-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761810406; x=1762415206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pjY0JcyENlFSz4Rh5f5GYTdgjqNLbd7cSXQb1Xl+HDk=;
        b=gYQssAYXG5zoaWvereXEbQtTAtsW1IbIQ+u4Nef14FQfcro8xPhoWY5dSryBdedYiX
         US5/W4KdKZCkhXn3ghsTiKfbo/blD4ynEYghW7MrN6y+VnBAf5w1Tyra67y9berF6WEn
         iSzqs8RRrZMPY3WkBXM7NtlJqdmNPJ6ZanBgMJ42NGyqhtN6ZDyQoySjjJ446eJ/n/MR
         fkShSoa70UlES+DhjtxFANmKMSQKakjoj1/wOy+jp6MnPskEgYDdZ449M5kVMELy+4Lh
         S1q1G4OkMifkVFJI9McSMWB7ycADWdTq66zfDMaBQPJDcu9z86P/ftMZRHzTkVjczAfM
         gUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810406; x=1762415206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjY0JcyENlFSz4Rh5f5GYTdgjqNLbd7cSXQb1Xl+HDk=;
        b=rPClTuBYExWa7DHTPYa/KBjmy20HKUv9yde/27YcdSKA9htOD3lbyg14nXl4wFmfbi
         xZYBPsbrGoHbhz3rzq527xVBcOVSXXFrTZMz2/dNMaiXcuYypRTrnRlPNtdDzaVY84YR
         btmLS9vPAcjMJZ8rrY5ZOTeVFABnoWtsS+3pPl2dVWqSGNVIWUG0nhIbcT2gd3e2qUe1
         /6Hbvm9q343SG3K1fKswoeCqv7I/suLupQbl4oUBV6qZBzINqIJorjrvWwHV70RNDYEX
         Euun/AHZt6DNNAziXkeGoDIlYFNGWCJE2a041bOHm55qKbC0dGLusztLOH06CWSFAO34
         jl4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFLdEfulwiHcCvKr773tp7+2tRXaTcviaifcvbSHE4SxtjkB4Jd3Vo82Fba/tIfKCrD9t/6DrY1JQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygW5DkOynXqD0wpTwzfOgdDmabFKWGmGGW+faPI0YkIhae4q5o
	LWwaDA+U63tGf2XfLO1jEtdVQZQFBQJyICzatcjtmHULyNZO6K5fs26sQbmNQss9pQ==
X-Gm-Gg: ASbGncu2T60MnUjoFgkjbXY6wOrNIC4ziPzejQS6gsHHhC0rClxOoygsO52lrcqIEnA
	GNJ1WnRV1cx+J2DsWPL3+LKNXHOTTRU/NqL9uylcnGnR5Eg102in4jHNQzLpC6HG9TcF0NtnWLY
	RrM4mOt1ot4C9WhlFpF5czOjFspb++q2bgEjyCDEgS8um9KPD5Yae/XcGXtYMm7C5PXCZOHtwI/
	5w22Hcb5Ar0aVTCMV3+htTfaDhP1NL5yDZdGU/SEl7uMUbKIrwKERFio2yw3KCGME1ZFoV5fxyW
	lPr32QMPfaXiX06s2Wlc6aEPGASELfkx1n8e3GSnA2MRCEbgKA1m8qBFJ1BcGAxSLLkRUJCg0+l
	3WztUQ8K9H9qHNughdm1czpSLCsAWJIJXyuY8zkftC9SVmyjRD8oK/Ebs2h4RRW+p9BoyvIDKBy
	Cz2gGG/TAtrHgLKP3oSN7qXZM9hjLxQX1cKVPXr1R6XbdeRwpKWKIik19E4LUo
X-Google-Smtp-Source: AGHT+IHbf5l5TIOhROfNlq8kc4617nzL3CYpXuSgq1gogzNZL1A+G8952FwsO8Avxw6+SP5mKNeJ0Q==
X-Received: by 2002:a05:6000:24ca:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-429aef77a71mr4366877f8f.3.1761810406406;
        Thu, 30 Oct 2025 00:46:46 -0700 (PDT)
Message-ID: <1d1170cb-debc-4063-b98c-263c7b9e62d8@suse.com>
Date: Thu, 30 Oct 2025 08:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
 <ee234574-384f-438a-8bf2-e250b61bc75b@epam.com>
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
In-Reply-To: <ee234574-384f-438a-8bf2-e250b61bc75b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 00:08, Grygorii Strashko wrote:
> On 29.10.25 20:26, Teddy Astie wrote:
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -509,6 +509,8 @@ struct arch_domain
>>   #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>   #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>>   
>> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)
> 
> Would it be possible for you to consider having Kconfig option to make
> such configuration global, static?

Especially considering the post-commit-message remarks I don't think this can be
other than a per-guest setting.

Jan

