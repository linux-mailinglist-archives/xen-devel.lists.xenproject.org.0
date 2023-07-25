Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A526761017
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 12:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569597.890495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOErs-00080O-Qr; Tue, 25 Jul 2023 10:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569597.890495; Tue, 25 Jul 2023 10:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOErs-0007x5-OG; Tue, 25 Jul 2023 10:02:12 +0000
Received: by outflank-mailman (input) for mailman id 569597;
 Tue, 25 Jul 2023 10:02:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOErq-0007wj-Qf
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 10:02:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOErq-0005Lz-D1; Tue, 25 Jul 2023 10:02:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOErq-0003We-7M; Tue, 25 Jul 2023 10:02:10 +0000
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
	bh=wGoXdfF1EiS7CrX0t1ZP3XO+ZNqo6NxN/lhPDW50POI=; b=BjLhj3gjGRqdCM/vBFNUj7wqvV
	R+6XR0tOTtLtdFITtTUG8kmnbk3waWNidPdf5LmofSbfdmeLSUskglUDZiQ8ThqWfqY3XqUvAKiGM
	Rx4VW0UYRteLaIpgSH2l8jyVfDGvHfobeH03QbmoaYFnjA/wZzx2HOqx43kup6e8wR24=;
Message-ID: <421bcc71-006f-af73-374a-b54266052a42@xen.org>
Date: Tue, 25 Jul 2023 11:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] device_tree: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
References: <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 24/07/2023 09:40, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
>    - improved consistency in parameter renaming.
> ---
>   xen/common/device_tree.c      | 24 ++++++++++++------------
>   xen/include/xen/device_tree.h | 16 ++++++++--------
>   2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 0677193ab3..d52531dc9f 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -85,11 +85,11 @@ struct dt_bus
>       unsigned int (*get_flags)(const __be32 *addr);
>   };
>   
> -void dt_get_range(const __be32 **cell, const struct dt_device_node *np,
> +void dt_get_range(const __be32 **cellp, const struct dt_device_node *np,
>                     u64 *address, u64 *size)
>   {
> -    *address = dt_next_cell(dt_n_addr_cells(np), cell);
> -    *size = dt_next_cell(dt_n_size_cells(np), cell);
> +    *address = dt_next_cell(dt_n_addr_cells(np), cellp);
> +    *size = dt_next_cell(dt_n_size_cells(np), cellp);
>   }
>   
>   void dt_set_cell(__be32 **cellp, int size, u64 val)
> @@ -993,9 +993,9 @@ int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
>   }
>   
>   int dt_for_each_range(const struct dt_device_node *dev,
> -                      int (*cb)(const struct dt_device_node *,
> +                      int (*cb)(const struct dt_device_node *dev,
>                                   uint64_t addr, uint64_t length,
> -                                void *),
> +                                void *data),
>                         void *data)
>   {
>       const struct dt_device_node *parent = NULL;
> @@ -1164,7 +1164,7 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device)
>       return (intlen / intsize);
>   }
>   
> -unsigned int dt_number_of_address(const struct dt_device_node *dev)
> +unsigned int dt_number_of_address(const struct dt_device_node *device)
We have a structure called 'device', so wouldn't this result to violate 
another MISRA rule because identifiers are re-used?

In any case, I would prefer if we keep the shorter version (i.e. 'dev') 
as this is more common within device_tree.c. We can replace the other 
'device' at a leisure pace.

Cheers,

-- 
Julien Grall

