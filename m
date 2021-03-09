Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5B3327DA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95441.180260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcpS-0006IJ-FS; Tue, 09 Mar 2021 13:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95441.180260; Tue, 09 Mar 2021 13:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcpS-0006Ht-CD; Tue, 09 Mar 2021 13:55:18 +0000
Received: by outflank-mailman (input) for mailman id 95441;
 Tue, 09 Mar 2021 13:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyQX=IH=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJcpQ-0006Hl-2P
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:55:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6ab6ce86-6b27-4ca5-a82f-8fd2d5728429;
 Tue, 09 Mar 2021 13:55:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E52131B;
 Tue,  9 Mar 2021 05:55:13 -0800 (PST)
Received: from [10.57.15.131] (unknown [10.57.15.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C18C3F71B;
 Tue,  9 Mar 2021 05:55:09 -0800 (PST)
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
X-Inumbo-ID: 6ab6ce86-6b27-4ca5-a82f-8fd2d5728429
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
 <3353ecf1-3a76-70ee-0475-b7eed90c783c@arm.com>
 <d7fc35e8-fe09-d78b-7f8b-7e30c58662cb@xen.org>
 <1a1c8cf1-4c41-7fe2-ef4c-4f92d5b956c8@suse.com>
 <dabb851d-fc67-7291-e7d1-ffab4276b8ea@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <4a2a8caa-fc13-e18d-6c60-02f3597dc9f9@arm.com>
Date: Tue, 9 Mar 2021 14:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dabb851d-fc67-7291-e7d1-ffab4276b8ea@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09.03.2021 14:32, Julien Grall wrote:
> 
> 
> On 09/03/2021 11:07, Jan Beulich wrote:
>> On 09.03.2021 11:20, Julien Grall wrote:
>>> On 09/03/2021 07:34, Michal Orzel wrote:
>>>> On 08.03.2021 15:31, Julien Grall wrote:
>>>>> On 08/03/2021 13:59, Michal Orzel wrote:
>>>>>> --- a/xen/arch/arm/Makefile
>>>>>> +++ b/xen/arch/arm/Makefile
>>>>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>>>>       #obj-bin-y += ....o
>>>>>>     -ifdef CONFIG_DTB_FILE
>>>>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>>>>     obj-y += dtb.o
>>>>>>     AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>>>>     endif
>>>>>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>>>>     xen.lds: xen.lds.S
>>>>>>         $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>>>>     -dtb.o: $(CONFIG_DTB_FILE)
>>>>>> -
>>>>>
>>>>> Why is this dropped?
>>>> 1)This line is not needed as it has no impact on creating dtb.o
>>>> 2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.
>>>
>>> Because of 1), this should have ideally be part of a separate patch. But
>>> I am OK to keep it in this patch so long it is explained in the commit
>>> message.
>>
>> Wasn't the intention to have dtb.o re-compiled when the blob
>> has changed? This would be lost with the removal of this line.
> 
> Ah yes. I was only thinking about a name change (this would be caught via the update of the config header) and not a file update.
> 
I already pushed v3 but I agree. Something like this would do the job:
dtb.o: $(subst $\",,$(CONFIG_DTB_FILE))
to remove quotes

