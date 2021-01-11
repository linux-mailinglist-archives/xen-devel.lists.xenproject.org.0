Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6E2F1D05
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65204.115546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1K9-0005ZB-Lr; Mon, 11 Jan 2021 17:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65204.115546; Mon, 11 Jan 2021 17:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1K9-0005YP-HJ; Mon, 11 Jan 2021 17:49:49 +0000
Received: by outflank-mailman (input) for mailman id 65204;
 Mon, 11 Jan 2021 17:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1F0-0002aB-SW
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:30 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [81.169.146.179])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ac41a5e-c454-494d-8408-e2d54f010f34;
 Mon, 11 Jan 2021 17:42:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgiM3s
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
X-Inumbo-ID: 2ac41a5e-c454-494d-8408-e2d54f010f34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386972;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=8XWlz5pSfje1vVBGoIEwLVKdGGr6E/FoJ4LYCtkErHQ=;
	b=ZimbWorYXsp/nhZsl9EtCIrk1qv9sLRHVRtjkBquntu/XEa5fH8N+VssPD4TYQ6BP2
	BmpZevWh9Etm7WoD8qQQy4Cd2+LlWnOopHGEFiDhu4ztlnqXcZZdKFUTt7kMVrFHJr5c
	erFgrOetMmeL7yrS1/RWrZz45dlZW2Rt5RauwiF5GpF0OQaWw9YDC/IE+gkM3wNuhrbe
	imyTVbF60nGdLvRiiVgllv1EsFE/WmCftMYrEU+ICpSkmNKYigYgJe6vTZpl1DWujRn5
	Y8GfX/kU9DhTlPnehtcPf44ht9V3Q58K2HLYTL6zH1Bretig8Fo1LcpT5TqAZdXRPxUW
	knLQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 38/39] tools: add --min_remaining to libxl_domain_suspend
Date: Mon, 11 Jan 2021 18:42:23 +0100
Message-Id: <20210111174224.24714-39-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
 tools/xl/xl_cmdtable.c            | 25 +++++++++++++------------
 tools/xl/xl_migrate.c             |  9 ++++++++-
 7 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 8339bd8e6f..930270fe23 100644
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
index 646cef28aa..d45d3a4460 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1676,6 +1676,7 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
 typedef struct {
     uint32_t flags; /* LIBXL_SUSPEND_* */
     uint32_t max_iters;
+    uint32_t min_remaining;
 } libxl_domain_suspend_props;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 938c0127f3..ad5df89b2c 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -381,7 +381,7 @@ static int libxl__domain_save_precopy_policy(precopy_stats_t stats, void *user)
 
     LOGD(DEBUG, shs->domid, "iteration %u dirty_count %ld total_written %lu",
          stats.iteration, stats.dirty_count, stats.total_written);
-    if (stats.dirty_count >= 0 && stats.dirty_count < LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT)
+    if (stats.dirty_count >= 0 && stats.dirty_count < dss->min_remaining)
         goto stop_copy;
     if (stats.iteration >= dss->max_iters)
         goto stop_copy;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 612d3dc4ea..ae4dc9ad01 100644
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
index 80a31c3a88..d7631022a0 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3641,6 +3641,7 @@ struct libxl__domain_save_state {
     int debug;
     int checkpointed_stream;
     uint32_t max_iters;
+    uint32_t min_remaining;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 75e2e4d54b..2c1acaf536 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -160,18 +160,19 @@ struct cmd_spec cmd_table[] = {
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
-      "-T              Show timestamps during the migration process.\n"
-      "--debug         Verify transferred domU page data.\n"
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
+      "-T                Show timestamps during the migration process.\n"
+      "--debug           Verify transferred domU page data.\n"
+      "-p                Do not unpause domain after migrating it.\n"
+      "-D                Preserve the domain id\n"
+      "--max_iters N     Number of copy iterations before final stop+move\n"
+      "--min_remaining N Number of remaining dirty pages before final stop+move"
     },
     { "restore",
       &main_restore, 0, 1,
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index a724bc21ea..fd826f671b 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -181,6 +181,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 static void migrate_domain(uint32_t domid, int preserve_domid,
                            const char *rune, int debug,
                            uint32_t max_iters,
+                           uint32_t min_remaining,
                            const char *override_config_file)
 {
     pid_t child = -1;
@@ -193,6 +194,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     libxl_domain_suspend_props props = {
         .flags = LIBXL_SUSPEND_LIVE,
         .max_iters = max_iters,
+        .min_remaining = min_remaining,
         };
     unsigned xtl_flags = XTL_STDIOSTREAM_HIDE_PROGRESS;
 
@@ -558,9 +560,11 @@ int main_migrate(int argc, char **argv)
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
@@ -594,6 +598,9 @@ int main_migrate(int argc, char **argv)
     case 0x101: /* --max_iters */
         max_iters = atoi(optarg);
         break;
+    case 0x102: /* --min_remaining */
+        min_remaining = atoi(optarg);
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -629,7 +636,7 @@ int main_migrate(int argc, char **argv)
     }
 
     migrate_domain(domid, preserve_domid, rune, debug,
-                   max_iters, config_filename);
+                   max_iters, min_remaining, config_filename);
     return EXIT_SUCCESS;
 }
 

