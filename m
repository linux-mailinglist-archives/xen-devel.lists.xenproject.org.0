Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B3ABD322
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990571.1374518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ6r-00070k-3j; Tue, 20 May 2025 09:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990571.1374518; Tue, 20 May 2025 09:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ6r-0006yV-0Y; Tue, 20 May 2025 09:18:05 +0000
Received: by outflank-mailman (input) for mailman id 990571;
 Tue, 20 May 2025 09:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHJ6q-0006yK-3i
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:18:04 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 545557ff-355b-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 11:18:02 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad56829fabdso331127066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:18:02 -0700 (PDT)
Received: from [10.10.4.69] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad53603a399sm662064266b.40.2025.05.20.02.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 02:18:01 -0700 (PDT)
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
X-Inumbo-ID: 545557ff-355b-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747732682; x=1748337482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMexUm1jxCPyNAqeBNWuh8jrILHmwhJLyz/8VAM3tp4=;
        b=RqIo02bgZBTm1OdwGFkZPAKvrG6Oh9F2k7WpzIxWI95iLvBAkJzX2rIdZHQi0Sbvon
         /94eny2pdf51SRIEMk+lihoc1gfdxcVuXFZj3iU1UUBjUKZSZVxX6tWRfCKCFxhWokJ9
         GSKOAB0nEs8F4xIMjLzV/9vGKoU7Jm6uDs/dV91mUsUfFuScnbHNMqqOAyIIQ+lQqkxb
         +vCA99gVjaQ4dBGK/8bm/aMdkrV4yrmmqTkvVbaMjXe5A9USHLkeCQQ7uAq1PUUrBZJf
         y+8aZyK+Q6rRmpqVQ+76zVYfB6W5+HZ7CReucLD+TxMdPlxE0rHqFCd/4YPSAY1Eiv6S
         adDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732682; x=1748337482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMexUm1jxCPyNAqeBNWuh8jrILHmwhJLyz/8VAM3tp4=;
        b=S0Lb6JXfdAFPtuDOghrm7xkwbfLJQc5qH2cK14TCVCiMwYdrqJZ8Uqrp3lyjEiuvjO
         PgRFDZJIod4F7ZMc+JVRrP08mvTMfeBHeGKWspZr0p1Yam2O8+ncZMwS5zFwm1F5PI7m
         m/VZB/mntm1Bmc6wWyQRESGPCeSLrAddfU+HJRWUiQuPj4jkpimvJrltT8+d8ohcM67r
         yjLJFS7RbXTF3sYL5HLrKufle2QBf06Ib2Yfu9rUop+FYbXC8Yyb9o3xI3RNX1z5lHm+
         eSDAI5+ZRflQxipN4BBXXvIZoHGiM1SkDNQJ3cQdMZQJd5EeP3jPUBzWYkRNPjlG1qgZ
         VEzw==
X-Forwarded-Encrypted: i=1; AJvYcCX5nRk+/dH0+Xo1L2ibneJDhtNnPawQc3nDxfaYHtuu7O49gxfeW2WhLHKmY5cX3PeJMeWPWoP0UII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyLQiaC1r23nnalYRYgzIlkFgrR5+rmv8WNdxLXHgevHmCMIvB
	RK7aRpZhhDSNVhvlSWNX0cF8+r+TIye5kI6xjytX2AT4A6KMTUpsC8cEu6yzBD+6/g==
X-Gm-Gg: ASbGnctfygaYCpueC/8EPFuQBtQtlkbuA/O+O2J8S4lJoHwXC9xeY16HjHU7YEckL2X
	wBGIK/Ers+q8AZQp2z4kVc88ZpZgQ3mQcxMNqXJXgBOrzn9/3DWKLghps20vbP6YR6D9GXhgHuP
	XV2UucAeOqvbddvQts+P/2lHueklnZpDox4AiUiEN1s8ce7dAuRcIezQWd1aqAV6k5V22M+MVDy
	pv4cPtvPQ/qlgOvHGIZAeHLr8V0nmws6H6xw5X2/BUGbsNtdkigNr4a5RmmICTWMJVwOpL1+hCI
	mNY/fuEgFHzVKFXvM1plyLN5P+NJ7vzC2tyU2Z/3IgJhlEzCuyfLINhIK9dI/fIPD/v8yXbRkFu
	wTu+6EELj0F2hfUg=
X-Google-Smtp-Source: AGHT+IFuCXuA5lcFlHthrr38+rhqTqlZ0B4YrWHJr6Js8KWRIRmIb2gNhDwrwyNEWxFmyKPeLtf+MA==
X-Received: by 2002:a17:907:8e96:b0:ad2:2fe0:6310 with SMTP id a640c23a62f3a-ad52d60848bmr1470782366b.57.1747732681666;
        Tue, 20 May 2025 02:18:01 -0700 (PDT)
Message-ID: <4a5580aa-2a2a-4b67-9bea-1c53fa5639e4@suse.com>
Date: Tue, 20 May 2025 11:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
 <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
 <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <75679a60-7ca0-41da-b542-c5b9d5efdfbe@suse.com>
 <DM4PR12MB8451E0A93F3F45229B8AD900E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM4PR12MB8451E0A93F3F45229B8AD900E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 10:22, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 13, 2025 4:03 PM
>>
>> On 09.05.2025 08:36, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, April 30, 2025 9:55 PM
>>>>
>>>> On 14.04.2025 09:40, Penny Zheng wrote:
>>>>> HWP, amd-cppc, amd-cppc-epp are all the implementation of ACPI CPPC
>>>>> (Collaborative Processor Performace Control), so we introduce
>>>>> cppc_mode flag to print CPPC-related para.
>>>>>
>>>>> And HWP and amd-cppc-epp are both governor-less driver, so we
>>>>> introduce hw_auto flag to bypass governor-related print.
>>>>
>>>> But in the EPP driver you use the information which governor is active.
>>>
>>> We want to have a one-one mapping between governor and epp value, such
>>> as, If users choose performance governor, no matter via "xenpm" or
>>> cmdline, users want maximum performance, We set epp with 0 to meet the
>> expectation.
>>> And if users choose powersave governor, users want the least power
>>> consumption, then we shall set epp with 255 to meet the expectation.
>>
>> That's all fine, but completely misses the point of my question: If the governor is
>> relevant, why would you bypass respective printing?
>>
> 
> The only useful info in governor for epp mode, IMO, is its name.
> I deduce which performance policy user wants to apply through which governor they choose.
> If user chooses performance governor, they want maximum performance.
> If user chooses powersave governor, they want the least power consumption
> I could only provide appropriate epp value in above two scenarios.
> ondemand and userspace are forbidden choices, and if users specify such options in cmdline,
> I shall give warning message to say  that amd-cppc in active mode is governor-less, and users could
> set epp values on runtime to specify bias towards performance or efficiency.
> 
> If above is messy, I could also totally forbid governor thing for active mode... wdyt?

Then how would one pick between performance and powersave?

Jan

