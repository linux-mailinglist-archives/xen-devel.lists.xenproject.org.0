Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91293806D38
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649096.1013440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApg1-0007WE-8C; Wed, 06 Dec 2023 11:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649096.1013440; Wed, 06 Dec 2023 11:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApg1-0007V7-4i; Wed, 06 Dec 2023 11:02:49 +0000
Received: by outflank-mailman (input) for mailman id 649096;
 Wed, 06 Dec 2023 11:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rApg0-0007V0-2t
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:02:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcda4654-9426-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 12:02:46 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332d5c852a0so619845f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:02:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c12-20020a056000104c00b00333339e5f42sm13279318wrx.32.2023.12.06.03.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:02:46 -0800 (PST)
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
X-Inumbo-ID: fcda4654-9426-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701860566; x=1702465366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3m6mAP0dykMt1zxfzRMwB4ANO/WsCIQyyd/YIRmxN1A=;
        b=KZvCxQ8VmprVYUKEru5Lq51J8J2FFdbkKnIZkn1DdAX739nRmvAMabAWQaFDEV7Uk2
         eHvx/6y/4nXMSxhP9ca4aGwPU0jyC4R1y4W34BnrA40ixxTzgwhiwPgaocDL78N19DKY
         ep2fh/l3nYzUV11PqQYXIFOESN+2g0jBK00nAU1hD/NnptOd96G4m4iRJJrmsQHGwKXL
         6Zv/2pXyA9d5CbtOgiKki5nETERDQOgT0PF+mo4rFNr4y2hGhwg8kwUKQhMVNagZ4jJf
         bxe1GAWugS0co+xs+/CLQQY+TNweQIduqXgyzGZUlI09I/I6Kok2qrbr/rNp2AhZJSea
         vCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860566; x=1702465366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3m6mAP0dykMt1zxfzRMwB4ANO/WsCIQyyd/YIRmxN1A=;
        b=HEyozpcFxZyYCjdTcHWUzvDg9GHkwdMtOjYezyPHev4LYkvhb1opQL3WFIFzsjU6Ly
         5T8j3rNVqv9ASII7q9Nst8iXL+/Qv5/+/9c5O6dOWO+uAAWFa0chVgOAUtbvlbcBpPMv
         mCNwh34NaT86GjWhvJ4cd6iB7QuyW4fsF0uU8aKQcyT1flNX4Ysk3xCqA0eIDh2AUXlQ
         +eSxVhk2DO8TLmti7DIGRAF4Nc3lEmvECD3qNvFZS4VTM8Qj2SdqcX3YDPW91PH/Hqfd
         WS5QJccraaxO/HfjMrhPClt3FPXYsANl1QRHsEiDcJN33e+IgImxZZg5exGmEi1AW+/K
         DBmQ==
X-Gm-Message-State: AOJu0Yy0hTDAHemsGLyB9f7Jje9F5ifYYBzhHIxP17PT6mM7OP/41dYo
	JMIY0t6EyCW69gqIIbVClrxA
X-Google-Smtp-Source: AGHT+IGw00TXegRH2vsGFbEOpFPGLskp4sOiu8yJ0NICUaHJ/QMvfSL7zIE3LdZIoyBAogAimQv3GQ==
X-Received: by 2002:a5d:54cc:0:b0:333:533d:9ce8 with SMTP id x12-20020a5d54cc000000b00333533d9ce8mr544021wrv.90.1701860566284;
        Wed, 06 Dec 2023 03:02:46 -0800 (PST)
Message-ID: <1607a68e-e8d2-44e0-ab01-97cacdfad8b0@suse.com>
Date: Wed, 6 Dec 2023 12:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
 <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
 <8224404e-ed23-438b-8a61-23d76a980cc5@suse.com>
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
In-Reply-To: <8224404e-ed23-438b-8a61-23d76a980cc5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 11:02, Juergen Gross wrote:
> On 06.12.23 09:46, Jan Beulich wrote:
>> On 06.12.2023 08:10, Juergen Gross wrote:
>>> @@ -15,67 +7,82 @@
>>>   #include <asm/byteorder.h>
>>>   #endif
>>>   
>>> -#define get_unaligned(p) (*(p))
>>> -#define put_unaligned(val, p) (*(p) = (val))
>>> +/*
>>> + * This is the most generic implementation of unaligned accesses
>>> + * and should work almost anywhere.
>>> + */
>>> +
>>> +#define get_unaligned_t_(type, ptr) ({					\
>>
>> ..., do we need the trailing underscores here in addition to the already
>> sufficiently clear _t suffixes? (Leaving aside that ..._t generally is to
>> denote types, not macros or functions.)
> 
> Maybe we should just name it get_unaligned_type()?

I wouldn't mind, but Andrew mentioning min_t() / max_t() suggests the
present naming might be okay, too. (Still those two macros signal
something quite different with their _t suffixes.)

Jan

