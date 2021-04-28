Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3836D610
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119225.225636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi04-0002HI-87; Wed, 28 Apr 2021 11:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119225.225636; Wed, 28 Apr 2021 11:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbi04-0002Gt-56; Wed, 28 Apr 2021 11:05:00 +0000
Received: by outflank-mailman (input) for mailman id 119225;
 Wed, 28 Apr 2021 11:04:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lbi02-0002Gm-Qp
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:04:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbhzz-0003hQ-LJ; Wed, 28 Apr 2021 11:04:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbhzz-00026Q-6P; Wed, 28 Apr 2021 11:04:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=69MVAyGcIfT3FsUHh/jvNeUT2ENrdkUxLG6OCXyG6fk=; b=QaNvjseb5/dS22R0e5rjWavcSF
	nQk5gdR1E8361Qc0T6yvXXlxFEGkDQ45LN8/fbM9lQ64KFnM65fOuTwsfDU7Qo7nJEcFZbb+95clb
	ziqcRCU3SgFATKg+C52OR1Ze1Fk9YSfvBvqKqORmg33oKnn+awpd/7UWxS1KPOb3ihqQ=;
Message-ID: <943480f695052163b540919c9c55655e5b4f741a.camel@xen.org>
Subject: Re: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there
 is no direct map
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 28 Apr 2021 12:04:51 +0100
In-Reply-To: <a1bd2c72-1310-f018-dda5-90521be03fe4@suse.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
	 <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
	 <a1bd2c72-1310-f018-dda5-90521be03fe4@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 14:31 +0200, Jan Beulich wrote:
> On 30.04.2020 22:44, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > When there is not an always-mapped direct map, xenheap allocations
> > need
> > to be mapped and unmapped on-demand.
> > 
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> This series has been left uncommented for far too long - I'm sorry.
> While earlier patches here are probably reasonable (but would likely
> need re-basing, so I'm not sure whether to try to get to look though
> them before that makes much sense),

No worries. This series depends on the domheap Xen page table
conversion series anyway (which was just fully merged. Thanks.). I will
re-base now since the dependency is resolved.

> As I don't think we have many cases where code actually depends on
> being able to apply __va() (or equivalent) to the address returned
> from alloc_xenheap_pages(), I think this should instead involve
> vmap(), with the vmap area drastically increased (perhaps taking all
> of the space the direct map presently consumes). For any remaining
> users of __va() or alike these should perhaps be converted into an
> alias / derivation of vmap_to_{mfn,page}() then.

That's true, and this was my first implementation (and also Wei's
original proposal) which worked okay. But, several problems got in the
way.

1. Partial unmap. Biggest offender is xmalloc which allocates and could
then free part of it, which means we need to be able to partially unmap
the region. vmap() does not support this.

2. Fast PA->VA. There is currently no way to go from PA to VA in
vmapped pages, unless we somehow repurpose or add new fields in
page_info. Also, VA->PA is possible but very slow now. There is not
much PA->VA in the critical path but see 3.

3. EPT. Mapping and unmapping EPT in HVM hypercalls and MMIO are so
many and so slow that it is probably not possible to keep them as
domheap pages due to the big performance drop after removing the direct
map. If we move them to xenheap pages on vmap, then this depends on 2
for page table walking.

In the end, I could not find a way that met all 3 above without massive
and intrusive changes. If there is a way, it certainly needs a design
document. The "on-demand" direct map solves all the problems without
breaking any APIs and is very easy to understand. We have been using
Xen without the direct map for a while now with this approach with
decent performance (in fact, you cannot tell that this is a Xen without
the direct map by just real-world benchmarks alone).

I too agree that this approach is a litte hacky and wastes a big chunk
of virtual address space. Definitely wants some discussion if a better
way can be found that solves the problems.

Thanks,
Hongyan


