Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717E2ACA3C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 02:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22971.49500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcIEV-0002Rr-06; Tue, 10 Nov 2020 01:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22971.49500; Tue, 10 Nov 2020 01:14:02 +0000
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
	id 1kcIEU-0002RS-T0; Tue, 10 Nov 2020 01:14:02 +0000
Received: by outflank-mailman (input) for mailman id 22971;
 Tue, 10 Nov 2020 01:14:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywAc=EQ=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kcIET-0002QG-26
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 01:14:01 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ad943a-5243-4351-a500-5dfd80e08e76;
 Tue, 10 Nov 2020 01:13:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ywAc=EQ=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kcIET-0002QG-26
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 01:14:01 +0000
X-Inumbo-ID: 02ad943a-5243-4351-a500-5dfd80e08e76
Received: from galois.linutronix.de (unknown [193.142.43.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 02ad943a-5243-4351-a500-5dfd80e08e76;
	Tue, 10 Nov 2020 01:13:58 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1604970836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
	b=DRjXCHfaWTV+37wSriT1BjBgrVPE6jdQ5QSgYOIapfxJkFIwaFOAyxB9axkmnF7jwFoYyj
	IwVALzvZ0PuA7RxNph9leDCS6B9rTa4rL3nKcIBy/Am24PTMh01e/A2SQWp6LTkOQfBaj6
	TPNYDFf29DCqNiv3sgD8nE6enYeIlsYkCGyKDzwB1FGN01/Y3vKoJQtpchwkYWrvNb9W70
	4PCnBA8S0oYM/XwkwwZotKzR9vmT9oC6FdGvh5lMI1bLUaS0qdB+ZPTGprUeJSBjnvH0Xv
	xyRk7zOTS6b0OUuDBNt+X1xYcMB1KSB7gGowiPoSA5hPR5omsqQ5g20Kt4+uKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1604970836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
	b=acv/dHWHYYmtT1/z0brDNSAmBtlvEk8c07ItXmS/RUDap25yEm8biO9jTMWItRsTlNRTeF
	x/KI3sqvslL8SkDg==
To: ira.weiny@intel.com, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, kexec@lists.infradead.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-efi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-aio@kvack.org, io-uring@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-ntfs-dev@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
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
In-Reply-To: <20201009195033.3208459-6-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-6-ira.weiny@intel.com>
Date: Tue, 10 Nov 2020 02:13:56 +0100
Message-ID: <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Ira,

On Fri, Oct 09 2020 at 12:49, ira weiny wrote:
> From: Ira Weiny <ira.weiny@intel.com>
>
> To correctly support the semantics of kmap() with Kernel protection keys
> (PKS), kmap() may be required to set the protections on multiple
> processors (globally).  Enabling PKS globally can be very expensive
> depending on the requested operation.  Furthermore, enabling a domain
> globally reduces the protection afforded by PKS.
>
> Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
> have no need for the protection domain to be enabled globally.  However, the
> remaining callers do not follow this pattern and, as best I can tell, expect
> the mapping to be 'global' and available to any thread who may access the
> mapping.[1]
>
> We don't anticipate global mappings to pmem, however in general there is a
> danger in changing the semantics of kmap().  Effectively, this would cause an
> unresolved page fault with little to no information about why the failure
> occurred.
>
> To resolve this a number of options were considered.
>
> 1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
> 2) Introduce a flags parameter to kmap() to indicate if the mapping should be
>    global or not
> 3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
>    global enablement of the pages.
> 4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
>    be used within that thread of execution only
>
> Option 1 is simply not feasible.  Option 2 would require all of the call sites
> of kmap() to change.  Option 3 seems like a good minimal change but there is a
> danger that new code may miss the semantic change of kmap() and not get the
> behavior the developer intended.  Therefore, #4 was chosen.

There is Option #5:

Convert the thread local kmap() invocations to the proposed kmap_local()
interface which is coming along [1].

That solves a couple of issues:

 1) It relieves the current kmap_atomic() usage sites from the implict
    pagefault/preempt disable semantics which apply even when
    CONFIG_HIGHMEM is disabled. kmap_local() still can be invoked from
    atomic context.

 2) Due to #1 it allows to replace the conditional usage of kmap() and
    kmap_atomic() for purely thread local mappings.

 3) It puts the burden on the HIGHMEM inflicted systems

 4) It is actually more efficient for most of the pure thread local use
    cases on HIGHMEM inflicted systems because it avoids the overhead of
    the global lock and the potential kmap slot exhaustion. A potential
    preemption will be more expensive, but that's not really the case we
    want to optimize for.

 5) It solves the RT issue vs. kmap_atomic()

So instead of creating yet another variety of kmap() which is just
scratching the particular PKRS itch, can we please consolidate all of
that on the wider reaching kmap_local() approach?

Thanks,

        tglx
     
[1] https://lore.kernel.org/lkml/20201103092712.714480842@linutronix.de/


