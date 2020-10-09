Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D42289455
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5132.13390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQySf-0005hJ-4W; Fri, 09 Oct 2020 19:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5132.13390; Fri, 09 Oct 2020 19:53:53 +0000
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
	id 1kQySe-0005gP-Vq; Fri, 09 Oct 2020 19:53:52 +0000
Received: by outflank-mailman (input) for mailman id 5132;
 Fri, 09 Oct 2020 19:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQySd-0005Ps-Uk
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:51 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 681c2b85-c394-4b4c-8973-c2248e976f5a;
 Fri, 09 Oct 2020 19:53:44 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:44 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:43 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQySd-0005Ps-Uk
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:51 +0000
X-Inumbo-ID: 681c2b85-c394-4b4c-8973-c2248e976f5a
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 681c2b85-c394-4b4c-8973-c2248e976f5a;
	Fri, 09 Oct 2020 19:53:44 +0000 (UTC)
IronPort-SDR: YziJI3PlJBzliL0ylJRMcYbG2UKox1qqh1obzhf8msK3M9/YjZBsW9yMJC4UnilOh3SrEyGsaD
 oNcf5vpnJ9Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162068173"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="162068173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:44 -0700
IronPort-SDR: Uit4axCqwtogby85Iv/hBLI1Moj4COtsBpPB5jXSVWpuENwpihzSQwSQg3nZnBMabzVvybSK2I
 1kQ4taZ9oZgQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="298531484"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:43 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvdimm@lists.01.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devel@driverdev.osuosl.org,
	linux-efi@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-aio@kvack.org,
	io-uring@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com,
	samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: [PATCH RFC PKS/PMEM 50/58] drivers/android: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:25 -0700
Message-Id: <20201009195033.3208459-51-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/android/binder_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 69609696a843..5f50856caad7 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1118,9 +1118,9 @@ binder_alloc_copy_user_to_buffer(struct binder_alloc *alloc,
 		page = binder_alloc_get_page(alloc, buffer,
 					     buffer_offset, &pgoff);
 		size = min_t(size_t, bytes, PAGE_SIZE - pgoff);
-		kptr = kmap(page) + pgoff;
+		kptr = kmap_thread(page) + pgoff;
 		ret = copy_from_user(kptr, from, size);
-		kunmap(page);
+		kunmap_thread(page);
 		if (ret)
 			return bytes - size + ret;
 		bytes -= size;
-- 
2.28.0.rc0.12.gb6a658bd00c9


