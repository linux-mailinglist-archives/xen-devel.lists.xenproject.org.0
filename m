Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD862893BA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5103.13305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyRx-0004cw-1E; Fri, 09 Oct 2020 19:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5103.13305; Fri, 09 Oct 2020 19:53:08 +0000
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
	id 1kQyRw-0004bp-Pt; Fri, 09 Oct 2020 19:53:08 +0000
Received: by outflank-mailman (input) for mailman id 5103;
 Fri, 09 Oct 2020 19:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyRv-0004ON-7c
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:07 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd56cfaa-a4a4-4ffa-82cb-2d312625fe16;
 Fri, 09 Oct 2020 19:53:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:02 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:02 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyRv-0004ON-7c
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:07 +0000
X-Inumbo-ID: bd56cfaa-a4a4-4ffa-82cb-2d312625fe16
Received: from mga01.intel.com (unknown [192.55.52.88])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bd56cfaa-a4a4-4ffa-82cb-2d312625fe16;
	Fri, 09 Oct 2020 19:53:03 +0000 (UTC)
IronPort-SDR: ilAjpYQOlagkaK3s2lWXgwZ4mxD8/Q0nrhm0bep1pVX2urdzS2DtXs212b0Vzf9ZPZ1iRD7cd2
 IiSUoPsX2lSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976383"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="182976383"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:02 -0700
IronPort-SDR: bH2kRxXxeY8kuFBN5R8RneSpQbEQLW5eawptefbcIpm8xkU067aWcbaReXxx6/6TDXgDaxiIQ5
 8lenxDucas2g==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="519847131"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:02 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Jan Kara <jack@suse.com>,
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
Subject: [PATCH RFC PKS/PMEM 37/58] fs/ext2: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:12 -0700
Message-Id: <20201009195033.3208459-38-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS update use the new kmap_thread() call instead.

Cc: Jan Kara <jack@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ext2/dir.c  | 2 +-
 fs/ext2/ext2.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index f3194bf20733..abe97ba458c8 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -196,7 +196,7 @@ static struct page * ext2_get_page(struct inode *dir, unsigned long n,
 	struct address_space *mapping = dir->i_mapping;
 	struct page *page = read_mapping_page(mapping, n, NULL);
 	if (!IS_ERR(page)) {
-		kmap(page);
+		kmap_thread(page);
 		if (unlikely(!PageChecked(page))) {
 			if (PageError(page) || !ext2_check_page(page, quiet))
 				goto fail;
diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index 021ec8b42ac3..9bcb6714c255 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -749,7 +749,7 @@ extern struct ext2_dir_entry_2 * ext2_dotdot (struct inode *, struct page **);
 extern void ext2_set_link(struct inode *, struct ext2_dir_entry_2 *, struct page *, struct inode *, int);
 static inline void ext2_put_page(struct page *page)
 {
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 }
 
-- 
2.28.0.rc0.12.gb6a658bd00c9


