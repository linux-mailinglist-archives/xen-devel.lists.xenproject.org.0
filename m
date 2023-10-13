Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209267C8C90
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616799.959074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMGP-0005JC-OH; Fri, 13 Oct 2023 17:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616799.959074; Fri, 13 Oct 2023 17:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMGP-0005Gp-Lh; Fri, 13 Oct 2023 17:47:53 +0000
Received: by outflank-mailman (input) for mailman id 616799;
 Fri, 13 Oct 2023 17:47:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrMGN-0005Gg-U9
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:47:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMGN-0008MK-Lf; Fri, 13 Oct 2023 17:47:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMGN-0007bH-Gr; Fri, 13 Oct 2023 17:47:51 +0000
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
	bh=BWRQnrs3plLSMXgeS/xo5qjLrlvQRf6zosSAVohdrIc=; b=PQdhltxJdUVKQY9KC3Z8GGLC+V
	eD6VVxt9LYVFY/mfn6hp2BKHwflC2PPC6XWykMK2Uw7+eMqvL2Gq/WjEmr1UCVGlJTlj6uCgx+9az
	E66JO8O4q7njZQvHuS5WP5qeJ3BBYBT6RzqUPj58wHk2AZQDJla0QB03Hja9e8KNjvUU=;
Message-ID: <92c939fb-a8a5-4bbb-8d80-844a70f9b3e5@xen.org>
Date: Fri, 13 Oct 2023 18:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/arm: Rename init_secondary_pagetables() to
 prepare_secondary_mm()
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-8-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-8-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> init_secondary_pagetables() is a function in the common code path
> of both MMU and future MPU support. Since "page table" is a MMU
> specific concept, rename init_secondary_pagetables() to a generic
> name prepare_secondary_mm() as the preparation for MPU support.
> 
> Take the opportunity to fix the incorrect coding style of the in-code
> comments.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v7:
> - No change.
> v6:
> - Only rename init_secondary_pagetables() to prepare_secondary_mm().
> ---
>   xen/arch/arm/arm32/head.S     | 2 +-
>   xen/arch/arm/include/asm/mm.h | 8 +++++---
>   xen/arch/arm/mmu/smpboot.c    | 4 ++--
>   xen/arch/arm/smpboot.c        | 2 +-
>   4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 39218cf15f..c7b2efb8f0 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -257,7 +257,7 @@ GLOBAL(init_secondary)
>   secondary_switched:
>           /*
>            * Non-boot CPUs need to move on to the proper pagetables, which were
> -         * setup in init_secondary_pagetables.
> +         * setup in prepare_secondary_mm.
>            *
>            * XXX: This is not compliant with the Arm Arm.
>            */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index d23ebc7df6..db6d889826 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -204,9 +204,11 @@ extern void setup_pagetables(unsigned long boot_phys_offset);
>   extern void *early_fdt_map(paddr_t fdt_paddr);
>   /* Remove early mappings */
>   extern void remove_early_mappings(void);
> -/* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
> - * new page table */
> -extern int init_secondary_pagetables(int cpu);
> +/*
> + * Allocate and initialise pagetables for a secondary CPU.
> + * Sets init_ttbr to the new page table.
> + */

AFAIU, with the renaming, you are trying to make the call MMU/MPU 
agnostic. But the comment is still very tailored to the MPU. I would 
consider to move the comment to mmu/smpboot.c and replace this one with 
a generic comment. Something like:

/* Prepare the memory subystem to bring-up the given secondary CPU. */

Cheers,

-- 
Julien Grall

