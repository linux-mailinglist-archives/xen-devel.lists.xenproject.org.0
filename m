Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E64AB521
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 07:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266410.460129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxio-00047E-Mu; Mon, 07 Feb 2022 06:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266410.460129; Mon, 07 Feb 2022 06:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxio-00044M-Ig; Mon, 07 Feb 2022 06:41:58 +0000
Received: by outflank-mailman (input) for mailman id 266410;
 Mon, 07 Feb 2022 06:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nGxil-0002yP-L1
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 06:41:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 089b9bab-87e1-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 07:41:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43AC9210F4;
 Mon,  7 Feb 2022 06:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EDF813519;
 Mon,  7 Feb 2022 06:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mO8+AjC/AGLDUgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 06:41:52 +0000
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
X-Inumbo-ID: 089b9bab-87e1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644216112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioM7WbcIe/sYDvywckVh1bsSGpG8hSYfcSzh25quefQ=;
	b=OQm9h6XcTy99/JQla5bATAjEhu4IRwHJnc5E3OY+J5QZWS3Bl+/OCZm9fOBkOmlW8A3C9W
	aNunZXUHYZTjgGf4ygUODxgo02tQYp4KyuWtXONvvflZHbU+nDZ5XX/CPZS7Xb/LYM7rm6
	j/OZ5dFLpq80A6mDyvYbQKysLXDW7Io=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/5] tools/libs/light: replace _libxl_list.h with _xen_list.h
Date: Mon,  7 Feb 2022 07:41:44 +0100
Message-Id: <20220207064147.9585-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207064147.9585-1-jgross@suse.com>
References: <20220207064147.9585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove generating _libxl_list.h and use the common _xen_list.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/libxl.h                |   4 +-
 tools/libs/light/Makefile            |  10 +--
 tools/libs/light/libxl.c             |  40 ++++-----
 tools/libs/light/libxl_aoutils.c     |  20 ++---
 tools/libs/light/libxl_device.c      |  27 +++---
 tools/libs/light/libxl_disk.c        |   4 +-
 tools/libs/light/libxl_domain.c      |  18 ++--
 tools/libs/light/libxl_event.c       | 128 +++++++++++++--------------
 tools/libs/light/libxl_fork.c        |  44 ++++-----
 tools/libs/light/libxl_internal.h    |  86 +++++++++---------
 tools/libs/light/libxl_qmp.c         |  19 ++--
 tools/libs/light/libxl_stream_read.c |  20 ++---
 12 files changed, 206 insertions(+), 214 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..51a9b6cfac 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -747,7 +747,7 @@
 typedef struct libxl__ctx libxl_ctx;
 
 #include <libxl_uuid.h>
-#include <_libxl_list.h>
+#include <_xen_list.h>
 
 /* API compatibility. */
 #ifdef LIBXL_API_VERSION
@@ -1448,7 +1448,7 @@ typedef struct {
 } libxl_enum_string_table;
 
 struct libxl_event;
-typedef LIBXL_TAILQ_ENTRY(struct libxl_event) libxl_ev_link;
+typedef XEN_TAILQ_ENTRY(struct libxl_event) libxl_ev_link;
 
 /*
  * A boolean variable with an explicit default state.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index be32d95d39..5642955672 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -153,14 +153,14 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
 TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
 TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
 
-AUTOINCS = $(XEN_INCLUDE)/_libxl_list.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
+AUTOINCS = _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
 AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
 
 CLIENTS = testidl libxl-save-helper
 
 SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
 
-LIBHEADER := libxl.h libxl_event.h libxl_json.h _libxl_types.h _libxl_types_json.h _libxl_list.h libxl_utils.h libxl_uuid.h
+LIBHEADER := libxl.h libxl_event.h libxl_json.h _libxl_types.h _libxl_types_json.h libxl_utils.h libxl_uuid.h
 
 NO_HEADERS_CHK := y
 
@@ -201,17 +201,13 @@ _libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
 		>$@.new
 	mv -f $@.new $@
 
-$(XEN_INCLUDE)/_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=libxl >$(notdir $@).new
-	$(call move-if-changed,$(notdir $@).new,$@)
-
 _libxl_save_msgs_helper.c _libxl_save_msgs_callout.c \
 _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 		libxl_save_msgs_gen.pl
 	$(PERL) -w $< $@ >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-$(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h $(XEN_INCLUDE)/_libxl_list.h
+$(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
 $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
 libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
 libxl_internal_json.h: _libxl_types_internal_json.h
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 667ae6409b..a0bf7d186f 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -41,29 +41,29 @@ int libxl_ctx_alloc(libxl_ctx **pctx, int version,
     ctx->nogc_gc.alloc_maxsize = -1;
     ctx->nogc_gc.owner = ctx;
 
-    LIBXL_TAILQ_INIT(&ctx->occurred);
+    XEN_TAILQ_INIT(&ctx->occurred);
 
     ctx->osevent_hooks = 0;
 
     ctx->poller_app = 0;
-    LIBXL_LIST_INIT(&ctx->pollers_event);
-    LIBXL_LIST_INIT(&ctx->pollers_idle);
-    LIBXL_LIST_INIT(&ctx->pollers_active);
+    XEN_LIST_INIT(&ctx->pollers_event);
+    XEN_LIST_INIT(&ctx->pollers_idle);
+    XEN_LIST_INIT(&ctx->pollers_active);
 
-    LIBXL_LIST_INIT(&ctx->efds);
-    LIBXL_TAILQ_INIT(&ctx->etimes);
+    XEN_LIST_INIT(&ctx->efds);
+    XEN_TAILQ_INIT(&ctx->etimes);
 
     ctx->watch_slots = 0;
-    LIBXL_SLIST_INIT(&ctx->watch_freeslots);
+    XEN_SLIST_INIT(&ctx->watch_freeslots);
     libxl__ev_fd_init(&ctx->watch_efd);
 
     ctx->xce = 0;
-    LIBXL_LIST_INIT(&ctx->evtchns_waiting);
+    XEN_LIST_INIT(&ctx->evtchns_waiting);
     libxl__ev_fd_init(&ctx->evtchn_efd);
 
-    LIBXL_LIST_INIT(&ctx->aos_inprogress);
+    XEN_LIST_INIT(&ctx->aos_inprogress);
 
-    LIBXL_TAILQ_INIT(&ctx->death_list);
+    XEN_TAILQ_INIT(&ctx->death_list);
     libxl__ev_xswatch_init(&ctx->death_watch);
 
     ctx->childproc_hooks = &libxl__childproc_default_hooks;
@@ -122,14 +122,14 @@ int libxl_ctx_alloc(libxl_ctx **pctx, int version,
 static void free_disable_deaths(libxl__gc *gc,
                                 struct libxl__evgen_domain_death_list *l) {
     libxl_evgen_domain_death *death;
-    while ((death = LIBXL_TAILQ_FIRST(l)))
+    while ((death = XEN_TAILQ_FIRST(l)))
         libxl__evdisable_domain_death(gc, death);
 }
 
 static void discard_events(struct libxl__event_list *l) {
     /* doesn't bother unlinking from the list, so l is corrupt on return */
     libxl_event *ev, *next;
-    LIBXL_TAILQ_FOREACH_SAFE(ev, l, link, next)
+    XEN_TAILQ_FOREACH_SAFE(ev, l, link, next)
         libxl_event_free(0, ev);
 }
 
@@ -150,7 +150,7 @@ int libxl_ctx_free(libxl_ctx *ctx)
     free_disable_deaths(gc, &CTX->death_reported);
 
     libxl_evgen_disk_eject *eject;
-    while ((eject = LIBXL_LIST_FIRST(&CTX->disk_eject_evgens)))
+    while ((eject = XEN_LIST_FIRST(&CTX->disk_eject_evgens)))
         libxl__evdisable_disk_eject(gc, eject);
 
     libxl_childproc_setmode(CTX,0,0);
@@ -162,10 +162,10 @@ int libxl_ctx_free(libxl_ctx *ctx)
 
     /* Now there should be no more events requested from the application: */
 
-    assert(LIBXL_LIST_EMPTY(&ctx->efds));
-    assert(LIBXL_TAILQ_EMPTY(&ctx->etimes));
-    assert(LIBXL_LIST_EMPTY(&ctx->evtchns_waiting));
-    assert(LIBXL_LIST_EMPTY(&ctx->aos_inprogress));
+    assert(XEN_LIST_EMPTY(&ctx->efds));
+    assert(XEN_TAILQ_EMPTY(&ctx->etimes));
+    assert(XEN_LIST_EMPTY(&ctx->evtchns_waiting));
+    assert(XEN_LIST_EMPTY(&ctx->aos_inprogress));
 
     if (ctx->xch) xc_interface_close(ctx->xch);
     libxl_version_info_dispose(&ctx->version_info);
@@ -174,10 +174,10 @@ int libxl_ctx_free(libxl_ctx *ctx)
 
     libxl__poller_put(ctx, ctx->poller_app);
     ctx->poller_app = NULL;
-    assert(LIBXL_LIST_EMPTY(&ctx->pollers_event));
-    assert(LIBXL_LIST_EMPTY(&ctx->pollers_active));
+    assert(XEN_LIST_EMPTY(&ctx->pollers_event));
+    assert(XEN_LIST_EMPTY(&ctx->pollers_active));
     libxl__poller *poller, *poller_tmp;
-    LIBXL_LIST_FOREACH_SAFE(poller, &ctx->pollers_idle, entry, poller_tmp) {
+    XEN_LIST_FOREACH_SAFE(poller, &ctx->pollers_idle, entry, poller_tmp) {
         libxl__poller_dispose(poller);
         free(poller);
     }
diff --git a/tools/libs/light/libxl_aoutils.c b/tools/libs/light/libxl_aoutils.c
index c4c095a5ba..c2d42e7cac 100644
--- a/tools/libs/light/libxl_aoutils.c
+++ b/tools/libs/light/libxl_aoutils.c
@@ -106,7 +106,7 @@ void libxl__datacopier_init(libxl__datacopier_state *dc)
     libxl__ao_abortable_init(&dc->abrt);
     libxl__ev_fd_init(&dc->toread);
     libxl__ev_fd_init(&dc->towrite);
-    LIBXL_TAILQ_INIT(&dc->bufs);
+    XEN_TAILQ_INIT(&dc->bufs);
 }
 
 void libxl__datacopier_kill(libxl__datacopier_state *dc)
