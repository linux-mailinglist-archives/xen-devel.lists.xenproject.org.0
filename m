Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20D1D90E7
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZ6-0004pb-Ls; Tue, 19 May 2020 07:21:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawZ5-0004p2-Nm
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:27 +0000
X-Inumbo-ID: 501f5d5d-99a1-11ea-a8e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 501f5d5d-99a1-11ea-a8e2-12813bfff9fa;
 Tue, 19 May 2020 07:21:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA765B21A;
 Tue, 19 May 2020 07:21:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 05/12] libs: add libxenhypfs
Date: Tue, 19 May 2020 09:20:59 +0200
Message-Id: <20200519072106.26894-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add the new library libxenhypfs for access to the hypervisor filesystem.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
V1:
- rename to libxenhypfs
- add xenhypfs_write()

V3:
- major rework due to new hypervisor interface
- add decompression capability

V4:
- add dependency to libz in pkgconfig file (Wei Liu)

V7:
- don't assume hypervisor's sizeof(bool) is same as in user land

V8:
- add some comments regarding the semantics of the lib functions
  (George Dunlap)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                          |   2 +
 tools/Rules.mk                      |   6 +
 tools/libs/Makefile                 |   1 +
 tools/libs/hypfs/Makefile           |  16 +
 tools/libs/hypfs/core.c             | 536 ++++++++++++++++++++++++++++
 tools/libs/hypfs/include/xenhypfs.h |  90 +++++
 tools/libs/hypfs/libxenhypfs.map    |  10 +
 tools/libs/hypfs/xenhypfs.pc.in     |  10 +
 8 files changed, 671 insertions(+)
 create mode 100644 tools/libs/hypfs/Makefile
 create mode 100644 tools/libs/hypfs/core.c
 create mode 100644 tools/libs/hypfs/include/xenhypfs.h
 create mode 100644 tools/libs/hypfs/libxenhypfs.map
 create mode 100644 tools/libs/hypfs/xenhypfs.pc.in

diff --git a/.gitignore b/.gitignore
index 034f44b21b..7bd292f64d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -110,6 +110,8 @@ tools/libs/evtchn/headers.chk
 tools/libs/evtchn/xenevtchn.pc
 tools/libs/gnttab/headers.chk
 tools/libs/gnttab/xengnttab.pc
+tools/libs/hypfs/headers.chk
+tools/libs/hypfs/xenhypfs.pc
 tools/libs/call/headers.chk
 tools/libs/call/xencall.pc
 tools/libs/foreignmemory/headers.chk
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5b8cf748ad..ad6073fcad 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -19,6 +19,7 @@ XEN_LIBXENGNTTAB   = $(XEN_ROOT)/tools/libs/gnttab
 XEN_LIBXENCALL     = $(XEN_ROOT)/tools/libs/call
 XEN_LIBXENFOREIGNMEMORY = $(XEN_ROOT)/tools/libs/foreignmemory
 XEN_LIBXENDEVICEMODEL = $(XEN_ROOT)/tools/libs/devicemodel
+XEN_LIBXENHYPFS    = $(XEN_ROOT)/tools/libs/hypfs
 XEN_LIBXC          = $(XEN_ROOT)/tools/libxc
 XEN_XENLIGHT       = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
@@ -132,6 +133,11 @@ SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLI
 LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_LIBXENDEVICEMODEL)/libxendevicemodel$(libextension)
 SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_LIBXENDEVICEMODEL)
 
+CFLAGS_libxenhypfs = -I$(XEN_LIBXENHYPFS)/include $(CFLAGS_xeninclude)
+SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_xencall)
+LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_LIBXENHYPFS)/libxenhypfs$(libextension)
+SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_LIBXENHYPFS)
+
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
 CFLAGS_libxenctrl = -I$(XEN_LIBXC)/include $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) $(CFLAGS_xeninclude) -D__XEN_TOOLS__
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 88901e7341..69cdfb5975 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -9,6 +9,7 @@ SUBDIRS-y += gnttab
 SUBDIRS-y += call
 SUBDIRS-y += foreignmemory
 SUBDIRS-y += devicemodel
