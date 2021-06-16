Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC53A9BB3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143112.263976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHb-0003rW-E8; Wed, 16 Jun 2021 13:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143112.263976; Wed, 16 Jun 2021 13:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHb-0003oT-8Z; Wed, 16 Jun 2021 13:08:39 +0000
Received: by outflank-mailman (input) for mailman id 143112;
 Wed, 16 Jun 2021 13:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2s-0006lZ-3z
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:53:26 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 836fdc85-aa4f-4342-9e78-cb0882912229;
 Wed, 16 Jun 2021 12:52:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpktmN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:46 +0200 (CEST)
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
X-Inumbo-ID: 836fdc85-aa4f-4342-9e78-cb0882912229
ARC-Seal: i=1; a=rsa-sha256; t=1623847906; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Bb02/uYdYI3v3QAK8agr/MyAFv/G7Oa2Bx7a+FYVforjXXtyAQMg+Q0iqz0l0bqefP
    /lnqy5lhD55+fZcRhOp0dKREn/o1okFQfsRHdNGvHo6Lgex5rGsh0Hitb09cXi4IzRJO
    eeRMtn40kAnmG6bwOc5iikT2XLb4CRET14Etyez4ckvBL28Ila9AT3boSSqe4sarKbSn
    Nd+ORIevFXOQPL5BCw1T49q8D7nEU03VzXmzFTXScaRFYrPtyDPo8bdMli/IT6l9895w
    9+mzysccjy+OQQAnFcj8uaftHeC+lfCqZ8q9QzM6hT5iWOvIMvN4JI6CdfGO6XXQieDG
    XJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847906;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=n0d0gwWXlJ/Ban5eVrK506Di/gOt/MD61K+N2RGQBbA=;
    b=q1UKio5xKBtR+KdxSh2Yno0DYwGIVeXHUBzHinABh6f2lymqVTcENFragEmMOlCYXj
    CT8T9OMHy8B/f+qQ9SLFQqraQw73s+ycFM47rF1imI6qwXcZYIINA6gVibgn6ZJa0YTl
    GRJfy3zeRhgAp8TRyjwNWlyV6FPws6FI/dmpk6swQyFWtG7jVEP+YNV8fjuv18tliD/q
    +c4WZHqo8nCuuq3ZKcmH6FYuH6Mt9dg1h9Yxgn2lrqwE9g0QSdWTQUeS/6ZGqLp4gFgl
    drSnIlEoYzFUJKjX1cihsbP5M8MGMjuqEdbiGD/5QgAglMNpmXR/2gLwJs0gXXBy3ZTg
    bCqA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847906;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=n0d0gwWXlJ/Ban5eVrK506Di/gOt/MD61K+N2RGQBbA=;
    b=g3wCKnOJqhlu289qUqGeYqy9RDAUEaOV7Yw1QOo/Y/prbvl4AlhGdYNtBPV3koqqxd
    5uXUaYW0z9j7h1+jH/krk/hO4rvCxVYiFzwKxwXbhRAAbcoYRmAQkOOUF/cv5gWVZv0a
    rJ4Xw08/2hkOEX43CKJG92FbvATCekbqj7nmJUmroaqWmC5QQaZ7YozFKqEMn4Jz5sDC
    0QR1DWVHXs+N/Jt1GirmjX2M2jfOZ9ep4bXQrC23hrF/yMEDX1vWKUsLPdZcqxtsClgi
    GC8WwDpJtzxmk1fhYuH1lUXd32BavjwbFcKhyN0pm6Fxxftep1sLkhdd9zNeivGIKxmB
    U0OA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
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
Subject: [PATCH v20210616 28/36] tools: adjust libxl_domain_suspend to receive a struct props
Date: Wed, 16 Jun 2021 14:51:21 +0200
Message-Id: <20210616125129.26563-29-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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

