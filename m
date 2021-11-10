Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7744C24E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 14:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224312.387557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkns7-00072x-3i; Wed, 10 Nov 2021 13:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224312.387557; Wed, 10 Nov 2021 13:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkns7-00070d-0S; Wed, 10 Nov 2021 13:42:39 +0000
Received: by outflank-mailman (input) for mailman id 224312;
 Wed, 10 Nov 2021 13:42:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkns5-00070X-20
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 13:42:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkns2-0002qp-1j; Wed, 10 Nov 2021 13:42:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.19.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkns1-0007c2-RN; Wed, 10 Nov 2021 13:42:33 +0000
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
	bh=kqPl5lKEg5qOgDwsA4MzRCfkHeofnwlRtEj4qjoHWWk=; b=DEF5k2LS9M7IneqM7DtbvpY1Iu
	i3m7rmGBUFRwdBAYQXH9yEZgpymBveup5oVT+WEhhFjM4NOeBmEimUh+QJQGFx9Z/3wdErc7EQ4+D
	pOEz0UVzEJw/7XdJGU3RpDqxKFm36FD/ca7Vka+CKBp9lq2qGgkTfId7A1nL/18S2KF8=;
Message-ID: <c303da1f-adf0-398d-4ba8-d0e5410da992@xen.org>
Date: Wed, 10 Nov 2021 13:42:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 iwj@xenproject.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211109231817.587168-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211109231817.587168-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/11/2021 23:18, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> DomUs static-mem ranges are added to the reserved_mem array for
> accounting, but they shouldn't be assigned to dom0 as the other regular
> reserved-memory ranges in device tree.
> 
> In make_memory_nodes, fix the error by skipping banks with xen_domain
> set to true in the reserved-memory array. Also make sure to use the
> first valid (!xen_domain) start address for the memory node name.
> 
> Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> ---
> Changes in v2:
> - improve commit message
> - improve in-code comment
> - update nr_cells appropriately
> ---
>   xen/arch/arm/domain_build.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..c81a2bdfef 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -862,21 +862,25 @@ static int __init make_memory_node(const struct domain *d,
>   {
>       int res, i;
>       int reg_size = addrcells + sizecells;
> -    int nr_cells = reg_size * mem->nr_banks;
> +    int nr_cells = 0;
>       /* Placeholder for memory@ + a 64-bit number + \0 */
>       char buf[24];
>       __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>       __be32 *cells;
>   
> -    BUG_ON(nr_cells >= ARRAY_SIZE(reg));

The goal of this BUG_ON() was to catch potential overrun of the buffer 
before it is actually used. Now...

>       if ( mem->nr_banks == 0 )
>           return -ENOENT;
>   
> -    dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
> -               reg_size, nr_cells);
> +    /* find first memory range not bound to a Xen domain */
> +    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> +        ;
> +    if ( i == mem->nr_banks )
> +        return 0;
> +
> +    dt_dprintk("Create memory node\n");
>   
>       /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
> +    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
>       res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
> @@ -886,17 +890,24 @@ static int __init make_memory_node(const struct domain *d,
>           return res;
>   
>       cells = &reg[0];
> -    for ( i = 0 ; i < mem->nr_banks; i++ )
> +    for ( ; i < mem->nr_banks; i++ )
>       {
>           u64 start = mem->bank[i].start;
>           u64 size = mem->bank[i].size;
>   
> +        if ( mem->bank[i].xen_domain )
> +            continue;
> +
>           dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>                      i, start, start + size);
>   
> +        nr_cells += reg_size;
>           dt_child_set_range(&cells, addrcells, sizecells, start, size);
>       }
>   
> +    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
> +    BUG_ON(nr_cells >= ARRAY_SIZE(reg));

... this is moved after we write to the array. Which means the badness 
already happened and the BUG_ON() becomes pointless.

I would still like to have the BUG_ON() in place. So I would move it in 
the loop just after nr_cells is updated.

> +
>       res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
>       if ( res )
>           return res;
> 

-- 
Julien Grall

