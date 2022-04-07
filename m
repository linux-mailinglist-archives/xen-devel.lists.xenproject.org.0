Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3F4F7ED1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300753.513074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncR2I-0001jr-38; Thu, 07 Apr 2022 12:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300753.513074; Thu, 07 Apr 2022 12:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncR2I-0001hM-0F; Thu, 07 Apr 2022 12:14:50 +0000
Received: by outflank-mailman (input) for mailman id 300753;
 Thu, 07 Apr 2022 12:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uyv1=UR=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1ncR2G-0001hG-Bg
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:14:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50e3e2f0-b66c-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 14:14:47 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D5A2F210EA;
 Thu,  7 Apr 2022 12:14:46 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9F5F8A3B82;
 Thu,  7 Apr 2022 12:14:46 +0000 (UTC)
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
X-Inumbo-ID: 50e3e2f0-b66c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649333686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtNVmE1emwW/zSfcFurzs/NtccDx0eiUPTowKoz+RNk=;
	b=QvJvZjV3tnz+F/+YT8CTV+iCfToW0qpQ1YrYkaoPuNKKBfsYg3NyFAmcfqk67894y2NESO
	gIq26lohcEJChJElvQSTvMjfREMEIQhWvtmPFJVWAP1l0iEiHuh7wEkgEKqkZrSkRUiI8G
	0hVaK9HWxIE7RMwIqk4KMKL+YLHFRtE=
Date: Thu, 7 Apr 2022 14:14:46 +0200
From: Michal Hocko <mhocko@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v2] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <Yk7VtrgrQ5WabLcb@dhcp22.suse.cz>
References: <20220407120637.9035-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407120637.9035-1-jgross@suse.com>

[CC Mel]

On Thu 07-04-22 14:06:37, Juergen Gross wrote:
> Since commit 6aa303defb74 ("mm, vmscan: only allocate and reclaim from
> zones with pages managed by the buddy allocator") only zones with free
> memory are included in a built zonelist. This is problematic when e.g.
> all memory of a zone has been ballooned out when zonelists are being
> rebuilt.
> 
> The decision whether to rebuild the zonelists when onlining new memory
> is done based on populated_zone() returning 0 for the zone the memory
> will be added to. The new zone is added to the zonelists only, if it
> has free memory pages (managed_zone() returns a non-zero value) after
> the memory has been onlined. This implies, that onlining memory will
> always free the added pages to the allocator immediately, but this is
> not true in all cases: when e.g. running as a Xen guest the onlined
> new memory will be added only to the ballooned memory list, it will be
> freed only when the guest is being ballooned up afterwards.

Thanks this is much more clearer!
 
> Another problem with using managed_zone() for the decision whether a
> zone is being added to the zonelists is, that a zone with all memory
> used will in fact be removed from all zonelists in case the zonelists
> happen to be rebuilt.
> 
> Use populated_zone() when building a zonelist as it has been done
> before that commit.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6aa303defb74 ("mm, vmscan: only allocate and reclaim from zones with pages managed by the buddy allocator")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> ---
> V2:
> - updated commit message (Michal Hocko)
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

