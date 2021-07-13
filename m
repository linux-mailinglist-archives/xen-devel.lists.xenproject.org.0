Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6543C7654
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155633.287382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxI-0001Kp-P9; Tue, 13 Jul 2021 18:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155633.287382; Tue, 13 Jul 2021 18:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxI-0001Hy-Ji; Tue, 13 Jul 2021 18:16:28 +0000
Received: by outflank-mailman (input) for mailman id 155633;
 Tue, 13 Jul 2021 18:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mob-0002UL-I1
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:29 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a8a3ea9-6210-4d4a-a421-7fa78117dac6;
 Tue, 13 Jul 2021 18:06:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6MtB8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:22 +0200 (CEST)
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
X-Inumbo-ID: 4a8a3ea9-6210-4d4a-a421-7fa78117dac6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199582;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=qvO8GzSJw/Kk2FcJhvVEgMzp+lMjpREiYaCjuaK8qSw=;
    b=tRRttb8vYOfgsZYnk/bwRjPm3BeTUdiaQl7IH/iqlKEtzSmz+Bn1+jQkHPc0IY+DPn
    eUIrgIr9sF1AqdAOP2hzxZIBm11miE8FvBL+/wQ2YSPUXbnndr6uUC8tLbSNBUWvLuqr
    3kPGrTt2IzUTajYkDAYHwTo2Awnuqjsib7P6kiYBV3N5wgXeTY92vG9iK/BHM71rKGW1
    UQdz/Ovoa87e8vAMjO7Nn+KVjbTtw3v4cj0V3+/tnbSQHspe8vR2g6zNkLFAo9NEdeu1
    bip6bV7QhBTTNXnmP71pvmwjNNkmkbas+EMTtddKZpXpxBXKyx4WRc88qPDZc+Prf5l7
    IlFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 26/31] tools: add --max_iters to libxl_domain_suspend
Date: Tue, 13 Jul 2021 20:06:00 +0200
Message-Id: <20210713180605.12096-27-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrating a large, and potentially busy, domU will take more
time than neccessary due to excessive number of copying iterations.

Allow to host admin to control the number of iterations which
copy cumulated domU dirty pages to the target host.

The default remains 5, which means one initial iteration to copy the
entire domU memory, and up to 4 additional iterations to copy dirty
memory from the still running domU. After the given number of iterations
the domU is suspended, remaining dirty memory is copied and the domU is
finally moved to the target host.

This patch adjusts xl(1) and the libxl API.
External users check LIBXL_HAVE_DOMAIN_SUSPEND_PROPS for the availibility
of the new .max_iters property.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in              |  4 ++++
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dom_save.c |  2 +-
 tools/libs/light/libxl_domain.c   |  1 +
 tools/libs/light/libxl_internal.h |  1 +
 tools/xl/xl_cmdtable.c            |  3 ++-
 tools/xl/xl_migrate.c             | 10 +++++++++-
 7 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bae557b1de..9b104720d3 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -496,6 +496,10 @@ such that it will be identical on the destination host, unless that
 configuration is overridden using the B<-C> option. Note that it is not
 possible to use this option for a 'localhost' migration.
 
+=item B<--max_iters> I<iterations>
+
+Number of copy iterations before final suspend+move (default: 5)
+
 =back
 
 =item B<remus> [I<OPTIONS>] I<domain-id> I<host>
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 9a4d7514ed..bf77da0524 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1714,6 +1714,7 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
 
 typedef struct {
     uint32_t flags; /* LIBXL_SUSPEND_* */
+    uint32_t max_iters;
 } libxl_domain_suspend_props;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 839e061881..106c08a199 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -383,7 +383,7 @@ static int libxl__domain_save_precopy_policy(struct precopy_stats stats, void *u
          stats.iteration, stats.dirty_count, stats.total_written);
     if (stats.dirty_count >= 0 && stats.dirty_count < LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT)
         goto stop_copy;
-    if (stats.iteration >= LIBXL_XGS_POLICY_MAX_ITERATIONS)
+    if (stats.iteration >= dss->max_iters)
         goto stop_copy;
     return XGS_POLICY_CONTINUE_PRECOPY;
 
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5dbd27900f..9f98cd7f2b 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -527,6 +527,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
     dss->domid = domid;
     dss->fd = fd;
     dss->type = type;
+    dss->max_iters = props->max_iters ?: LIBXL_XGS_POLICY_MAX_ITERATIONS;
     dss->live = props->flags & LIBXL_SUSPEND_LIVE;
     dss->debug = props->flags & LIBXL_SUSPEND_DEBUG;
     dss->checkpointed_stream = LIBXL_CHECKPOINTED_STREAM_NONE;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index f7df4ab397..cfb83d80d7 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3648,6 +3648,7 @@ struct libxl__domain_save_state {
     int live;
     int debug;
     int checkpointed_stream;
+    uint32_t max_iters;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index e4f27a3248..678b236d76 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -174,7 +174,8 @@ const struct cmd_spec cmd_table[] = {
       "                of the domain.\n"
       "--debug         Enable verification mode.\n"
       "-p              Do not unpause domain after migrating it.\n"
-      "-D              Preserve the domain id"
+      "-D              Preserve the domain id\n"
+      "--max_iters N   Number of copy iterations before final stop+move"
     },
     { "restore",
       &main_restore, 0, 1,
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 144890924f..af117d4d56 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -178,6 +178,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
                            const char *rune, int debug,
+                           uint32_t max_iters,
                            const char *override_config_file)
 {
     pid_t child = -1;
@@ -189,6 +190,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     int config_len;
     libxl_domain_suspend_props props = {
         .flags = LIBXL_SUSPEND_LIVE,
+        .max_iters = max_iters,
         };
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
@@ -542,8 +544,10 @@ int main_migrate(int argc, char **argv)
     char *host;
     int opt, daemonize = 1, monitor = 1, debug = 0, pause_after_migration = 0;
     int preserve_domid = 0;
+    uint32_t max_iters = 0;
     static struct option opts[] = {
         {"debug", 0, 0, 0x100},
+        {"max_iters", 1, 0, 0x101},
         {"live", 0, 0, 0x200},
         COMMON_LONG_OPTS
     };
@@ -571,6 +575,9 @@ int main_migrate(int argc, char **argv)
     case 0x100: /* --debug */
         debug = 1;
         break;
+    case 0x101: /* --max_iters */
+        max_iters = atoi(optarg);
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -605,7 +612,8 @@ int main_migrate(int argc, char **argv)
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug, config_filename);
+    migrate_domain(domid, preserve_domid, rune, debug,
+                   max_iters, config_filename);
     return EXIT_SUCCESS;
 }
 

