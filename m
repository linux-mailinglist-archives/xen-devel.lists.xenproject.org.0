Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC887757C4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580854.909300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgkx-0001Yb-AG; Wed, 09 Aug 2023 10:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580854.909300; Wed, 09 Aug 2023 10:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgkx-0001Wa-7j; Wed, 09 Aug 2023 10:49:35 +0000
Received: by outflank-mailman (input) for mailman id 580854;
 Wed, 09 Aug 2023 10:49:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgkw-0001WU-4p
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:49:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgku-0005jW-3X; Wed, 09 Aug 2023 10:49:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgkt-0001uy-Nv; Wed, 09 Aug 2023 10:49:31 +0000
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
	bh=T/l5dC5R+z0cxfPQVXXu9+fyUqoj8QwUNxzt6UeKQLY=; b=0E+VQmLqKceQBcVvCXHHysESZn
	5B7+z8gK4bL7suJGmyLlSzc3K7hVMeXOe6PooEJKbzos998bPw9p/Z6sxK45j/NNwiDG1hGPMcxxC
	EPCmOGr/5AMGM0Scy3BsxgculZ6N8lM5/n6nc9lKuK7SEeQTPORJMBGxcT+HGyNR/mKA=;
Message-ID: <115e080e-ecba-4117-9d43-9888f82c8d5f@xen.org>
Date: Wed, 9 Aug 2023 11:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/08/2023 07:08, Jan Beulich wrote:
> Have these in one place, for all architectures to use. Also use the C99
> types as the "original" ones, and derive the Linux compatible ones
> (which we're trying to phase out). For __s<N>, seeing that no uses exist
> anymore, move them to a new Linux compatibility header (as an act of
> precaution - as said, we don't have any uses of these types right now).
> 
> In some Flask sources inclusion of asm/byteorder.h needs moving later.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With one remark:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v2: This is the residual (extended to PPC) of an earlier larger patch
>      which was partly replaced by introducing xen/stdint.h.
> 
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -1,18 +1,7 @@
>   #ifndef __ARM_TYPES_H__
>   #define __ARM_TYPES_H__
>   
> -typedef signed char s8;
> -typedef unsigned char u8;
> -
> -typedef signed short s16;
> -typedef unsigned short u16;
> -
> -typedef signed int s32;
> -typedef unsigned int u32;
> -
>   #if defined(CONFIG_ARM_32)
> -typedef signed long long s64;
> -typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
>   #if defined(CONFIG_PHYS_ADDR_T_32)
> @@ -34,9 +23,9 @@ typedef u64 paddr_t;
>   #endif

I find odd that you don't add a newline before/after #endif here but...

>   typedef u32 register_t;
>   #define PRIregister "08x"
> -#elif defined (CONFIG_ARM_64)
> -typedef signed long s64;
> -typedef unsigned long u64;
> +
> +#elif defined(CONFIG_ARM_64)
> +
>   typedef u64 vaddr_t;
>   #define PRIvaddr PRIx64
>   typedef u64 paddr_t;
> @@ -44,6 +33,7 @@ typedef u64 paddr_t;
>   #define PRIpaddr "016lx"
>   typedef u64 register_t;
>   #define PRIregister "016lx"
> +

.. you add one here. But this change looks a bit unrelated and IMHO of 
out context.

>   #endif
>   
>   #endif /* __ARM_TYPES_H__ */
> --- a/xen/arch/ppc/include/asm/types.h

Cheers,

-- 
Julien Grall

