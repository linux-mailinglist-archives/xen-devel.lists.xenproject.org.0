Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43921D90DC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZ6-0004pB-8l; Tue, 19 May 2020 07:21:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawZ4-0004od-Dw
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:26 +0000
X-Inumbo-ID: 5101dcd6-99a1-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5101dcd6-99a1-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 07:21:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4061DB211;
 Tue, 19 May 2020 07:21:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 06/12] tools: add xenfs tool
Date: Tue, 19 May 2020 09:21:00 +0200
Message-Id: <20200519072106.26894-7-jgross@suse.com>
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

Add the xenfs tool for accessing the hypervisor filesystem.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
V1:
- rename to xenhypfs
- don't use "--" for subcommands
- add write support

V2:
- escape non-printable characters per default with cat subcommand
  (Ian Jackson)
- add -b option to cat subcommand (Ian Jackson)
- add man page

V3:
- adapt to new hypfs interface

V7:
- added missing bool for ls output

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore              |   1 +
 docs/man/xenhypfs.1.pod |  61 +++++++++++++
 tools/misc/Makefile     |   6 ++
 tools/misc/xenhypfs.c   | 192 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 docs/man/xenhypfs.1.pod
 create mode 100644 tools/misc/xenhypfs.c

diff --git a/.gitignore b/.gitignore
index 7bd292f64d..6171b3b43f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -368,6 +368,7 @@ tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
+tools/misc/xenhypfs
 tools/misc/xenwatchdogd
 tools/misc/xen-hvmcrash
 tools/misc/xen-lowmemd
diff --git a/docs/man/xenhypfs.1.pod b/docs/man/xenhypfs.1.pod
new file mode 100644
index 0000000000..37aa488fcc
--- /dev/null
+++ b/docs/man/xenhypfs.1.pod
@@ -0,0 +1,61 @@
+=head1 NAME
+
+xenhypfs - Xen tool to access Xen hypervisor file system
+
+=head1 SYNOPSIS
+
+B<xenhypfs> I<subcommand> [I<options>] [I<args>]
+
+=head1 DESCRIPTION
+
+The B<xenhypfs> program is used to access the Xen hypervisor file system.
+It can be used to show the available entries, to show their contents and
+(if allowed) to modify their contents.
+
+=head1 SUBCOMMANDS
+
+=over 4
+
+=item B<ls> I<path>
+
+List the available entries below I<path>.
+
+=item B<cat> [I<-b>] I<path>
+
+Show the contents of the entry specified by I<path>. Non-printable characters
+other than white space characters (like tab, new line) will be shown as
+B<\xnn> (B<nn> being a two digit hex number) unless the option B<-b> is
+specified.
+
+=item B<write> I<path> I<value>
+
+Set the contents of the entry specified by I<path> to I<value>.
+
+=item B<tree>
+
+Show all the entries of the file system as a tree.
+
+=back
+
+=head1 RETURN CODES
+
+=over 4
+
+=item B<0>
+
+Success
+
+=item B<1>
+
+Invalid usage (e.g. unknown subcommand, unknown option, missing parameter).
+
+=item B<2>
+
+Entry not found while traversing the tree.
+
+=item B<3>
+
+Access right violation.
+
+=back
+
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 63947bfadc..9fdb13597f 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -24,6 +24,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
 INSTALL_SBIN                   += xencov
+INSTALL_SBIN                   += xenhypfs
 INSTALL_SBIN                   += xenlockprof
 INSTALL_SBIN                   += xenperf
 INSTALL_SBIN                   += xenpm
@@ -86,6 +87,9 @@ xenperf: xenperf.o
 xenpm: xenpm.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xenhypfs: xenhypfs.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenhypfs) $(APPEND_LDFLAGS)
+
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
@@ -94,6 +98,8 @@ xen-hptool.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-hptool: xen-hptool.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
+xenhypfs.o: CFLAGS += $(CFLAGS_libxenhypfs)
+
 # xen-mfndump incorrectly uses libxc internals
 xen-mfndump.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-mfndump: xen-mfndump.o
