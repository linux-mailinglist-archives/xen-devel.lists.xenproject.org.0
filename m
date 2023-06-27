Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B323740031
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 17:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556191.868510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEB4X-00041M-P1; Tue, 27 Jun 2023 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556191.868510; Tue, 27 Jun 2023 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEB4X-0003yf-Lw; Tue, 27 Jun 2023 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 556191;
 Tue, 27 Jun 2023 15:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHsK=CP=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1qEB4V-0003yZ-1G
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 15:57:39 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5550bb70-1503-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 17:57:36 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qEB4A-002rlX-EZ; Tue, 27 Jun 2023 15:57:18 +0000
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
X-Inumbo-ID: 5550bb70-1503-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=grdde8Xiu7qmn+xeWQjS6jhM9eMOIEx2FTKQKHA0qcE=; b=O4LgnaJa+96/pjOun/grMWRgf0
	LntDzHo/Nz16KvqxiEr1HwXvA//H8Xwaltp+tupPUb4EjOFyVKwNxLm4bicLOTqp/7aKDRUtZ+Ti+
	YkZNFYgufWM7VfJ37zBwafjppANl7Ov4YfJ/3SNrxho42WxRJ90YRkLRkEz9110OQT69JgyQix3bE
	1UUN6JmWKzg8Bc5AERWCg8k1In+54bOFEIjoHmAhuJ48uTlyrsgS9ASEoWWfFX2oCx8vHeEKiHBK2
	0ATl5M0lbW4dygkvrSWQNrInCol2nuI3Fn1fE8BBqWu2s6F5FIZzUwvO8Dgsb04PN8JGsMx2K7RYi
	V5QQ1b6Q==;
Date: Tue, 27 Jun 2023 16:57:18 +0100
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
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
Message-ID: <ZJsG3oMF+FaH0iMw@casper.infradead.org>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <e8992eee-4140-427e-bacb-9449f346318@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8992eee-4140-427e-bacb-9449f346318@google.com>

On Mon, Jun 26, 2023 at 09:44:08PM -0700, Hugh Dickins wrote:
> On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> 
> > The MM subsystem is trying to shrink struct page. This patchset
> > introduces a memory descriptor for page table tracking - struct ptdesc.
> ...
> >  39 files changed, 686 insertions(+), 455 deletions(-)
> 
> I don't see the point of this patchset: to me it is just obfuscation of
> the present-day tight relationship between page table and struct page.
> 
> Matthew already explained:
> 
> > The intent is to get ptdescs to be dynamically allocated at some point
> > in the ~2-3 years out future when we have finished the folio project ...
> 
> So in a kindly mood, I'd say that this patchset is ahead of its time.
> But I can certainly adapt to it, if everyone else sees some point to it.

If you think this patchset is ahead of its time, we can certainly put
it on hold.  We're certainly prepared to redo it to be merged after your
current patch series.

I think you can see the advantage of the destination, so I don't think
you're against that.  Are you opposed to the sequencing of the work to
get us there?  I'd be happy to discuss another way to do it.

For example, we could dynamically allocate ptdescs right now.  We'd get
the benefit of having an arbitrary amount of space in the ptdesc,
although not the benefit of a smaller memmap until everything else is
also dynamically allocated.

