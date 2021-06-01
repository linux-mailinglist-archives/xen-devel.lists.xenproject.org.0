Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4D3977F9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135185.251375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7CV-0003bm-DT; Tue, 01 Jun 2021 16:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135185.251375; Tue, 01 Jun 2021 16:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7CV-0003Yi-9p; Tue, 01 Jun 2021 16:25:07 +0000
Received: by outflank-mailman (input) for mailman id 135185;
 Tue, 01 Jun 2021 16:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo714-0005Ec-47
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:13:18 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c75630c-d80a-48a9-99c5-350bb6fde6fb;
 Tue, 01 Jun 2021 16:11:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBb1BX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:37 +0200 (CEST)
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
X-Inumbo-ID: 5c75630c-d80a-48a9-99c5-350bb6fde6fb
ARC-Seal: i=1; a=rsa-sha256; t=1622563898; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mLSCEVWIFwr02TVbN1MLeBsQfsvHUlomH4hp7tBnrC/a1zOboNFjxGPvuv0nyJ3Uuk
    xvl1JVOLX3SUyaesWJJrQcEIyZtT5iUykTLdwsYVgkjEDnJo1pgknKJHt30/NSkxzb2D
    JjlMMnPGKIECbpLepyJTTCf2u/QCsd+DMDbZ0kxjBiovQ0QvN3vB50mPvZNqYTPsmXe4
    AEZRBKZ/aM1q59MH4MgqGu5Ol6UYdOdaHnhFwq5OpwM9WeWT/aBFH3XOH+qrm7ox5xz/
    BLxoauPJk/fnQoIOsw91SUv3r0qfknFEl/YRAyARtDcSmh1m03lh5pD+3nkT2MsZdvqb
    W6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563898;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MTSqerw0vG4VSeyAPsATEiIANrLKHzhkpCbX69ppdjs=;
    b=cDP8SqOs6PbiHTLtkZHJMJO3LZgPhQDqfsDb6YGUlSOpGNWeIcyzOmQt+yB8jr3GCs
    Pxo9cQa6EVHzmKQteeIRimlg6eTxcV3fjHVqsDfQPYVv6zMvYUQKL4xMtkq477r02SGX
    rn6gs6q7l9Q1l/3YBy5lcOJOsoI244Drqrw9PPL0xE7+RhKRWsn0v+O+ebI6muqiQTLr
    1NemoUBsFyy8Sv4nZUmcC9XIreuZJ6TzUjSwcJHvHFuRVeSKwYap8BN4zbrfzUQqOowN
    7CTmqbCWD5IcLg6Mwk9olqqIfLQbSiDIptyGOzE179TbeuN8ChcETaf9RiuCp2AdgQnT
    uIaQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563898;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MTSqerw0vG4VSeyAPsATEiIANrLKHzhkpCbX69ppdjs=;
    b=HIfYIkehMLE0pDA3u3B/kjs+Yufrb7XkJu/LvIJowk/lHA9LfbTCISGFdXYvPh/5xc
    iyRBvdOctkN5Ml7Oxhb9vNNTWoi64gwJyWZrLIlDHxgGv045Jln9X3cBy7U4JnGNvxKq
    7ZpVirnVLOlvrzyvF8xFKwDgH81z+ph+EE6zilrHqwJO0Pbxzv1C+JtoiOZOXcTqT5iY
    IBIhrmRb763eM2W7rCRv1L0MoGoFO2+h4JoRiyYmV1YGdQ3amma8tIATUmo5GDTqKzTW
    Nf8lOgxURBOqqS/0akEFZE3/0FC/bz+5Qd1Ny7MnJ0yRtUhJyoUmvDnm4bjU5U1TX5j8
    KySw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Christian Lindig <christian.lindig@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v20210601 28/38] tools: adjust libxl_domain_suspend to receive a struct props
Date: Tue,  1 Jun 2021 18:11:08 +0200
Message-Id: <20210601161118.18986-29-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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

