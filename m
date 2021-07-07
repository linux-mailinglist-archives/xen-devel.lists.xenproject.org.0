Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF803BE8DC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152260.281306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17hK-0003If-U3; Wed, 07 Jul 2021 13:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152260.281306; Wed, 07 Jul 2021 13:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17hK-0003FO-QC; Wed, 07 Jul 2021 13:34:42 +0000
Received: by outflank-mailman (input) for mailman id 152260;
 Wed, 07 Jul 2021 13:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m17hJ-0003FI-PN
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:34:41 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12e8de71-3da8-42be-b3e4-d5d35636c67e;
 Wed, 07 Jul 2021 13:34:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx67DYUWSC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Jul 2021 15:34:30 +0200 (CEST)
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
X-Inumbo-ID: 12e8de71-3da8-42be-b3e4-d5d35636c67e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625664871;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0nhO/PpPjfpLsMrbxcBU//PQhJSjAjPPCwokRgs2DYA=;
    b=d4RfbBVfmqPaR/byPhFsf6d3N3NmZW3N+BxJ1uSSxxb7n2C3RlD2lBbGDUis+wBkV0
    itBkqzlr2n3TVq+c4B71wHcD7EUC5PtnK+8TfKfaTKcaJ7m9u0BzmKVSJIutfTKe2sGX
    78q4+mlw0F4HSfBJu4jmH16XWxIbweLxopc/kY5upxmOHRPhilbhm2CU2APb6L5xInVB
    OTorNuTOrH1+zzw2xL2BR8aw9klXnMe/qELbqNTTfiiFHPUQ9gMqAjn6UEz9nS7LOYzK
    NDNZYZHxeJVieHJDbL+zl0zBOb8pduAm1m5gsjyZiT2WDFq62LdaUpE33i3lcTfVXTOc
    rELA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: how handle domU checkpoints properly
Date: Wed,  7 Jul 2021 15:34:27 +0200
Message-Id: <20210707133427.15679-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During 'xl save -c|-p' the monitoring xl process will exit
because it gets a
LIBXL_EVENT_TYPE_DOMAIN_SHUTDOWN/LIBXL_SHUTDOWN_REASON_SUSPEND event.

While this is correct for plain 'xl save' usage, the result is that
other events such a shutdown/reboot/etc are not handled anymore for
the domU. In case of shutdown the domU must be destroyed manually.

Add a flag to indicate the domU should remain active.
Continue the monitoring loop, make sure further events are received,
wait until the shutdown state changes.

This is incomplete because repeated checkpoint or pause operations are
not handled.

Any idea how to actually implemented 'xl save -p' and 'xl save -c'?

Thanks,
Olaf

---
 tools/xl/Makefile         |  3 ++-
 tools/xl/xl.h             |  1 +
 tools/xl/xl_saverestore.c | 15 ++++++++++++
 tools/xl/xl_vmcontrol.c   | 48 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 656b21c7da..572f4e795f 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -26,6 +26,7 @@ XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
 
 $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
