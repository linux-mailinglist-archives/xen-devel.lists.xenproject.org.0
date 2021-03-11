Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A33370E0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 12:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96456.182495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJDg-0008Ez-AP; Thu, 11 Mar 2021 11:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96456.182495; Thu, 11 Mar 2021 11:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJDg-0008Ed-7H; Thu, 11 Mar 2021 11:11:08 +0000
Received: by outflank-mailman (input) for mailman id 96456;
 Thu, 11 Mar 2021 11:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKJDf-0008EY-6K
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:11:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKJDb-0003Ve-AQ; Thu, 11 Mar 2021 11:11:03 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKJDa-0005Ks-U0; Thu, 11 Mar 2021 11:11:03 +0000
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
	bh=PDZ2BIw7q+qBLZK1zBozS1BpcLY0D+YLKVjixvzXI8k=; b=z81pII8bkSccsML3U319gD5UBs
	ak1Wenvc3c7om1APDoqnMb9A450ZiA9HkDXdhkr1ngsEXRqqDOSPXKWUhKZN5IaZxxziDF8N7r+71
	i1l8sApXgzahopmfLwhQBQ9VkK0uS1soqsg2xdPWsHRc7zFnGVi1CB3KefFtGz8i7Be4=;
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210310065803.348-1-michal.orzel@arm.com>
 <3d3e5573-6d64-98cd-1f6f-897eb860d8ba@xen.org>
 <16f39b33-2e26-1a4b-5415-02cd14edaf24@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fbd054dc-d9f9-f6c1-97b5-e71cc3c0e0ae@xen.org>
Date: Thu, 11 Mar 2021 11:11:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <16f39b33-2e26-1a4b-5415-02cd14edaf24@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 11/03/2021 10:41, Michal Orzel wrote:
> Hi Julien,

Hi,

> 
> On 11.03.2021 11:34, Julien Grall wrote:
>> Hi Michal,
>>
>> On 10/03/2021 06:58, Michal Orzel wrote:
>>> Currently in order to link existing DTB into Xen image
>>> we need to either specify option CONFIG_DTB_FILE on the
>>> command line or manually add it into .config.
>>> Add Kconfig entry: CONFIG_DTB_FILE to be able to
>>> provide the path to DTB we want to embed into Xen image.
>>> If no path provided - the dtb will not be embedded.
>>>
>>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>> as it is not needed since Kconfig will define it in a header
>>> with all the other config options.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>    xen/arch/arm/Makefile | 5 ++---
>>>    xen/common/Kconfig    | 8 ++++++++
>>>    2 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 16e6523e2c..46e6a95fec 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -68,9 +68,8 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>      #obj-bin-y += ....o
>>>    -ifdef CONFIG_DTB_FILE
>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>    obj-y += dtb.o
>>> -AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>    endif
>>>      ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
>>> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>    xen.lds: xen.lds.S
>>>        $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>    -dtb.o: $(CONFIG_DTB_FILE)
>>> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>>>      .PHONY: clean
>>>    clean::
>>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>>> index eb953d171e..a27836bf47 100644
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -400,6 +400,14 @@ config DOM0_MEM
>>>            Leave empty if you are not sure what to specify.
>>>    +config DTB_FILE
>>> +    string "Absolute path to device tree blob"
>>> +    depends on HAS_DEVICE_TREE
>>> +    ---help---
>>> +      When using a bootloader that has no device tree support or when there
>>> +      is no bootloader at all, use this option to specify the absolute path
>>> +      to a device tree that will be linked directly inside Xen binary.
>>
>> With this approach, CONFIG_DTB_FILE will always be defined. This means that Xen will always be compiled to use the "embedded" DTB. When the string is "", it will be garbagge.
>>
>> So I think we need a second config to that indicates whether the string is empty or not.
>>
>> Interestingly, your first version of patch didn't expose the problem because CONFIG_DTB_FILE would not be defined if the CONFIG_LINK_DTB is not selected. Although, it would still happily build if CONFIG_DTB_FILE is "".
>>
>> Cheers,
>>
> I do not agrree. We do not need another config.

Did you test that Xen will still boot if the string is empty?

> If string is empty - the dtb.o will not be created and there will be no dtb section in xen binary.

The dtb.o will not be created but the section will because the linker 
use #ifdef CONFIG_DTB_FILE:

42sh> grep CONFIG_DTB .config
CONFIG_DTB_FILE=""
42sh> nm xen-syms | grep _sdtb
00000000003560f8 B _sdtb

And to show this is going to be used:

42sh> git diff
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 5d44667bd89d..2b680b8226d2 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -297,6 +297,7 @@ real_start_efi:

          /* Using the DTB in the .dtb section? */
  #ifdef CONFIG_DTB_FILE
+        e
          load_paddr x21, _sdtb
  #endif

42hs> make
[...]
   CC      arm64/head.o
arm64/head.S: Assembler messages:
arm64/head.S:300: Error: unknown mnemonic `e' -- `e'
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/Rules.mk:204: recipe for 
target 'arm64/head.o' failed

So _sdtb is going to always be used...

Cheers,

-- 
Julien Grall

