Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE795763946
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570513.892341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfbC-0000t3-ET; Wed, 26 Jul 2023 14:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570513.892341; Wed, 26 Jul 2023 14:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfbC-0000qF-BU; Wed, 26 Jul 2023 14:34:46 +0000
Received: by outflank-mailman (input) for mailman id 570513;
 Wed, 26 Jul 2023 14:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AABE=DM=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1qOfbA-0000pZ-D5
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:34:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f29fde8-2bc1-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 16:34:43 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qOfaj-006ZNN-Ab; Wed, 26 Jul 2023 14:34:17 +0000
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
X-Inumbo-ID: 8f29fde8-2bc1-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LsxQl+7lQmIvtLS3uUz+2Tc5wtoeEEVBoFirY9Yb6fg=; b=NgbwQpzKHdyAWsUCxnsImKimDt
	jHF2WmVqPjDVwWh4+qnqFx9EB6EzhJPFMjClBGjD6Hvhy3cDKu8QpNdQ/vu4YdRehqVe79OoriWgn
	rYVzFWxwc/SS+7+suUkf1PvWW2cp4TLFdh0VHNZVCP6elPEQsoL4zq+DlNr+Vsyy6zVTCVD4+BPLu
	7MT7tbbN4QAXyKU4tauvNJ5ES+/Xow+YcL4kRLee8APN/cRVWSBVwKBSDtrmdoa20ei7j/6b/nKQ6
	9EjL4wZbYuEHOXjGbdk1LQrEamw4aC90nEjbS99sxd1PPE9PWCMbzElXWmFd7Um+DcVnLHPQet+QT
	TJw896fg==;
Date: Wed, 26 Jul 2023 15:34:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"David S. Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH mm-unstable v7 00/31] Split ptdesc from struct page
Message-ID: <ZMEu6VcTqPj69bQ7@casper.infradead.org>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
 <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>

On Mon, Jul 24, 2023 at 09:41:36PM -0700, Hugh Dickins wrote:
> On Mon, 24 Jul 2023, Vishal Moola (Oracle) wrote:
> 
> > The MM subsystem is trying to shrink struct page. This patchset
> > introduces a memory descriptor for page table tracking - struct ptdesc.
> > 
> > This patchset introduces ptdesc, splits ptdesc from struct page, and
> > converts many callers of page table constructor/destructors to use ptdescs.
> > 
> > Ptdesc is a foundation to further standardize page tables, and eventually
> > allow for dynamic allocation of page tables independent of struct page.
> > However, the use of pages for page table tracking is quite deeply
> > ingrained and varied across archictectures, so there is still a lot of
> > work to be done before that can happen.
> 
> Others may differ, but it remains the case that I see no point to this
> patchset, until the minimal descriptor that replaces struct page is
> working, and struct page then becomes just overhead.  Until that time,
> let architectures continue to use struct page as they do - whyever not?

Because it's easier for architecture maintainers to understand what they
should and shouldn't be using.  Look at the definition:

+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct rcu_head pt_rcu_head;
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long __page_mapping;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+	};
+
+	union {
+		unsigned long _pt_pad_2;
+#if ALLOC_SPLIT_PTLOCKS
+		spinlock_t *ptl;
+#else
+		spinlock_t ptl;
+#endif
+	};
+	unsigned int __page_type;
+	atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long pt_memcg_data;
+#endif
+};

It's still a 31-line struct definition, I'll grant you.  But it's far
easier to comprehend than the definition of struct page (~140 lines).
An architecture maintainer can look at it and see what might be available,
and what is already used.  And hopefully we'll have less "Oh, I'll just
use page->private".  It's really not fair to expect arch maintainers to
learn so much about the mm.

It's still messier than I would like, but I don't think we can do better
for now.  I don't understand why you're so interested in delaying doing
this work.

