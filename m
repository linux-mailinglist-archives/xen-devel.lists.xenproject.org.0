Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE913977C5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135042.251298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71l-0004mz-HQ; Tue, 01 Jun 2021 16:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135042.251298; Tue, 01 Jun 2021 16:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71l-0004hX-C2; Tue, 01 Jun 2021 16:14:01 +0000
Received: by outflank-mailman (input) for mailman id 135042;
 Tue, 01 Jun 2021 16:14:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70b-0005X1-1Q
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:49 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1b21753-71d3-4abf-ae18-17f60e97b2ba;
 Tue, 01 Jun 2021 16:11:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBe1Bd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:40 +0200 (CEST)
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
X-Inumbo-ID: b1b21753-71d3-4abf-ae18-17f60e97b2ba
ARC-Seal: i=1; a=rsa-sha256; t=1622563900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=i+C0lQTgDG0B7xQdUrq1nGARbLlZYl/nskb/IwQqsimOXTONDE4qYhKz0EIZRSeyGI
    kPOf2EHOxTlezAkGdwnYfP+CeKb91xfiO84YmOpM50zFgiHUGtV+hsATK882h0DXLwVL
    Lz5Tk+cmXopFFVsMgIm/Eo6fBX+Kl9TK3KIq8gJmN9UhMf/QbRx0ohkD/RPcZlktqw55
    AJKU8pNZb3iqoJ4kwXjT8uUMDbVgjQ96UlYBhVEJuCKQq3EjVPUV7JIOiM4sStSNYtbb
    FcBT8EoTt1xW+IwKuhYnyUEeFgWPhengL+5LXTJLKR+fHmps7fd0gw7B286Z/xm4Jqeb
    UoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yHDLzQ8w0aK0NM0b+OJIaVk/C7sbn6MbRiUz15zozj8=;
    b=d1xKl9YT8gYggHF5Kk4WO0b/XgA5dzP7xLE7XBNmgBHFLQ/qTdP3P8ueLlMSgIlP83
    MfkfO/b+BqIBN6v9h3/jFtKF/ZEwez+4+Syo5Z12ehaWT2UGRCy09AAwceXPtSCbmQbE
    ZUbLDjmIOatdcAmz2PD5ytZgvPP4QyZgn3T+BmX4zwmmU25fdRyjfiovRiCH5BJsDNvh
    MZU6u3k0FiGQLC3OP4XhBqsGG5c+INKdQzfTPJtkEZYhYCY5fplppUeGT2K5/tq9cTvY
    CTn1l/ETDXRM96seNcMDcfwogR9kAJLfZ6xMvwG0+/tWmi59nP5JxDKhx3wK9bHarIXv
    ieuQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yHDLzQ8w0aK0NM0b+OJIaVk/C7sbn6MbRiUz15zozj8=;
    b=r9kc6tUP5PACoqGznsVAKLelvJDqMmOq9/jpHmb6tX7eUOR1APn7wPVAzU2spubTo0
    d3H6+T7e1lFZP9IqvP+qmaVf0TNRjlImB2OeTyqPORuS0il+wXU/xHUgm6jVCBt9ScCV
    Q62bdvENTBdIZmNXQbtcD4Ra60HRrl8OaekaFXaL44WxvHOaKn9dWPDJtd230oaVMOTt
    wtAwWWmhzgM+wHK/0cLRckzTFPK5LOs6lnXuHCihdD0mEI3F/wG7ng8yJ5yhRZO5XeMo
    R9kR2m0N/Lw4T2cpJ7E2loAmfCBxu92g0MjTltSEHQeC0Gxh5reugUuTa2bwnIyoeGJe
    D2sA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210601 33/38] tools: add --abort_if_busy to libxl_domain_suspend
Date: Tue,  1 Jun 2021 18:11:13 +0200
Message-Id: <20210601161118.18986-34-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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
index 43609f6cdd..b258d56ab6 100644
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
index 28d70b1078..cc056ed627 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1719,6 +1719,7 @@ typedef struct {
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
index 63028586fe..7453a3aa7b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3640,9 +3640,11 @@ struct libxl__domain_save_state {
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
index f45adddab0..b91769ee10 100644
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
index acb84e3486..6c9de3bdec 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -176,7 +176,11 @@ const struct cmd_spec cmd_table[] = {
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
index 14feb2b7ec..f523746e5b 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -177,7 +177,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 }
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
-                           const char *rune, int debug,
+                           const char *rune, int debug, int abort_if_busy,
                            uint32_t max_iters,
                            uint32_t min_remaining,
                            const char *override_config_file)
@@ -213,14 +213,20 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
 
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
@@ -302,6 +308,12 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
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
@@ -545,13 +557,14 @@ int main_migrate(int argc, char **argv)
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
@@ -585,6 +598,9 @@ int main_migrate(int argc, char **argv)
     case 0x102: /* --min_remaining */
         min_remaining = atoi(optarg);
         break;
+    case 0x103: /* --abort_if_busy */
+        abort_if_busy = 1;
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -619,7 +635,7 @@ int main_migrate(int argc, char **argv)
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug,
+    migrate_domain(domid, preserve_domid, rune, debug, abort_if_busy,
                    max_iters, min_remaining, config_filename);
     return EXIT_SUCCESS;
 }

