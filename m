Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0736281454
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2146.6401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLJp-0003Sl-Ev; Fri, 02 Oct 2020 13:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2146.6401; Fri, 02 Oct 2020 13:41:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLJp-0003SK-Bd; Fri, 02 Oct 2020 13:41:53 +0000
Received: by outflank-mailman (input) for mailman id 2146;
 Fri, 02 Oct 2020 13:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c/W5=DJ=suse.com=mhocko@srs-us1.protection.inumbo.net>)
 id 1kOLJo-0003Ry-5B
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:41:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9b034f0-2f56-46c5-aa08-a35edeb56b40;
 Fri, 02 Oct 2020 13:41:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FBA6AD12;
 Fri,  2 Oct 2020 13:41:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c/W5=DJ=suse.com=mhocko@srs-us1.protection.inumbo.net>)
	id 1kOLJo-0003Ry-5B
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:41:52 +0000
X-Inumbo-ID: d9b034f0-2f56-46c5-aa08-a35edeb56b40
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d9b034f0-2f56-46c5-aa08-a35edeb56b40;
	Fri, 02 Oct 2020 13:41:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601646110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ex35TTNhtQo4+POapz9XDyIVapheLz/KPghDOJAZTmI=;
	b=oB4MvVDI1JsMmEp5fS6ih0IDJ3PgAF/1fiyI66oaGiIt+W4qf/INGGv0iE18qGvXKec0xO
	qLuuPJacZ9haS8eAxNIVDEfYmij/eqsIT1yxOLKQW7XVaOvlwlgI+fJex9EAJ+KK4SDYFi
	OdM6RJjLLtPQt3GbReg3chiA056/S3g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8FBA6AD12;
	Fri,  2 Oct 2020 13:41:50 +0000 (UTC)
Date: Fri, 2 Oct 2020 15:41:49 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v1 5/5] mm/memory_hotplug: update comment regarding zone
 shuffling
Message-ID: <20201002134149.GK4555@dhcp22.suse.cz>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928182110.7050-6-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon 28-09-20 20:21:10, David Hildenbrand wrote:
> As we no longer shuffle via generic_online_page() and when undoing
> isolation, we can simplify the comment.
> 
> We now effectively shuffle only once (properly) when onlining new
> memory.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/memory_hotplug.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 9db80ee29caa..c589bd8801bb 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -859,13 +859,10 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
>  	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
>  
>  	/*
> -	 * When exposing larger, physically contiguous memory areas to the
> -	 * buddy, shuffling in the buddy (when freeing onlined pages, putting
> -	 * them either to the head or the tail of the freelist) is only helpful
> -	 * for maintaining the shuffle, but not for creating the initial
> -	 * shuffle. Shuffle the whole zone to make sure the just onlined pages
> -	 * are properly distributed across the whole freelist. Make sure to
> -	 * shuffle once pageblocks are no longer isolated.
> +	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
> +	 * the tail of the freelist when undoing isolation). Shuffle the whole
> +	 * zone to make sure the just onlined pages are properly distributed
> +	 * across the whole freelist - to create an initial shuffle.
>  	 */
>  	shuffle_zone(zone);
>  
> -- 
> 2.26.2

-- 
Michal Hocko
SUSE Labs

