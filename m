Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C6AECE3C
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 17:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028684.1402460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVtaz-00013s-FG; Sun, 29 Jun 2025 15:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028684.1402460; Sun, 29 Jun 2025 15:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVtaz-00011j-Ch; Sun, 29 Jun 2025 15:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1028684;
 Sun, 29 Jun 2025 15:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uVtay-00011d-EY
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 15:05:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc36a36-54fa-11f0-b894-0df219b8e170;
 Sun, 29 Jun 2025 17:05:26 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45310223677so8784185e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 08:05:26 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ee:1da9:2a84:806b:ad68?
 (p200300cab711f2ee1da92a84806bad68.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ee:1da9:2a84:806b:ad68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa884sm7795933f8f.29.2025.06.29.08.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 08:05:24 -0700 (PDT)
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
X-Inumbo-ID: 7cc36a36-54fa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751209525; x=1751814325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+R4jycDgKuEiqOjobbAQ6hJXswPwBD05fVgtTyeiPM=;
        b=AJ7Bj8JNwKVsPsILJ5/MMj1+SJfo9yrmVpNpslQsdQAX24FDsNaay1McwX5cQHPHsq
         pmjd6uLr6WgYT1fEOyIXCJeguIya1tL81RbR6+IGszarLSA6hfr/18kCevU0RHjFXEgh
         szA9a3eVzTlX+D4KxIJuhYS/ESwkg5bjtBEygKt5S2xGOO+RD82qIom28Q+pW8H0G5gk
         4ese7Jgk6IwsLGH1ip34tz4FNXjcHhF19RnF84vIxk5diY4Qhfyv2eVHB7lAR7zgtNbA
         WPRaarWOSAzlHbS7B48zRsW/HvIsFh4wpfBMV3CGhhoQfZdqAQEY1rR9FSMPZ6GQR/Au
         ezsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209525; x=1751814325;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+R4jycDgKuEiqOjobbAQ6hJXswPwBD05fVgtTyeiPM=;
        b=ZJjivwULMqvpHoFrRi6RDKbLGUEwMMTvCxnPQ00dUSN0ZipRw4hMPy5E+F2n5PMuXA
         uN4UgGDzGQFHS5f83ymUXNbAkzc3RCAcAb8x1UL+fDK/bdYkkX/LD/+O0iLAg7hPRzaS
         iSGkIWG1f0xwUzmixuqHjUHYNbt1GXsq+SsJVTTZkv6uQmIRDz7DYEAlLenYSLSBCklu
         qmsuH3shoikCk9tZxWcshJJy/mTKOzsYgEdpflOIitUG2Ug3qkx/GcCyRVTbthH7jSHM
         q24Wtbsoz4joVZeNgamIuhf4KUX8XV0UQZc4n8hQfRiToWguFmwi5HDBnSCQss2SKyy9
         7FfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6IXrh3iVKhF6ACqvlOvkRMfLjvwkzUHDvgtGd/uwtN3yG/cEhJtZENYBnzegYG6jCAspCbmFdieM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzhani0/XSerh885/cnfR7z6Srfty8t325sd4DRs3eBSfgsP8aI
	E9+/khU8XFOx/j3j4QRmQKXWVkag/s1ywcc4TbdSu/jJL2JAVCiG4/0x0f3FXH6LYg==
X-Gm-Gg: ASbGnctZC8IZahs2QP2OZoOZAyPm6XFjRlq2DFdcDsx7oouMYzzLqCMenLDkO9Z1zMX
	v8J2V2libitIxFoHsXzobaf9WCD0hG6crPUF3iSUTF2HzgUUc4C8b9aQv0DBYJDFedlvMpaK3Xw
	X+rLtt5QlIwFm2AJyO587Ucfrh62n7L9q+J+kLXQ892qf+Uqu+eeyULu9ueDUvITHlHBvHN36l1
	2FVRGWcpOYim7kGMC9Y8KcFEAt/FstcaTmzlzGXS58y2Pm9kgXd3R6J1DFuIHp5FTczUHJ010p8
	t/+r8pU6Ozs5hiMkeMdMXxvJn4p46p60EutFVCwCpGsH+2MW9vVgSqTcymKYzRoC6Yf9tFRUfR8
	ENTsiTmkBkqC2q/9el1RH9hNzyZhkGmfTxyEA9ICBqqXhQss3wbh5SGYMt21wzevYxUQpnB4rp5
	I/LUz84s8djfj2visBsVn9
X-Google-Smtp-Source: AGHT+IGMJDSrhfdeSWpJwfKU2eCvJPl9P9Z514ENvRVVtv37yxqYqXbIg59HwXxhjfYcIO91mAMjKg==
X-Received: by 2002:a05:6000:2a85:b0:3a5:2848:2445 with SMTP id ffacd0b85a97d-3a8f482bfebmr6658464f8f.16.1751209525456;
        Sun, 29 Jun 2025 08:05:25 -0700 (PDT)
Message-ID: <0e55fa4f-2460-4ea5-91bd-46c86d3136d5@suse.com>
Date: Sun, 29 Jun 2025 17:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <fe4920a2-4add-4e07-80f3-50eb37de0754@suse.com>
 <c1d38fa9-a959-470f-96ce-462ea7e04041@citrix.com>
 <634154c0-ecd7-4c24-bc52-91aeefe367f0@suse.com>
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
In-Reply-To: <634154c0-ecd7-4c24-bc52-91aeefe367f0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 17:45, Jan Beulich wrote:
> On 26.06.2025 17:31, Andrew Cooper wrote:
>> On 16/06/2025 1:59 pm, Jan Beulich wrote:
>>> +    if ( !raw_cpu_policy.feat.erms )
>>
>> This wants to be the host policy, not the raw policy.  That's why
>> `cpuid=no-erms` isn't working in the way you'd expect.
>>
>> cpuid=no-$foo means "Xen should behave as if $foo wasn't reported by
>> hardware", and that includes not giving it to guests by default.
> 
> Hmm, interesting. That's definitely not the meaning I give this. To me it
> means merely Xen shouldn't use the feature (with an impact on guests only
> when the feature in hardware is required to surface it to guests). I
> don't think we have the precise meaning of this option written down
> anywhere?

Then again I notice what you ask for is in line with uses of cpu_has_*
(where available) elsewhere (e.g. in your "x86/cpu-policy: Simplify logic
in guest_common_default_feature_adjustments()"), with
calculate_host_policy() simply copying boot_cpu_data.x86_capability into
the host policy. So yes, I guess I'll need to adjust.

Ftaod, this still leaves open what exact meaning "cpuid=no-..." ought to
have. While kind of an example in the opposite direction, consider e.g.
"cpuid=no-lm": This cannot sensibly have any effect on Xen itself. It
could plausibly mean to permit only 32-bit guests.

Jan

