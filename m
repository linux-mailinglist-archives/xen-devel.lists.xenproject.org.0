Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5755B859
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356296.584435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jXC-0002AZ-7h; Mon, 27 Jun 2022 07:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356296.584435; Mon, 27 Jun 2022 07:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jXC-00027R-4T; Mon, 27 Jun 2022 07:51:50 +0000
Received: by outflank-mailman (input) for mailman id 356296;
 Mon, 27 Jun 2022 07:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5jXA-000270-F4
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:51:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fe6c6032-f5ed-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 09:51:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582151758;
 Mon, 27 Jun 2022 00:51:46 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A861D3F5A1;
 Mon, 27 Jun 2022 00:51:44 -0700 (PDT)
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
X-Inumbo-ID: fe6c6032-f5ed-11ec-b725-ed86ccbb4733
Message-ID: <f311e86b-7d37-53f1-d2d5-e31d10654c87@arm.com>
Date: Mon, 27 Jun 2022 09:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 7/7] xen/arm: mm: Reduce the area that xen_second covers
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-8-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-8-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, xen_second is used to cover the first 2GB of the
> virtual address space. With the recent rework of the page-tables,
> only the first 1GB region (where Xen resides) is effectively used.
> 
> In addition to that, I would like to reshuffle the memory layout.
> So Xen mappings may not be anymore in the first 2GB of the virtual
> address space.
> 
> Therefore, rework xen_second so it only covers the 1GB region where
> Xen will reside.
> 
> With this change, xen_second doesn't cover anymore the xenheap area
> on arm32. So, we first need to add memory to the boot allocator before
> setting up the xenheap mappings.
> 
> Take the opportunity to update the comments on top of xen_fixmap and
> xen_xenmap.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/mm.c    | 32 +++++++++++---------------------
>  xen/arch/arm/setup.c | 13 +++++++++++--
>  2 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 74666b2e720a..f87a7c32d07d 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -116,17 +116,14 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
>  #endif
>  
>  /* Common pagetable leaves */
> -/* Second level page tables.
> - *
> - * The second-level table is 2 contiguous pages long, and covers all
> - * addresses from 0 to 0x7fffffff. Offsets into it are calculated
> - * with second_linear_offset(), not second_table_offset().
> - */
> -static DEFINE_PAGE_TABLES(xen_second, 2);
> -/* First level page table used for fixmap */
> +/* Second level page table used to cover Xen virtual address space */
> +static DEFINE_PAGE_TABLE(xen_second);
> +/* Third level page table used for fixmap */
>  DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
> -/* First level page table used to map Xen itself with the XN bit set
> - * as appropriate. */
> +/*
> + * Third level page table used to map Xen itself with the XN bit set
> + * as appropriate.
> + */
>  static DEFINE_PAGE_TABLE(xen_xenmap);
>  
>  /* Non-boot CPUs use this to find the correct pagetables. */
> @@ -168,7 +165,6 @@ static void __init __maybe_unused build_assertions(void)
>      BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>  #endif
>      BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> -    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= XEN_PT_LPAE_ENTRIES);
Instead of removing this completely, shouldn't you change it to:
BUILD_BUG_ON(second_table_offset(XEN_VIRT_START)); ?

All in all:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

