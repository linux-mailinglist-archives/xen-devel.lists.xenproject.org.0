Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB63A9B99
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143007.263845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGH-00058k-MX; Wed, 16 Jun 2021 13:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143007.263845; Wed, 16 Jun 2021 13:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGH-00055a-EL; Wed, 16 Jun 2021 13:07:17 +0000
Received: by outflank-mailman (input) for mailman id 143007;
 Wed, 16 Jun 2021 13:07:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2i-0006lZ-3Z
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:53:16 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e4d266-6a6e-47b8-9f53-83a45b230a53;
 Wed, 16 Jun 2021 12:51:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpmtmS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:48 +0200 (CEST)
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
X-Inumbo-ID: 05e4d266-6a6e-47b8-9f53-83a45b230a53
ARC-Seal: i=1; a=rsa-sha256; t=1623847908; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ZbwVa8IxdPe/2U3g4S2BClLR/Cr7UXEm8XD35g25MdfwgOrqBZpW96bhOttC6rb6gK
    9HckDwzfn+BKqN+1vnCvN4CoobKCcGEphFzFv1VPU1zzS7Swmql2Fo1imdSWDaNZYvR0
    PlbQZY8/mdiFAyso+hVGBIlamek6TRRRp5/DSrdmbEfL1z76EmCJRi+MZe2g+W09//zr
    asgdVc5f9AChs1wOqHyUT9qoVFJI2FdPKADui8UsEfHSed1c8uiSMvgcbvnhmi+6VRHy
    LRJVYucZbDiweZu5r2ZXEUlJQTroq0z9KpU/gAY0JOkbse7D6jOEqi7HW/Jxv28f4QST
    el/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847908;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=qkM58ppJmICGaCKigNV7+3gfD18mpe/eRIOurb3atVw=;
    b=Z5AwzOS5tlCd6dyHSwzl3gKPr3NJ5sEnwkYAZ0wVtfyAezpPtqoI1xzm/YQ0wLvuR9
    ucTuuNxURAYY1+CIIiHwlB+8zwwKvFJryu08NSs85n3ZtWPuL4jhT0Sr8eU1rKOB36XZ
    JF+nwOnb5ZRa2/IjNJZHMnCH6U387/YI2rGi07RwjF7tOIlTGnpBVzn++SV4AgC9Hzok
    CPjPPrQ0DlqvMirP44BWXae5LHvspeFF0w0laPbW1R8QQLGaagla8hzyfDKTpPe629+G
    3akUkjx1soX91T0+IJBH+cm4sptvmvvzLH0HyDcd9I5xtAI0KVLOedGOZWdKyKE2XhUj
    mPCQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847908;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=qkM58ppJmICGaCKigNV7+3gfD18mpe/eRIOurb3atVw=;
    b=UPJ6B0D3F5GZ72Gb2NPrMvTFuZ2VqtnzA+jWaSQOCpM56nRClCnuDI3h7Zv2Xh3nQL
    kFOqtIWDllAFCnoLQaF9i2pdSLrlaxYXN9PYDIpda4oYaYJtGQ34F/HIOlGitFKg3G1b
    aLfYt+cg6qnuOBBQscePbVXGMuto1Nh1jwMjsG8CGmfJG4AnTn9hmCbBBhT/LKSN78Or
    R+JnyDxYw741UAFhj8CxcM2bMPwV6wwawXxwESHSoyVmzEblwb6JDVYjvNCw/6GuAWK8
    7EzxPRkHGHAo/t857KxO17FBg9Q2tP3UO/Dkl2D3aXETo9EQs1MtoYwuxVpXXwa6PTHP
    +adw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 32/36] tools: add --min_remaining to libxl_domain_suspend
Date: Wed, 16 Jun 2021 14:51:25 +0200
Message-Id: <20210616125129.26563-33-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index 594387bcf4..09e866ad87 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -498,6 +498,14 @@ possible to use this option for a 'localhost' migration.
 
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
index 8cbcc5282c..e4bfb34085 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3650,6 +3650,7 @@ struct libxl__domain_save_state {
     int debug;
     int checkpointed_stream;
     uint32_t max_iters;
+    uint32_t min_remaining;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 9b6b3c99aa..2cb4980c80 100644
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
-      "--debug         Ignored.\n"
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
+      "--debug           Ignored.\n"
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
 

