Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F41DAE4C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKeX-0002xz-DT; Wed, 20 May 2020 09:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwnj=7C=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jbKeV-0002xc-5D
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:04:39 +0000
X-Inumbo-ID: e9f7be6a-9a78-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9f7be6a-9a78-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 09:04:30 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b91so2221633edf.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ykFRqSJsGAZwDGWi4dbag+7FdI9nXWeCtn40RKaRM34=;
 b=WjiRCyFue2N3loEHJeK1ZQ8K7qO/HzUwKXn36WqXp4dz8aFHTj3FtmsUjDZP3emB3o
 kUV421Ndka2pFFZoJGgStuk0GX/UB1DqkWaCD4Z2Z7Xqi2VVEkmxG2Wt8BkztOiWNKlf
 CRo9eHIrbvfZqTnDG7dUPWWi5KhuMxrLluZGo2+faLPg0ONJJ5LxB7dYaZqjFXKrp90r
 7yZKDyBSBEX7O0jJgbb2qL36F+TYs7dzGGeftYA78ES1n0ZR6kUw7m3+eWYW+3klfMPk
 ZmvKuIOiYXIQAEh6Is8WOhCU5yg9yTOQwyPDE+xkOht810efiAVDpw8eQTjHLXSRDszA
 BTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ykFRqSJsGAZwDGWi4dbag+7FdI9nXWeCtn40RKaRM34=;
 b=XhaizOd5FBrTO/vaR0w9+2Kowqkw7PaPmrqjyCg6+QSzSsmx8zYA6zPKV+xowzQxic
 Bbnjn3AlG7wtGa3ZwlvJUSkJWGiVFMuj0+h+zheWqA1en823smEvRvcaHdIbRHo6ywKo
 kYjpVIIScUrcUzDm+oWkOfKcA2IuQSOYiVPZvMqs/7cgw2wffnGlpsZFI5Ef0jjAfERX
 3ISqv3oZzFmdA5NfGPC4ahLOWaHlChl1dq8xH309YbG4leTdiRCZXnBFEVOc9OnSgWEc
 Wmv+owcfctM7E/0rHFL9nDpziCy+aX9drxRn+P5gTbzPcNPtZOSXqWOvv/LwzAB/e6p3
 n1oQ==
X-Gm-Message-State: AOAM530ZQAtwwzsfN5xtytlUdiEKtjPKF72uDtSlg/B8tPdMmmAe0YuZ
 PWCCUcGO8v0KtuQ20VRAqW9rBv1a
X-Google-Smtp-Source: ABdhPJzqHH2vMiODcT+P2Pg8ABrNQ3ilHz5qnBMwlB4nD9B4Qyvqz/yVuRnzx6KUPsxUGCp859Ri0Q==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr2593357edv.366.1589965469263; 
 Wed, 20 May 2020 02:04:29 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id p5sm1324811edi.82.2020.05.20.02.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 02:04:28 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com, konrad.wilk@oracle.com
Subject: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
Date: Wed, 20 May 2020 12:04:25 +0300
Message-Id: <20200520090425.28558-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520090425.28558-1-andr2000@gmail.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add version 2 of the dma-buf ioctls which adds data_ofs parameter.

dma-buf is backed by a scatter-gather table and has offset parameter
which tells where the actual data starts. Relevant ioctls are extended
to support that offset:
  - when dma-buf is created (exported) from grant references then
    data_ofs is used to set the offset field in the scatter list
    of the new dma-buf
  - when dma-buf is imported and grant references provided then
    data_ofs is used to report that offset to user-space

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/include/xen-sys/Linux/gntdev.h  | 53 +++++++++++++++++
 tools/libs/gnttab/Makefile            |  2 +-
 tools/libs/gnttab/freebsd.c           | 15 +++++
 tools/libs/gnttab/gnttab_core.c       | 17 ++++++
 tools/libs/gnttab/include/xengnttab.h | 13 ++++
 tools/libs/gnttab/libxengnttab.map    |  6 ++
 tools/libs/gnttab/linux.c             | 86 +++++++++++++++++++++++++++
 tools/libs/gnttab/minios.c            | 15 +++++
 tools/libs/gnttab/private.h           |  9 +++
 9 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/tools/include/xen-sys/Linux/gntdev.h b/tools/include/xen-sys/Linux/gntdev.h
