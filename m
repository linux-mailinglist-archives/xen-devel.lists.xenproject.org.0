Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22019945EC0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771196.1181769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsPS-00078B-CL; Fri, 02 Aug 2024 13:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771196.1181769; Fri, 02 Aug 2024 13:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsPS-00076X-95; Fri, 02 Aug 2024 13:33:30 +0000
Received: by outflank-mailman (input) for mailman id 771196;
 Fri, 02 Aug 2024 13:33:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sZsPR-00076Q-Al
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:33:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsPN-0006C2-AD; Fri, 02 Aug 2024 13:33:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsPN-0004Pp-3y; Fri, 02 Aug 2024 13:33:25 +0000
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
	bh=CrIHsFYnmBSmvtHn4HyRXn0fD/ErvVhaLr+Llf96ch8=; b=FZRE0rIxllkBBIsUOp/fFqh79e
	P/doT5pjfO5BkyULYtKIj8/mBy7LF9UBvXPCqw14cETBHT8VZmct7BEZwcsilMgA+S6Uy5HZ71meI
	Htco6xzSB2MmWp7KxsAHH4rXqx8CjDx3qVs29vZBgoS6i1x3J0rEK5RrcVDzT389XijQ=;
Message-ID: <de98dd2d-7516-4e7a-ae96-903479f5b179@xen.org>
Date: Fri, 2 Aug 2024 14:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen: arm: Move the functions of domain_page to MMU
 specific
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240802121443.1531693-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2024 13:14, Ayan Kumar Halder wrote:
> Moved init_domheap_mappings(), map_domain_page_global(),
> unmap_domain_page_global(), map_domain_page(), unmap_domain_page(),
> domain_page_map_to_mfn() to MMU specific folder.
> 
> On the top level, we have added stubs which will invoke the
> MMU specific equivalent of these functions.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/domain_page.c          | 161 +----------------------

Looking at what's left in domain_page.c, we seem to have just a series 
of stubs:

bool init_domheap_mappings(unsigned int cpu)
{
     return init_domheap_mappings_mm(cpu);
}

void *map_domain_page_global(mfn_t mfn)
{
     return map_domain_page_global_mm(mfn);
}

void unmap_domain_page_global(const void *ptr)
{
     return unmap_domain_page_global_mm(ptr);
}

/* Map a page of domheap memory */
void *map_domain_page(mfn_t mfn)
{
     return map_domain_page_mm(mfn);
}

/* Release a mapping taken with map_domain_page() */
void unmap_domain_page(const void *ptr)
{
     return unmap_domain_page_mm(ptr);
}

mfn_t domain_page_map_to_mfn(const void *ptr)
{
     return domain_page_map_to_mfn_mm(ptr);
}

The indirection seems unnecessary to me. What about renaming 
arch/arm/domain_page.c to arch/arm/mmu/domain_page.c? Then, for the MMU 
you can implement unmap_domain_page() & co rather than suffixed _mm ones.

Cheers,

-- 
Julien Grall


