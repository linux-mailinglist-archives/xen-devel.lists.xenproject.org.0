Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AEB48800E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254716.436566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zvA-0008Du-Pl; Sat, 08 Jan 2022 00:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254716.436566; Sat, 08 Jan 2022 00:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zvA-0007wT-EM; Sat, 08 Jan 2022 00:49:24 +0000
Received: by outflank-mailman (input) for mailman id 254716;
 Sat, 08 Jan 2022 00:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv6-0006ZD-VQ
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc511d6-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99764B827C6;
 Sat,  8 Jan 2022 00:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1298BC36AED;
 Sat,  8 Jan 2022 00:49:17 +0000 (UTC)
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
X-Inumbo-ID: cfc511d6-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602957;
	bh=cJpLwwW8OdmngDb+C/1eNjUgTbMHWokoFmWCQuobrSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVG/KhWGND1i1gzbk6AiU107+9n35oPsX0ZRvROVtGumYsmRnTm3otXT+/CPIqH47
	 QEn3oYaUQ4h6faVPMobaG9BRudubJHy8Z5QDpOb84HI0a4UMOkQV7iLzACJdlXUAgh
	 m9ig+UBtFc5UdDIkuFSXXmSo5ZHFvhDko102evBq+MDg8JvZekyYi+VxiekTLaCjTO
	 kn/KJ6TuaIZWxRB6RSyeId+BlhTxw36nVgz04uxA+n5aHeir96m5H9MnF1diARmDlr
	 OtFGbOM53qu+OJRDzp+yhEMYUI3SXqebnYB5Y1cR+uXloOcP40RNlRU+JFR5PPXW0L
	 J8h7GkdXYyVlQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 7/7] tools: add example application to initialize dom0less PV drivers
