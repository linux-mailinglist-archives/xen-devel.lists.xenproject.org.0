Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C473E1AC
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555535.867374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmyL-0007Vi-GN; Mon, 26 Jun 2023 14:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555535.867374; Mon, 26 Jun 2023 14:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmyL-0007U3-DO; Mon, 26 Jun 2023 14:13:41 +0000
Received: by outflank-mailman (input) for mailman id 555535;
 Mon, 26 Jun 2023 14:13:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDmyJ-0007Tr-Cp
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:13:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmyI-00031b-SN; Mon, 26 Jun 2023 14:13:38 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmyI-0005LV-MT; Mon, 26 Jun 2023 14:13:38 +0000
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
	bh=onEkaE+5LW+KtrfNQG6bA4FkTtG44NsdFOthtKfinTg=; b=3emIa0Ka/LgU8zSqQCGxlkAbtW
	t9i1JgQ2MS1yG7MTxSWpEbLIrBzlYBAt0SxsrhBGAu/XHJuJQQpC5kleX6N/iQyr9OG+Cpdg2FVpG
	xqpsXg4CVcmxS2+K0vK3OtAE8EQUvCyrR426KrgOGDVezPmLZetb20dx2YwLW8OTFiXo=;
Message-ID: <ebb5ac6a-bf2c-d107-a23f-20f696dfefaf@xen.org>
Date: Mon, 26 Jun 2023 15:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 3/6] xen/arm: change parameter name 'pa' in
 ioremap_addr() definition.
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <74fdc69fd08d1a0e35d4f226ea0c47a6f6a3a241.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74fdc69fd08d1a0e35d4f226ea0c47a6f6a3a241.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> In the current version of ioremap_addr() function, the declaration
> uses the parameter name 'start' (consistenly with the other ioremap_*
> function declarations), while the definition uses the parameter name
> 'pa'.
> Change the parameter name 'pa' of function definition to 'start', thus
> fixing a violation of MISRA C:2012 Rule 8.3 and keeping the consistency
> with other ioremap_* functions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/mm.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index e460249736..2e9860a754 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -736,10 +736,10 @@ void *__init arch_vmap_virt_end(void)
>    * This function should only be used to remap device address ranges
>    * TODO: add a check to verify this assumption
>    */
> -void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
> +void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
>   {
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    unsigned int offs = pa & (PAGE_SIZE - 1);
> +    mfn_t mfn = _mfn(PFN_DOWN(start));
> +    unsigned int offs = start & (PAGE_SIZE - 1);
>       unsigned int nr = PFN_UP(offs + len);
>       void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
>   
> @@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
>       return;
>   }
>   
> -int create_grant_host_mapping(unsigned long addr, mfn_t frame,
> +int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
>                                 unsigned int flags, unsigned int cache_flags)
>   {
>       int rc;
> @@ -1591,7 +1591,7 @@ int create_grant_host_mapping(unsigned long addr, mfn_t frame,
>       if ( flags & GNTMAP_readonly )
>           t = p2m_grant_map_ro;
>   
> -    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(addr),
> +    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(gpaddr),
>                                    frame, 0, t);
>   
>       if ( rc )

-- 
Julien Grall

