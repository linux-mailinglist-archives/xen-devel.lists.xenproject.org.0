Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE0AD000B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008342.1387623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTzQ-00039A-Km; Fri, 06 Jun 2025 10:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008342.1387623; Fri, 06 Jun 2025 10:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTzQ-00037E-HS; Fri, 06 Jun 2025 10:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1008342;
 Fri, 06 Jun 2025 10:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNTzO-000378-Qk
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:07:54 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bdf9024-42be-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:07:52 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so1164451f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 03:07:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af3824fsm998040b3a.19.2025.06.06.03.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 03:07:51 -0700 (PDT)
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
X-Inumbo-ID: 1bdf9024-42be-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749204472; x=1749809272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AmikAL5cavKLcJ/8zdC6DtKWA3lk6mN6+P5caqth2G0=;
        b=ND2DtpOfX91kfK1zcgEPNCWK3U35V0a1JEXIFsedfEbYcT8SalpktYLz4ruV4OwQe8
         W+Htjv2OOXV7x94p+uviZUd1TLA3e6VB56yMAhub+jOqdtNiJat3qgH/XLSlEKAV5lYb
         r6id2nfcRdwgcTdIdRfdn5JX6IQcpuKE+24kwXG3SOfQXuVnI4aB7odG/Hxm92QbGjac
         io7WmmuVmQVzk0AZ45kPsJx+G3qKC6Vqr84xP/Wg7ZCy76f5qNgF66DLsxYlYa7VYI/W
         NmOgGnK/JoYz8WU+Tdn6uxuUWZmB0KX0ddREYDKx2DsuphatHgJ4RAIDhoqnubXuQObh
         tNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204472; x=1749809272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmikAL5cavKLcJ/8zdC6DtKWA3lk6mN6+P5caqth2G0=;
        b=EBQ3tgiu2J7evy0wZBy1slkS1IcwXfXm5d4iTJ3qtiJI1h7fO0HVMiG5TFPOVUnpQ8
         rY0lqcEZiIiZ9cG9TLbtM+VaeewkhepZZSFwj27+34+fiLVCXAJmhpCr8cSEWHYnnjAj
         WMklOwhN9Ua/Locx91t5UJ96/dV4FzUD5f3Z9TRk7qn/Yf8ZZhjHOgpG1jgcqwq35ayx
         Z3ir83gLbTIiReVUvcGvasq6wyTBaQ9mo46PljoufQNCaiB2cv4uysGIUjkvpuwW/75S
         WNIxNm9fZh82bk22hcXMxjmoVvMS0s6OCRyo+gCFcJmJwFD5STx7x3OQk7M2BfP8y5fE
         My/g==
X-Forwarded-Encrypted: i=1; AJvYcCXLJ6/2y+6a+JEK/B/6JHILDXsF19W8dfn2iiFrK6RerHn87d6s47LCJpbYNYpzy+sqxCJWLUy2ZCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXGDieXQsKxfxP2UscOJbT+nhB5jBLl62pArFRjIWbMRcEUhio
	TeSh9qzrAa+7DpwG8chZFgO9f3zbXtVhr/USrcTKfcowxHoLa3lmDUBx7LuD0SuL+A==
X-Gm-Gg: ASbGncsehcq2r1DPIOCeon9pfJzNwWrQQqYrvr4oyg44WNqMSvK+GP4puvAiLwf69/d
	IlVUQ/otxpDAaGHaANavZlTzgWUYx60+g3D9m3HSQIu75iEgMh5VLVH/doKDVFUz38jpwb+K9Qh
	csdsbi6ZCwHjZr3nrOJ7JJOrmemPT71mSC43fE6/KM1shmy9KoYUbr7FnsdTsOsNeDZViLrwFJn
	T8qQBLd/i3dXAzdSniXW1nHxb7SlS7qBCKjbDc8/bIozZKFJ6sEMBWSDwywes1rz8E78WVI2iaQ
	Dd/LtkFa/A8BBPJTv6ThlB0IjhEH/biZMg6s5Zzt5O0XWTZcuO9e1pOqG1CH4xdIulqgF2LZO+i
	wyyIy0w4KT5MVLIktbWod8afBv4ugnFeMyaVU
X-Google-Smtp-Source: AGHT+IFeaZmCnY/jHj3OxcFpsPXKvhxf185KrVZvz4XgthDZfpBxzhS2qU93cr3TwnfDNZf2KQksQA==
X-Received: by 2002:a05:6000:2504:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a53188a710mr2531258f8f.3.1749204472287;
        Fri, 06 Jun 2025 03:07:52 -0700 (PDT)
Message-ID: <66d75dad-4407-4b09-8dd3-c61b5d05ed91@suse.com>
Date: Fri, 6 Jun 2025 12:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] arm/gnttab: Break links between
 asm/grant_table.h and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-3-agarciav@amd.com>
 <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
 <DAFD46XOYPG8.3V37FNPAPPT3T@amd.com>
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
In-Reply-To: <DAFD46XOYPG8.3V37FNPAPPT3T@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 12:02, Alejandro Vallejo wrote:
> On Fri Jun 6, 2025 at 8:52 AM CEST, Jan Beulich wrote:
>> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -42,8 +42,10 @@
>>>  #include <xen/xvmalloc.h>
>>>  #include <xen/nospec.h>
>>>  #include <xsm/xsm.h>
>>> +
>>>  #include <asm/flushtlb.h>
>>>  #include <asm/guest_atomics.h>
>>> +#include <asm/grant_table.h>
>>>  
>>>  #ifdef CONFIG_PV_SHIM
>>>  #include <asm/guest.h>
>>> --- a/xen/include/xen/grant_table.h
>>> +++ b/xen/include/xen/grant_table.h
>>> @@ -27,10 +27,6 @@
>>>  #include <xen/rwlock.h>
>>>  #include <public/grant_table.h>
>>>  
>>> -#ifdef CONFIG_GRANT_TABLE
>>> -#include <asm/grant_table.h>
>>> -#endif
>>> -
>>>  struct grant_table;
>>>  
>>>  /* Seed a gnttab entry for Hyperlaunch/dom0less. */
>>
>> The description doesn't make clear why these two files need changing.
> 
> What sort of description? I removed a conditional include  and added it to one
> of the few places it didn't include it already along with xen/grant_table.h.
> 
> The title does say the patch removes the crossed includes in asm/grant_table.h
> and xen/grant_table.h.
> 
> It's, I hope, self-explanatory regular spring cleanup.

Then I'm sorry, to me it isn't. "Break links" has an entirely different (file
system) meaning to me, in the common case. Plus that says what is being done,
but not why. And it's the "why" that I'm seeking clarification on. From your
response to my remarks on v1 I was concluding that the issue is that in a few
places asm/grant_table.h would need including additionally. I didn't expect
any #include to (need to) go away.

Jan

