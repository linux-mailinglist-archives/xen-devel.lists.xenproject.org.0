Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CF2F1D0C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65230.115616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kb-0006sV-1z; Mon, 11 Jan 2021 17:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65230.115616; Mon, 11 Jan 2021 17:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Ka-0006rU-Tk; Mon, 11 Jan 2021 17:50:16 +0000
Received: by outflank-mailman (input) for mailman id 65230;
 Mon, 11 Jan 2021 17:50:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Ev-0002aB-SL
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:25 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 656bd11a-fcf0-4f71-8cdd-62a1aed38957;
 Mon, 11 Jan 2021 17:42:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHghM3r
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:43 +0100 (CET)
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
X-Inumbo-ID: 656bd11a-fcf0-4f71-8cdd-62a1aed38957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386970;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=NczH/GYAICCIPBmta0b9hUDcufP3DKYBj+C1mc/v8to=;
	b=LCPzP+xHi4U7QeCZCBeP8XhIsAXYefrDGcLN18ASQsq3XfQHdGOp4kW1+PhRv27CMK
	oPBmG3ktUWJ/C/CNH7Fdk8H/rcRk+UsMisPc70hTmaftLyVs2Ghj6nCoILnTSsdAAGgJ
	ybaT7URtbAEK1qc4gi8uxZHodHQ4o+zinhe+4H2nFBKbXky8kuyHurWx0204a6ut9App
	zcmpWlX5XkQiN6vlDQEs06BITpyxpBmQfk3LODKr3o+5Ul2jWw5zt81+jcXXDhhEBoNU
	MkItpVlTZVFXb2PYw2NIuwbt8qtJOby+jmffFIr9cmICJamDlKySrb/rS+371aMhkxtl
	k7tA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 37/39] tools: add --max_iters to libxl_domain_suspend
Date: Mon, 11 Jan 2021 18:42:22 +0100
Message-Id: <20210111174224.24714-38-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
index e6e4e8e83a..8339bd8e6f 100644
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
index 94b8f1095f..646cef28aa 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1675,6 +1675,7 @@ static inline int libxl_retrieve_domain_configuration_0x041200(
 
 typedef struct {
     uint32_t flags; /* LIBXL_SUSPEND_* */
+    uint32_t max_iters;
 } libxl_domain_suspend_props;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 3f3cff0342..938c0127f3 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -383,7 +383,7 @@ static int libxl__domain_save_precopy_policy(precopy_stats_t stats, void *user)
          stats.iteration, stats.dirty_count, stats.total_written);
     if (stats.dirty_count >= 0 && stats.dirty_count < LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT)
         goto stop_copy;
-    if (stats.iteration >= LIBXL_XGS_POLICY_MAX_ITERATIONS)
+    if (stats.iteration >= dss->max_iters)
         goto stop_copy;
     return XGS_POLICY_CONTINUE_PRECOPY;
 
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 45e0c57c3a..612d3dc4ea 100644
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
index d4cc694c01..80a31c3a88 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3640,6 +3640,7 @@ struct libxl__domain_save_state {
     int live;
     int debug;
     int checkpointed_stream;
+    uint32_t max_iters;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index a0567169bf..75e2e4d54b 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -170,7 +170,8 @@ struct cmd_spec cmd_table[] = {
       "-T              Show timestamps during the migration process.\n"
       "--debug         Verify transferred domU page data.\n"
       "-p              Do not unpause domain after migrating it.\n"
-      "-D              Preserve the domain id"
+      "-D              Preserve the domain id\n"
+      "--max_iters N   Number of copy iterations before final stop+move"
     },
     { "restore",
       &main_restore, 0, 1,
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index fc9f69bf06..a724bc21ea 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -180,6 +180,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
                            const char *rune, int debug,
+                           uint32_t max_iters,
                            const char *override_config_file)
 {
     pid_t child = -1;
@@ -191,6 +192,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     int config_len;
     libxl_domain_suspend_props props = {
         .flags = LIBXL_SUSPEND_LIVE,
+        .max_iters = max_iters,
         };
     unsigned xtl_flags = XTL_STDIOSTREAM_HIDE_PROGRESS;
 
@@ -555,8 +557,10 @@ int main_migrate(int argc, char **argv)
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
@@ -587,6 +591,9 @@ int main_migrate(int argc, char **argv)
     case 0x100: /* --debug */
         debug = 1;
         break;
+    case 0x101: /* --max_iters */
+        max_iters = atoi(optarg);
+        break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
@@ -621,7 +628,8 @@ int main_migrate(int argc, char **argv)
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug, config_filename);
+    migrate_domain(domid, preserve_domid, rune, debug,
+                   max_iters, config_filename);
     return EXIT_SUCCESS;
 }
 