Date: Fri,  7 Jan 2022 16:49:12 -0800
Message-Id: <20220108004912.3820176-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add an example application that can be run in dom0 to complete the
dom0less domains initialization so that they can get access to xenstore
and use PV drivers.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/helpers/Makefile        |  13 ++
 tools/helpers/init-dom0less.c | 263 ++++++++++++++++++++++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 tools/helpers/init-dom0less.c

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 7f6c422440..8e42997052 100644
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
+	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest)  $(APPEND_LDFLAGS)
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
new file mode 100644
index 0000000000..055bf76cf5
--- /dev/null
+++ b/tools/helpers/init-dom0less.c
@@ -0,0 +1,263 @@
+#include <stdbool.h>
+#include <syslog.h>
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <xenstore.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <libxl.h>
+#include <xenevtchn.h>
+
+#include "init-dom-json.h"
+
+#define NR_MAGIC_PAGES 4
+#define CONSOLE_PFN_OFFSET 0
+#define XENSTORE_PFN_OFFSET 1
+#define STR_MAX_LENGTH 64
+
+static int alloc_magic_pages(struct xc_dom_image *dom)
+{
+    int rc, i;
+    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
+    xen_pfn_t p2m[NR_MAGIC_PAGES];
+
+    for (i = 0; i < NR_MAGIC_PAGES; i++)
+        p2m[i] = base + i;
+
+    rc = xc_domain_populate_physmap_exact(dom->xch, dom->guest_domid,
+                                          NR_MAGIC_PAGES, 0, 0, p2m);
+    if (rc < 0)
+        return rc;
+
+    dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+
+    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
+
+    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
+                     dom->xenstore_pfn);
+    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_EVTCHN,
+                     dom->xenstore_evtchn);
+    return 0;
+}
+
+static void do_xs_write(struct xs_handle *xsh, xs_transaction_t t,
+                        char *path, char *val)
+{
+    if (!xs_write(xsh, t, path, val, strlen(val)))
+        fprintf(stderr, "writing %s to xenstore failed.\n", path);
+}
+
+static void do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
+                            domid_t domid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+
+    snprintf(full_path, STR_MAX_LENGTH,
+             "/local/domain/%d/%s", domid, path);
+    do_xs_write(xsh, t, full_path, val);
+}
+
+static void do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
+                              domid_t domid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+
+    snprintf(full_path, STR_MAX_LENGTH,
+             "/libxl/%d/%s", domid, path);
+    do_xs_write(xsh, t, full_path, val);
+}
+
+static void do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
+                           libxl_uuid uuid, char *path, char *val)
+{
+    char full_path[STR_MAX_LENGTH];
+
+    snprintf(full_path, STR_MAX_LENGTH,
+             "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path);
+    do_xs_write(xsh, t, full_path, val);
+}
+
+static int restore_xenstore(struct xs_handle *xsh,
+                            libxl_dominfo *info, libxl_uuid uuid,
+                            evtchn_port_t xenstore_port)
+{
+    domid_t domid;
+    int i;
+    char uuid_str[STR_MAX_LENGTH];
+    char dom_name_str[STR_MAX_LENGTH];
+    char vm_val_str[STR_MAX_LENGTH];
+    char id_str[STR_MAX_LENGTH];
+    char max_memkb_str[STR_MAX_LENGTH];
+    char cpu_str[STR_MAX_LENGTH];
+    char xenstore_port_str[STR_MAX_LENGTH];
+    char ring_ref_str[STR_MAX_LENGTH];
+    xs_transaction_t t;
+
+    domid = info->domid;
+    snprintf(id_str, STR_MAX_LENGTH, "%d", domid);
+    snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%d", domid);
+    snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
+    snprintf(vm_val_str, STR_MAX_LENGTH,
+             "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
+    snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
+    snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
+             (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    snprintf(xenstore_port_str, STR_MAX_LENGTH, "%d", xenstore_port);
+
+retry_transaction:
+    t = xs_transaction_start(xsh);
+    if (t == XBT_NULL)
+        return errno;
+
+    /* /vm */
+    do_xs_write_vm(xsh, t, uuid, "name", dom_name_str);
+    do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str);
+    do_xs_write_vm(xsh, t, uuid, "start_time", "0");
+
+    /* /domain */
+    do_xs_write_dom(xsh, t, domid, "vm", vm_val_str);
+    do_xs_write_dom(xsh, t, domid, "name", dom_name_str);
+    do_xs_write_dom(xsh, t, domid, "cpu", "");
+    for (i = 0; i < info->vcpu_max_id; i++) {
+        snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%d/availability/", i);
+        do_xs_write_dom(xsh, t, domid, cpu_str,
+                        (info->cpupool & (1 << i)) ? "online" : "offline");
+    }
+    do_xs_write_dom(xsh, t, domid, "cpu/0", "");
+    do_xs_write_dom(xsh, t, domid, "cpu/availability", "online");
+
+    do_xs_write_dom(xsh, t, domid, "memory", "");
+    do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str);
+    do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1");
+
+    do_xs_write_dom(xsh, t, domid, "device", "");
+    do_xs_write_dom(xsh, t, domid, "device/suspend", "");
+    do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "");
+
+    do_xs_write_dom(xsh, t, domid, "control", "");
+    do_xs_write_dom(xsh, t, domid, "control/shutdown", "");
+    do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1");
+    do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1");
+    do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "");
+    do_xs_write_dom(xsh, t, domid, "control/sysrq", "");
+    do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiprocessor-suspend", "1");
+    do_xs_write_dom(xsh, t, domid, "control", "platform-feature-xs_reset_watches");
+
+    do_xs_write_dom(xsh, t, domid, "domid", id_str);
+    do_xs_write_dom(xsh, t, domid, "data", "");
+    do_xs_write_dom(xsh, t, domid, "drivers", "");
+    do_xs_write_dom(xsh, t, domid, "feature", "");
+    do_xs_write_dom(xsh, t, domid, "attr", "");
+
+    do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str);
+    do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str);
+
+    do_xs_write_libxl(xsh, t, domid, "type", "pvh");
+    do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen");
+
+    if (!xs_transaction_end(xsh, t, false))
+        if (errno == EAGAIN)
+            goto retry_transaction;
+
+    return 0;
+}
+
+static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
+{
+    struct xc_dom_image dom;
+    libxl_uuid uuid;
+    uint64_t v;
+    int rc;
+
+    printf("#### Init dom0less domain: %d ####\n", info->domid);
+    dom.guest_domid = info->domid;
+    dom.xenstore_domid = 0;
+    dom.xch = xc_interface_open(0, 0, 0);
+
+    rc = xc_hvm_param_get(dom.xch, info->domid, HVM_PARAM_STORE_EVTCHN, &v);
+    if (rc != 0) {
+        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
+        return 1;
+    }
+    dom.xenstore_evtchn = v;
+
+    /* Console won't be initialized but set its data for completeness */
+    dom.console_domid = 0;
+
+    /* Alloc magic pages */
+    printf("Allocating magic pages\n");
+    if (alloc_magic_pages(&dom) != 0) {
+        printf("Error on alloc magic pages\n");
+        return 1;
+    }
+
+    printf("Setup Grant Tables\n");
+    xc_dom_gnttab_init(&dom);
+
+    printf("Setup UUID\n");
+    libxl_uuid_generate(&uuid);
+    xc_domain_sethandle(dom.xch, info->domid, libxl_uuid_bytearray(&uuid));
+
+    printf("Creating JSON\n");
+    rc = gen_stub_json_config(info->domid, &uuid);
+    if (rc)
+        err(1, "gen_stub_json_config");
+
+    printf("Restoring Xenstore values\n");
+    restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
+
+    printf("Introducing domain\n");
+    xs_introduce_domain(xsh, info->domid,
+            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
+            dom.xenstore_evtchn, true);
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
+    libxl_dominfo *info;
+    libxl_ctx *ctx;
+    int nb_vm, i;
+    struct xs_handle *xsh;
+
+    xsh = xs_daemon_open();
+    if (xsh == NULL) {
+        fprintf(stderr, "Could not contact XenStore");
+        exit(1);
+    }
+
+    if (libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, NULL)) {
+        fprintf(stderr, "cannot init xl context\n");
+        exit(1);
+    }
+
+    info = libxl_list_domain(ctx, &nb_vm);
+    if (!info) {
+        fprintf(stderr, "libxl_list_vm failed.\n");
+        exit(EXIT_FAILURE);
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
+        if (!domain_exists(xsh, domid))
+            init_domain(xsh, &info[i]);
+        else
+            printf("Domain %d has already been initialized\n", domid);
+    }
+    libxl_dominfo_list_free(info, nb_vm);
+    xs_close(xsh);
+    return 0;
+}
-- 
2.25.1


