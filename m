Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86233A945B8
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960170.1352246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYG-0008V5-F6; Sat, 19 Apr 2025 22:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960170.1352246; Sat, 19 Apr 2025 22:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYG-0008Sf-C7; Sat, 19 Apr 2025 22:20:44 +0000
Received: by outflank-mailman (input) for mailman id 960170;
 Sat, 19 Apr 2025 22:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GS9-0004yY-N3
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:14:25 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5cfaf31-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:14:24 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100570220786.7371535034937;
 Sat, 19 Apr 2025 15:09:30 -0700 (PDT)
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
X-Inumbo-ID: a5cfaf31-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pbv10S9WnTZ728F1uAkJV3EI27pZQXQ+wuyS6pOvbgC8d2OUr3xCl+I8fOFRRDHNJDYeuj0hvvuCr2/DvNZAV5VgBiHIAO9kLr2+kSDUgk6RzFa267B+gYRsD2L8dDIdS8Hac7MaRrFCoVuB0lERQcBAheR/8c8DsFaF7iQ0wR0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100572; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Mw5Odp6bgq0ypnGyk6hZln2JaXDA/NCzGFeI/Jyp6zU=; 
	b=HAbKuS0Af1UZxqbyrvMGTwwx50w0oTFI0ZMwCJt7CGq8ljmnbPH7xhU9W0m/Ukwd6MCICNFBj9AG6orrF0f28cF8E+1/remIP6TKD5uKqfHM7fsDvXfcy8nq7Muiy/Udtr1vq9nQFxZn63w4h5lLqpCH3+KWoXnPmgxY9mr3FNY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100572;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Mw5Odp6bgq0ypnGyk6hZln2JaXDA/NCzGFeI/Jyp6zU=;
	b=dd9n/ghF1ifEzSqBz/wWn3kZjJ+UQyc9qwzkpiuKTLeqX8KvaR2g2ottWuqb3iCy
	CXmebl4tFVTjWSbmsFuweB4s4m7kk1f4RAXu+yoshMPWUOU+MZiKdTTziWvuOItJdyE
	vRJ/Ph1qeBti0OIAD6lCiUrZ3lQTM0hdxCtTIAAs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 38/38] tools: introduce hyperlaunch domain late init
Date: Sat, 19 Apr 2025 18:08:20 -0400
Message-Id: <20250419220820.4234-39-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The late domain init helper is a helper tool for late setup of Xenstore for a
domain that was created by the hypervisor using hyperlaunch.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 .gitignore                        |   1 +
 tools/helpers/Makefile            |  12 +
 tools/helpers/late-init-domains.c | 364 ++++++++++++++++++++++++++++++
 tools/helpers/late-init-domains.h |  18 ++
 tools/helpers/xs-helpers.c        | 117 ++++++++++
 tools/helpers/xs-helpers.h        |  26 +++
 6 files changed, 538 insertions(+)
 create mode 100644 tools/helpers/late-init-domains.c
 create mode 100644 tools/helpers/late-init-domains.h
 create mode 100644 tools/helpers/xs-helpers.c
 create mode 100644 tools/helpers/xs-helpers.h

diff --git a/.gitignore b/.gitignore
index 53f5df000383..7b0c390dbe0d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -122,6 +122,7 @@ tools/flask/utils/flask-label-pci
 tools/helpers/init-dom0less
 tools/helpers/init-xenstore-domain
 tools/helpers/xen-init-dom0
+tools/helpers/late-init-domains
 tools/hotplug/common/hotplugpath.sh
 tools/hotplug/FreeBSD/rc.d/xencommons
 tools/hotplug/FreeBSD/rc.d/xendriverdomain
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 09590eb5b6f0..26fa079e8b1f 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -14,6 +14,7 @@ ifeq ($(CONFIG_ARM),y)
 TARGETS += init-dom0less
 endif
 endif
+TARGETS += late-init-domains
 
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -39,6 +40,14 @@ $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
 init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
 
