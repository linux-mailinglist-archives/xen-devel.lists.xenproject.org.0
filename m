Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C68D3199
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731673.1137315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEnV-0007oc-Er; Wed, 29 May 2024 08:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731673.1137315; Wed, 29 May 2024 08:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEnV-0007m4-CD; Wed, 29 May 2024 08:36:37 +0000
Received: by outflank-mailman (input) for mailman id 731673;
 Wed, 29 May 2024 08:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCEnU-0007ln-98
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:36:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e75296b-1d96-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:36:34 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52b1ba74d39so320012e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 01:36:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8e534sm702084066b.170.2024.05.29.01.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 01:36:33 -0700 (PDT)
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
X-Inumbo-ID: 8e75296b-1d96-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716971794; x=1717576594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aue1JfAUF2Db+m9WM9eLeyB/E18PJUjmuGIUgDBYp40=;
        b=ae+V03gIOqnkBKKkMUkgHXtMDnlEnvAUvGjogl42ZEhnkkZ6HRZ+o3g62Y8W2wRdkd
         trsJ+hxPzeZEoICYgg+bRERYk05ft7mX0Wo+KVsF7HJ4ZkhXeUlRpUHIU4WN2xZ2PXfr
         id8T9XwnAgfuJNMCnzEYELtD6OfV3aPPJ59cVWjQNudZGa+IlOsd8Mba0+B/2aE/UXvj
         dnrUmeerAc7Z6ZC5PLyz2DIEePOKg7zmTlH4sbBCNnTVVImTsROjz4/tHBQ4wMSPCt14
         mYRQALJ9GCaVCBBO34XqclxZ4RK20JFydc+9yAIcWQWi2LF2tsENzJuzcF6DnN6dVFC8
         nb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971794; x=1717576594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aue1JfAUF2Db+m9WM9eLeyB/E18PJUjmuGIUgDBYp40=;
        b=GtZG1MSRKqf47WlGOWSSQLMA139VrlyL/Vtd+wxrhGWHcEnDXmlGcpZAtYsRRsDlcL
         Bm0ljsMVMhq07yQdBFLHyVwxfIj6JJfh0EVlQCYy3b3RVU12yT8zQDkKAdFGXBLfGQkD
         KNMTKcFMyJtjU1siCSF+JpwBNrzOOu0Z/F36QBZkrWk3dZB8+HyG5GFqK0ZLjYdqosV1
         Pg2ZfWI5ea7y8QCJIwm/HcTcvmPkv1Uqb0LzoMdu5ItCDC4WjE98w27/dDoOkAh4Gxl5
         4rPt9nL7lBOqCovJV5EaMNpId0g8r3mhG8nhVqEOyPuYDgZkkWcUGMffOFGE8keNjpnu
         9U9A==
X-Forwarded-Encrypted: i=1; AJvYcCVo/+fExo6Z9WbT2kZDSRiQupq7uojgamCMZAJ/5RyREL3SXQhlQzptH0a16qtpb73x4Q60OcilJStAAvZzS/OF1Fwht6akoYBHUE86WqE=
X-Gm-Message-State: AOJu0YzhWzn893wHAzDeEEIK4KvYuaRitAReSH4uUNXNRZZL27cGcgHd
	JMnRHa8uOJFvuZxvY/mINQLfNMQTAFtBFbX2p9neNIr34owEb9LcAWa/5sO3fg==
X-Google-Smtp-Source: AGHT+IHHSehhRNBBC08d5X+GZe7hByLCqX7iZuq7R5DVW1LgYx34rYmht5n+89yYXtjsEWpcBSzWRQ==
X-Received: by 2002:a05:6512:902:b0:51d:4af6:bb86 with SMTP id 2adb3069b0e04-529612c529amr9250737e87.0.1716971793843;
        Wed, 29 May 2024 01:36:33 -0700 (PDT)
Message-ID: <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
Date: Wed, 29 May 2024 10:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
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
In-Reply-To: <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 09:50, Oleksii K. wrote:
> On Tue, 2024-05-28 at 09:53 +0100, Julien Grall wrote:
>>>>> +/**
>>>>> + * generic_test_bit - Determine whether a bit is set
>>>>> + * @nr: bit number to test
>>>>> + * @addr: Address to start counting from
>>>>> + *
>>>>> + * This operation is non-atomic and can be reordered.
>>>>> + * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>> + */
>>>>
>>>> You got carried away updating comments - there's no raciness for
>>>> simple test_bit(). As is also expressed by its name not having
>>>> those
>>>> double underscores that the others have.
>>> Then it is true for every function in this header. Based on the
>>> naming
>>> the conclusion can be done if it is atomic/npn-atomic and can/can't
>>> be
>>> reordered. 
>>
>> So let me start with that my only request is to keep the existing 
>> comments as you move it. It looks like there were none of test_bit()
>> before.
> Just to clarify that I understand correctly.
> 
> Do we need any comment above functions generic_*()? Based on that they
> are implemented in generic way they will be always "non-atomic and can
> be reordered.".

I indicated before that I think reproducing the same comments __test_and_*
already have also for generic_* isn't overly useful. If someone insisted
on them being there as well, I could live with that, though.

> Do you find the following comment useful?
> 
> " * If two examples of this operation race, one can appear to succeed
>  * but actually fail.  You must protect multiple accesses with a lock."
> 
> It seems to me that it can dropped as basically "non-atomic and can be
> reordered." means that.

I agree, or else - as indicated before - the wording would need to further
change. Yet iirc you've added that in response to a comment from Julien,
so you'll primarily want his input as to the presence of something along
these lines.

Jan