diff --git a/tools/misc/xenhypfs.c b/tools/misc/xenhypfs.c
new file mode 100644
index 0000000000..158b901f42
--- /dev/null
+++ b/tools/misc/xenhypfs.c
@@ -0,0 +1,192 @@
+#define _GNU_SOURCE
+#include <ctype.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <xenhypfs.h>
+
+static struct xenhypfs_handle *hdl;
+
+static int usage(void)
+{
+    fprintf(stderr, "usage: xenhypfs ls <path>\n");
+    fprintf(stderr, "       xenhypfs cat [-b] <path>\n");
+    fprintf(stderr, "       xenhypfs write <path> <val>\n");
+    fprintf(stderr, "       xenhypfs tree\n");
+
+    return 1;
+}
+
+static void xenhypfs_print_escaped(char *string)
+{
+    char *c;
+
+    for (c = string; *c; c++) {
+        if (isgraph(*c) || isspace(*c))
+            printf("%c", *c);
+        else
+            printf("\\x%02x", *c);
+    }
+    printf("\n");
+}
+
+static int xenhypfs_cat(int argc, char *argv[])
+{
+    int ret = 0;
+    char *result;
+    char *path;
+    bool bin = false;
+
+    switch (argc) {
+    case 1:
+        path = argv[0];
+        break;
+
+    case 2:
+        if (strcmp(argv[0], "-b"))
+            return usage();
+        bin = true;
+        path = argv[1];
+        break;
+
+    default:
+        return usage();
+    }
+
+    result = xenhypfs_read(hdl, path);
+    if (!result) {
+        perror("could not read");
+        ret = 3;
+    } else {
+        if (!bin)
+            printf("%s\n", result);
+        else
+            xenhypfs_print_escaped(result);
+        free(result);
+    }
+
+    return ret;
+}
+
+static int xenhypfs_wr(char *path, char *val)
+{
+    int ret;
+
+    ret = xenhypfs_write(hdl, path, val);
+    if (ret) {
+        perror("could not write");
+        ret = 3;
+    }
+
+    return ret;
+}
+
+static char *xenhypfs_type(struct xenhypfs_dirent *ent)
+{
+    char *res;
+
+    switch (ent->type) {
+    case xenhypfs_type_dir:
+        res = "<dir>   ";
+        break;
+    case xenhypfs_type_blob:
+        res = "<blob>  ";
+        break;
+    case xenhypfs_type_string:
+        res = "<string>";
+        break;
+    case xenhypfs_type_uint:
+        res = "<uint>  ";
+        break;
+    case xenhypfs_type_int:
+        res = "<int>   ";
+        break;
+    case xenhypfs_type_bool:
+        res = "<bool>  ";
+        break;
+    default:
+        res = "<\?\?\?>   ";
+        break;
+    }
+
+    return res;
+}
+
+static int xenhypfs_ls(char *path)
+{
+    struct xenhypfs_dirent *ent;
+    unsigned int n, i;
+    int ret = 0;
+
+    ent = xenhypfs_readdir(hdl, path, &n);
+    if (!ent) {
+        perror("could not read dir");
+        ret = 3;
+    } else {
+        for (i = 0; i < n; i++)
+            printf("%s r%c %s\n", xenhypfs_type(ent + i),
+                   ent[i].is_writable ? 'w' : '-', ent[i].name);
+
+        free(ent);
+    }
+
+    return ret;
+}
+
+static int xenhypfs_tree_sub(char *path, unsigned int depth)
+{
+    struct xenhypfs_dirent *ent;
+    unsigned int n, i;
+    int ret = 0;
+    char *p;
+
+    ent = xenhypfs_readdir(hdl, path, &n);
+    if (!ent)
+        return 2;
+
+    for (i = 0; i < n; i++) {
+        printf("%*s%s%s\n", depth * 2, "", ent[i].name,
+               ent[i].type == xenhypfs_type_dir ? "/" : "");
+        if (ent[i].type == xenhypfs_type_dir) {
+            asprintf(&p, "%s%s%s", path, (depth == 1) ? "" : "/", ent[i].name);
+            if (xenhypfs_tree_sub(p, depth + 1))
+                ret = 2;
+        }
+    }
+
+    free(ent);
+
+    return ret;
+}
+
+static int xenhypfs_tree(void)
+{
+    printf("/\n");
+
+    return xenhypfs_tree_sub("/", 1);
+}
+
+int main(int argc, char *argv[])
+{
+    int ret;
+
+    hdl = xenhypfs_open(NULL, 0);
+
+    if (!hdl) {
+        fprintf(stderr, "Could not open libxenhypfs\n");
+        ret = 2;
+    } else if (argc >= 3 && !strcmp(argv[1], "cat"))
+        ret = xenhypfs_cat(argc - 2, argv + 2);
+    else if (argc == 3 && !strcmp(argv[1], "ls"))
+        ret = xenhypfs_ls(argv[2]);
+    else if (argc == 4 && !strcmp(argv[1], "write"))
+        ret = xenhypfs_wr(argv[2], argv[3]);
+    else if (argc == 2 && !strcmp(argv[1], "tree"))
+        ret = xenhypfs_tree();
+    else
+        ret = usage();
+
+    xenhypfs_close(hdl);
+
+    return ret;
+}
-- 
2.26.1


