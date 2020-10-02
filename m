Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD32816DC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2232.6608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBv-0006y4-6f; Fri, 02 Oct 2020 15:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2232.6608; Fri, 02 Oct 2020 15:41:51 +0000
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
	id 1kONBv-0006xT-2N; Fri, 02 Oct 2020 15:41:51 +0000
Received: by outflank-mailman (input) for mailman id 2232;
 Fri, 02 Oct 2020 15:41:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONBs-0006v4-SS
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1913937-ddf9-40d7-ae63-0f09078a303c;
 Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 992C7B264;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONBs-0006v4-SS
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:48 +0000
X-Inumbo-ID: e1913937-ddf9-40d7-ae63-0f09078a303c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e1913937-ddf9-40d7-ae63-0f09078a303c;
	Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbrEsrqdNvWQhuDT/WAXgzByQyKfzuLyEZut1PWtipw=;
	b=OmTqquRryuHi+lVJnfyqJwl4ttcKsNieBVa6/IZlRTuW2hu1FvWSMDDifafqjMjySb+fDx
	qfjonnZ17444IlZXaT9sRUEs1vKQZ0jjZrBzGWEo3BjNFWavlgE87Ddek5RdPaX1quKESc
	SrJmjjR+SjnFYQ5qXk91H/qR0eMGWIw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 992C7B264;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 4/5] tools: drop all deprecated usages of xs_*_open() and friends in tools
Date: Fri,  2 Oct 2020 17:41:40 +0200
Message-Id: <20201002154141.11677-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch all usages of xs_daemon_open*() and xs_domain_open() to use
xs_open() instead. While at it switch xs_daemon_close() users to
xs_close().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/console/client/main.c             |  2 +-
 tools/console/daemon/utils.c            |  4 ++--
 tools/libs/light/libxl.c                |  6 ++----
 tools/libs/light/libxl_exec.c           |  6 +++---
 tools/libs/light/libxl_fork.c           |  2 +-
 tools/libs/stat/xenstat.c               |  4 ++--
 tools/libs/vchan/init.c                 | 10 ++++------
 tools/misc/xen-lowmemd.c                |  4 ++--
 tools/python/xen/lowlevel/xs/xs.c       |  6 +++---
 tools/tests/mce-test/tools/xen-mceinj.c |  4 ++--
 tools/xenbackendd/xenbackendd.c         |  4 ++--
 tools/xenpmd/xenpmd.c                   |  6 +++---
 12 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index f92ad3d8cf..088be28dff 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -398,7 +398,7 @@ int main(int argc, char **argv)
 		exit(EINVAL);
 	}
 
-	xs = xs_daemon_open();
+	xs = xs_open(0);
 	if (xs == NULL) {
 		err(errno, "Could not contact XenStore");
 	}
