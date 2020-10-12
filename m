Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470AC28AE9C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 08:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5800.15075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRrlE-0006Ix-CV; Mon, 12 Oct 2020 06:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5800.15075; Mon, 12 Oct 2020 06:56:44 +0000
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
	id 1kRrlE-0006IY-9D; Mon, 12 Oct 2020 06:56:44 +0000
Received: by outflank-mailman (input) for mailman id 5800;
 Mon, 12 Oct 2020 06:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kRrlC-0006IT-Jw
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 06:56:42 +0000
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 801ca88d-ed0c-4fd4-a78a-bb43fb6a4bf3;
 Mon, 12 Oct 2020 06:56:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 23:56:37 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 23:56:35 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kRrlC-0006IT-Jw
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 06:56:42 +0000
X-Inumbo-ID: 801ca88d-ed0c-4fd4-a78a-bb43fb6a4bf3
Received: from mga04.intel.com (unknown [192.55.52.120])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 801ca88d-ed0c-4fd4-a78a-bb43fb6a4bf3;
	Mon, 12 Oct 2020 06:56:41 +0000 (UTC)
IronPort-SDR: leJH/l1opPoVIuQPF8tu1d0ELtmPxDn3WakRMzOtB4zHZxOlPLqLu6sTQfOKjkYfksWCnDtd0i
 Nq+Fm38lLwdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="163059282"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="163059282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 23:56:37 -0700
IronPort-SDR: DSpSIoZKV7KPLq4zxFvBA+ZLKNkpgmuUQCwMmUi8wsqk6OFxxWBKXoVpyUUZRY9EN2DChpPczf
 4EPhWIQlBVGQ==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="529842687"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 23:56:35 -0700
Date: Sun, 11 Oct 2020 23:56:35 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010013036.GD1122@sol.localdomain>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Fri, Oct 09, 2020 at 06:30:36PM -0700, Eric Biggers wrote:
> On Sat, Oct 10, 2020 at 01:39:54AM +0100, Matthew Wilcox wrote:
> > On Fri, Oct 09, 2020 at 02:34:34PM -0700, Eric Biggers wrote:
> > > On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > > > The kmap() calls in this FS are localized to a single thread.  To avoid
> > > > the over head of global PKRS updates use the new kmap_thread() call.
> > > >
> > > > @@ -2410,12 +2410,12 @@ static inline struct page *f2fs_pagecache_get_page(
> > > >  
> > > >  static inline void f2fs_copy_page(struct page *src, struct page *dst)
> > > >  {
> > > > -	char *src_kaddr = kmap(src);
> > > > -	char *dst_kaddr = kmap(dst);
> > > > +	char *src_kaddr = kmap_thread(src);
> > > > +	char *dst_kaddr = kmap_thread(dst);
> > > >  
> > > >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > > > -	kunmap(dst);
> > > > -	kunmap(src);
> > > > +	kunmap_thread(dst);
> > > > +	kunmap_thread(src);
> > > >  }
> > > 
> > > Wouldn't it make more sense to switch cases like this to kmap_atomic()?
> > > The pages are only mapped to do a memcpy(), then they're immediately unmapped.
> > 
> > Maybe you missed the earlier thread from Thomas trying to do something
> > similar for rather different reasons ...
> > 
> > https://lore.kernel.org/lkml/20200919091751.011116649@linutronix.de/
> 
> I did miss it.  I'm not subscribed to any of the mailing lists it was sent to.
> 
> Anyway, it shouldn't matter.  Patchsets should be standalone, and not require
> reading random prior threads on linux-kernel to understand.

Sorry, but I did not think that the discussion above was directly related.  If
I'm not mistaken, Thomas' work was directed at relaxing kmap_atomic() into
kmap_thread() calls.  While interesting, it is not the point of this series.  I
want to restrict kmap() callers into kmap_thread().

For this series it was considered to change the kmap_thread() call sites to
kmap_atomic().  But like I said in the cover letter kmap_atomic() is not the
same semantic.  It is too strict.  Perhaps I should have expanded that
explanation.

> 
> And I still don't really understand.  After this patchset, there is still code
> nearly identical to the above (doing a temporary mapping just for a memcpy) that
> would still be using kmap_atomic().

I don't understand.  You mean there would be other call sites calling:

kmap_atomic()
memcpy()
kunmap_atomic()

?

> Is the idea that later, such code will be
> converted to use kmap_thread() instead?  If not, why use one over the other?
 

The reason for the new call is that with PKS added behind kmap we have 3 levels
of mapping we want.

global kmap (can span threads and sleep)
'thread' kmap (can sleep but not span threads)
'atomic' kmap (can't sleep nor span threads [by definition])

As Matthew said perhaps 'global kmaps' may be best changed to vmaps?  I just
don't know the details of every call site.

And since I don't know the call site details if there are kmap_thread() calls
which are better off as kmap_atomic() calls I think it is worth converting
them.  But I made the assumption that kmap users would already be calling
kmap_atomic() if they could (because it is more efficient).

Ira

