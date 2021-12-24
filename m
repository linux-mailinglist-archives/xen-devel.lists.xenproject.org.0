Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4F47EF7B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 15:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251392.432721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lSL-0003Eo-7y; Fri, 24 Dec 2021 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251392.432721; Fri, 24 Dec 2021 14:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lSL-0003Co-4f; Fri, 24 Dec 2021 14:22:01 +0000
Received: by outflank-mailman (input) for mailman id 251392;
 Fri, 24 Dec 2021 14:21:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n0lSJ-0003Ci-HT
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 14:21:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lSJ-0003Y2-4i; Fri, 24 Dec 2021 14:21:59 +0000
Received: from [54.239.6.184] (helo=[192.168.17.79])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lSI-0008Eo-Qe; Fri, 24 Dec 2021 14:21:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=8MiMQbvRe+NnD47ORMnu3Ea+2iJd+/BTtV3oTS5Xb4Y=; b=xoAf+uo4XD5Iygv9XfYlH6nrUH
	zl3v8DLEVW9uxP75zaSFF7zVE3meiY2BR/WJkIW29rYjCEBmPZZw6H3RCIG79AcXR7I8aFXMlCfxD
	F9FaMtKMJGDURvdeABm58rzcyosuemyTBnRrtBdCYYAXyTn2nK21pzSypsy0w8lFWotw=;
Message-ID: <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org>
Date: Fri, 24 Dec 2021 15:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU
 Platform
To: Dongjiu Geng <gengdongjiu1@gmail.com>
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org>
 <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
In-Reply-To: <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I am not sure why you dropped the others. I have added them back.

On 24/12/2021 14:36, Dongjiu Geng wrote:
> Julien Grall <julien@xen.org> 于2021年12月24日周五 21:25写道：
>>
>> Hi,
>>
>> On 24/12/2021 13:24, Dongjiu Geng wrote:
>>> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build failed.
>>> so fix it and make it can select GICV2.
>>
>> As I said in v1, last time I checked QEMU was only able to support
>> virtualization with GICv3. This is why we added a depends on.
> 
> I enabled CONFIG_NEW_VGIC, then it will use GICv2. In my check, it
> does not report an error.
> My QEMU emulator version is 4.0.0.  What is the QEMU version that you used?

I am using a more recent QEMU. However, I have always only used GICv3 
becuase it was IIRC there first.

> 
>>
>> If you want to remove it, then I think you ought to explain in the
>> commit message why this is fine. A pointer to the commit or a QEMU
>> version used would be useful.
> 
> OK，thanks. Can you check if QEMU 4.0.0 is workable with GICv2 on your side?

I don't have direct access to my QEMU setup at the moment. However, 
looking at the history.

So I would suggest the following commit message:

"
xen/arm: Allow QEMU platform to be built with GICv2

Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
complain about unmet dependencies:

tools/kconfig/conf  --syncconfig Kconfig

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]


It turns out that QEMU has been supporting GICv2 virtualization since 
v3.1.0. So an easy way to solve the issue and allow more custom support 
is to remove the dependencies on GICv3.
"

> It is workable on my side.
> 
> 
>>
>>>
>>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>>> ---
>>> $ make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j10
>>> make -C xen install
>>> make[1]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
>>> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig/Makefile.kconfig ARCH=arm64 SRCARCH=arm HOSTCC="gcc" HOSTCXX="g++" syncconfig
>>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
>>> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o tools/kconfig/conf.c
>>> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/confdata.o tools/kconfig/confdata.c
>>> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o tools/kconfig/expr.c
>>> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
>>> bison -o tools/kconfig/parser.tab.c --defines=tools/kconfig/parser.tab.h -t -l tools/kconfig/parser.y
>>> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/preprocess.o tools/kconfig/preprocess.c
>>> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol.o tools/kconfig/symbol.c
>>> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.lex.o tools/kconfig/lexer.lex.c
>>> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.tab.o tools/kconfig/parser.tab.c
>>> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.tab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
>>> tools/kconfig/conf  --syncconfig Kconfig
>>>
>>> WARNING: unmet direct dependencies detected for GICV3
>>>     Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>>>     Selected by [y]:
>>>     - QEMU [=y] && <choice> && ARM_64 [=y]
>>>
>>> WARNING: unmet direct dependencies detected for GICV3
>>>     Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>>>     Selected by [y]:
>>>     - QEMU [=y] && <choice> && ARM_64 [=y]
>>>
>>> WARNING: unmet direct dependencies detected for GICV3
>>>     Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
>>>     Selected by [y]:
>>>     - QEMU [=y] && <choice> && ARM_64 [=y]
>>> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
>>> make -f Rules.mk _install
>>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
>>> ---
>>>    xen/arch/arm/Kconfig           | 5 +++--
>>>    xen/arch/arm/platforms/Kconfig | 1 -
>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ecfa6822e4..373c698018 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>
>> The change in arch/arm/Kconfig is not really related to this patch.
>> Technically the part in platforms/Kconfig is sufficient. I still think
>> the change is good to have but it should be in a separate patch.
> 
> sure
> 
>>
>>> @@ -35,7 +35,7 @@ config ACPI
>>>
>>>    config GICV3
>>>        bool "GICv3 driver"
>>> -     depends on ARM_64 && !NEW_VGIC
>>> +     depends on ARM_64
>>>        default y
>>>        ---help---
>>>
>>> @@ -44,13 +44,14 @@ config GICV3
>>>
>>>    config HAS_ITS
>>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>> -        depends on GICV3 && !NEW_VGIC
>>> +        depends on GICV3
>>>
>>>    config HVM
>>>            def_bool y
>>>
>>>    config NEW_VGIC
>>>        bool "Use new VGIC implementation"
>>> +     depends on !GICV3
>>>        ---help---
>>>
>>>        This is an alternative implementation of the ARM GIC interrupt
>>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
>>> index c93a6b2756..6d3ee99456 100644
>>> --- a/xen/arch/arm/platforms/Kconfig
>>> +++ b/xen/arch/arm/platforms/Kconfig
>>> @@ -15,7 +15,6 @@ config ALL_PLAT
>>>    config QEMU
>>>        bool "QEMU aarch virt machine support"
>>>        depends on ARM_64
>>> -     select GICV3
>>>        select HAS_PL011
>>>        ---help---
>>>        Enable all the required drivers for QEMU aarch64 virt emulated

While writing a proposal for the commit message, I remembered that the 
goal of CONFIG_QEMU was to select all the required drivers to be able to 
boot Xen on QEMU.

AFAICT, if you start from tiny64_defconfig, you would not have GICv3 
selected. So we would technically break users of QEMU with GICv3.

I am not entirely sure how to approach it. I can think of 2 options:

  1) Use 'select GICv3 if !NEW_VGIC'
  2) Add a specific platform for QEMU new vGIC

I have the feeling that 1) will result to same unmet dependency issue. 
Stefano any opinions?

Cheers,

-- 
Julien Grall

