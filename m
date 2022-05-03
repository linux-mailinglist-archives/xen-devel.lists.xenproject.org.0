Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE1C518C90
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 20:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319889.540336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlxYX-0004QT-9j; Tue, 03 May 2022 18:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319889.540336; Tue, 03 May 2022 18:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlxYX-0004OI-6e; Tue, 03 May 2022 18:47:29 +0000
Received: by outflank-mailman (input) for mailman id 319889;
 Tue, 03 May 2022 18:47:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nlxYV-0004OC-FT
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 18:47:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlxYV-0001K8-4Z; Tue, 03 May 2022 18:47:27 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlxYU-0001NP-Ul; Tue, 03 May 2022 18:47:27 +0000
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
	bh=b958ry/pJGqJfD/0IZgqnpcAa3lnCp8QNLjQ6xV5+II=; b=g5DBZ0gwFeE3IbH8H1yFfcQaM5
	k/QL0C+i8eMtYYsi4ivXWlPuveOdI7Pu7XqCnlbIezvDlyjetJ6+vS6SDwFoAz0Z7Q/Pyrl9y9FkO
	hGJHQUbpfCWFmPm6PiJR2qzq5dsj/c5GRLPUTvOjo+wYh6Dv+rorAS+c6GOSEzKfSNH4=;
Message-ID: <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
Date: Tue, 3 May 2022 19:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/05/2022 10:38, Bertrand Marquis wrote:
> This patch is adding sb instruction support when it is supported by a
> CPU on arm64.
> To achieve this, the "sb" macro is moved to sub-arch macros.h so that we
> can use sb instruction when available through alternative on arm64 and
> keep the current behaviour on arm32.

SB is also supported on Arm32. So I would prefer to introduce the 
encoding right now and avoid duplicating the .macro sb.

> A new cpuerrata capability is introduced to enable the alternative

'sb' is definitely not an erratum. Errata are for stuff that are meant 
to be specific to one (or multiple) CPU and they are not part of the 
architecture.

This is the first time we introduce a feature in Xen. So we need to add 
a new array in cpufeature.c that will cover 'SB' for now. In future we 
could add feature like pointer auth, LSE atomics...

> code for sb when the support is detected using isa64 coprocessor

s/coprocessor/system/

> register.
> The sb instruction is encoded using its hexadecimal value.

This is necessary to avoid recursive macro, right?

> diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
> index 140e223b4c..e639cec400 100644
> --- a/xen/arch/arm/include/asm/arm64/macros.h
> +++ b/xen/arch/arm/include/asm/arm64/macros.h
> @@ -1,6 +1,24 @@
>   #ifndef __ASM_ARM_ARM64_MACROS_H
>   #define __ASM_ARM_ARM64_MACROS_H
>   
> +#include <asm/alternative.h>
> +
> +    /*
> +     * Speculative barrier
> +     */
> +    .macro sb
> +alternative_if_not ARM64_HAS_SB
> +    dsb nsh
> +    isb
> +alternative_else
> +/*
> + * SB encoding as given in chapter C6.2.264 of ARM ARM (DDI 0487H.a).
> + */

NIT: Please align the comment with ".inst" below. I also don't think it 
is necessary to mention the spec here. The instruction encoding is not 
going to change.

> +    .inst 0xd50330ff
> +    nop

Why do we need the NOP?

> +alternative_endif
> +    .endm
> +
>       /*
>        * @dst: Result of get_cpu_info()
>        */
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 4719de47f3..9370805900 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -67,8 +67,9 @@
>   #define ARM_WORKAROUND_BHB_LOOP_24 13
>   #define ARM_WORKAROUND_BHB_LOOP_32 14
>   #define ARM_WORKAROUND_BHB_SMCC_3 15
> +#define ARM64_HAS_SB 16
>   
> -#define ARM_NCAPS           16
> +#define ARM_NCAPS           17
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
> index 1aa373760f..91ea3505e4 100644
> --- a/xen/arch/arm/include/asm/macros.h
> +++ b/xen/arch/arm/include/asm/macros.h
> @@ -5,15 +5,6 @@
>   # error "This file should only be included in assembly file"
>   #endif
>   
> -    /*
> -     * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
> -     */
> -    .macro sb
> -    dsb nsh
> -    isb
> -    .endm
> -
>   #if defined (CONFIG_ARM_32)
>   # include <asm/arm32/macros.h>
>   #elif defined(CONFIG_ARM_64)

Cheers,

-- 
Julien Grall

