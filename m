Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95C2897FC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 22:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5185.13568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyeD-0000cm-0P; Fri, 09 Oct 2020 20:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5185.13568; Fri, 09 Oct 2020 20:05:48 +0000
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
	id 1kQyeC-0000cR-Sq; Fri, 09 Oct 2020 20:05:48 +0000
Received: by outflank-mailman (input) for mailman id 5185;
 Fri, 09 Oct 2020 20:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQySj-0003VG-7G
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:57 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0f9d367-7d99-41de-b28b-a3d90d450997;
 Fri, 09 Oct 2020 19:53:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:47 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:46 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQySj-0003VG-7G
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:53:57 +0000
X-Inumbo-ID: e0f9d367-7d99-41de-b28b-a3d90d450997
Received: from mga02.intel.com (unknown [134.134.136.20])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e0f9d367-7d99-41de-b28b-a3d90d450997;
	Fri, 09 Oct 2020 19:53:48 +0000 (UTC)
IronPort-SDR: RffSlFjQ0u1RoSX45kPUXvPF3Vw5pU/zKXIN7B2MoxGCg/yXY+mGIAKBEEp01ajJQ8AuP/OGtW
 QDw5dllcg4Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="152451185"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="152451185"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:47 -0700
IronPort-SDR: hSLATPILKZexzU9UbulfkIo/q3wPUuwdHpgGfd67f9RjOUrzIM+GeKhbZtX4gmiSR0zMVEA6Pm
 bSqmX2bz2skQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="529054109"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:46 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Eric Biederman <ebiederm@xmission.com>,
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
Subject: [PATCH RFC PKS/PMEM 51/58] kernel: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:26 -0700
Message-Id: <20201009195033.3208459-52-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

This kmap() call is localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 kernel/kexec_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index c19c0dad1ebe..272a9920c0d6 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -815,7 +815,7 @@ static int kimage_load_normal_segment(struct kimage *image,
 		if (result < 0)
 			goto out;
 
-		ptr = kmap(page);
+		ptr = kmap_thread(page);
 		/* Start with a clear page */
 		clear_page(ptr);
 		ptr += maddr & ~PAGE_MASK;
@@ -828,7 +828,7 @@ static int kimage_load_normal_segment(struct kimage *image,
 			memcpy(ptr, kbuf, uchunk);
 		else
 			result = copy_from_user(ptr, buf, uchunk);
-		kunmap(page);
+		kunmap_thread(page);
 		if (result) {
 			result = -EFAULT;
 			goto out;
@@ -879,7 +879,7 @@ static int kimage_load_crash_segment(struct kimage *image,
 			goto out;
 		}
 		arch_kexec_post_alloc_pages(page_address(page), 1, 0);
-		ptr = kmap(page);
+		ptr = kmap_thread(page);
 		ptr += maddr & ~PAGE_MASK;
 		mchunk = min_t(size_t, mbytes,
 				PAGE_SIZE - (maddr & ~PAGE_MASK));
@@ -895,7 +895,7 @@ static int kimage_load_crash_segment(struct kimage *image,
 		else
 			result = copy_from_user(ptr, buf, uchunk);
 		kexec_flush_icache_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 		arch_kexec_pre_free_pages(page_address(page), 1);
 		if (result) {
 			result = -EFAULT;
-- 
2.28.0.rc0.12.gb6a658bd00c9


