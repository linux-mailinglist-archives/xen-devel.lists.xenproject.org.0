Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3F289472
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5138.13412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQySq-0005yQ-0B; Fri, 09 Oct 2020 19:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5138.13412; Fri, 09 Oct 2020 19:54:03 +0000
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
	id 1kQySp-0005xW-QK; Fri, 09 Oct 2020 19:54:03 +0000
Received: by outflank-mailman (input) for mailman id 5138;
 Fri, 09 Oct 2020 19:54:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQySn-0005Ps-V7
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:54:01 +0000
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 661d6fbc-7671-45ed-9247-8eec879818b0;
 Fri, 09 Oct 2020 19:53:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:54 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:53 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQySn-0005Ps-V7
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:54:01 +0000
X-Inumbo-ID: 661d6fbc-7671-45ed-9247-8eec879818b0
Received: from mga06.intel.com (unknown [134.134.136.31])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 661d6fbc-7671-45ed-9247-8eec879818b0;
	Fri, 09 Oct 2020 19:53:55 +0000 (UTC)
IronPort-SDR: qAwk0eQ+X+LCpDWx3sefcn5lu/8xvuqCwVCgM1HthVzDQ0OnqVQX6aby7qQJevD7rkG95HexiI
 CPFDGhVgYKVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179201"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="227179201"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:54 -0700
IronPort-SDR: bZn0Zma13YkX7FJFkNsCYMjMNff2FSiB/MgoUwYT50qMOfu0yRYfZtOtUYx1uwuwPtN+tdFX+r
 hwly4wq6Ikyg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="519847271"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:53 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	Andrii Nakryiko <andriin@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@chromium.org>,
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
Subject: [PATCH RFC PKS/PMEM 53/58] lib: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:28 -0700
Message-Id: <20201009195033.3208459-54-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Yonghong Song <yhs@fb.com>
Cc: Andrii Nakryiko <andriin@fb.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@chromium.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 lib/iov_iter.c | 12 ++++++------
 lib/test_bpf.c |  4 ++--
 lib/test_hmm.c |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 5e40786c8f12..1d47f957cf95 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -208,7 +208,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
 	}
 	/* Too bad - revert to non-atomic kmap */
 
-	kaddr = kmap(page);
+	kaddr = kmap_thread(page);
 	from = kaddr + offset;
 	left = copyout(buf, from, copy);
 	copy -= left;
@@ -225,7 +225,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
 		from += copy;
 		bytes -= copy;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 
 done:
 	if (skip == iov->iov_len) {
@@ -292,7 +292,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
 	}
 	/* Too bad - revert to non-atomic kmap */
 
-	kaddr = kmap(page);
+	kaddr = kmap_thread(page);
 	to = kaddr + offset;
 	left = copyin(to, buf, copy);
 	copy -= left;
@@ -309,7 +309,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
 		to += copy;
 		bytes -= copy;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 
 done:
 	if (skip == iov->iov_len) {
@@ -1742,10 +1742,10 @@ int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
 		return 0;
 
 	iterate_all_kinds(i, bytes, v, -EINVAL, ({
-		w.iov_base = kmap(v.bv_page) + v.bv_offset;
+		w.iov_base = kmap_thread(v.bv_page) + v.bv_offset;
 		w.iov_len = v.bv_len;
 		err = f(&w, context);
-		kunmap(v.bv_page);
+		kunmap_thread(v.bv_page);
 		err;}), ({
 		w = v;
 		err = f(&w, context);})
diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index ca7d635bccd9..441f822f56ba 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -6506,11 +6506,11 @@ static void *generate_test_data(struct bpf_test *test, int sub)
 		if (!page)
 			goto err_kfree_skb;
 
-		ptr = kmap(page);
+		ptr = kmap_thread(page);
 		if (!ptr)
 			goto err_free_page;
 		memcpy(ptr, test->frag_data, MAX_DATA);
-		kunmap(page);
+		kunmap_thread(page);
 		skb_add_rx_frag(skb, 0, page, 0, MAX_DATA, MAX_DATA);
 	}
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e7dc3de355b7..e40d26f97f45 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -329,9 +329,9 @@ static int dmirror_do_read(struct dmirror *dmirror, unsigned long start,
 		if (!page)
 			return -ENOENT;
 
-		tmp = kmap(page);
+		tmp = kmap_thread(page);
 		memcpy(ptr, tmp, PAGE_SIZE);
-		kunmap(page);
+		kunmap_thread(page);
 
 		ptr += PAGE_SIZE;
 		bounce->cpages++;
@@ -398,9 +398,9 @@ static int dmirror_do_write(struct dmirror *dmirror, unsigned long start,
 		if (!page || xa_pointer_tag(entry) != DPT_XA_TAG_WRITE)
 			return -ENOENT;
 
-		tmp = kmap(page);
+		tmp = kmap_thread(page);
 		memcpy(tmp, ptr, PAGE_SIZE);
-		kunmap(page);
+		kunmap_thread(page);
 
 		ptr += PAGE_SIZE;
 		bounce->cpages++;
-- 
2.28.0.rc0.12.gb6a658bd00c9


