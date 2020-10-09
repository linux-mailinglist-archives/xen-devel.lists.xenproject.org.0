Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00B2892F5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5063.13041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyQc-0002E2-Re; Fri, 09 Oct 2020 19:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5063.13041; Fri, 09 Oct 2020 19:51:46 +0000
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
	id 1kQyQc-0002Cy-LX; Fri, 09 Oct 2020 19:51:46 +0000
Received: by outflank-mailman (input) for mailman id 5063;
 Fri, 09 Oct 2020 19:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyQb-0002Bq-9T
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:51:45 +0000
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38b255ef-94d7-4d9e-ad22-2e94a778b483;
 Fri, 09 Oct 2020 19:51:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:42 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:41 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyQb-0002Bq-9T
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:51:45 +0000
X-Inumbo-ID: 38b255ef-94d7-4d9e-ad22-2e94a778b483
Received: from mga05.intel.com (unknown [192.55.52.43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 38b255ef-94d7-4d9e-ad22-2e94a778b483;
	Fri, 09 Oct 2020 19:51:43 +0000 (UTC)
IronPort-SDR: yccRu5+Zi4ddrJLQZ5u/PzNSuD2a4R8EjkuO9u9NWwWg7uNLyxX6g2DNZFA9NwwtOZXVSyBRXE
 JuTWe/GvxnrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="250226006"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="250226006"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:42 -0700
IronPort-SDR: /JTFkd5x0991ia3Dqzqc9DQMEj3VkzRKrzcEaYc1Uf7R2BILbYJ/fow/WUSSa3njc7c47Zr56l
 AjDrFCZ0Z24A==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="389236880"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:41 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Aditya Pakki <pakki001@umn.edu>,
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
Subject: [PATCH RFC PKS/PMEM 15/58] fs/ecryptfs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:50 -0700
Message-Id: <20201009195033.3208459-16-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Aditya Pakki <pakki001@umn.edu>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ecryptfs/crypto.c     | 8 ++++----
 fs/ecryptfs/read_write.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 0681540c48d9..e73e00994bee 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -469,10 +469,10 @@ int ecryptfs_encrypt_page(struct page *page)
 	}
 
 	lower_offset = lower_offset_for_page(crypt_stat, page);
-	enc_extent_virt = kmap(enc_extent_page);
+	enc_extent_virt = kmap_thread(enc_extent_page);
 	rc = ecryptfs_write_lower(ecryptfs_inode, enc_extent_virt, lower_offset,
 				  PAGE_SIZE);
-	kunmap(enc_extent_page);
+	kunmap_thread(enc_extent_page);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to write lower page; rc = [%d]\n",
@@ -518,10 +518,10 @@ int ecryptfs_decrypt_page(struct page *page)
 	BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
 
 	lower_offset = lower_offset_for_page(crypt_stat, page);
-	page_virt = kmap(page);
+	page_virt = kmap_thread(page);
 	rc = ecryptfs_read_lower(page_virt, lower_offset, PAGE_SIZE,
 				 ecryptfs_inode);
-	kunmap(page);
+	kunmap_thread(page);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to read lower page; rc = [%d]\n",
diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index 0438997ac9d8..5eca4330c0c0 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -64,11 +64,11 @@ int ecryptfs_write_lower_page_segment(struct inode *ecryptfs_inode,
 
 	offset = ((((loff_t)page_for_lower->index) << PAGE_SHIFT)
 		  + offset_in_page);
-	virt = kmap(page_for_lower);
+	virt = kmap_thread(page_for_lower);
 	rc = ecryptfs_write_lower(ecryptfs_inode, virt, offset, size);
 	if (rc > 0)
 		rc = 0;
-	kunmap(page_for_lower);
+	kunmap_thread(page_for_lower);
 	return rc;
 }
 
@@ -251,11 +251,11 @@ int ecryptfs_read_lower_page_segment(struct page *page_for_ecryptfs,
 	int rc;
 
 	offset = ((((loff_t)page_index) << PAGE_SHIFT) + offset_in_page);
-	virt = kmap(page_for_ecryptfs);
+	virt = kmap_thread(page_for_ecryptfs);
 	rc = ecryptfs_read_lower(virt, offset, size, ecryptfs_inode);
 	if (rc > 0)
 		rc = 0;
-	kunmap(page_for_ecryptfs);
+	kunmap_thread(page_for_ecryptfs);
 	flush_dcache_page(page_for_ecryptfs);
 	return rc;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9


