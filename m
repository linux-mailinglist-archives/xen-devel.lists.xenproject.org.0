Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37869515631
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317706.537201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgM-00088l-DW; Fri, 29 Apr 2022 20:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317706.537201; Fri, 29 Apr 2022 20:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgM-0007yB-1u; Fri, 29 Apr 2022 20:57:42 +0000
Received: by outflank-mailman (input) for mailman id 317706;
 Fri, 29 Apr 2022 20:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXgK-0007P4-6K
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00591aee-c7ff-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 22:57:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BEB4621E4;
 Fri, 29 Apr 2022 20:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB37C385A7;
 Fri, 29 Apr 2022 20:57:36 +0000 (UTC)
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
X-Inumbo-ID: 00591aee-c7ff-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265857;
	bh=btLZXtaxl9qWeM6CyJYOjZEoxyC1CnI0BUVRGmnQUKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pt7N1gLJEnAAM8jQvYRp1WVXDZ9gHpl+i4uvjOVZlc+K62tGeONq9uLmFmBoBgRQ/
	 YhPL+Gc+Q5QGdlDujmEmsqtTe1LcLnL4/JaaH25iDoJ0+JMu/TQEzVpvM6blIkKB1Z
	 dXiaiDuzQ7QQElLt8bBsSxo1hNEUixejrumOuIzktD7u3WQIOKgQ4n/WNyAHcHIGyt
	 uqJSba1XJdBUFLdzUHUDKgxchK+YWP4X7AE9WyW4K021mZRiI7xQA/MWO5e2luZC5D
	 mGNXcBuvDdpzsLAU6KN7f9QkGyS/KXmI//juUwfnndfw0AXxJIi0vex4u/AcgzvjkM
	 kMGz/MXX8febw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 6/7] tools: add example application to initialize dom0less PV drivers
Date: Fri, 29 Apr 2022 13:57:31 -0700
Message-Id: <20220429205732.2030094-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add an example application that can be run in dom0 to complete the
dom0less domains initialization so that they can get access to xenstore
and use PV drivers.

The application sets XS_CONNECTION_STATE_RECONNECTING on the xenstore
page before calling xs_introduce_domain to signal that the connection is
not ready yet to be used. XS_CONNECTION_STATE_RECONNECTING is reset soon
after by xenstored.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
Changes in v5:
- set XS_CONNECTION_STATE_RECONNECTING before xs_introduce_domain

Changes in v4:
- only alloc xs page (no other magic pages)
- add xenstore permissions
- check all return values
- rename restore_xenstore to create_xenstore
- set target_memkb
- set start_time properly
- close xs transaction on error
- call xc_dom_gnttab_seed instead of xc_dom_gnttab_init
- xs_open instead of xs_daemon_open

Changes in v3:
- handle xenstore errors
- add an in-code comment about xenstore entries
- less verbose output
- clean-up error path in main

Changes in v2:
- do not set HVM_PARAM_STORE_EVTCHN twice
- rename restore_xenstore to create_xenstore
- increase maxmem

connection reconnecting
---
 tools/helpers/Makefile        |  13 ++
 tools/helpers/init-dom0less.c | 341 ++++++++++++++++++++++++++++++++++
 2 files changed, 354 insertions(+)
 create mode 100644 tools/helpers/init-dom0less.c

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 7f6c422440..8d78ab1e90 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -10,6 +10,9 @@ ifeq ($(CONFIG_Linux),y)
 ifeq ($(CONFIG_X86),y)
 PROGS += init-xenstore-domain
 endif
+ifeq ($(CONFIG_ARM),y)
+PROGS += init-dom0less
+endif
 endif
 
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
@@ -26,6 +29,13 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
+INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
+
 .PHONY: all
 all: $(PROGS)
 
@@ -35,6 +45,9 @@ xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
 
