Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF428928C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 21:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5048.12909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyPp-0001BJ-6f; Fri, 09 Oct 2020 19:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5048.12909; Fri, 09 Oct 2020 19:50:57 +0000
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
	id 1kQyPp-0001Ao-2W; Fri, 09 Oct 2020 19:50:57 +0000
Received: by outflank-mailman (input) for mailman id 5048;
 Fri, 09 Oct 2020 19:50:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyPn-00017t-Md
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:50:55 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9967089-f009-46f5-8231-486fb3396c20;
 Fri, 09 Oct 2020 19:50:52 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:51 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:50 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyPn-00017t-Md
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:50:55 +0000
X-Inumbo-ID: e9967089-f009-46f5-8231-486fb3396c20
Received: from mga14.intel.com (unknown [192.55.52.115])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e9967089-f009-46f5-8231-486fb3396c20;
	Fri, 09 Oct 2020 19:50:52 +0000 (UTC)
IronPort-SDR: qZUgeWweAAkT+UGCT1/1mmT1I5zLAbVQ+QVU+857pjwIbo9dYuoyMJ/2Aw1Qpx9Xz22FF3325Y
 Xhkfk3THfhvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="164743583"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="164743583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:50:51 -0700
IronPort-SDR: r9rFWs4LxSt/DLhc0vk8qSUxzY/hR2W3QZLi44jmj/rGXS9Mfwq/Fn231GdfrO+iUZYF22umi/
 70MWS29lQZXg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="529052813"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:50:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
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
Subject: [PATCH RFC PKS/PMEM 02/58] x86/pks/test: Add testing for global option
Date: Fri,  9 Oct 2020 12:49:37 -0700
Message-Id: <20201009195033.3208459-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

Now that PKS can be enabled globaly (for all threads) add a test which
spawns a thread and tests the same PKS functionality.

The test enables/disables PKS in 1 thread while attempting to access the
page in another thread.  We use the same test array as in the 'local'
PKS testing.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/x86/mm/fault.c |   4 ++
 lib/pks/pks_test.c  | 128 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 4b4ff9efa298..4c74f52fbc23 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1108,6 +1108,10 @@ static int spurious_kernel_fault_check(unsigned long error_code, pte_t *pte,
 		if (global_pkey_is_enabled(pte, is_write, irq_state))
 			return 1;
 
+		/*
+		 * NOTE: This must be after the global_pkey_is_enabled() call
+		 * to allow the fixup code to be tested.
+		 */
 		if (handle_pks_testing(error_code, irq_state))
 			return 1;
 
diff --git a/lib/pks/pks_test.c b/lib/pks/pks_test.c
index 286c8b8457da..dfddccbe4cb6 100644
--- a/lib/pks/pks_test.c
+++ b/lib/pks/pks_test.c
@@ -154,7 +154,8 @@ static void check_exception(irqentry_state_t *irq_state)
 	}
 
 	/* Check the exception state */
-	if (!check_pkrs(test_armed_key, PKEY_DISABLE_ACCESS)) {
+	if (!check_pkrs(test_armed_key,
+			PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)) {
 		pr_err("     FAIL: PKRS cache and MSR\n");
 		test_exception_ctx->pass = false;
 	}
@@ -308,24 +309,29 @@ static int test_it(struct pks_test_ctx *ctx, struct pks_access_test *test, void
 	return ret;
 }
 
-static int run_access_test(struct pks_test_ctx *ctx,
-			   struct pks_access_test *test,
-			   void *ptr)
+static void set_protection(int pkey, enum pks_access_mode mode, bool global)
 {
-	switch (test->mode) {
+	switch (mode) {
 		case PKS_TEST_NO_ACCESS:
-			pks_mknoaccess(ctx->pkey, false);
+			pks_mknoaccess(pkey, global);
 			break;
 		case PKS_TEST_RDWR:
-			pks_mkrdwr(ctx->pkey, false);
+			pks_mkrdwr(pkey, global);
 			break;
 		case PKS_TEST_RDONLY:
-			pks_mkread(ctx->pkey, false);
+			pks_mkread(pkey, global);
 			break;
 		default:
 			pr_err("BUG in test invalid mode\n");
 			break;
 	}
+}
+
+static int run_access_test(struct pks_test_ctx *ctx,
+			   struct pks_access_test *test,
+			   void *ptr)
+{
+	set_protection(ctx->pkey, test->mode, false);
 
 	return test_it(ctx, test, ptr);
 }
@@ -516,6 +522,110 @@ static void run_exception_test(void)
 		 pass ? "PASS" : "FAIL");
 }
 
