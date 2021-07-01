Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669663B904D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148509.274584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWt-0001rg-LA; Thu, 01 Jul 2021 10:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148509.274584; Thu, 01 Jul 2021 10:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWt-0001iZ-45; Thu, 01 Jul 2021 10:02:43 +0000
Received: by outflank-mailman (input) for mailman id 148509;
 Thu, 01 Jul 2021 10:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytVZ-0004XT-4H
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:01:21 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac119f06-72cf-4881-9e7d-d1a78e7b3b1d;
 Thu, 01 Jul 2021 09:58:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619us5NW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:54 +0200 (CEST)
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
X-Inumbo-ID: ac119f06-72cf-4881-9e7d-d1a78e7b3b1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133414;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=n0d0gwWXlJ/Ban5eVrK506Di/gOt/MD61K+N2RGQBbA=;
    b=Gl58uIDpytNCd08vTi0ztylENVBl+fRtA6BJJFBS4K+oAMI4fOQRThcxhH9ZUenr1p
    LSGgV3d0plPdsJmtYrjw8IErqZWLZk05W83mq33yvMopOnlMNIgywtuHWkA1KMwkk5NX
    yllcZGagVS2KO3XT/EARqFZoC16c753PHIjD3vlr7pMx6I9WtNVCUUs4Ps75yCOTF/uu
    34eLqRIzWxCGH4+2EkcF2cXdzxQdEavqUKZQcZeA0L58nQ2CoMu/NVsYg+ZZ+1SJMEGt
    IM6PcldeVJJGQx+XoRzBf0Ba9VSNxnbc1IGFRQPAHtxPOuzMD83paaMsrKDQzmKlXmg9
    KCwA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
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
Subject: [PATCH v20210701 32/40] tools: adjust libxl_domain_suspend to receive a struct props
Date: Thu,  1 Jul 2021 11:56:27 +0200
Message-Id: <20210701095635.15648-33-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
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

