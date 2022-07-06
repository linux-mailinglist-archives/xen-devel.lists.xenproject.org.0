Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951D569421
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362587.592709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPh-0004Xf-KQ; Wed, 06 Jul 2022 21:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362587.592709; Wed, 06 Jul 2022 21:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPh-0004UY-HA; Wed, 06 Jul 2022 21:18:25 +0000
Received: by outflank-mailman (input) for mailman id 362587;
 Wed, 06 Jul 2022 21:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CH2-0003HV-NY
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:09:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea5ee30e-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:09:27 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141530530395.5815075032556;
 Wed, 6 Jul 2022 14:05:30 -0700 (PDT)
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
X-Inumbo-ID: ea5ee30e-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S4Pd5Ua+YLIwBW93VjYZA95MP8py3To/IxTEvHAqYduNamfMq2orRibCfrPlbw4e0W5SbEcQjzJNHoO8adi04PODNP7v1xVl6Ge3ZxKm+WoV+YjmcdBjKq7Gs02QsPSrOEg4soztxITQkF2b1tdvUdz1G50FPFgtd2bd6aLeYo8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141532; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TzFqy4EBOd/GMNv9mujkd/fHHyBVp+g+FM7/J81/w1g=; 
	b=OnuQQ+lSE0NsCnvaZf7N5Oy4t7uo60pBy6j7JWFFJAUU2ZRoTtzvxJHk3hkBUPH9SyfpnoSBA86fsYVAfu45QgGpiUWn7FkmsJCQBbHlGYPOkDHQN1BG8qhwOx4pHLFVlmY1aEWpToFmcpomKZEjPeVf8y5H9P+PTwzgx5aFo0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141532;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TzFqy4EBOd/GMNv9mujkd/fHHyBVp+g+FM7/J81/w1g=;
	b=VAT6AYQwoX3OC7hTtJyOksAXMnty1p42z36rkGo+COOWjf0qxxKa4yhRTWg51dnl
	DHjvb7Y0BR1DgJjTt9EaYI5B/oD2kEBacJGpeB7jlz6VxSAiAYWkzBkVod9i/Z/ojsJ
	Lcu4E9lvYH6WH+L1shVEAjQ8RUHBT1v40cCqBzE0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 18/18] tools: introduce example late pv helper
Date: Wed,  6 Jul 2022 17:04:53 -0400
Message-Id: <20220706210454.30096-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The late pv helper is an example helper tool for late setup of Xenstore for a
domain that was created by the hypervisor using hyperlaunch.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark christopher.clark@starlab.io
---
 .gitignore                    |   1 +
 tools/helpers/Makefile        |  11 ++
 tools/helpers/builder-hypfs.c | 253 ++++++++++++++++++++++++++++++
 tools/helpers/hypfs-helpers.h |   9 ++
 tools/helpers/late-init-pv.c  | 287 ++++++++++++++++++++++++++++++++++
 tools/helpers/late-init-pv.h  |  29 ++++
 tools/helpers/xs-helpers.c    | 117 ++++++++++++++
 tools/helpers/xs-helpers.h    |  27 ++++
 8 files changed, 734 insertions(+)
 create mode 100644 tools/helpers/builder-hypfs.c
 create mode 100644 tools/helpers/hypfs-helpers.h
 create mode 100644 tools/helpers/late-init-pv.c
 create mode 100644 tools/helpers/late-init-pv.h
 create mode 100644 tools/helpers/xs-helpers.c
 create mode 100644 tools/helpers/xs-helpers.h

diff --git a/.gitignore b/.gitignore
index 18ef56a780..0e5d5ceaab 100644
--- a/.gitignore
+++ b/.gitignore
@@ -206,6 +206,7 @@ tools/fuzz/x86_instruction_emulator/x86_emulate
 tools/fuzz/x86_instruction_emulator/x86-emulate.[ch]
 tools/helpers/init-xenstore-domain
 tools/helpers/xen-init-dom0
+tools/helpers/late-init-pv
 tools/hotplug/common/hotplugpath.sh
 tools/hotplug/FreeBSD/rc.d/xencommons
 tools/hotplug/FreeBSD/rc.d/xendriverdomain
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 8d78ab1e90..c32481202d 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -14,6 +14,7 @@ ifeq ($(CONFIG_ARM),y)
 PROGS += init-dom0less
 endif
 endif
