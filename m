Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79F3322E5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95307.179875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZW3-00012x-8t; Tue, 09 Mar 2021 10:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95307.179875; Tue, 09 Mar 2021 10:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZW3-00012b-57; Tue, 09 Mar 2021 10:23:03 +0000
Received: by outflank-mailman (input) for mailman id 95307;
 Tue, 09 Mar 2021 10:23:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJZW2-00012V-EC
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:23:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZW1-0004oa-Bk; Tue, 09 Mar 2021 10:23:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZW1-0008Pt-4Z; Tue, 09 Mar 2021 10:23:01 +0000
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
	bh=covjL8NQ3zDQR3nURxdMLVk/O2gDpVVUe5ScekM1mSo=; b=Vst794sYhOmkXiBZEQQq6ilvWB
	0uSnqSwH2XfHuiqdm6PfI+S1a+Qfhp4l6UKsc+Hj6CAVOs5XSmuHHqIdqAYkMGUO/J86FE7SymR8Z
	NErXGu7aLGb8UZQxVx3O6ItLaWiAOVUf/+r9xLzrTd7zqLtTH6R+UbjGXEBTHWVnW0Vk=;
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
 <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d309a1bb-8da1-ca32-3c33-82b197abfb1e@xen.org>
Date: Tue, 9 Mar 2021 10:22:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/03/2021 07:28, Michal Orzel wrote:
> 
> 
> On 08.03.2021 15:26, Jan Beulich wrote:
>> On 08.03.2021 14:59, Michal Orzel wrote:
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>   
>>>   #obj-bin-y += ....o
>>>   
>>> -ifdef CONFIG_DTB_FILE
>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>   obj-y += dtb.o
>>>   AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>   endif
>>
>> Right now what I have for my Arm test builds is an unquoted
>> string in ./.config, e.g.:
>>
>> CONFIG_DTB_FILE:=/usr/local/arm-linux-gnueabi/vexpress-v2p-aem-v7a.dtb
>>
>> While I suppose you've tested that the resulting quoting is still
>> okay, to reduce confusion perhaps the AFLAGS-y line would better
>> be changed to
>>
>> AFLAGS-y += '-DCONFIG_DTB_FILE=$(CONFIG_DTB_FILE)'
> 
> It is tested. I can change it to:
> AFLAGS-y += -DCONFIG_DTB_FILE='$(CONFIG_DTB_FILE)'
> as the -DCONFIG_DTB_FILE= does not need to be within quotes

May I ask why do we need to keep the AFLAGS-y? Wouldn't Kconfig define 
it in an header with all the other config option?

Cheers,

-- 
Julien Grall

