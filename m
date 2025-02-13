Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D997A34209
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887710.1297171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaEw-0001Pg-9n; Thu, 13 Feb 2025 14:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887710.1297171; Thu, 13 Feb 2025 14:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaEw-0001OE-6k; Thu, 13 Feb 2025 14:30:54 +0000
Received: by outflank-mailman (input) for mailman id 887710;
 Thu, 13 Feb 2025 14:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiaEv-0001O8-FV
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:30:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1da16939-ea17-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:30:47 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5de594e2555so1512177a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:30:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1eb69bsm1336336a12.48.2025.02.13.06.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:30:46 -0800 (PST)
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
X-Inumbo-ID: 1da16939-ea17-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739457047; x=1740061847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GwfOWqkdSAQByn/59MaSxRc3LKlCXcaw1IkI3MuOOOY=;
        b=YGkewoRVDa2NtFxhj3OWsGGC5dXQF2+itA1nrHGFieCq9FMg0F2F9ZhP24qdVTnUfU
         yELFdgqAnorxrL6Sw+UVf05/098ypunEN628ZuDP2jICCZ18NLDwIwQxFsaMcHoYkj6w
         nV1h9vdkuRBCljpu61nnT2+IVvqW93aIIDZPrWiY1OUMcXSFYjUkwjzva2KZKGXprfhh
         vhLpw1+o6sD6N7sQpw+KjIzjjWJlapoZPtlxqabS6jmZ0+G2xFbsaERij9DwD0yiYjjY
         tGYpsehCdqXRSWLzmLCF1CkMHpM0xoUV6dXArgSq621LIFgfwqrglqC307la57adJpc0
         e7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457047; x=1740061847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwfOWqkdSAQByn/59MaSxRc3LKlCXcaw1IkI3MuOOOY=;
        b=nZBq0MOlsbWpSTxH7eenW/inCll3t8TB/tbIB8io/fvkaPNFu2xUf8DqO+I1dOZ4YB
         Poa+A5lcIw0oy3SvrC6L6fu5W9/uedn61nAKu4UeoIxURpfXIRDu8AY+5L7WdVDpHqkL
         N3hC6IhyT4dVDWLGmQHvQIukfaxL5QpdgbrmodAidhHnml1uTnl2ytoxg+KF1YLDRfnv
         K9ezfFTRn96KJ8sThcprhfbnq/SFcnjjLEaW5wqEr7JP/+g2oU9dZgESa57jdzJbvQEU
         6ePW1aw1aL2nFHeW28A5jTvfr+vDDG7iQfBxq1x/xeObY8bNDFTorOiEhVTGkUU6+Krz
         WNMQ==
X-Gm-Message-State: AOJu0Yy9nB7sAwy9Xwm89XXlEGyqCiENyOOXy2CfGnwYjRDMNdTZw3Tc
	gvZalZkQYMLySkOK3rim2z3tlnZrnK8Po2lpyo6szLj5uRuWxC2NlNBMtQp14w==
X-Gm-Gg: ASbGnct9ldDYRGE/Xvr1z9BY2/9Sq+WL6ADr59QaOG7083fXwfSl7dWFo88F8YXOilF
	tLk06pNCTpCHfiPaltKBaA1S1iHTU8IAdCfqPADn+drcmjqZRyE5Ge/cyIowZQXSXpoTWLTFkCL
	NLJ222daJKZ9idedbGs9jQ/5Y0BMBKt59Ou8GVBm2mJPpJSrujJoDLTFLTwXRH0n2hdNyx6D6yh
	/4o2/E9GONot3itYZlNV839hcQzJ0ZVW7wRB9vsU4ljHq7BIpOsV6SM+ksN9ouehrr4YbgqS8lR
	kXFkm8TTx5SDeGvcnvDkwnE4sygOox8g+ZKDrHRJdFxgZAUWx0XG/gcEHUmoDt7j0G9atKHJ0Bd
	h
X-Google-Smtp-Source: AGHT+IHqbhVGN7CTIjWUNJ1vkO+ZNyoZIedy3gZ625hPvKjBMd44c02YGyak9cjLtjCVJkLjWKJmXw==
X-Received: by 2002:a05:6402:40d1:b0:5dc:4f4:74c3 with SMTP id 4fb4d7f45d1cf-5deadd8362cmr5829352a12.4.1739457046621;
        Thu, 13 Feb 2025 06:30:46 -0800 (PST)
Message-ID: <1f481ef9-3a47-4222-a143-b9e6585d382b@suse.com>
Date: Thu, 13 Feb 2025 15:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
 <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
 <50d8f989-2512-4414-b12c-a9cb33c675b7@gmail.com>
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
In-Reply-To: <50d8f989-2512-4414-b12c-a9cb33c675b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 15:26, Oleksii Kurochko wrote:
> 
> On 2/13/25 3:21 PM, Oleksii Kurochko wrote:
>>
>>
>> On 2/13/25 3:07 PM, Andrew Cooper wrote:
>>> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>>>> Hi Andrew,
>>>>
>>>> Andrew Cooper<andrew.cooper3@citrix.com> writes:
>>>>
>>>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>>>> Volodymyr Babchuk (4):
>>>>>>    common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>>>    xen: common: add ability to enable stack protector
>>>>>>    xen: arm: enable stack protector feature
>>>>>>    CHANGELOG.md: Mention stack-protector feature
>>>>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>>>
>>>>> There's one minor formatting error which can be fixed on commit.
>>>>>
>>>>> ~Andrew
>>>> Thanks for the review. I noticed that this series is not committed. Is
>>>> there anything else required from my side?
>>>>
>>> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
>>> enough.
> 
> Andrew, why it is enough your R-by for patch 3? It seems like it is fully Arm related patch
> and I expect to see Ack from Arm maintainers. Also, there is some comments from Julien.

At a guess Andrew found Volodymyr in the ARM section of maintainers, but
then didn't pay close attention to the R: (rather than M:).

Jan

