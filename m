Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C602F1D13
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65259.115690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kv-0007Uc-SH; Mon, 11 Jan 2021 17:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65259.115690; Mon, 11 Jan 2021 17:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kv-0007TS-Ms; Mon, 11 Jan 2021 17:50:37 +0000
Received: by outflank-mailman (input) for mailman id 65259;
 Mon, 11 Jan 2021 17:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Eq-0002a6-2T
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:20 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2e1731e-7df0-4510-998b-defa4aa627e2;
 Mon, 11 Jan 2021 17:42:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHggM3o
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:42 +0100 (CET)
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
X-Inumbo-ID: f2e1731e-7df0-4510-998b-defa4aa627e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386969;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=q9bPn6v7/y8+mH8W4owFNfEm5Ee8/bq5PGRpxCjyisE=;
	b=eEdqYGgcQ88vHGEsYGap1LF72eezxFCuTL7X2kLJeOjNrt1ofGpQ+Llom+Mv6kpoco
	AiqBfaslUXdfnUkjjH7ueFxXnEvtfiXOH85nVK/LopAGUmOGhcaLwluNk6Dpt7ILwB5U
	c3LDVgVZz+l0ZR03gKf08rCu6cUyk+OLAyOfXuAtL6BzIl9bc7xiBKWJaxue75PjdG7b
	QPsyigOQqleaPYuI52V+5Yp0x6JscexyD5w3Ggysj0jez9HEiXCK5g8BqZZBKPohCszL
	a2K9yR5LkyxjrZ46bqdQknJDGcoc8C9YsdcSYZ9c2H/ROKp9r3PiemzBt4Eg6b9TNjjD
	yK/w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v20210111 34/39] tools: adjust libxl_domain_suspend to receive a struct props
Date: Mon, 11 Jan 2021 18:42:19 +0100
Message-Id: <20210111174224.24714-35-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming changes will pass more knobs down to xc_domain_save.
Adjust the libxl_domain_suspend API to allow easy adding of additional knobs.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxl.h                | 26 +++++++++++++++++++++++---
 tools/libs/light/libxl_domain.c      |  7 ++++---
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 ++-
 tools/xl/xl_migrate.c                |  9 ++++++---
 tools/xl/xl_saverestore.c            |  3 ++-
 5 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 6546dcd819..94b8f1095f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1667,12 +1667,32 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
     libxl_retrieve_domain_configuration_0x041200
 #endif
 
+/*
+ * LIBXL_HAVE_DOMAIN_SUSPEND_PROPS indicates that the
+ * libxl_domain_suspend_props() function takes a props struct.
+ */
+#define LIBXL_HAVE_DOMAIN_SUSPEND_PROPS 1
+
+typedef struct {
+    uint32_t flags; /* LIBXL_SUSPEND_* */
+} libxl_domain_suspend_props;
+#define LIBXL_SUSPEND_DEBUG 1
+#define LIBXL_SUSPEND_LIVE 2
+
 int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
-                         int flags, /* LIBXL_SUSPEND_* */
+                         libxl_domain_suspend_props *props,
                          const libxl_asyncop_how *ao_how)
                          LIBXL_EXTERNAL_CALLERS_ONLY;
-#define LIBXL_SUSPEND_DEBUG 1
-#define LIBXL_SUSPEND_LIVE 2
+#if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041500
+static inline int libxl_domain_suspend_0x041400(libxl_ctx *ctx, uint32_t domid,
+                         int fd, int flags, /* LIBXL_SUSPEND_* */
+                         const libxl_asyncop_how *ao_how)
+{
+    libxl_domain_suspend_props props = { .flags = flags, };
+    return libxl_domain_suspend(ctx, domid, fd, &props, ao_how);
+}
+#define libxl_domain_suspend libxl_domain_suspend_0x041400
+#endif
 
 /*
  * Only suspend domain, do not save its state to file, do not destroy it.
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5d4ec90711..45e0c57c3a 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -505,7 +505,8 @@ static void domain_suspend_cb(libxl__egc *egc,
 
 }
 
-int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd, int flags,
+int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
+                         libxl_domain_suspend_props *props,
                          const libxl_asyncop_how *ao_how)
 {
     AO_CREATE(ctx, domid, ao_how);
@@ -526,8 +527,8 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd, int flags,
     dss->domid = domid;
     dss->fd = fd;
     dss->type = type;
-    dss->live = flags & LIBXL_SUSPEND_LIVE;
-    dss->debug = flags & LIBXL_SUSPEND_DEBUG;
+    dss->live = props->flags & LIBXL_SUSPEND_LIVE;
+    dss->debug = props->flags & LIBXL_SUSPEND_DEBUG;
     dss->checkpointed_stream = LIBXL_CHECKPOINTED_STREAM_NONE;
 
     rc = libxl__fd_flags_modify_save(gc, dss->fd,
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 352a00134d..eaf7bce35a 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -614,10 +614,11 @@ value stub_libxl_domain_suspend(value ctx, value domid, value fd, value async, v
 	int ret;
 	uint32_t c_domid = Int_val(domid);
 	int c_fd = Int_val(fd);
+    libxl_domain_suspend_props props = {};
 	libxl_asyncop_how *ao_how = aohow_val(async);
 
 	caml_enter_blocking_section();
-	ret = libxl_domain_suspend(CTX, c_domid, c_fd, 0, ao_how);
+	ret = libxl_domain_suspend(CTX, c_domid, c_fd, &props, ao_how);
 	caml_leave_blocking_section();
 
 	free(ao_how);
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 856a6e2be1..fc9f69bf06 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -188,7 +188,10 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     char *away_domname;
     char rc_buf;
     uint8_t *config_data;
-    int config_len, flags = LIBXL_SUSPEND_LIVE;
+    int config_len;
+    libxl_domain_suspend_props props = {
+        .flags = LIBXL_SUSPEND_LIVE,
+        };
     unsigned xtl_flags = XTL_STDIOSTREAM_HIDE_PROGRESS;
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
@@ -210,8 +213,8 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     xtl_stdiostream_adjust_flags(logger, xtl_flags, 0);
 
     if (debug)
-        flags |= LIBXL_SUSPEND_DEBUG;
-    rc = libxl_domain_suspend(ctx, domid, send_fd, flags, NULL);
+        props.flags |= LIBXL_SUSPEND_DEBUG;
+    rc = libxl_domain_suspend(ctx, domid, send_fd, &props, NULL);
     if (rc) {
         fprintf(stderr, "migration sender: libxl_domain_suspend failed"
                 " (rc=%d)\n", rc);
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..476d4d9a6a 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -130,6 +130,7 @@ static int save_domain(uint32_t domid, int preserve_domid,
     int fd;
     uint8_t *config_data;
     int config_len;
+    libxl_domain_suspend_props props = {};
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
                            &config_data, &config_len);
@@ -146,7 +147,7 @@ static int save_domain(uint32_t domid, int preserve_domid,
 
     save_domain_core_writeconfig(fd, filename, config_data, config_len);
 
-    int rc = libxl_domain_suspend(ctx, domid, fd, 0, NULL);
+    int rc = libxl_domain_suspend(ctx, domid, fd, &props, NULL);
     close(fd);
 
     if (rc < 0) {