@@ -117,9 +117,9 @@ void libxl__datacopier_kill(libxl__datacopier_state *dc)
     libxl__ao_abortable_deregister(&dc->abrt);
     libxl__ev_fd_deregister(gc, &dc->toread);
     libxl__ev_fd_deregister(gc, &dc->towrite);
-    LIBXL_TAILQ_FOREACH_SAFE(buf, &dc->bufs, entry, tbuf)
+    XEN_TAILQ_FOREACH_SAFE(buf, &dc->bufs, entry, tbuf)
         free(buf);
-    LIBXL_TAILQ_INIT(&dc->bufs);
+    XEN_TAILQ_INIT(&dc->bufs);
 }
 
 static void datacopier_callback(libxl__egc *egc, libxl__datacopier_state *dc,
@@ -182,7 +182,7 @@ void libxl__datacopier_prefixdata(libxl__egc *egc, libxl__datacopier_state *dc,
         memcpy(buf->buf, ptr, buf->used);
 
         dc->used += buf->used;
-        LIBXL_TAILQ_INSERT_TAIL(&dc->bufs, buf, entry);
+        XEN_TAILQ_INSERT_TAIL(&dc->bufs, buf, entry);
     }
 }
 
@@ -235,18 +235,18 @@ static void datacopier_readable(libxl__egc *egc, libxl__ev_fd *ev,
             r = read(ev->fd, dc->readbuf + dc->used, dc->bytes_to_read);
         } else {
             while (dc->used >= dc->maxsz) {
-                libxl__datacopier_buf *rm = LIBXL_TAILQ_FIRST(&dc->bufs);
+                libxl__datacopier_buf *rm = XEN_TAILQ_FIRST(&dc->bufs);
                 dc->used -= rm->used;
                 assert(dc->used >= 0);
-                LIBXL_TAILQ_REMOVE(&dc->bufs, rm, entry);
+                XEN_TAILQ_REMOVE(&dc->bufs, rm, entry);
                 free(rm);
             }
 
-            buf = LIBXL_TAILQ_LAST(&dc->bufs, libxl__datacopier_bufs);
+            buf = XEN_TAILQ_LAST(&dc->bufs, libxl__datacopier_bufs);
             if (!buf || buf->used >= sizeof(buf->buf)) {
                 buf = libxl__malloc(NOGC, sizeof(*buf));
                 buf->used = 0;
-                LIBXL_TAILQ_INSERT_TAIL(&dc->bufs, buf, entry);
+                XEN_TAILQ_INSERT_TAIL(&dc->bufs, buf, entry);
             }
             r = read(ev->fd, buf->buf + buf->used,
                      min_t(size_t, sizeof(buf->buf) - buf->used,
@@ -331,11 +331,11 @@ static void datacopier_writable(libxl__egc *egc, libxl__ev_fd *ev,
     }
     assert(revents & POLLOUT);
     for (;;) {
-        libxl__datacopier_buf *buf = LIBXL_TAILQ_FIRST(&dc->bufs);
+        libxl__datacopier_buf *buf = XEN_TAILQ_FIRST(&dc->bufs);
         if (!buf)
             break;
         if (!buf->used) {
-            LIBXL_TAILQ_REMOVE(&dc->bufs, buf, entry);
+            XEN_TAILQ_REMOVE(&dc->bufs, buf, entry);
             free(buf);
             continue;
         }
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 36c4e41e4d..e6025d135e 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1476,7 +1476,7 @@ static void qdisk_spawn_outcome(libxl__egc *egc, libxl__dm_spawn_state *dmss,
  */
 typedef struct libxl__ddomain_device {
     libxl__device *dev;
-    LIBXL_SLIST_ENTRY(struct libxl__ddomain_device) next;
+    XEN_SLIST_ENTRY(struct libxl__ddomain_device) next;
 } libxl__ddomain_device;
 
 /*
@@ -1485,8 +1485,8 @@ typedef struct libxl__ddomain_device {
 typedef struct libxl__ddomain_guest {
     uint32_t domid;
     int num_qdisks;
-    LIBXL_SLIST_HEAD(, struct libxl__ddomain_device) devices;
-    LIBXL_SLIST_ENTRY(struct libxl__ddomain_guest) next;
+    XEN_SLIST_HEAD(, struct libxl__ddomain_device) devices;
+    XEN_SLIST_ENTRY(struct libxl__ddomain_guest) next;
 } libxl__ddomain_guest;
 
 /*
@@ -1496,7 +1496,7 @@ typedef struct libxl__ddomain_guest {
 typedef struct {
     libxl__ao *ao;
     libxl__ev_xswatch watch;
-    LIBXL_SLIST_HEAD(, struct libxl__ddomain_guest) guests;
+    XEN_SLIST_HEAD(, struct libxl__ddomain_guest) guests;
 } libxl__ddomain;
 
 static libxl__ddomain_guest *search_for_guest(libxl__ddomain *ddomain,
@@ -1504,7 +1504,7 @@ static libxl__ddomain_guest *search_for_guest(libxl__ddomain *ddomain,
 {
     libxl__ddomain_guest *dguest;
 
-    LIBXL_SLIST_FOREACH(dguest, &ddomain->guests, next) {
+    XEN_SLIST_FOREACH(dguest, &ddomain->guests, next) {
         if (dguest->domid == domid)
             return dguest;
     }
@@ -1516,7 +1516,7 @@ static libxl__ddomain_device *search_for_device(libxl__ddomain_guest *dguest,
 {
     libxl__ddomain_device *ddev;
 
-    LIBXL_SLIST_FOREACH(ddev, &dguest->devices, next) {
+    XEN_SLIST_FOREACH(ddev, &dguest->devices, next) {
 #define LIBXL_DEVICE_CMP(dev1, dev2, entry) (dev1->entry == dev2->entry)
         if (LIBXL_DEVICE_CMP(ddev->dev, dev, backend_devid) &&
             LIBXL_DEVICE_CMP(ddev->dev, dev, backend_domid) &&
@@ -1537,8 +1537,8 @@ static void check_and_maybe_remove_guest(libxl__gc *gc,
 {
     assert(ddomain);
 
-    if (dguest != NULL && LIBXL_SLIST_FIRST(&dguest->devices) == NULL) {
-        LIBXL_SLIST_REMOVE(&ddomain->guests, dguest, libxl__ddomain_guest,
+    if (dguest != NULL && XEN_SLIST_FIRST(&dguest->devices) == NULL) {
+        XEN_SLIST_REMOVE(&ddomain->guests, dguest, libxl__ddomain_guest,
                            next);
         LOGD(DEBUG, dguest->domid, "Removed domain from the list of active guests");
         /* Clear any leftovers in libxl/<domid> */
@@ -1572,7 +1572,7 @@ static int add_device(libxl__egc *egc, libxl__ao *ao,
     ddev = libxl__zalloc(NOGC, sizeof(*ddev));
     ddev->dev = libxl__zalloc(NOGC, sizeof(*ddev->dev));
     *ddev->dev = *dev;
-    LIBXL_SLIST_INSERT_HEAD(&dguest->devices, ddev, next);
+    XEN_SLIST_INSERT_HEAD(&dguest->devices, ddev, next);
     LOGD(DEBUG, dev->domid, "Added device %s to the list of active devices",
          libxl__device_backend_path(gc, dev));
 
@@ -1649,8 +1649,7 @@ static int remove_device(libxl__egc *egc, libxl__ao *ao,
      * above or from add_device make a copy of the data they use, so
      * there's no risk of dereferencing.
      */
-    LIBXL_SLIST_REMOVE(&dguest->devices, ddev, libxl__ddomain_device,
-                       next);
+    XEN_SLIST_REMOVE(&dguest->devices, ddev, libxl__ddomain_device, next);
     LOGD(DEBUG, dev->domid, "Removed device %s from the list of active devices",
          libxl__device_backend_path(gc, dev));
 
@@ -1716,8 +1715,8 @@ static void backend_watch_callback(libxl__egc *egc, libxl__ev_xswatch *watch,
         /* Create a new guest struct and initialize it */
         dguest = libxl__zalloc(NOGC, sizeof(*dguest));
         dguest->domid = dev->domid;
-        LIBXL_SLIST_INIT(&dguest->devices);
-        LIBXL_SLIST_INSERT_HEAD(&ddomain->guests, dguest, next);
+        XEN_SLIST_INIT(&dguest->devices);
+        XEN_SLIST_INSERT_HEAD(&ddomain->guests, dguest, next);
         LOGD(DEBUG, dguest->domid, "Added domain to the list of active guests");
     }
     ddev = search_for_device(dguest, dev);
@@ -1766,7 +1765,7 @@ int libxl_device_events_handler(libxl_ctx *ctx,
     int i, j, k;
 
     ddomain.ao = ao;
-    LIBXL_SLIST_INIT(&ddomain.guests);
+    XEN_SLIST_INIT(&ddomain.guests);
 
     rc = libxl__get_domid(gc, &domid);
     if (rc) {
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 93936d0dd0..a5ca77850f 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -88,7 +88,7 @@ int libxl_evenable_disk_eject(libxl_ctx *ctx, uint32_t guest_domid,
     memset(evg, 0, sizeof(*evg));
     evg->user = user;
     evg->domid = guest_domid;
-    LIBXL_LIST_INSERT_HEAD(&CTX->disk_eject_evgens, evg, entry);
+    XEN_LIST_INSERT_HEAD(&CTX->disk_eject_evgens, evg, entry);
 
     uint32_t domid = libxl_get_stubdom_id(ctx, guest_domid);
 
@@ -133,7 +133,7 @@ int libxl_evenable_disk_eject(libxl_ctx *ctx, uint32_t guest_domid,
 void libxl__evdisable_disk_eject(libxl__gc *gc, libxl_evgen_disk_eject *evg) {
     CTX_LOCK;
 
-    LIBXL_LIST_REMOVE(evg, entry);
+    XEN_LIST_REMOVE(evg, entry);
 
     if (libxl__ev_xswatch_isregistered(&evg->watch))
         libxl__ev_xswatch_deregister(gc, &evg->watch);
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 544a9bf59d..d544a60777 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -867,7 +867,7 @@ static void domain_death_occurred(libxl__egc *egc,
 
     LOGD(DEBUG, evg->domid, "%s", why);
 
-    libxl_evgen_domain_death *evg_next = LIBXL_TAILQ_NEXT(evg, entry);
+    libxl_evgen_domain_death *evg_next = XEN_TAILQ_NEXT(evg, entry);
     *evg_upd = evg_next;
 
     libxl_event *ev = NEW_EVENT(egc, DOMAIN_DEATH, evg->domid, evg->user);
@@ -875,8 +875,8 @@ static void domain_death_occurred(libxl__egc *egc,
     libxl__event_occurred(egc, ev);
 
     evg->death_reported = 1;
-    LIBXL_TAILQ_REMOVE(&CTX->death_list, evg, entry);
-    LIBXL_TAILQ_INSERT_HEAD(&CTX->death_reported, evg, entry);
+    XEN_TAILQ_REMOVE(&CTX->death_list, evg, entry);
+    XEN_TAILQ_INSERT_HEAD(&CTX->death_reported, evg, entry);
 }
 
 static void domain_death_xswatch_callback(libxl__egc *egc, libxl__ev_xswatch *w,
@@ -887,12 +887,12 @@ static void domain_death_xswatch_callback(libxl__egc *egc, libxl__ev_xswatch *w,
 
     CTX_LOCK;
 
-    evg = LIBXL_TAILQ_FIRST(&CTX->death_list);
+    evg = XEN_TAILQ_FIRST(&CTX->death_list);
 
     for (;;) {
         if (!evg) goto out;
 
-        int nentries = LIBXL_TAILQ_NEXT(evg, entry) ? 200 : 1;
+        int nentries = XEN_TAILQ_NEXT(evg, entry) ? 200 : 1;
         xc_domaininfo_t domaininfos[nentries];
         const xc_domaininfo_t *got = domaininfos, *gotend;
 
@@ -966,7 +966,7 @@ static void domain_death_xswatch_callback(libxl__egc *egc, libxl__ev_xswatch *w,
 
                 evg->shutdown_reported = 1;
             }
-            evg = LIBXL_TAILQ_NEXT(evg, entry);
+            evg = XEN_TAILQ_NEXT(evg, entry);
         }
 
         assert(rc); /* rc==0 results in us eating all evgs and quitting */
@@ -1015,13 +1015,13 @@ void libxl__evdisable_domain_death(libxl__gc *gc,
     CTX_LOCK;
 
     if (!evg->death_reported)
-        LIBXL_TAILQ_REMOVE(&CTX->death_list, evg, entry);
+        XEN_TAILQ_REMOVE(&CTX->death_list, evg, entry);
     else
-        LIBXL_TAILQ_REMOVE(&CTX->death_reported, evg, entry);
+        XEN_TAILQ_REMOVE(&CTX->death_reported, evg, entry);
 
     free(evg);
 
-    if (!LIBXL_TAILQ_FIRST(&CTX->death_list) &&
+    if (!XEN_TAILQ_FIRST(&CTX->death_list) &&
         libxl__ev_xswatch_isregistered(&CTX->death_watch))
         libxl__ev_xswatch_deregister(gc, &CTX->death_watch);
 
diff --git a/tools/libs/light/libxl_event.c b/tools/libs/light/libxl_event.c
index 7c5387e94f..c8bcd13960 100644
--- a/tools/libs/light/libxl_event.c
+++ b/tools/libs/light/libxl_event.c
@@ -165,7 +165,7 @@ static void ao__check_destroy(libxl_ctx *ctx, libxl__ao *ao);
  */
 static void pollers_note_osevent_added(libxl_ctx *ctx) {
     libxl__poller *poller;
-    LIBXL_LIST_FOREACH(poller, &ctx->pollers_active, active_entry)
+    XEN_LIST_FOREACH(poller, &ctx->pollers_active, active_entry)
         poller->osevents_added = 1;
 }
 
@@ -189,7 +189,7 @@ void libxl__egc_ao_cleanup_1_baton(libxl__gc *gc)
     if (CTX->poller_app->osevents_added)
         baton_wake(gc, CTX->poller_app);
 
-    LIBXL_LIST_FOREACH(search, &CTX->pollers_active, active_entry) {
+    XEN_LIST_FOREACH(search, &CTX->pollers_active, active_entry) {
         if (search == CTX->poller_app)
             /* This one is special.  We can't give it the baton. */
             continue;
@@ -279,7 +279,7 @@ void libxl__egc_ao_cleanup_1_baton(libxl__gc *gc)
 struct libxl__osevent_hook_nexus {
     void *ev;
     void *for_app_reg;
-    LIBXL_SLIST_ENTRY(libxl__osevent_hook_nexus) next;
+    XEN_SLIST_ENTRY(libxl__osevent_hook_nexus) next;
 };
 
 static void *osevent_ev_from_hook_nexus(libxl_ctx *ctx,
@@ -293,7 +293,7 @@ static void osevent_release_nexus(libxl__gc *gc,
                                   libxl__osevent_hook_nexus *nexus)
 {
     nexus->ev = 0;
-    LIBXL_SLIST_INSERT_HEAD(nexi_idle, nexus, next);
+    XEN_SLIST_INSERT_HEAD(nexi_idle, nexus, next);
 }
 
 /*----- OSEVENT* hook functions for nexusop "alloc" -----*/
@@ -301,9 +301,9 @@ static void osevent_hook_pre_alloc(libxl__gc *gc, void *ev,
                                    libxl__osevent_hook_nexi *nexi_idle,
                                    libxl__osevent_hook_nexus **nexus_r)
 {
-    libxl__osevent_hook_nexus *nexus = LIBXL_SLIST_FIRST(nexi_idle);
+    libxl__osevent_hook_nexus *nexus = XEN_SLIST_FIRST(nexi_idle);
     if (nexus) {
-        LIBXL_SLIST_REMOVE_HEAD(nexi_idle, next);
+        XEN_SLIST_REMOVE_HEAD(nexi_idle, next);
     } else {
         nexus = libxl__zalloc(NOGC, sizeof(*nexus));
     }
@@ -364,7 +364,7 @@ int libxl__ev_fd_register(libxl__gc *gc, libxl__ev_fd *ev,
     ev->events = events;
     ev->func = func;
 
-    LIBXL_LIST_INSERT_HEAD(&CTX->efds, ev, entry);
+    XEN_LIST_INSERT_HEAD(&CTX->efds, ev, entry);
     pollers_note_osevent_added(CTX);
 
     rc = 0;
@@ -409,10 +409,10 @@ void libxl__ev_fd_deregister(libxl__gc *gc, libxl__ev_fd *ev)
     DBG("ev_fd=%p deregister fd=%d", ev, ev->fd);
 
     OSEVENT_HOOK_VOID(fd,deregister, release, ev->fd, ev->nexus->for_app_reg);
-    LIBXL_LIST_REMOVE(ev, entry);
+    XEN_LIST_REMOVE(ev, entry);
     ev->fd = -1;
 
-    LIBXL_LIST_FOREACH(poller, &CTX->pollers_active, active_entry)
+    XEN_LIST_FOREACH(poller, &CTX->pollers_active, active_entry)
         poller->fds_deregistered = 1;
 
  out:
@@ -504,7 +504,7 @@ static void time_deregister(libxl__gc *gc, libxl__ev_time *ev)
         OSEVENT_HOOK_VOID(timeout,modify,
                           noop /* release nexus in _occurred_ */,
                           &ev->nexus->for_app_reg, right_away);
-        LIBXL_TAILQ_REMOVE(&CTX->etimes, ev, entry);
+        XEN_TAILQ_REMOVE(&CTX->etimes, ev, entry);
     }
 }
 
@@ -640,7 +640,7 @@ static void time_occurs(libxl__egc *egc, libxl__ev_time *etime, int rc)
 libxl__ev_xswatch *libxl__watch_slot_contents(libxl__gc *gc, int slotnum)
 {
     libxl__ev_watch_slot *slot = &CTX->watch_slots[slotnum];
-    libxl__ev_watch_slot *slotcontents = LIBXL_SLIST_NEXT(slot, empty);
+    libxl__ev_watch_slot *slotcontents = XEN_SLIST_NEXT(slot, empty);
 
     if (slotcontents == NULL ||
         ((uintptr_t)slotcontents >= (uintptr_t)CTX->watch_slots &&
@@ -672,7 +672,7 @@ libxl__ev_xswatch *libxl__watch_slot_contents(libxl__gc *gc, int slotnum)
 static void libxl__set_watch_slot_contents(libxl__ev_watch_slot *slot,
                                            libxl__ev_xswatch *w)
 {
-    /* we look a bit behind the curtain of LIBXL_SLIST, to explicitly
+    /* we look a bit behind the curtain of XEN_SLIST, to explicitly
      * assign to the pointer that's the next link.  See the comment
      * by the definition of libxl__ev_watch_slot */
     slot->empty.sle_next = (void*)w;
@@ -784,7 +784,7 @@ int libxl__ev_xswatch_register(libxl__gc *gc, libxl__ev_xswatch *w,
         if (rc) goto out_rc;
     }
 
-    if (LIBXL_SLIST_EMPTY(&CTX->watch_freeslots)) {
+    if (XEN_SLIST_EMPTY(&CTX->watch_freeslots)) {
         /* Free list is empty so there is not in fact a linked
          * free list in the array and we can safely realloc it */
         int newarraysize = (CTX->watch_nslots + 1) << 2;
@@ -794,14 +794,13 @@ int libxl__ev_xswatch_register(libxl__gc *gc, libxl__ev_xswatch *w,
                            CTX->watch_slots, sizeof(*newarray) * newarraysize);
         if (!newarray) goto out_nomem;
         for (i = CTX->watch_nslots; i < newarraysize; i++)
-            LIBXL_SLIST_INSERT_HEAD(&CTX->watch_freeslots,
-                                    &newarray[i], empty);
+            XEN_SLIST_INSERT_HEAD(&CTX->watch_freeslots, &newarray[i], empty);
         CTX->watch_slots = newarray;
         CTX->watch_nslots = newarraysize;
     }
-    use = LIBXL_SLIST_FIRST(&CTX->watch_freeslots);
+    use = XEN_SLIST_FIRST(&CTX->watch_freeslots);
     assert(use);
-    LIBXL_SLIST_REMOVE_HEAD(&CTX->watch_freeslots, empty);
+    XEN_SLIST_REMOVE_HEAD(&CTX->watch_freeslots, empty);
 
     path_copy = strdup(path);
     if (!path_copy) goto out_nomem;
@@ -832,7 +831,7 @@ int libxl__ev_xswatch_register(libxl__gc *gc, libxl__ev_xswatch *w,
     rc = ERROR_NOMEM;
  out_rc:
     if (use)
-        LIBXL_SLIST_INSERT_HEAD(&CTX->watch_freeslots, use, empty);
+        XEN_SLIST_INSERT_HEAD(&CTX->watch_freeslots, use, empty);
     free(path_copy);
     watches_check_fd_deregister(gc);
     CTX_UNLOCK;
@@ -856,7 +855,7 @@ void libxl__ev_xswatch_deregister(libxl__gc *gc, libxl__ev_xswatch *w)
             LOGEV(ERROR, errno, "remove watch for path %s", w->path);
 
         libxl__ev_watch_slot *slot = &CTX->watch_slots[w->slotnum];
-        LIBXL_SLIST_INSERT_HEAD(&CTX->watch_freeslots, slot, empty);
+        XEN_SLIST_INSERT_HEAD(&CTX->watch_freeslots, slot, empty);
         w->slotnum = -1;
         CTX->nwatches--;
         watches_check_fd_deregister(gc);
@@ -927,7 +926,7 @@ static void evtchn_fd_callback(libxl__egc *egc, libxl__ev_fd *ev,
             return;
         }
 
-        LIBXL_LIST_FOREACH(evev, &CTX->evtchns_waiting, entry)
+        XEN_LIST_FOREACH(evev, &CTX->evtchns_waiting, entry)
             if (port == evev->port)
                 goto found;
         /* not found */
@@ -937,7 +936,7 @@ static void evtchn_fd_callback(libxl__egc *egc, libxl__ev_fd *ev,
     found:
         DBG("ev_evtchn=%p port=%d signaled", evev, port);
         evev->waiting = 0;
-        LIBXL_LIST_REMOVE(evev, entry);
+        XEN_LIST_REMOVE(evev, entry);
         evev->callback(egc, evev);
     }
 }
@@ -972,7 +971,7 @@ int libxl__ctx_evtchn_init(libxl__gc *gc) {
 
 static void evtchn_check_fd_deregister(libxl__gc *gc)
 {
-    if (CTX->xce && LIBXL_LIST_EMPTY(&CTX->evtchns_waiting))
+    if (CTX->xce && XEN_LIST_EMPTY(&CTX->evtchns_waiting))
         libxl__ev_fd_deregister(gc, &CTX->evtchn_efd);
 }
 
@@ -1003,7 +1002,7 @@ int libxl__ev_evtchn_wait(libxl__gc *gc, libxl__ev_evtchn *evev)
     }
 
     evev->waiting = 1;
-    LIBXL_LIST_INSERT_HEAD(&CTX->evtchns_waiting, evev, entry);
+    XEN_LIST_INSERT_HEAD(&CTX->evtchns_waiting, evev, entry);
     return 0;
 
  out:
@@ -1020,7 +1019,7 @@ void libxl__ev_evtchn_cancel(libxl__gc *gc, libxl__ev_evtchn *evev)
         return;
 
     evev->waiting = 0;
-    LIBXL_LIST_REMOVE(evev, entry);
+    XEN_LIST_REMOVE(evev, entry);
     evtchn_check_fd_deregister(gc);
 }
 
@@ -1095,7 +1094,7 @@ int libxl__ev_devstate_wait(libxl__ao *ao, libxl__ev_devstate *ds,
 
 void libxl__ev_immediate_register(libxl__egc *egc, libxl__ev_immediate *ei)
 {
-    LIBXL_STAILQ_INSERT_TAIL(&egc->ev_immediates, ei, entry);
+    XEN_STAILQ_INSERT_TAIL(&egc->ev_immediates, ei, entry);
 }
 
 /*
@@ -1221,7 +1220,7 @@ static int beforepoll_internal(libxl__gc *gc, libxl__poller *poller,
 
 #define REQUIRE_FDS(BODY) do{                                          \
                                                                        \
-        LIBXL_LIST_FOREACH(efd, &CTX->efds, entry)                     \
+        XEN_LIST_FOREACH(efd, &CTX->efds, entry)                       \
             REQUIRE_FD(efd->fd, efd->events, BODY);                    \
                                                                        \
         REQUIRE_FD(poller->wakeup_pipe[0], POLLIN, BODY);              \
@@ -1298,7 +1297,7 @@ static int beforepoll_internal(libxl__gc *gc, libxl__poller *poller,
     poller->fds_deregistered = 0;
     poller->osevents_added = 0;
 
-    libxl__ev_time *etime = LIBXL_TAILQ_FIRST(&CTX->etimes);
+    libxl__ev_time *etime = XEN_TAILQ_FIRST(&CTX->etimes);
     if (etime) {
         int our_timeout;
         struct timeval rel;
@@ -1436,7 +1435,7 @@ static void afterpoll_internal(libxl__egc *egc, libxl__poller *poller,
          * so that we don't call the same function again. */
         int revents;
 
-        LIBXL_LIST_FOREACH(efd, &CTX->efds, entry) {
+        XEN_LIST_FOREACH(efd, &CTX->efds, entry) {
 
             if (!efd->events)
                 continue;
@@ -1454,7 +1453,7 @@ static void afterpoll_internal(libxl__egc *egc, libxl__poller *poller,
     }
 
     for (;;) {
-        libxl__ev_time *etime = LIBXL_TAILQ_FIRST(&CTX->etimes);
+        libxl__ev_time *etime = XEN_TAILQ_FIRST(&CTX->etimes);
         if (!etime)
             break;
 
@@ -1494,8 +1493,8 @@ void libxl_osevent_register_hooks(libxl_ctx *ctx,
 {
     GC_INIT(ctx);
     CTX_LOCK;
-    assert(LIBXL_LIST_EMPTY(&ctx->efds));
-    assert(LIBXL_TAILQ_EMPTY(&ctx->etimes));
+    assert(XEN_LIST_EMPTY(&ctx->efds));
+    assert(XEN_TAILQ_EMPTY(&ctx->etimes));
     ctx->osevent_hooks = hooks;
     ctx->osevent_user = user;
     CTX_UNLOCK;
@@ -1534,7 +1533,7 @@ void libxl_osevent_occurred_timeout(libxl_ctx *ctx, void *for_libxl)
     if (!ev) goto out;
     assert(!ev->infinite);
 
-    LIBXL_TAILQ_REMOVE(&CTX->etimes, ev, entry);
+    XEN_TAILQ_REMOVE(&CTX->etimes, ev, entry);
 
     time_occurs(egc, ev, ERROR_TIMEDOUT);
 
@@ -1577,9 +1576,9 @@ static void egc_run_callbacks(libxl__egc *egc)
     libxl__aop_occurred *aop, *aop_tmp;
     libxl__ev_immediate *ei;
 
-    while (!LIBXL_STAILQ_EMPTY(&egc->ev_immediates)) {
-        ei = LIBXL_STAILQ_FIRST(&egc->ev_immediates);
-        LIBXL_STAILQ_REMOVE_HEAD(&egc->ev_immediates, entry);
+    while (!XEN_STAILQ_EMPTY(&egc->ev_immediates)) {
+        ei = XEN_STAILQ_FIRST(&egc->ev_immediates);
+        XEN_STAILQ_REMOVE_HEAD(&egc->ev_immediates, entry);
         CTX_LOCK;
         /* This callback is internal to libxl and expects CTX to be
          * locked. */
@@ -1587,15 +1586,15 @@ static void egc_run_callbacks(libxl__egc *egc)
         CTX_UNLOCK;
     }
 
-    LIBXL_TAILQ_FOREACH_SAFE(ev, &egc->occurred_for_callback, link, ev_tmp) {
-        LIBXL_TAILQ_REMOVE(&egc->occurred_for_callback, ev, link);
+    XEN_TAILQ_FOREACH_SAFE(ev, &egc->occurred_for_callback, link, ev_tmp) {
+        XEN_TAILQ_REMOVE(&egc->occurred_for_callback, ev, link);
         LOG(DEBUG,"event %p callback type=%s",
             ev, libxl_event_type_to_string(ev->type));
         CTX->event_hooks->event_occurs(CTX->event_hooks_user, ev);
     }
 
-    LIBXL_TAILQ_FOREACH_SAFE(aop, &egc->aops_for_callback, entry, aop_tmp) {
-        LIBXL_TAILQ_REMOVE(&egc->aops_for_callback, aop, entry);
+    XEN_TAILQ_FOREACH_SAFE(aop, &egc->aops_for_callback, entry, aop_tmp) {
+        XEN_TAILQ_REMOVE(&egc->aops_for_callback, aop, entry);
         LOG(DEBUG,"ao %p: progress report: callback aop=%p", aop->ao, aop);
         aop->how->callback(CTX, aop->ev, aop->how->for_callback);
 
@@ -1607,9 +1606,9 @@ static void egc_run_callbacks(libxl__egc *egc)
     }
 
     libxl__ao *ao, *ao_tmp;
-    LIBXL_TAILQ_FOREACH_SAFE(ao, &egc->aos_for_callback,
-                             entry_for_callback, ao_tmp) {
-        LIBXL_TAILQ_REMOVE(&egc->aos_for_callback, ao, entry_for_callback);
+    XEN_TAILQ_FOREACH_SAFE(ao, &egc->aos_for_callback,
+                           entry_for_callback, ao_tmp) {
+        XEN_TAILQ_REMOVE(&egc->aos_for_callback, ao, entry_for_callback);
         LOG(DEBUG,"ao %p: completion callback", ao);
         ao->how.callback(CTX, ao->rc, ao->how.u.for_callback);
         CTX_LOCK;
@@ -1648,12 +1647,12 @@ void libxl__event_occurred(libxl__egc *egc, libxl_event *event)
          * from libxl.  This helps avoid reentrancy bugs: parts of
          * libxl that call libxl__event_occurred do not have to worry
          * that libxl might be reentered at that point. */
-        LIBXL_TAILQ_INSERT_TAIL(&egc->occurred_for_callback, event, link);
+        XEN_TAILQ_INSERT_TAIL(&egc->occurred_for_callback, event, link);
         return;
     } else {
         libxl__poller *poller;
-        LIBXL_TAILQ_INSERT_TAIL(&CTX->occurred, event, link);
-        LIBXL_LIST_FOREACH(poller, &CTX->pollers_event, entry)
+        XEN_TAILQ_INSERT_TAIL(&CTX->occurred, event, link);
+        XEN_LIST_FOREACH(poller, &CTX->pollers_event, entry)
             libxl__poller_wakeup(gc, poller);
     }
 }
@@ -1691,7 +1690,7 @@ static int event_check_internal(libxl__egc *egc, libxl_event **event_r,
     libxl_event *ev;
     int rc;
 
-    LIBXL_TAILQ_FOREACH(ev, &CTX->occurred, link) {
+    XEN_TAILQ_FOREACH(ev, &CTX->occurred, link) {
         if (!(typemask & ((uint64_t)1 << ev->type)))
             continue;
 
@@ -1699,7 +1698,7 @@ static int event_check_internal(libxl__egc *egc, libxl_event **event_r,
             continue;
 
         /* got one! */
-        LIBXL_TAILQ_REMOVE(&CTX->occurred, ev, link);
+        XEN_TAILQ_REMOVE(&CTX->occurred, ev, link);
         *event_r = ev;
         rc = 0;
         goto out;
@@ -1820,9 +1819,9 @@ libxl__poller *libxl__poller_get(libxl__gc *gc)
     /* must be called with ctx locked */
     int rc;
 
-    libxl__poller *p = LIBXL_LIST_FIRST(&CTX->pollers_idle);
+    libxl__poller *p = XEN_LIST_FIRST(&CTX->pollers_idle);
     if (p) {
-        LIBXL_LIST_REMOVE(p, entry);
+        XEN_LIST_REMOVE(p, entry);
     } else {
         p = libxl__zalloc(NOGC, sizeof(*p));
 
@@ -1833,16 +1832,15 @@ libxl__poller *libxl__poller_get(libxl__gc *gc)
         }
     }
 
-    LIBXL_LIST_INSERT_HEAD(&CTX->pollers_active, p,
-                           active_entry);
+    XEN_LIST_INSERT_HEAD(&CTX->pollers_active, p, active_entry);
     return p;
 }
 
 void libxl__poller_put(libxl_ctx *ctx, libxl__poller *p)
 {
     if (!p) return;
-    LIBXL_LIST_REMOVE(p, active_entry);
-    LIBXL_LIST_INSERT_HEAD(&ctx->pollers_idle, p, entry);
+    XEN_LIST_REMOVE(p, active_entry);
+    XEN_LIST_INSERT_HEAD(&ctx->pollers_idle, p, entry);
 }
 
 void libxl__poller_wakeup(libxl__gc *gc, libxl__poller *p)
@@ -2048,7 +2046,7 @@ void libxl__ao_create_fail(libxl__ao *ao)
     assert(!ao->complete);
     assert(!ao->progress_reports_outstanding);
     assert(!ao->aborting);
-    LIBXL_LIST_REMOVE(ao, inprogress_entry);
+    XEN_LIST_REMOVE(ao, inprogress_entry);
     libxl__ao__destroy(CTX, ao);
 }
 
@@ -2070,7 +2068,7 @@ void libxl__ao_complete(libxl__egc *egc, libxl__ao *ao, int rc)
     assert(!ao->nested_progeny);
     ao->complete = 1;
     ao->rc = rc;
-    LIBXL_LIST_REMOVE(ao, inprogress_entry);
+    XEN_LIST_REMOVE(ao, inprogress_entry);
     if (ao->outstanding_killed_child)
         LOG(DEBUG, "ao %p: .. but waiting for %d fork to exit",
             ao, ao->outstanding_killed_child);
@@ -2107,7 +2105,7 @@ void libxl__ao_complete_check_progress_reports(libxl__egc *egc, libxl__ao *ao)
             libxl__poller_wakeup(gc, ao->poller);
     } else if (ao->how.callback) {
         LOG(DEBUG, "ao %p: complete for callback", ao);
-        LIBXL_TAILQ_INSERT_TAIL(&egc->aos_for_callback, ao, entry_for_callback);
+        XEN_TAILQ_INSERT_TAIL(&egc->aos_for_callback, ao, entry_for_callback);
     } else {
         libxl_event *ev;
         ev = NEW_EVENT(egc, OPERATION_COMPLETE, ao->domid, ao->how.u.for_event);
@@ -2148,7 +2146,7 @@ libxl__ao *libxl__ao_create(libxl_ctx *ctx, uint32_t domid,
                "ao %p: create: how=%p callback=%p poller=%p",
                ao, how, ao->how.callback, ao->poller);
 
-    LIBXL_LIST_INSERT_HEAD(&ctx->aos_inprogress, ao, inprogress_entry);
+    XEN_LIST_INSERT_HEAD(&ctx->aos_inprogress, ao, inprogress_entry);
 
     return ao;
 
@@ -2255,7 +2253,7 @@ static int ao__abort(libxl_ctx *ctx, libxl__ao *parent)
 
     parent->aborting = 1;
 
-    if (LIBXL_LIST_EMPTY(&parent->abortables)) {
+    if (XEN_LIST_EMPTY(&parent->abortables)) {
         LIBXL__LOG(ctx, LIBXL__LOG_DEBUG,
                    "ao %p: abort requested and noted, but no-one interested",
                    parent);
@@ -2264,13 +2262,13 @@ static int ao__abort(libxl_ctx *ctx, libxl__ao *parent)
     }
 
     /* We keep calling abort hooks until there are none left */
-    while (!LIBXL_LIST_EMPTY(&parent->abortables)) {
+    while (!XEN_LIST_EMPTY(&parent->abortables)) {
         assert(!parent->complete);
 
-        libxl__ao_abortable *abrt = LIBXL_LIST_FIRST(&parent->abortables);
+        libxl__ao_abortable *abrt = XEN_LIST_FIRST(&parent->abortables);
         assert(parent == ao_nested_root(abrt->ao));
 
-        LIBXL_LIST_REMOVE(abrt, entry);
+        XEN_LIST_REMOVE(abrt, entry);
         abrt->registered = 0;
 
         LIBXL__LOG(ctx, LIBXL__LOG_DEBUG,
@@ -2300,7 +2298,7 @@ int libxl_ao_abort(libxl_ctx *ctx, const libxl_asyncop_how *how)
     libxl__ctx_lock(ctx);
     int rc;
 
-    LIBXL_LIST_FOREACH(search, &ctx->aos_inprogress, inprogress_entry) {
+    XEN_LIST_FOREACH(search, &ctx->aos_inprogress, inprogress_entry) {
         if (how) {
             /* looking for ao to be reported by callback or event */
             if (search->poller)
@@ -2356,7 +2354,7 @@ int libxl__ao_abortable_register(libxl__ao_abortable *abrt)
     }
 
     DBG("ao=%p, abrt=%p: registering (root=%p)", ao, abrt, root);
-    LIBXL_LIST_INSERT_HEAD(&root->abortables, abrt, entry);
+    XEN_LIST_INSERT_HEAD(&root->abortables, abrt, entry);
     abrt->registered = 1;
 
     return 0;
@@ -2372,7 +2370,7 @@ _hidden void libxl__ao_abortable_deregister(libxl__ao_abortable *abrt)
     AO_GC;
 
     DBG("ao=%p, abrt=%p: deregistering (root=%p)", ao, abrt, root);
-    LIBXL_LIST_REMOVE(abrt, entry);
+    XEN_LIST_REMOVE(abrt, entry);
     abrt->registered = 0;
 }
 
@@ -2408,7 +2406,7 @@ void libxl__ao_progress_report(libxl__egc *egc, libxl__ao *ao,
         aop->ao = ao;
         aop->ev = ev;
         aop->how = how;
-        LIBXL_TAILQ_INSERT_TAIL(&egc->aops_for_callback, aop, entry);
+        XEN_TAILQ_INSERT_TAIL(&egc->aops_for_callback, aop, entry);
         LOG(DEBUG,"ao %p: progress report: callback queued aop=%p",ao,aop);
     } else {
         LOG(DEBUG,"ao %p: progress report: event queued ev=%p type=%s",
diff --git a/tools/libs/light/libxl_fork.c b/tools/libs/light/libxl_fork.c
index 5d47dceb8a..676a14bb28 100644
--- a/tools/libs/light/libxl_fork.c
+++ b/tools/libs/light/libxl_fork.c
@@ -37,14 +37,14 @@
  */
 
 struct libxl__carefd {
-    LIBXL_LIST_ENTRY(libxl__carefd) entry;
+    XEN_LIST_ENTRY(libxl__carefd) entry;
     int fd;
 };
 
 static pthread_mutex_t no_forking = PTHREAD_MUTEX_INITIALIZER;
 static int atfork_registered;
-static LIBXL_LIST_HEAD(, libxl__carefd) carefds =
-    LIBXL_LIST_HEAD_INITIALIZER(carefds);
+static XEN_LIST_HEAD(, libxl__carefd) carefds =
+    XEN_LIST_HEAD_INITIALIZER(carefds);
 
 /* Protected against concurrency by no_forking.  sigchld_users is
  * protected against being interrupted by SIGCHLD (and thus read
@@ -52,8 +52,8 @@ static LIBXL_LIST_HEAD(, libxl__carefd) carefds =
  * below). */
 static bool sigchld_installed; /* 0 means not */
 static pthread_mutex_t sigchld_defer_mutex = PTHREAD_MUTEX_INITIALIZER;
-static LIBXL_LIST_HEAD(, libxl_ctx) sigchld_users =
-    LIBXL_LIST_HEAD_INITIALIZER(sigchld_users);
+static XEN_LIST_HEAD(, libxl_ctx) sigchld_users =
+    XEN_LIST_HEAD_INITIALIZER(sigchld_users);
 static struct sigaction sigchld_saved_action;
 
 static void sigchld_removehandler_core(void); /* idempotent */
@@ -105,7 +105,7 @@ libxl__carefd *libxl__carefd_record(libxl_ctx *ctx, int fd)
     libxl_fd_set_cloexec(ctx, fd, 1);
     cf = libxl__zalloc(&ctx->nogc_gc, sizeof(*cf));
     cf->fd = fd;
-    LIBXL_LIST_INSERT_HEAD(&carefds, cf, entry);
+    XEN_LIST_INSERT_HEAD(&carefds, cf, entry);
     return cf;
 }
 
@@ -141,7 +141,7 @@ void libxl_postfork_child_noexec(libxl_ctx *ctx)
 
     atfork_lock();
 
-    LIBXL_LIST_FOREACH_SAFE(cf, &carefds, entry, cf_tmp) {
+    XEN_LIST_FOREACH_SAFE(cf, &carefds, entry, cf_tmp) {
         if (cf->fd >= 0) {
             r = close(cf->fd);
             if (r)
@@ -151,7 +151,7 @@ void libxl_postfork_child_noexec(libxl_ctx *ctx)
         }
         free(cf);
     }
-    LIBXL_LIST_INIT(&carefds);
+    XEN_LIST_INIT(&carefds);
 
     if (sigchld_installed) {
         /* We are in theory not at risk of concurrent execution of the
@@ -172,7 +172,7 @@ void libxl_postfork_child_noexec(libxl_ctx *ctx)
          * use SIGCHLD, but instead just waits for the child(ren). */
         defer_sigchld();
 
-        LIBXL_LIST_INIT(&sigchld_users);
+        XEN_LIST_INIT(&sigchld_users);
         /* After this the ->sigchld_user_registered entries in the
          * now-obsolete contexts may be lies.  But that's OK because
          * no-one will look at them. */
@@ -190,7 +190,7 @@ int libxl__carefd_close(libxl__carefd *cf)
     atfork_lock();
     int r = cf->fd < 0 ? 0 : close(cf->fd);
     int esave = errno;
-    LIBXL_LIST_REMOVE(cf, entry);
+    XEN_LIST_REMOVE(cf, entry);
     atfork_unlock();
     free(cf);
     errno = esave;
@@ -238,7 +238,7 @@ static void sigchld_handler(int signo)
     int r = pthread_mutex_lock(&sigchld_defer_mutex);
     assert(!r);
 
-    LIBXL_LIST_FOREACH(notify, &sigchld_users, sigchld_users_entry) {
+    XEN_LIST_FOREACH(notify, &sigchld_users, sigchld_users_entry) {
         int e = libxl__self_pipe_wakeup(notify->sigchld_selfpipe[1]);
         if (e) abort(); /* errors are probably EBADF, very bad */
     }
@@ -362,11 +362,11 @@ static void sigchld_user_remove(libxl_ctx *ctx) /* idempotent */
     atfork_lock();
     defer_sigchld();
 
-    LIBXL_LIST_REMOVE(ctx, sigchld_users_entry);
+    XEN_LIST_REMOVE(ctx, sigchld_users_entry);
 
     release_sigchld();
 
-    if (LIBXL_LIST_EMPTY(&sigchld_users))
+    if (XEN_LIST_EMPTY(&sigchld_users))
         sigchld_removehandler_core();
 
     atfork_unlock();
@@ -404,7 +404,7 @@ int libxl__sigchld_needed(libxl__gc *gc) /* non-reentrant, idempotent */
 
         defer_sigchld();
 
-        LIBXL_LIST_INSERT_HEAD(&sigchld_users, CTX, sigchld_users_entry);
+        XEN_LIST_INSERT_HEAD(&sigchld_users, CTX, sigchld_users_entry);
 
         release_sigchld();
         atfork_unlock();
@@ -421,7 +421,7 @@ static bool chldmode_ours(libxl_ctx *ctx, bool creating)
 {
     switch (ctx->childproc_hooks->chldowner) {
     case libxl_sigchld_owner_libxl:
-        return creating || !LIBXL_LIST_EMPTY(&ctx->children);
+        return creating || !XEN_LIST_EMPTY(&ctx->children);
     case libxl_sigchld_owner_mainloop:
         return 0;
     case libxl_sigchld_owner_libxl_always:
@@ -452,7 +452,7 @@ static void childproc_reaped_ours(libxl__egc *egc, libxl__ev_child *ch,
                                  int status)
 {
     pid_t pid = ch->pid;
-    LIBXL_LIST_REMOVE(ch, entry);
+    XEN_LIST_REMOVE(ch, entry);
     ch->pid = -1;
     ch->callback(egc, ch, pid, status);
 }
@@ -462,7 +462,7 @@ static int childproc_reaped(libxl__egc *egc, pid_t pid, int status)
     EGC_GC;
     libxl__ev_child *ch;
 
-    LIBXL_LIST_FOREACH(ch, &CTX->children, entry)
+    XEN_LIST_FOREACH(ch, &CTX->children, entry)
         if (ch->pid == pid)
             goto found;
 
@@ -497,7 +497,7 @@ static void childproc_checkall(libxl__egc *egc)
         int status;
         pid_t got;
 
-        LIBXL_LIST_FOREACH(ch, &CTX->children, entry) {
+        XEN_LIST_FOREACH(ch, &CTX->children, entry) {
             got = checked_waitpid(egc, ch->pid, &status);
             if (got)
                 goto found;
@@ -625,7 +625,7 @@ pid_t libxl__ev_child_fork(libxl__gc *gc, libxl__ev_child *ch,
 
     ch->pid = pid;
     ch->callback = death;
-    LIBXL_LIST_INSERT_HEAD(&CTX->children, ch, entry);
+    XEN_LIST_INSERT_HEAD(&CTX->children, ch, entry);
     rc = pid;
 
  out:
@@ -640,7 +640,7 @@ void libxl_childproc_setmode(libxl_ctx *ctx, const libxl_childproc_hooks *hooks,
     GC_INIT(ctx);
     CTX_LOCK;
 
-    assert(LIBXL_LIST_EMPTY(&CTX->children));
+    assert(XEN_LIST_EMPTY(&CTX->children));
 
     if (!hooks)
         hooks = &libxl__childproc_default_hooks;
@@ -698,10 +698,10 @@ void libxl__ev_child_kill_deregister(libxl__ao *ao, libxl__ev_child *ch,
     new_ch->ao = ao;
     new_ch->ch.pid = pid;
     new_ch->ch.callback = deregistered_child_callback;
-    LIBXL_LIST_INSERT_HEAD(&CTX->children, &new_ch->ch, entry);
+    XEN_LIST_INSERT_HEAD(&CTX->children, &new_ch->ch, entry);
     ao->outstanding_killed_child++;
 
-    LIBXL_LIST_REMOVE(ch, entry);
+    XEN_LIST_REMOVE(ch, entry);
     ch->pid = -1;
     int r = kill(pid, sig);
     if (r)
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 37d5c27756..c0e7779d97 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -245,7 +245,7 @@ struct libxl__ev_fd {
     short events;
     libxl__ev_fd_callback *func;
     /* remainder is private for libxl__ev_fd... */
-    LIBXL_LIST_ENTRY(libxl__ev_fd) entry;
+    XEN_LIST_ENTRY(libxl__ev_fd) entry;
     libxl__osevent_hook_nexus *nexus;
 };
 
@@ -260,7 +260,7 @@ struct libxl__ao_abortable {
     libxl__ao_abortable_callback *callback;
     /* remainder is private for abort machinery */
     bool registered;
-    LIBXL_LIST_ENTRY(libxl__ao_abortable) entry;
+    XEN_LIST_ENTRY(libxl__ao_abortable) entry;
     /*
      * For nested aos:
      *  Semantically, abort affects the whole tree of aos,
@@ -296,7 +296,7 @@ struct libxl__ev_time {
     libxl__ev_time_callback *func;
     /* remainder is private for libxl__ev_time... */
     int infinite; /* not registered in list or with app if infinite */
-    LIBXL_TAILQ_ENTRY(libxl__ev_time) entry;
+    XEN_TAILQ_ENTRY(libxl__ev_time) entry;
     struct timeval abs;
     libxl__osevent_hook_nexus *nexus;
     libxl__ao_abortable abrt;
@@ -323,7 +323,7 @@ struct libxl__ev_evtchn {
     int port;
     /* remainder is private for libxl__ev_evtchn_... */
     bool waiting;
-    LIBXL_LIST_ENTRY(libxl__ev_evtchn) entry;
+    XEN_LIST_ENTRY(libxl__ev_evtchn) entry;
 };
 
 /*
@@ -341,7 +341,7 @@ struct libxl__ev_evtchn {
  * xswatch pointers when we store and retrieve them.
  */
 typedef struct libxl__ev_watch_slot {
-    LIBXL_SLIST_ENTRY(struct libxl__ev_watch_slot) empty;
+    XEN_SLIST_ENTRY(struct libxl__ev_watch_slot) empty;
 } libxl__ev_watch_slot;
 
 _hidden libxl__ev_xswatch *libxl__watch_slot_contents(libxl__gc *gc,
@@ -357,7 +357,7 @@ struct libxl__ev_child {
     pid_t pid; /* -1 means unused ("unregistered", ie Idle) */
     libxl__ev_child_callback *callback;
     /* remainder is private for libxl__ev_... */
-    LIBXL_LIST_ENTRY(struct libxl__ev_child) entry;
+    XEN_LIST_ENTRY(struct libxl__ev_child) entry;
 };
 
 /* libxl__ev_immediate
@@ -370,7 +370,7 @@ struct libxl__ev_immediate {
     /* filled by user */
     void (*callback)(libxl__egc *, libxl__ev_immediate *);
     /* private to libxl__ev_immediate */
-    LIBXL_STAILQ_ENTRY(libxl__ev_immediate) entry;
+    XEN_STAILQ_ENTRY(libxl__ev_immediate) entry;
 };
 void libxl__ev_immediate_register(libxl__egc *, libxl__ev_immediate *);
 
@@ -582,7 +582,7 @@ _hidden void libxl__qmp_param_add_integer(libxl__gc *gc,
 struct libxl__evgen_domain_death {
     uint32_t domid;
     unsigned shutdown_reported:1, death_reported:1;
-    LIBXL_TAILQ_ENTRY(libxl_evgen_domain_death) entry;
+    XEN_TAILQ_ENTRY(libxl_evgen_domain_death) entry;
         /* on list .death_reported ? CTX->death_list : CTX->death_reported */
     libxl_ev_user user;
 };
@@ -592,7 +592,7 @@ libxl__evdisable_domain_death(libxl__gc*, libxl_evgen_domain_death*);
 struct libxl__evgen_disk_eject {
     libxl__ev_xswatch watch;
     uint32_t domid;
-    LIBXL_LIST_ENTRY(libxl_evgen_disk_eject) entry;
+    XEN_LIST_ENTRY(libxl_evgen_disk_eject) entry;
     libxl_ev_user user;
     char *vdev, *be_ptr_path;
 };
@@ -620,7 +620,7 @@ struct libxl__poller {
      * The "poller_app" is never idle, but is sometimes on
      * pollers_event.
      */
-    LIBXL_LIST_ENTRY(libxl__poller) entry;
+    XEN_LIST_ENTRY(libxl__poller) entry;
 
     struct pollfd *fd_polls;
     int fd_polls_allocd;
@@ -653,7 +653,7 @@ struct libxl__poller {
      * a promise to also make this check, so the baton will never be
      * dropped.
      */
-    LIBXL_LIST_ENTRY(libxl__poller) active_entry;
+    XEN_LIST_ENTRY(libxl__poller) active_entry;
     bool fds_deregistered;
     bool osevents_added;
 };
@@ -687,7 +687,7 @@ struct libxl__ctx {
        * documented in the libxl public interface.
        */
 
-    LIBXL_TAILQ_HEAD(libxl__event_list, libxl_event) occurred;
+    XEN_TAILQ_HEAD(libxl__event_list, libxl_event) occurred;
 
     int osevent_in_hook;
     const libxl_osevent_hooks *osevent_hooks;
@@ -696,40 +696,40 @@ struct libxl__ctx {
        * for restrictions on the use of the osevent fields. */
 
     libxl__poller *poller_app; /* libxl_osevent_beforepoll and _afterpoll */
-    LIBXL_LIST_HEAD(, libxl__poller) pollers_event, pollers_idle;
-    LIBXL_LIST_HEAD(, libxl__poller) pollers_active;
+    XEN_LIST_HEAD(, libxl__poller) pollers_event, pollers_idle;
+    XEN_LIST_HEAD(, libxl__poller) pollers_active;
 
-    LIBXL_SLIST_HEAD(libxl__osevent_hook_nexi, libxl__osevent_hook_nexus)
+    XEN_SLIST_HEAD(libxl__osevent_hook_nexi, libxl__osevent_hook_nexus)
         hook_fd_nexi_idle, hook_timeout_nexi_idle;
-    LIBXL_LIST_HEAD(, libxl__ev_fd) efds;
-    LIBXL_TAILQ_HEAD(, libxl__ev_time) etimes;
+    XEN_LIST_HEAD(, libxl__ev_fd) efds;
+    XEN_TAILQ_HEAD(, libxl__ev_time) etimes;
 
     libxl__ev_watch_slot *watch_slots;
     int watch_nslots, nwatches;
-    LIBXL_SLIST_HEAD(, libxl__ev_watch_slot) watch_freeslots;
+    XEN_SLIST_HEAD(, libxl__ev_watch_slot) watch_freeslots;
     uint32_t watch_counter; /* helps disambiguate slot reuse */
     libxl__ev_fd watch_efd;
 
     xenevtchn_handle *xce; /* waiting must be done only with libxl__ev_evtchn* */
-    LIBXL_LIST_HEAD(, libxl__ev_evtchn) evtchns_waiting;
+    XEN_LIST_HEAD(, libxl__ev_evtchn) evtchns_waiting;
     libxl__ev_fd evtchn_efd;
 
-    LIBXL_LIST_HEAD(, libxl__ao) aos_inprogress;
+    XEN_LIST_HEAD(, libxl__ao) aos_inprogress;
 
-    LIBXL_TAILQ_HEAD(libxl__evgen_domain_death_list, libxl_evgen_domain_death)
+    XEN_TAILQ_HEAD(libxl__evgen_domain_death_list, libxl_evgen_domain_death)
         death_list /* sorted by domid */,
         death_reported;
     libxl__ev_xswatch death_watch;
 
-    LIBXL_LIST_HEAD(, libxl_evgen_disk_eject) disk_eject_evgens;
+    XEN_LIST_HEAD(, libxl_evgen_disk_eject) disk_eject_evgens;
 
     const libxl_childproc_hooks *childproc_hooks;
     void *childproc_user;
     int sigchld_selfpipe[2]; /* [0]==-1 means handler not installed */
     libxl__ev_fd sigchld_selfpipe_efd;
-    LIBXL_LIST_HEAD(, libxl__ev_child) children;
+    XEN_LIST_HEAD(, libxl__ev_child) children;
     bool sigchld_user_registered;
-    LIBXL_LIST_ENTRY(libxl_ctx) sigchld_users_entry;
+    XEN_LIST_ENTRY(libxl_ctx) sigchld_users_entry;
 
     libxl_version_info version_info;
 
@@ -774,9 +774,9 @@ struct libxl__egc {
      * The egc and its gc may be accessed only on the creating thread. */
     struct libxl__gc gc;
     struct libxl__event_list occurred_for_callback;
-    LIBXL_TAILQ_HEAD(, libxl__ao) aos_for_callback;
-    LIBXL_TAILQ_HEAD(, libxl__aop_occurred) aops_for_callback;
-    LIBXL_STAILQ_HEAD(, libxl__ev_immediate) ev_immediates;
+    XEN_TAILQ_HEAD(, libxl__ao) aos_for_callback;
+    XEN_TAILQ_HEAD(, libxl__aop_occurred) aops_for_callback;
+    XEN_STAILQ_HEAD(, libxl__ev_immediate) ev_immediates;
 };
 
 struct libxl__aop_occurred {
@@ -787,7 +787,7 @@ struct libxl__aop_occurred {
      * While an aop exists, it corresponds to one refcount in
      * ao->progress_reports_outstanding, preventing ao destruction.
      */
-    LIBXL_TAILQ_ENTRY(libxl__aop_occurred) entry;
+    XEN_TAILQ_ENTRY(libxl__aop_occurred) entry;
     libxl__ao *ao;
     libxl_event *ev;
     const libxl_asyncprogress_how *how;
@@ -819,13 +819,13 @@ struct libxl__ao {
     int nested_progeny;
     int progress_reports_outstanding;
     int rc;
-    LIBXL_LIST_HEAD(, libxl__ao_abortable) abortables;
-    LIBXL_LIST_ENTRY(libxl__ao) inprogress_entry;
+    XEN_LIST_HEAD(, libxl__ao_abortable) abortables;
+    XEN_LIST_ENTRY(libxl__ao) inprogress_entry;
     libxl__gc gc;
     libxl_asyncop_how how;
     libxl__poller *poller;
     uint32_t domid;
-    LIBXL_TAILQ_ENTRY(libxl__ao) entry_for_callback;
+    XEN_TAILQ_ENTRY(libxl__ao) entry_for_callback;
     int outstanding_killed_child;
 };
 
@@ -2379,10 +2379,10 @@ bool libxl__stubdomain_is_linux(libxl_domain_build_info *b_info)
 
 #define LIBXL_INIT_EGC(egc,ctx) do{                     \
         LIBXL_INIT_GC((egc).gc,ctx);                    \
-        LIBXL_TAILQ_INIT(&(egc).occurred_for_callback); \
-        LIBXL_TAILQ_INIT(&(egc).aos_for_callback);      \
-        LIBXL_TAILQ_INIT(&(egc).aops_for_callback);     \
-        LIBXL_STAILQ_INIT(&(egc).ev_immediates);        \
+        XEN_TAILQ_INIT(&(egc).occurred_for_callback);   \
+        XEN_TAILQ_INIT(&(egc).aos_for_callback);        \
+        XEN_TAILQ_INIT(&(egc).aops_for_callback);       \
+        XEN_STAILQ_INIT(&(egc).ev_immediates);          \
     } while(0)
 
 _hidden void libxl__egc_ao_cleanup_1_baton(libxl__gc *gc);
@@ -3141,7 +3141,7 @@ typedef void libxl__datacopier_callback(libxl__egc *egc,
 
 struct libxl__datacopier_buf {
     /* private to datacopier */
-    LIBXL_TAILQ_ENTRY(libxl__datacopier_buf) entry;
+    XEN_TAILQ_ENTRY(libxl__datacopier_buf) entry;
     int used;
     char buf[1000];
 };
@@ -3163,7 +3163,7 @@ struct libxl__datacopier_state {
     libxl__ao_abortable abrt;
     libxl__ev_fd toread, towrite;
     ssize_t used;
-    LIBXL_TAILQ_HEAD(libxl__datacopier_bufs, libxl__datacopier_buf) bufs;
+    XEN_TAILQ_HEAD(libxl__datacopier_bufs, libxl__datacopier_buf) bufs;
 };
 
 _hidden void libxl__datacopier_init(libxl__datacopier_state *dc);
@@ -3443,7 +3443,7 @@ typedef struct libxl__stream_read_state libxl__stream_read_state;
 
 typedef struct libxl__sr_record_buf {
     /* private to stream read helper */
-    LIBXL_STAILQ_ENTRY(struct libxl__sr_record_buf) entry;
+    XEN_STAILQ_ENTRY(struct libxl__sr_record_buf) entry;
     libxl__sr_rec_hdr hdr;
     void *body; /* iff hdr.length != 0 */
 } libxl__sr_record_buf;
@@ -3473,7 +3473,7 @@ struct libxl__stream_read_state {
     /* Main stream-reading data. */
     libxl__datacopier_state dc; /* Only used when reading a record */
     libxl__sr_hdr hdr;
-    LIBXL_STAILQ_HEAD(, libxl__sr_record_buf) record_queue; /* NOGC */
+    XEN_STAILQ_HEAD(, libxl__sr_record_buf) record_queue; /* NOGC */
     enum {
         SRS_PHASE_NORMAL,
         SRS_PHASE_BUFFERING,
@@ -4599,9 +4599,9 @@ static inline int libxl__defbool_is_default(libxl_defbool *db)
 #define LIBXL_TAILQ_INSERT_SORTED(head, entry, elm_new, elm_search,     \
                                   search_body, new_after_search_p)      \
     do {                                                                \
-        for ((elm_search) = LIBXL_TAILQ_FIRST((head));                  \
+        for ((elm_search) = XEN_TAILQ_FIRST((head));                    \
              (elm_search);                                              \
-             (elm_search) = LIBXL_TAILQ_NEXT((elm_search), entry)) {    \
+             (elm_search) = XEN_TAILQ_NEXT((elm_search), entry)) {      \
             search_body;                                                \
             if (!(new_after_search_p))                                  \
                 break;                                                  \
@@ -4610,9 +4610,9 @@ static inline int libxl__defbool_is_default(libxl_defbool *db)
          * to place elm_new, or NULL meaning we want to put elm_new at  \
          * the end */                                                   \
         if ((elm_search))                                               \
-            LIBXL_TAILQ_INSERT_BEFORE((elm_search), (elm_new), entry);  \
+            XEN_TAILQ_INSERT_BEFORE((elm_search), (elm_new), entry);    \
         else                                                            \
-            LIBXL_TAILQ_INSERT_TAIL((head), (elm_new), entry);          \
+            XEN_TAILQ_INSERT_TAIL((head), (elm_new), entry);            \
     } while(0)
 
 
diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index fb146a54cb..8faa102e4d 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -63,7 +63,7 @@
 
 #include <yajl/yajl_gen.h>
 
-#include "_libxl_list.h"
+#include "_xen_list.h"
 #include "libxl_internal.h"
 
 /* #define DEBUG_RECEIVED */
@@ -107,7 +107,7 @@ typedef struct callback_id_pair {
     qmp_callback_t callback;
     void *opaque;
     qmp_request_context *context;
-    LIBXL_STAILQ_ENTRY(struct callback_id_pair) next;
+    XEN_STAILQ_ENTRY(struct callback_id_pair) next;
 } callback_id_pair;
 
 struct libxl__qmp_handler {
@@ -123,7 +123,7 @@ struct libxl__qmp_handler {
     uint32_t domid;
 
     int last_id_used;
-    LIBXL_STAILQ_HEAD(callback_list, callback_id_pair) callback_list;
+    XEN_STAILQ_HEAD(callback_list, callback_id_pair) callback_list;
     struct {
         int major;
         int minor;
@@ -189,7 +189,7 @@ static callback_id_pair *qmp_get_callback_from_id(libxl__qmp_handler *qmp,
     if (id_object) {
         id = libxl__json_object_get_integer(id_object);
 
-        LIBXL_STAILQ_FOREACH(pp, &qmp->callback_list, next) {
+        XEN_STAILQ_FOREACH(pp, &qmp->callback_list, next) {
             if (pp->id == id) {
                 return pp;
             }
@@ -217,7 +217,7 @@ static void qmp_handle_error_response(libxl__gc *gc, libxl__qmp_handler *qmp,
             /* tell that the id have been processed */
             qmp->wait_for_id = 0;
         }
-        LIBXL_STAILQ_REMOVE(&qmp->callback_list, pp, callback_id_pair, next);
+        XEN_STAILQ_REMOVE(&qmp->callback_list, pp, callback_id_pair, next);
         free(pp);
     }
 
@@ -266,8 +266,7 @@ static int qmp_handle_response(libxl__gc *gc, libxl__qmp_handler *qmp,
                 /* tell that the id have been processed */
                 qmp->wait_for_id = 0;
             }
-            LIBXL_STAILQ_REMOVE(&qmp->callback_list, pp, callback_id_pair,
-                                next);
+            XEN_STAILQ_REMOVE(&qmp->callback_list, pp, callback_id_pair, next);
             free(pp);
         }
         return 0;
@@ -325,7 +324,7 @@ static libxl__qmp_handler *qmp_init_handler(libxl__gc *gc, uint32_t domid)
     qmp->domid = domid;
     qmp->timeout = 5;
 
-    LIBXL_STAILQ_INIT(&qmp->callback_list);
+    XEN_STAILQ_INIT(&qmp->callback_list);
 
     return qmp;
 }
@@ -383,7 +382,7 @@ static void qmp_close(libxl__qmp_handler *qmp)
     callback_id_pair *tmp = NULL;
 
     close(qmp->qmp_fd);
-    LIBXL_STAILQ_FOREACH(pp, &qmp->callback_list, next) {
+    XEN_STAILQ_FOREACH(pp, &qmp->callback_list, next) {
         free(tmp);
         tmp = pp;
     }
@@ -547,7 +546,7 @@ static char *qmp_send_prepare(libxl__gc *gc, libxl__qmp_handler *qmp,
     elm->callback = callback;
     elm->opaque = opaque;
     elm->context = context;
-    LIBXL_STAILQ_INSERT_TAIL(&qmp->callback_list, elm, next);
+    XEN_STAILQ_INSERT_TAIL(&qmp->callback_list, elm, next);
 
     LOGD(DEBUG, qmp->domid, "next qmp command: '%s'", buf);
 
diff --git a/tools/libs/light/libxl_stream_read.c b/tools/libs/light/libxl_stream_read.c
index 99a6714e76..e64e8f0ead 100644
--- a/tools/libs/light/libxl_stream_read.c
+++ b/tools/libs/light/libxl_stream_read.c
@@ -214,7 +214,7 @@ void libxl__stream_read_init(libxl__stream_read_state *stream)
     stream->sync_teardown = false;
     FILLZERO(stream->dc);
     FILLZERO(stream->hdr);
-    LIBXL_STAILQ_INIT(&stream->record_queue);
+    XEN_STAILQ_INIT(&stream->record_queue);
     stream->phase = SRS_PHASE_NORMAL;
     stream->recursion_guard = false;
     stream->incoming_record = NULL;
@@ -402,7 +402,7 @@ static void stream_continue(libxl__egc *egc,
          * processing the record.  There should never be two records
          * in the queue.
          */
-        if (LIBXL_STAILQ_EMPTY(&stream->record_queue))
+        if (XEN_STAILQ_EMPTY(&stream->record_queue))
             setup_read_record(egc, stream);
         else {
             if (process_record(egc, stream))
@@ -412,7 +412,7 @@ static void stream_continue(libxl__egc *egc,
              * process_record() had better have consumed the one and
              * only record in the queue.
              */
-            assert(LIBXL_STAILQ_EMPTY(&stream->record_queue));
+            assert(XEN_STAILQ_EMPTY(&stream->record_queue));
         }
         break;
 
@@ -428,7 +428,7 @@ static void stream_continue(libxl__egc *egc,
          * the tail to spot the CHECKPOINT_END record, and switch to
          * the unbuffering phase.
          */
-        libxl__sr_record_buf *rec = LIBXL_STAILQ_LAST(
+        libxl__sr_record_buf *rec = XEN_STAILQ_LAST(
             &stream->record_queue, libxl__sr_record_buf, entry);
 
         assert(stream->in_checkpoint);
@@ -537,7 +537,7 @@ static void record_body_done(libxl__egc *egc,
     if (rc)
         goto err;
 
-    LIBXL_STAILQ_INSERT_TAIL(&stream->record_queue, rec, entry);
+    XEN_STAILQ_INSERT_TAIL(&stream->record_queue, rec, entry);
     stream->incoming_record = NULL;
 
     stream_continue(egc, stream);
@@ -567,9 +567,9 @@ static bool process_record(libxl__egc *egc,
     int rc = 0;
 
     /* Pop a record from the head of the queue. */
-    assert(!LIBXL_STAILQ_EMPTY(&stream->record_queue));
-    rec = LIBXL_STAILQ_FIRST(&stream->record_queue);
-    LIBXL_STAILQ_REMOVE_HEAD(&stream->record_queue, entry);
+    assert(!XEN_STAILQ_EMPTY(&stream->record_queue));
+    rec = XEN_STAILQ_FIRST(&stream->record_queue);
+    XEN_STAILQ_REMOVE_HEAD(&stream->record_queue, entry);
 
     LOG(DEBUG, "Record: %u, length %u", rec->hdr.type, rec->hdr.length);
 
@@ -813,9 +813,9 @@ static void stream_done(libxl__egc *egc,
 
     /* The record queue had better be empty if the stream believes
      * itself to have been successful. */
-    assert(LIBXL_STAILQ_EMPTY(&stream->record_queue) || stream->rc);
+    assert(XEN_STAILQ_EMPTY(&stream->record_queue) || stream->rc);
 
-    LIBXL_STAILQ_FOREACH_SAFE(rec, &stream->record_queue, entry, trec)
+    XEN_STAILQ_FOREACH_SAFE(rec, &stream->record_queue, entry, trec)
         free_record(rec);
 
     if (!stream->back_channel) {
-- 
2.34.1