+init-dom0less: $(INIT_DOM0LESS_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
new file mode 100644
index 0000000000..a99398e928
--- /dev/null
+++ b/tools/helpers/init-dom0less.c
@@ -0,0 +1,341 @@
+#include <stdbool.h>
+#include <syslog.h>
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <sys/time.h>
+#include <xenstore.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <libxl.h>
+#include <xenevtchn.h>
+#include <xenforeignmemory.h>
+
+#include "init-dom-json.h"
+
+#define XS_CONNECTION_STATE_OFFSET       (2068/4)
+#define XS_CONNECTION_STATE_RECONNECTING 0x1
+#define XENSTORE_PFN_OFFSET 1
+#define STR_MAX_LENGTH 64
+
+static int alloc_xs_page(struct xc_interface_core *xch,
+                         libxl_dominfo *info,
+                         uint64_t *xenstore_pfn)
+{
+    int rc;
+    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
+    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+
+    rc = xc_domain_setmaxmem(xch, info->domid,
+                             info->max_memkb + (XC_PAGE_SIZE/1024));
+    if (rc < 0)
+        return rc;
+
+    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
+    if (rc < 0)
+        return rc;
+
+    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
+    if (rc < 0)
+        return rc;
+
+    return 0;
+}
+
+static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
+                            domid_t domid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+    struct xs_permissions perms[2];
+
+    perms[0].id = domid;
+    perms[0].perms = XS_PERM_NONE;
+    perms[1].id = 0;
+    perms[1].perms = XS_PERM_READ;
+
+    if (snprintf(full_path, STR_MAX_LENGTH,
+                 "/local/domain/%u/%s", domid, path) < 0)
+        return false;
+    if (!xs_write(xsh, t, full_path, val, strlen(val)))
+        return false;
+    return xs_set_permissions(xsh, t, full_path, perms, 2);
+}
+
+static bool do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
+                              domid_t domid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+
+    if (snprintf(full_path, STR_MAX_LENGTH,
+                 "/libxl/%u/%s", domid, path) < 0)
+        return false;
+    return xs_write(xsh, t, full_path, val, strlen(val));
+}
+
+static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
+                           libxl_uuid uuid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+
+    if (snprintf(full_path, STR_MAX_LENGTH,
+                 "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path) < 0)
+        return false;
+    return xs_write(xsh, t, full_path, val, strlen(val));
+}
+
+/*
+ * The xenstore nodes are the xenstore nodes libxl writes at domain
+ * creation.
+ *
+ * The list was retrieved by running xenstore-ls on a corresponding
+ * domain started by xl/libxl.
+ */
+static int create_xenstore(struct xs_handle *xsh,
+                           libxl_dominfo *info, libxl_uuid uuid,
+                           evtchn_port_t xenstore_port)
+{
+    domid_t domid;
+    unsigned int i;
+    char uuid_str[STR_MAX_LENGTH];
+    char dom_name_str[STR_MAX_LENGTH];
+    char vm_val_str[STR_MAX_LENGTH];
+    char id_str[STR_MAX_LENGTH];
+    char max_memkb_str[STR_MAX_LENGTH];
+    char target_memkb_str[STR_MAX_LENGTH];
+    char cpu_str[STR_MAX_LENGTH];
+    char xenstore_port_str[STR_MAX_LENGTH];
+    char ring_ref_str[STR_MAX_LENGTH];
+    xs_transaction_t t;
+    struct timeval start_time;
+    char start_time_str[STR_MAX_LENGTH];
+    int rc;
+
+    if (gettimeofday(&start_time, NULL) < 0)
+        return -errno;
+    rc = snprintf(start_time_str, STR_MAX_LENGTH, "%jd.%02d",
+            (intmax_t)start_time.tv_sec, (int)start_time.tv_usec / 10000);
+    if (rc < 0)
+        return rc;
+
+    domid = info->domid;
+    rc = snprintf(id_str, STR_MAX_LENGTH, "%u", domid);
+    if (rc < 0)
+        return rc;
+    rc = snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%u", domid);
+    if (rc < 0)
+        return rc;
+    rc = snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
+    if (rc < 0)
+        return rc;
+    rc = snprintf(vm_val_str, STR_MAX_LENGTH,
+                  "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
+    if (rc < 0)
+        return rc;
+    rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
+    if (rc < 0)
+        return rc;
+    rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu", info->current_memkb);
+    if (rc < 0)
+        return rc;
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
+                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    if (rc < 0)
+        return rc;
+    rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
+    if (rc < 0)
+        return rc;
+
+retry_transaction:
+    t = xs_transaction_start(xsh);
+    if (t == XBT_NULL)
+        return -errno;
+
+    rc = -EIO;
+    /* /vm */
+    if (!do_xs_write_vm(xsh, t, uuid, "name", dom_name_str)) goto err;
+    if (!do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str)) goto err;
+    if (!do_xs_write_vm(xsh, t, uuid, "start_time", start_time_str)) goto err;
+
+    /* /domain */
+    if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
+    for (i = 0; i < info->vcpu_max_id; i++) {
+        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
+        if (rc < 0)
+            goto err;
+        rc = -EIO;
+        if (!do_xs_write_dom(xsh, t, domid, cpu_str,
+                             (info->cpupool & (1 << i)) ? "online" : "offline"))
+            goto err;
+    }
+
+    if (!do_xs_write_dom(xsh, t, domid, "memory", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "memory/target", target_memkb_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1")) goto err;
+
+    if (!do_xs_write_dom(xsh, t, domid, "device", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "device/suspend", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "")) goto err;
+
+    if (!do_xs_write_dom(xsh, t, domid, "control", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/shutdown", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/sysrq", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiprocessor-suspend", "1")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "control/platform-feature-xs_reset_watches", "1")) goto err;
+
+    if (!do_xs_write_dom(xsh, t, domid, "domid", id_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "data", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "drivers", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "feature", "")) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "attr", "")) goto err;
+
+    if (!do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str)) goto err;
+    if (!do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str)) goto err;
+
+    if (!do_xs_write_libxl(xsh, t, domid, "type", "pvh")) goto err;
+    if (!do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen")) goto err;
+
+    if (!xs_transaction_end(xsh, t, false)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            return -errno;
+    }
+
+    return 0;
+
+err:
+    xs_transaction_end(xsh, t, true);
+    return rc;
+}
+
+static int init_domain(struct xs_handle *xsh,
+                       struct xc_interface_core *xch,
+                       xenforeignmemory_handle *xfh,
+                       libxl_dominfo *info)
+{
+    libxl_uuid uuid;
+    uint64_t xenstore_evtchn, xenstore_pfn;
+    int rc;
+    uint32_t *page;
+
+    printf("Init dom0less domain: %u\n", info->domid);
+
+    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
+                          &xenstore_evtchn);
+    if (rc != 0) {
+        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
+        return 1;
+    }
+
+    /* Alloc xenstore page */
+    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
+        printf("Error on alloc magic pages\n");
+        return 1;
+    }
+
+    page = xenforeignmemory_map(xfh, info->domid, XS_READ | XS_WRITE, 1,
+                                &xenstore_pfn, NULL);
+    if (!page) {
+        printf("Error mapping xenstore page\n");
+        return 1;
+    }
+    page[XS_CONNECTION_STATE_OFFSET] = XS_CONNECTION_STATE_RECONNECTING;
+    xenforeignmemory_unmap(xfh, page, 1);
+
+    rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+    if (rc)
+        err(1, "xc_dom_gnttab_seed");
+
+    libxl_uuid_generate(&uuid);
+    xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
+
+    rc = gen_stub_json_config(info->domid, &uuid);
+    if (rc)
+        err(1, "gen_stub_json_config");
+
+    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
+    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
+                          xenstore_pfn);
+    if (rc < 0)
+        return rc;
+
+    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    if (rc)
+        err(1, "writing to xenstore");
+
+    rc = xs_introduce_domain(xsh, info->domid,
+            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
+            xenstore_evtchn);
+    if (!rc)
+        err(1, "xs_introduce_domain");
+    return 0;
+}
+
+/* Check if domain has been configured in XS */
+static bool domain_exists(struct xs_handle *xsh, int domid)
+{
+    return xs_is_domain_introduced(xsh, domid);
+}
+
+int main(int argc, char **argv)
+{
+    libxl_dominfo *info = NULL;
+    libxl_ctx *ctx;
+    int nb_vm = 0, rc = 0, i;
+    struct xs_handle *xsh = NULL;
+    struct xc_interface_core *xch = NULL;
+    xenforeignmemory_handle *xfh = NULL;
+
+    /* TODO reuse libxl xsh connection */
+    xsh = xs_open(0);
+    xch = xc_interface_open(0, 0, 0);
+    xfh = xenforeignmemory_open(0, 0);
+    if (xsh == NULL || xch == NULL || xfh == NULL) {
+        fprintf(stderr, "Cannot open xc/xs/xenforeignmemory interfaces");
+        rc = -errno;
+        goto out;
+    }
+
+    rc = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, NULL);
+    if (rc) {
+        fprintf(stderr, "cannot init xl context\n");
+        goto out;
+    }
+
+    info = libxl_list_domain(ctx, &nb_vm);
+    if (!info) {
+        fprintf(stderr, "libxl_list_vm failed.\n");
+        rc = -1;
+        goto out;
+    }
+
+    for (i = 0; i < nb_vm; i++) {
+        domid_t domid = info[i].domid;
+
+        /* Don't need to check for Dom0 */
+        if (!domid)
+            continue;
+
+        printf("Checking domid: %u\n", domid);
+        if (!domain_exists(xsh, domid)) {
+            rc = init_domain(xsh, xch, xfh, &info[i]);
+            if (rc < 0) {
+                fprintf(stderr, "init_domain failed.\n");
+                goto out;
+            }
+        } else {
+            printf("Domain %u has already been initialized\n", domid);
+        }
+    }
+out:
+    libxl_dominfo_list_free(info, nb_vm);
+    return rc;
+}
-- 
2.25.1


