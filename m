Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD536D835
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119348.225802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbk9h-00079G-1R; Wed, 28 Apr 2021 13:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119348.225802; Wed, 28 Apr 2021 13:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbk9g-00078r-UQ; Wed, 28 Apr 2021 13:23:04 +0000
Received: by outflank-mailman (input) for mailman id 119348;
 Wed, 28 Apr 2021 13:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lbk9f-00078k-QP
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbk9d-0005zk-2t; Wed, 28 Apr 2021 13:23:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lbk9c-0003dv-Kt; Wed, 28 Apr 2021 13:23:01 +0000
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
	bh=lY8qDKZUompIliZ1J3+wYZpeMeyzjOh6pnesKoSHdAM=; b=E4O1kezxm00KbkqR1I1vDZAmCz
	uu4dQk2iLBHr/gvhP83toyXhRerxm383U87/h9kIQlxzXf903JgXOrKkueWtJhNFiJJsLxYIMi2uP
	IY/G5TVo8LHJHs6nPITPiovPD69GMozik8YFIXDuj2XeYuWa1/CpezdrFM2MtLT4Ln04=;
Message-ID: <4317b9a308cce76de8c75288d41af9dde10cbe6e.camel@xen.org>
Subject: Re: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there
 is no direct map
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 28 Apr 2021 14:22:57 +0100
In-Reply-To: <1edc8d66-ca10-8e90-d8e8-2e299ef715d7@suse.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
	 <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
	 <a1bd2c72-1310-f018-dda5-90521be03fe4@suse.com>
	 <943480f695052163b540919c9c55655e5b4f741a.camel@xen.org>
	 <1edc8d66-ca10-8e90-d8e8-2e299ef715d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-04-28 at 13:51 +0200, Jan Beulich wrote:
> On 28.04.2021 13:04, Hongyan Xia wrote:
> > On Thu, 2021-04-22 at 14:31 +0200, Jan Beulich wrote:
> > > As I don't think we have many cases where code actually depends
> > > on
> > > being able to apply __va() (or equivalent) to the address
> > > returned
> > > from alloc_xenheap_pages(), I think this should instead involve
> > > vmap(), with the vmap area drastically increased (perhaps taking
> > > all
> > > of the space the direct map presently consumes). For any
> > > remaining
> > > users of __va() or alike these should perhaps be converted into
> > > an
> > > alias / derivation of vmap_to_{mfn,page}() then.
> > 
> > That's true, and this was my first implementation (and also Wei's
> > original proposal) which worked okay. But, several problems got in
> > the
> > way.
> > 
> > 1. Partial unmap. Biggest offender is xmalloc which allocates and
> > could
> > then free part of it, which means we need to be able to partially
> > unmap
> > the region. vmap() does not support this.
> 
> If the direct map went fully away, and hence if Xen heap pages got
> vmap()-ed, there's no reason to keep xmalloc() from forwarding to
> vmalloc() instead of going this partial-unmap route.
> 
> > 2. Fast PA->VA. There is currently no way to go from PA to VA in
> > vmapped pages, unless we somehow repurpose or add new fields in
> > page_info. Also, VA->PA is possible but very slow now. There is not
> > much PA->VA in the critical path but see 3.
> 
> There would better not be any PA->VA. Can you point out examples
> where it would be hard to avoid using such? I also don't see the
> connection to 3 - is EPT code using PA->VA a lot? p2m-ept.c does
> not look to have a single use of __va() or ..._to_virt().

p2m does not have any __va(), but my performance results showed that
mapping and unmapping EPT when there is no direct map was incredibly
slow, hence why I moved EPT to xenheap in my local branch, which uses
__va().

> See my proposal to defer unmapping of the domain's own pages
> (and I would consider the p2m pages to be part of the domain's
> ones for this purpose). In fact, since the p2m pages come from a
> fixed, separate pool I wonder whether the entire pool couldn't
> be mapped in e.g. the per-domain VA range.

I thought about that as well, not just EPT but a lot of domain-private
pages can be moved to the per-domain range, and the secrets are hidden
by virtue of cr3 switches when switching to other domains. But still we
have the problem of quickly finding PA->VA (I don't mean __va(), I mean
finding the VA that can access a page table page) for EPT walks.

Mapping in bigger pages should work wonders for pre-partitioned guests
where we know the guest mostly just has contiguous physical memory and
a superpage map probably covers all pages in an HVM 2-level walk. But
for a generic solution where domain memory can be really fragmented
(and context switches can happen a lot on a pCPU), how can we quickly
find PA->VA in EPT walking without some intrusive changes to Xen? Of
course, if we do not allow the HAP pool to change and force the HAP
pool to be physically contiguous, we can just remember the base VA of
its vmapped region for quick PA->VA, but I don't think this is a
generic solution.

Am I missing anything?

Hongyan


