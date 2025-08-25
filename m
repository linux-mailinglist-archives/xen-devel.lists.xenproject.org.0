Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D296B342D6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093238.1448778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXw2-000651-Uo; Mon, 25 Aug 2025 14:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093238.1448778; Mon, 25 Aug 2025 14:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXw2-000632-Rx; Mon, 25 Aug 2025 14:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1093238;
 Mon, 25 Aug 2025 14:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqXw1-00062v-7e
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:12:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a3ad55d-81bd-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 16:12:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso602199066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:12:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7b335581sm258668466b.17.2025.08.25.07.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:12:30 -0700 (PDT)
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
X-Inumbo-ID: 8a3ad55d-81bd-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756131151; x=1756735951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kUH2slKBIRhphnlQeJMXpIsIwJxWlNkUwdCiB6Zd0hk=;
        b=Bp8Z8bz3UlL3KutZLfM/P6ufudNjiAuE8OviJN0oCVXdJTfaUG7XRLTtJ7WFpbwecd
         s3wQ5et8y7YKsvrtJke0cM8WkGceGmrOe2gghYl2ZEzLFYgH9DVoQzIWT6455xlfGdK2
         Xtaas1cSIBhohBglsVohPdLDV2rYi/IW+ximCRGNya/XaFXLkAsFTQ9LnPv4SAjcIr0R
         lfjyMsW60D1RZKmBMefCoLaryZ1jGuj7pOomNSGKflTd5VMYfaJMs+T/oyGyLpgEP+Df
         q7zR2eyld2mP9wDdfR2RgM3Qm3q2W71WEVOZvFu6Ab7zqkKDD2wqMvJS8ECyAb2rAtyi
         SpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131151; x=1756735951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUH2slKBIRhphnlQeJMXpIsIwJxWlNkUwdCiB6Zd0hk=;
        b=hlekkePU2PdQnhnjCwtIJrNXsDRn0rO36/IwAA9dT75vODmBaP17ps0QRV+gMdcnSY
         jFHl3bKTmRJRcFyZOrxHLp5ufCsO8IapwBKI0iX3yuwDx1TT4xXI0db9mKzzQGxEE0Wz
         or+UYu5OY/1mYZrU8S37Hc60RymtvTOPnQe5minblJsN44eWVvRt//lqljvToohvaHfK
         mv0Q8G55GVyHjOVh2+XiRJk/QxwnTUB2a2D44tkEUNUvQaCe9KHtfFj3ETF7Ij/76pns
         QarZRDDyTtA7sJgcBLkF4RYDPrY9L1kI2ESIIlPwApeorJ3yKDgcJu+qK3LRWJuIS1rI
         L0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5PAAGFWz1TO5+HUWvEMi50h6A1FW5lxXSswkajAQt4cfatrk4byaU66nyr9+WKv9CxB5kpe58xQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbli2cf0qcKPPNY7ae3Bk6V/v8HMPFHPd+T8zArw6Gfpcw8BqK
	NFW5J6SoB3NAemAxtsdDFzwLK3sN8bKt2SCtAbSfaHjPuTdR+UMIT9ACP2yqSomtyQ==
X-Gm-Gg: ASbGncs3JnIFhU45j9MGa0uPcqtsTkd0P+qXW8L6BYuKWdbXBt8250PfuqRz2c0/R6W
	PD5DtLzQwkeGwqteSOeXsycymgNKcmVLOlJBWkmuij58kQkbCX8PX/NLprtkqlpPjH5hlBD/usP
	Ncv9mWprXCOsr41VVAEx1J2SzhaOcn7twgKoccEmRVqqGZuvZPmGj31Z1HSOMsBPS9SlY/D2OOF
	sV2lmszK4yEOOU2gZ61+Njkuek19sIPIhQJlsJAUe7mv6ZYc/kbBJbwpDGSDgggxf97GkF5XaAz
	ojbOS/GpMWVo1yoE17xgi/c4LpZhGCmLWKY3O9Rj03ZsTqL3tGooIbIGi4SPxUi7WNmVrudpFEt
	BynbnNE4iqM+W1h5g4lNAnjsmZvrHVnuBs4HoINqX3ShvBLBawUJbsLu9KPrERIBq7J8YfalTxS
	k760dI88E=
X-Google-Smtp-Source: AGHT+IE9k2+36ccuCuPBYePG0JwIFeuKI0sv0zV/RXXddqgqhKa5aDra3jzXT7F/Hbi2/9lBdopJPA==
X-Received: by 2002:a17:907:98d:b0:afe:9880:8a9b with SMTP id a640c23a62f3a-afe9880aa30mr54288666b.2.1756131151192;
        Mon, 25 Aug 2025 07:12:31 -0700 (PDT)
Message-ID: <bd88b7d0-92aa-45c9-8b8e-730bc7edc7b3@suse.com>
Date: Mon, 25 Aug 2025 16:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
 <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
 <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
 <330f8ee8-9fcd-40e4-96c0-ac126b047070@suse.com>
 <37bb8530-c9e4-4ad4-8959-d1f13316a0fd@epam.com>
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
In-Reply-To: <37bb8530-c9e4-4ad4-8959-d1f13316a0fd@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 15:27, Dmytro Prokopchuk1 wrote:
> 
> 
> On 8/25/25 14:07, Jan Beulich wrote:
>> On 25.08.2025 12:58, Dmytro Prokopchuk1 wrote:
>>> On 8/25/25 13:30, Jan Beulich wrote:
>>>> On 25.08.2025 11:05, Dmytro Prokopchuk1 wrote:
>>>>> MISRA C Rule 17.7 states: "The value returned by a function having
>>>>> non-void return type shall be used."
>>>>>
>>>>> Deviate functions like 'memcpy()', 'memset()', 'memmove()', 'snprintf()',
>>>>> 'strlcpy()', 'strlcat()', as they return a value purely for convenience,
>>>>> their primary functionality (e.g., memory or string operations) remains
>>>>> unaffected, and their return values are generally non-critical and seldom
>>>>> relied upon. Update 'deviations.rst' file accordingly.
>>>>
>>>> How come snprintf() is among this set? Its return value isn't quite just
>>>> for convenience, imo.
>>>
>>> Yes, snprintf()'s return value isn't just for convenience. The deviation
>>> justification is primarily based on the fact that its return value is
>>> rarely used in the Xen source base. Most callers of snprintf() don't
>>> care about return value. So, snprintf() is in this list.
>>>
>>> Maybe separate wording is required for the snprintf() ?
>>
>> Minimally. Personally I don't think it should be deviated globally.
> 
> There are approximately 230 instances of snprintf() being used without 
> checking its return value (across ARM and x86) in around 20 different 
> source files. Deviation each of them could be complicated.

My grep yields somewhere between 50 and 60 hits in xen/, among them about 15
in xen/tools/kconfig/, which I expect we can ignore. I also didn't mean to
suggest to deviate them all individually. Some may actually want to use the
return value, and I wouldn't be surprised if this ended up fixing a bug or
two.

Jan

