Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8FF3C765A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155684.287437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MyI-0004rY-EW; Tue, 13 Jul 2021 18:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155684.287437; Tue, 13 Jul 2021 18:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MyI-0004oo-Au; Tue, 13 Jul 2021 18:17:30 +0000
Received: by outflank-mailman (input) for mailman id 155684;
 Tue, 13 Jul 2021 18:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Moe-0002kr-Vh
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:33 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d8f4cae-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6NtB9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:23 +0200 (CEST)
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
X-Inumbo-ID: 0d8f4cae-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199583;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=I/lmWw3IgCqn4YYqBC4pCwVLRg7vIlArFuK/FzOA0bI=;
    b=P61u/Ci+HPY72HauyHCN+5Avj8F/wP2x1/Y9Fv4FTdxfsI3QCFWkczjPGfTORgy0vO
    cqvwgUwW5zCnBunpFY8OEhaFhvcnuFuQ/BkGfSMX8v9p2eu3a7bBPSdLOwn1ea1sbLkm
    eHaTMEdUNZcGCogcGWKiayJP3J35Rs8EebntWXkT0F5KUvL3K6nKFllAzBNxr976x6EX
    n42cWcEZgGkeycoTdnZqLAlcEnoTKr0wQn03ig97gGEr+xpKxynRJK10FGiFVxS6lSVZ
    R33gcoNpl+zVc+XNe8/Sd0BEG2KvZhemQgeAS7Fpo0K10mITC0IdVf/rBbGInlcX7V9b
    B24w==
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
Subject: [PATCH v20210713 27/31] tools: add --min_remaining to libxl_domain_suspend
Date: Tue, 13 Jul 2021 20:06:01 +0200
Message-Id: <20210713180605.12096-28-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decision to stop+move a domU to the new host must be based on two factors:
- the available network bandwidth for the migration stream
- the maximum time a workload within a domU can be savely suspended

Both values define how many dirty pages a workload may produce prior the
final stop+move.

The default value of 50 pages is much too low with todays network bandwidths.
On an idle 1GiB link these 200K will be transferred within ~2ms.

Give the admin a knob to adjust the point when the final stop+move will
be done, so he can base this decision on his own needs.

This patch adjusts xl(1) and the libxl API.
External users check LIBXL_HAVE_DOMAIN_SUSPEND_PROPS for the availibility
of the new .min_remaining property.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in              |  8 ++++++++
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dom_save.c |  2 +-
 tools/libs/light/libxl_domain.c   |  1 +
 tools/libs/light/libxl_internal.h |  1 +
 tools/xl/xl_cmdtable.c            | 23 ++++++++++++-----------
 tools/xl/xl_migrate.c             |  9 ++++++++-
 7 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 9b104720d3..a40f1d4ba0 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -500,6 +500,14 @@ possible to use this option for a 'localhost' migration.
 
 Number of copy iterations before final suspend+move (default: 5)
 
