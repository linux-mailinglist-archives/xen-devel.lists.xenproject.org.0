Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3AA3BEAF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892862.1301806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjYP-00057r-5I; Wed, 19 Feb 2025 12:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892862.1301806; Wed, 19 Feb 2025 12:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjYP-00055j-2i; Wed, 19 Feb 2025 12:51:53 +0000
Received: by outflank-mailman (input) for mailman id 892862;
 Wed, 19 Feb 2025 12:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjYN-00055b-4U
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:51:51 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 494aecfc-eec0-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 13:51:50 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5452d9d0d47so4269457e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:51:50 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461d6f3301sm1173837e87.169.2025.02.19.04.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:51:49 -0800 (PST)
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
X-Inumbo-ID: 494aecfc-eec0-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739969510; x=1740574310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xByK1DUN20ib3COmVHZDbxvbYEbVi1fKT3rapH315Jw=;
        b=XMzMFIEQaVdml7ACMyw/j9xkkB590Il01yyKOudmBZ953CFMJuhtLOUA+MRQ8C4VEm
         cZS9GTIg+N4BE8RlaG0kpC6S84BxPRSCF9IezyRMi4k+swpxIB7GcbAF1++eeH33p6Xx
         I6FsM69zsBiOZLsyFRSA7IemViLD10gxk0sy1XtdgwEN9g78TrfXeopmbhBul+6Z/tjC
         Sg4yPdeDxwpnDqiAncZO9UiEN6788n946Mc4vwbzJFP+pAkgauuC7nmNHNB1WIEXQIB2
         XxWrw4Yk5VyvknT/sOpx7G8FCq5FUofkeHcx7ie1/V9WjO2w1cmuAIwYQIoRoq89UalQ
         19KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969510; x=1740574310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xByK1DUN20ib3COmVHZDbxvbYEbVi1fKT3rapH315Jw=;
        b=qsZpGZKbwE4jAK8/rjTG2Mx8PEHrFnzmKbeSvVt9Ssdzpmg0Mpn0bga2iJBxvdarmy
         QmyjXDRcRZXjRQnHFtQx49KCl8nEgLDchoYQEY1hxWO6weqBo0EjsvDfddboyJwhlOvQ
         fq+wM3z4EpibLggU2fecg65V7qpuAeLzmydTGHqA7myBWAjMkDXZI9dx9eSj6Fn8dK5G
         pUlFqhXBPKEi2htCGaP/p84WqG633PoypSxFNOTQNhKqUhrOF0RbAEa1xAKzU8uOfvNn
         c/+wYiaPKEJ8LZnfBwuMELt7S3YoH/mPTJBPZb3y5pB72kk/GjCEaVt+/c/JUaiL0c5q
         vuZg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ42ds9SYNRxt0BWmV/NOdtx5pcOKUDu9Ok8p8PFj2tw8LzAEBTpZlDbSne2lYPV5lEx3b9N9oiEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE1wTh++kmv6LF4qvT/wk7Lv+ShT8T6VgjZLvvMBh13qMWeArS
	TA0J7knIeMlnPgwQIdCl7eGGpoRznZMohp3kWLqYJTGsL5GGkYsI
X-Gm-Gg: ASbGncsQPFSYY+CaCy/Vfimbs7rmah6rvk14BQaE45mlg3KILe/wWH5WtKud3zDWGYS
	6dnyNOSwpkRWUtPX2eZALzuV3VjWiNCCIS+AgUPo0AmlRswbYhfy/YgeHDcXI8v+30K2VFASCZY
	z0oJ8lRP1x9qmu36pQg81xlyoWUF2rWameQrE2KCcl17k8A52Rih78ggp6BXQiQbFf1o7qgsAxv
	Y8BErWRmidthBXgsAbARjQ4QtjHl/R5ZH9EU8Fxn9WHoUo5xmfxd0NtURgREYz6DMFn3vbR1GaB
	aMsQF8M/18/Ii7b7
X-Google-Smtp-Source: AGHT+IGpGtdr6sYIrK6LpYffeItXlyiCoV8wg+GcW2Sc5OoIw0seQ7uLyWBF+6oYHSm6+L4NPTKpew==
X-Received: by 2002:a05:6512:1088:b0:545:102f:8788 with SMTP id 2adb3069b0e04-5462eee6f47mr1349449e87.19.1739969509478;
        Wed, 19 Feb 2025 04:51:49 -0800 (PST)
Message-ID: <013ab6c2-65af-4dd7-8796-ac5178a7e600@gmail.com>
Date: Wed, 19 Feb 2025 14:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
 <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
 <ded403ff-b12b-4794-bbad-f4726a132ada@citrix.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <ded403ff-b12b-4794-bbad-f4726a132ada@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Andrew!

On 19.02.25 14:49, Andrew Cooper wrote:
> On 16/02/2025 5:11 pm, Oleksandr Andrushchenko wrote:
>> Hello, Roger!
>>
>> Please find the branch with all the conversions [1].
>> Unfortunately I cannot provide a branch as seen with
>> diff --ignore-all-space as such a patch will not simply apply.
>>
>> Stay safe,
>> Oleksandr Andrushchenko
>>
>> On 16.02.25 13:58, Andrew Cooper wrote:
>>> On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
>>>> There are two diff files which show what happens in case the same is
>>>> applied to the whole xen/drivers directory:
>>>> - first one is the result of the "git diff" command, 1.2M [3]
>>>> - the second one is for "git diff --ignire-all-space", 600K [4]
>>> Please can you format everything, and put it on a branch somewhere, so
>>> people can browse.
>>>
>>> ~Andrew
>> [1] https://github.com/andr2000/xen/tree/clang_ml_drivers_v002_diff
> That appears to only be drivers/
I thought that was the agreement, so we start from the drivers first
>
> Please do *everything*.  I want to see what this does to files I
> consider to be pretty clean Xen-style.
Sure
>
> ~Andrew
>
Thank you,
Oleksandr