diff --git a/tools/console/daemon/utils.c b/tools/console/daemon/utils.c
index 97d7798b33..f9dd8a60c5 100644
--- a/tools/console/daemon/utils.c
+++ b/tools/console/daemon/utils.c
@@ -104,7 +104,7 @@ void daemonize(const char *pidfile)
 bool xen_setup(void)
 {
 	
-	xs = xs_daemon_open();
+	xs = xs_open(0);
 	if (xs == NULL) {
 		dolog(LOG_ERR,
 		      "Failed to contact xenstore (%m).  Is it running?");
@@ -131,7 +131,7 @@ bool xen_setup(void)
 
  out:
 	if (xs)
-		xs_daemon_close(xs);
+		xs_close(xs);
 	if (xc)
 		xc_interface_close(xc);
 	return false;
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 621acc88f3..d2a87157a2 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -103,9 +103,7 @@ int libxl_ctx_alloc(libxl_ctx **pctx, int version,
         rc = ERROR_FAIL; goto out;
     }
 
-    ctx->xsh = xs_daemon_open();
-    if (!ctx->xsh)
-        ctx->xsh = xs_domain_open();
+    ctx->xsh = xs_open(0);
     if (!ctx->xsh) {
         LOGEV(ERROR, errno, "cannot connect to xenstore");
         rc = ERROR_FAIL; goto out;
@@ -171,7 +169,7 @@ int libxl_ctx_free(libxl_ctx *ctx)
 
     if (ctx->xch) xc_interface_close(ctx->xch);
     libxl_version_info_dispose(&ctx->version_info);
-    if (ctx->xsh) xs_daemon_close(ctx->xsh);
+    if (ctx->xsh) xs_close(ctx->xsh);
     if (ctx->xce) xenevtchn_close(ctx->xce);
 
     libxl__poller_put(ctx, ctx->poller_app);
diff --git a/tools/libs/light/libxl_exec.c b/tools/libs/light/libxl_exec.c
index 47c9c8f1ba..a8b949b193 100644
--- a/tools/libs/light/libxl_exec.c
+++ b/tools/libs/light/libxl_exec.c
@@ -178,7 +178,7 @@ int libxl__xenstore_child_wait_deprecated(libxl__gc *gc,
     unsigned int num;
     char **l = NULL;
 
-    xsh = xs_daemon_open();
+    xsh = xs_open(0);
     if (xsh == NULL) {
         LOG(ERROR, "Unable to open xenstore connection");
         goto err;
@@ -206,7 +206,7 @@ int libxl__xenstore_child_wait_deprecated(libxl__gc *gc,
 
         free(p);
         xs_unwatch(xsh, path, path);
-        xs_daemon_close(xsh);
+        xs_close(xsh);
         return rc;
 again:
         free(p);
@@ -226,7 +226,7 @@ again:
     LOG(ERROR, "%s not ready", what);
 
     xs_unwatch(xsh, path, path);
-    xs_daemon_close(xsh);
+    xs_close(xsh);
 err:
     return -1;
 }
diff --git a/tools/libs/light/libxl_fork.c b/tools/libs/light/libxl_fork.c
index 9a4709b9a4..5d47dceb8a 100644
--- a/tools/libs/light/libxl_fork.c
+++ b/tools/libs/light/libxl_fork.c
@@ -663,7 +663,7 @@ int libxl__ev_child_xenstore_reopen(libxl__gc *gc, const char *what) {
     int rc;
 
     assert(!CTX->xsh);
-    CTX->xsh = xs_daemon_open();
+    CTX->xsh = xs_open(0);
     if (!CTX->xsh) {
         LOGE(ERROR, "%s: xenstore reopen failed", what);
         rc = ERROR_FAIL;  goto out;
diff --git a/tools/libs/stat/xenstat.c b/tools/libs/stat/xenstat.c
index 6f93d4e982..e49689aa2d 100644
--- a/tools/libs/stat/xenstat.c
+++ b/tools/libs/stat/xenstat.c
@@ -107,7 +107,7 @@ xenstat_handle *xenstat_init(void)
 		return NULL;
 	}
 
-	handle->xshandle = xs_daemon_open_readonly(); /* open handle to xenstore*/
+	handle->xshandle = xs_open(0); /* open handle to xenstore*/
 	if (handle->xshandle == NULL) {
 		perror("unable to open xenstore");
 		xc_interface_close(handle->xc_handle);
@@ -125,7 +125,7 @@ void xenstat_uninit(xenstat_handle * handle)
 		for (i = 0; i < NUM_COLLECTORS; i++)
 			collectors[i].uninit(handle);
 		xc_interface_close(handle->xc_handle);
-		xs_daemon_close(handle->xshandle);
+		xs_close(handle->xshandle);
 		free(handle->priv);
 		free(handle);
 	}
diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index ad4b64fbe3..c8510e6ce9 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -251,7 +251,7 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	char ref[16];
 	char* domid_str = NULL;
 	xs_transaction_t xs_trans = XBT_NULL;
-	xs = xs_domain_open();
+	xs = xs_open(0);
 	if (!xs)
 		goto fail;
 	domid_str = xs_read(xs, 0, "domid", NULL);
@@ -293,7 +293,7 @@ retry_transaction:
 	}
  fail_xs_open:
 	free(domid_str);
-	xs_daemon_close(xs);
+	xs_close(xs);
  fail:
 	return ret;
 }
@@ -408,9 +408,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	ctrl->write.order = ctrl->read.order = 0;
 	ctrl->is_server = 0;
 
-	xs = xs_daemon_open();
-	if (!xs)
-		xs = xs_domain_open();
+	xs = xs_open(0);
 	if (!xs)
 		goto fail;
 
@@ -452,7 +450,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 
  out:
 	if (xs)
-		xs_daemon_close(xs);
+		xs_close(xs);
 	return ctrl;
  fail:
 	libxenvchan_close(ctrl);
diff --git a/tools/misc/xen-lowmemd.c b/tools/misc/xen-lowmemd.c
index 79ad34cb4a..a3a2741242 100644
--- a/tools/misc/xen-lowmemd.c
+++ b/tools/misc/xen-lowmemd.c
@@ -24,7 +24,7 @@ void cleanup(void)
     if (xch)
         xc_interface_close(xch);
     if (xs_handle)
-        xs_daemon_close(xs_handle);
+        xs_close(xs_handle);
 }
 
 /* Never shrink dom0 below 1 GiB */
@@ -102,7 +102,7 @@ int main(int argc, char *argv[])
         return 2;
     }
 
-    xs_handle = xs_daemon_open();
+    xs_handle = xs_open(0);
     if (xs_handle == NULL)
     {
         perror("Failed to open xenstore connection");
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
index b7d4b6ef5d..0dad7fa5f2 100644
--- a/tools/python/xen/lowlevel/xs/xs.c
+++ b/tools/python/xen/lowlevel/xs/xs.c
@@ -791,7 +791,7 @@ static PyObject *xspy_close(XsHandle *self)
         PySequence_SetItem(self->watches, i, Py_None);
     }
 
-    xs_daemon_close(xh);
+    xs_close(xh);
     self->xh = NULL;
 
     Py_INCREF(Py_None);
@@ -985,7 +985,7 @@ xshandle_init(XsHandle *self, PyObject *args, PyObject *kwds)
                                      &readonly))
         goto fail;
 
