Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E544F7F1D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300767.513096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncRJn-0005IL-21; Thu, 07 Apr 2022 12:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300767.513096; Thu, 07 Apr 2022 12:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncRJm-0005GW-VK; Thu, 07 Apr 2022 12:32:54 +0000
Received: by outflank-mailman (input) for mailman id 300767;
 Thu, 07 Apr 2022 12:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlDc=UR=techsingularity.net=mgorman@srs-se1.protection.inumbo.net>)
 id 1ncRJm-0005GQ-9C
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:32:54 +0000
Received: from outbound-smtp31.blacknight.com (outbound-smtp31.blacknight.com
 [81.17.249.62]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7cadad1-b66e-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 14:32:52 +0200 (CEST)
Received: from mail.blacknight.com (pemlinmail06.blacknight.ie [81.17.255.152])
 by outbound-smtp31.blacknight.com (Postfix) with ESMTPS id 2E541C0B72
 for <xen-devel@lists.xenproject.org>; Thu,  7 Apr 2022 13:32:52 +0100 (IST)
Received: (qmail 22167 invoked from network); 7 Apr 2022 12:32:51 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.223])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 7 Apr 2022 12:32:51 -0000
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
X-Inumbo-ID: d7cadad1-b66e-11ec-a405-831a346695d4
Date: Thu, 7 Apr 2022 13:32:44 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Juergen Gross <jgross@suse.com>
Cc: Michal Hocko <mhocko@suse.com>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek Marczykowski-G?recki <marmarek@invisiblethingslab.com>,
	Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <20220407115414.GA4148@techsingularity.net>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
 <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
 <Yk7F2KzRrhLjYw4Z@dhcp22.suse.cz>
 <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 07, 2022 at 01:17:19PM +0200, Juergen Gross wrote:
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
> 

Is this new behaviour? I ask because keeping !managed_zones out of the
zonelist and reclaim paths and the behaviour makes sense. Elsewhere you
state "zone can always happen to have no free memory left" and this is true
but it's usually a transient event. The difference between a populated
vs managed zone is usually permanent event where no memory will ever be
placed on the buddy lists because the memory was reserved early in boot
or a similar reason. The patch is probably harmless but it has the
potential to waste CPUs allocating or reclaiming from zones that will
never succeed.

-- 
Mel Gorman
SUSE Labs

