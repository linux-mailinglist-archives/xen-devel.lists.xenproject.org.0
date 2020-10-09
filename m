Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469128931F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5074.13124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyR2-0002vf-QT; Fri, 09 Oct 2020 19:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5074.13124; Fri, 09 Oct 2020 19:52:12 +0000
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
	id 1kQyR2-0002uf-LO; Fri, 09 Oct 2020 19:52:12 +0000
Received: by outflank-mailman (input) for mailman id 5074;
 Fri, 09 Oct 2020 19:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyR1-0002d3-Im
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:11 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30150e07-14e3-48da-a02e-f5f16bf31f29;
 Fri, 09 Oct 2020 19:52:02 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:01 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:01 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyR1-0002d3-Im
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:52:11 +0000
X-Inumbo-ID: 30150e07-14e3-48da-a02e-f5f16bf31f29
Received: from mga01.intel.com (unknown [192.55.52.88])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 30150e07-14e3-48da-a02e-f5f16bf31f29;
	Fri, 09 Oct 2020 19:52:02 +0000 (UTC)
IronPort-SDR: CwCqh1jTT86tyWyXIuTm8S1/lWi685IvGTH5/sYLRrcdqRctlM76XwR4KnDXsehQEdaeq4f1lR
 nQoAjJpJtE4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976218"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="182976218"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:01 -0700
IronPort-SDR: tVhE30/49ehqkoc80ZCcDXB4dMTZze5YTnWPIjaBRWP4P6o/AEUDuRNENWQluyt3yOqCx99fob
 q9C+vTCoMURQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="519846944"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:01 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
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
Subject: [PATCH RFC PKS/PMEM 21/58] fs/nfs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:56 -0700
Message-Id: <20201009195033.3208459-22-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/nfs/dir.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index cb52db9a0cfb..fee321acccb4 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -213,7 +213,7 @@ int nfs_readdir_make_qstr(struct qstr *string, const char *name, unsigned int le
 static
 int nfs_readdir_add_to_array(struct nfs_entry *entry, struct page *page)
 {
-	struct nfs_cache_array *array = kmap(page);
+	struct nfs_cache_array *array = kmap_thread(page);
 	struct nfs_cache_array_entry *cache_entry;
 	int ret;
 
@@ -235,7 +235,7 @@ int nfs_readdir_add_to_array(struct nfs_entry *entry, struct page *page)
 	if (entry->eof != 0)
 		array->eof_index = array->size;
 out:
-	kunmap(page);
+	kunmap_thread(page);
 	return ret;
 }
 
@@ -347,7 +347,7 @@ int nfs_readdir_search_array(nfs_readdir_descriptor_t *desc)
 	struct nfs_cache_array *array;
 	int status;
 
-	array = kmap(desc->page);
+	array = kmap_thread(desc->page);
 
 	if (*desc->dir_cookie == 0)
 		status = nfs_readdir_search_for_pos(array, desc);
@@ -359,7 +359,7 @@ int nfs_readdir_search_array(nfs_readdir_descriptor_t *desc)
 		desc->current_index += array->size;
 		desc->page_index++;
 	}
-	kunmap(desc->page);
+	kunmap_thread(desc->page);
 	return status;
 }
 
@@ -602,10 +602,10 @@ int nfs_readdir_page_filler(nfs_readdir_descriptor_t *desc, struct nfs_entry *en
 
 out_nopages:
 	if (count == 0 || (status == -EBADCOOKIE && entry->eof != 0)) {
-		array = kmap(page);
+		array = kmap_thread(page);
 		array->eof_index = array->size;
 		status = 0;
-		kunmap(page);
+		kunmap_thread(page);
 	}
 
 	put_page(scratch);
@@ -669,7 +669,7 @@ int nfs_readdir_xdr_to_array(nfs_readdir_descriptor_t *desc, struct page *page,
 		goto out;
 	}
 
-	array = kmap(page);
+	array = kmap_thread(page);
 
 	status = nfs_readdir_alloc_pages(pages, array_size);
 	if (status < 0)
@@ -691,7 +691,7 @@ int nfs_readdir_xdr_to_array(nfs_readdir_descriptor_t *desc, struct page *page,
 
 	nfs_readdir_free_pages(pages, array_size);
 out_release_array:
-	kunmap(page);
+	kunmap_thread(page);
 	nfs4_label_free(entry.label);
 out:
 	nfs_free_fattr(entry.fattr);
@@ -803,7 +803,7 @@ int nfs_do_filldir(nfs_readdir_descriptor_t *desc)
 	struct nfs_cache_array *array = NULL;
 	struct nfs_open_dir_context *ctx = file->private_data;
 
-	array = kmap(desc->page);
+	array = kmap_thread(desc->page);
 	for (i = desc->cache_entry_index; i < array->size; i++) {
 		struct nfs_cache_array_entry *ent;
 
@@ -827,7 +827,7 @@ int nfs_do_filldir(nfs_readdir_descriptor_t *desc)
 	if (array->eof_index >= 0)
 		desc->eof = true;
 
-	kunmap(desc->page);
+	kunmap_thread(desc->page);
 	dfprintk(DIRCACHE, "NFS: nfs_do_filldir() filling ended @ cookie %Lu; returning = %d\n",
 			(unsigned long long)*desc->dir_cookie, res);
 	return res;
-- 
2.28.0.rc0.12.gb6a658bd00c9


