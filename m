Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7314F7D04
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 12:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300690.512950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPTQ-0000Gi-Lj; Thu, 07 Apr 2022 10:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300690.512950; Thu, 07 Apr 2022 10:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPTQ-0000Eg-IY; Thu, 07 Apr 2022 10:34:44 +0000
Received: by outflank-mailman (input) for mailman id 300690;
 Thu, 07 Apr 2022 10:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uyv1=UR=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1ncPTP-0000Ea-7J
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 10:34:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5577123c-b65e-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 12:34:42 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 938FE21115;
 Thu,  7 Apr 2022 10:34:41 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5DE87A3B95;
 Thu,  7 Apr 2022 10:34:41 +0000 (UTC)
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
X-Inumbo-ID: 5577123c-b65e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649327681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sO0QE8JyTuj2LMUjDwYdva6iLYEDQBctYiGgxMGKAN8=;
	b=LwAe3jQ5+TGKWdY4ZX3tUU+fSU5rP4vpxcto9Sc4TqPdlpx/37BzVOasiq+mZLyGY2r3Zg
	aSkdPXBFU824M9PVCIeBYcjeBeW/5V9U3ZQA6IwASjiNwGdtrFXUf+auXBLpqpRdKE9xIn
	3timskGhpz+vIVqqyIju/BRrPH9QULc=
Date: Thu, 7 Apr 2022 12:34:40 +0200
From: Michal Hocko <mhocko@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
References: <20220407093221.1090-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407093221.1090-1-jgross@suse.com>

Ccing Mel

On Thu 07-04-22 11:32:21, Juergen Gross wrote:
> Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
> initialization") only zones with free memory are included in a built
> zonelist. This is problematic when e.g. all memory of a zone has been
> ballooned out.

What is the actual problem there?

> Use populated_zone() when building a zonelist as it has been done
> before that commit.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist initialization")

Did you mean to refer to 
6aa303defb74 ("mm, vmscan: only allocate and reclaim from zones with
pages managed by the buddy allocator")?

> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index bdc8f60ae462..3d0662af3289 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6128,7 +6128,7 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
>  	do {
>  		zone_type--;
>  		zone = pgdat->node_zones + zone_type;
> -		if (managed_zone(zone)) {
> +		if (populated_zone(zone)) {
>  			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
>  			check_highest_zone(zone_type);
>  		}
> -- 
> 2.34.1

-- 
Michal Hocko
SUSE Labs

