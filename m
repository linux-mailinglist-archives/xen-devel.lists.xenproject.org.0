Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320A6F5797
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529150.823230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBHx-0000Wd-6w; Wed, 03 May 2023 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529150.823230; Wed, 03 May 2023 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBHx-0000TK-3z; Wed, 03 May 2023 12:08:53 +0000
Received: by outflank-mailman (input) for mailman id 529150;
 Wed, 03 May 2023 12:08:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puBHv-0000TE-RR
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:08:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBHv-0001Jm-9D; Wed, 03 May 2023 12:08:51 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBHv-0001UT-0w; Wed, 03 May 2023 12:08:51 +0000
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
	bh=V1Br1aM8ZSk05T7KMZpn1Acl9L+OCjkgD7wdGT3hsIw=; b=LVv9jlBQf916GX2/6r8Hlsibto
	dz5+3TaUU8OyqT8G1vjquxRj/6nqiwGomPPZFfEm/l+/wkMuzt88glKVUddduajdQhNPJh+cSckiR
	TnJAuh6p0QE/YN/SKbDMNQDasYUfRxddIuNcNk6LJgAjkRKqpvm6g/hjMuQgGuOq2djw=;
Message-ID: <d515c3a5-9473-3cde-2838-a20875aa1181@xen.org>
Date: Wed, 3 May 2023 13:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 08/12] xen: dt: Replace u64 with uint64_t as the callback
 function parameters for dt_for_each_range()
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-9-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230428175543.11902-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/04/2023 18:55, Ayan Kumar Halder wrote:
> In the callback functions invoked by dt_for_each_range() ie handle_pci_range(),
> map_range_to_domain(), 'u64' should be replaced with 'uint64_t' as the data type
> for the parameters.

Please explain why this needs to be replaced. I.e. Xen coding style 
mention that u32 should be avoided.

> Also dt_for_each_range() invokes the callback functions with
> 'uint64_t' arguments.
> 
> There is another callback function ie is_bar_valid() which uses 'paddr_t'
> instead of 'u64' or 'uint64_t'. We will change it in the subsequent commit.

I would rather prefer if this is folded in this patch.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1-v5 - New patch introduced in v6.
> 
>   xen/arch/arm/domain_build.c      | 4 ++--
>   xen/arch/arm/include/asm/setup.h | 2 +-
>   xen/common/device_tree.c         | 4 ++--
>   xen/include/xen/device_tree.h    | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1c558fca0c..9865340eac 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1637,7 +1637,7 @@ out:
>   }
>   
>   static int __init handle_pci_range(const struct dt_device_node *dev,
> -                                   u64 addr, u64 len, void *data)
> +                                   uint64_t addr, uint64_t len, void *data)
>   {
>       struct rangeset *mem_holes = data;
>       paddr_t start, end;
> @@ -2331,7 +2331,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>   }
>   
>   int __init map_range_to_domain(const struct dt_device_node *dev,
> -                               u64 addr, u64 len, void *data)
> +                               uint64_t addr, uint64_t len, void *data)
>   {
>       struct map_range_data *mr_data = data;
>       struct domain *d = mr_data->d;
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 47ce565d87..fe17cb0a4a 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -166,7 +166,7 @@ u32 device_tree_get_u32(const void *fdt, int node,
>                           const char *prop_name, u32 dflt);
>   
>   int map_range_to_domain(const struct dt_device_node *dev,
> -                        u64 addr, u64 len, void *data);
> +                        uint64_t addr, uint64_t len, void *data);
>   
>   extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
>   
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 2163cf26d0..ab5f8df66c 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -997,7 +997,7 @@ int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
>   
>   int dt_for_each_range(const struct dt_device_node *dev,
>                         int (*cb)(const struct dt_device_node *,
> -                                u64 addr, u64 length,
> +                                uint64_t addr, uint64_t length,
>                                   void *),
>                         void *data)
>   {
> @@ -1060,7 +1060,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
>   
>       for ( ; rlen >= rone; rlen -= rone, ranges += rone )
>       {
> -        u64 a, s;
> +        uint64_t a, s;
>           int ret;
>   
>           memcpy(addr, ranges + na, 4 * pna);
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index ce25b89c4b..b3888c1b96 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -681,7 +681,7 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
>    */
>   int dt_for_each_range(const struct dt_device_node *dev,
>                         int (*cb)(const struct dt_device_node *,
> -                                u64 addr, u64 length,
> +                                uint64_t addr, uint64_t length,
>                                   void *),
>                         void *data);
>   

Cheers,

-- 
Julien Grall

