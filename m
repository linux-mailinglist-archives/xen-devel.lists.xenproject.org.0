Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397487BDF1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693243.1081092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklOi-00075G-A2; Thu, 14 Mar 2024 13:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693243.1081092; Thu, 14 Mar 2024 13:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklOi-000729-77; Thu, 14 Mar 2024 13:45:28 +0000
Received: by outflank-mailman (input) for mailman id 693243;
 Thu, 14 Mar 2024 13:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rklOh-000723-0d
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:45:27 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b93340d-e209-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:45:24 +0100 (CET)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6dc8b280155so591720a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:45:24 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z1-20020ae9e601000000b00788287e3430sm816917qkf.130.2024.03.14.06.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:45:21 -0700 (PDT)
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
X-Inumbo-ID: 1b93340d-e209-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710423922; x=1711028722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk3eG1yUy1iHjDkf06H64Bx/Lk42Yi6SJ26azqHUXFI=;
        b=m/x8+VdSozmTqwvDWx/qhAk5lIT3A6y6f/k6JxGS9QbPObCIoKcGoxPVNhY3xbtBvJ
         T1pyYLN7JIAjtFU9Q3zrWSzVXMuYF1BnWKrIjbRAXIxrrvegE9ewPwSkGD29czY5UG9A
         nO1KD8BKMC29LCdstF/VsFr0C8/nhMjM8prF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423922; x=1711028722;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vk3eG1yUy1iHjDkf06H64Bx/Lk42Yi6SJ26azqHUXFI=;
        b=fzhycw0Cc3CBnUrLsOKJdNsvDf+dyVFZdCNBLBtJOxCn68O/PfjeO8L2pB1Le4cmHn
         WyG/LhoVZg86cIQU4OmJnbVK7yC2ynL2hSl+yDkpVqDzhf01g0omMIJt5JyTUCqwGAbe
         /BTaangw1eAnLz8zM1r3ykYu5kPw4BLs2iHoOFyavLfcN9aaIsfKsE1PkMQK0TYIdZqW
         EkTYNME7GF/SQDwCELYCIIa4lHN/RJE86KxuH/UuJ0AeezhFq8rvWrJA8kc4nZHSyFhM
         dUbX2ao7wlr4PIVToXzUMrRABuzzM16X+UM84x3rDZp5Gtra3qJhtZEvH+A2Q+02rjSU
         jVVw==
X-Gm-Message-State: AOJu0YwfpzHwEizAJjun2OhDuSBJXrO1DiK7Ho2tKv4zxNxKAm6yDGMk
	9bE7/OUpdXdcrQcorM2AsWgYCkEDdFjnh558GZgTAFVzHhu3jvxqDyNMDlTXMYW7QG6szCOWhBH
	g
X-Google-Smtp-Source: AGHT+IHvoa7GbzYO5c8ma97/GQ4gmIoiUeQU0YvqcqlSZPsC0vg8hUORpj+rSf+qGTna0n4jKwPt0w==
X-Received: by 2002:a05:6830:2644:b0:6e5:210c:5e53 with SMTP id f4-20020a056830264400b006e5210c5e53mr801150otu.33.1710423922196;
        Thu, 14 Mar 2024 06:45:22 -0700 (PDT)
Message-ID: <21b3f342-3a51-46df-9a18-2b6015bb125b@citrix.com>
Date: Thu, 14 Mar 2024 13:45:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/bitops: Implement ffsl() in common logic
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-4-andrew.cooper3@citrix.com>
 <04b7bed5-ef60-4d21-90f2-2eea05397fb3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <04b7bed5-ef60-4d21-90f2-2eea05397fb3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2024 5:48 pm, Andrew Cooper wrote:
> On 13/03/2024 5:27 pm, Andrew Cooper wrote:
>>  xen/arch/arm/include/asm/bitops.h |  2 +-
>>  xen/arch/ppc/include/asm/bitops.h |  1 -
>>  xen/arch/x86/include/asm/bitops.h | 30 +++++++++++++-----------------
>>  xen/common/bitops.c               |  7 +++++++
>>  xen/include/xen/bitops.h          | 12 ++++++++++++
>>  5 files changed, 33 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
>> index 09c6064274a7..59ae8ed150b6 100644
>> --- a/xen/arch/arm/include/asm/bitops.h
>> +++ b/xen/arch/arm/include/asm/bitops.h
>> @@ -158,7 +158,7 @@ static inline int fls(unsigned int x)
>>  
>>  
>>  #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
>> -#define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
>> +#define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
>>  
>>  /**
>>   * find_first_set_bit - find the first set bit in @word
> It turns out this change isn't bisectable on ARM, but it is by the end
> of the series.
>
> Reordering patches 6+7 to be ahead of this one resolves the bisection
> problem.

... but introduces a bisection issue on x86.

I'm going to have to split the series up a bit more to do nicely.

~Andrew

>
> ~Andrew


