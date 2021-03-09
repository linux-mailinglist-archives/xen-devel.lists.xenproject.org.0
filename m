Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47B331FEA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 08:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95241.179730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJWt0-0001BG-Fx; Tue, 09 Mar 2021 07:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95241.179730; Tue, 09 Mar 2021 07:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJWt0-0001At-Cr; Tue, 09 Mar 2021 07:34:34 +0000
Received: by outflank-mailman (input) for mailman id 95241;
 Tue, 09 Mar 2021 07:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyQX=IH=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJWsz-0001Am-0F
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 07:34:33 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c0a6dabd-1374-4de3-b90a-54ec20d09738;
 Tue, 09 Mar 2021 07:34:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69AABD6E;
 Mon,  8 Mar 2021 23:34:31 -0800 (PST)
Received: from [10.57.15.131] (unknown [10.57.15.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB35E3F70D;
 Mon,  8 Mar 2021 23:34:29 -0800 (PST)
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
X-Inumbo-ID: c0a6dabd-1374-4de3-b90a-54ec20d09738
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <3353ecf1-3a76-70ee-0475-b7eed90c783c@arm.com>
Date: Tue, 9 Mar 2021 08:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 08.03.2021 15:31, Julien Grall wrote:
> Hi,
> 
> On 08/03/2021 13:59, Michal Orzel wrote:
>> Currently in order to link existing DTB into Xen image
>> we need to either specify option CONFIG_DTB_FILE on the
>> command line or manually add it into .config.
>> Add Kconfig entry: CONFIG_DTB_FILE to be able to
>> provide the path to DTB we want to embed into Xen image.
>> If no path provided - the dtb will not be embedded.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/Makefile | 4 +---
>>   xen/common/Kconfig    | 8 ++++++++
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 16e6523e2c..0f3e99d075 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>     #obj-bin-y += ....o
>>   -ifdef CONFIG_DTB_FILE
>> +ifneq ($(CONFIG_DTB_FILE),"")
>>   obj-y += dtb.o
>>   AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>   endif
>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>   xen.lds: xen.lds.S
>>       $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>   -dtb.o: $(CONFIG_DTB_FILE)
>> -
> 
> Why is this dropped?
1)This line is not needed as it has no impact on creating dtb.o
2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.
> 
>>   .PHONY: clean
>>   clean::
>>       rm -f asm-offsets.s xen.lds
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index eb953d171e..a4c8d09edf 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -400,6 +400,14 @@ config DOM0_MEM
>>           Leave empty if you are not sure what to specify.
>>   +config DTB_FILE
> 
> May I ask why is this add in common/Kconfig rather than arm/Kconfig?
> 
I wanted to have it in common features rather than architecture features.
Maybe it could be later on used by other architectures.
>> +    string "Absolute path to device tree blob"
>> +    depends on ARM
> 
> If this stay in common Kconfig, shouldn't this be gated with HAS_DEVICE_TREE?
No it shouldn't as  CONFIG_DTB_FILE depends on CONFIG_ARM which selects CONFIG_HAS_DEVICE_TREE
> 
>> +    ---help---
>> +      When using a bootloader that has no device tree support or when there
>> +      is no bootloader at all, use this option to specify the absolute path
>> +      to a device tree that will be linked directly inside Xen binary.
>> +
>>   config TRACEBUFFER
>>       bool "Enable tracing infrastructure" if EXPERT
>>       default y
>>
> 
> Cheers,
> 
Cheers,
Michal

