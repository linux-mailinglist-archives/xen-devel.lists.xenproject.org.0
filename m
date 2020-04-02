Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40A19C646
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23D-0003pF-8q; Thu, 02 Apr 2020 15:46:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23B-0003oQ-H5
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:37 +0000
X-Inumbo-ID: 19ad44a4-74f9-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19ad44a4-74f9-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 15:46:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ECF50AE41;
 Thu,  2 Apr 2020 15:46:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 04/12] xen: add basic hypervisor filesystem support
Date: Thu,  2 Apr 2020 17:46:08 +0200
Message-Id: <20200402154616.16927-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200402154616.16927-1-jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add the infrastructure for the hypervisor filesystem.

This includes the hypercall interface and the base functions for
entry creation, deletion and modification.

In order not to have to repeat the same pattern multiple times in case
adding a new node should BUG_ON() failure, the helpers for adding a
node (hypfs_add_dir() and hypfs_add_leaf()) get a nofault parameter
causing the BUG() in case of a failure.

When supporting writable leafs the entry's write pointer will need to
be set to the function performing the write to the variable holding the
content. In case there are no special constraints this will be
hypfs_write_bool() for type XEN_HYPFS_TYPE_BOOL and hypfs_write_leaf()
for the other entry types.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V1:
- rename files from filesystem.* to hypfs.*
- add dummy write entry support
- rename hypercall filesystem_op to hypfs_op
- add support for unsigned integer entries

V2:
- test new entry name to be valid

V3:
- major rework, especially by supporting binary contents of entries
- addressed all comments

V4:
- sort #includes alphabetically (Wei Liu)
- add public interface structures to xlat.lst (Jan Beulich)
- let DIRENTRY_SIZE() add 1 for trailing nul byte (Jan Beulich)
- remove hypfs_add_entry() (Jan Beulich)
- len -> ulen (Jan Beulich)
- switch sequence of tests in hypfs_get_entry_rel() (Jan Beulich)
- add const qualifier (Jan Beulich)
- return -ENOBUFS if only direntry but no entry contents are returned
  (Jan Beulich)
- use xmalloc() instead of xzalloc() (Jan Beulich)
- better error handling in hypfs_write_leaf() (Jan Beulich)
- return -EOPNOTSUPP for unknown sub-command (Jan Beulich)
- use plain integers for enum-like constants in public interface
  (Jan Beulich)
- rename XEN_HYPFS_OP_read_contents to XEN_HYPFS_OP_read (Jan Beulich)
- add some comments in include/public/hypfs.h (Jan Beulich)
- use const_char for user parameter path (Jan Beulich)
- add helpers for XEN_HYPFS_TYPE_BOOL and XEN_HYPFS_TYPE_INT entry
  definitions (Jan Beulich)
- make statically defined entries __read_mostly (Jan Beulich)

V5:
- switch to xsm for privilege check

V6:
- use memchr() for testing correct string length (Jan Beulich)
- reject writing to non-string leafs with wrong length (Jan Beulich)
- only support bools of natural size (Julien Grall)
- adjust blank padding in header (Jan Beulich)
- adjust comments in public header (Jan Beulich)
- rename hypfs_string_set() and add comment (Jan Beulich)
- add common HYPFS_INIT helper macro (Jan Beulich)
- really check structures added to xlat.lst (Jan Beulich)
- add missing xsm parts (Jan Beulich)

