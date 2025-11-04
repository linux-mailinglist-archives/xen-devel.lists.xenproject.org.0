Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E6C308FC
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155632.1485082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEW9-0006qP-Cm; Tue, 04 Nov 2025 10:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155632.1485082; Tue, 04 Nov 2025 10:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEW9-0006o2-8F; Tue, 04 Nov 2025 10:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1155632;
 Tue, 04 Nov 2025 10:44:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGEW8-0006nv-HJ
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:44:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEW7-000m6j-1t;
 Tue, 04 Nov 2025 10:43:59 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEW7-00B3xT-26;
 Tue, 04 Nov 2025 10:43:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=uB+noEWh6KER25ZRVImPaPFIjegXd7HNUf93SyjDFiI=; b=N0O15MI0iSb8q5wW9VZXWmp8OV
	y+KXiI5VLdRprb4YMxOXBRM/uWvsrcFbHdgkUouoQzj0oFrg90AgvUimleQCapBjp41r6ieX3Wzhg
	uO24lspP1DemMQxg/yZAWWPFpybZo16V7NGj/PVi6FVB4nyiYVe/edhEzJeCv+gNQFJI=;
Message-ID: <88bff8bf-195b-432d-97af-317398796d40@xen.org>
Date: Tue, 4 Nov 2025 10:43:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support of building Xen with Clang/LLVM on Arm?
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wentao Zhang <wentaoz5@illinois.edu>
References: <20251023233408.16245-1-samaan.dehghan@gmail.com>
 <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/10/2025 00:45, Andrew Cooper wrote:
> On 24/10/2025 12:34 am, Saman Dehghan wrote:
>> Hi xen-devel,
>>
>> When preparing and testing another of my patch for LLVM coverage [1], I
>> encountered a few problems with Clang/LLVM build on ARM 64 platforms.
>>
>> The first two are clang errors.
>>
>> I observe the following errors when building the Xen master branch
>> for ARM 64 with Clang 19 and 20. If I comment out
>> "CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only" in "xen/arch/arm/arch.mk"
>> the error is gone but the build fails during linking (see the third).
>>
>> Error message:
>>
>> arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8
>>      9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
>>        |                  ^
>> <inline asm>:1:2: note: instantiated into assembly here
>>      1 |         stp q0, q1, [x8, #16 * 0]
>>        |         ^
>> arch/arm/arm64/vfp.c:9:46: error: instruction requires: fp-armv8
>>      9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
>>        |                                              ^
>> <inline asm>:2:2: note: instantiated into assembly here
>>      2 |         stp q2, q3, [x8, #16 * 2]
>>        |         ^
>> arch/arm/arm64/vfp.c:10:46: error: instruction requires: fp-armv8
>>     10 |                  "stp q2, q3, [%1, #16 * 2]\n\t"
>>        |                                              ^
>> <inline asm>:3:2: note: instantiated into assembly here
>>      3 |         stp q4, q5, [x8, #16 * 4]
>>        |         ^
>> arch/arm/arm64/vfp.c:11:46: error: instruction requires: fp-armv8
>>     11 |                  "stp q4, q5, [%1, #16 * 4]\n\t"
>>        |                                              ^
>> <inline asm>:4:2: note: instantiated into assembly here
>>      4 |         stp q6, q7, [x8, #16 * 6]
>>        |         ^
>> arch/arm/arm64/vfp.c:12:46: error: instruction requires: fp-armv8
>>     12 |                  "stp q6, q7, [%1, #16 * 6]\n\t"
>>        |                                              ^
>> <inline asm>:5:2: note: instantiated into assembly here
>>      5 |         stp q8, q9, [x8, #16 * 8]
>>        |         ^
>> arch/arm/arm64/vfp.c:13:46: error: instruction requires: fp-armv8
>>     13 |                  "stp q8, q9, [%1, #16 * 8]\n\t"
>>        |                                              ^
>> <inline asm>:6:2: note: instantiated into assembly here
>>      6 |         stp q10, q11, [x8, #16 * 10]
>>        |         ^
>>
>> Reprroduction steps:
>>
>> $ git clone https://xenbits.xen.org/git-http/xen
>> $ cd xen
>> $ git checkout eff32008be0d2718d32d60245650ff6f88fb3d13
>> $ make -C xen menuconfig clang=y
>> $ make xen clang=y
>>
>> Tested with the following setup:
>>
>> - Clang version: Ubuntu clang version 19.1.1 (1ubuntu1~24.04.2)
>> - Host: Ubuntu 24.04.3 LTS /  aarch64
>>
>> Second, for Clang 18 or below there are another set of errors despite
>> commenting out the "-mgeneral-regs-only" flag:
>>
>> arch/arm/arm64/mmu/head.S:288:13: error: expected writable system register or pstate
>>          msr TTBR0_EL2, x4
>>              ^
>> arch/arm/arm64/mmu/head.S:509:13: error: expected writable system register or pstate
>>          msr TTBR0_EL2, x0
>>              ^
>>
>> Tested with:
>>
>> - Clang version: Ubuntu clang version 18.1.3 (1ubuntu1)
>> - Host: Ubuntu 24.04.3 LTS /  aarch64
>>
>> This works with GCC. It also works with Clang on x86 builds.
>>
>> Third, if I specify "LD=ld.lld" with Clang 19 and 20 after commenting out
>> the "-mgeneral-regs-only" flag. I got this linking error:
>>
>> ld.lld: error: common/device-tree/static-evtchn.init.o:(.rodata.str): offset is outside the section
>>
>> As I read from the project README, under "C compiler and linker - For ARM",
>> only GCC is listed. So my general question is whether Xen supports building
>> with Clang/LLVM on ARM platforms.
>>
>> Let me know if you need more details or a patch attempt.
> 
> Clang/LLVM is only supported for x86.
> 
> Personally I think the other architectures would benefit from using both
> compilers, but it's up to the relevant maintainers.

Happy to review any patches for clang support on Arm.

Cheers,

-- 
Julien Grall