+=item B<--min_remaing> I<pages>
+
+Number of remaining dirty pages. If the number of dirty pages drops that
+low, the guest is suspended and the domU will finally be moved to I<host>.
+
+This allows the host admin to control for how long the domU will likely
+be suspended during transit.
+
 =back
 
 =item B<remus> [I<OPTIONS>] I<domain-id> I<host>
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bf77da0524..28d70b1078 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1715,6 +1715,7 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
 typedef struct {
     uint32_t flags; /* LIBXL_SUSPEND_* */
     uint32_t max_iters;
+    uint32_t min_remaining;
 } libxl_domain_suspend_props;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 106c08a199..14e197c581 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -381,7 +381,7 @@ static int libxl__domain_save_precopy_policy(struct precopy_stats stats, void *u
 
     LOGD(DEBUG, shs->domid, "iteration %u dirty_count %ld total_written %lu",
          stats.iteration, stats.dirty_count, stats.total_written);
-    if (stats.dirty_count >= 0 && stats.dirty_count < LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT)
+    if (stats.dirty_count >= 0 && stats.dirty_count < dss->min_remaining)
         goto stop_copy;
     if (stats.iteration >= dss->max_iters)
         goto stop_copy;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 9f98cd7f2b..06ca7a7df6 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -528,6 +528,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
     dss->fd = fd;
     dss->type = type;
     dss->max_iters = props->max_iters ?: LIBXL_XGS_POLICY_MAX_ITERATIONS;
+    dss->min_remaining = props->min_remaining ?: LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT;
     dss->live = props->flags & LIBXL_SUSPEND_LIVE;
     dss->debug = props->flags & LIBXL_SUSPEND_DEBUG;
     dss->checkpointed_stream = LIBXL_CHECKPOINTED_STREAM_NONE;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cfb83d80d7..c503fe156c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3649,6 +3649,7 @@ struct libxl__domain_save_state {
     int debug;
     int checkpointed_stream;
     uint32_t max_iters;
+    uint32_t min_remaining;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 678b236d76..e10b580261 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -165,17 +165,18 @@ const struct cmd_spec cmd_table[] = {
       &main_migrate, 0, 1,
       "Migrate a domain to another host",
       "[options] <Domain> <host>",
-      "-h              Print this help.\n"
-      "-C <config>     Send <config> instead of config file from creation.\n"
-      "-s <sshcommand> Use <sshcommand> instead of ssh.  String will be passed\n"
-      "                to sh. If empty, run <host> instead of ssh <host> xl\n"
-      "                migrate-receive [-d -e]\n"
-      "-e              Do not wait in the background (on <host>) for the death\n"
-      "                of the domain.\n"
-      "--debug         Enable verification mode.\n"
-      "-p              Do not unpause domain after migrating it.\n"
-      "-D              Preserve the domain id\n"
-      "--max_iters N   Number of copy iterations before final stop+move"
+      "-h                Print this help.\n"
+      "-C <config>       Send <config> instead of config file from creation.\n"
+      "-s <sshcommand>   Use <sshcommand> instead of ssh.  String will be passed\n"
+      "                  to sh. If empty, run <host> instead of ssh <host> xl\n"
+      "                  migrate-receive [-d -e]\n"
+      "-e                Do not wait in the background (on <host>) for the death\n"
+      "                  of the domain.\n"
+      "--debug           Enable verification mode.\n"
+      "-p                Do not unpause domain after migrating it.\n"
+      "-D                Preserve the domain id\n"
+      "--max_iters N     Number of copy iterations before final stop+move\n"
+      "--min_remaining N Number of remaining dirty pages before final stop+move"
     },
     { "restore",
       &main_restore, 0, 1,
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index af117d4d56..14feb2b7ec 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -179,6 +179,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 static void migrate_domain(uint32_t domid, int preserve_domid,
                            const char *rune, int debug,
                            uint32_t max_iters,
+                           uint32_t min_remaining,
                            const char *override_config_file)
 {
     pid_t child = -1;
@@ -191,6 +192,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     libxl_domain_suspend_props props = {
         .flags = LIBXL_SUSPEND_LIVE,
         .max_iters = max_iters,
+        .min_remaining = min_remaining,
         };
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
@@ -545,9 +547,11 @@ int main_migrate(int argc, char **argv)
     int opt, daemonize = 1, monitor = 1, debug = 0, pause_after_migration = 0;
     int preserve_domid = 0;
     uint32_t max_iters = 0;
+    uint32_t min_remaining = 0;
     static struct option opts[] = {
         {"debug", 0, 0, 0x100},
         {"max_iters", 1, 0, 0x101},
+        {"min_remaining", 1, 0, 0x102},
         {"live", 0, 0, 0x200},
         COMMON_LONG_OPTS
     };
@@ -578,6 +582,9 @@ int main_migrate(int argc, char **argv)
     case 0x101: /* --max_iters */
         max_iters = atoi(optarg);
         break;
+    case 0x102: /* --min_remaining */
+        min_remaining = atoi(optarg);
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -613,7 +620,7 @@ int main_migrate(int argc, char **argv)
     }
 
     migrate_domain(domid, preserve_domid, rune, debug,
-                   max_iters, config_filename);
+                   max_iters, min_remaining, config_filename);
     return EXIT_SUCCESS;
 }
 

