Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C328D3401
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 12:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731776.1137469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGCH-0001OI-KZ; Wed, 29 May 2024 10:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731776.1137469; Wed, 29 May 2024 10:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCGCH-0001MH-Hy; Wed, 29 May 2024 10:06:17 +0000
Received: by outflank-mailman (input) for mailman id 731776;
 Wed, 29 May 2024 10:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCGCF-0001M7-OA
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 10:06:15 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1508d9bb-1da3-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 12:06:14 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a626776cc50so200776666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 03:06:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc514e5sm703665466b.103.2024.05.29.03.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 03:06:13 -0700 (PDT)
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
X-Inumbo-ID: 1508d9bb-1da3-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977174; x=1717581974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Szh9A5q61GDC37BYYzt17hODMTfbk8CYAqyaWjpLXH8=;
        b=No9TJwkk3CNljnUdVLPxfxqxriiwjgX0mClzDICsziHrm9drb4gJMyv9za/Ikt1DJ2
         qyZk4u6TyN13P7NL0UsdAOKc/x2qhj5fHOM4uWWqwYjCOYjhykEjFyEq/f3ppsM38B8G
         sLoleD+ATRrkIfsuCdJA3O9ljmD84lDg09alwnQrVNs0SBV10b4MTMkbfRiq/bLW+Pmq
         aDSOLJlEv2mMH1/NEtaO0+/zAMR6R63XF9H3enkYqFJHfGr8Q7hqJ1ZMEisu5W6pJxUT
         CHn2xoywSPdst+V6/ZNZmg/x6D6lFEBNkSHiYH/5udchM/Y+oCdIJAa2q+TlZQn3oUt1
         g+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977174; x=1717581974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szh9A5q61GDC37BYYzt17hODMTfbk8CYAqyaWjpLXH8=;
        b=WqJTAsyo/RTXcl8IYgs5vPKno+5j9WIr+FfpwRNIh/ninmnDGtam3vdX1gDZGuKZGh
         YF0VxQ2GvUolfAKLNLeoxqxeVqIcV5dcx2jktEWihJGHD0XCiUsXhBvcVzldBQo7GpTN
         7ZBlmtYKruCbaZ0bjTRs8nYQNbOYdBSbEVoFsQdfsqFKbdyr8sKvlS03/S8FRwU3Jpa1
         EbCKumTRqaq6m1SiSvCRtv1t3nKkdNTqGOn1FGjkoetxcfO8A9zgkf/RkND7KBFJajb7
         rEJdpN4g6VMALdGqn1jTXEwIA93KlM+tJJQyBRc4hRkMZDIfStMHWJ9SSWIONxzZPkuo
         0FQg==
X-Forwarded-Encrypted: i=1; AJvYcCW9hCDxgvYUZhHhYMwHiirOH5GyQkRMC1zeiLweGyyR/jGMMBc5+Btibk1H5p25hGwDz4nEhOJNvk+2351Szm6JoNhVhvD3N+deIxQV7fU=
X-Gm-Message-State: AOJu0Yyq9pNkza9HoOynliOFVh0FjLjj02MEpy4GS72FgCN2cTwFEy81
	U8SWm8+Zf7ljtsf0e//+sVNTMWQjo/XvMk59kl1UUR1xkhQZbl7vI8mHwNeyLA==
X-Google-Smtp-Source: AGHT+IEkmcXk7sMYZ3JnO5rqWwkQ+LuisaiXMRfAFcexLXhIfGwcF2BmdN8KuXlXmk79OamyBTV+Tw==
X-Received: by 2002:a17:906:f353:b0:a55:9dec:355f with SMTP id a640c23a62f3a-a626511604fmr827485966b.70.1716977173615;
        Wed, 29 May 2024 03:06:13 -0700 (PDT)
Message-ID: <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
Date: Wed, 29 May 2024 12:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, "Oleksii K." <oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
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
In-Reply-To: <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 11:59, Julien Grall wrote:
> Hi,
> 
> On 29/05/2024 09:36, Jan Beulich wrote:
>> On 29.05.2024 09:50, Oleksii K. wrote:
>>> On Tue, 2024-05-28 at 09:53 +0100, Julien Grall wrote:
>>>>>>> +/**
>>>>>>> + * generic_test_bit - Determine whether a bit is set
>>>>>>> + * @nr: bit number to test
>>>>>>> + * @addr: Address to start counting from
>>>>>>> + *
>>>>>>> + * This operation is non-atomic and can be reordered.
>>>>>>> + * If two examples of this operation race, one can appear to
>>>>>>> succeed
>>>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>>>> a
>>>>>>> lock.
>>>>>>> + */
>>>>>>
>>>>>> You got carried away updating comments - there's no raciness for
>>>>>> simple test_bit(). As is also expressed by its name not having
>>>>>> those
>>>>>> double underscores that the others have.
>>>>> Then it is true for every function in this header. Based on the
>>>>> naming
>>>>> the conclusion can be done if it is atomic/npn-atomic and can/can't
>>>>> be
>>>>> reordered.
>>>>
>>>> So let me start with that my only request is to keep the existing
>>>> comments as you move it. It looks like there were none of test_bit()
>>>> before.
>>> Just to clarify that I understand correctly.
>>>
>>> Do we need any comment above functions generic_*()? Based on that they
>>> are implemented in generic way they will be always "non-atomic and can
>>> be reordered.".
>>
>> I indicated before that I think reproducing the same comments __test_and_*
>> already have also for generic_* isn't overly useful. If someone insisted
>> on them being there as well, I could live with that, though.
> 
> Would you be ok if the comment is only on top of the __test_and_* 
> version? (So no comments on top of the generic_*)

That's my preferred variant, actually. The alternative I would also be
okay-ish with is to have the comments also ahead of generic_*.

>>> Do you find the following comment useful?
>>>
>>> " * If two examples of this operation race, one can appear to succeed
>>>   * but actually fail.  You must protect multiple accesses with a lock."
>>>
>>> It seems to me that it can dropped as basically "non-atomic and can be
>>> reordered." means that.
>>
>> I agree, or else - as indicated before - the wording would need to further
>> change. Yet iirc you've added that in response to a comment from Julien,
>> so you'll primarily want his input as to the presence of something along
>> these lines.
> 
> I didn't realise this was an existing comment. I think the suggestion is 
> a little bit odd because you could use the atomic version of the helper.
> 
> Looking at Linux, the second sentence was dropped. But not the first 
> one. I would suggest to do the same. IOW keep:
> 
> "
> If two examples of this operation race, one can appear to succeed but 
> actually fail.
> "

As indicated, I'm okay with that being retained, but only in a form that
actually makes sense. I've explained before (to Oleksii) what I consider
wrong in this way of wording things.

Jan

