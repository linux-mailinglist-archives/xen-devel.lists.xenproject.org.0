Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF9733B07
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550437.859527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGDX-0003K1-5c; Fri, 16 Jun 2023 20:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550437.859527; Fri, 16 Jun 2023 20:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGDX-0003I4-26; Fri, 16 Jun 2023 20:38:47 +0000
Received: by outflank-mailman (input) for mailman id 550437;
 Fri, 16 Jun 2023 20:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w10Q=CE=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1qAGDU-0003Hs-NT
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:38:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8246219-0c85-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 22:38:43 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qAGD7-009Lj7-EI; Fri, 16 Jun 2023 20:38:21 +0000
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
X-Inumbo-ID: c8246219-0c85-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fw74FAZhkocnJnJyLR/WQNNOz26kiObyhL++hGG0nWw=; b=QBNdm8qv6j/A/iWrMKfpB6M7G8
	dX02GHdjAg9rPGckqaKAq0nuLHgnEOZOUcT5iS1KFKrWFBJlTrkF2I4g5N2YgCfsexrQECwyFoHPp
	z6yd+/vIl/PequagU7pGV8UNE2yhdOrdkDT+t3SJSVONZj6Q1cQWhoxiK+7FUVh/Fb17OdOH8kjtt
	OWIuj2P4ze5K/i70TfCVLOSJSXO+Ry9WEoIoy6BlMNh0EJ1wlu/c8zXDIuEPPIicVlz2AV+6m8LDv
	lA4vOEDBJYuPKGoF8lu2OSuuFhx10iSF/LiB0UcYpqrALuMFJM02PbH03w+/bd9OLb/nrxdqasmpe
	J/m6D//w==;
Date: Fri, 16 Jun 2023 21:38:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
Message-ID: <ZIzIPQBXvnMtQekj@casper.infradead.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com>
 <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>

On Thu, Jun 15, 2023 at 12:57:19AM -0700, Hugh Dickins wrote:
> Probably just trivial collisions in most architectures, which either
> of us can easily adjust to the other; powerpc likely to be more awkward,
> but fairly easily resolved; s390 quite a problem.
> 
> I've so far been unable to post a v2 of my series (and powerpc and s390
> were stupidly wrong in the v1), because a good s390 patch is not yet
> decided - Gerald Schaefer and I are currently working on that, on the
> s390 list (I took off most Ccs until we are settled and I can post v2).
> 
> As you have no doubt found yourself, s390 has sophisticated handling of
> free half-pages already, and I need to add rcu_head usage in there too:
> it's tricky to squeeze it all in, and ptdesc does not appear to help us
> in any way (though mostly it's just changing some field names, okay).
> 
> If ptdesc were actually allowing a flexible structure which architectures
> could add into, that would (in some future) be nice; but of course at
> present it's still fitting it all into one struct page, and mandating
> new restrictions which just make an architecture's job harder.

The intent is to get ptdescs to be dynamically allocated at some point
in the ~2-3 years out future when we have finished the folio project ...
which is not a terribly helpful thing for me to say.

I have three suggestions, probably all dreadful:

1. s390 could change its behaviour to always allocate page tables in
pairs.  That is, it fills in two pmd_t entries any time it takes a fault
in either of them.

2. We could allocate two or four pages at a time for s390 to allocate
2kB pages from.  That gives us a lot more space to store RCU heads.

3. We could use s390 as a guinea-pig for dynamic ptdesc allocation.
Every time we allocate a struct page, we have a slab cache for an
s390-special definition of struct ptdesc, we allocate a ptdesc and store
a pointer to that in compound_head.

We could sweeten #3 by doing that not just for s390 but also for every
configuration which has ALLOC_SPLIT_PTLOCKS today.  That would get rid
of the ambiguity between "is ptl a pointer or a lock".

> But I've no desire to undo powerpc's use of pt_frag_refcount:
> just warning that we may want to undo any use of it in s390.

I would dearly love ppc & s390 to use the _same_ scheme to solve the
same problem.

