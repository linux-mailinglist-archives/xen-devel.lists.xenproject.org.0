Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC04F7D94
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 13:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300701.512976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPyn-00052R-Kj; Thu, 07 Apr 2022 11:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300701.512976; Thu, 07 Apr 2022 11:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPyn-0004zC-HU; Thu, 07 Apr 2022 11:07:09 +0000
Received: by outflank-mailman (input) for mailman id 300701;
 Thu, 07 Apr 2022 11:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uyv1=UR=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1ncPym-0004z6-42
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 11:07:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d978d2c9-b662-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 13:07:01 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 340A621118;
 Thu,  7 Apr 2022 11:07:05 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E1E68A3B82;
 Thu,  7 Apr 2022 11:07:04 +0000 (UTC)
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
X-Inumbo-ID: d978d2c9-b662-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649329625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LE2tVt6E1/57kcFgpWdjdBQU6aDSlbFwP46O5S44+90=;
	b=Tp5lGLf1ElWVIcInGlUGAoJ1sx0YdUjQTq9tC8LzRgATKZFC9iS34ryFP2GTDsBD0Mirv1
	vRg/4eIJkZ5rGRuZIS6FxwFEhz62Vaik76t94HU2LQ2QePTUL26rXUg85lWH0KUDm4GPrG
	NFM/0kDfL93OeH1mpzliJJGkaQkmwQk=
Date: Thu, 7 Apr 2022 13:07:04 +0200
From: Michal Hocko <mhocko@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <Yk7F2KzRrhLjYw4Z@dhcp22.suse.cz>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
 <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>

On Thu 07-04-22 12:45:41, Juergen Gross wrote:
> On 07.04.22 12:34, Michal Hocko wrote:
> > Ccing Mel
> > 
> > On Thu 07-04-22 11:32:21, Juergen Gross wrote:
> > > Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
> > > initialization") only zones with free memory are included in a built
> > > zonelist. This is problematic when e.g. all memory of a zone has been
> > > ballooned out.
> > 
> > What is the actual problem there?
> 
> When running as Xen guest new hotplugged memory will not be onlined
> automatically, but only on special request. This is done in order to
> support adding e.g. the possibility to use another GB of memory, while
> adding only a part of that memory initially.
> 
> In case adding that memory is populating a new zone, the page allocator
> won't be able to use this memory when it is onlined, as the zone wasn't
> added to the zonelist, due to managed_zone() returning 0.

How is that memory onlined? Because "regular" onlining (online_pages())
does rebuild zonelists if their zone hasn't been populated before.

-- 
Michal Hocko
SUSE Labs

