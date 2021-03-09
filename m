Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833BF332740
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95399.180064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcSz-0002lL-Eg; Tue, 09 Mar 2021 13:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95399.180064; Tue, 09 Mar 2021 13:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcSz-0002kw-B7; Tue, 09 Mar 2021 13:32:05 +0000
Received: by outflank-mailman (input) for mailman id 95399;
 Tue, 09 Mar 2021 13:32:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJcSx-0002kr-ON
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:32:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJcSw-0007v8-M1; Tue, 09 Mar 2021 13:32:02 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJcSw-0006Fs-Cu; Tue, 09 Mar 2021 13:32:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=G+pNBv5b49zvjFE59ZRNWS8odJFJxII7Ni4XB4PzReY=; b=VK9a72zbNd6KO4jV0f+m4tTV8H
	hP4WZsNUqo87ZwTZdxI3iE3prPrGaNbvH58BWnfHUDdUOZAHqStr933b6t1Ihy8C6ONveli+gIYN5
	duu6tB9IVZLlGrcuogHmvLcVgLOJxSu27EjdOqHcdGnWGzSd1LwcukmFw9pmcukP7u6U=;
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <dabb851d-fc67-7291-e7d1-ffab4276b8ea@xen.org>
Date: Tue, 9 Mar 2021 13:32:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1a1c8cf1-4c41-7fe2-ef4c-4f92d5b956c8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/03/2021 11:07, Jan Beulich wrote:
> On 09.03.2021 11:20, Julien Grall wrote:
>> On 09/03/2021 07:34, Michal Orzel wrote:
>>> On 08.03.2021 15:31, Julien Grall wrote:
>>>> On 08/03/2021 13:59, Michal Orzel wrote:
>>>>> --- a/xen/arch/arm/Makefile
>>>>> +++ b/xen/arch/arm/Makefile
>>>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>>>       #obj-bin-y += ....o
>>>>>     -ifdef CONFIG_DTB_FILE
>>>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>>>     obj-y += dtb.o
>>>>>     AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>>>     endif
>>>>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>>>     xen.lds: xen.lds.S
>>>>>         $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>>>     -dtb.o: $(CONFIG_DTB_FILE)
>>>>> -
>>>>
>>>> Why is this dropped?
>>> 1)This line is not needed as it has no impact on creating dtb.o
>>> 2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.
>>
>> Because of 1), this should have ideally be part of a separate patch. But
>> I am OK to keep it in this patch so long it is explained in the commit
>> message.
> 
> Wasn't the intention to have dtb.o re-compiled when the blob
> has changed? This would be lost with the removal of this line.

Ah yes. I was only thinking about a name change (this would be caught 
via the update of the config header) and not a file update.

-- 
Julien Grall