index d16076044c71..0c43393cbee5 100644
--- a/tools/include/xen-sys/Linux/gntdev.h
+++ b/tools/include/xen-sys/Linux/gntdev.h
@@ -274,4 +274,57 @@ struct ioctl_gntdev_dmabuf_imp_release {
     uint32_t reserved;
 };
 
+/*
+ * Version 2 of the ioctls adds @data_ofs parameter.
+ *
+ * dma-buf is backed by a scatter-gather table and has offset
+ * parameter which tells where the actual data starts.
+ * Relevant ioctls are extended to support that offset:
+ *   - when dma-buf is created (exported) from grant references then
+ *     @data_ofs is used to set the offset field in the scatter list
+ *     of the new dma-buf
+ *   - when dma-buf is imported and grant references are provided then
+ *     @data_ofs is used to report that offset to user-space
+ */
+#define IOCTL_GNTDEV_DMABUF_EXP_FROM_REFS_V2 \
+    _IOC(_IOC_NONE, 'G', 13, \
+         sizeof(struct ioctl_gntdev_dmabuf_exp_from_refs_v2))
+struct ioctl_gntdev_dmabuf_exp_from_refs_v2 {
+    /* IN parameters. */
+    /* Specific options for this dma-buf: see GNTDEV_DMA_FLAG_XXX. */
+    uint32_t flags;
+    /* Number of grant references in @refs array. */
+    uint32_t count;
+    /* Offset of the data in the dma-buf. */
+    uint32_t data_ofs;
+    /* OUT parameters. */
+    /* File descriptor of the dma-buf. */
+    uint32_t fd;
+    /* The domain ID of the grant references to be mapped. */
+    uint32_t domid;
+    /* Variable IN parameter. */
+    /* Array of grant references of size @count. */
+    uint32_t refs[1];
+};
+
+#define IOCTL_GNTDEV_DMABUF_IMP_TO_REFS_V2 \
+    _IOC(_IOC_NONE, 'G', 14, \
+         sizeof(struct ioctl_gntdev_dmabuf_imp_to_refs_v2))
+struct ioctl_gntdev_dmabuf_imp_to_refs_v2 {
+    /* IN parameters. */
+    /* File descriptor of the dma-buf. */
+    uint32_t fd;
+    /* Number of grant references in @refs array. */
+    uint32_t count;
+    /* The domain ID for which references to be granted. */
+    uint32_t domid;
+    /* Reserved - must be zero. */
+    uint32_t reserved;
+    /* OUT parameters. */
+    /* Offset of the data in the dma-buf. */
+    uint32_t data_ofs;
+    /* Array of grant references of size @count. */
+    uint32_t refs[1];
+};
+
 #endif /* __LINUX_PUBLIC_GNTDEV_H__ */
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 2da8fbbb7f6f..5ee2d965214f 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 2
+MINOR    = 3
 LIBNAME  := gnttab
 USELIBS  := toollog toolcore
 
diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index 886b588303a0..baf0f60aa4d3 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -319,6 +319,14 @@ int osdep_gnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
     abort();
 }
 
+int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                         uint32_t flags, uint32_t count,
+                                         const uint32_t *refs,
+                                         uint32_t *dmabuf_fd, uint32_t data_ofs)
+{
+    abort();
+}
+
 int osdep_gnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt,
                                           uint32_t fd, uint32_t wait_to_ms)
 {
@@ -331,6 +339,13 @@ int osdep_gnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
     abort();
 }
 
+int osdep_gnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                       uint32_t fd, uint32_t count,
+                                       uint32_t *refs, uint32_t *data_ofs)
+{
+    abort();
+}
+
 int osdep_gnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd)
 {
     abort();
diff --git a/tools/libs/gnttab/gnttab_core.c b/tools/libs/gnttab/gnttab_core.c
index 92e7228a2671..3af3cec80045 100644
--- a/tools/libs/gnttab/gnttab_core.c
+++ b/tools/libs/gnttab/gnttab_core.c
@@ -144,6 +144,15 @@ int xengnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
                                              refs, fd);
 }
 