V7:
- simplify compat check (Jan Beulich)
- add max write size (Jan Beulich)
- better length testing of written string (Jan Beulich)
---
 tools/flask/policy/modules/dom0.te  |   2 +-
 xen/arch/arm/traps.c                |   1 +
 xen/arch/x86/hvm/hypercall.c        |   1 +
 xen/arch/x86/hypercall.c            |   1 +
 xen/arch/x86/pv/hypercall.c         |   1 +
 xen/common/Makefile                 |   1 +
 xen/common/hypfs.c                  | 350 ++++++++++++++++++++++++++++++++++++
 xen/include/Makefile                |   1 +
 xen/include/public/hypfs.h          | 127 +++++++++++++
 xen/include/public/xen.h            |   1 +
 xen/include/xen/hypercall.h         |   8 +
 xen/include/xen/hypfs.h             | 116 ++++++++++++
 xen/include/xlat.lst                |   2 +
 xen/include/xsm/dummy.h             |   6 +
 xen/include/xsm/xsm.h               |   6 +
 xen/xsm/dummy.c                     |   1 +
 xen/xsm/flask/hooks.c               |   6 +
 xen/xsm/flask/policy/access_vectors |   2 +
 18 files changed, 632 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/hypfs.c
 create mode 100644 xen/include/public/hypfs.h
 create mode 100644 xen/include/xen/hypfs.h

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 272f6a4f75..20925e38a2 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -11,7 +11,7 @@ allow dom0_t xen_t:xen {
 	mtrr_del mtrr_read microcode physinfo quirk writeconsole readapic
 	writeapic privprofile nonprivprofile kexec firmware sleep frequency
 	getidle debug getcpuinfo heap pm_op mca_op lockprof cpupool_op
-	getscheduler setscheduler
+	getscheduler setscheduler hypfs_op
 };
 allow dom0_t xen_t:xen2 {
 	resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 30c4c1830b..efc700b50b 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1381,6 +1381,7 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #ifdef CONFIG_ARGO
     HYPERCALL(argo_op, 5),
 #endif
+    HYPERCALL(hypfs_op, 5),
 };
 
 #ifndef NDEBUG
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index cedc7f2ac5..5b15c3a155 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -148,6 +148,7 @@ static const hypercall_table_t hvm_hypercall_table[] = {
 #endif
     HYPERCALL(xenpmu_op),
     COMPAT_CALL(dm_op),
+    HYPERCALL(hypfs_op),
     HYPERCALL(arch_1)
 };
 
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 7f299d45c6..05a3f5e25b 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -73,6 +73,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(hvm_op, 2),
     ARGS(dm_op, 3),
 #endif
+    ARGS(hypfs_op, 5),
     ARGS(mca, 1),
     ARGS(arch_1, 1),
 };
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 17ddf9ea1f..83907d4f00 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -85,6 +85,7 @@ const hypercall_table_t pv_hypercall_table[] = {
     HYPERCALL(hvm_op),
     COMPAT_CALL(dm_op),
 #endif
+    HYPERCALL(hypfs_op),
     HYPERCALL(mca),
     HYPERCALL(arch_1),
 };
diff --git a/xen/common/Makefile b/xen/common/Makefile
index e8cde65370..022e5f7ca3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -10,6 +10,7 @@ obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
+obj-y += hypfs.o
 obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