+LATE_INIT_DOMAINS_OBJS = late-init-domains.o xs-helpers.o init-dom-json.o
+$(LATE_INIT_DOMAINS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
+$(LATE_INIT_DOMAINS_OBJS): CFLAGS += $(CFLAGS_libxenguest)
+$(LATE_INIT_DOMAINS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
+$(LATE_INIT_DOMAINS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+$(LATE_INIT_DOMAINS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
+late-init-domains: LDLIBS += $(call xenlibs-ldlibs,ctrl toollog store light guest)
+
 .PHONY: all
 all: $(TARGETS)
 
@@ -51,6 +60,9 @@ init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 init-dom0less: $(INIT_DOM0LESS_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
+late-init-domains: $(LATE_INIT_DOMAINS_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(LATE_INIT_DOMAINS_OBJS) $(LDLIBS)  $(APPEND_LDFLAGS)
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/tools/helpers/late-init-domains.c b/tools/helpers/late-init-domains.c
new file mode 100644
index 000000000000..06911d2e93d1
--- /dev/null
+++ b/tools/helpers/late-init-domains.c
@@ -0,0 +1,364 @@
+
+#include <errno.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <libxl.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xenstore.h>
+#include <xentoollog.h>
+#include <xen/io/xenbus.h>
+
+#include "init-dom-json.h"
+#include "late-init-domains.h"
+#include "xs-helpers.h"
+
+static struct option options[] = {
+    { "console", 0, NULL, 'c' },
+    { "xenstore", 1, NULL, 'x' },
+    { "force", 0, NULL, 'f' },
+    { "verbose", 0, NULL, 'v' },
+    { "help", 0, NULL, 'h' },
+    { NULL, 0, NULL, 0 }
+};
+
+static void usage(void)
+{
+    fprintf(stderr,
+"Usage:\n"
+"\n"
+"late-init-domains <options>\n"
+"\n"
+"where options may include:\n"
+"\n"
+"  --console <con domid>    configure the console\n"
+"  --xenstore <xs domid>    domain id of the xenstore domain\n"
+"  --force                  force domain introduction even if xenstore entries exist\n"
+"  -v[v[v]]                 verbosity constructing xenstore tree\n"
+"  --help                   help message\n");
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
+static int pages_from_hvm_params(
+    struct xc_interface_core *xch, libxl_dominfo *info,
+    struct system_pages *pgs)
+{
+    int ret;
+    domid_t domid = info->domid;
+
+    ret = xc_hvm_param_get(xch, domid, HVM_PARAM_STORE_EVTCHN,
+                           &pgs->store.evtchn);
+    if (ret != 0) {
+        fprintf(stderr, "err: failed to get dom%d store evtchn\n", domid);
+        return ret;
+    }
+
+    ret = xc_hvm_param_get(xch, domid, HVM_PARAM_STORE_PFN,
+                           &pgs->store.pfn);
+    if (ret < 0) {
+        fprintf(stderr, "err: failed to get dom%d store pfn\n", domid);
+        return ret;
+    }
+
+    if ( pgs->console.enabled )
+    {
+        ret = xc_hvm_param_get(xch, domid, HVM_PARAM_CONSOLE_EVTCHN,
+                              &pgs->console.evtchn);
+        if (ret != 0) {
+            fprintf(stderr, "warn: console for dom%d not configured\n", domid);
+            pgs->console.evtchn = pgs->console.pfn = 0;
+            return 0;
+        }
+
+        ret = xc_hvm_param_get(xch, domid, HVM_PARAM_CONSOLE_PFN,
+                               &pgs->console.pfn);
+        if (ret < 0) {
+            fprintf(stderr, "warn: console for dom%d not configured\n", domid);
+            pgs->console.evtchn = pgs->console.pfn = 0;
+            return 0;
+        }
+    }
+
+    return 0;
+}
+
+static int create_xs_entries(
+    struct xs_handle *xsh, struct system_pages *pgs, libxl_dominfo *di)
+{
+    char path[128], value[16];
+    struct xs_permissions perms[2] = {
+        {.id = pgs->store.be_domid, .perms = XS_PERM_NONE},
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
+        snprintf(value, 16, "%" PRIu64, di->current_memkb);
+        XS_DOM_PERM(xsh, di->domid, "memory/target", value);
+
+        snprintf(value, 16, "%" PRIu64, di->max_memkb);
+        XS_DOM_PERM(xsh, di->domid, "memory/static-max", value);
+
+        XS_DOM_PERM(xsh, di->domid, "store", "");
+        snprintf(value, 16, "%" PRIu64, pgs->store.evtchn);
+        XS_DOM_PERM(xsh, di->domid, "store/port", value);
+
+        snprintf(value, 16, "%" PRIu64, pgs->store.pfn);
+        XS_DOM_PERM(xsh, di->domid, "store/ring-ref", value);
+
+        if ( pgs->console.enabled && pgs->console.evtchn )
+        {
+            char be_path[64], fe_path[64];
+
+            snprintf(fe_path, 64, "/local/domain/%d/console", di->domid);
+            snprintf(be_path, 64, "/local/domain/%d/backend/console/%d/0",
+                     pgs->console.be_domid, di->domid);
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
+            snprintf(value, 16, "%d", pgs->console.be_domid);
+            XS_DIR_PERM(xsh, fe_path, "backend", be_path);
+            XS_DIR_PERM(xsh, fe_path, "backend-id", value);
+            XS_DIR_PERM(xsh, fe_path, "limit", "1048576");
+            XS_DIR_PERM(xsh, fe_path, "type", "xenconsoled");
+            XS_DIR_PERM(xsh, fe_path, "output", "pty");
+            XS_DIR_PERM(xsh, fe_path, "tty", "");
+
+            snprintf(value, 16, "%" PRIu64, pgs->console.evtchn);
+            XS_DIR_PERM(xsh, fe_path, "port", value);
+
+            snprintf(value, 16, "%" PRIu64, pgs->console.pfn);
+            XS_DIR_PERM(xsh, fe_path, "ring-ref", value);
+
+        }
+
+        snprintf(path, 128, "/libxl/%u", di->domid);
+        switch ( di->domain_type )
+        {
+        case LIBXL_DOMAIN_TYPE_PV:
+            XS_DIR_PERM(xsh, path, "type", "pv");
+            break;
+        case LIBXL_DOMAIN_TYPE_PVH:
+            XS_DIR_PERM(xsh, path, "type", "pvh");
+            break;
+        case LIBXL_DOMAIN_TYPE_HVM:
+            XS_DIR_PERM(xsh, path, "type", "hvm");
+            break;
+        default:
+            break;
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
+static bool init_domain(
+    struct xc_interface_core *xch, struct xs_handle *xsh,
+    struct system_pages *pgs, libxl_dominfo *di)
+{
+    xen_pfn_t con_pfn = 0L;
+    /*xc_dom_gnttab_seed will do nothing if front == back */
+    uint32_t con_domid = di->domid;
+    bool is_hvm = (di->domain_type == LIBXL_DOMAIN_TYPE_HVM ||
+                   di->domain_type == LIBXL_DOMAIN_TYPE_PVH);
+    int ret;
+
+    if ( (ret = pages_from_hvm_params(xch, di, pgs)) != 0 )
+    {
+        fprintf(stderr, "error(%d): unable to fetch dom%d system pages\n", ret,
+                di->domid);
+        return false;
+    }
+
+    if ( pgs->console.enabled && pgs->console.evtchn )
+    {
+        con_domid = pgs->console.be_domid;
+        con_pfn = pgs->console.pfn;
+    }
+
+    ret = xc_dom_gnttab_seed(xch, di->domid, is_hvm, con_pfn,
+            pgs->store.pfn, con_domid, pgs->store.be_domid);
+    if ( ret != 0 )
+    {
+        fprintf(stderr, "error (%d) setting up grant tables for dom%d\n",
+                ret, di->domid);
+        return false;
+    }
+
+    libxl_uuid_generate(&di->uuid);
+    xc_domain_sethandle(xch, di->domid,
+                        libxl_uuid_bytearray(&di->uuid));
+
+    if ( (ret = gen_stub_json_config(di->domid, &di->uuid)) != 0 )
+        fprintf(stderr, "warn(%d): unable generate dom%d json stub\n", ret,
+                di->domid);
+
+    if ( (ret = create_xs_entries(xsh, pgs, di)) != 0 )
+    {
+        fprintf(stderr, "error(%d): unable create dom%d xenstore entries\n",
+                ret, di->domid);
+        return false;
+    }
+
+    if ( !xs_introduce_domain(xsh, di->domid, pgs->store.pfn,
+                              pgs->store.evtchn) )
+    {
+        fprintf(stderr, "error introducing dom%d\n", di->domid);
+        return false;
+    }
+
+    return true;
+}
+
+int main(int argc, char** argv)
+{
+    int opt, ret, i, nb_vm = 0, count = 0;
+    bool force = false;
+    struct xs_handle *xsh = NULL;
+    struct xc_interface_core *xch = NULL;
+    xentoollog_level minmsglevel = XTL_PROGRESS;
+    xentoollog_logger *logger = NULL;
+    libxl_dominfo *info = NULL;
+    libxl_ctx *ctx;
+    struct system_pages pages = { {0} };
+
+    while ( (opt = getopt_long(argc, argv, "c:x:fv", options, NULL)) != -1 )
+    {
+        switch ( opt )
+        {
+        case 'c':
+            pages.console.be_domid = strtol(optarg, NULL, 10);
+            pages.console.enabled = true;
+            break;
+        case 'x':
+            pages.store.be_domid = strtol(optarg, NULL, 10);
+            break;
+        case 'f':
+            force = true;
+            break;
+        case 'v':
+            if ( minmsglevel > 1 )
+                minmsglevel--;
+            break;
+        case 'h':
+            usage();
+            return 0;
+        default:
+            usage();
+            return 2;
+        }
+    }
+
+    if ( optind != argc )
+    {
+        usage();
+        return 1;
+    }
+
+    logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
+                                                               minmsglevel, 0);
+
+    xsh = xs_open(0);
+    xch = xc_interface_open(0, 0, 0);
+    if ( xsh == NULL || xch == NULL )
+    {
+        fprintf(stderr, "error: unable to connect to xs and/or xc interface\n");
+        ret = 1;
+        goto out;
+    }
+
+    ret = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, NULL);
+    if (ret) {
+        fprintf(stderr, "cannot init xl context\n");
+        goto out;
+    }
+
+    info = libxl_list_domain(ctx, &nb_vm);
+    if (!info) {
+        fprintf(stderr, "libxl_list_vm failed.\n");
+        ret = 1;
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
+        if ( xs_is_domain_introduced(xsh, domid) )
+        {
+            if ( !force )
+                continue;
+
+            fprintf(stderr, "warning: re-introducting domain %d\n", domid);
+        }
+
+        if ( init_domain(xch, xsh, &pages, &info[i]) )
+            count++;
+    }
+
+    printf("initialized %d out of %d domains\n", count, nb_vm);
+
+    ret = 0;
+
+out:
+    if ( info )
+        libxl_dominfo_list_free(info, nb_vm);
+
+    if ( xsh )
+        xs_close(xsh);
+
+    if ( xch )
+        xc_interface_close(xch);
+
+    if ( logger )
+        xtl_logger_destroy(logger);
+
+    return ret;
+}
diff --git a/tools/helpers/late-init-domains.h b/tools/helpers/late-init-domains.h
new file mode 100644
index 000000000000..8d071ef82ea0
--- /dev/null
+++ b/tools/helpers/late-init-domains.h
@@ -0,0 +1,18 @@
+#ifndef __LATE_INIT_PV_H
+#define __LATE_INIT_PV_H
+
+struct system_pages {
+    struct {
+        uint16_t be_domid;
+        uint64_t evtchn;
+        uint64_t pfn;
+    } store;
+    struct {
+        bool enabled;
+        uint16_t be_domid;
+        uint64_t evtchn;
+        uint64_t pfn;
+    } console;
+};
+
+#endif
diff --git a/tools/helpers/xs-helpers.c b/tools/helpers/xs-helpers.c
new file mode 100644
index 000000000000..a4d2bebbbd54
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
index 000000000000..89585637d4bb
--- /dev/null
+++ b/tools/helpers/xs-helpers.h
@@ -0,0 +1,26 @@
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
-- 
2.30.2


