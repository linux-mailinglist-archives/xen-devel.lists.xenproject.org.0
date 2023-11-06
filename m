Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF87E281A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628136.979276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AF-0000Kg-Mv; Mon, 06 Nov 2023 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628136.979276; Mon, 06 Nov 2023 15:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AF-00005z-Gb; Mon, 06 Nov 2023 15:05:19 +0000
Received: by outflank-mailman (input) for mailman id 628136;
 Mon, 06 Nov 2023 15:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AE-000892-14
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e467330d-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:05:16 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso33829815e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:16 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:15 -0800 (PST)
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
X-Inumbo-ID: e467330d-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283115; x=1699887915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUl/YemLBar/By9ea/qJ8DP9EY4pMDlEHPma04eJp64=;
        b=aa7gL0Zr/oz7ZM11Nv1NtlDtXfHKFTd5MpV9hOheAkn3oF/nvcNmDTJKK+x+n2dqJy
         Esh2/jKMjAbD97HUwEn4SlfYwpIyXvBnkoXA55oqyzZ7DXnchD4OzB4xC4d5odj3piYP
         6dZ2M8GlUWtWciCCjZfGIvwYU3d19yZ6gvuUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283115; x=1699887915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUl/YemLBar/By9ea/qJ8DP9EY4pMDlEHPma04eJp64=;
        b=EV++YPxEulF/hc1ZvL3kuwI2/RF+2tY4egjptXdCDjRsrSCz0bxAewEbnPl92Z2hoJ
         ajNqzGwIrUPfvhCsgAWkp2PPydkJRFYcAF3jwq5uQAnCpWq4HLEmkR7xrjp+y/U3TZbt
         Ga2a07NCOhvdSpDNBAuY+MkXbS5ro3xtXstTX8+EGfXlwNKx5rZcEsvYwpQk86qRMzH9
         fLjSpHA2XjWrhZjAt4m51D516QN3CXYpAxvc5ph+owRa2lpx7pZ66xZg5ja7ibcJepsS
         bz+HIvGig15UVfQrNRhJF52ycnLgD6mM03crCrPddUr49eOufee9hUBU2rgop5veGif2
         hbyw==
X-Gm-Message-State: AOJu0YwNu/55egELo6bH6HfUoRxmf+iguSc+cTalR+MwOTPUsltJRn2e
	ywdImMYQlb+cfEQUXALW24dPdAsoHf3vseZMBiA=
X-Google-Smtp-Source: AGHT+IFiYrJniTDE0DlNzldrdMGBp1AMlFw3FlzGj3VRdyqCtM3fEF3dtfiPOzWteyxQ0kvPGlFgyA==
X-Received: by 2002:a05:600c:358a:b0:408:59d4:f3d8 with SMTP id p10-20020a05600c358a00b0040859d4f3d8mr24447779wmq.18.1699283115286;
        Mon, 06 Nov 2023 07:05:15 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/6] tools/libfsimage: Add an fdopen() interface to libfsimage
Date: Mon,  6 Nov 2023 15:05:06 +0000
Message-Id: <20231106150508.22665-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently libfsimage requires taking a path so it can open a file itself.
This needs not to be the case and is, as far as I've gathered, a side
effect of the ext2fs-lib's optional dependency because it couldn't cope
directly with FDs until e2fsprogs-1.43.2. That was 2016, so it's safe to
make use of this feature in order to improve the security stance of pygrub.

  https://github.com/tytso/e2fsprogs/commit/4ccf9e4fe165cfa966c8af0f3d310230aa5c3a1e

This patch modifies the internals of libfsimage to:
  * Expose a new fdopen() function
    * Mirrors open(), except we pass an fd rather than a path
  * Refactor open() to use fdopen() internally
  * Rewire libfsimage so paths are not passed around
  * Rewire ext2fs-lib shim to use unixfd_io_manager

Note that while fdopen() takes an FD, close() will still close it. Clients
of libfsimage must ensure they duplicate any file descriptor they want to
preserve past the lifetime of the fsi_t* objects that use them.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libfsimage/common/fsimage.c           | 42 +++++++++++++++------
 tools/libfsimage/common/fsimage_grub.c      |  2 +-
 tools/libfsimage/common/fsimage_plugin.c    |  4 +-
 tools/libfsimage/common/fsimage_priv.h      |  3 +-
 tools/libfsimage/common/mapfile-GNU         |  2 +
 tools/libfsimage/common/mapfile-SunOS       |  2 +
 tools/libfsimage/common/xenfsimage.h        |  3 ++
 tools/libfsimage/common/xenfsimage_plugin.h |  2 +-
 tools/libfsimage/ext2fs-lib/ext2fs-lib.c    | 14 ++++++-
 9 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/tools/libfsimage/common/fsimage.c b/tools/libfsimage/common/fsimage.c
