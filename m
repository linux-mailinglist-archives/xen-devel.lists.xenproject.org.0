Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883972ACED4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 06:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23001.49523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcLlD-0005K2-Ga; Tue, 10 Nov 2020 05:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23001.49523; Tue, 10 Nov 2020 05:00:03 +0000
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
	id 1kcLlD-0005Fq-9a; Tue, 10 Nov 2020 05:00:03 +0000
Received: by outflank-mailman (input) for mailman id 23001;
 Tue, 10 Nov 2020 05:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UHDj=EQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kcLlB-00050T-Px
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 05:00:01 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68bccc73-eb04-47a8-aab5-b48abcf54fb1;
 Tue, 10 Nov 2020 04:59:58 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 20:59:55 -0800
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 20:59:54 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UHDj=EQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kcLlB-00050T-Px
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 05:00:01 +0000
X-Inumbo-ID: 68bccc73-eb04-47a8-aab5-b48abcf54fb1
Received: from mga07.intel.com (unknown [134.134.136.100])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 68bccc73-eb04-47a8-aab5-b48abcf54fb1;
	Tue, 10 Nov 2020 04:59:58 +0000 (UTC)
IronPort-SDR: k336O8cOJji5+GTaMOdyb4xTebDXuySbCXlqcK9MtBhrXtbk9XOxGTnCmVgcpK8b5s/HdwOdzz
 2W2AmJLU1mMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234085725"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="234085725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 20:59:55 -0800
IronPort-SDR: hhtGbVHiYEduO62f/jUORNlQE29+PA61IlKuvPXTtZvvOlHxHT75TW+y4i0J9B1O2lrgZ7K2Sp
 gskiAxl5TCew==
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="531063331"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 20:59:54 -0800
Date: Mon, 9 Nov 2020 20:59:54 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org,
	linux-efi@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-aio@kvack.org,
	io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 05/58] kmap: Introduce k[un]map_thread
Message-ID: <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-6-ira.weiny@intel.com>
 <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Tue, Nov 10, 2020 at 02:13:56AM +0100, Thomas Gleixner wrote:
> Ira,
> 
> On Fri, Oct 09 2020 at 12:49, ira weiny wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > To correctly support the semantics of kmap() with Kernel protection keys
> > (PKS), kmap() may be required to set the protections on multiple
> > processors (globally).  Enabling PKS globally can be very expensive
> > depending on the requested operation.  Furthermore, enabling a domain
> > globally reduces the protection afforded by PKS.
> >
> > Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
> > have no need for the protection domain to be enabled globally.  However, the
> > remaining callers do not follow this pattern and, as best I can tell, expect
> > the mapping to be 'global' and available to any thread who may access the
> > mapping.[1]
> >
> > We don't anticipate global mappings to pmem, however in general there is a
> > danger in changing the semantics of kmap().  Effectively, this would cause an
> > unresolved page fault with little to no information about why the failure
> > occurred.
> >
> > To resolve this a number of options were considered.
> >
> > 1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
> > 2) Introduce a flags parameter to kmap() to indicate if the mapping should be
> >    global or not
> > 3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
> >    global enablement of the pages.
> > 4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
> >    be used within that thread of execution only
> >
> > Option 1 is simply not feasible.  Option 2 would require all of the call sites
> > of kmap() to change.  Option 3 seems like a good minimal change but there is a
> > danger that new code may miss the semantic change of kmap() and not get the
> > behavior the developer intended.  Therefore, #4 was chosen.
> 
> There is Option #5:

There is now yes.  :-D

> 
> Convert the thread local kmap() invocations to the proposed kmap_local()
> interface which is coming along [1].

I've been trying to follow that thread.

> 
> That solves a couple of issues:
> 
>  1) It relieves the current kmap_atomic() usage sites from the implict
>     pagefault/preempt disable semantics which apply even when
>     CONFIG_HIGHMEM is disabled. kmap_local() still can be invoked from
>     atomic context.
> 
>  2) Due to #1 it allows to replace the conditional usage of kmap() and
>     kmap_atomic() for purely thread local mappings.
> 
>  3) It puts the burden on the HIGHMEM inflicted systems
> 
>  4) It is actually more efficient for most of the pure thread local use
>     cases on HIGHMEM inflicted systems because it avoids the overhead of
>     the global lock and the potential kmap slot exhaustion. A potential
>     preemption will be more expensive, but that's not really the case we
>     want to optimize for.
> 
>  5) It solves the RT issue vs. kmap_atomic()
> 
> So instead of creating yet another variety of kmap() which is just
> scratching the particular PKRS itch, can we please consolidate all of
> that on the wider reaching kmap_local() approach?

Yes I agree.  We absolutely don't want more kmap*() calls and I was hoping to
dovetail into your kmap_local() work.[2]

I've pivoted away from this work a bit to clean up all the
kmap()/memcpy*()/kunmaps() as discussed elsewhere in the thread first.[3]  I
was hoping your work would land and then I could s/kmap_thread()/kmap_local()/
on all of these patches.

Also, we can convert the new memcpy_*_page() calls to kmap_local() as well.
[For now my patch just uses kmap_atomic().]

I've not looked at all of the patches in your latest version.  Have you
included converting any of the kmap() call sites?  I thought you were more
focused on converting the kmap_atomic() to kmap_local()?

Ira

> 
> Thanks,
> 
>         tglx
>      
> [1] https://lore.kernel.org/lkml/20201103092712.714480842@linutronix.de/

[2] https://lore.kernel.org/lkml/20201012195354.GC2046448@iweiny-DESK2.sc.intel.com/
[3] https://lore.kernel.org/lkml/20201009213434.GA839@sol.localdomain/
    https://lore.kernel.org/lkml/20201013200149.GI3576660@ZenIV.linux.org.uk/


