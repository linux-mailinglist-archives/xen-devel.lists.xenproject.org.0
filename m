Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE028C1C4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 21:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6017.15747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS3tR-0005kZ-EX; Mon, 12 Oct 2020 19:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6017.15747; Mon, 12 Oct 2020 19:54:01 +0000
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
	id 1kS3tR-0005kA-BK; Mon, 12 Oct 2020 19:54:01 +0000
Received: by outflank-mailman (input) for mailman id 6017;
 Mon, 12 Oct 2020 19:53:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kS3tP-0005jz-JN
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 19:53:59 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e7fdfb-8787-40eb-af15-5ee5c7ffaa6b;
 Mon, 12 Oct 2020 19:53:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 12:53:56 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 12:53:54 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kS3tP-0005jz-JN
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 19:53:59 +0000
X-Inumbo-ID: 05e7fdfb-8787-40eb-af15-5ee5c7ffaa6b
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 05e7fdfb-8787-40eb-af15-5ee5c7ffaa6b;
	Mon, 12 Oct 2020 19:53:57 +0000 (UTC)
IronPort-SDR: n76ml+Lh/mxdJ/ZqnzGph4iG6/stFlHRZRh+D6Fm5ILZbTNtYD9klDu1H+GIcodF01kPL1mPuR
 58DhqwNLc/PQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="162328382"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="162328382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 12:53:56 -0700
IronPort-SDR: fkO3cV1AstS50IlWJFeIR7IMIWTUvxOVu0RxBH9tBAb2aFjzmjvlioAsa4gAQcEu3X0zxNtHVX
 KqidbmrXoAPg==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="530096227"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 12:53:54 -0700
Date: Mon, 12 Oct 2020 12:53:54 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Eric Biggers <ebiggers@kernel.org>,
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
Message-ID: <20201012195354.GC2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
 <20201012161946.GA858@sol.localdomain>
 <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
 <20201012164438.GA20115@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012164438.GA20115@casper.infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Mon, Oct 12, 2020 at 05:44:38PM +0100, Matthew Wilcox wrote:
> On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> > kmap_atomic() is always preferred over kmap()/kmap_thread().
> > kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> > always CPU-local and never broadcast.
> > 
> > So, basically, unless you *must* sleep while the mapping is in place,
> > kmap_atomic() is preferred.
> 
> But kmap_atomic() disables preemption, so the _ideal_ interface would map
> it only locally, then on preemption make it global.  I don't even know
> if that _can_ be done.  But this email makes it seem like kmap_atomic()
> has no downsides.

And that is IIUC what Thomas was trying to solve.

Also, Linus brought up that kmap_atomic() has quirks in nesting.[1]

From what I can see all of these discussions support the need to have something
between kmap() and kmap_atomic().

However, the reason behind converting call sites to kmap_thread() are different
between Thomas' patch set and mine.  Both require more kmap granularity.
However, they do so with different reasons and underlying implementations but
with the _same_ resulting semantics; a thread local mapping which is
preemptable.[2]  Therefore they each focus on changing different call sites.

While this patch set is huge I think it serves a valuable purpose to identify a
large number of call sites which are candidates for this new semantic.

Ira

[1] https://lore.kernel.org/lkml/CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com/
[2] It is important to note these implementations are not incompatible with
each other.  So I don't see yet another 'kmap_something()' being required.

