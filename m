Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB2289CC4
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 02:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5247.13727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR2wJ-000535-Vl; Sat, 10 Oct 2020 00:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5247.13727; Sat, 10 Oct 2020 00:40:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR2wJ-00052g-S5; Sat, 10 Oct 2020 00:40:47 +0000
Received: by outflank-mailman (input) for mailman id 5247;
 Sat, 10 Oct 2020 00:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu9P=DR=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kR2wG-00052V-C6
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 00:40:45 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35d94951-08dd-4aa4-8d80-9d434c9fb9a2;
 Sat, 10 Oct 2020 00:40:41 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kR2vS-0004My-FJ; Sat, 10 Oct 2020 00:39:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Xu9P=DR=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kR2wG-00052V-C6
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 00:40:45 +0000
X-Inumbo-ID: 35d94951-08dd-4aa4-8d80-9d434c9fb9a2
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35d94951-08dd-4aa4-8d80-9d434c9fb9a2;
	Sat, 10 Oct 2020 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wylOEgAZGPAkxCdlobMzyIfu/ZrVv1Os6TQldUFLziM=; b=F41ki3gR7FBgwnVausn+Ym7HP1
	XlPOrKIoC49hpvUE9/aWBoH68sW9nzN+roolJxog6JtW0hinw+GJGJQweM2tJ1u8x4huOElOun4HX
	OLG5RHoBoAf3CSIzFNHpVgsRU+TgTIZh4srysDUduyMdIIxPlPK5JA/amN/knuZnCqa9Zv6UObB0o
	hZnMFz1K/YCtH1pW7cz6Th6CIA0I8ero69lmDRA42tDkhymN2BfqXsEeqYlbw/xTqpsZhH92AuKGR
	+ciamleDZuZCDFfE/FcJg9XsXU418hEml49KDOM/rl5J3rO0lFNTAWXDAV5Z24k3Ay+VgEnmqYlhx
	rI3nBVLQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR2vS-0004My-FJ; Sat, 10 Oct 2020 00:39:54 +0000
Date: Sat, 10 Oct 2020 01:39:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: ira.weiny@intel.com, Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-aio@kvack.org,
	linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, ecryptfs@vger.kernel.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
Message-ID: <20201010003954.GW20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009213434.GA839@sol.localdomain>

On Fri, Oct 09, 2020 at 02:34:34PM -0700, Eric Biggers wrote:
> On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > The kmap() calls in this FS are localized to a single thread.  To avoid
> > the over head of global PKRS updates use the new kmap_thread() call.
> >
> > @@ -2410,12 +2410,12 @@ static inline struct page *f2fs_pagecache_get_page(
> >  
> >  static inline void f2fs_copy_page(struct page *src, struct page *dst)
> >  {
> > -	char *src_kaddr = kmap(src);
> > -	char *dst_kaddr = kmap(dst);
> > +	char *src_kaddr = kmap_thread(src);
> > +	char *dst_kaddr = kmap_thread(dst);
> >  
> >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > -	kunmap(dst);
> > -	kunmap(src);
> > +	kunmap_thread(dst);
> > +	kunmap_thread(src);
> >  }
> 
> Wouldn't it make more sense to switch cases like this to kmap_atomic()?
> The pages are only mapped to do a memcpy(), then they're immediately unmapped.

Maybe you missed the earlier thread from Thomas trying to do something
similar for rather different reasons ...

https://lore.kernel.org/lkml/20200919091751.011116649@linutronix.de/