+PROGS += late-init-pv
 
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -36,6 +37,13 @@ $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
 
+LATE_INIT_PV_OBJS = late-init-pv.o builder-hypfs.o xs-helpers.o
+$(LATE_INIT_PV_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
+$(LATE_INIT_PV_OBJS): CFLAGS += $(CFLAGS_libxenguest)
+$(LATE_INIT_PV_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+$(LATE_INIT_PV_OBJS): CFLAGS += $(CFLAGS_libxenhypfs)
+$(LATE_INIT_PV_OBJS): CFLAGS += $(CFLAGS_libxenstore)
+
 .PHONY: all
 all: $(PROGS)
 
@@ -48,6 +56,9 @@ init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 init-dom0less: $(INIT_DOM0LESS_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
 
+late-init-pv: $(LATE_INIT_PV_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(LATE_INIT_PV_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(APPEND_LDFLAGS)
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/tools/helpers/builder-hypfs.c b/tools/helpers/builder-hypfs.c
new file mode 100644
index 0000000000..d123426cfa
--- /dev/null
+++ b/tools/helpers/builder-hypfs.c
@@ -0,0 +1,253 @@
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <xenhypfs.h>
+
+#include "late-init-pv.h"
+
+/* general size for static path array */
+#define HYPFS_MAX_PATH 100
+
+bool has_builder_hypfs(xenhypfs_handle *hdl, uint32_t domid)
+{
+    struct xenhypfs_dirent *ent;
+    char path[HYPFS_MAX_PATH];
+    unsigned int n;
+
+    snprintf(path, HYPFS_MAX_PATH, "/builder/%d", domid);
+
+    ent = xenhypfs_readdir(hdl, path, &n);
+    if ( ent )
+    {
+        free(ent);
+        return true;
+    }
+
+    return false;
+}
+
+static int read_hypfs_bool(xenhypfs_handle *fshdl, const char *path, bool *val)
+{
+    struct xenhypfs_dirent *dirent;
+    void *raw_value;
+
+    errno = 0;
+
+    raw_value = xenhypfs_read_raw(fshdl, path, &dirent);
+    if ( raw_value == NULL )
+    {
+        errno = EIO;
+        return false;
+    }
+
+    if ( dirent->type != xenhypfs_type_bool )
+    {
+        errno = EINVAL;
+        return false;
+    }
+
+    *val = *(bool *)raw_value;
+
+    free(raw_value); free(dirent);
+    return true;
+}
+
+static bool read_hypfs_uint(
+    xenhypfs_handle *fshdl, const char *path, size_t sz, void *val)
+{
+    struct xenhypfs_dirent *dirent;
+    void *raw_value;
+
+    errno = 0;
+
+    raw_value = xenhypfs_read_raw(fshdl, path, &dirent);
+    if ( raw_value == NULL )
+    {
+        errno = EIO;
+        return false;
+    }
+
+    if ( (dirent->type != xenhypfs_type_uint) ||
+         (dirent->size != sz) )
+    {
+        errno = EINVAL;
+        return false;
+    }
+
+    switch ( sz )
+    {
+    case sizeof(uint8_t):
+        *(uint8_t *)val = *(uint8_t *)raw_value;
+        break;
+    case sizeof(uint16_t):
+        *(uint16_t *)val = *(uint16_t *)raw_value;
+        break;
+    case sizeof(uint32_t):
+        *(uint32_t *)val = *(uint32_t *)raw_value;
+        break;
+    case sizeof(uint64_t):
+        *(uint64_t *)val = *(uint64_t *)raw_value;
+        break;
+    default:
+        free(raw_value); free(dirent);
+        errno = EINVAL;
+        return false;
+    }
+
+    free(raw_value); free(dirent);
+    return true;
+}
+
+static uint8_t read_hypfs_uint8(xenhypfs_handle *fshdl, const char *path)
+{
+    uint8_t value;
+
+    if ( !read_hypfs_uint(fshdl, path, sizeof(value), &value) )
+    {
+        fprintf(stderr, "error: unable to read uint8_t from %s \n", path);
+        return 0;
+    }
+
+    return value;
+}
+
+static uint16_t read_hypfs_uint16(xenhypfs_handle *fshdl, const char *path)
+{
+    uint16_t value;
+
+    if ( !read_hypfs_uint(fshdl, path, sizeof(value), &value) )
+    {
+        fprintf(stderr, "error: unable to read uint16_t from %s \n", path);
+        return 0;
+    }
+
+    return value;
+}
+
+static uint32_t read_hypfs_uint32(xenhypfs_handle *fshdl, const char *path)
+{
+    uint32_t value;
+
+    if ( !read_hypfs_uint(fshdl, path, sizeof(value), &value) )
+    {
+        fprintf(stderr, "error: unable to read uint32_t from %s \n", path);
+        return 0;
+    }
+
+    return value;
+}
+
+static uint64_t read_hypfs_uint64(xenhypfs_handle *fshdl, const char *path)
+{
+    uint64_t value;
+
+    if ( !read_hypfs_uint(fshdl, path, sizeof(value), &value) )
+    {
+        fprintf(stderr, "error: unable to read uint64_t from %s \n", path);
+        return 0;
+    }
+
+    return value;
+}
+
+static bool is_constructed(xenhypfs_handle *fshdl, uint32_t domid)
+{
+    char path[HYPFS_MAX_PATH];
+    bool constructed;
+
+    snprintf(path, HYPFS_MAX_PATH, "/builder/%d/constructed", domid);
+
+    if ( !read_hypfs_bool(fshdl, path, &constructed) )
+    {
+        fprintf(stderr, "error: unable to read constructed field\n");
+        return false;
+    }
+
+    return constructed;
+}
+
+#define XS_PATH   "/builder/%d/xenstore"
+#define CONS_PATH "/builder/%d/devices/console"
+
+int read_hypfs_tree(xenhypfs_handle *hdl, struct domain_info *di)
+{
+    char path[HYPFS_MAX_PATH];
+
+    if ( !is_constructed(hdl, di->domid) )
+    {
+        fprintf(stderr, "error: domain %d did not get constructed\n",
+                di->domid);
+        return -EEXIST;
+    }
+
+    if ( !di->override_uuid )
+    {
+        snprintf(path, HYPFS_MAX_PATH, "/builder/%d/uuid", di->domid);
+        di->uuid = xenhypfs_read(hdl, path);
+    }
+
+    snprintf(path, HYPFS_MAX_PATH, "/builder/%d/ncpus", di->domid);
+    di->num_cpu = read_hypfs_uint32(hdl, path);
+    if ( errno != 0 )
+    {
+        fprintf(stderr, "error: unable to read number of cpus\n");
+        return -errno;
+    }
+
+    snprintf(path, HYPFS_MAX_PATH, "/builder/%d/mem_size", di->domid);
+    di->mem_info.target = read_hypfs_uint32(hdl, path);
+    if ( errno != 0 )
+    {
+        fprintf(stderr, "error: unable to read memory size\n");
+        return -errno;
+    }
+
+    snprintf(path, HYPFS_MAX_PATH, "/builder/%d/mem_max", di->domid);
+    di->mem_info.max = read_hypfs_uint32(hdl, path);
+    if ( errno != 0 )
+    {
+        fprintf(stderr, "error: unable to read max memory\n");
+        return -errno;
+    }
+
+    /* Xenstore */
+    snprintf(path, HYPFS_MAX_PATH, XS_PATH "/evtchn", di->domid);
+    di->xs_info.evtchn_port = read_hypfs_uint32(hdl, path);
+    if ( errno != 0 )
+    {
+        fprintf(stderr, "error: unable to read xenstore event channel port\n");
+        return -errno;
+    }
+
+    snprintf(path, HYPFS_MAX_PATH, XS_PATH "/mfn", di->domid);
+    di->xs_info.mfn = read_hypfs_uint64(hdl, path);
+    if ( errno != 0 )
+    {
+        fprintf(stderr, "error: unable to read xenstore page mfn\n");
+        return -errno;
+    }
+
+    /* Console */
+    if ( di->cons_info.enable )
+    {
+        snprintf(path, HYPFS_MAX_PATH, CONS_PATH "/evtchn", di->domid);
+        di->cons_info.evtchn_port = read_hypfs_uint32(hdl, path);
+        if ( errno != 0 )
+        {
+            fprintf(stderr, "error: unable to read xenstore event channel port\n");
+            return -errno;
+        }
+
+        snprintf(path, HYPFS_MAX_PATH, CONS_PATH "/mfn", di->domid);
+        di->cons_info.mfn = read_hypfs_uint64(hdl, path);
+        if ( errno != 0 )
+        {
+            fprintf(stderr, "error: unable to read xenstore page mfn\n");
+            return -errno;
+        }
+    }
+
+    return 0;
+}
+
diff --git a/tools/helpers/hypfs-helpers.h b/tools/helpers/hypfs-helpers.h
new file mode 100644
index 0000000000..2b2de5967f
--- /dev/null
+++ b/tools/helpers/hypfs-helpers.h
@@ -0,0 +1,9 @@
+#ifndef __HYPFS_HELPERS_H
+#define __HYPFS_HELPERS_H
+
+#include "late-init-pv.h"
+
+bool has_builder_hypfs(xenhypfs_handle *hdl, uint32_t domid);
+int read_hypfs_tree(xenhypfs_handle *hdl, struct domain_info *di);
+
+#endif
diff --git a/tools/helpers/late-init-pv.c b/tools/helpers/late-init-pv.c
new file mode 100644
index 0000000000..e1602be6d5
--- /dev/null
+++ b/tools/helpers/late-init-pv.c
@@ -0,0 +1,287 @@
+
+#include <errno.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xenhypfs.h>
+#include <xenstore.h>
+#include <xentoollog.h>
+#include <xen/io/xenbus.h>
+
+#include "hypfs-helpers.h"
+#include "late-init-pv.h"
+#include "xs-helpers.h"
+
+static struct option options[] = {
+    { "uuid", 1, NULL, 'u' },
+    { "console", 0, NULL, 'c' },
+    { "force", 0, NULL, 'f' },
+    { "domain", 1, NULL, 'd' },
+    { "verbose", 0, NULL, 'v' },
+    { NULL, 0, NULL, 0 }
+};
+
+static void usage(void)
+{
+    fprintf(stderr,
+"Usage:\n"
+"\n"
+"late-init-pv <options>\n"
+"\n"
+"where options may include:\n"
+"\n"
+"  --uuid <UUID string>     override the UUID to use for the domain\n"
+"  --console                configure the console\n"
+"  --force                  for @introduceDomain even if xenstore entries exist\n"
+"  --domain <domain id>     domain id of the domain to be initialized\n"
+"  -v[v[v]]                 verbosity constructing xenstore tree\n");
+}
+
+#define XS_DOM_PERM(x, d, k, v)                                             \
+    ret = do_xs_write_dom_with_perm(x, d, k, v, perms, num_perms);          \
+    if ( ret != 0 ) return ret                                              \
+
+#define XS_DIR_PERM(x, p, k, v)                                             \
+    ret = do_xs_write_dir_node_with_perm(x, p, k, v, perms, num_perms);     \
+    if ( ret != 0 ) return ret                                              \
+
+static int create_xs_entries(
+    struct xs_handle *xsh, uint16_t curr_domid, struct domain_info *di)
+{
+    char value[16];
+    struct xs_permissions perms[2] = {
+        {.id = curr_domid, .perms = XS_PERM_NONE},
+        {.id = di->domid, .perms = XS_PERM_READ},
+    };
+    uint32_t num_perms = (sizeof(perms) / sizeof((perms)[0]));
+    int ret = 0;
+
+    while ( do_xs_start_transaction(xsh) == 0 )
+    {
+        XS_DOM_PERM(xsh, di->domid, "", "");
+
+        snprintf(value, 16, "%d", di->domid);
+        XS_DOM_PERM(xsh, di->domid, "domid", value);
+
+        XS_DOM_PERM(xsh, di->domid, "memory", "");
+        snprintf(value, 16, "%d", di->mem_info.target);
+        XS_DOM_PERM(xsh, di->domid, "memory/target", value);
+
+        if ( di->mem_info.max )
+            snprintf(value, 16, "%d", di->mem_info.max);
+        else
+            snprintf(value, 16, "%d", di->mem_info.target);
+        XS_DOM_PERM(xsh, di->domid, "memory/static-max", value);
+
+        XS_DOM_PERM(xsh, di->domid, "store", "");
+        snprintf(value, 16, "%d", di->xs_info.evtchn_port);
+        XS_DOM_PERM(xsh, di->domid, "store/port", value);
+
+        snprintf(value, 16, "%ld", di->xs_info.mfn);
+        XS_DOM_PERM(xsh, di->domid, "store/ring-ref", value);
+
+        if ( di->cons_info.enable )
+        {
+            char be_path[64], fe_path[64];
+
+            snprintf(fe_path, 64, "/local/domain/%d/console", di->domid);
+            snprintf(be_path, 64, "/local/domain/%d/backend/console/%d/0",
+                     di->cons_info.be_domid, di->domid);
+
+            /* Backend entries */
+            XS_DIR_PERM(xsh, be_path, "", "");
+            snprintf(value, 16, "%d", di->domid);
+            XS_DIR_PERM(xsh, be_path, "frontend-id", value);
+            XS_DIR_PERM(xsh, be_path, "frontend", fe_path);
+            XS_DIR_PERM(xsh, be_path, "online", "1");
+            XS_DIR_PERM(xsh, be_path, "protocol", "vt100");
+
+            snprintf(value, 16, "%d", XenbusStateInitialising);
+            XS_DIR_PERM(xsh, be_path, "state", value);
+
+            /* Frontend entries */
+            XS_DOM_PERM(xsh, di->domid, "console", "");
+            snprintf(value, 16, "%d", di->cons_info.be_domid);
+            XS_DIR_PERM(xsh, fe_path, "backend", be_path);
+            XS_DIR_PERM(xsh, fe_path, "backend-id", value);
+            XS_DIR_PERM(xsh, fe_path, "limit", "1048576");
+            XS_DIR_PERM(xsh, fe_path, "type", "xenconsoled");
+            XS_DIR_PERM(xsh, fe_path, "output", "pty");
+            XS_DIR_PERM(xsh, fe_path, "tty", "");
+
+            snprintf(value, 16, "%d", di->cons_info.evtchn_port);
+            XS_DIR_PERM(xsh, fe_path, "port", value);
+
+            snprintf(value, 16, "%ld", di->cons_info.mfn);
+            XS_DIR_PERM(xsh, fe_path, "ring-ref", value);
+
+        }
+
+        ret = do_xs_end_transaction(xsh);
+        switch ( ret )
+        {
+        case 0:
+            break; /* proceed to loop break */
+        case -EAGAIN:
+            continue; /* try again */
+        default:
+            return ret; /* failed */
+        }
+
+        break;
+    }
+
+    return ret;
+}
+
+static bool init_domain(struct xs_handle *xsh, struct domain_info *di)
+{
+    xc_interface *xch = xc_interface_open(0, 0, 0);
+    xen_pfn_t con_mfn = 0L;
+    /*xc_dom_gnttab_seed will do nothing of front == back */
+    uint32_t con_domid = di->domid;
+    int ret;
+
+    /* console */
+    if ( di->cons_info.enable )
+    {
+        con_domid = di->cons_info.be_domid;
+        con_mfn = di->cons_info.mfn;
+    }
+
+    ret = xc_dom_gnttab_seed(xch, di->domid, di->is_hvm, con_mfn,
+            di->xs_info.mfn, con_domid, di->xs_info.be_domid);
+    if ( ret != 0 )
+    {
+        fprintf(stderr, "error (%d) setting up grant tables for dom%d\n",
+                ret, di->domid);
+        xc_interface_close(xch);
+        return false;
+    }
+
+    xc_interface_close(xch);
+
+    return xs_introduce_domain(xsh, di->domid, di->xs_info.mfn,
+                               di->xs_info.evtchn_port);
+}
+
+int main(int argc, char** argv)
+{
+    int opt, rv;
+    bool force = false;
+    struct xs_handle *xsh = NULL;
+    xenhypfs_handle *xhfs = NULL;
+    xentoollog_level minmsglevel = XTL_PROGRESS;
+    xentoollog_logger *logger = NULL;
+    struct domain_info di = { .domid = ~0 };
+
+    while ( (opt = getopt_long(argc, argv, "cfd:v", options, NULL)) != -1 )
+    {
+        switch ( opt )
+        {
+        case 'u':
+            di.override_uuid = true;
+            di.uuid = optarg;
+            break;
+        case 'c':
+            di.cons_info.enable = true;
+            break;
+        case 'f':
+            force = true;
+            break;
+        case 'd':
+            di.domid = strtol(optarg, NULL, 10);
+            break;
+        case 'v':
+            if ( minmsglevel )
+                minmsglevel--;
+            break;
+        default:
+            usage();
+            return 2;
+        }
+    }
+
+    if ( optind != argc || di.domid == ~0 )
+    {
+        usage();
+        return 1;
+    }
+
+    logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
+                                                               minmsglevel, 0);
+
+    xhfs = xenhypfs_open(logger, 0);
+    if ( !xhfs )
+    {
+        fprintf(stderr, "error: unable to acces xen hypfs\n");
+        rv = 2;
+        goto out;
+    }
+
+    if ( !has_builder_hypfs(xhfs, di.domid) )
+    {
+        fprintf(stderr, "error: hypfs entry for domain %d not present\n",
+                di.domid);
+        rv = 3;
+        goto out;
+    }
+
+    if ( read_hypfs_tree(xhfs, &di) != 0 )
+    {
+        fprintf(stderr, "error: unable to parse hypfs for domain %d\n",
+                di.domid);
+        rv = 4;
+        goto out;
+    }
+
+    xsh = xs_open(0);
+    if ( xsh == NULL )
+    {
+        fprintf(stderr, "error: unable to connect to xenstored\n");
+        rv = 5;
+        goto out;
+    }
+
+    if ( xs_is_domain_introduced(xsh, di.domid) )
+    {
+        if ( !force )
+        {
+            fprintf(stderr, "error: domain %d already introduced\n", di.domid);
+            rv = 6;
+            goto out;
+        }
+        else
+        {
+            fprintf(stderr, "warning: re-introducting domain %d\n", di.domid);
+        }
+    }
+
+    /* TODO: hardcdoding local domain to 0 for testing purposes */
+    if ( (rv = create_xs_entries(xsh, 0, &di)) != 0 )
+    {
+        fprintf(stderr, "error(%d): unable create xenstore entries\n", rv);
+        rv = 7;
+        goto out;
+    }
+
+    init_domain(xsh, &di);
+    rv = 0;
+
+out:
+    if ( xsh )
+        xs_close(xsh);
+
+    if ( xhfs )
+        xenhypfs_close(xhfs);
+
+    if ( logger )
+        xtl_logger_destroy(logger);
+
+    return rv;
+}
diff --git a/tools/helpers/late-init-pv.h b/tools/helpers/late-init-pv.h
new file mode 100644
index 0000000000..5d66e7870f
--- /dev/null
+++ b/tools/helpers/late-init-pv.h
@@ -0,0 +1,29 @@
+#ifndef __LATE_INIT_PV_H
+#define __LATE_INIT_PV_H
+
+struct domain_info {
+    uint16_t domid;
+    bool is_hvm;
+    bool override_uuid;
+    const char *uuid;
+    uint32_t num_cpu;
+    uint32_t max_cpu;
+    struct {
+        uint32_t target;
+        uint32_t max;
+        uint32_t video;
+    } mem_info;
+    struct {
+        uint16_t be_domid;
+        uint32_t evtchn_port;
+        uint64_t mfn;
+    } xs_info;
+    struct {
+        bool enable;
+        uint16_t be_domid;
+        uint32_t evtchn_port;
+        uint64_t mfn;
+    } cons_info;
+};
+
+#endif
diff --git a/tools/helpers/xs-helpers.c b/tools/helpers/xs-helpers.c
new file mode 100644
index 0000000000..a4d2bebbbd
--- /dev/null
+++ b/tools/helpers/xs-helpers.c
@@ -0,0 +1,117 @@
+
+#include <err.h>
+#include <stdio.h>
+#include <string.h>
+#include <xenstore.h>
+
+#define MAX_XS_PAATH 100
+
+static xs_transaction_t t_id = XBT_NULL;
+
+int do_xs_start_transaction(struct xs_handle *xsh)
+{
+    t_id = xs_transaction_start(xsh);
+    if (t_id == XBT_NULL)
+        return -errno;
+
+    return 0;
+}
+
+int do_xs_end_transaction(struct xs_handle *xsh)
+{
+    if ( t_id == XBT_NULL )
+        return -EINVAL;
+
+    if (!xs_transaction_end(xsh, t_id, false))
+        return -errno;
+
+    return 0;
+}
+
+int do_xs_write(struct xs_handle *xsh, char *path, char *val)
+{
+    if ( !xs_write(xsh, t_id, path, val, strlen(val)) )
+    {
+        fprintf(stderr, "failed write: %s\n", path);
+        return -errno;
+    }
+
+    return 0;
+}
+
+int do_xs_perms(
+    struct xs_handle *xsh, char *path, struct xs_permissions *perms,
+    uint32_t num_perms)
+{
+    if ( !xs_set_permissions(xsh, t_id, path, perms, num_perms) )
+    {
+        fprintf(stderr, "failed set perm: %s\n", path);
+        return -errno;
+    }
+
+    return 0;
+}
+
+int do_xs_write_dir_node_with_perm(
+    struct xs_handle *xsh, char *dir, char *node, char *val,
+    struct xs_permissions *perms, uint32_t num_perms)
+{
+    char full_path[MAX_XS_PAATH];
+    int ret = 0;
+
+    /*
+     * mainly for creating a value holding node, but
+     * also support creating directory nodes.
+     */
+    if ( strlen(node) != 0 )
+        snprintf(full_path, MAX_XS_PAATH, "%s/%s", dir, node);
+    else
+        snprintf(full_path, MAX_XS_PAATH, "%s", dir);
+
+    ret = do_xs_write(xsh, full_path, val);
+    if ( ret < 0 )
+        return ret;
+
+    if ( perms != NULL && num_perms > 0 )
+        ret = do_xs_perms(xsh, full_path, perms, num_perms);
+
+    return ret;
+}
+
+int do_xs_write_dir_node(
+    struct xs_handle *xsh, char *dir, char *node, char *val)
+{
+    return do_xs_write_dir_node_with_perm(xsh, dir, node, val, NULL, 0);
+}
+
+int do_xs_write_dom_with_perm(
+    struct xs_handle *xsh, uint32_t domid, char *path, char *val,
+    struct xs_permissions *perms, uint32_t num_perms)
+{
+    char full_path[MAX_XS_PAATH];
+    int ret = 0;
+
+    /*
+     * mainly for creating a value holding node, but
+     * also support creating directory nodes.
+     */
+    if ( strlen(path) != 0 )
+        snprintf(full_path, MAX_XS_PAATH, "/local/domain/%d/%s", domid, path);
+    else
+        snprintf(full_path, MAX_XS_PAATH, "/local/domain/%d", domid);
+
+    ret = do_xs_write(xsh, full_path, val);
+    if ( ret < 0 )
+        return ret;
+
+    if ( perms != NULL && num_perms > 0 )
+        ret = do_xs_perms(xsh, full_path, perms, num_perms);
+
+    return ret;
+}
+
+int do_xs_write_dom(
+    struct xs_handle *xsh, uint32_t domid, char *path, char *val)
+{
+    return do_xs_write_dom_with_perm(xsh, domid, path, val, NULL, 0);
+}
diff --git a/tools/helpers/xs-helpers.h b/tools/helpers/xs-helpers.h
new file mode 100644
index 0000000000..f57fcab843
--- /dev/null
+++ b/tools/helpers/xs-helpers.h
@@ -0,0 +1,27 @@
+#ifndef __XS_HELPERS_H
+#define __XS_HELPERS_H
+
+#include <xenstore.h>
+
+int do_xs_start_transaction(struct xs_handle *xsh);
+int do_xs_end_transaction(struct xs_handle *xsh);
+
+int do_xs_write(struct xs_handle *xsh, char *path, char *val);
+int do_xs_perms(
+    struct xs_handle *xsh, char *path, struct xs_permissions *perms,
+    uint32_t num_perms);
+
+int do_xs_write_dir_node_with_perm(
+    struct xs_handle *xsh, char *dir, char *node, char *val,
+    struct xs_permissions *perms, uint32_t num_perms);
+int do_xs_write_dir_node(
+    struct xs_handle *xsh, char *dir, char *node, char *val);
+
+int do_xs_write_dom_with_perm(
+    struct xs_handle *xsh, uint32_t domid, char *path, char *val,
+    struct xs_permissions *perms, uint32_t num_perms);
+int do_xs_write_dom(
+    struct xs_handle *xsh, uint32_t domid, char *path, char *val);
+
+#endif
+
-- 
2.20.1


