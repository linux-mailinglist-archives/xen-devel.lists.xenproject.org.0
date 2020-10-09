Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0E28960F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5173.13520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyXv-0007YJ-GD; Fri, 09 Oct 2020 19:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5173.13520; Fri, 09 Oct 2020 19:59:19 +0000
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
	id 1kQyXv-0007Xq-Cd; Fri, 09 Oct 2020 19:59:19 +0000
Received: by outflank-mailman (input) for mailman id 5173;
 Fri, 09 Oct 2020 19:59:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQySU-0003VG-6W
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:42 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30caa391-3e96-48cc-9fcb-f4823c84ce0d;
 Fri, 09 Oct 2020 19:53:30 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:29 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:28 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQySU-0003VG-6W
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:42 +0000
X-Inumbo-ID: 30caa391-3e96-48cc-9fcb-f4823c84ce0d
Received: from mga03.intel.com (unknown [134.134.136.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 30caa391-3e96-48cc-9fcb-f4823c84ce0d;
	Fri, 09 Oct 2020 19:53:30 +0000 (UTC)
IronPort-SDR: kaVSwKYO/oBj40XBBm1bm6G1A1++4hOplAS3cyXyq2u2UFdJSJ887QaOjSj9FhCnDez5pzPD9U
 QFqmpzx346Pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165592493"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="165592493"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:29 -0700
IronPort-SDR: BOVOU8SHaQbMr+qBBSrCzuqbJHuQd4ndzwss05aaSC7o5I30ANXdekITPCnqmJ5xtHPcWbAp0e
 1H/r6jgeLwtA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="298419945"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:28 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
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
Subject: [PATCH RFC PKS/PMEM 45/58] drivers/firmware: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:20 -0700
Message-Id: <20201009195033.3208459-46-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/firmware/efi/capsule-loader.c | 6 +++---
 drivers/firmware/efi/capsule.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/capsule-loader.c b/drivers/firmware/efi/capsule-loader.c
index 4dde8edd53b6..aa2e0b5940fd 100644
--- a/drivers/firmware/efi/capsule-loader.c
+++ b/drivers/firmware/efi/capsule-loader.c
@@ -197,7 +197,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 		page = cap_info->pages[cap_info->index - 1];
 	}
 
-	kbuff = kmap(page);
+	kbuff = kmap_thread(page);
 	kbuff += PAGE_SIZE - cap_info->page_bytes_remain;
 
 	/* Copy capsule binary data from user space to kernel space buffer */
@@ -217,7 +217,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	}
 
 	cap_info->count += write_byte;
-	kunmap(page);
+	kunmap_thread(page);
 
 	/* Submit the full binary to efi_capsule_update() API */
 	if (cap_info->header.headersize > 0 &&
@@ -236,7 +236,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	return write_byte;
 
 fail_unmap:
-	kunmap(page);
+	kunmap_thread(page);
 failed:
 	efi_free_all_buff_pages(cap_info);
 	return ret;
diff --git a/drivers/firmware/efi/capsule.c b/drivers/firmware/efi/capsule.c
index 598b7800d14e..edb7797b0e4f 100644
--- a/drivers/firmware/efi/capsule.c
+++ b/drivers/firmware/efi/capsule.c
@@ -244,7 +244,7 @@ int efi_capsule_update(efi_capsule_header_t *capsule, phys_addr_t *pages)
 	for (i = 0; i < sg_count; i++) {
 		efi_capsule_block_desc_t *sglist;
 
-		sglist = kmap(sg_pages[i]);
+		sglist = kmap_thread(sg_pages[i]);
 
 		for (j = 0; j < SGLIST_PER_PAGE && count > 0; j++) {
 			u64 sz = min_t(u64, imagesize,
@@ -265,7 +265,7 @@ int efi_capsule_update(efi_capsule_header_t *capsule, phys_addr_t *pages)
 		else
 			sglist[j].data = page_to_phys(sg_pages[i + 1]);
 
-		kunmap(sg_pages[i]);
+		kunmap_thread(sg_pages[i]);
 	}
 
 	mutex_lock(&capsule_mutex);
-- 
2.28.0.rc0.12.gb6a658bd00c9


