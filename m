Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F934F7E2D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 13:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300718.513008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQV3-0002um-N8; Thu, 07 Apr 2022 11:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300718.513008; Thu, 07 Apr 2022 11:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQV3-0002ru-Js; Thu, 07 Apr 2022 11:40:29 +0000
Received: by outflank-mailman (input) for mailman id 300718;
 Thu, 07 Apr 2022 11:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uyv1=UR=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1ncQV1-0002ro-IO
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 11:40:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8476526e-b667-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 13:40:26 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D40A81F85A;
 Thu,  7 Apr 2022 11:40:25 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 95BB4A3B95;
 Thu,  7 Apr 2022 11:40:25 +0000 (UTC)
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
X-Inumbo-ID: 8476526e-b667-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649331625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+hp8aAhVzpbG5JIjzC8mz1QFVXZDRqkDj1g7csHIECc=;
	b=UIULFBvyzCxIs+7UbHxsZU7G2yAOeXkpELPQc+nmPKjeexqyi8swlls9C2ojcKahaK5b3t
	H2rxtpzuFFtpGMGJpXEU5E76BZSQt2awxD3msEz2Thesrt8aivfxwdWHp/v4GBEKCgW960
	uNCcf9e9ZxHHc3A916CLQlkqYgm5LL8=
Date: Thu, 7 Apr 2022 13:40:25 +0200
From: Michal Hocko <mhocko@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <Yk7NqTlw7lmFzpKb@dhcp22.suse.cz>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
 <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
 <Yk7F2KzRrhLjYw4Z@dhcp22.suse.cz>
 <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>

On Thu 07-04-22 13:17:19, Juergen Gross wrote:
> On 07.04.22 13:07, Michal Hocko wrote:
> > On Thu 07-04-22 12:45:41, Juergen Gross wrote:
> > > On 07.04.22 12:34, Michal Hocko wrote:
> > > > Ccing Mel
> > > > 
> > > > On Thu 07-04-22 11:32:21, Juergen Gross wrote:
> > > > > Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
> > > > > initialization") only zones with free memory are included in a built
> > > > > zonelist. This is problematic when e.g. all memory of a zone has been
> > > > > ballooned out.
> > > > 
> > > > What is the actual problem there?
> > > 
> > > When running as Xen guest new hotplugged memory will not be onlined
> > > automatically, but only on special request. This is done in order to
> > > support adding e.g. the possibility to use another GB of memory, while
> > > adding only a part of that memory initially.
> > > 
> > > In case adding that memory is populating a new zone, the page allocator
> > > won't be able to use this memory when it is onlined, as the zone wasn't
> > > added to the zonelist, due to managed_zone() returning 0.
> > 
> > How is that memory onlined? Because "regular" onlining (online_pages())
> > does rebuild zonelists if their zone hasn't been populated before.
> 
> The Xen balloon driver has an own callback for onlining pages. The pages
> are just added to the ballooned-out page list without handing them to the
> allocator. This is done only when the guest is ballooned up.

OK, I see. Let me just rephrase to see whether we are on the same page.
Xen is overriding the online_page_callback to xen_online_page which
doesn't free pages to the page allocator which means that a zone might
remain unpopulated after onlining. This means that the default zone
lists rebuild is not done and later on when those pages are finally
released to the allocator there is no build_all_zonelists happening so
those freed pages are not really visible to the allocator via zonelists
fallback allocation.

Now to your patch. I suspect this is not sufficient for the full hotplug
situation. Consider a new NUMA node to be hotadded. hotadd_new_pgdat
will call build_all_zonelists but the zone is not populated yet at that
moment unless I am missing something. We do rely on online_pages to
rebuild once pages are onlined - which usually means they are freed to
the page allocator.

The zonelists building is kinda messy TBH. I have to say that I am not
really clear on Mel's 6aa303defb74 ("mm, vmscan: only allocate and
reclaim from zones with pages managed by the buddy allocator") because
as you have said unpoppulated zone is not (or shouldn't be) really all
that different from a depleted zone.

I think a better and more complete fix would be the following. In other
words the zonelists will be built for all present zones. Not sure
whether that is going to break 6aa303defb74 though.

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 2a9627dc784c..880c455e2557 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1062,7 +1062,6 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
 		       struct zone *zone, struct memory_group *group)
 {
 	unsigned long flags;
-	int need_zonelists_rebuild = 0;
 	const int nid = zone_to_nid(zone);
 	int ret;
 	struct memory_notify arg;
@@ -1106,17 +1105,13 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
 	 * This means the page allocator ignores this zone.
 	 * So, zonelist must be updated after online.
 	 */
-	if (!populated_zone(zone)) {
-		need_zonelists_rebuild = 1;
+	if (!populated_zone(zone))
 		setup_zone_pageset(zone);
-	}
 
 	online_pages_range(pfn, nr_pages);
 	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
 
 	node_states_set_node(nid, &arg);
-	if (need_zonelists_rebuild)
-		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
 	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
@@ -1985,10 +1980,8 @@ int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	/* reinitialise watermarks and update pcp limits */
 	init_per_zone_wmark_min();
 
-	if (!populated_zone(zone)) {
+	if (!populated_zone(zone))
 		zone_pcp_reset(zone);
-		build_all_zonelists(NULL);
-	}
 
 	node_states_clear_node(node, &arg);
 	if (arg.status_change_nid >= 0) {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3589febc6d31..130a2feceddc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6112,10 +6112,8 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
 	do {
 		zone_type--;
 		zone = pgdat->node_zones + zone_type;
-		if (managed_zone(zone)) {
-			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
-			check_highest_zone(zone_type);
-		}
+		zoneref_set_zone(zone, &zonerefs[nr_zones++]);
+		check_highest_zone(zone_type);
 	} while (zone_type);
 
 	return nr_zones;
-- 
Michal Hocko
SUSE Labs

