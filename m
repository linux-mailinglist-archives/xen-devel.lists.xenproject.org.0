Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5244AAB5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 10:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223825.386731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNdB-0000re-EJ; Tue, 09 Nov 2021 09:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223825.386731; Tue, 09 Nov 2021 09:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNdB-0000pO-BK; Tue, 09 Nov 2021 09:41:29 +0000
Received: by outflank-mailman (input) for mailman id 223825;
 Tue, 09 Nov 2021 09:41:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkNd9-0000pI-OX
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 09:41:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkNd7-00041s-3L; Tue, 09 Nov 2021 09:41:25 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.22.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkNd6-0002od-TC; Tue, 09 Nov 2021 09:41:25 +0000
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
	bh=QdedMTNFdtooBL3zeJOcEfbVB9S/FcsMgj5LfNJ7Qj0=; b=iH5dOH8puUDFAKt7jTa8+P+0Of
	kOeAJqMGYBFzmBUbeGmTauFjX8kYvQLaMG425Gg0doYlShr2Dg5+vLa7Li7LKaqZLEjQT5x6HwOeI
	PqkVpGzzSpNQWwWM3O0ztLIeyvhlmbFbzGurdogu/SIffyaRdIPl2Yg7gz3FRqf/y+tc=;
Message-ID: <9ba4f9ea-d393-bcb6-22ac-0cdb930ad15a@xen.org>
Date: Tue, 9 Nov 2021 09:41:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 iwj@xenproject.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211109004808.115906-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211109004808.115906-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/11/2021 00:48, Stefano Stabellini wrote:
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

This is a bug fix. So please add a Fixes tag. In this case, I think it 
should be:

Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")

> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> 
> This patch should be considered for 4.16 as it fixes an incorrect
> behavior.
> 
> The risk is low for two reasons:
> - the change is simple
> - make_memory_node is easily tested because it gets called at every
>    boot, e.g. gitlab-ci and OSSTest exercise this path
> 
> I tested this patch successfully with and without xen,static-mem.
> 
> ---
>   xen/arch/arm/domain_build.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1fbafeaea8..56d3ff9d08 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -874,11 +874,17 @@ static int __init make_memory_node(const struct domain *d,
>       if ( mem->nr_banks == 0 )
>           return -ENOENT;
>   
> +    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> +        ;
> +    /* No reserved-memory ranges to expose to Dom0 */
I find this comment a bit misleading because make_memory_node() will 
also be called to create normal memory region. I would drop 
"reserved-memory" and add a comment on top of the loop explaining what 
the loop does.

> +    if ( i == mem->nr_banks )
> +        return 0;
> +
>       dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
>                  reg_size, nr_cells);

I think you need to adjust nr_cells otherwise we would write garbagge in 
the DT if we need to exclude some regions.

>   
>       /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
> +    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
>       res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
> @@ -888,11 +894,14 @@ static int __init make_memory_node(const struct domain *d,
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
> 

Cheers,

-- 
Julien Grall

