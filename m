Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897042F1D0D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65233.115630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Ke-0006xU-DQ; Mon, 11 Jan 2021 17:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65233.115630; Mon, 11 Jan 2021 17:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Ke-0006wl-8n; Mon, 11 Jan 2021 17:50:20 +0000
Received: by outflank-mailman (input) for mailman id 65233;
 Mon, 11 Jan 2021 17:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Ev-0002a6-2j
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:25 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [85.215.255.123])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b148e679-8494-41ca-9505-9e59100929d4;
 Mon, 11 Jan 2021 17:42:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgiM3u
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:44 +0100 (CET)
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
X-Inumbo-ID: b148e679-8494-41ca-9505-9e59100929d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386972;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=QU2QRd5WHVPQzVW590S5bSdbksrnSDdpGQx8+LIpkr4=;
	b=AiUUtqZUi5h+232/jkWd2k62gPZiS8bea5G7TLd5Wa8zQabaUjfwxQ8BbxofOPnqUp
	HqR+So8VuPXjd7CU4n7T4Tvm6hmTyZgpz3UzBmLyFafZLuclGe4RYAvEcyIHZwE4zTzq
	3BpIU86QJxe3+fi3OlaMU8+Eh5d2HdR+PcN8bdLy5tF5OlZWczVvPxwpt1vYv/WIhll3
	t3CMCW1wrJIrXF2SKSa/i+y3qKcuXZbABOJAnIK9ePLMubHP07JghOGpAS+6hmdeTR7m
	/jqOdK2QqluXBry9BGKIZlGxMBxv0qVy9FM16grEGA255KRWky7HL9QklzkGsTiCxPU0
	O8ZA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 39/39] tools: add --abort_if_busy to libxl_domain_suspend
Date: Mon, 11 Jan 2021 18:42:24 +0100
Message-Id: <20210111174224.24714-40-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a knob to the host admin to abort the live migration of a
running domU if the downtime during final transit will be too long
for the workload within domU.

Adjust error reporting. Add ERROR_MIGRATION_ABORTED to allow callers of
libxl_domain_suspend to distinguish between errors and the requested
constraint.

Adjust precopy_policy to simplify reporting of remaining dirty pages.
The loop in send_memory_live populates ->dirty_count in a different
place than ->iteration. Let it proceeed one more time to provide the
desired information before leaving the loop.

This patch adjusts xl(1) and the libxl API.
External users check LIBXL_HAVE_DOMAIN_SUSPEND_PROPS for the availibility
of the new .abort_if_busy property.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in                  |  8 +++++++
 tools/include/libxl.h                 |  1 +
 tools/libs/light/libxl_dom_save.c     |  7 ++++++-
 tools/libs/light/libxl_domain.c       |  1 +
 tools/libs/light/libxl_internal.h     |  2 ++
 tools/libs/light/libxl_stream_write.c |  9 +++++++-
 tools/libs/light/libxl_types.idl      |  1 +
 tools/xl/xl_cmdtable.c                |  6 +++++-
 tools/xl/xl_migrate.c                 | 30 ++++++++++++++++++++-------
 9 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 930270fe23..8064acb226 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -508,6 +508,14 @@ low, the guest is suspended and the domU will finally be moved to I<host>.
 This allows the host admin to control for how long the domU will likely
 be suspended during transit.
 
+=item B<--abort_if_busy>
+
+Abort migration instead of doing final suspend/move/resume if the
+guest produced more than I<min_remaining> dirty pages during th number
+of I<max_iters> iterations.
+This avoids long periods of time where the guest is suspended, which
+may confuse the workload within domU.
+
 =back
 
 =item B<remus> [I<OPTIONS>] I<domain-id> I<host>
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d45d3a4460..ad660e9c9f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1680,6 +1680,7 @@ typedef struct {
 } libxl_domain_suspend_props;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
+#define LIBXL_SUSPEND_ABORT_IF_BUSY 4
 
 int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
                          libxl_domain_suspend_props *props,
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index ad5df89b2c..1999a8997f 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -383,11 +383,16 @@ static int libxl__domain_save_precopy_policy(precopy_stats_t stats, void *user)
          stats.iteration, stats.dirty_count, stats.total_written);
     if (stats.dirty_count >= 0 && stats.dirty_count < dss->min_remaining)
         goto stop_copy;
-    if (stats.iteration >= dss->max_iters)
+    if (stats.dirty_count >= 0 && stats.iteration >= dss->max_iters)
         goto stop_copy;
     return XGS_POLICY_CONTINUE_PRECOPY;
 
 stop_copy:
+    if (dss->abort_if_busy)
+    {
+        dss->remaining_dirty_pages = stats.dirty_count;
+        return XGS_POLICY_ABORT;
+    }
     return XGS_POLICY_STOP_AND_COPY;
 }
 
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index ae4dc9ad01..913653bd76 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -529,6 +529,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
     dss->type = type;
     dss->max_iters = props->max_iters ?: LIBXL_XGS_POLICY_MAX_ITERATIONS;
     dss->min_remaining = props->min_remaining ?: LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT;
