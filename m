Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7226B353AF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 08:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093902.1449272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmlR-0002R7-Eq; Tue, 26 Aug 2025 06:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093902.1449272; Tue, 26 Aug 2025 06:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmlR-0002Ot-Bz; Tue, 26 Aug 2025 06:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1093902;
 Tue, 26 Aug 2025 06:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqmlQ-0002On-67
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 06:02:36 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42368b24-8242-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 08:02:34 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61c38da68ddso6233655a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 23:02:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3119f79asm6234342a12.5.2025.08.25.23.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 23:02:32 -0700 (PDT)
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
X-Inumbo-ID: 42368b24-8242-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756188153; x=1756792953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e2D3Ik8oeWKgtEBhd0j1kwXLHVZINI3+lCbAZDVuOBE=;
        b=aMvY4yniQ6/XFmsw5WNuAv+Tnyxu6+I/++aLRklwAi38toH1iinn51sf8UzaP3tKwR
         Sxb5XZ5YAfvuZiqQmfQk0KplIN9w6gN23uuDAXTFwY3Qn3Ip2BBMBXj7UmRNF2VLbKsH
         u/bzVG8u1PTQJBdmjtNetin/VkwNGBbrEhm5lcdJm6wcdKER1zrYjXy+qm99IsvT7Nwc
         od1Q8MX2YEEyDlz0Upj2PyEklz8Tq3MqFYmLNRrQixxh58OvOHNi44AL0mPvZCT0txJL
         uGEqv3lQiD8+HJf+7dn4GNq/NwYwhrRbKhXXZUuc95tgsUlVWU7nsV+pB8BI7WdFKcPu
         3Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188153; x=1756792953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2D3Ik8oeWKgtEBhd0j1kwXLHVZINI3+lCbAZDVuOBE=;
        b=ATJ2uXHVu/+/SBuO+JWODQQnS+92rx11b+8lV+6Y9X1CZD5iv8RERi5Vu8n38r7IXu
         BPknBFM5HOZ/yGkiBumwjklHdmGJXK3dgWKWQK87vXm2qnq2tpw7jCdZ6Q/h81/58DOa
         E1QGT4L1GpFnQh2FALL3xzgVlTNy0JK9FrgJEiJV8Hoj0A6j3F8foemvKbru8R8G+f38
         rdA5C4nlXk5iXaSgh4me7NY+h893noLVP8YTGDAoeaLxzU51mC8dPfnFI5KAwRvpfU16
         z2IYUtgJyd03Xu+APN8BdRV0ha+ek2mYddnk2X+UBNKZ9nKgDeteWVxoSwusQvm4Ri+o
         8PsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvrseKA7NIE5KL2qyGE2EdNKdczBjF/hP5vXpb4aRKFLeyNZAluhSFcgAtyHm1SlPofc06SULtiVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0ITkcRQQhWjNrsZTxuzOlLN5RVLSilsuDI/N4w2WdPQyna8T7
	926A7Nm4b2AoY/nin5xZeqF81hoaifZWNlvWI/hR7t7TumSjnNobB5hruyW2Cu+bKEUW1tE1/pI
	Ec2k=
X-Gm-Gg: ASbGncsXtPbrKTTDf1weilzQB+VUC39UNBSmXn2jiB5DKYknNROJRy4+CyE6DD/AvGL
	mmqy2XKBY4+qH9KX+/UiiFMHs6B8gCnhMVubJ9E6nCsQ6153Mkr6TRXMIQal/Q8pIVs3o7gz1EO
	ez7JBtCaYfDEHuWipcmbfX85Y9+xyDKwCGHnVvoWJqFsGhpshgL0UKO8PQ1/v9WScWU6Dh8OGb/
	yRrlFvLLN9huz8skG3jrY3u5I3vDWC8xRDJRRlfwTihHp3rp0RNr7mPJY8oNS8WVu+90DkysjnX
	t/bzZa6gM9JRtGBhHoq42MD4HFdV8+X1UGwTMIr8yPDN0duf4XKLo/DwxXEhqq97kNFyR6pdeZW
	kOFHEqfURdDsR9+lDPtyDxAdGNbJPwcGTLVb9f4H84m1vtdlgkpeQc7IW1qfXWnnVd3/mMsx+ho
	ItZt9mg2Y=
X-Google-Smtp-Source: AGHT+IGD6meTPqZTHrXRIwqv3rUt2o/TCVrmAhPJg85LrqLaNR44o5bp84QEccgEdIGAUKtDr+JjRQ==
X-Received: by 2002:a05:6402:350a:b0:61c:3847:680d with SMTP id 4fb4d7f45d1cf-61c38476a28mr7811552a12.31.1756188153271;
        Mon, 25 Aug 2025 23:02:33 -0700 (PDT)
Message-ID: <2d8f188f-f3b0-4906-85c8-835948fc6603@suse.com>
Date: Tue, 26 Aug 2025 08:02:32 +0200
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
 <bd88b7d0-92aa-45c9-8b8e-730bc7edc7b3@suse.com>
 <7729c3cd-c1d6-4abf-8e44-293702f47545@epam.com>
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
In-Reply-To: <7729c3cd-c1d6-4abf-8e44-293702f47545@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 19:33, Dmytro Prokopchuk1 wrote:
> 
> 
> On 8/25/25 17:12, Jan Beulich wrote:
>> On 25.08.2025 15:27, Dmytro Prokopchuk1 wrote:
>>>
>>>
>>> On 8/25/25 14:07, Jan Beulich wrote:
>>>> On 25.08.2025 12:58, Dmytro Prokopchuk1 wrote:
>>>>> On 8/25/25 13:30, Jan Beulich wrote:
>>>>>> On 25.08.2025 11:05, Dmytro Prokopchuk1 wrote:
>>>>>>> MISRA C Rule 17.7 states: "The value returned by a function having
>>>>>>> non-void return type shall be used."
>>>>>>>
>>>>>>> Deviate functions like 'memcpy()', 'memset()', 'memmove()', 'snprintf()',
>>>>>>> 'strlcpy()', 'strlcat()', as they return a value purely for convenience,
>>>>>>> their primary functionality (e.g., memory or string operations) remains
>>>>>>> unaffected, and their return values are generally non-critical and seldom
>>>>>>> relied upon. Update 'deviations.rst' file accordingly.
>>>>>>
>>>>>> How come snprintf() is among this set? Its return value isn't quite just
>>>>>> for convenience, imo.
>>>>>
>>>>> Yes, snprintf()'s return value isn't just for convenience. The deviation
>>>>> justification is primarily based on the fact that its return value is
>>>>> rarely used in the Xen source base. Most callers of snprintf() don't
>>>>> care about return value. So, snprintf() is in this list.
>>>>>
>>>>> Maybe separate wording is required for the snprintf() ?
>>>>
>>>> Minimally. Personally I don't think it should be deviated globally.
>>>
>>> There are approximately 230 instances of snprintf() being used without
>>> checking its return value (across ARM and x86) in around 20 different
>>> source files. Deviation each of them could be complicated.
>>
>> My grep yields somewhere between 50 and 60 hits in xen/, among them about 15
>> in xen/tools/kconfig/, which I expect we can ignore. I also didn't mean to
>> suggest to deviate them all individually. Some may actually want to use the
>> return value, and I wouldn't be surprised if this ended up fixing a bug or
>> two.
> 
> For memory-related functions (memcpy, memset, memmove), ignoring the 
> return value is almost always safe, so I propose to leave these 
> functions in the patch, remove snprintf, strlcpy, strlcat so far, and
> precisely check usage of the last functions.
> 
> Is it OK?

Fine with me, yes.

Jan

