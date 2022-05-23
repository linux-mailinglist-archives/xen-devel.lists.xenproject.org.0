Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716A5309F3
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 09:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335525.559704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2US-0007T2-09; Mon, 23 May 2022 07:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335525.559704; Mon, 23 May 2022 07:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2UR-0007Pm-TX; Mon, 23 May 2022 07:28:31 +0000
Received: by outflank-mailman (input) for mailman id 335525;
 Mon, 23 May 2022 07:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6LT=V7=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nt2UQ-0007Pg-FJ
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 07:28:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eff79ce7-da69-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 09:28:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE86D139F;
 Mon, 23 May 2022 00:28:26 -0700 (PDT)
Received: from [10.57.7.84] (unknown [10.57.7.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5673A3F66F;
 Mon, 23 May 2022 00:28:25 -0700 (PDT)
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
X-Inumbo-ID: eff79ce7-da69-11ec-837e-e5687231ffcc
Message-ID: <eda75863-018a-6dbd-8f75-837adaba71c1@arm.com>
Date: Mon, 23 May 2022 09:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 13/16] xen/arm32: setup: Move out the code to populate the
 boot allocator
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-14-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220520120937.28925-14-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 20.05.2022 14:09, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch, we will want to populate the boot allocator
> separately for arm64. The code will end up to be very similar to the one
> on arm32. So move out the code in a new helper populate_boot_allocator().
> 
> For now the code is still protected by CONFIG_ARM_32 to avoid any build
> failure on arm64.
> 
> Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) with
> xenheap_mfn_end as they are equivalent.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>     Changes in v4:
>         - Patch added
> ---
>  xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed48a..3d5a2283d4ef 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
>  }
>  
>  #ifdef CONFIG_ARM_32
> +/*
> + * Populate the boot allocator. All the RAM but the following regions
> + * will be added:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + *  - Xenheap
> + */
> +static void __init populate_boot_allocator(void)
> +{
> +    unsigned int i;
Shouldn't this be an int (as it was previously) because ...
> +    const struct meminfo *banks = &bootinfo.mem;
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
... nr_banks is int ?

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