+int xengnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                      uint32_t flags, uint32_t count,
+                                      const uint32_t *refs, uint32_t *fd,
+                                      uint32_t data_ofs)
+{
+    return osdep_gnttab_dmabuf_exp_from_refs_v2(xgt, domid, flags, count,
+                                                refs, fd, data_ofs);
+}
+
 int xengnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt, uint32_t fd,
                                        uint32_t wait_to_ms)
 {
@@ -156,6 +165,14 @@ int xengnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
     return osdep_gnttab_dmabuf_imp_to_refs(xgt, domid, fd, count, refs);
 }
 
+int xengnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                    uint32_t fd, uint32_t count, uint32_t *refs,
+                                    uint32_t *data_ofs)
+{
+    return osdep_gnttab_dmabuf_imp_to_refs_v2(xgt, domid, fd, count, refs,
+                                              data_ofs);
+}
+
 int xengnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd)
 {
     return osdep_gnttab_dmabuf_imp_release(xgt, fd);
diff --git a/tools/libs/gnttab/include/xengnttab.h b/tools/libs/gnttab/include/xengnttab.h
index 111fc88caeb3..0956bd91e0df 100644
--- a/tools/libs/gnttab/include/xengnttab.h
+++ b/tools/libs/gnttab/include/xengnttab.h
@@ -322,12 +322,19 @@ int xengnttab_grant_copy(xengnttab_handle *xgt,
  * Returns 0 if dma-buf was successfully created and the corresponding
  * dma-buf's file descriptor is returned in @fd.
  *
+ * Version 2 also accepts @data_ofs offset of the data in the buffer.
+ *
  * [1] https://elixir.bootlin.com/linux/latest/source/Documentation/driver-api/dma-buf.rst
  */
 int xengnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
                                    uint32_t flags, uint32_t count,
                                    const uint32_t *refs, uint32_t *fd);
 
+int xengnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                      uint32_t flags, uint32_t count,
+                                      const uint32_t *refs, uint32_t *fd,
+                                      uint32_t data_ofs);
+
 /*
  * This will block until the dma-buf with the file descriptor @fd is
  * released. This is only valid for buffers created with
@@ -345,10 +352,16 @@ int xengnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt, uint32_t fd,
 /*
  * Import a dma-buf with file descriptor @fd and export granted references
  * to the pages of that dma-buf into array @refs of size @count.
+ *
+ * Version 2 also provides @data_ofs offset of the data in the buffer.
  */
 int xengnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
                                  uint32_t fd, uint32_t count, uint32_t *refs);
 
