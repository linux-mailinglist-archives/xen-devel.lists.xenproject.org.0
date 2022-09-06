Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491475AF33A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 20:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400034.641574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVcsd-0003If-At; Tue, 06 Sep 2022 18:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400034.641574; Tue, 06 Sep 2022 18:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVcsd-0003Fu-7N; Tue, 06 Sep 2022 18:00:59 +0000
Received: by outflank-mailman (input) for mailman id 400034;
 Tue, 06 Sep 2022 18:00:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVcsc-0003Fo-2T
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 18:00:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVcsb-0000yb-Pp; Tue, 06 Sep 2022 18:00:57 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVcsb-0006WG-Ij; Tue, 06 Sep 2022 18:00:57 +0000
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
	bh=Ng6SYtBg0jHyvkM+YgAbiGzd686ewQLK4Sf7vwOmRMA=; b=A9HFGxT8H13RMPZ1VXnYNq+xDQ
	IEn38RzU7PK5J7GBlJYorBdqvVmCFCeCiFz+7RnwopNoAOdUCxnYEfXkmDI/cwF5eWoynStojWhfA
	V7DLDzXEUMPhjINcPSl17HJSwzz8L6eft9U1++AmNbjmgIxJZ9SWxPkPdgZuD0xMjoT4=;
Message-ID: <c2fd0e69-1eee-89db-44d3-0b8e59a4eced@xen.org>
Date: Tue, 6 Sep 2022 19:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 1/9] xen/arm: introduce static shared memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906085941.944592-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 09:59, Penny Zheng wrote:
>   static int __init early_scan_node(const void *fdt,
>                                     int node, const char *name, int depth,
>                                     u32 address_cells, u32 size_cells,
> @@ -386,6 +549,8 @@ static int __init early_scan_node(const void *fdt,
>           process_chosen_node(fdt, node, name, address_cells, size_cells);
>       else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>           rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
> +        rc = process_shm_node(fdt, node, address_cells, size_cells);
>   
>       if ( rc < 0 )
>           printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 5815ccf8c5..995eee1d09 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -23,10 +23,17 @@ typedef enum {
>   }  bootmodule_kind;
>   
>   
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +
>   struct membank {
>       paddr_t start;
>       paddr_t size;
>       bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +#ifdef CONFIG_STATIC_SHM
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +#endif

I forgot to mention that this will clash with Henry's series [1]. As 
both series are meant for 4.17, please coordinate to decide which series 
should be merged first (this is to avoid last minute clash on Friday).

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20220905072635.16294-1-Henry.Wang@arm.com/

-- 
Julien Grall

