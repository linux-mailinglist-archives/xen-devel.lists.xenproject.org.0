Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C44ED7D6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 12:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296877.505508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZs8o-0005i0-WD; Thu, 31 Mar 2022 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296877.505508; Thu, 31 Mar 2022 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZs8o-0005fE-Rs; Thu, 31 Mar 2022 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 296877;
 Thu, 31 Mar 2022 10:34:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZs8m-0005f6-W1
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 10:34:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZs8m-0003J3-1G; Thu, 31 Mar 2022 10:34:56 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.7.236.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZs8l-0005pa-QD; Thu, 31 Mar 2022 10:34:55 +0000
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
	bh=At4KFQTq80hBpXxj+/tmnjXriuHD/1WNosfxyjpkoNs=; b=RC+7wU9bKlstm4sBDwDHF0INeY
	s+sEdBeyXnveauoFCw67aQU2Ss+ip4g1M8soEb+HWVAIAL5ru5f7s7wfjpdN/muYmQ0RxE9+btPbh
	FVYZemL8SKa7iF/cG5bGuRp57KfCUBC1QJciSOl9ra4EcSFIXgBdjp/m829+jCJaDudw=;
Message-ID: <5a5db691-4add-17fa-3cc6-1eda8d24753e@xen.org>
Date: Thu, 31 Mar 2022 11:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/4] include: move STR() and IS_ALIGNED()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <9a0cf101-17fa-cad2-e791-15d8d8cc5b79@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a0cf101-17fa-cad2-e791-15d8d8cc5b79@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 31/03/2022 10:31, Jan Beulich wrote:
> lib.h is imo a better fit for them than config.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v4: New.
> ---
> Originally I thought I'd also move KB() etc, but they're used in places
> where yet further adjustments (adding of #include) would be necessary.
> 
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -3,6 +3,7 @@
>   /* Modified for ARM Xen by Ian Campbell */
>   
>   #include <xen/cache.h>
> +#include <xen/lib.h>
>   #include <asm/page.h>
>   #undef ENTRY
>   #undef ALIGN
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -2,6 +2,7 @@
>   /* Modified for i386/x86-64 Xen by Keir Fraser */
>   
>   #include <xen/cache.h>
> +#include <xen/lib.h>
>   #include <asm/page.h>
>   #undef ENTRY
>   #undef ALIGN
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -82,11 +82,6 @@
>   #define MB(_mb)     (_AC(_mb, ULL) << 20)
>   #define GB(_gb)     (_AC(_gb, ULL) << 30)
>   
> -#define IS_ALIGNED(val, align) (((val) & ((align) - 1)) == 0)
> -
> -#define __STR(...) #__VA_ARGS__
> -#define STR(...) __STR(__VA_ARGS__)
> -
>   /* allow existing code to work with Kconfig variable */
>   #define NR_CPUS CONFIG_NR_CPUS
>   
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -3,6 +3,8 @@
>   
>   #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
>   
> +#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> +
>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>   
> @@ -17,6 +19,9 @@
>   #define PASTE_(a, b) a ## b
>   #define PASTE(a, b) PASTE_(a, b)
>   
> +#define __STR(...) #__VA_ARGS__
> +#define STR(...) __STR(__VA_ARGS__)
> +
>   #ifndef __ASSEMBLY__
>   
>   #include <xen/inttypes.h>
> 

-- 
Julien Grall