+    dss->abort_if_busy = props->flags & LIBXL_SUSPEND_ABORT_IF_BUSY;
     dss->live = props->flags & LIBXL_SUSPEND_LIVE;
     dss->debug = props->flags & LIBXL_SUSPEND_DEBUG;
     dss->checkpointed_stream = LIBXL_CHECKPOINTED_STREAM_NONE;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index d7631022a0..c08918b37b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3639,9 +3639,11 @@ struct libxl__domain_save_state {
     libxl_domain_type type;
     int live;
     int debug;
+    int abort_if_busy;
     int checkpointed_stream;
     uint32_t max_iters;
     uint32_t min_remaining;
+    long remaining_dirty_pages;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
index 634f3240d1..1ab3943f3e 100644
--- a/tools/libs/light/libxl_stream_write.c
+++ b/tools/libs/light/libxl_stream_write.c
@@ -344,11 +344,18 @@ void libxl__xc_domain_save_done(libxl__egc *egc, void *dss_void,
         goto err;
 
     if (retval) {
+        if (dss->remaining_dirty_pages) {
+            LOGD(NOTICE, dss->domid, "saving domain: aborted,"
+                 " %ld remaining dirty pages.", dss->remaining_dirty_pages);
+        } else {
         LOGEVD(ERROR, errnoval, dss->domid, "saving domain: %s",
               dss->dsps.guest_responded ?
               "domain responded to suspend request" :
               "domain did not respond to suspend request");
-        if (!dss->dsps.guest_responded)
+        }
+        if (dss->remaining_dirty_pages)
+           rc = ERROR_MIGRATION_ABORTED;
+        else if(!dss->dsps.guest_responded)
             rc = ERROR_GUEST_TIMEDOUT;
         else if (dss->rc)
             rc = dss->rc;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b7..1901122b6d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -76,6 +76,7 @@ libxl_error = Enumeration("error", [
     (-30, "QMP_DEVICE_NOT_ACTIVE"), # a device has failed to be become active
     (-31, "QMP_DEVICE_NOT_FOUND"), # the requested device has not been found
     (-32, "QEMU_API"), # QEMU's replies don't contains expected members
+    (-33, "MIGRATION_ABORTED"),
     ], value_namespace = "")
 
 libxl_domain_type = Enumeration("domain_type", [
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 2c1acaf536..41292f3b5a 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,11 @@ struct cmd_spec cmd_table[] = {
       "-p                Do not unpause domain after migrating it.\n"
       "-D                Preserve the domain id\n"
       "--max_iters N     Number of copy iterations before final stop+move\n"
-      "--min_remaining N Number of remaining dirty pages before final stop+move"
+      "--min_remaining N Number of remaining dirty pages before final stop+move\n"
+      "--abort_if_busy   Abort migration instead of doing final stop+move,\n"
+      "                  if the number of dirty pages is higher than <min_remaining>\n"
+      "                  after <max_iters> iterations. Otherwise the amount of memory\n"
+      "                  to be transfered would exceed maximum allowed domU downtime."
     },
     { "restore",
       &main_restore, 0, 1,
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index fd826f671b..68fdc8630a 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -179,7 +179,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 }
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
-                           const char *rune, int debug,
+                           const char *rune, int debug, int abort_if_busy,
                            uint32_t max_iters,
                            uint32_t min_remaining,
                            const char *override_config_file)
@@ -218,14 +218,20 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
 
     if (debug)
         props.flags |= LIBXL_SUSPEND_DEBUG;
+    if (abort_if_busy)
+        props.flags |= LIBXL_SUSPEND_ABORT_IF_BUSY;
     rc = libxl_domain_suspend(ctx, domid, send_fd, &props, NULL);
     if (rc) {
         fprintf(stderr, "migration sender: libxl_domain_suspend failed"
                 " (rc=%d)\n", rc);
-        if (rc == ERROR_GUEST_TIMEDOUT)
-            goto failed_suspend;
-        else
-            goto failed_resume;
+        switch (rc) {
+            case ERROR_GUEST_TIMEDOUT:
+                goto failed_suspend;
+            case ERROR_MIGRATION_ABORTED:
+                goto failed_busy;
+            default:
+                goto failed_resume;
+        }
     }
 
     //fprintf(stderr, "migration sender: Transfer complete.\n");
@@ -307,6 +313,12 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     fprintf(stderr, "Migration failed, failed to suspend at sender.\n");
     exit(EXIT_FAILURE);
 
+ failed_busy:
+    close(send_fd);
+    migration_child_report(recv_fd);
+    fprintf(stderr, "Migration aborted as requested, domain is too busy.\n");
+    exit(EXIT_FAILURE);
+
  failed_resume:
     close(send_fd);
     migration_child_report(recv_fd);
@@ -558,13 +570,14 @@ int main_migrate(int argc, char **argv)
     char *rune = NULL;
     char *host;
     int opt, daemonize = 1, monitor = 1, debug = 0, pause_after_migration = 0;
-    int preserve_domid = 0;
+    int preserve_domid = 0, abort_if_busy = 0;
     uint32_t max_iters = 0;
     uint32_t min_remaining = 0;
     static struct option opts[] = {
         {"debug", 0, 0, 0x100},
         {"max_iters", 1, 0, 0x101},
         {"min_remaining", 1, 0, 0x102},
+        {"abort_if_busy", 0, 0, 0x103},
         {"live", 0, 0, 0x200},
         COMMON_LONG_OPTS
     };
@@ -601,6 +614,9 @@ int main_migrate(int argc, char **argv)
     case 0x102: /* --min_remaining */
         min_remaining = atoi(optarg);
         break;
+    case 0x103: /* --abort_if_busy */
+        abort_if_busy = 1;
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -635,7 +651,7 @@ int main_migrate(int argc, char **argv)
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug,
+    migrate_domain(domid, preserve_domid, rune, debug, abort_if_busy,
                    max_iters, min_remaining, config_filename);
     return EXIT_SUCCESS;
 }

