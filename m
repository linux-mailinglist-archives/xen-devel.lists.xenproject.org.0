Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC1289385
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5092.13252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyRh-000492-N7; Fri, 09 Oct 2020 19:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5092.13252; Fri, 09 Oct 2020 19:52:53 +0000
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
	id 1kQyRh-00047S-GZ; Fri, 09 Oct 2020 19:52:53 +0000
Received: by outflank-mailman (input) for mailman id 5092;
 Fri, 09 Oct 2020 19:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyRg-0003VG-4o
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:52 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 621cbdbf-5a40-44ce-83c9-a302c14e923e;
 Fri, 09 Oct 2020 19:52:42 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:41 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:40 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyRg-0003VG-4o
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:52 +0000
X-Inumbo-ID: 621cbdbf-5a40-44ce-83c9-a302c14e923e
Received: from mga17.intel.com (unknown [192.55.52.151])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 621cbdbf-5a40-44ce-83c9-a302c14e923e;
	Fri, 09 Oct 2020 19:52:42 +0000 (UTC)
IronPort-SDR: imeySJ6f3Q9sudI3xVuxsFxeYZjwfBmWOs3m2f93+9txgw1kzGjh0BHC4WQZKliadxJEcB8gow
 6RHcn4LZ75Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397496"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="145397496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:41 -0700
IronPort-SDR: L0Vefok2A93xih84zuFNBu3LKLwMRamDsDkR1F4Gust5uwQPsEktlHxFcxfQt1U0vxS4VptD4d
 rIp50GoBaQKg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="345148048"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:40 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
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
Subject: [PATCH RFC PKS/PMEM 31/58] fs/vboxsf: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:06 -0700
Message-Id: <20201009195033.3208459-32-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/vboxsf/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/vboxsf/file.c b/fs/vboxsf/file.c
index c4ab5996d97a..d9c7e6b7b4cc 100644
--- a/fs/vboxsf/file.c
+++ b/fs/vboxsf/file.c
@@ -216,7 +216,7 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 	u8 *buf;
 	int err;
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 
 	err = vboxsf_read(sf_handle->root, sf_handle->handle, off, &nread, buf);
 	if (err == 0) {
@@ -227,7 +227,7 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 		SetPageError(page);
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 	unlock_page(page);
 	return err;
 }
@@ -268,10 +268,10 @@ static int vboxsf_writepage(struct page *page, struct writeback_control *wbc)
 	if (!sf_handle)
 		return -EBADF;
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 	err = vboxsf_write(sf_handle->root, sf_handle->handle,
 			   off, &nwrite, buf);
-	kunmap(page);
+	kunmap_thread(page);
 
 	kref_put(&sf_handle->refcount, vboxsf_handle_release);
 
@@ -302,10 +302,10 @@ static int vboxsf_write_end(struct file *file, struct address_space *mapping,
 	if (!PageUptodate(page) && copied < len)
 		zero_user(page, from + copied, len - copied);
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 	err = vboxsf_write(sf_handle->root, sf_handle->handle,
 			   pos, &nwritten, buf + from);
-	kunmap(page);
+	kunmap_thread(page);
 
 	if (err) {
 		nwritten = 0;
-- 
2.28.0.rc0.12.gb6a658bd00c9


