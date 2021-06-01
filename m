Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868DB3977F7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135150.251353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7Bt-0002Q5-MF; Tue, 01 Jun 2021 16:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135150.251353; Tue, 01 Jun 2021 16:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7Bt-0002O6-IV; Tue, 01 Jun 2021 16:24:29 +0000
Received: by outflank-mailman (input) for mailman id 135150;
 Tue, 01 Jun 2021 16:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo71E-0005Ec-4T
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:13:28 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.174])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48fa1829-73d1-48ce-92c9-cdc6cf16f212;
 Tue, 01 Jun 2021 16:11:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBd1Bc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:39 +0200 (CEST)
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
X-Inumbo-ID: 48fa1829-73d1-48ce-92c9-cdc6cf16f212
ARC-Seal: i=1; a=rsa-sha256; t=1622563900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=q4QpgJ61zpOybvUvhUr09ZmeltRRHXUJPMawiTvc9JFN5FTIFY5oP+64k6xDO1D0s5
    UV04M/mB5Hi/+GidhhR4hIyGNA/HRQvyAdRue4BOPs+/PR96QxUyLbSNHvqdr9hL9GQu
    EFAU9dhkSJIbLNjkMaPBE1yd4XHuax7yhS5ThiG+xqBgMbjoqQeFFifH43qJSc9HnguL
    96nBvelGvVr27kzdU39w7y0s0nQivTOHmVwVKCyPdLi31+n5kgoNSmmJ8BJiJinuvO8x
    kKMaeAGIvjreAuP2dQogevYgTNgdMN2LH7J6yvucvfDOFNcYkkm+q0sTeUyOYsmv/3Tx
    qj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z1lmf0xePHwyesyqjBFkPKIgt7yTBfVYJQlZCg92Pig=;
    b=Ui/N5dcIi30X7j3unjmJJR0yBmG7TDkeBhos7LZDGabwet4KhNstuaiNwJyRVPeV8/
    ZHi6YMufr7c1fyUoohYHo9FvJPMmxZGuJSSuWj5u3lv0Bczv5Wc3/max9djUTSJFmIhA
    uGZnH7y6swi4ePLz9u0JGFnPsz57gvhatxVZygXmuobmmES1YO7MTkBJ5QNuLy+r5MQ2
    7KGuss9KN2PMo9FmC9ZU5KXBeuJeWQfxahLi9fQO6d5LSIjwa9xFrEpgIY0HVOUn6Sys
    4/2SxEOlLVFKZBJY53UhA8NF4tjlXgCa3w8q7DiUOnHh2rtJ/07fA5UwhsGl97XLpQ/l
    cQAQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z1lmf0xePHwyesyqjBFkPKIgt7yTBfVYJQlZCg92Pig=;
    b=mIespZvsQbeG2kuTMSr5Pwx4UR6KJeERxOoCrGqGTYDkxK5mYXRlv2tiwqH9WGDvum
    Xj0bWpAhyLRMl2V9wh58oktUBwOahEDzP8w/bRVe17JVUjVmeBTd59UquYMawBYPnDIn
    fKaQKDg3ixisNwzc5kwaYSxrT6cY4XSCJ4gQoNGvEQLCDN9qsXhDfTT7+HBO3DIDnlEj
    BwY7u4lU8/9BHm0yFFzw3WyT6+tDznvZ+sbIWO8KX77uq8oNeSdoV2NeRSLIyOZMGGRT
    K8br9V/w9fErm11F7lIxS1F+rKYk7t9lcy9iKTtV09hWa/vZioRHQQYNb4aVL8gbnyL/
    KGzg==
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
Subject: [PATCH v20210601 32/38] tools: add --min_remaining to libxl_domain_suspend
Date: Tue,  1 Jun 2021 18:11:12 +0200
Message-Id: <20210601161118.18986-33-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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
index b13e09c0ee..43609f6cdd 100644
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
index 82b9dca5a0..63028586fe 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3642,6 +3642,7 @@ struct libxl__domain_save_state {
     int debug;
     int checkpointed_stream;
     uint32_t max_iters;
+    uint32_t min_remaining;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 8f8fa72760..acb84e3486 100644
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
+      "--debug           Verify transferred domU page data.\n"
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
 