new file mode 100644
index 0000000000..986b829934
--- /dev/null
+++ b/xen/common/hypfs.c
@@ -0,0 +1,350 @@
+/******************************************************************************
+ *
+ * hypfs.c
+ *
+ * Simple sysfs-like file system for the hypervisor.
+ */
+
+#include <xen/err.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/hypfs.h>
+#include <xen/lib.h>
+#include <xen/rwlock.h>
+#include <public/hypfs.h>
+
+#ifdef CONFIG_COMPAT
+#include <compat/hypfs.h>
+CHECK_hypfs_dirlistentry;
+#endif
+
+#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
+#define DIRENTRY_SIZE(name_len) \
+    (DIRENTRY_NAME_OFF +        \
+     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
+
+static DEFINE_RWLOCK(hypfs_lock);
+
+HYPFS_DIR_INIT(hypfs_root, "");
+
+static int add_entry(struct hypfs_entry_dir *parent, struct hypfs_entry *new)
+{
+    int ret = -ENOENT;
+    struct hypfs_entry *e;
+
+    write_lock(&hypfs_lock);
+
+    list_for_each_entry ( e, &parent->dirlist, list )
+    {
+        int cmp = strcmp(e->name, new->name);
+
+        if ( cmp > 0 )
+        {
+            ret = 0;
+            list_add_tail(&new->list, &e->list);
+            break;
+        }
+        if ( cmp == 0 )
+        {
+            ret = -EEXIST;
+            break;
+        }
+    }
+
+    if ( ret == -ENOENT )
+    {
+        ret = 0;
+        list_add_tail(&new->list, &parent->dirlist);
+    }
+
+    if ( !ret )
+    {
+        unsigned int sz = strlen(new->name);
+
+        parent->e.size += DIRENTRY_SIZE(sz);
+    }
+
+    write_unlock(&hypfs_lock);
+
+    return ret;
+}
+
+int hypfs_add_dir(struct hypfs_entry_dir *parent,
+                  struct hypfs_entry_dir *dir, bool nofault)
+{
+    int ret;
+
+    ret = add_entry(parent, &dir->e);
+    BUG_ON(nofault && ret);
+
+    return ret;
+}
+
+int hypfs_add_leaf(struct hypfs_entry_dir *parent,
+                   struct hypfs_entry_leaf *leaf, bool nofault)
+{
+    int ret;
+
+    if ( !leaf->content )
+        ret = -EINVAL;
+    else
+        ret = add_entry(parent, &leaf->e);
+    BUG_ON(nofault && ret);
+
+    return ret;
+}
+
+static int hypfs_get_path_user(char *buf,
+                               XEN_GUEST_HANDLE_PARAM(const_char) uaddr,
+                               unsigned long ulen)
+{
+    if ( ulen > XEN_HYPFS_MAX_PATHLEN )
+        return -EINVAL;
+
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        return -EFAULT;
+
+    if ( memchr(buf, 0, ulen) != buf + ulen - 1 )
+        return -EINVAL;
+
+    return 0;
+}
+
+static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
+                                               const char *path)
+{
+    const char *end;
+    struct hypfs_entry *entry;
+    unsigned int name_len;
+
+    if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
+        return NULL;
+
+    if ( !*path )
+        return &dir->e;
+
+    end = strchr(path, '/');
+    if ( !end )
+        end = strchr(path, '\0');
+    name_len = end - path;
+
+    list_for_each_entry ( entry, &dir->dirlist, list )
+    {
+        int cmp = strncmp(path, entry->name, name_len);
+        struct hypfs_entry_dir *d = container_of(entry,
+                                                 struct hypfs_entry_dir, e);
+
+        if ( cmp < 0 )
+            return NULL;
+        if ( !cmp && strlen(entry->name) == name_len )
+            return *end ? hypfs_get_entry_rel(d, end + 1) : entry;
+    }
+
+    return NULL;
+}
+
+struct hypfs_entry *hypfs_get_entry(const char *path)
+{
+    if ( path[0] != '/' )
+        return NULL;
+
+    return hypfs_get_entry_rel(&hypfs_root, path + 1);
+}
+
+int hypfs_read_dir(const struct hypfs_entry *entry,
+                   XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_entry_dir *d;
+    const struct hypfs_entry *e;
+    unsigned int size = entry->size;
+
+    d = container_of(entry, const struct hypfs_entry_dir, e);
+
+    list_for_each_entry ( e, &d->dirlist, list )
+    {
+        struct xen_hypfs_dirlistentry direntry;
+        unsigned int e_namelen = strlen(e->name);
+        unsigned int e_len = DIRENTRY_SIZE(e_namelen);
+
+        direntry.e.pad = 0;
+        direntry.e.type = e->type;
+        direntry.e.encoding = e->encoding;
+        direntry.e.content_len = e->size;
+        direntry.e.max_write_len = e->max_size;
+        direntry.off_next = list_is_last(&e->list, &d->dirlist) ? 0 : e_len;
+        if ( copy_to_guest(uaddr, &direntry, 1) )
+            return -EFAULT;
+
+        if ( copy_to_guest_offset(uaddr, DIRENTRY_NAME_OFF,
+                                  e->name, e_namelen + 1) )
+            return -EFAULT;
+
+        guest_handle_add_offset(uaddr, e_len);
+
+        ASSERT(e_len <= size);
+        size -= e_len;
+    }
+
+    return 0;
+}
+
+int hypfs_read_leaf(const struct hypfs_entry *entry,
+                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_entry_leaf *l;
+
+    l = container_of(entry, const struct hypfs_entry_leaf, e);
+
+    return copy_to_guest(uaddr, l->content, entry->size) ? -EFAULT: 0;
+}
+
+static int hypfs_read(const struct hypfs_entry *entry,
+                      XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+{
+    struct xen_hypfs_direntry e;
+    long ret = -EINVAL;
+
+    if ( ulen < sizeof(e) )
+        goto out;
+
+    e.pad = 0;
+    e.type = entry->type;
+    e.encoding = entry->encoding;
+    e.content_len = entry->size;
+    e.max_write_len = entry->max_size;
+
+    ret = -EFAULT;
+    if ( copy_to_guest(uaddr, &e, 1) )
+        goto out;
+
+    ret = -ENOBUFS;
+    if ( ulen < entry->size + sizeof(e) )
+        goto out;
+
+    guest_handle_add_offset(uaddr, sizeof(e));
+
+    ret = entry->read(entry, uaddr);
+
+ out:
+    return ret;
+}
+
+int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+{
+    char *buf;
+    int ret;
+
+    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
+         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
+        return -EDOM;
+
+    buf = xmalloc_array(char, ulen);
+    if ( !buf )
+        return -ENOMEM;
+
+    ret = -EFAULT;
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        goto out;
+
+    ret = -EINVAL;
+    if ( leaf->e.type == XEN_HYPFS_TYPE_STRING &&
+         memchr(buf, 0, ulen) != (buf + ulen - 1) )
+        goto out;
+
+    ret = 0;
+    memcpy(leaf->write_ptr, buf, ulen);
+    leaf->e.size = ulen;
+
+ out:
+    xfree(buf);
+    return ret;
+}
+
+int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+{
+    bool buf;
+
+    ASSERT(leaf->e.type == XEN_HYPFS_TYPE_BOOL && leaf->e.size == sizeof(bool));
+
+    if ( ulen != leaf->e.max_size )
+        return -EDOM;
+
+    if ( copy_from_guest(&buf, uaddr, ulen) )
+        return -EFAULT;
+
+    *(bool *)leaf->write_ptr = buf;
+
+    return 0;
+}
+
+static int hypfs_write(struct hypfs_entry *entry,
+                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
+{
+    struct hypfs_entry_leaf *l;
+
+    if ( !entry->write )
+        return -EACCES;
+
+    if ( ulen > entry->max_size )
+        return -ENOSPC;
+
+    l = container_of(entry, struct hypfs_entry_leaf, e);
+
+    return entry->write(l, uaddr, ulen);
+}
+
+long do_hypfs_op(unsigned int cmd,
+                 XEN_GUEST_HANDLE_PARAM(const_char) arg1, unsigned long arg2,
+                 XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long arg4)
+{
+    int ret;
+    struct hypfs_entry *entry;
+    static char path[XEN_HYPFS_MAX_PATHLEN];
+
+    if ( xsm_hypfs_op(XSM_PRIV) )
+        return -EPERM;
+
+    if ( cmd == XEN_HYPFS_OP_get_version )
+        return XEN_HYPFS_VERSION;
+
+    if ( cmd == XEN_HYPFS_OP_write_contents )
+        write_lock(&hypfs_lock);
+    else
+        read_lock(&hypfs_lock);
+
+    ret = hypfs_get_path_user(path, arg1, arg2);
+    if ( ret )
+        goto out;
+
+    entry = hypfs_get_entry(path);
+    if ( !entry )
+    {
+        ret = -ENOENT;
+        goto out;
+    }
+
+    switch ( cmd )
+    {
+    case XEN_HYPFS_OP_read:
+        ret = hypfs_read(entry, arg3, arg4);
+        break;
+
+    case XEN_HYPFS_OP_write_contents:
+        ret = hypfs_write(entry, arg3, arg4);
+        break;
+
+    default:
+        ret = -EOPNOTSUPP;
+        break;
+    }
+
+ out:
+    if ( cmd == XEN_HYPFS_OP_write_contents )
+        write_unlock(&hypfs_lock);
+    else
+        read_unlock(&hypfs_lock);
+
+    return ret;
+}
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 433bad9055..8b3d339a32 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -9,6 +9,7 @@ headers-y := \
     compat/event_channel.h \
     compat/features.h \
     compat/grant_table.h \
+    compat/hypfs.h \
     compat/kexec.h \
     compat/memory.h \
     compat/nmi.h \
diff --git a/xen/include/public/hypfs.h b/xen/include/public/hypfs.h
new file mode 100644
index 0000000000..f1c1b3e935
--- /dev/null
+++ b/xen/include/public/hypfs.h
@@ -0,0 +1,127 @@
+/******************************************************************************
+ * Xen Hypervisor Filesystem
+ *
+ * Copyright (c) 2019, SUSE Software Solutions Germany GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __XEN_PUBLIC_HYPFS_H__
+#define __XEN_PUBLIC_HYPFS_H__
+
+#include "xen.h"
+
+/*
+ * Definitions for the __HYPERVISOR_hypfs_op hypercall.
+ */
+
+/* Highest version number of the hypfs interface currently defined. */
+#define XEN_HYPFS_VERSION      1
+
+/* Maximum length of a path in the filesystem. */
+#define XEN_HYPFS_MAX_PATHLEN  1024
+
+struct xen_hypfs_direntry {
+    uint8_t type;
+#define XEN_HYPFS_TYPE_DIR     0
+#define XEN_HYPFS_TYPE_BLOB    1
+#define XEN_HYPFS_TYPE_STRING  2
+#define XEN_HYPFS_TYPE_UINT    3
+#define XEN_HYPFS_TYPE_INT     4
+#define XEN_HYPFS_TYPE_BOOL    5
+    uint8_t encoding;
+#define XEN_HYPFS_ENC_PLAIN    0
+#define XEN_HYPFS_ENC_GZIP     1
+    uint16_t pad;              /* Returned as 0. */
+    uint32_t content_len;      /* Current length of data. */
+    uint32_t max_write_len;    /* Max. length for writes (0 if read-only). */
+};
+
+struct xen_hypfs_dirlistentry {
+    struct xen_hypfs_direntry e;
+    /* Offset in bytes to next entry (0 == this is the last entry). */
+    uint16_t off_next;
+    /* Zero terminated entry name, possibly with some padding for alignment. */
+    char name[XEN_FLEX_ARRAY_DIM];
+};
+
+/*
+ * Hypercall operations.
+ */
+
+/*
+ * XEN_HYPFS_OP_get_version
+ *
+ * Read highest interface version supported by the hypervisor.
+ *
+ * Possible return values:
+ * >0: highest supported interface version
+ * <0: negative Xen errno value
+ */
+#define XEN_HYPFS_OP_get_version     0
+
+/*
+ * XEN_HYPFS_OP_read
+ *
+ * Read a filesystem entry.
+ *
+ * Returns the direntry and contents of an entry in the buffer supplied by the
+ * caller (struct xen_hypfs_direntry with the contents following directly
+ * after it).
+ * The data buffer must be at least the size of the direntry returned. If the
+ * data buffer was not large enough for all the data -ENOBUFS and no entry
+ * data is returned, but the direntry will contain the needed size for the
+ * returned data.
+ * The format of the contents is according to its entry type and encoding.
+ * The contents of a directory are multiple struct xen_hypfs_dirlistentry
+ * items.
+ *
+ * arg1: XEN_GUEST_HANDLE(path name)
+ * arg2: length of path name (including trailing zero byte)
+ * arg3: XEN_GUEST_HANDLE(data buffer written by hypervisor)
+ * arg4: data buffer size
+ *
+ * Possible return values:
+ * 0: success
+ * <0 : negative Xen errno value
+ */
+#define XEN_HYPFS_OP_read              1
+
+/*
+ * XEN_HYPFS_OP_write_contents
+ *
+ * Write contents of a filesystem entry.
+ *
+ * Writes an entry with the contents of a buffer supplied by the caller.
+ * The data type and encoding can't be changed. The size can be changed only
+ * for blobs and strings.
+ *
+ * arg1: XEN_GUEST_HANDLE(path name)
+ * arg2: length of path name (including trailing zero byte)
+ * arg3: XEN_GUEST_HANDLE(content buffer read by hypervisor)
+ * arg4: content buffer size
+ *
+ * Possible return values:
+ * 0: success
+ * <0 : negative Xen errno value
+ */
+#define XEN_HYPFS_OP_write_contents    2
+
+#endif /* __XEN_PUBLIC_HYPFS_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 75b1619d0d..945ef30273 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -130,6 +130,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_argo_op              39
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
+#define __HYPERVISOR_hypfs_op             42
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index ad8ad27b23..836a8b1ba8 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -150,6 +150,14 @@ do_dm_op(
     unsigned int nr_bufs,
     XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
 
+extern long
+do_hypfs_op(
+    unsigned int cmd,
+    XEN_GUEST_HANDLE_PARAM(const_char) arg1,
+    unsigned long arg2,
+    XEN_GUEST_HANDLE_PARAM(void) arg3,
+    unsigned long arg4);
+
 #ifdef CONFIG_COMPAT
 
 extern int
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
new file mode 100644
index 0000000000..85588e2a59
--- /dev/null
+++ b/xen/include/xen/hypfs.h
@@ -0,0 +1,116 @@
+#ifndef __XEN_HYPFS_H__
+#define __XEN_HYPFS_H__
+
+#include <xen/list.h>
+#include <xen/string.h>
+#include <public/hypfs.h>
+
+struct hypfs_entry_leaf;
+
+struct hypfs_entry {
+    unsigned short type;
+    unsigned short encoding;
+    unsigned int size;
+    unsigned int max_size;
+    const char *name;
+    struct list_head list;
+    int (*read)(const struct hypfs_entry *entry,
+                XEN_GUEST_HANDLE_PARAM(void) uaddr);
+    int (*write)(struct hypfs_entry_leaf *leaf,
+                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
+};
+
+struct hypfs_entry_leaf {
+    struct hypfs_entry e;
+    union {
+        const void *content;
+        void *write_ptr;
+    };
+};
+
+struct hypfs_entry_dir {
+    struct hypfs_entry e;
+    struct list_head dirlist;
+};
+
+#define HYPFS_DIR_INIT(var, nam)                  \
+    struct hypfs_entry_dir __read_mostly var = {  \
+        .e.type = XEN_HYPFS_TYPE_DIR,             \
+        .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
+        .e.name = nam,                            \
+        .e.size = 0,                              \
+        .e.max_size = 0,                          \
+        .e.list = LIST_HEAD_INIT(var.e.list),     \
+        .e.read = hypfs_read_dir,                 \
+        .dirlist = LIST_HEAD_INIT(var.dirlist),   \
+    }
+
+#define HYPFS_VARSIZE_INIT(var, typ, nam, msz)    \
+    struct hypfs_entry_leaf __read_mostly var = { \
+        .e.type = typ,                            \
+        .e.encoding = XEN_HYPFS_ENC_PLAIN,        \
+        .e.name = nam,                            \
+        .e.max_size = msz,                        \
+        .e.read = hypfs_read_leaf,                \
+    }
+
+/* Content and size need to be set via hypfs_string_set_reference(). */
+#define HYPFS_STRING_INIT(var, nam)               \
+    HYPFS_VARSIZE_INIT(var, XEN_HYPFS_TYPE_STRING, nam, 0)
+
+/*
+ * Set content and size of a XEN_HYPFS_TYPE_STRING node. The node will point
+ * to str, so any later modification of *str should be followed by a call
+ * to hypfs_string_set_reference() in order to update the size of the node
+ * data.
+ */
+static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
+                                              const char *str)
+{
+    leaf->content = str;
+    leaf->e.size = strlen(str) + 1;
+}
+
+#define HYPFS_FIXEDSIZE_INIT(var, typ, nam, contvar, wr) \
+    struct hypfs_entry_leaf __read_mostly var = {        \
+        .e.type = typ,                                   \
+        .e.encoding = XEN_HYPFS_ENC_PLAIN,               \
+        .e.name = nam,                                   \
+        .e.size = sizeof(contvar),                       \
+        .e.max_size = wr * sizeof(contvar),              \
+        .e.read = hypfs_read_leaf,                       \
+        .content = &contvar,                             \
+    }
+
+#define HYPFS_UINT_INIT(var, nam, contvar)          \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_UINT, nam, contvar, 0)
+#define HYPFS_UINT_INIT_WRITABLE(var, nam, contvar) \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_UINT, nam, contvar, 1)
+
+#define HYPFS_INT_INIT(var, nam, contvar)           \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_INT, nam, contvar, 0)
+#define HYPFS_INT_INIT_WRITABLE(var, nam, contvar)  \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_INT, nam, contvar, 1)
+
+#define HYPFS_BOOL_INIT(var, nam, contvar)          \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, 0)
+#define HYPFS_BOOL_INIT_WRITABLE(var, nam, contvar) \
+    HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, 1)
+
+extern struct hypfs_entry_dir hypfs_root;
+
+struct hypfs_entry *hypfs_get_entry(const char *path);
+int hypfs_add_dir(struct hypfs_entry_dir *parent,
+                  struct hypfs_entry_dir *dir, bool nofault);
+int hypfs_add_leaf(struct hypfs_entry_dir *parent,
+                   struct hypfs_entry_leaf *leaf, bool nofault);
+int hypfs_read_dir(const struct hypfs_entry *entry,
+                   XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int hypfs_read_leaf(const struct hypfs_entry *entry,
+                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
+int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
+                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);
+
+#endif /* __XEN_HYPFS_H__ */
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 95f5e5592b..0921d4a8d0 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -86,6 +86,8 @@
 ?	vcpu_hvm_context		hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_64			hvm/hvm_vcpu.h
+?	hypfs_direntry			hypfs.h
+?	hypfs_dirlistentry		hypfs.h
 ?	kexec_exec			kexec.h
 !	kexec_image			kexec.h
 !	kexec_range			kexec.h
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 295dd67c48..2368acebed 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -434,6 +434,12 @@ static XSM_INLINE int xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
     return xsm_default_action(action, current->domain, NULL);
 }
 
+static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
+{
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
+}
+
 static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return -ENOSYS;
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index e22d6160b5..a80bcf3e42 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -127,6 +127,7 @@ struct xsm_operations {
     int (*resource_setup_misc) (void);
 
     int (*page_offline)(uint32_t cmd);
+    int (*hypfs_op)(void);
 
     long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
 #ifdef CONFIG_COMPAT
@@ -536,6 +537,11 @@ static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
     return xsm_ops->page_offline(cmd);
 }
 
+static inline int xsm_hypfs_op(xsm_default_t def)
+{
+    return xsm_ops->hypfs_op();
+}
+
 static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return xsm_ops->do_xsm_op(op);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 5705e52791..d4cce68089 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -103,6 +103,7 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, resource_setup_misc);
 
     set_to_dummy_if_null(ops, page_offline);
+    set_to_dummy_if_null(ops, hypfs_op);
     set_to_dummy_if_null(ops, hvm_param);
     set_to_dummy_if_null(ops, hvm_control);
     set_to_dummy_if_null(ops, hvm_param_nested);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8af8602b46..74af7df7d5 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1172,6 +1172,11 @@ static inline int flask_page_offline(uint32_t cmd)
     }
 }
 
+static inline int flask_hypfs_op(void)
+{
+    return domain_has_xen(current->domain, XEN__HYPFS_OP);
+}
+
 static int flask_add_to_physmap(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__PHYSMAP);
@@ -1811,6 +1816,7 @@ static struct xsm_operations flask_ops = {
     .resource_setup_misc = flask_resource_setup_misc,
 
     .page_offline = flask_page_offline,
+    .hypfs_op = flask_hypfs_op,
     .hvm_param = flask_hvm_param,
     .hvm_control = flask_hvm_param,
     .hvm_param_nested = flask_hvm_param_nested,
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index c055c14c26..c9e385fb9b 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -67,6 +67,8 @@ class xen
     lockprof
 # XEN_SYSCTL_cpupool_op
     cpupool_op
+# hypfs hypercall
+    hypfs_op
 # XEN_SYSCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_getinfo, XEN_SYSCTL_sched_id, XEN_DOMCTL_SCHEDOP_getvcpuinfo
     getscheduler
 # XEN_SYSCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_putinfo, XEN_DOMCTL_SCHEDOP_putvcpuinfo
-- 
2.16.4


