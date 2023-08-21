Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51054783013
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 20:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587793.919194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY9Q8-0008Al-IV; Mon, 21 Aug 2023 18:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587793.919194; Mon, 21 Aug 2023 18:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY9Q8-00087W-Fd; Mon, 21 Aug 2023 18:14:32 +0000
Received: by outflank-mailman (input) for mailman id 587793;
 Mon, 21 Aug 2023 18:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY9Q7-00087Q-Gg
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 18:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY9Q6-0005xp-SL; Mon, 21 Aug 2023 18:14:30 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY9Q6-0007KU-M1; Mon, 21 Aug 2023 18:14:30 +0000
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
	bh=rjKtQRIQAM16CH/B8PTQkY0XqJSorE4nwCAzi3ur+Sg=; b=Mn5MVpuHwb6+3DfQPNQURu+TNT
	/Ee6BLyKmq88FvCtan8tzz8AZkzIKrIdl6pyl41GLRqFHkBEoS172Ks8XKEtmEra4eh7BadYtHdwA
	ABvgvsoa9IuEE7x81c1z0TTXVs3TXaKoaYPa3zEmlpn6OQtS30oboTE4ByutAHIZOvFs=;
Message-ID: <7503cbad-a0b9-4683-880f-1099ad62f2f7@xen.org>
Date: Mon, 21 Aug 2023 19:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-9-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> fixmap and pmap are MMU-specific features, so fold them to MMU system.
> Do the folding for pmap by moving the HAS_PMAP Kconfig selection under
> HAS_MMU. Do the folding for fixmap by moving the implementation of
> virt_to_fix() to mmu/mm.c, so that unnecessary stubs can be avoided.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v5:
> - Rebase on top of xen/arm: Introduce CONFIG_MMU Kconfig option
> v4:
> - Rework "[v3,11/52] xen/arm: mmu: fold FIXMAP into MMU system",
>    change the order of this patch and avoid introducing stubs.
> ---
>   xen/arch/arm/Kconfig              | 2 +-
>   xen/arch/arm/include/asm/fixmap.h | 7 +------
>   xen/arch/arm/mmu/mm.c             | 7 +++++++
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index eb0413336b..8a7b79b4b5 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -15,7 +15,6 @@ config ARM
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
>   	select HAS_PDX
> -	select HAS_PMAP
>   	select HAS_UBSAN
>   	select IOMMU_FORCE_PT_SHARE
>   
> @@ -61,6 +60,7 @@ config PADDR_BITS
>   
>   config MMU
>   	def_bool y
> +	select HAS_PMAP
>   
>   source "arch/Kconfig"
>   
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> index 734eb9b1d4..5d5de6995a 100644
> --- a/xen/arch/arm/include/asm/fixmap.h
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -36,12 +36,7 @@ extern void clear_fixmap(unsigned int map);
>   
>   #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
>   
> -static inline unsigned int virt_to_fix(vaddr_t vaddr)
> -{
> -    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
> -
> -    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
> -}
> +extern unsigned int virt_to_fix(vaddr_t vaddr);

AFAICT, virt_to_fix() is not going to be implemented for the MPU code. 
This implies that no-one should call it.

Also, none of the definitions in fixmap.h actually makes sense for the 
MPU. I would prefer if we instead try to lmit the include of fixmap to 
when this is strictly necessary. Looking for the inclusion in staging I 
could find:

42sh> ack "\#include" | ack "fixmap" | ack -v x86
arch/arm/acpi/lib.c:28:#include <asm/fixmap.h>
arch/arm/kernel.c:19:#include <asm/fixmap.h>
arch/arm/mm.c:27:#include <asm/fixmap.h>
arch/arm/include/asm/fixmap.h:7:#include <xen/acpi.h>
arch/arm/include/asm/fixmap.h:8:#include <xen/pmap.h>
arch/arm/include/asm/pmap.h:6:#include <asm/fixmap.h>
arch/arm/include/asm/early_printk.h:14:#include <asm/fixmap.h>
common/efi/boot.c:30:#include <asm/fixmap.h>
common/pmap.c:7:#include <asm/fixmap.h>
drivers/acpi/apei/erst.c:36:#include <asm/fixmap.h>
drivers/acpi/apei/apei-io.c:32:#include <asm/fixmap.h>
drivers/char/xhci-dbc.c:30:#include <asm/fixmap.h>
drivers/char/ehci-dbgp.c:16:#include <asm/fixmap.h>
drivers/char/ns16550.c:40:#include <asm/fixmap.h>
drivers/char/xen_pv_console.c:28:#include <asm/fixmap.h>

Some of them are gone after your rework. The only remaining that we care 
are in kernel.h (but I think it can be removed after your series).

So I think it would be feasible to not touch fixmap.h at all.

Cheers,

-- 
Julien Grall

