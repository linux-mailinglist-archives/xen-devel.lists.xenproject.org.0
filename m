Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E039D04EA
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2024 18:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839009.1254818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjXy-0003jA-UR; Sun, 17 Nov 2024 17:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839009.1254818; Sun, 17 Nov 2024 17:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjXy-0003gZ-R6; Sun, 17 Nov 2024 17:58:54 +0000
Received: by outflank-mailman (input) for mailman id 839009;
 Sun, 17 Nov 2024 17:58:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCjXx-0003gT-Do
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2024 17:58:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjXw-009jan-2P;
 Sun, 17 Nov 2024 17:58:53 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjXw-009W17-2d;
 Sun, 17 Nov 2024 17:58:52 +0000
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
	bh=67CWo/04q2gG6uH6TyCF22ZcFRXjMp9g+n0IXYzy/+c=; b=OMNwbV+oGoT3HMj+glQ898HMJP
	wCLDbvhMc7iUKhiH5KHoBlkHp2JExx24Orqr5VcKm4W31tiiVwzLNBiBW+nXjsXrtzfuL+trTed6C
	ai1Z5scm1L/BvJJNsD0dwcI6N1tUBmyYHATkk6L6lCWukSnEkf24snNGLCS3H5ga25cs=;
Message-ID: <6fd84b4e-be73-4d02-8214-32c7ebb09b3d@xen.org>
Date: Sun, 17 Nov 2024 17:58:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/arm: only map the init text section RW in
 free_init_memory
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241115105036.218418-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 15/11/2024 10:50, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In free_init_memory, we do not need to map the whole init section RW,
> as only init text section is mapped RO in boot time.

So originally, this was done because the function was generic. But now 
this is MMU specific, we don't really gain that much during boot but 
will impair any work that would restrict some init further (for instance 
.init.rodata could be RO). So is it actually worth it?

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Given the link below, why are Penny and Wei's signed-off-by are missing?

> ---
> This is this one: https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-19-Penny.Zheng@arm.com/
> ---
>   xen/arch/arm/mmu/setup.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 9664e85ee6c0..1b1d302c8788 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -7,6 +7,7 @@
>   
>   #include <xen/init.h>
>   #include <xen/libfdt/libfdt.h>
> +#include <xen/pfn.h>
>   #include <xen/sections.h>
>   #include <xen/sizes.h>
>   #include <xen/vmap.h>
> @@ -309,16 +310,17 @@ void *__init arch_vmap_virt_end(void)
>   void free_init_memory(void)
>   {
>       paddr_t pa = virt_to_maddr(__init_begin);
> +    unsigned long inittext_end = round_pgup((unsigned long)_einittext);
>       unsigned long len = __init_end - __init_begin;
>       uint32_t insn;
>       unsigned int i, nr = len / sizeof(insn);
>       uint32_t *p;
>       int rc;
>   
> -    rc = modify_xen_mappings((unsigned long)__init_begin,
> -                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
> +    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
> +                             PAGE_HYPERVISOR_RW);
>       if ( rc )
> -        panic("Unable to map RW the init section (rc = %d)\n", rc);
> +        panic("Unable to map RW the init text section (rc = %d)\n", rc);
>   
>       /*
>        * From now on, init will not be used for execution anymore,

Cheers,

-- 
Julien Grall