+struct shared_data {
+	struct mutex lock;
+	struct pks_test_ctx *ctx;
+	void *kmap_addr;
+	struct pks_access_test *test;
+};
+
+static int thread_main(void *d)
+{
+	struct shared_data *data = d;
+	struct pks_test_ctx *ctx = data->ctx;
+
+	while (!kthread_should_stop()) {
+		mutex_lock(&data->lock);
+		/*
+		 * wait for the main thread to hand us the page
+		 * We should be spinning so hopefully we will not have gotten
+		 * the global value from a schedule in.
+		 */
+		if (data->kmap_addr) {
+			if (test_it(ctx, data->test, data->kmap_addr))
+				ctx->pass = false;
+			data->kmap_addr = NULL;
+		}
+		mutex_unlock(&data->lock);
+	}
+
+	return 0;
+}
+
+static void run_thread_access_test(struct shared_data *data,
+				   struct pks_test_ctx *ctx,
+				   struct pks_access_test *test,
+				   void *ptr)
+{
+	set_protection(ctx->pkey, test->mode, true);
+
+	pr_info("checking...  mode %s; write %s\n",
+			get_mode_str(test->mode), test->write ? "TRUE" : "FALSE");
+
+	mutex_lock(&data->lock);
+	data->test = test;
+	data->kmap_addr = ptr;
+	mutex_unlock(&data->lock);
+
+	while (data->kmap_addr) {
+		msleep(10);
+	}
+}
+
+static void run_global_test(void)
+{
+	struct task_struct *other_task;
+	struct pks_test_ctx *ctx;
+	struct shared_data data;
+	bool pass = true;
+	void *ptr;
+	int i;
+
+	pr_info("     ***** BEGIN: global pkey checking\n");
+
+	/* Set up context, data pgae, and thread */
+	ctx = alloc_ctx("global pkey test");
+	if (IS_ERR(ctx)) {
+		pr_err("     FAIL: no context\n");
+		pass = false;
+		goto result;
+	}
+	ptr = alloc_test_page(ctx->pkey);
+	if (!ptr) {
+		pr_err("     FAIL: no vmalloc page\n");
+		pass = false;
+		goto free_context;
+	}
+	other_task = kthread_run(thread_main, &data, "PKRS global test");
+	if (IS_ERR(other_task)) {
+		pr_err("     FAIL: Failed to start thread\n");
+		pass = false;
+		goto free_page;
+	}
+
+	memset(&data, 0, sizeof(data));
+	mutex_init(&data.lock);
+	data.ctx = ctx;
+
+	/* Start testing */
+	ctx->pass = true;
+
+	for (i = 0; i < ARRAY_SIZE(pkey_test_ary); i++) {
+		run_thread_access_test(&data, ctx, &pkey_test_ary[i], ptr);
+	}
+
+	kthread_stop(other_task);
+	pass = ctx->pass;
+
+free_page:
+	vfree(ptr);
+free_context:
+	free_ctx(ctx);
+result:
+	pr_info("     ***** END: global pkey checking : %s\n",
+		 pass ? "PASS" : "FAIL");
+}
+
 static void run_all(void)
 {
 	struct pks_test_ctx *ctx[PKS_NUM_KEYS];
@@ -538,6 +648,8 @@ static void run_all(void)
 	}
 
 	run_exception_test();
+
+	run_global_test();
 }
 
 static void crash_it(void)
-- 
2.28.0.rc0.12.gb6a658bd00c9


