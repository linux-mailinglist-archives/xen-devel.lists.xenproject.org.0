Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E169289394
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5094.13269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyRn-0004Ih-78; Fri, 09 Oct 2020 19:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5094.13269; Fri, 09 Oct 2020 19:52:59 +0000
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
	id 1kQyRm-0004HT-Ur; Fri, 09 Oct 2020 19:52:58 +0000
Received: by outflank-mailman (input) for mailman id 5094;
 Fri, 09 Oct 2020 19:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyRl-0003VG-4q
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:57 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf302556-a958-407d-bd09-6bb7935b5582;
 Fri, 09 Oct 2020 19:52:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:45 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:43 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyRl-0003VG-4q
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:57 +0000
X-Inumbo-ID: bf302556-a958-407d-bd09-6bb7935b5582
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bf302556-a958-407d-bd09-6bb7935b5582;
	Fri, 09 Oct 2020 19:52:46 +0000 (UTC)
IronPort-SDR: i9q3zJ+uL+2benq9Ca20fKVcvn5UbbjweCphprj2Vg+SWY5xTRvk1nOW4rQlhM7h2o8WQcpn4t
 4Hs+X+9kVweA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162068029"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="162068029"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:45 -0700
IronPort-SDR: A7QVfEYpWd+zukvvJSzSDlmpc6UtcI1VTl49mnWle7o9+shZWHPb4ayBrZUheEhKcyM4kHv/QX
 ai2WmfcpOoFA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="389237190"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:43 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Jeff Dike <jdike@addtoit.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
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
Subject: [PATCH RFC PKS/PMEM 32/58] fs/hostfs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:07 -0700
Message-Id: <20201009195033.3208459-33-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/hostfs/hostfs_kern.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index c070c0d8e3e9..608efd0f83cb 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -409,7 +409,7 @@ static int hostfs_writepage(struct page *page, struct writeback_control *wbc)
 	if (page->index >= end_index)
 		count = inode->i_size & (PAGE_SIZE-1);
 
-	buffer = kmap(page);
+	buffer = kmap_thread(page);
 
 	err = write_file(HOSTFS_I(inode)->fd, &base, buffer, count);
 	if (err != count) {
@@ -425,7 +425,7 @@ static int hostfs_writepage(struct page *page, struct writeback_control *wbc)
 	err = 0;
 
  out:
-	kunmap(page);
+	kunmap_thread(page);
 
 	unlock_page(page);
 	return err;
@@ -437,7 +437,7 @@ static int hostfs_readpage(struct file *file, struct page *page)
 	loff_t start = page_offset(page);
 	int bytes_read, ret = 0;
 
-	buffer = kmap(page);
+	buffer = kmap_thread(page);
 	bytes_read = read_file(FILE_HOSTFS_I(file)->fd, &start, buffer,
 			PAGE_SIZE);
 	if (bytes_read < 0) {
@@ -454,7 +454,7 @@ static int hostfs_readpage(struct file *file, struct page *page)
 
  out:
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	unlock_page(page);
 	return ret;
 }
@@ -480,9 +480,9 @@ static int hostfs_write_end(struct file *file, struct address_space *mapping,
 	unsigned from = pos & (PAGE_SIZE - 1);
 	int err;
 
-	buffer = kmap(page);
+	buffer = kmap_thread(page);
 	err = write_file(FILE_HOSTFS_I(file)->fd, &pos, buffer + from, copied);
-	kunmap(page);
+	kunmap_thread(page);
 
 	if (!PageUptodate(page) && err == PAGE_SIZE)
 		SetPageUptodate(page);
-- 
2.28.0.rc0.12.gb6a658bd00c9