index 5cfa56a84d..1fd302e506 100644
--- a/tools/libfsimage/common/fsimage.c
+++ b/tools/libfsimage/common/fsimage.c
@@ -38,15 +38,32 @@ static pthread_mutex_t fsi_lock = PTHREAD_MUTEX_INITIALIZER;
 
 fsi_t *fsi_open_fsimage(const char *path, uint64_t off, const char *options)
 {
-	fsi_t *fsi = NULL;
+	fsi_t *fsi;
 	int fd;
 	int err;
 
 	if ((fd = open(path, O_RDONLY)) == -1)
-		goto fail;
+		return NULL;
+
+	fsi = fsi_fdopen_fsimage(fd, off, options);
+
+	if (fsi)
+		return fsi;
+
+	err = errno;
+	(void) close(fd);
+	errno = err;
+
+	return NULL;
+}
+
+fsi_t *fsi_fdopen_fsimage(int fd, uint64_t off, const char *options)
+{
+	fsi_t *fsi = NULL;
+	int err;
 
 	if ((fsi = malloc(sizeof(*fsi))) == NULL)
-		goto fail;
+		return NULL;
 
 	fsi->f_fd = fd;
 	fsi->f_off = off;
@@ -54,20 +71,17 @@ fsi_t *fsi_open_fsimage(const char *path, uint64_t off, const char *options)
 	fsi->f_bootstring = NULL;
 
 	pthread_mutex_lock(&fsi_lock);
-	err = find_plugin(fsi, path, options);
+	err = find_plugin(fsi, options);
 	pthread_mutex_unlock(&fsi_lock);
-	if (err != 0)
-		goto fail;
 
-	return (fsi);
+	if (!err)
+		return fsi;
 
-fail:
 	err = errno;
-	if (fd != -1)
-		(void) close(fd);
 	free(fsi);
 	errno = err;
-	return (NULL);
+
+	return NULL;
 }
 
 void fsi_close_fsimage(fsi_t *fsi)
@@ -167,3 +181,9 @@ fsi_fs_bootstring(fsi_t *fsi)
 {
 	return (fsi->f_bootstring);
 }
+
+int
+fsi_fd(fsi_t *fsi)
+{
+	return (fsi->f_fd);
+}
diff --git a/tools/libfsimage/common/fsimage_grub.c b/tools/libfsimage/common/fsimage_grub.c
index 258d48bfbb..04397235f7 100644
--- a/tools/libfsimage/common/fsimage_grub.c
+++ b/tools/libfsimage/common/fsimage_grub.c
@@ -221,7 +221,7 @@ fsig_substring(const char *s1, const char *s2)
 }
 
 static int
-fsig_mount(fsi_t *fsi, const char *path, const char *options)
+fsig_mount(fsi_t *fsi, const char *options)
 {
 	fsig_plugin_ops_t *ops = fsi->f_plugin->fp_data;
 	fsi_file_t *ffi;
diff --git a/tools/libfsimage/common/fsimage_plugin.c b/tools/libfsimage/common/fsimage_plugin.c
index d0cb9e96a6..6645ce3bfe 100644
--- a/tools/libfsimage/common/fsimage_plugin.c
+++ b/tools/libfsimage/common/fsimage_plugin.c
@@ -175,7 +175,7 @@ fail:
 	return (ret);
 }
 
