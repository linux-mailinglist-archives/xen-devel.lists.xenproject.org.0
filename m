Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1352134D
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325456.548032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNkq-0003lh-5j; Tue, 10 May 2022 11:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325456.548032; Tue, 10 May 2022 11:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNkq-0003j3-2H; Tue, 10 May 2022 11:10:12 +0000
Received: by outflank-mailman (input) for mailman id 325456;
 Tue, 10 May 2022 11:10:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noNko-0003iZ-P7
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:10:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNko-0003rC-8M; Tue, 10 May 2022 11:10:10 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNko-0004Ly-2Q; Tue, 10 May 2022 11:10:10 +0000
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
	bh=9Y5Dc8DTxN41reqtY0sDfzdciWQDrbpS3yCS4DjJcjI=; b=pQ4bDq3vJ+uC1NIyTsNtQXckyU
	5i93EhUpMXM94r1L0KgbysIqw8gKeNIOaLuUripbdQUyhplt6r6YZ48y41/oiCzSoGrM3Cbcl4d82
	cxu9R/PvqDDpkPJm3Dz2Q+EZfWdHIooCm+OySygtR5VqKc9HMSGClgJkLsjpANVXUtNM=;
Message-ID: <11269227-ba07-b2b1-c2ef-ea6309980f67@xen.org>
Date: Tue, 10 May 2022 12:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/6] xen: implement byteswap
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/05/2022 11:15, Lin Liu wrote:
> swab() is massively over complicated and can be simplified by builtins.

NIT: "by builtins" -> "by re-implementing using compiler builtins".

> The compilers provide builtin function to swap bytes.
> * gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
> * clang: https://clang.llvm.org/docs/LanguageExtensions.html
> This patch simplify swab() with builtins and fallback for old compilers.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Changes in v3:
> - Check __has_builtin instead of GNUC version
> 
> Changes in v2:
> - Add fallback for compilers without __builtin_bswap
> - Implement with plain C instead of macros
> ---
>   xen/arch/arm/include/asm/byteorder.h | 14 ++-----
>   xen/arch/x86/include/asm/byteorder.h | 34 ++---------------
>   xen/include/xen/byteorder.h          | 56 ++++++++++++++++++++++++++++
>   xen/include/xen/byteswap.h           | 44 ++++++++++++++++++++++
>   xen/include/xen/compiler.h           | 12 ++++++
>   5 files changed, 120 insertions(+), 40 deletions(-)
>   create mode 100644 xen/include/xen/byteorder.h
>   create mode 100644 xen/include/xen/byteswap.h
> 
> diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
> index 9c712c4788..622eeaba07 100644
> --- a/xen/arch/arm/include/asm/byteorder.h
> +++ b/xen/arch/arm/include/asm/byteorder.h
> @@ -1,16 +1,10 @@
>   #ifndef __ASM_ARM_BYTEORDER_H__
>   #define __ASM_ARM_BYTEORDER_H__
>   
> -#define __BYTEORDER_HAS_U64__
> +#ifndef __BYTE_ORDER__
> +   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> +#endif
>   
> -#include <xen/byteorder/little_endian.h>
> +#include <xen/byteorder.h>
>   
>   #endif /* __ASM_ARM_BYTEORDER_H__ */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */

This change looks unrelated to this patch. Can you explain it?

Cheers,

-- 
Julien Grall

