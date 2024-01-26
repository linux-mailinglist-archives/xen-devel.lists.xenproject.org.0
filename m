Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94D83DAA2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 14:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671996.1045563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTM7y-0000qH-Ul; Fri, 26 Jan 2024 13:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671996.1045563; Fri, 26 Jan 2024 13:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTM7y-0000n4-RS; Fri, 26 Jan 2024 13:20:14 +0000
Received: by outflank-mailman (input) for mailman id 671996;
 Fri, 26 Jan 2024 13:20:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTM7y-0000my-1N
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 13:20:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTM7w-0003uo-H7; Fri, 26 Jan 2024 13:20:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTM7w-0002mS-As; Fri, 26 Jan 2024 13:20:12 +0000
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
	bh=k6Zp/TbJ6YZu+V+7zyVKiSnVBNNyPLoQTNRy01tSTGI=; b=d0fvQLCHciLe4JSkYdacuipKx+
	380ArrhLtWimKJ98f7MMd/7XhuC5/R9wVGckVc97gZoE3YiKTfC/k2O9C5n23UmSGNjjL9Z00+CLW
	qpsptggTXRx/FeTJR9qujRTtTi1VNFcH/4mKIRmgQiLcaMCla4kl7b6TxzAon8rrsQWc=;
Message-ID: <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
Date: Fri, 26 Jan 2024 13:20:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/lib: introduce generic find next bit operations
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/01/2024 12:20, Oleksii Kurochko wrote:
> find-next-bit.c is common for Arm64, PPC and RISCV64,
> so it is moved to xen/lib.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   docs/misra/exclude-list.json                  |   4 -
>   xen/arch/arm/arm64/lib/Makefile               |   2 +-
>   xen/arch/arm/include/asm/arm64/bitops.h       |  48 --------
>   xen/arch/ppc/include/asm/bitops.h             | 115 ------------------
>   xen/include/xen/bitops.h                      |  48 ++++++++
>   xen/lib/Makefile                              |   1 +
>   .../find_next_bit.c => lib/find-next-bit.c}   |   0
>   7 files changed, 50 insertions(+), 168 deletions(-)
>   rename xen/{arch/arm/arm64/lib/find_next_bit.c => lib/find-next-bit.c} (100%)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 7971d0e70f..7fe02b059d 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -13,10 +13,6 @@
>               "rel_path": "arch/arm/arm64/insn.c",
>               "comment": "Imported on Linux, ignore for now"
>           },
> -        {
> -            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",

Rather than removing the section, I was expecting the rel_path to be 
updated. Can you explain why you think the exclusion is not necessary?

> -            "comment": "Imported from Linux, ignore for now"
> -        },
>           {
>               "rel_path": "arch/x86/acpi/boot.c",
>               "comment": "Imported from Linux, ignore for now"
> diff --git a/xen/arch/arm/arm64/lib/Makefile b/xen/arch/arm/arm64/lib/Makefile
> index 1b9c7a95e6..66cfac435a 100644
> --- a/xen/arch/arm/arm64/lib/Makefile
> +++ b/xen/arch/arm/arm64/lib/Makefile
> @@ -1,4 +1,4 @@
>   obj-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
>   obj-y += clear_page.o
> -obj-y += bitops.o find_next_bit.o
> +obj-y += bitops.o
>   obj-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
> diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
> index d85a49bca4..f9dd066237 100644
> --- a/xen/arch/arm/include/asm/arm64/bitops.h
> +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> @@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
>   
>   /* Based on linux/include/asm-generic/bitops/find.h */
>   
> -#ifndef find_next_bit
> -/**
> - * find_next_bit - find the next set bit in a memory region
> - * @addr: The address to base the search on
> - * @offset: The bitnumber to start searching at
> - * @size: The bitmap size in bits
> - */
> -extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
> -		size, unsigned long offset);
> -#endif
> -
> -#ifndef find_next_zero_bit
> -/**
> - * find_next_zero_bit - find the next cleared bit in a memory region
> - * @addr: The address to base the search on
> - * @offset: The bitnumber to start searching at
> - * @size: The bitmap size in bits
> - */
> -extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
> -		long size, unsigned long offset);
> -#endif
> -
> -#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
> -
> -/**
> - * find_first_bit - find the first set bit in a memory region
> - * @addr: The address to start the search at
> - * @size: The maximum size to search
> - *
> - * Returns the bit number of the first set bit.
> - */
> -extern unsigned long find_first_bit(const unsigned long *addr,
> -				    unsigned long size);
> -
> -/**
> - * find_first_zero_bit - find the first cleared bit in a memory region
> - * @addr: The address to start the search at
> - * @size: The maximum size to search
> - *
> - * Returns the bit number of the first cleared bit.
> - */
> -extern unsigned long find_first_zero_bit(const unsigned long *addr,
> -					 unsigned long size);
> -#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
> -
>   #define find_first_bit(addr, size) find_next_bit((addr), (size), 0)
>   #define find_first_zero_bit(addr, size) find_next_zero_bit((addr), (size), 0)
>   
> -#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */

AFAICT, you are changing the behavior for Arm64 without explaining why. 
Before, it was possible to set CONFIG_GENERIC_FIND_FIRST_BIT so the 
generic version of find_first_*_bit are used. This is not possible 
anymore with your change.

Looking at Linux, I see that arm64 is now selecting 
GENERIC_FIND_FIRST_BIT (see [1]). So I would argue, we should not define 
find_first_bit(). That said, that's probably a separate patch.

For now, you want to explain why GENERIC_FIND_FIRST_BIT is dropped.

Cheers,

[1] 
https://lore.kernel.org/linux-arch/20210225135700.1381396-1-yury.norov@gmail.com/

-- 
Julien Grall

