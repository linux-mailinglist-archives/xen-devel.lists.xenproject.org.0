Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B779A3BFB3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892907.1301850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjzd-00027E-0f; Wed, 19 Feb 2025 13:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892907.1301850; Wed, 19 Feb 2025 13:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjzc-00024H-UL; Wed, 19 Feb 2025 13:20:00 +0000
Received: by outflank-mailman (input) for mailman id 892907;
 Wed, 19 Feb 2025 13:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjzb-0001ri-6X
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:19:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f420d2-eec4-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 14:19:57 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30a29f4bd43so36041921fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:19:57 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a0cb8140esm14012431fa.30.2025.02.19.05.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:19:56 -0800 (PST)
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
X-Inumbo-ID: 36f420d2-eec4-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739971197; x=1740575997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WysCYVyTN9xosctNEaZIeNDp5RKvIJRB9VjJdhDj9KA=;
        b=OEr6GenhIvrSymsvkLO4gxBjLFjGq80qKLI5DeDIMOHO1dNQHR140MtU6KeJwn9HOX
         c8ITGmF7sNcjmOAp7GA9Qr3hkS4FZZ/RJ8dsss2jZbBQGoWzrTtTiw+7M9ZQ1J5Nj24j
         UZ86Gkq6rKgjUCfRzKykJt/b/Qu7le6Ybn56Sgt2KMWcs7puOupIlya1CXh6C0d1wljT
         EpLom/WCyAFxwZuqMGbm3FOSb8bZSqn4NXArq+5l6j5Lrue2q4hjesoDxm/Yy03j02tm
         SkOtlFBAn965yHxGx30LhHDwLckTKqKEGx5jymjrLMJIlNEUee9n7sgKmLFJAb3SrRWT
         dDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971197; x=1740575997;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WysCYVyTN9xosctNEaZIeNDp5RKvIJRB9VjJdhDj9KA=;
        b=m/DFrmAV5yyqZMpdwubT+mbVhXugv+YtXrAt7QLE2eWfUZfVXOqovUInoEYp4ePnUM
         wLoLIxZCk6qAM2hHdnY32UjBScndJ4sXbNqunwceUs5a8pxUFCa25yAy8kWljXl2haEU
         t293pGvGBrtGtryGG4sseXnGUv4fNKqGL6Y2KmoIrweH9ApjBRLvyS4yR5Uywzrl5w7S
         djVcVwWbyJXaHVVmJrZF3+bVsMYmQ6huOyUfH0VS7XAJYgDbfQt9Xuwtq7QHOYfT5T8y
         19h75sdCTIM7he1vCbD8SMUlhNXCOk8Dya6DSW7ONeec+p6A0yVg5FQLgl4GLEi0aefE
         +hNA==
X-Forwarded-Encrypted: i=1; AJvYcCUH/jMrPRfXB4kDaHcLajY8rC+UH4M/uv68tJO7uTz+OuH6neqR1xUeoErlwshKYhA+KMSFPhLZGuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXTYyHzdtTSMC9JCQHxrFa+u5X5mrtdjHSqhpO3CYfd0sM+y4g
	FVB1Ilxa4cjYk8eAbNx8cDZrlstQUmMTf4v9D2YDHCpUHMnmPbRL
X-Gm-Gg: ASbGncuFI/V+LDSBt0M1FDWNNB5SAexyZ5/7HXFUOgoxPG+HsIVKLy+2UFEt67VGU1d
	N9MabmRMMy4iedjOsRp7tTPNKEOE69PSCMEBwcZ2fKV5C/6PJJ+re9W8YKB8nm+27pjzaraE1z4
	v5wWQMXVl45JViMekgf2GhozNQxgjyW1MZiaZzPqb2elr+fWqigBb/vjvU9UtvfA1PqkhEjDm/A
	o6Je0SbHyLIoxPaAFfgOi6B/SJSnCpSafSQFsxPrTY0gPppuFinwz50RkBlyVaiePJtLCA4A8SV
	R5kVhMS350aN5K6G
X-Google-Smtp-Source: AGHT+IEph/Z0054OVYZEGv4s+Z22D8iyuy1cdX5HbHpkPTiVA+ZfDuyKhSvDELMx8B0vrpD4dfZgOQ==
X-Received: by 2002:a2e:9b0c:0:b0:309:20b4:b6d5 with SMTP id 38308e7fff4ca-30a4502608bmr11826061fa.28.1739971196613;
        Wed, 19 Feb 2025 05:19:56 -0800 (PST)
Message-ID: <c16b3ae4-dc26-4e08-81ef-47b6ae4914fe@gmail.com>
Date: Wed, 19 Feb 2025 15:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
 <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
 <ded403ff-b12b-4794-bbad-f4726a132ada@citrix.com>
 <013ab6c2-65af-4dd7-8796-ac5178a7e600@gmail.com>
Content-Language: en-US
In-Reply-To: <013ab6c2-65af-4dd7-8796-ac5178a7e600@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.02.25 14:51, Oleksandr Andrushchenko wrote:
> Hello, Andrew!
>
> On 19.02.25 14:49, Andrew Cooper wrote:
>> On 16/02/2025 5:11 pm, Oleksandr Andrushchenko wrote:
>>> Hello, Roger!
>>>
>>> Please find the branch with all the conversions [1].
>>> Unfortunately I cannot provide a branch as seen with
>>> diff --ignore-all-space as such a patch will not simply apply.
>>>
>>> Stay safe,
>>> Oleksandr Andrushchenko
>>>
>>> On 16.02.25 13:58, Andrew Cooper wrote:
>>>> On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
>>>>> There are two diff files which show what happens in case the same is
>>>>> applied to the whole xen/drivers directory:
>>>>> - first one is the result of the "git diff" command, 1.2M [3]
>>>>> - the second one is for "git diff --ignire-all-space", 600K [4]
>>>> Please can you format everything, and put it on a branch somewhere, so
>>>> people can browse.
>>>>
>>>> ~Andrew
>>> [1] https://github.com/andr2000/xen/tree/clang_ml_drivers_v002_diff
force pushed to the same branch for all Xen
>> That appears to only be drivers/
> I thought that was the agreement, so we start from the drivers first
>>
>> Please do *everything*.  I want to see what this does to files I
>> consider to be pretty clean Xen-style.
> Sure
>>
>> ~Andrew
>>
> Thank you,
> Oleksandr


