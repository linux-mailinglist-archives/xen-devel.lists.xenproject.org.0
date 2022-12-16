Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9D64E8F9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464321.722677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67TY-0003Fw-Lm; Fri, 16 Dec 2022 09:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464321.722677; Fri, 16 Dec 2022 09:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67TY-0003DN-J8; Fri, 16 Dec 2022 09:57:56 +0000
Received: by outflank-mailman (input) for mailman id 464321;
 Fri, 16 Dec 2022 09:57:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p67TX-0003DH-PX
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:57:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67TX-0007iZ-CE; Fri, 16 Dec 2022 09:57:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67TX-0000Kk-6C; Fri, 16 Dec 2022 09:57:55 +0000
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
	bh=uwwD2DjoTXPWatwzrZ0Z1fXViMzNItzkQeyXFwBk0xM=; b=A2Z2pY2aaxniVxYyLrgSsHuZ+s
	I0V83NKKF6yCU8n+XjUdNJxRIeOxgC9tqhMJFOlWZFkVW6HmEyBgIm7pwZjIHYje+8eWkWR0Xs/oi
	HgxxiZoCi0T0zW4m+tRvztaPg7USPzmftni/dcD7Aal3ws2y1VkGD1hfi7Z+kswwB9ZQ=;
Message-ID: <c63310d5-e699-3f6c-15a9-eec314cb179c@xen.org>
Date: Fri, 16 Dec 2022 09:57:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 3/9] xen/arm: Always use 'u64' instead of 'paddr_t' for
 address and size in DT
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch is actually a good example to demonstrate the extra amount of 
boiler plate required to use your new boiler.

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> device_tree_get_reg(), dt_next_cell() uses u64 for address and size.
> Thus, the caller needs to be fixed to pass u64 values and then invoke
> translate_dt_address_size() to do the translation between u64 and paddr_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/bootfdt.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..835bb5feb9 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -14,6 +14,7 @@
>   #include <xen/libfdt/libfdt.h>
>   #include <xen/sort.h>
>   #include <xsm/xsm.h>
> +#include <asm/platform.h>
>   #include <asm/setup.h>
>   
>   static bool __init device_tree_node_matches(const void *fdt, int node,
> @@ -68,7 +69,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>       unsigned int i, banks;
>       const __be32 *cell;
>       u32 reg_cells = address_cells + size_cells;
> -    paddr_t start, size;
> +    u64 start, size;
>       struct meminfo *mem = data;
>   
>       if ( address_cells < 1 || size_cells < 1 )
> @@ -219,7 +220,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
>       const struct fdt_property *prop;
>       const __be32 *cell;
>       bootmodule_kind kind;
> -    paddr_t start, size;
> +    u64 start, size;
>       int len;
>       /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
>       char path[92];
> @@ -379,7 +380,8 @@ static int __init process_shm_node(const void *fdt, int node,
>   {
>       const struct fdt_property *prop, *prop_id, *prop_role;
>       const __be32 *cell;
> -    paddr_t paddr, gaddr, size;
> +    paddr_t paddr = 0, gaddr = 0, size = 0;

For a first 0 is a valid address. So we should not use is as initialization.

> +    u64 dt_paddr, dt_gaddr, dt_size;
>       struct meminfo *mem = &bootinfo.reserved_mem;
>       unsigned int i;
>       int len;
> @@ -443,10 +445,14 @@ static int __init process_shm_node(const void *fdt, int node,
>       }
>   
>       cell = (const __be32 *)prop->data;
> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> -    size = dt_next_cell(size_cells, &cell);
> +    device_tree_get_reg(&cell, address_cells, address_cells, &dt_paddr,
> +                        &dt_gaddr);
> +    translate_dt_address_size(&dt_paddr, &dt_gaddr, &paddr, &gaddr
If we function return a value, then this should be checked. If not, then 
it should be explained.

In this case, it is not clear to me who is checking the conversion was 
successful.

Overall, I think this will increase the amount of code. So before doing 
the modification, I think we need to agree on whether this is worth it 
to check the device-tree values.

Cheers,

-- 
Julien Grall

