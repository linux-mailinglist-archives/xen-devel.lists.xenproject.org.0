Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CC28AD58
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 06:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5785.15017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRpki-0001an-Tn; Mon, 12 Oct 2020 04:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5785.15017; Mon, 12 Oct 2020 04:48:04 +0000
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
	id 1kRpki-0001aO-QI; Mon, 12 Oct 2020 04:48:04 +0000
Received: by outflank-mailman (input) for mailman id 5785;
 Mon, 12 Oct 2020 04:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kRpkh-0001aJ-I6
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 04:48:03 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed0a6959-2783-4d5a-a842-27e68ee762ed;
 Mon, 12 Oct 2020 04:48:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 21:47:58 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 21:47:57 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kRpkh-0001aJ-I6
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 04:48:03 +0000
X-Inumbo-ID: ed0a6959-2783-4d5a-a842-27e68ee762ed
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ed0a6959-2783-4d5a-a842-27e68ee762ed;
	Mon, 12 Oct 2020 04:48:01 +0000 (UTC)
IronPort-SDR: I4ItzH009yCOPBRK0pgaf/qWGb8aPXMqA1P60HkuxHiF2gof0cCbdYD7TZB/MoqSwm58mRCOld
 rSdfvafaTheg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="162223403"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="162223403"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 21:47:58 -0700
IronPort-SDR: OeJlrvjJIthwDW5ZiLkp+F246Fw9BWID0JMdXYyjjISLX5UipnPYleFarWgQdoLnt1ZOhIB0kv
 QrFucSf/AAcw==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="529805779"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 21:47:57 -0700
Date: Sun, 11 Oct 2020 21:47:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Bernard Metzler <BMT@zurich.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Marciniszyn <mike.marciniszyn@intel.com>,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Faisal Latif <faisal.latif@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>, x86@kernel.org,
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
	amd-gfx@lists.freed.esktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, drbd-dev@tron.linbit.com,
	linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 10/58] drivers/rdma: Utilize new
 kmap_thread()
Message-ID: <20201012044756.GY2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-11-ira.weiny@intel.com>
 <20201009195033.3208459-1-ira.weiny@intel.com>
 <OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Sat, Oct 10, 2020 at 11:36:49AM +0000, Bernard Metzler wrote:
> -----ira.weiny@intel.com wrote: -----
> 

[snip]

> >@@ -505,7 +505,7 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
> >struct socket *s)
> > 				page_array[seg] = p;
> > 
> > 				if (!c_tx->use_sendpage) {
> >-					iov[seg].iov_base = kmap(p) + fp_off;
> >+					iov[seg].iov_base = kmap_thread(p) + fp_off;
> 
> This misses a corresponding kunmap_thread() in siw_unmap_pages()
> (pls change line 403 in siw_qp_tx.c as well)

Thanks I missed that.

Done.

Ira

> 
> Thanks,
> Bernard.
> 