-    self->xh = (readonly ? xs_daemon_open_readonly() : xs_daemon_open());
+    self->xh = xs_open(0);
     if (!self->xh)
         goto fail;
 
@@ -999,7 +999,7 @@ xshandle_init(XsHandle *self, PyObject *args, PyObject *kwds)
 static void xshandle_dealloc(XsHandle *self)
 {
     if (self->xh) {
-        xs_daemon_close(self->xh);
+        xs_close(self->xh);
         self->xh = NULL;
     }
 
diff --git a/tools/tests/mce-test/tools/xen-mceinj.c b/tools/tests/mce-test/tools/xen-mceinj.c
index 380e42190c..1187d01e5f 100644
--- a/tools/tests/mce-test/tools/xen-mceinj.c
+++ b/tools/tests/mce-test/tools/xen-mceinj.c
@@ -411,13 +411,13 @@ static long xs_get_dom_mem(int domid)
     unsigned int plen;
     struct xs_handle *xs;
 
-    xs = xs_daemon_open();
+    xs = xs_open(0);
     if (!xs)
         return -1;
 
     sprintf(path, "/local/domain/%d/memory/target", domid);
     memstr = xs_read(xs, XBT_NULL, path, &plen);
-    xs_daemon_close(xs);
+    xs_close(xs);
 
     if (!memstr || !plen)
         return -1;
diff --git a/tools/xenbackendd/xenbackendd.c b/tools/xenbackendd/xenbackendd.c
index b6d92984e0..21884af772 100644
--- a/tools/xenbackendd/xenbackendd.c
+++ b/tools/xenbackendd/xenbackendd.c
@@ -122,7 +122,7 @@ usage(void)
 static int
 xen_setup(void)
 {
-	xs = xs_daemon_open();
+	xs = xs_open(0);
 	if (xs == NULL) {
 		dolog(LOG_ERR,
 		    "Failed to contact xenstore (%s).  Is it running?",
@@ -138,7 +138,7 @@ xen_setup(void)
 
  out:
 	if (xs) {
-		xs_daemon_close(xs);
+		xs_close(xs);
 		xs = NULL;
 	}
 	return -1;
diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index 1c801caa71..35fd1c931a 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -502,18 +502,18 @@ int main(int argc, char *argv[])
 #ifndef RUN_STANDALONE
     daemonize();
 #endif
-    xs = (struct xs_handle *)xs_daemon_open();
+    xs = xs_open(0);
     if ( xs == NULL ) 
         return -1;
 
     if ( write_one_time_battery_info() == 0 ) 
     {
-        xs_daemon_close(xs);
+        xs_close(xs);
         return -1;
     }
 
     wait_for_and_update_battery_status_request();
-    xs_daemon_close(xs);
+    xs_close(xs);
     return 0;
 }
 
-- 
2.26.2


