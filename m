Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940D4F7EA0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300741.513041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQrr-0007KM-M1; Thu, 07 Apr 2022 12:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300741.513041; Thu, 07 Apr 2022 12:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQrr-0007Gz-It; Thu, 07 Apr 2022 12:04:03 +0000
Received: by outflank-mailman (input) for mailman id 300741;
 Thu, 07 Apr 2022 12:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uyv1=UR=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1ncQrq-0007Gt-Nx
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:04:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd9a1891-b66a-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 14:03:57 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 50D771F85A;
 Thu,  7 Apr 2022 12:04:01 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0887EA3B96;
 Thu,  7 Apr 2022 12:04:00 +0000 (UTC)
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
X-Inumbo-ID: cd9a1891-b66a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649333041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yD6Hv0Qev4TUL19bY/g1Sx375Qm9AbFeZHHdH3oY4hs=;
	b=nyUXqwYZBdRJ+l/n+nNGbkZWDe7Bqq+oy/9xD+GmBS6dBr+gvMlU+jcSshfTcrFJFz1eKf
	WOdzx1NwqOpGiWVEPbEodpWKamYAO+1G6nea8neoVBEI9wnICynBWROc1V3VeqRcWfHsxN
	oH6daT+1azkNl7uvjrk1FB4sy6VhfOs=
Date: Thu, 7 Apr 2022 14:04:00 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <Yk7TMKBAkuSVZRLT@dhcp22.suse.cz>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
 <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
 <Yk7F2KzRrhLjYw4Z@dhcp22.suse.cz>
 <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>
 <Yk7NqTlw7lmFzpKb@dhcp22.suse.cz>
 <770d8283-4315-3d83-4f8b-723308fffe5c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770d8283-4315-3d83-4f8b-723308fffe5c@redhat.com>

On Thu 07-04-22 13:58:44, David Hildenbrand wrote:
[...]
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 3589febc6d31..130a2feceddc 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -6112,10 +6112,8 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
> >  	do {
> >  		zone_type--;
> >  		zone = pgdat->node_zones + zone_type;
> > -		if (managed_zone(zone)) {
> > -			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
> > -			check_highest_zone(zone_type);
> > -		}
> > +		zoneref_set_zone(zone, &zonerefs[nr_zones++]);
> > +		check_highest_zone(zone_type);
> >  	} while (zone_type);
> >  
> >  	return nr_zones;
> 
> I don't think having !populated zones in the zonelist is a particularly
> good idea. Populated vs !populated changes only during page
> onlininge/offlining.
> 
> If I'm not wrong, with your patch we'd even include ZONE_DEVICE here ...

What kind of problem that would cause? The allocator wouldn't see any
pages at all so it would fallback to the next one. Maybe kswapd would
need some tweak to have a bail out condition but as mentioned in the
thread already. !populated or !managed for that matter are not all that
much different from completely depleted zones. The fact that we are
making that distinction has led to some bugs and I suspect it makes the
code more complex without a very good reason.

> I'd vote for going with the simple fix first, which should be good
> enough AFAIKT.

yes, see the other reply

-- 
Michal Hocko
SUSE Labs

