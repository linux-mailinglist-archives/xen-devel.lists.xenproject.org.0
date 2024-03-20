Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E747A880BAB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695729.1085719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmq1G-0005N8-7c; Wed, 20 Mar 2024 07:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695729.1085719; Wed, 20 Mar 2024 07:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmq1G-0005KC-4J; Wed, 20 Mar 2024 07:05:50 +0000
Received: by outflank-mailman (input) for mailman id 695729;
 Wed, 20 Mar 2024 07:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmq1E-0005Je-9Z
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:05:48 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44671512-e688-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 08:05:43 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so7768316a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 00:05:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ww5-20020a170907084500b00a46b8712654sm3634763ejb.31.2024.03.20.00.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:05:42 -0700 (PDT)
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
X-Inumbo-ID: 44671512-e688-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710918343; x=1711523143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruc+ryFZffynHzmvVdV//wt6vGEmi9cPm/fD9CQRO3I=;
        b=Fs2VjMQjiJmQXapz/Ok+YuA6f6MM08Z9tET7Duhy6wynSrVYTj4e0DyfPctCUr11uH
         1k9Qsnsj0JGUys2L3xMtmGnonWQGkusRjZ06vw5DnIkLLcczirP5uBPv+fsuNDU5cEf7
         UTf31ROYkiR0KBI3wQ/GCB6koL+xERh5yaBgyR5nJ7Bk+4Kh9tLtORG2iXldCtsFntP/
         JShWyRJ3r1Nea9GWAe6ddkW2Pitq4Hck1qQv31EYBz/d0slSsamWnHacF78QJ/OdX/AG
         zF3FCIShmMbOSUl7hxUjFL04WN5g5guDan+mN6QLNZbHwNviAtS/AAdeqW9EMRleGMDB
         XQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710918343; x=1711523143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruc+ryFZffynHzmvVdV//wt6vGEmi9cPm/fD9CQRO3I=;
        b=nNXItw8c2sseufUDALVM3PiS00GHKiMz2RQdXtTeT2OFWZHJjyHoDKkjpXPZKYrbfo
         8c1hZZr1IBcEkcKoKjP/DHTdY0P816537y+uNczdRetNbXMV1VKXQbrcxZ5TS79+xelB
         Pp5rYncaIKRgPhkWWJolH4cCp6lawT8S3DCXPMB2Pww+0cm3JDmb4qNbp7FvN8yjEHN/
         nB9kfBucbIeBm7GFbUz3qMtmBjmJuzflKDNw7eWQSu9iVy3eroVKFTZTiur4hLjOJ0x+
         oj5TPdQXwPCtEAVMA6u8X6gR5/AkGkl6lcxkgiY5/tY0U62MUjbYSCKNXPiTYd8ePDkt
         FVJA==
X-Forwarded-Encrypted: i=1; AJvYcCX9SFsDpulv/C8A/PZaNe+UIjGgRDiE6d8It1XTv367aR2K29JpP2jtGnAxXBIKv5XU6gy9EMUPQCwt7f7SPD9IhIC1rW9vFqCALDsl9xo=
X-Gm-Message-State: AOJu0YxwiKlr+p5enqUbMmL2uxAkbVMM+NRDtXAG1neTOBggNpODbwqo
	WPfw0vM7EWnTwSrzK62D48ofPCpfZr/nVFOTOs+UecBAeVJjiII3rJ1XBORsrQ==
X-Google-Smtp-Source: AGHT+IH44RAUDw/DNr6j92phBmAGabo7T94zvHcEdNbGdLcqBJ8VA3qWgds0pAskT4nAQn+54Y3g/A==
X-Received: by 2002:a17:906:e294:b0:a46:ee56:cef4 with SMTP id gg20-20020a170906e29400b00a46ee56cef4mr1081212ejb.76.1710918342916;
        Wed, 20 Mar 2024 00:05:42 -0700 (PDT)
Message-ID: <a3b04e4a-d362-407e-b841-9aa92d1cf080@suse.com>
Date: Wed, 20 Mar 2024 08:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <e45432b2-9ab5-4fa7-994c-37265edbc8f5@suse.com>
 <4aa2aced-d4dc-40d6-818b-8163657cd670@suse.com>
 <c322bc29-d1e6-4acb-a410-ea2e3204a111@citrix.com>
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
In-Reply-To: <c322bc29-d1e6-4acb-a410-ea2e3204a111@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 18:14, Andrew Cooper wrote:
> On 19/03/2024 1:11 pm, Jan Beulich wrote:
>> On 19.03.2024 08:33, Jan Beulich wrote:
>>> On 18.03.2024 19:13, Andrew Cooper wrote:
>>>> I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
>>>> name of FAST_REP_SCASB.
>>> With FSRS already used, I guess that's the closest we can get to keep
>>> names for similar features similar.
>>>
>>>> --- a/tools/misc/xen-cpuid.c
>>>> +++ b/tools/misc/xen-cpuid.c
>>>> @@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
>>>>      [24] = "perfctr-nb", /* [25] */
>>>>      [26] = "dbx",        [27] = "perftsc",
>>>>      [28] = "pcx-l2i",    [29] = "monitorx",
>>>> +    [30] = "dbext2",
>>>>  };
>>> AMD calls this AddrMaskExt (PM) or AdMskExtn (PPR). I can see where your
>>> different name choice is coming from, yet I still wonder whether we should
>>> try to stay closer where possible.
>> Having located the corresponding doc,
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with a slight preference to adjusted names for this one feature.
> 
> Neither are great.  How about "addr-msk-ext" ?

I'd be okay with that.

Jan

