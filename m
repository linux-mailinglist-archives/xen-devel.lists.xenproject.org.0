Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D2711893
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539878.841189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2I1P-0007xG-RQ; Thu, 25 May 2023 20:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539878.841189; Thu, 25 May 2023 20:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2I1P-0007vb-OI; Thu, 25 May 2023 20:57:19 +0000
Received: by outflank-mailman (input) for mailman id 539878;
 Thu, 25 May 2023 20:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjAG=BO=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1q2I1N-0007vU-CN
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:57:18 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba03550e-fb3e-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 22:57:15 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q2I19-00DAXr-9n; Thu, 25 May 2023 20:57:03 +0000
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
X-Inumbo-ID: ba03550e-fb3e-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w/nv11jmZL//tzZgnsZQ422wtTnnU+GBTr8mcjZt+5o=; b=jz222m+qmkx46CtsL2SK6imku3
	qq2pJIrpZYwwtoNlBcZF7Fk0xlPqceK3lGx9yfcEP5je3dxHl9hetkE+18QuDijP55CEPQoODBYNI
	uvYKUPiKzBlONmhR187tH+srkvPeqkL343XpLTCXJPsX8gyRZRXys5FShMS4Kw48PvGIyNIrdiJob
	qzWNUEmQ7TjGXaPWTNoBqzaR0fCIqDhz5vX5aceLEg5RLyYCA0NTJNp94Q35H+/kQzQkdBPbuLfU0
	BUQp3kv2YpGE9fMQX8b3xVpJANGw8phzZpM8mq6dy60BHa+pYvxVMkKbTWE80Y8Sdq1m5IiayRsFG
	t/mQy7HA==;
Date: Thu, 25 May 2023 21:57:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <ZG/Ln0Nf/Zx//EQk@casper.infradead.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
 <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
 <20230525202011.GZ4967@kernel.org>
 <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>

On Thu, May 25, 2023 at 01:38:54PM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 1:20 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> > > On Thu, May 25, 2023 at 1:56 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > > > > No folio equivalents for page type operations have been defined, so
> > > > > define them for later folio conversions.
> > > >
> > > > Can you please elaborate why would we need folios for page table descriptors?
> > >
> > > Thanks for the review!
> > >
> > > These macros are for callers that care about the page type, i.e. Table and
> > > Buddy. Aside from accounting for those cases, the page tables don't use folios.
> > > These are more for the cleanliness of those callers.
> >
> > But why using folio APIs for PageType will be cleaner than using page APIs?
> > Do you have an example?
> 
> Ah, for example in mm/memory-failure.c there are a couple uses of PageTable.
> Like the line :
> if (folio_test_slab(folio) || PageTable(&folio->page) ||
> folio_test_reserved(folio))
> where that PageTable(&folio->page) can now be written as folio_test_table(folio)
> instead.
> 
> Also there are numerous uses of PageBuddy in mm/compaction.c that will
> likely need to be converted to folios as well.

... and you can currently call PageTable() on the second/third/... page
of an allocation and it will return false, regardless of what the
first page is typed as.  For most architectures, this doesn't matter,
but /proc/kpageflags will underreport the amount of memory allocated
as page tables on architectures which use multi-page allocations for
their page tables as there's currently absolutely nothing to indicate
the size of the allocation.

To fix this, we need to use __GFP_COMP.

