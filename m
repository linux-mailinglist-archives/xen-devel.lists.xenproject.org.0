Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0DC77B77
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168230.1494300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLim-0000qW-BZ; Fri, 21 Nov 2025 07:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168230.1494300; Fri, 21 Nov 2025 07:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLim-0000nc-6a; Fri, 21 Nov 2025 07:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1168230;
 Fri, 21 Nov 2025 07:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMLik-0000KE-ML
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:38:18 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc7b709-c6ad-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:38:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b737502f77bso252822566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:38:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdd5bfsm401814566b.9.2025.11.20.23.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:38:17 -0800 (PST)
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
X-Inumbo-ID: 0bc7b709-c6ad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763710697; x=1764315497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmetNFlofLudyH9TZxlHb/h7PZWyzefI7AKq4pYhvA=;
        b=d+xEwPFPl6mfN0y7aJkWK0norMOK/Zr3/JYDo89nc5j6SzlenKwLr9enhQ5T5CaoSJ
         YNKY9nyx2pknVWNAp4TUs75nGt2TBtWTkG/Y+rLTQfNcGIFXguq3O9D0wVEnE26Ubzlk
         UdzAiQ90+CXzNxiWYYAjsZFoBOAWUX4EEajCC/GcD5qa8kdv3x9PuBd3DdyH0IxO/sNJ
         kRTcrGp9xBPgrCFWTDgixjdqLyyGKa3nxcg9rYMS4S4v64HcOSgSb6nUBsJDdYKJPz2d
         yiMhH4Xm7UQfj2ECzU3OEvQGnuSnKcxUcwOTNR5CFQgIAKEDFf1HWDgwECJpCs28lV1A
         DLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763710697; x=1764315497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFmetNFlofLudyH9TZxlHb/h7PZWyzefI7AKq4pYhvA=;
        b=s1XyQGrrQGn7iXIY8Z5SMYgiiil6vX5nA+YE2//RKNNBItcEU/FqUfFrbAjqPMCg5T
         HhpIeDq4JNrf/XudDhgziEH4MqPWqTPb+XqmAuVuZrFVB6AN9CHdF61d1eE7a2YLZd3v
         jdDayiPyIgAwrrKdw1771iTRsM1fANeWAHhq648F5RiFc2ICTx9gvnUtFPjdd8zn6sIW
         ZvVzqosB4KTRq70BsxcWFPpR2nVGjya/gCt9KtadH3Bo+Tkw8mE02j9NXk6aASAGWTfA
         UKytqdmuQWzFCas1TX2Wj9MZ1W7ipB7FnPjSIzqPdkVx2t3bet3lWHcdjPrNLdlD9gon
         2F4w==
X-Forwarded-Encrypted: i=1; AJvYcCVVilEo+ESWKSmHEuRfUCMSvAHEJB6/RcVXnPxCO6+g0+bitt6WzKr8uiEVkhLgKDGIOFUypQKQ/LI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJds0Tl35RRirtS0dYie1MzZaRBuG9Jqf3+Xx1mE+lhQoStgrp
	mnIy+vpTQng30G0RhK/feOafR0gPRR9LZJaLeMK1v2s92lrLt4P/KZw/0lwIZTIAKQ==
X-Gm-Gg: ASbGncv+QOdB9NsBkI/9lcUHzPOvQV8cjGyNCJ84wPxp87WUQWSieAq6dV1QOUiuyia
	p9Fv89DBviSfU22/Z3JVit6/NLFvZPgbrQ5lMJVlD14QR1/a+768sxsG9IomurPiO09rqMablLB
	MsjUvfTdSw4RYekKunrJ3DNm6xwqS697nl77fAYKQzDhC6UI7PZ8VomTTCEMOl6xpFtGShAKiXN
	uc86//KYW96RxtD9YOsJ5b8zkrbsMcDJyqUZKus+x8hn3vB/bKochEidqOEY+4nPlU0wLwSbjnG
	wABHgtlVoapSPmqriFX74ryS2IoTlWpJnnZ6lwBlQG1EahjZp1qNzif04xK0UEDJccY84UtdOuV
	eBlBkKAZpLFKJGTL6zLKMOQ1aAkGPKzgTzao1Qa53bQ1Tz3OYPLJL3N2/9PtwNRcJPzXKiIqIjl
	iUdMjnlFWNlIH/ofSjk61LZIwuS3JMDkuESJc+bakjcnktZxSlPFtX6HptduoDoGra2YJiHugsB
	q4=
X-Google-Smtp-Source: AGHT+IEMytwskyFaqeJDlDVPN/l7keiGmF8xZPhZ7zxBNCP1uzwww/zGDrzW/wm5u8yU+LjQ+gVoOw==
X-Received: by 2002:a17:907:8dc3:b0:b4f:e12e:aa24 with SMTP id a640c23a62f3a-b7671591e7cmr101900366b.22.1763710697327;
        Thu, 20 Nov 2025 23:38:17 -0800 (PST)
Message-ID: <9d631a1d-2647-4ee8-975e-0e2025c37359@suse.com>
Date: Fri, 21 Nov 2025 08:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/io-apic: purge usage of logical mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-6-roger.pau@citrix.com>
 <63a4f416-f475-4b6b-8f44-db570b7a75d9@citrix.com>
 <cd41f345-f5db-4d64-8914-a6984f7fa83e@suse.com>
 <2ca642c5-3fcb-4a35-8500-ed40e540b300@citrix.com>
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
In-Reply-To: <2ca642c5-3fcb-4a35-8500-ed40e540b300@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 19:30, Andrew Cooper wrote:
> On 20/11/2025 2:27 pm, Jan Beulich wrote:
>> On 20.11.2025 14:18, Andrew Cooper wrote:
>>> On 20/11/2025 9:06 am, Roger Pau Monne wrote:
>>>> The IO-APIC RTEs are unconditionally programmed with physical destination
>>>> mode, and hence the field to set in the RTE is always physical_dest.
>>>>
>>>> Remove the mode parameter from SET_DEST() and take the opportunity to
>>>> convert it into a function, there's no need for it to be a macro.
>>>>
>>>> This is a benign fix, because due to the endianness of x86 the start of the
>>>> physical_dest and logical_dest fields on the RTE overlap.
>>> RTEs do not have overlapping fields; it's Xen's abstraction of the
>>> IO-APIC which is buggy.
>> I wouldn't put it this negatively. In the old days, ...
>>
>>> For starters, Xen's IO_APIC_route_entry still only has a 4-bit
>>> physical_dest field which hasn't been true since the Pentium 4 days. 
>>> This might explain some of the interrupt bugs we see.
>> ... as you mention here, the two fields were distinct (and hence overlapping).
> 
> Since when?
> 
> Even in the oldest manuals I can find, it's a single field called
> destination, and who's contents is interpreted differently depending on
> the logical mode bit.

And these two different meanings are reflected in the union-ized definition
in Xen. Which I still think is fair to describe as "overlapping". And the
use of a union itself isn't buggy imo; it's some of the code using it which
is.

Jan

