Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B058CAD4D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726852.1131240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Nbb-00057u-0N; Tue, 21 May 2024 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726852.1131240; Tue, 21 May 2024 11:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Nba-000562-Te; Tue, 21 May 2024 11:24:30 +0000
Received: by outflank-mailman (input) for mailman id 726852;
 Tue, 21 May 2024 11:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Nba-00055w-6s
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:24:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af686151-1764-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:24:28 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so738501166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5ce94e51basm688875266b.103.2024.05.21.04.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:24:27 -0700 (PDT)
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
X-Inumbo-ID: af686151-1764-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716290667; x=1716895467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvBsnKckcv8siwHttjPOLwSVhuZ7ny3vrc/c/QGK/tw=;
        b=goc+Padq+6E5bigVUlS0ttaarV91toNYHz2oXDC5IyYZnRuf4Q5t8mj1mkpfuXPShm
         xaVPs+sSDFuP92ljELFZDHO29WjNZdRTtzi6qLKhUcNcIuX0ZFJ6c6KwOmsb+VfkX2Mr
         If5yt/JTGKngIN3iJzixtAQO+RbRdlAqkJkjoDGkRtXzdaFnNtRu1YSCe1BHkU2n8hPH
         IF05Bm7eG+M0pbzuGOl1ccRKGvwmxQdJBBC8IUu7YCltbuSW/6SRCnIG/yCF/fFEnomO
         pQZXhmLmXRbyzoY9KwW7UIveLqXDx+mbUfQ7OpyaRWkA9J/tC2c0q9rSS+6qIkaQIum+
         BVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290667; x=1716895467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvBsnKckcv8siwHttjPOLwSVhuZ7ny3vrc/c/QGK/tw=;
        b=lZWIVx/uifpQVzmJwxWfHY5j8hM9FzcxyZqM8LCTeWPv8jXjs+VaOQt6jXXeP5N7qH
         Jlf9H42RTDcgeo0fXDmXMCEPTuDSuYs/Dov6WOV/FHANzpplvyUrs32iQm2VCwF8jmhR
         me6jTnR7GcuK/jI/h+GAWFvUSBN+Mbyvjs2/r0Ije4HLxFaUJvjSjLsdHnhi5/FaN5YB
         ouVE429qKt61297sLbAaXmkxbUaSI005oOQQDTdiLeUzIENN3umLBeTTwJrvvdc+YEhP
         B330NYNu/C45ELAFWis6wvgV0hV+mkNi1XL/EQaip7T79W5eIPcifg3XJHWyyOEfv+5v
         JlQQ==
X-Gm-Message-State: AOJu0YzsHn/NSI5IILFvMyfDw2rRhAVoStVU8ATvFaSejCM8wj2QmE+g
	6c2llOh8yCDmeuEGfVOrYnGdSBM8Y0y0dwUcbfrLhCa3zIsoID+bGUL7nnmIRA==
X-Google-Smtp-Source: AGHT+IEOfwEdWknvuu05DaO8dJ0CQzlIbqA7lR55qfnLCykl8YMm0TCLwXwr5xNM2Zj4Kp9JyC8nkA==
X-Received: by 2002:a17:906:4882:b0:a59:a727:1e81 with SMTP id a640c23a62f3a-a5a2d57a381mr3103859166b.20.1716290667595;
        Tue, 21 May 2024 04:24:27 -0700 (PDT)
Message-ID: <d3710ec6-63fd-4387-af7d-7f8f79c522e3@suse.com>
Date: Tue, 21 May 2024 13:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/4] x86/hvm: address violations of MISRA C Rule 20.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <6d14b3283005cf1a30c4fa24f9841586a41e2b1b.1715757982.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405151618170.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151618170.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 01:18, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>  xen/arch/x86/hvm/mtrr.c             | 2 +-
>>  xen/arch/x86/hvm/rtc.c              | 2 +-
>>  xen/arch/x86/include/asm/hvm/save.h | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
>> index 32f74c1db03b..1079851f70ed 100644
>> --- a/xen/arch/x86/hvm/mtrr.c
>> +++ b/xen/arch/x86/hvm/mtrr.c
>> @@ -16,7 +16,7 @@
>>  #include <public/hvm/e820.h>
>>  
>>  /* Get page attribute fields (PAn) from PAT MSR. */
>> -#define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 0xff)
>> +#define pat_cr_2_paf(pat_cr, n)  ((((uint64_t)(pat_cr)) >> ((n) << 3)) & 0xff)
> 
> just a cosmetic change

Not really, as Nicola already pointed out. However, there's an excess pair of
parentheses which better would have been re-arranged rather than adding yet
another pair:

#define pat_cr_2_paf(pat_cr, n)  (((uint64_t)(pat_cr) >> ((n) << 3)) & 0xff)

Preferably with that (which I'll likely take the liberty of adjusting while
committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

