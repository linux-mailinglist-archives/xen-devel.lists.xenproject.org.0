Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E633703B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96446.182472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIkj-0005EO-F6; Thu, 11 Mar 2021 10:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96446.182472; Thu, 11 Mar 2021 10:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIkj-0005Dz-Bp; Thu, 11 Mar 2021 10:41:13 +0000
Received: by outflank-mailman (input) for mailman id 96446;
 Thu, 11 Mar 2021 10:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYX0=IJ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lKIkh-0005Du-NC
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:41:11 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e00ee762-1152-4a4c-977c-b5a273e1dbd5;
 Thu, 11 Mar 2021 10:41:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C3A11FB;
 Thu, 11 Mar 2021 02:41:09 -0800 (PST)
Received: from [10.57.15.166] (unknown [10.57.15.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BEE3F70D;
 Thu, 11 Mar 2021 02:41:07 -0800 (PST)
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
X-Inumbo-ID: e00ee762-1152-4a4c-977c-b5a273e1dbd5
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210310065803.348-1-michal.orzel@arm.com>
 <3d3e5573-6d64-98cd-1f6f-897eb860d8ba@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <16f39b33-2e26-1a4b-5415-02cd14edaf24@arm.com>
Date: Thu, 11 Mar 2021 11:41:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3d3e5573-6d64-98cd-1f6f-897eb860d8ba@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 11.03.2021 11:34, Julien Grall wrote:
> Hi Michal,
> 
> On 10/03/2021 06:58, Michal Orzel wrote:
>> Currently in order to link existing DTB into Xen image
>> we need to either specify option CONFIG_DTB_FILE on the
>> command line or manually add it into .config.
>> Add Kconfig entry: CONFIG_DTB_FILE to be able to
>> provide the path to DTB we want to embed into Xen image.
>> If no path provided - the dtb will not be embedded.
>>
>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>> as it is not needed since Kconfig will define it in a header
>> with all the other config options.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/Makefile | 5 ++---
>>   xen/common/Kconfig    | 8 ++++++++
>>   2 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 16e6523e2c..46e6a95fec 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -68,9 +68,8 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>     #obj-bin-y += ....o
>>   -ifdef CONFIG_DTB_FILE
>> +ifneq ($(CONFIG_DTB_FILE),"")
>>   obj-y += dtb.o
>> -AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>   endif
>>     ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
>> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>   xen.lds: xen.lds.S
>>       $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>   -dtb.o: $(CONFIG_DTB_FILE)
>> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>>     .PHONY: clean
>>   clean::
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index eb953d171e..a27836bf47 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -400,6 +400,14 @@ config DOM0_MEM
>>           Leave empty if you are not sure what to specify.
>>   +config DTB_FILE
>> +    string "Absolute path to device tree blob"
>> +    depends on HAS_DEVICE_TREE
>> +    ---help---
>> +      When using a bootloader that has no device tree support or when there
>> +      is no bootloader at all, use this option to specify the absolute path
>> +      to a device tree that will be linked directly inside Xen binary.
> 
> With this approach, CONFIG_DTB_FILE will always be defined. This means that Xen will always be compiled to use the "embedded" DTB. When the string is "", it will be garbagge.
> 
> So I think we need a second config to that indicates whether the string is empty or not.
> 
> Interestingly, your first version of patch didn't expose the problem because CONFIG_DTB_FILE would not be defined if the CONFIG_LINK_DTB is not selected. Although, it would still happily build if CONFIG_DTB_FILE is "".
> 
> Cheers,
> 
I do not agrree. We do not need another config.
If string is empty - the dtb.o will not be created and there will be no dtb section in xen binary.
The dtb.o will be compiled and embedded into Xen if and only if the path to dtb was given.

Cheers,
Michal