+$(XL_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
 $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs it.
 
@@ -38,7 +39,7 @@ $(XL_OBJS): _paths.h
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..4282435b93 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -300,6 +300,7 @@ typedef enum {
     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
 } domain_restart_type;
 
+#define XL_SAVE_PAUSE_CHECKPOINT "xl-save-pc"
 extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 476d4d9a6a..a04730bb7c 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -21,6 +21,7 @@
 #include <time.h>
 #include <unistd.h>
 
+#include <xenstore.h>
 #include <libxl.h>
 #include <libxl_utils.h>
 #include <libxlutil.h>
@@ -127,6 +128,8 @@ static int save_domain(uint32_t domid, int preserve_domid,
                        const char *filename, int checkpoint,
                        int leavepaused, const char *override_config_file)
 {
+    struct xs_handle *xsh = NULL;
+    char path[80];
     int fd;
     uint8_t *config_data;
     int config_len;
@@ -144,12 +147,24 @@ static int save_domain(uint32_t domid, int preserve_domid,
         fprintf(stderr, "Failed to open temp file %s for writing\n", filename);
         exit(EXIT_FAILURE);
     }
+    if (leavepaused || checkpoint)
+    {
+        snprintf(path, sizeof(path), "/libxl/%u/" XL_SAVE_PAUSE_CHECKPOINT, domid);
+        xsh = xs_open(0);
+        if (xsh)
+            xs_write(xsh, XBT_NULL, path, leavepaused ? "p" : "c", 1);
+    }
 
     save_domain_core_writeconfig(fd, filename, config_data, config_len);
 
     int rc = libxl_domain_suspend(ctx, domid, fd, &props, NULL);
     close(fd);
 
+    if (xsh) {
+        xs_rm(xsh, XBT_NULL, path);
+        xs_close(xsh);
+    }
+
     if (rc < 0) {
         fprintf(stderr, "Failed to save domain, resuming domain\n");
         libxl_domain_resume(ctx, domid, 1, 0);
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..2378f3f9dc 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -22,6 +22,7 @@
 #include <time.h>
 #include <unistd.h>
 
+#include <xenstore.h>
 #include <libxl.h>
 #include <libxl_utils.h>
 #include <libxlutil.h>
@@ -663,6 +664,10 @@ int create_domain(struct domain_create *dom_info)
     int migrate_fd = dom_info->migrate_fd;
     bool config_in_json;
 
+    libxl_event_type type = 0;
+    uint8_t shutdown_reason = 0;
+    bool is_in_suspend = false;
+
     int i;
     int need_daemon = daemonize;
     int ret, rc;
@@ -1029,6 +1034,24 @@ start:
         ret = domain_wait_event(domid, &event);
         if (ret) goto out;
 
+        if (is_in_suspend) {
+            if ( type == event->type && event->u.domain_shutdown.shutdown_reason == shutdown_reason) {
+                struct timespec req = { .tv_nsec = 123456789, };
+                libxl_evdisable_domain_death(ctx, deathw);
+                deathw = NULL;
+                ret = libxl_evenable_domain_death(ctx, domid, 0, &deathw);
+                if (ret) goto out;
+                libxl_event_free(ctx, event);
+                LOG("Domain %u still suspended", domid);
+                nanosleep(&req, NULL);
+                continue;
+            }
+            is_in_suspend = false;
+            LOG("Domain %u left suspend state", domid);
+        }
+        type = event->type;
+        shutdown_reason = event->u.domain_shutdown.shutdown_reason;
+
         switch (event->type) {
 
         case LIBXL_EVENT_TYPE_DOMAIN_SHUTDOWN:
@@ -1090,14 +1113,39 @@ start:
                 goto start;
 
             case DOMAIN_RESTART_NONE:
+                {
+                struct xs_handle *xsh = xs_open(0);
+
+                if (xsh) {
+                    char path[80];
+                    unsigned int len = 0;
+                    char *val;
+
+                    snprintf(path, sizeof(path), "/libxl/%u/" XL_SAVE_PAUSE_CHECKPOINT, domid);
+                    val = xs_read(xsh, XBT_NULL, path, &len);
+                    xs_close(xsh);
+                    LOG("Got %p '%s' from %s, len %u", val, val ?:"", path, len);
+                    free(val);
+                    if (val)
+                    {
+                        is_in_suspend = true;
+                        libxl_evdisable_domain_death(ctx, deathw);
+                        deathw = NULL;
+                        ret = libxl_evenable_domain_death(ctx, domid, 0, &deathw);
+                        if (ret) goto out;
+                        break;
+                    }
+                }
                 LOG("Done. Exiting now");
                 libxl_event_free(ctx, event);
                 ret = 0;
                 goto out;
+                }
 
             default:
                 abort();
             }
+            break;
 
         case LIBXL_EVENT_TYPE_DOMAIN_DEATH:
             LOG("Domain %u has been destroyed.", domid);

