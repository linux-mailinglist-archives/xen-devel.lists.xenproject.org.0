Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBC86C8F9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687003.1069678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffLj-0002LN-MZ; Thu, 29 Feb 2024 12:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687003.1069678; Thu, 29 Feb 2024 12:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffLj-0002J5-Ja; Thu, 29 Feb 2024 12:17:19 +0000
Received: by outflank-mailman (input) for mailman id 687003;
 Thu, 29 Feb 2024 12:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rffLi-0002Iz-8x
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:17:18 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a743c9d-d6fc-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:17:17 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so140613866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 04:17:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x11-20020a170906710b00b00a4434e9938asm631439ejj.84.2024.02.29.04.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 04:17:16 -0800 (PST)
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
X-Inumbo-ID: 7a743c9d-d6fc-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709209036; x=1709813836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E29zZS9OS38WsEG/fXh9BRCCU3ulttk+8HpykdOIMtE=;
        b=fn2oOYiTqEA5G8qQuXI+PmD7xstpxPmRBP+AjVUz2yfrowma/vIA/AQJiLN2pWnXwp
         X7TZJPCXtAZbJpL6VuW56is9iYV17QqT6VxePeCutRF6QJcO0xoVNEHde+zU040jVDGu
         JfhdCtALnyOExGS50a5rZ0wF/JWN7ZGKZV2cSm/Xi1ByxaH0VqfJTIjgzDpwwt2YgEc2
         sqLej0x1sUsfIbIDQGVr9BhXWIOPlXIY9/Ns3sXaB/SDGVA+CK/GygyJiURwPY/WH2Uw
         PnE+7I7Dc/Oz9OpMboejmA2UK6j0TVCyH24DbWBixLWUglVR4oMqMwdsOvdf78kmBr3F
         US2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209036; x=1709813836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E29zZS9OS38WsEG/fXh9BRCCU3ulttk+8HpykdOIMtE=;
        b=aQ+6AG2R83DACKxK75tDYWc8HsIsHfTJZYlPsq2eEifen9YJasz4Yu3DI5Pymas548
         gULXJJPTvFmlZIv82jf94awMhHcs93RS48YzSCRZa59m2+FglYH+zQ2NDWDgizx/aOZV
         NQLS9uI6YfNX9InkoWRF9u6Uf5nlB3BHoluPbWkdXcU7/OW5ShhLgBt+6gTmtKbHNVOz
         d1qOrc4k8a+a2cd7aHlRFs9NtIxv4+zTO+wWax7MgDs5ONvrtx9VQclmrQqaFchYvBFT
         sdJs8492bfkotKYcg3rUxLsdX6ldUgXL3JOVzDmPwXszwHeZUf3GTZRIeorTaRmkrbU7
         AkxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxU3wwAYEaqLtRBLLupl8yGpUzmbfVlXbePufhqf7os5g7Ro3E9GLV6JwBxvVM0sSVK/WZh9U37P8xI3TP8VYN/2j/nvbxU0bOQEtVI6U=
X-Gm-Message-State: AOJu0YyTm46ijo6HgdsUUJiqb3fBfOHSFNDIdK7nLshJz2Y0xORL9o65
	YRfUfRvNIftYzOQVvclzCPDc5RP0FfFRDN/aJIWygUePLgk26hKfvnkKUwxDzg==
X-Google-Smtp-Source: AGHT+IGChSSNgIfoxpE2Rfg6iyfYc8ePJzIsPPi0fU0xTE83tsXfRRSQpwvJB9Cbf7RIaxI8C8uxWg==
X-Received: by 2002:a17:907:118d:b0:a3e:5726:c12 with SMTP id uz13-20020a170907118d00b00a3e57260c12mr1343701ejb.37.1709209036572;
        Thu, 29 Feb 2024 04:17:16 -0800 (PST)
Message-ID: <2a112321-f4fd-4ab4-a431-a0bb4cb6eaa2@suse.com>
Date: Thu, 29 Feb 2024 13:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
 <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
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
In-Reply-To: <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 13:05, Andrew Cooper wrote:
> On 29/02/2024 10:23 am, Julien Grall wrote:
>>>>> IOW it is hard for me to see why RISC-V needs stronger restrictions
>>>>> here
>>>>> than other architectures. It ought to be possible to determine a
>>>>> baseline
>>>>> version. Even if taking the desire to have "pause" available as a
>>>>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>>>>
>>>> I think we want to bump it on Arm. There are zero reasons to try to
>>>> keep
>>>> a lower versions if nobody tests/use it in production.
>>>>
>>>> I would suggest to do the same on x86. What's the point of try to
>>>> support Xen with a 15+ years old compiler?
>>>
>>> It could have long been bumped if only a proper scheme to follow for
>>> this and future bumping would have been put forward by anyone keen on
>>> such bumping, like - see his reply - e.g. Andrew. You may recall that
>>> this was discussed more than once on meetings, with no real outcome.
>>> I'm personally not meaning to stand in the way of such bumping as long
>>> as it's done in a predictable manner, but I'm not keen on doing so and
>>> hence I don't view it as my obligation to try to invent a reasonable
>>> scheme. (My personal view is that basic functionality should be
>>> possible to have virtually everywhere, whereas for advanced stuff it
>>> is fine to require a more modern tool chain.)
>>
>> That's one way to see it. The problem with this statement is a user
>> today is mislead to think you can build Xen with any GCC versions
>> since 4.1. I don't believe we can guarantee that and we are exposing
>> our users to unnecessary risk.
>>
>> In addition to that, I agree with Andrew. This is preventing us to
>> improve our code base and we have to carry hacks for older compilers.
> 
> I don't think anyone here is suggesting that we switch to a
> bleeding-edge-only policy.  But 15y of support is extreme in the
> opposite direction.
> 
> Xen ought to be buildable in the contemporary distros of the day, and I
> don't think anyone is going to credibly argue otherwise.
> 
> But, it's also fine for new things to have newer requirements.
> 
> Take CET for example.  I know we have disagreements on exactly how it's
> toolchain-conditionalness is implemented, but the basic principle of "If
> you want shiny new optional feature $X, you need newer toolchain $Y" is
> entirely fine.
> 
> A brand new architecture is exactly the same.  Saying "this is the
> minimum, because it's what we test" doesn't preclude someone coming
> along and saying "can we use $N-1 ?  See here it works, and here's a
> change to CI test it".
> 
> 
> Anyway, its clear we need to write some policy on this, before making
> specific adjustments.  To get started, is there going to be any
> objection whatsoever on some principles which begin as follows:

Largely not, but one aspect needs clarifying up front:

> * For established architectures, we expect Xen to be buildable on the
> common contemporary distros.  (i.e. minima is not newer than what's
> available in contemporary distros, without a good reason)

What counts as contemporary distro? Still in normal support? LTS? Yet
more extreme forms?

Plus - whose distros would we consider?

Jan

> * Optional features explicitly may have newer minima, generally chosen
> by when toolchain support landed and/or was bugfixed suitably to be usable.
> 
> * Xen won't expect to update minima "just because".  But updates
> across-the-board will be considered periodically where it doesn't
> conflict with point 1, and where changing the minima allows us to use a
> new feature to have a positive impact on the codebase.
> 
> * We always reserve the right to update minima to e.g. avoid crippling
> code generation bugs, even if it conflicts with point 1.  Where
> workarounds can reasonably be done, they ought to be preferred, but this
> is ultimately at the discretion of the relevant architecture maintainers.
> 
> ?
> 
> ~Andrew


