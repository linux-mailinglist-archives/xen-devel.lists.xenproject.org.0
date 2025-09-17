Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A196B7FDB8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125216.1467226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysxS-0007GG-HI; Wed, 17 Sep 2025 14:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125216.1467226; Wed, 17 Sep 2025 14:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysxS-0007Em-ET; Wed, 17 Sep 2025 14:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1125216;
 Wed, 17 Sep 2025 14:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uysxR-0007Eg-9g
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 14:16:29 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6c28c33-93d0-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 16:16:28 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso5380975f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 07:16:28 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25d49093074sm165452345ad.149.2025.09.17.07.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 07:16:27 -0700 (PDT)
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
X-Inumbo-ID: e6c28c33-93d0-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758118588; x=1758723388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/2Ux3mt+neWk7R5jMJpint+wFvErdyuY2hvaH8zDQ4=;
        b=UMg3HJcXHyZWwCEqSXcfTzM6mWTJBuUVaAo6JLX3087JKK86gf+Maln+ww8Kx+g6ei
         SMTDjPF73aEbGbhk7Gg/eDwImfR4oCbYFCNys4c4IhCBhv+ma2CqpMviVf294F6EsXoH
         HBurB7+73tSlPqZozlkEU8j5yA/KRuVUIDn8dAOaHGHcahXMcrhaYu4t7VuP3zV14M8a
         SqJhdYKX+dbyHlacDHq81oRwzDfJVmcIHkaa4WGIsk96QfA00YB7PCdGPaA7R2ZHt6je
         mPsqvQ67xWarrpfU1pMf5VaBVRtWJa0e5TUbW601h+p7N2LZ1UGDhljajQqQkJolwZqd
         ubcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118588; x=1758723388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/2Ux3mt+neWk7R5jMJpint+wFvErdyuY2hvaH8zDQ4=;
        b=rYltD1pJZELyi51GUTKtvFB14Xk6E/azxqHhsMUghqeXUpznGose+VtiN9YfRa+efF
         GPYIwBmP9uaItkT9TGAuUJsZE5tFHxSgpcXL3mZrkfMgc8xJ7mYREXzCxJsgQsGBqnYX
         li6rFmclGFRr9PgRoA9eWEgltQjaocFugz+XRsP2S5HWCO9jOUohfntvzdS0qTbBxuZW
         kWFlOaakGju9ZX64IvXQy8ahJH+QiRtkVdkrpKja7MOlDIHwM8uWLnGkUaKficb1Z+HM
         VKbiZwminFDGJYK6VzOZBRuGU9ZnaYbS1RDX0QiUsr8J9RWiQ/vdoV4HdvvUHck8Sg4E
         eYcg==
X-Forwarded-Encrypted: i=1; AJvYcCUmBoT1rlK5s3l50pXqbwmdVg+q1z14KfNnBnc+ekeamEBmo1/zexU/A8/XTOkFl3VTBPiaO2xHNuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1G8x1pDz/X5mVYFZ14biu/lGGe5bLaTHiA7pXGh8u9/lmkFaF
	uK8URVZXH422KcoP2ScnMfNNnpLydl8/6FK31nUEkS68z/uRFcHNxncEQwbzBwzkXA==
X-Gm-Gg: ASbGncs+cbwsHoOM8vM8/iozxN9pTbX7q9dboyKSbSI6cUgsac7BclvzMnevjjICARj
	T7ac+N1mXfDsRNy6nq+E2q9nDn7ZUB5uXzNHD4Rl5EuYWYFnWRCijVMuWNTFCpdwU8fqNT1gqj0
	LqWRoqfUhAMZSvjaNAWRell73D1agWBsqD6M/3e0D1wUJl7xnOXB5erWCdo9URcYkie9BKcHypm
	Pkm3SThttkdyt4Sgwa0O1CF9lzw3c8eAq1M5OG2+RxBMHVwLK7RlnynrC3bFICrQZevV6T7LSRQ
	W8CU0t8SwKdQumLq5/4MOsML+Ky75KbY36bFIkovcNUYf2cScsM2b7ELw15ME9+7K4/ev8zRTpD
	/5rEOVh4PxoLX/b0ySLEboIP2WpCmxuM=
X-Google-Smtp-Source: AGHT+IGgtr9BbvUkCmskO2aE9Zo2ZLjequgvWn0HhGfvXdTzgnywwpmH67z+DoZW7s6VLAZh4dN6kw==
X-Received: by 2002:a05:6000:2082:b0:3ea:9042:e676 with SMTP id ffacd0b85a97d-3ecdfa48003mr2368978f8f.53.1758118587685;
        Wed, 17 Sep 2025 07:16:27 -0700 (PDT)
Message-ID: <8b9d332f-e4f9-4023-b668-8a8957a45e7c@suse.com>
Date: Wed, 17 Sep 2025 16:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
 <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
 <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
 <e6199dc4-be32-4d02-86a3-1548b8aacc73@suse.com>
 <d812a470-0ced-4585-827a-16d1ab7ec6b1@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d812a470-0ced-4585-827a-16d1ab7ec6b1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 15:59, Dmytro Prokopchuk1 wrote:
> 
> 
> On 9/16/25 23:03, Jan Beulich wrote:
>> On 16.09.2025 21:35, Dmytro Prokopchuk1 wrote:
>>>
>>>
>>> On 9/16/25 17:27, Jan Beulich wrote:
>>>> On 16.09.2025 14:45, Dmytro Prokopchuk1 wrote:
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -98,6 +98,23 @@ Deviations related to MISRA C:2012 Rules:
>>>>>           even when debug-only assertions like `ASSERT_UNREACHABLE()` are removed.
>>>>>         - ECLAIR has been configured to ignore those statements.
>>>>>
>>>>> +   * - R2.1
>>>>> +     - In the specific build configuration (when the config CONFIG_ACPI is not
>>>>> +       defined) the 'BUG()' macro is intentionally used in the 'prepare_acpi()'
>>>>> +       function in the header file 'xen/arch/arm/include/asm/domain_build.h'
>>>>> +       defined as 'static inline' to trigger a runtime error if ACPI-related
>>>>> +       features are used incorrectly.
>>>>> +     - Tagged as `deliberate` for ECLAIR.
>>>>
>>>> I response to me outlining a deviation-less alternative you tried it out
>>>> and said it works. Then why is the deviation still being put in place?
>>>
>>> Yes, that's true.
>>> I started with that prepare_acpi() function and I tried to move it into
>>> xen/include/xen/acpi.h header file under appropriate #ifdef:
>>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/commit/d15cf91de92f1f8ec67911c51a13e7f095c1bcdd
>>
>> But an important part of my proposal was to have no #ifdef around
>> the declaration, iirc. With that, no violation should result.
> I don't understand, how it can help to avoid scanning by the Eclair?

I didn't say it would. Scanning will always happen. The question is
whether Eclair would flag anything.

> In particular build configuration the "static inline" version of the
> function will be present after preproccesor, and Eclair will scan it.
> 
> Jan, please, explain your thought. I think, I missed something.

If acpi_disabled is compile-time-constant false, all you need is a
declaration for prepare_acpi(). The call to it will then be DCE-ed.
No inline function, no #ifdef, no violation.

Jan

