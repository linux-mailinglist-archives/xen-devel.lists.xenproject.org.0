Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C600033EF63
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98648.187200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUEM-0002H2-3T; Wed, 17 Mar 2021 11:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98648.187200; Wed, 17 Mar 2021 11:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUEL-0002Gd-WC; Wed, 17 Mar 2021 11:20:49 +0000
Received: by outflank-mailman (input) for mailman id 98648;
 Wed, 17 Mar 2021 11:20:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUEK-0002GY-AR
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:20:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUEI-0004fA-Vo; Wed, 17 Mar 2021 11:20:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUEI-0007Z8-OY; Wed, 17 Mar 2021 11:20:46 +0000
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
	bh=/JaFqClbbdto82Yup5bj4jOhAqVhsibuW3DYqaAoAOo=; b=uQjBCFaxlZfQOz45MJUNaNi7HN
	ErZCXOFybVTpHVzcRXZJCpD8r6wooO3LcbLnG4MGAQ9PP4r8TGOqHv0VYxeZPkCh1rlUZNa/c7dTB
	PbQrZGlmGdLQLbfJgjxcvdSL7fj+gG9CVkWLN4xxTHq5R8v9A+ccrB+cRvwcRSEQkOcE=;
Subject: Re: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210313160611.18665-1-julien@xen.org>
 <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
 <119bdbc0-5400-87eb-e6ad-87b59ec4e07c@xen.org>
 <4066B6A3-2904-4800-B63A-7EAD1EFC7D16@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ee09d90d-b4e6-2b11-d2ec-1878fee601b8@xen.org>
Date: Wed, 17 Mar 2021 11:20:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4066B6A3-2904-4800-B63A-7EAD1EFC7D16@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 16/03/2021 17:16, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 16 Mar 2021, at 15:27, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 15/03/2021 13:32, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Hi all,
>>>>
>>>> Last year, Arm released a whitepaper about a new category of speculation.
>>>> (see [1] and [2]). In short, a processor may be able to speculate past
>>>> some of the unconditional control flow instructions (e.g eret, smc, br).
>>>>
>>>> In some of the cases, the registers will contain values controlled by
>>>> the guest. While there is no known gadget afterwards, we still want to
>>>> prevent any leakage in the future.
>>>>
>>>> The mitigation is planned in two parts:
>>>>    1) Arm provided patches for both GCC and LLVM to add speculation barrier
>>>>    and remove problematic code sequence.
>>>>    2) Inspection of assembly code and call to higher level (e.g smc in our case).
>>>>
>>>> I still haven't looked at 1) and how to mitigate properly Arm32 (see
>>>> patch #1) and SMC call. So this issue is not fully addressed.
>>>>
>>>> Note that the ERET instruction was already addressed as part of XSA-312.
>>> On my tests, this serie is breaking the arm64 build:
>>> | aarch64-poky-linux-ld --sysroot=/home/bermar01/Development/xen-dev/build/profile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/recipe-sysroot         -EL  --fix-cortex-a53-843419 --fix-cortex-a53-843419 -r -o built_in.o memcpy.o memcmp.o memmove.o memset.o memchr.o clear_page.o bitops.o find_next_bit.o strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
>>
>> I can't see any build failure with the following GCC:
>>
>> 42sh> aarch64-linux-gnu-gcc
>> aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>> Copyright (C) 2017 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>
>> AFAICT, there is also no compilation issue reported by gitlab:
>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/269989894
>>
>> What's the version of your compiler? Do you have steps to reproduce your setup?
> 
> You need to have earlyprintk enabled
> I am using gcc 7.5.0:
> aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
> 
> one configuration triggering the issue is using the default .config with the following items added:
> CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> CONFIG_DEBUG_LOCK_PROFILE=y
> CONFIG_PERF_COUNTERS=y
> CONFIG_PERF_ARRAYS=y
> CONFIG_DEVICE_TREE_DEBUG=y
> CONFIG_DEBUG_TRACE=y
> CONFIG_EARLY_PRINTK_JUNO=y
> CONFIG_EARLY_UART_PL011=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_EARLY_UART_BASE_ADDRESS=0x7ff80000
> CONFIG_EARLY_UART_PL011_BAUD_RATE=115200
> CONFIG_EARLY_UART_INIT=y
> CONFIG_EARLY_PRINTK_INC="debug-pl011.inc”

Thanks for providing the .config. I managed to reproduce it. So I 
removed "asm_defns.h" everywhere but forgot to include it in the 
"config.h" :/.

This small change fixed the error:

diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
index 51273b9db1fc..c7b77912013e 100644
--- a/xen/include/asm-arm/config.h
+++ b/xen/include/asm-arm/config.h
@@ -192,7 +192,7 @@ extern unsigned long frametable_virt_end;
  #define watchdog_enable()  ((void)0)

  #if defined(__ASSEMBLY__) && !defined(__LINKER__)
-#include <asm/asm-offsets.h>
+#include <asm/asm_defns.h>
  #include <asm/macros.h>
  #endif

Would you still be happy to review the series before I send a v3?

Cheers,

-- 
Julien Grall