+SUBDIRS-y += hypfs
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
new file mode 100644
index 0000000000..06dd449929
--- /dev/null
+++ b/tools/libs/hypfs/Makefile
@@ -0,0 +1,16 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+MAJOR    = 1
+MINOR    = 0
+LIBNAME  := hypfs
+USELIBS  := toollog toolcore call
+
+APPEND_LDFLAGS += -lz
+
+SRCS-y                 += core.c
+
+include ../libs.mk
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENHYPFS)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
new file mode 100644
index 0000000000..d4309b5ae2
--- /dev/null
+++ b/tools/libs/hypfs/core.c
@@ -0,0 +1,536 @@
+/*
+ * Copyright (c) 2019 SUSE Software Solutions Germany GmbH
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define __XEN_TOOLS__ 1
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <zlib.h>
+
+#include <xentoollog.h>
+#include <xenhypfs.h>
+#include <xencall.h>
+#include <xentoolcore_internal.h>
+
+#include <xen/xen.h>
+#include <xen/hypfs.h>
+
+#define BUF_SIZE 4096
+
+struct xenhypfs_handle {
+    xentoollog_logger *logger, *logger_tofree;
+    unsigned int flags;
+    xencall_handle *xcall;
+};
+
+xenhypfs_handle *xenhypfs_open(xentoollog_logger *logger,
+                               unsigned open_flags)
+{
+    xenhypfs_handle *fshdl = calloc(1, sizeof(*fshdl));
+
+    if (!fshdl)
+        return NULL;
+
+    fshdl->flags = open_flags;
+    fshdl->logger = logger;
+    fshdl->logger_tofree = NULL;
+
+    if (!fshdl->logger) {
+        fshdl->logger = fshdl->logger_tofree =
+            (xentoollog_logger*)
+            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
+        if (!fshdl->logger)
+            goto err;
+    }
+
+    fshdl->xcall = xencall_open(fshdl->logger, 0);
+    if (!fshdl->xcall)
+        goto err;
+
+    /* No need to remember supported version, we only support V1. */
+    if (xencall5(fshdl->xcall, __HYPERVISOR_hypfs_op,
+                 XEN_HYPFS_OP_get_version, 0, 0, 0, 0) < 0)
+        goto err;
+
+    return fshdl;
+
+err:
+    xtl_logger_destroy(fshdl->logger_tofree);
+    xencall_close(fshdl->xcall);
+    free(fshdl);
+    return NULL;
+}
+
+int xenhypfs_close(xenhypfs_handle *fshdl)
+{
+    if (!fshdl)
+        return 0;
+
+    xencall_close(fshdl->xcall);
+    xtl_logger_destroy(fshdl->logger_tofree);
+    free(fshdl);
+    return 0;
+}
+
+static int xenhypfs_get_pathbuf(xenhypfs_handle *fshdl, const char *path,
+                                char **path_buf)
+{
+    int ret = -1;
+    int path_sz;
+
+    if (!fshdl) {
+        errno = EBADF;
+        goto out;
+    }
+
+    path_sz = strlen(path) + 1;
+    if (path_sz > XEN_HYPFS_MAX_PATHLEN)
+    {
+        errno = ENAMETOOLONG;
+        goto out;
+    }
+
+    *path_buf = xencall_alloc_buffer(fshdl->xcall, path_sz);
+    if (!*path_buf) {
+        errno = ENOMEM;
+        goto out;
+    }
+    strcpy(*path_buf, path);
+
+    ret = path_sz;
+
+ out:
+    return ret;
+}
+
+static void *xenhypfs_inflate(void *in_data, size_t *sz)
+{
+    unsigned char *workbuf;
+    void *content = NULL;
+    unsigned int out_sz;
+    z_stream z = { .opaque = NULL };
+    int ret;
+
+    workbuf = malloc(BUF_SIZE);
+    if (!workbuf)
+        return NULL;
+
+    z.next_in = in_data;
+    z.avail_in = *sz;
+    ret = inflateInit2(&z, MAX_WBITS + 32); /* 32 == gzip */
+
+    for (*sz = 0; ret == Z_OK; *sz += out_sz) {
+        z.next_out = workbuf;
+        z.avail_out = BUF_SIZE;
+        ret = inflate(&z, Z_SYNC_FLUSH);
+        if (ret != Z_OK && ret != Z_STREAM_END)
+            break;
+
+        out_sz = z.next_out - workbuf;
+        content = realloc(content, *sz + out_sz);
+        if (!content) {
+            ret = Z_MEM_ERROR;
+            break;
+        }
+        memcpy(content + *sz, workbuf, out_sz);
+    }
+
+    inflateEnd(&z);
+    if (ret != Z_STREAM_END) {
+        free(content);
+        content = NULL;
+        errno = EIO;
+    }
+    free(workbuf);
+    return content;
+}
+
+static void xenhypfs_set_attrs(struct xen_hypfs_direntry *entry,
+                               struct xenhypfs_dirent *dirent)
+{
+    dirent->size = entry->content_len;
+
+    switch(entry->type) {
+    case XEN_HYPFS_TYPE_DIR:
+        dirent->type = xenhypfs_type_dir;
+        break;
+    case XEN_HYPFS_TYPE_BLOB:
+        dirent->type = xenhypfs_type_blob;
+        break;
+    case XEN_HYPFS_TYPE_STRING:
+        dirent->type = xenhypfs_type_string;
+        break;
+    case XEN_HYPFS_TYPE_UINT:
+        dirent->type = xenhypfs_type_uint;
+        break;
+    case XEN_HYPFS_TYPE_INT:
+        dirent->type = xenhypfs_type_int;
+        break;
+    case XEN_HYPFS_TYPE_BOOL:
+        dirent->type = xenhypfs_type_bool;
+        break;
+    default:
+        dirent->type = xenhypfs_type_blob;
+    }
+
+    switch (entry->encoding) {
+    case XEN_HYPFS_ENC_PLAIN:
+        dirent->encoding = xenhypfs_enc_plain;
+        break;
+    case XEN_HYPFS_ENC_GZIP:
+        dirent->encoding = xenhypfs_enc_gzip;
+        break;
+    default:
+        dirent->encoding = xenhypfs_enc_plain;
+        dirent->type = xenhypfs_type_blob;
+    }
+
+    dirent->is_writable = entry->max_write_len;
+}
+
+void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
+                        struct xenhypfs_dirent **dirent)
+{
+    void *retbuf = NULL, *content = NULL;
+    char *path_buf = NULL;
+    const char *name;
+    struct xen_hypfs_direntry *entry;
+    int ret;
+    int sz, path_sz;
+
+    *dirent = NULL;
+    ret = xenhypfs_get_pathbuf(fshdl, path, &path_buf);
+    if (ret < 0)
+        goto out;
+
+    path_sz = ret;
+
+    for (sz = BUF_SIZE;; sz = sizeof(*entry) + entry->content_len) {
+        if (retbuf)
+            xencall_free_buffer(fshdl->xcall, retbuf);
+
+        retbuf = xencall_alloc_buffer(fshdl->xcall, sz);
+        if (!retbuf) {
+            errno = ENOMEM;
+            goto out;
+        }
+        entry = retbuf;
+
+        ret = xencall5(fshdl->xcall, __HYPERVISOR_hypfs_op, XEN_HYPFS_OP_read,
+                       (unsigned long)path_buf, path_sz,
+                       (unsigned long)retbuf, sz);
+        if (!ret)
+            break;
+
+        if (ret != ENOBUFS) {
+            errno = -ret;
+            goto out;
+        }
+    }
+
+    content = malloc(entry->content_len);
+    if (!content)
+        goto out;
+    memcpy(content, entry + 1, entry->content_len);
+
+    name = strrchr(path, '/');
+    if (!name)
+        name = path;
+    else {
+        name++;
+        if (!*name)
+            name--;
+    }
+    *dirent = calloc(1, sizeof(struct xenhypfs_dirent) + strlen(name) + 1);
+    if (!*dirent) {
+        free(content);
+        content = NULL;
+        errno = ENOMEM;
+        goto out;
+    }
+    (*dirent)->name = (char *)(*dirent + 1);
+    strcpy((*dirent)->name, name);
+    xenhypfs_set_attrs(entry, *dirent);
+
+ out:
+    ret = errno;
+    xencall_free_buffer(fshdl->xcall, path_buf);
+    xencall_free_buffer(fshdl->xcall, retbuf);
+    errno = ret;
+
+    return content;
+}
+
+char *xenhypfs_read(xenhypfs_handle *fshdl, const char *path)
+{
+    char *buf, *ret_buf = NULL;
+    struct xenhypfs_dirent *dirent;
+    int ret;
+
+    buf = xenhypfs_read_raw(fshdl, path, &dirent);
+    if (!buf)
+        goto out;
+
+    switch (dirent->encoding) {
+    case xenhypfs_enc_plain:
+        break;
+    case xenhypfs_enc_gzip:
+        ret_buf = xenhypfs_inflate(buf, &dirent->size);
+        if (!ret_buf)
+            goto out;
+        free(buf);
+        buf = ret_buf;
+        ret_buf = NULL;
+        break;
+    }
+
+    switch (dirent->type) {
+    case xenhypfs_type_dir:
+        errno = EISDIR;
+        break;
+    case xenhypfs_type_blob:
+        errno = EDOM;
+        break;
+    case xenhypfs_type_string:
+        ret_buf = buf;
+        buf = NULL;
+        break;
+    case xenhypfs_type_uint:
+    case xenhypfs_type_bool:
+        switch (dirent->size) {
+        case 1:
+            ret = asprintf(&ret_buf, "%"PRIu8, *(uint8_t *)buf);
+            break;
+        case 2:
+            ret = asprintf(&ret_buf, "%"PRIu16, *(uint16_t *)buf);
+            break;
+        case 4:
+            ret = asprintf(&ret_buf, "%"PRIu32, *(uint32_t *)buf);
+            break;
+        case 8:
+            ret = asprintf(&ret_buf, "%"PRIu64, *(uint64_t *)buf);
+            break;
+        default:
+            ret = -1;
+            errno = EDOM;
+        }
+        if (ret < 0)
+            ret_buf = NULL;
+        break;
+    case xenhypfs_type_int:
+        switch (dirent->size) {
+        case 1:
+            ret = asprintf(&ret_buf, "%"PRId8, *(int8_t *)buf);
+            break;
+        case 2:
+            ret = asprintf(&ret_buf, "%"PRId16, *(int16_t *)buf);
+            break;
+        case 4:
+            ret = asprintf(&ret_buf, "%"PRId32, *(int32_t *)buf);
+            break;
+        case 8:
+            ret = asprintf(&ret_buf, "%"PRId64, *(int64_t *)buf);
+            break;
+        default:
+            ret = -1;
+            errno = EDOM;
+        }
+        if (ret < 0)
+            ret_buf = NULL;
+        break;
+    }
+
+ out:
+    ret = errno;
+    free(buf);
+    free(dirent);
+    errno = ret;
+
+    return ret_buf;
+}
+
+struct xenhypfs_dirent *xenhypfs_readdir(xenhypfs_handle *fshdl,
+                                         const char *path,
+                                         unsigned int *num_entries)
+{
+    void *buf, *curr;
+    int ret;
+    char *names;
+    struct xenhypfs_dirent *ret_buf = NULL, *dirent;
+    unsigned int n = 0, name_sz = 0;
+    struct xen_hypfs_dirlistentry *entry;
+
+    buf = xenhypfs_read_raw(fshdl, path, &dirent);
+    if (!buf)
+        goto out;
+
+    if (dirent->type != xenhypfs_type_dir ||
+        dirent->encoding != xenhypfs_enc_plain) {
+        errno = ENOTDIR;
+        goto out;
+    }
+
+    if (dirent->size) {
+        curr = buf;
+        for (n = 1;; n++) {
+            entry = curr;
+            name_sz += strlen(entry->name) + 1;
+            if (!entry->off_next)
+                break;
+
+            curr += entry->off_next;
+        }
+    }
+
+    ret_buf = malloc(n * sizeof(*ret_buf) + name_sz);
+    if (!ret_buf)
+        goto out;
+
+    *num_entries = n;
+    names = (char *)(ret_buf + n);
+    curr = buf;
+    for (n = 0; n < *num_entries; n++) {
+        entry = curr;
+        xenhypfs_set_attrs(&entry->e, ret_buf + n);
+        ret_buf[n].name = names;
+        strcpy(names, entry->name);
+        names += strlen(entry->name) + 1;
+        curr += entry->off_next;
+    }
+
+ out:
+    ret = errno;
+    free(buf);
+    free(dirent);
+    errno = ret;
+
+    return ret_buf;
+}
+
+int xenhypfs_write(xenhypfs_handle *fshdl, const char *path, const char *val)
+{
+    void *buf = NULL;
+    char *path_buf = NULL, *val_end;
+    int ret, saved_errno;
+    int sz, path_sz;
+    struct xen_hypfs_direntry *entry;
+    uint64_t mask;
+
+    ret = xenhypfs_get_pathbuf(fshdl, path, &path_buf);
+    if (ret < 0)
+        goto out;
+
+    path_sz = ret;
+    ret = -1;
+
+    sz = BUF_SIZE;
+    buf = xencall_alloc_buffer(fshdl->xcall, sz);
+    if (!buf) {
+        errno = ENOMEM;
+        goto out;
+    }
+
+    ret = xencall5(fshdl->xcall, __HYPERVISOR_hypfs_op, XEN_HYPFS_OP_read,
+                   (unsigned long)path_buf, path_sz,
+                   (unsigned long)buf, sizeof(*entry));
+    if (ret && errno != ENOBUFS)
+        goto out;
+    ret = -1;
+    entry = buf;
+    if (!entry->max_write_len) {
+        errno = EACCES;
+        goto out;
+    }
+    if (entry->encoding != XEN_HYPFS_ENC_PLAIN) {
+        /* Writing compressed data currently not supported. */
+        errno = EDOM;
+        goto out;
+    }
+
+    switch (entry->type) {
+    case XEN_HYPFS_TYPE_STRING:
+        if (sz < strlen(val) + 1) {
+            sz = strlen(val) + 1;
+            xencall_free_buffer(fshdl->xcall, buf);
+            buf = xencall_alloc_buffer(fshdl->xcall, sz);
+            if (!buf) {
+                errno = ENOMEM;
+                goto out;
+            }
+        }
+        sz = strlen(val) + 1;
+        strcpy(buf, val);
+        break;
+    case XEN_HYPFS_TYPE_UINT:
+        sz = entry->content_len;
+        errno = 0;
+        *(unsigned long long *)buf = strtoull(val, &val_end, 0);
+        if (errno || !*val || *val_end)
+            goto out;
+        mask = ~0ULL << (8 * sz);
+        if ((*(uint64_t *)buf & mask) && ((*(uint64_t *)buf & mask) != mask)) {
+            errno = ERANGE;
+            goto out;
+        }
+        break;
+    case XEN_HYPFS_TYPE_INT:
+        sz = entry->content_len;
+        errno = 0;
+        *(unsigned long long *)buf = strtoll(val, &val_end, 0);
+        if (errno || !*val || *val_end)
+            goto out;
+        mask = (sz == 8) ? 0 : ~0ULL << (8 * sz);
+        if ((*(uint64_t *)buf & mask) && ((*(uint64_t *)buf & mask) != mask)) {
+            errno = ERANGE;
+            goto out;
+        }
+        break;
+    case XEN_HYPFS_TYPE_BOOL:
+        sz = entry->content_len;
+        *(unsigned long long *)buf = 0;
+        if (!strcmp(val, "1") || !strcmp(val, "on") || !strcmp(val, "yes") ||
+            !strcmp(val, "true") || !strcmp(val, "enable"))
+            *(unsigned long long *)buf = 1;
+        else if (strcmp(val, "0") && strcmp(val, "no") && strcmp(val, "off") &&
+                 strcmp(val, "false") && strcmp(val, "disable")) {
+            errno = EDOM;
+            goto out;
+        }
+        break;
+    default:
+        /* No support for other types (yet). */
+        errno = EDOM;
+        goto out;
+    }
+
+    ret = xencall5(fshdl->xcall, __HYPERVISOR_hypfs_op,
+                   XEN_HYPFS_OP_write_contents,
+                   (unsigned long)path_buf, path_sz,
+                   (unsigned long)buf, sz);
+
+ out:
+    saved_errno = errno;
+    xencall_free_buffer(fshdl->xcall, path_buf);
+    xencall_free_buffer(fshdl->xcall, buf);
+    errno = saved_errno;
+    return ret;
+}
diff --git a/tools/libs/hypfs/include/xenhypfs.h b/tools/libs/hypfs/include/xenhypfs.h
new file mode 100644
index 0000000000..ab157edceb
--- /dev/null
+++ b/tools/libs/hypfs/include/xenhypfs.h
@@ -0,0 +1,90 @@
+/*
+ * Copyright (c) 2019 SUSE Software Solutions Germany GmbH
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef XENHYPFS_H
+#define XENHYPFS_H
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <sys/types.h>
+
+/* Callers who don't care don't need to #include <xentoollog.h> */
+struct xentoollog_logger;
+
+typedef struct xenhypfs_handle xenhypfs_handle;
+
+struct xenhypfs_dirent {
+    char *name;
+    size_t size;
+    enum {
+        xenhypfs_type_dir,
+        xenhypfs_type_blob,
+        xenhypfs_type_string,
+        xenhypfs_type_uint,
+        xenhypfs_type_int,
+        xenhypfs_type_bool
+    } type;
+    enum {
+        xenhypfs_enc_plain,
+        xenhypfs_enc_gzip
+    } encoding;
+    bool is_writable;
+};
+
+xenhypfs_handle *xenhypfs_open(struct xentoollog_logger *logger,
+                               unsigned int open_flags);
+int xenhypfs_close(xenhypfs_handle *fshdl);
+
+/*
+ * Return the raw contents of a Xen hypfs entry and its dirent containing
+ * the size, type and encoding.
+ * Returned buffer and dirent should be freed via free().
+ */
+void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
+                        struct xenhypfs_dirent **dirent);
+
+/*
+ * Return the contents of a Xen hypfs entry as a string.
+ * Returned buffer should be freed via free().
+ */
+char *xenhypfs_read(xenhypfs_handle *fshdl, const char *path);
+
+/*
+ * Return the contents of a Xen hypfs directory in form of an array of
+ * dirents.
+ * Returned buffer should be freed via free().
+ */
+struct xenhypfs_dirent *xenhypfs_readdir(xenhypfs_handle *fshdl,
+                                         const char *path,
+                                         unsigned int *num_entries);
+
+/*
+ * Write a Xen hypfs entry with a value. The value is converted from a string
+ * to the appropriate type.
+ */
+int xenhypfs_write(xenhypfs_handle *fshdl, const char *path, const char *val);
+
+#endif /* XENHYPFS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/libs/hypfs/libxenhypfs.map b/tools/libs/hypfs/libxenhypfs.map
new file mode 100644
index 0000000000..47f1edda3e
--- /dev/null
+++ b/tools/libs/hypfs/libxenhypfs.map
@@ -0,0 +1,10 @@
+VERS_1.0 {
+	global:
+		xenhypfs_open;
+		xenhypfs_close;
+		xenhypfs_read_raw;
+		xenhypfs_read;
+		xenhypfs_readdir;
+		xenhypfs_write;
+	local: *; /* Do not expose anything by default */
+};
diff --git a/tools/libs/hypfs/xenhypfs.pc.in b/tools/libs/hypfs/xenhypfs.pc.in
new file mode 100644
index 0000000000..92a262c7a2
--- /dev/null
+++ b/tools/libs/hypfs/xenhypfs.pc.in
@@ -0,0 +1,10 @@
+prefix=@@prefix@@
+includedir=@@incdir@@
+libdir=@@libdir@@
+
+Name: Xenhypfs
+Description: The Xenhypfs library for Xen hypervisor
+Version: @@version@@
+Cflags: -I${includedir} @@cflagslocal@@
+Libs: @@libsflag@@${libdir} -lxenhypfs
+Requires.private: xentoolcore,xentoollog,xencall,z
-- 
2.26.1