+int xengnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                    uint32_t fd, uint32_t count, uint32_t *refs,
+                                    uint32_t *data_ofs);
+
 /*
  * This will close all references to an imported buffer, so it can be
  * released by the owner. This is only valid for buffers created with
diff --git a/tools/libs/gnttab/libxengnttab.map b/tools/libs/gnttab/libxengnttab.map
index d2a9b7e18bea..ddf77e064b08 100644
--- a/tools/libs/gnttab/libxengnttab.map
+++ b/tools/libs/gnttab/libxengnttab.map
@@ -36,3 +36,9 @@ VERS_1.2 {
 		xengnttab_dmabuf_imp_to_refs;
 		xengnttab_dmabuf_imp_release;
 } VERS_1.1;
+
+VERS_1.3 {
+    global:
+		xengnttab_dmabuf_exp_from_refs_v2;
+		xengnttab_dmabuf_imp_to_refs_v2;
+} VERS_1.2;
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index a01bb6c698c6..75e249fb3202 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -352,6 +352,51 @@ out:
     return rc;
 }
 
+int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                         uint32_t flags, uint32_t count,
+                                         const uint32_t *refs,
+                                         uint32_t *dmabuf_fd,
+                                         uint32_t data_ofs)
+{
+    struct ioctl_gntdev_dmabuf_exp_from_refs_v2 *from_refs_v2 = NULL;
+    int rc = -1;
+
+    if ( !count )
+    {
+        errno = EINVAL;
+        goto out;
+    }
+
+    from_refs_v2 = malloc(sizeof(*from_refs_v2) +
+                          (count - 1) * sizeof(from_refs_v2->refs[0]));
+    if ( !from_refs_v2 )
+    {
+        errno = ENOMEM;
+        goto out;
+    }
+
+    from_refs_v2->flags = flags;
+    from_refs_v2->count = count;
+    from_refs_v2->domid = domid;
+    from_refs_v2->data_ofs = data_ofs;
+
+    memcpy(from_refs_v2->refs, refs, count * sizeof(from_refs_v2->refs[0]));
+
+    if ( (rc = ioctl(xgt->fd, IOCTL_GNTDEV_DMABUF_EXP_FROM_REFS_V2,
+                     from_refs_v2)) )
+    {
+        GTERROR(xgt->logger, "ioctl DMABUF_EXP_FROM_REFS_V2 failed");
+        goto out;
+    }
+
+    *dmabuf_fd = from_refs_v2->fd;
+    rc = 0;
+
+out:
+    free(from_refs_v2);
+    return rc;
+}
+
 int osdep_gnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt,
                                           uint32_t fd, uint32_t wait_to_ms)
 {
@@ -413,6 +458,47 @@ out:
     return rc;
 }
 
+int osdep_gnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                       uint32_t fd, uint32_t count,
+                                       uint32_t *refs,
+                                       uint32_t *data_ofs)
+{
+    struct ioctl_gntdev_dmabuf_imp_to_refs_v2 *to_refs_v2 = NULL;
+    int rc = -1;
+
+    if ( !count )
+    {
+        errno = EINVAL;
+        goto out;
+    }
+
+    to_refs_v2 = malloc(sizeof(*to_refs_v2) +
+                        (count - 1) * sizeof(to_refs_v2->refs[0]));
+    if ( !to_refs_v2 )
+    {
+        errno = ENOMEM;
+        goto out;
+    }
+
+    to_refs_v2->fd = fd;
+    to_refs_v2->count = count;
+    to_refs_v2->domid = domid;
+
+    if ( (rc = ioctl(xgt->fd, IOCTL_GNTDEV_DMABUF_IMP_TO_REFS_V2, to_refs_v2)) )
+    {
+        GTERROR(xgt->logger, "ioctl DMABUF_IMP_TO_REFS_V2 failed");
+        goto out;
+    }
+
+    memcpy(refs, to_refs_v2->refs, count * sizeof(*refs));
+    *data_ofs = to_refs_v2->data_ofs;
+    rc = 0;
+
+out:
+    free(to_refs_v2);
+    return rc;
+}
+
 int osdep_gnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd)
 {
     struct ioctl_gntdev_dmabuf_imp_release release;
diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index f78caadd3043..298416b2a98d 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -120,6 +120,14 @@ int osdep_gnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
     return -1;
 }
 
+int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                         uint32_t flags, uint32_t count,
+                                         const uint32_t *refs, uint32_t *fd,
+                                         uint32_t data_ofs)
+{
+    return -1;
+}
+
 int osdep_gnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt,
                                           uint32_t fd, uint32_t wait_to_ms)
 {
@@ -133,6 +141,13 @@ int osdep_gnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
     return -1;
 }
 
+int osdep_gnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                       uint32_t fd, uint32_t count,
+                                       uint32_t *refs, uint32_t *data_ofs)
+{
+    return -1;
+}
+
 int osdep_gnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd)
 {
     return -1;
diff --git a/tools/libs/gnttab/private.h b/tools/libs/gnttab/private.h
index c5e23639b141..07271637f609 100644
--- a/tools/libs/gnttab/private.h
+++ b/tools/libs/gnttab/private.h
@@ -39,6 +39,11 @@ int osdep_gnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
                                       uint32_t flags, uint32_t count,
                                       const uint32_t *refs, uint32_t *fd);
 
+int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                         uint32_t flags, uint32_t count,
+                                         const uint32_t *refs, uint32_t *fd,
+                                         uint32_t data_ofs);
+
 int osdep_gnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt,
                                           uint32_t fd, uint32_t wait_to_ms);
 
@@ -46,6 +51,10 @@ int osdep_gnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
                                     uint32_t fd, uint32_t count,
                                     uint32_t *refs);
 
+int osdep_gnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
+                                       uint32_t fd, uint32_t count,
+                                       uint32_t *refs, uint32_t *data_ofs);
+
 int osdep_gnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd);
 
 int osdep_gntshr_open(xengntshr_handle *xgs);
-- 
2.17.1


