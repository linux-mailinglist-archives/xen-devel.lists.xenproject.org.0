Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0046FD9A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243631.421474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvc4m-0002Wl-8X; Fri, 10 Dec 2021 09:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243631.421474; Fri, 10 Dec 2021 09:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvc4m-0002Tw-46; Fri, 10 Dec 2021 09:20:24 +0000
Received: by outflank-mailman (input) for mailman id 243631;
 Fri, 10 Dec 2021 09:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvc4k-0002Tq-2g
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:20:22 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 658b9d0e-599a-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:20:20 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id cf39so4790584lfb.8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 01:20:21 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j20sm253534lfm.136.2021.12.10.01.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 01:20:20 -0800 (PST)
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
X-Inumbo-ID: 658b9d0e-599a-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=O4zVFLahCre8SRQUmVJmme9V5fkFHSrE7LdKPl4d58s=;
        b=aWsrKjGxQvnfprrQT84tGmXmB6AOpiF4BYv1soFBVpUHPMd5/cSV8bzhoEfq9yZ2VW
         nNqIW9SXPOz4zPRNtK0Tbhe2Tbxs0TSWpFhvVSSdh5ePLaZe/RO+dDVItNcxYYuQFu8i
         hpoOhTmXOI4q+abTc8DuZp5vdait0G4H8nuaCAfw7CDndnQjAxlk9yOrP6qDq2brEkuk
         PSzZ0SjxSi4lGb6vtnLLYM6aZw4eA29c5WeW0kZIIFDNHjnBQe3VRjrAR9S5VUEWA/oh
         e5dXnbIyJ5iqPWB1sVRonGFIlRm1vCAoghUyveqHakiqcEiyhNYZaaFoizDeNI6YFHvv
         L2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=O4zVFLahCre8SRQUmVJmme9V5fkFHSrE7LdKPl4d58s=;
        b=xSOFaOyyFIxPGXqsM5Vx5sisrcSSXcnFa6AHnicUKTkpA9DcxVzpLHo9Q9kmBqTtj4
         QPKsywk77jTGmS4tUA4dKorsrvG9g+X623+QmP7/1PuW17eh+YbjCQPvhL3fKr6mdby1
         5+KbEzRQBcgtZ+hHWxchSmUGoQK4iRk2iNE8R9FaL8N8f0Cj9e6F3LmSO8OaN3DiLxuH
         PpA3rzEJv6soYdMPtLQG70anGAuxU618Gawb0YcS6jB8FREz57dIVRsAJ/E76MhJdUc5
         rZnyic7IWNhxutiFYkE7g7UkP29DgrI5bnUx5UZCm3f1ghWe7Whz8OXZemZZUkeq+t/L
         oSNg==
X-Gm-Message-State: AOAM530gmBlAXW8t15UeT7LlqDqFR0Febsu2abgUfSQ1nHYZLRAK822e
	SGxweGSWy5ki+3BrdmmrnP0=
X-Google-Smtp-Source: ABdhPJz66p28hML9WrIlquVkqzllJisH5ltmqgrCAxA9LGX01EGg3RtGyvAMKYpK+3F9cFzecnhGEw==
X-Received: by 2002:a19:614f:: with SMTP id m15mr11279515lfk.187.1639128020526;
        Fri, 10 Dec 2021 01:20:20 -0800 (PST)
Subject: Re: [PATCH] arm/docs: Drop mentioning of ACPI for properties under
 "hypervisor" node
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
 <9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e243cee9-d97d-2bf6-3a20-62dab544b74d@gmail.com>
Date: Fri, 10 Dec 2021 11:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.12.21 11:00, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 09/12/2021 20:50, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Remove the following sentence:
>> "This property is unnecessary when booting Dom0 using ACPI."
>> for "reg" and "interrupts" properties as the initialization is not
>> done via device-tree "hypervisor" node in that case anyway.
>
> Why do you think that? On ACPI, the hypervisor node is used to 
> discover whether the OS is running on top of Xen (see [1]).
>
> For dom0, Xen will actually create the hypervisor node with the 
> compatible property and the uefi bits (see [2]).
>
> The properties "regs" and "interrupts" are not created for ACPI and 
> therefore this should be mentioned in the Device-Tree bindings.


You are right. I missed that fact. Current patch is not needed in this case.


>
>
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   docs/misc/arm/device-tree/guest.txt | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/docs/misc/arm/device-tree/guest.txt 
>> b/docs/misc/arm/device-tree/guest.txt
>> index c115751..2b974bb 100644
>> --- a/docs/misc/arm/device-tree/guest.txt
>> +++ b/docs/misc/arm/device-tree/guest.txt
>> @@ -15,11 +15,9 @@ the following properties:
>>     or equal to gnttab_max_grant_frames()).
>>     Regions 1...N are extended regions (unused address space) for 
>> mapping foreign
>>     GFNs and grants, they might be absent if there is nothing to expose.
>> -  This property is unnecessary when booting Dom0 using ACPI.
>>     - interrupts: the interrupt used by Xen to inject event 
>> notifications.
>>     A GIC node is also required.
>> -  This property is unnecessary when booting Dom0 using ACPI.
>>     To support UEFI on Xen ARM virtual platforms, Xen populates the 
>> FDT "uefi" node
>>   under /hypervisor with following parameters:
>
> Cheers,
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/xen/enlighten.c#n253
>
> [2] 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/acpi/domain_build.c;h=bbdc90f92c003c0c6d0f0b0290a1776336224719;hb=HEAD#l90
>
-- 
Regards,

Oleksandr Tyshchenko


