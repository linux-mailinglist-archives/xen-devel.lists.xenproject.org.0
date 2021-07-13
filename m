Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424193C7650
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155611.287346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mx0-00089r-Ki; Tue, 13 Jul 2021 18:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155611.287346; Tue, 13 Jul 2021 18:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mx0-00087J-GT; Tue, 13 Jul 2021 18:16:10 +0000
Received: by outflank-mailman (input) for mailman id 155611;
 Tue, 13 Jul 2021 18:16:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoZ-0002kr-VO
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:28 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b687569-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:30 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6LtB6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:21 +0200 (CEST)
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
X-Inumbo-ID: 0b687569-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199581;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GjudnVF2IHqXv7qlToU0RRwDe7Jc7WilBXGXYBOzt/s=;
    b=J/0o1XrmqfrXKI3DihqrrnnSctYBw0s8LXUYPsJXNCmiklD8n8Aj/Tkr0R4D4jSDUV
    GrrgaaxGbsNqdffLtaKR7ifUph8rxmZYP+Uj8jaa5kbmlkXKnOVvyZn3av5k43Pnt8c8
    fXFqeX/OZn3fNgBgHji4nMsNg3eh0vMsaAyOgAjpp+wIUh6lgifGly0dOgVhb6AVhTUZ
    JP9XuOa5pDmYQ7wMZdxTxj64v5X0i6JZgTLG3hkgM8vQJXLXie8u9ZjET5xgn/DA+8RI
    H6D9QKPeKLSNfyw0WUGTCkie47tzN1+R/N+rVSFdC7RYPXvMmMf5i/I0oyTrspS0yd/Z
    m6YQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Christian Lindig <christian.lindig@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v20210713 24/31] tools: adjust libxl_domain_suspend to receive a struct props
Date: Tue, 13 Jul 2021 20:05:58 +0200
Message-Id: <20210713180605.12096-25-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming changes will pass more knobs down to xc_domain_save.
Adjust the libxl_domain_suspend API to allow easy adding of additional knobs.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
 tools/include/libxl.h                | 26 +++++++++++++++++++++++---
 tools/libs/light/libxl_domain.c      |  7 ++++---
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 ++-
 tools/xl/xl_migrate.c                |  9 ++++++---
 tools/xl/xl_saverestore.c            |  3 ++-
 5 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 29931626a2..9a4d7514ed 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1706,12 +1706,32 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
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
+#if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041600
+static inline int libxl_domain_suspend_0x041500(libxl_ctx *ctx, uint32_t domid,
+                         int fd, int flags, /* LIBXL_SUSPEND_* */
+                         const libxl_asyncop_how *ao_how)
+{
+    libxl_domain_suspend_props props = { .flags = flags, };
+    return libxl_domain_suspend(ctx, domid, fd, &props, ao_how);
+}
+#define libxl_domain_suspend libxl_domain_suspend_0x041500
+#endif
 
 /*
  * Only suspend domain, do not save its state to file, do not destroy it.
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index c00c36c928..5dbd27900f 100644
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
index 45b8af61c7..ea5ee33ce9 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -618,10 +618,11 @@ value stub_libxl_domain_suspend(value ctx, value domid, value fd, value async, v
 	int ret;
 	uint32_t c_domid = Int_val(domid);
 	int c_fd = Int_val(fd);
+	libxl_domain_suspend_props props = {};
 	libxl_asyncop_how *ao_how = aohow_val(async);
 
 	caml_enter_blocking_section();
-	ret = libxl_domain_suspend(CTX, c_domid, c_fd, 0, ao_how);
+	ret = libxl_domain_suspend(CTX, c_domid, c_fd, &props, ao_how);
 	caml_leave_blocking_section();
 
 	free(ao_how);
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..144890924f 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -186,7 +186,10 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     char *away_domname;
     char rc_buf;
     uint8_t *config_data;
-    int config_len, flags = LIBXL_SUSPEND_LIVE;
+    int config_len;
+    libxl_domain_suspend_props props = {
+        .flags = LIBXL_SUSPEND_LIVE,
+        };
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
                            &config_data, &config_len);
@@ -205,8 +208,8 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     xtl_stdiostream_adjust_flags(logger, XTL_STDIOSTREAM_HIDE_PROGRESS, 0);
 
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

