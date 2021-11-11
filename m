Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248DC44D5A6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224714.388175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml829-0004Lb-V1; Thu, 11 Nov 2021 11:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224714.388175; Thu, 11 Nov 2021 11:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml829-0004Jg-Rz; Thu, 11 Nov 2021 11:14:21 +0000
Received: by outflank-mailman (input) for mailman id 224714;
 Thu, 11 Nov 2021 11:14:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ml828-0004Ja-JZ
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 11:14:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ml825-0003n7-EM; Thu, 11 Nov 2021 11:14:17 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ml825-0008K4-8A; Thu, 11 Nov 2021 11:14:17 +0000
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
	bh=kmQwGRS2hpuVuFoKHzE3UwacVkhBocr4AP3/+yLhSMg=; b=FqIQoIPqs/idYewtcEyoxS/v/X
	6xI1QKk/9UpJFeC1DtLC0Nyod+NP7asnOcomfucVfFcWcCIdmEUOSOOW+CKqb2HXTdYsnoupvEKyf
	eCsUowvBTtPwWPpucsEMj1gzyHKqikvwTp1WCL0sRJGbxw+RtDQ/rv7RUng/JXzEsePc=;
Message-ID: <34d14ad2-3af6-1624-f30d-12f53f8ffdfb@xen.org>
Date: Thu, 11 Nov 2021 11:14:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 iwj@xenproject.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211110201812.934306-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211110201812.934306-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/11/2021 20:18, Stefano Stabellini wrote:
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

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v3:
> - move BUG_ON inside the loop
> 
> Changes in v2:
> - improve commit message
> - improve in-code comment
> - update nr_cells appropriately
> ---
>   xen/arch/arm/domain_build.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..dafbc13962 100644
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
> +        BUG_ON(nr_cells >= ARRAY_SIZE(reg));
>           dt_child_set_range(&cells, addrcells, sizecells, start, size);
>       }
>   
> +    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
> +
>       res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
>       if ( res )
>           return res;
> 

-- 
Julien Grall

