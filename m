Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC828CC8D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6159.16270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIS5-00084p-1d; Tue, 13 Oct 2020 11:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6159.16270; Tue, 13 Oct 2020 11:26:45 +0000
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
	id 1kSIS4-00084M-UD; Tue, 13 Oct 2020 11:26:44 +0000
Received: by outflank-mailman (input) for mailman id 6159;
 Tue, 13 Oct 2020 11:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4xF=DU=casper.srs.infradead.org=batv+347c3dad313745b9998d+6260+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kSIS2-00083j-EX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:26:42 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6054b378-931c-45be-bfa8-50d2f3a59233;
 Tue, 13 Oct 2020 11:26:40 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSIR6-0001VK-7P; Tue, 13 Oct 2020 11:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=h4xF=DU=casper.srs.infradead.org=batv+347c3dad313745b9998d+6260+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kSIS2-00083j-EX
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:26:42 +0000
X-Inumbo-ID: 6054b378-931c-45be-bfa8-50d2f3a59233
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6054b378-931c-45be-bfa8-50d2f3a59233;
	Tue, 13 Oct 2020 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ap+vugPRXoOSJhloW5EJc9FGxy9ZwiLwbnG+7+pEMhA=; b=a/Sp1GZZiVtkIrsbDZFKKgQTkQ
	FS+JHTt9pp+5vCrBdk0ac5b7U8ZgZGFScrKiULCJv4PZD4wWqOSzzq06ZoGh/8vFLI33VuvYYBdii
	wZ4VlXJvl5fnmlD+q4pIJJmvrTs/0jX/FIDmEAYUX2+Mt6vIwB3sAbRYRgWIA8hB4i4EWyZuWPFOQ
	rIaV+GwSaVBgBLKvO/SsFSj7I46VHFxg38PLmJQ+Oh1DkRIQcIx5NIWLGcWnDXshQ14JMdlpURiF2
	LxyBxRGv+1Wkfh31jf6dzRr+U4xHgvz3PsshAxeZoaF0OQPY6Fl5VA2XZOxLonra6CTBCfgsfUBp/
	6eTYHzgA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSIR6-0001VK-7P; Tue, 13 Oct 2020 11:25:44 +0000
Date: Tue, 13 Oct 2020 12:25:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, x86@kernel.org,
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
Subject: Re: [PATCH RFC PKS/PMEM 24/58] fs/freevxfs: Utilize new kmap_thread()
Message-ID: <20201013112544.GA5249@infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-25-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009195033.3208459-25-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

> -	kaddr = kmap(pp);
> +	kaddr = kmap_thread(pp);
>  	memcpy(kaddr, vip->vii_immed.vi_immed + offset, PAGE_SIZE);
> -	kunmap(pp);
> +	kunmap_thread(pp);

You only Cced me on this particular patch, which means I have absolutely
no idea what kmap_thread and kunmap_thread actually do, and thus can't
provide an informed review.

That being said I think your life would be a lot easier if you add
helpers for the above code sequence and its counterpart that copies
to a potential hughmem page first, as that hides the implementation
details from most users.

