Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4186BBFD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 00:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686817.1069336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfT5F-0003Y4-6h; Wed, 28 Feb 2024 23:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686817.1069336; Wed, 28 Feb 2024 23:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfT5F-0003VQ-2a; Wed, 28 Feb 2024 23:11:29 +0000
Received: by outflank-mailman (input) for mailman id 686817;
 Wed, 28 Feb 2024 23:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfT5D-0003VK-Ms
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 23:11:27 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1dc3a82-d68e-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 00:11:25 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d28e465655so3514761fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 15:11:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b00412b68cc169sm246212wmg.16.2024.02.28.15.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 15:11:23 -0800 (PST)
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
X-Inumbo-ID: b1dc3a82-d68e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709161885; x=1709766685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eb9sSmXWyyVHX0TuZl+mGrxr1zi5wA1dX/FkBS2Rw0Q=;
        b=Lkm6hmXJRWs4eh9ve1wjX8pZWl5s/i7wQ8d2fRiyVz7n4p7yprfABZVLeoIokcGy9l
         Hk+gbWn8+KpyTF6TiL4jaKyy/aAb5bKuCRwreV7w8+K/InooHSti3JhRbBxXXMamx9Tq
         u2ncvBsgeuzoUA+C7b3JME8bmL+zUNE9wzRgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709161885; x=1709766685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb9sSmXWyyVHX0TuZl+mGrxr1zi5wA1dX/FkBS2Rw0Q=;
        b=r+p7fvXVAKZcyp81CBN9WUYWNn3l6XAbNiy9xjPY1KQciv3t6BIOhANmaEc+2dvKSu
         sWm1ZVYpeXSul/Oh41r83GeR66XqrNpMTi9jF4f4sw10V0CafKyRK2QlXLMZJZFLVp42
         vpOmtAu4u+oGn/CBRUXJ+3Of4zTHmxPhwolUpH3UV04e4RbsnIHcT88iwxjBdAf3+Es4
         fLbjaW3IpP/ekPWX20PybVe64Vv7rG78ar5aBZ68qZaoyrJ1vsQf7yJK0kuCiQZnxguw
         q3JlaJMFTM3XBYMgijpqssYS8nlnPQJh7X/LHBED2WbvZ0jAODB0F7ewB03qG0hzYwnM
         YKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVofu8KB6qUIvlItgb+g+GGhIwfML84RViZ/d11++db4DZmECxKF6kZ0S4vqkme91V8pjhs0c+/OEYhJP69XEs5nQpvLdHqNtZcQsGcKPs=
X-Gm-Message-State: AOJu0YwdzR+lFpwBF2PxKVjnous5/rvCOADhp3V7L6BggXWPoiSQlv6J
	xdrlNsDCd/LvVvIGUSOwuRdF0oqRtmo0LnnDCshw19JE4e/eG1fuBbULRZE/aZE=
X-Google-Smtp-Source: AGHT+IEyB8O85gk5mxNzLVkTwjQdUUN4mlnYV2jcrna5eO2lSipyl35cklvEFtd1vm/rxi8sAMKCQQ==
X-Received: by 2002:a2e:781a:0:b0:2d2:6ed5:e45a with SMTP id t26-20020a2e781a000000b002d26ed5e45amr150543ljc.12.1709161884751;
        Wed, 28 Feb 2024 15:11:24 -0800 (PST)
Message-ID: <d0afb4d6-9fbc-49de-9f07-f76e4aeda8c1@citrix.com>
Date: Wed, 28 Feb 2024 23:11:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 10:58 pm, Julien Grall wrote:
> Hi Jan,
>
> On 27/02/2024 07:55, Jan Beulich wrote:
>> On 26.02.2024 18:39, Oleksii Kurochko wrote:
>>> This patch doesn't represent a strict lower bound for GCC and
>>> GNU Binutils; rather, these versions are specifically employed by
>>> the Xen RISC-V container and are anticipated to undergo continuous
>>> testing.
>>
>> Up and until that container would be updated to a newer gcc. I'm
>> afraid I view this as too weak a criteria,
>
> I disagree. We have to decide a limit at some point. It is sensible to
> say that we are only supporting what we can tests. AFAIK, this is what
> QEMU has been doing.
>
>> but I'm also not meaning to
>> stand in the way if somebody else wants to ack this patch in this form;
>> my bare minimum requirement is now met.
>>
>>> --- a/README
>>> +++ b/README
>>> @@ -48,6 +48,15 @@ provided by your OS distributor:
>>>         - For ARM 64-bit:
>>>           - GCC 5.1 or later
>>>           - GNU Binutils 2.24 or later
>>> +      - For RISC-V 64-bit:
>>> +        - GCC 12.2 or later
>>> +        - GNU Binutils 2.39 or later
>>> +        This doesn't represent a strict lower bound for GCC and GNU
>>> Binutils;
>>> +        rather, these versions are specifically employed by the Xen
>>> RISC-V
>>> +        container and are anticipated to undergo continuous testing.
>>
>> As per above, I think here it really needs saying "at the time of
>> writing"
>> or recording a concrete date. Furthermore I expect "these versions"
>> relates
>> to the specifically named versions and particularly _not_ to "or later":
>> With the criteria you apply, using later versions (or in fact any
>> version
>> other than the very specific ones used in the container) would be
>> similarly
>> untested. Much like x86 and Arm don't have the full range of permitted
>> tool chain versions continuously tested. Plus don't forget that
>> distros may
>> apply their own selection of patches on top of what they take from
>> upstream
>> (and they may also take random snapshots rather than released versions).
>
> TBH, I think this should be dropped from the README. With the wording,
> it implies that older GCC would work, but this is not a guarantee.
>
> The same for Arm, I suspect some revision of GCC below 5.1 that may
> work. But that's just convenience to list a lower limit.
>
> With the sentence dropped, I would be happy to ack this patch.
>
>>
>> IOW it is hard for me to see why RISC-V needs stronger restrictions here
>> than other architectures. It ought to be possible to determine a
>> baseline
>> version. Even if taking the desire to have "pause" available as a
>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>
> I think we want to bump it on Arm. There are zero reasons to try to
> keep a lower versions if nobody tests/use it in production.
>
> I would suggest to do the same on x86. What's the point of try to
> support Xen with a 15+ years old compiler?

There is a material cost to supporting ancient toolchains.  I'm
increasingly unwilling to keep paying.

I'm also bored of needing to support versions of binutils which don't
know the Virt instructions, which are approaching 2 decades old now.

There are very good reasons to move to GCC 5.1 minimum across the board,
because that gets us several features (__has_include(), asm goto and
_Generic()) which will make material improvements to our code.  And I'd
like to start using other bits of C11/gnu11.

The choice of minimum toolchains should definitely be per-arch, and
"this is the oldest one we regularly test" is an entirely fine reason to
set the minimum bar.

Furthermore, Linux has regularly been bumping minimum toolchain versions
due to code generation issues, and we'd be foolish not pay attention.

~Andrew