-int find_plugin(fsi_t *fsi, const char *path, const char *options)
+int find_plugin(fsi_t *fsi, const char *options)
 {
 	fsi_plugin_t *fp;
 	int ret = 0;
@@ -185,7 +185,7 @@ int find_plugin(fsi_t *fsi, const char *path, const char *options)
 
 	for (fp = plugins; fp != NULL; fp = fp->fp_next) {
 		fsi->f_plugin = fp;
-		if (fp->fp_ops->fpo_mount(fsi, path, options) == 0)
+		if (fp->fp_ops->fpo_mount(fsi, options) == 0)
 			goto out;
 	}
 
diff --git a/tools/libfsimage/common/fsimage_priv.h b/tools/libfsimage/common/fsimage_priv.h
index 2274403557..779e433b37 100644
--- a/tools/libfsimage/common/fsimage_priv.h
+++ b/tools/libfsimage/common/fsimage_priv.h
@@ -29,6 +29,7 @@ extern C {
 #endif
 
 #include <sys/types.h>
+#include <stdbool.h>
 
 #include "xenfsimage.h"
 #include "xenfsimage_plugin.h"
@@ -54,7 +55,7 @@ struct fsi_file {
 	void *ff_data;
 };
 
-int find_plugin(fsi_t *, const char *, const char *);
+int find_plugin(fsi_t *, const char *);
 
 #ifdef __cplusplus
 };
diff --git a/tools/libfsimage/common/mapfile-GNU b/tools/libfsimage/common/mapfile-GNU
index 2d54d527d7..658f313315 100644
--- a/tools/libfsimage/common/mapfile-GNU
+++ b/tools/libfsimage/common/mapfile-GNU
@@ -3,6 +3,7 @@ VERSION {
 		global:
 			fsi_init;
 			fsi_open_fsimage;
+			fsi_fdopen_fsimage;
 			fsi_close_fsimage;
 			fsi_file_exists;
 			fsi_open_file;
@@ -12,6 +13,7 @@ VERSION {
 			fsi_bootstring_alloc;
 			fsi_bootstring_free;
 			fsi_fs_bootstring;
+			fsi_fd;
 	
 			fsip_fs_set_data;
 			fsip_file_alloc;
diff --git a/tools/libfsimage/common/mapfile-SunOS b/tools/libfsimage/common/mapfile-SunOS
index 48deedb425..a03646ff73 100644
--- a/tools/libfsimage/common/mapfile-SunOS
+++ b/tools/libfsimage/common/mapfile-SunOS
@@ -2,6 +2,7 @@ libfsimage.so.1.0 {
 	global:
 		fsi_init;
 		fsi_open_fsimage;
+		fsi_fdopen_fsimage;
 		fsi_close_fsimage;
 		fsi_file_exists;
 		fsi_open_file;
@@ -11,6 +12,7 @@ libfsimage.so.1.0 {
 		fsi_bootstring_alloc;
 		fsi_bootstring_free;
 		fsi_fs_bootstring;
+		fsi_fd;
 
 		fsip_fs_set_data;
 		fsip_file_alloc;
diff --git a/tools/libfsimage/common/xenfsimage.h b/tools/libfsimage/common/xenfsimage.h
index 341883b2d7..8048cc7470 100644
--- a/tools/libfsimage/common/xenfsimage.h
+++ b/tools/libfsimage/common/xenfsimage.h
@@ -44,6 +44,7 @@ typedef struct fsi_file fsi_file_t;
 int fsi_init(void);
 
 fsi_t *fsi_open_fsimage(const char *, uint64_t, const char *);
+fsi_t *fsi_fdopen_fsimage(int, uint64_t, const char *);
 void fsi_close_fsimage(fsi_t *);
 
 int fsi_file_exists(fsi_t *, const char *);
@@ -57,6 +58,8 @@ char *fsi_bootstring_alloc(fsi_t *, size_t);
 void fsi_bootstring_free(fsi_t *);
 char *fsi_fs_bootstring(fsi_t *);
 
+int fsi_fd(fsi_t *);
+
 #ifdef __cplusplus
 };
 #endif
diff --git a/tools/libfsimage/common/xenfsimage_plugin.h b/tools/libfsimage/common/xenfsimage_plugin.h
index 4135769018..996ea5ecbb 100644
--- a/tools/libfsimage/common/xenfsimage_plugin.h
+++ b/tools/libfsimage/common/xenfsimage_plugin.h
@@ -38,7 +38,7 @@ typedef struct fsi_plugin fsi_plugin_t;
 
 typedef struct fsi_plugin_ops {
 	int fpo_version;
-	int (*fpo_mount)(fsi_t *, const char *, const char *);
+	int (*fpo_mount)(fsi_t *, const char *);
 	int (*fpo_umount)(fsi_t *);
 	fsi_file_t *(*fpo_open)(fsi_t *, const char *);
 	ssize_t (*fpo_read)(fsi_file_t *, void *, size_t);
diff --git a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
index 864a15b349..9f07ea288f 100644
--- a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
+++ b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
@@ -25,15 +25,25 @@
 #include INCLUDE_EXTFS_H
 #include <errno.h>
 #include <inttypes.h>
+#include <stdio.h>
 
 static int
-ext2lib_mount(fsi_t *fsi, const char *name, const char *options)
+ext2lib_mount(fsi_t *fsi, const char *options)
 {
 	int err;
 	char opts[30] = "";
 	ext2_filsys *fs;
 	uint64_t offset = fsip_fs_offset(fsi);
 
+	/*
+	 * We must choose unixfd_io_manager rather than unix_io_manager in
+	 * order for the library to accept fd strings instead of paths. It
+	 * still means we must pass a string representing an fd rather than
+	 * an int, but at least this way we don't need to pass paths around
+	 */
+	char name[32] = {0};
+	(void)snprintf(name, sizeof(name) - 1, "%d", fsi_fd(fsi));
+
 	if (offset)
 		snprintf(opts, 29, "offset=%" PRId64, offset);
 
@@ -41,7 +51,7 @@ ext2lib_mount(fsi_t *fsi, const char *name, const char *options)
 	if (fs == NULL)
 		return (-1);
 
-	err = ext2fs_open2(name, opts, 0, 0, 0, unix_io_manager, fs);
+	err = ext2fs_open2(name, opts, 0, 0, 0, unixfd_io_manager, fs);
 
 	if (err != 0) {
 		free(fs);
-- 
2.34.1


