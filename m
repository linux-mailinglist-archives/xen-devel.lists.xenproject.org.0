Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A33322D6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95304.179863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZTI-0000tO-QT; Tue, 09 Mar 2021 10:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95304.179863; Tue, 09 Mar 2021 10:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZTI-0000sz-N8; Tue, 09 Mar 2021 10:20:12 +0000
Received: by outflank-mailman (input) for mailman id 95304;
 Tue, 09 Mar 2021 10:20:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJZTG-0000ss-I8
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:20:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZTC-0004mc-VA; Tue, 09 Mar 2021 10:20:06 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZTC-00083R-Mr; Tue, 09 Mar 2021 10:20:06 +0000
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
	bh=8bCymydj2Zxf+dsOZKb5owZGY8CvDvTF4aQ8xq/5zK8=; b=Tyo7fSkJPcqvhlV307n0zx98qW
	n4z91y//L6Rj25RbBNSidFeUdcByrMiulITr8dZEceDEZ29Cga10UnoTvm0z8kthPPBHrvpuW6mYa
	4dKKCslIsnpSbdO/nTqcf9CXNNzRKbaYwATOJP9aMmmYCEL90gt67ALt/XgOqTDfy85M=;
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
 <3353ecf1-3a76-70ee-0475-b7eed90c783c@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7fc35e8-fe09-d78b-7f8b-7e30c58662cb@xen.org>
Date: Tue, 9 Mar 2021 10:20:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <3353ecf1-3a76-70ee-0475-b7eed90c783c@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/03/2021 07:34, Michal Orzel wrote:
> Hi Julien,

Hi,

> On 08.03.2021 15:31, Julien Grall wrote:
>> Hi,
>>
>> On 08/03/2021 13:59, Michal Orzel wrote:
>>> Currently in order to link existing DTB into Xen image
>>> we need to either specify option CONFIG_DTB_FILE on the
>>> command line or manually add it into .config.
>>> Add Kconfig entry: CONFIG_DTB_FILE to be able to
>>> provide the path to DTB we want to embed into Xen image.
>>> If no path provided - the dtb will not be embedded.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>    xen/arch/arm/Makefile | 4 +---
>>>    xen/common/Kconfig    | 8 ++++++++
>>>    2 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 16e6523e2c..0f3e99d075 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>      #obj-bin-y += ....o
>>>    -ifdef CONFIG_DTB_FILE
>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>    obj-y += dtb.o
>>>    AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>    endif
>>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>    xen.lds: xen.lds.S
>>>        $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>    -dtb.o: $(CONFIG_DTB_FILE)
>>> -
>>
>> Why is this dropped?
> 1)This line is not needed as it has no impact on creating dtb.o
> 2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.

Because of 1), this should have ideally be part of a separate patch. But 
I am OK to keep it in this patch so long it is explained in the commit 
message.

>>
>>>    .PHONY: clean
>>>    clean::
>>>        rm -f asm-offsets.s xen.lds
>>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>>> index eb953d171e..a4c8d09edf 100644
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -400,6 +400,14 @@ config DOM0_MEM
>>>            Leave empty if you are not sure what to specify.
>>>    +config DTB_FILE
>>
>> May I ask why is this add in common/Kconfig rather than arm/Kconfig?
>>
> I wanted to have it in common features rather than architecture features.
> Maybe it could be later on used by other architectures.

The same can be argued for a few CONFIG in arch/.../Kconfig. What I want 
to avoid is spreading depends on <ARCH> in the common/Kconfig.

>>> +    string "Absolute path to device tree blob"
>>> +    depends on ARM
>>
>> If this stay in common Kconfig, shouldn't this be gated with HAS_DEVICE_TREE?
> No it shouldn't as  CONFIG_DTB_FILE depends on CONFIG_ARM which selects CONFIG_HAS_DEVICE_TREE
I think you misunderstood my point, what I suggested is replacing 
"depends on Arm" by "depends on HAS_DEVICE_TREE".

This is for two reasons:
   1) This avoids spreading depend on <ARCH> in common/kconfig
   2) This avoids the assumption that Arm is always using DT

If you would rather not use "depends on HAS_DEVICE_TREE", then I think 
this config should go in arch/arm/Kconfig until we see another users.

Cheers,

-- 
Julien Grall

