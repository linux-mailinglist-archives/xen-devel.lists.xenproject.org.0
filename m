Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E23A9B9C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143029.263878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGY-0006sx-VP; Wed, 16 Jun 2021 13:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143029.263878; Wed, 16 Jun 2021 13:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGY-0006pc-QL; Wed, 16 Jun 2021 13:07:34 +0000
Received: by outflank-mailman (input) for mailman id 143029;
 Wed, 16 Jun 2021 13:07:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2S-00075D-9q
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:53:00 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95efd68c-aecb-4df5-81e1-862432e556f6;
 Wed, 16 Jun 2021 12:51:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpmtmR
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
X-Inumbo-ID: 95efd68c-aecb-4df5-81e1-862432e556f6
ARC-Seal: i=1; a=rsa-sha256; t=1623847908; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cHIyIkmuhvUDNSy/ndXRUCW+1wkpVW7xVLVw6QYGgg8ZFKtrTjVR0kuYWyZbxNWHyz
    1cCvLRiVNJ47kWv6rN0JzfpOi3CWwF5PR2W4EpVsCacVY1AFWZVv71uEQkVeqpqXvCsr
    ngOw7RTpHM9y5FfxOOs2yVwHTSgP0Vh1Eqo+YrXdAse+LS1gI8gp2vHI9LR/Cddv36ny
    IwmTmDOKPf+ARZsXhmCcJlBc69guJOtLvXMrCycDgd/FxJYyW1KQlErrloh6cXpP6CIS
    TTEMbmLulxivexXgp1lAUZLFSHBAWXfa5wdD4QW9HG6IFNsosgt6AYkZPPpXXdUGqFGJ
    OWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847908;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6LebzrvgpkRPMXPrQvQqUEqJ9oCT3tBlpGnE42P4LCk=;
    b=lmir08Rm5poB1h9YZdUUyI82Vm670RNQ5lbdEDt6mvlI2N1LVvVTnDYkjvjcZd94da
    SA6ctKVSltK3cfFmg+X1LkOOh/T8kYz9MOoRWL3M7bAtqgb/Vf768T5ZD4LBJIRtM1+u
    dmte6Ae+Xvv4l8iPjgcsHepokmZ+kbSt5aPr9Q2oM0g231B6FzkPOzkNSdAy8/Tma5f1
    4zOj00HTkjc0qlfwtyyvCuPUnwCBdjH/YXj2CSUMztRRv8IwZn/G+9r+0vIBbpj0Yr5a
    KX0B54xfbznJPo5siGlqkPS77wArfWCQ6JdLFGJBJai83fiXNq7BeG5BVLVvzgGHcXk/
    dHpA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847908;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6LebzrvgpkRPMXPrQvQqUEqJ9oCT3tBlpGnE42P4LCk=;
    b=hKrESaYSskxqbrwZ/gQCQYM/Cof6kuuYncYKGb2HW7qY7+k8Ysk54N5YHqE3QqyHmP
    cO8/I8XpWaPnkeZjaJDooigmKSEsoSOXEbEcX02Fa6DVlIbag+l/KHiLOYBCLAbqgM60
    2dJWURDk9251OlsT2hPyYc0btejRsB7x6w/+Rc5GM7CKrbpNH50tSvfcUBBg2AeJnO3r
    a22NE7XVlvT50bo2lEacRLXPtLgN+rMEp8mowE31KNJCOd/zmFi3hJ62bvzXt8U9hu7c
    tOJHVNmWUM24xj76OUmsUN5Fzh7utoS5wtPYqTWI3DZXIwkFugF3Sq51DllrmTAUl61u
    rEcg==
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
Subject: [PATCH v20210616 31/36] tools: add --max_iters to libxl_domain_suspend
Date: Wed, 16 Jun 2021 14:51:24 +0200
Message-Id: <20210616125129.26563-32-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index 70a6ebf438..594387bcf4 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -494,6 +494,10 @@ such that it will be identical on the destination host, unless that
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
index 57d7e4b4b8..8cbcc5282c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3649,6 +3649,7 @@ struct libxl__domain_save_state {
     int live;
     int debug;
     int checkpointed_stream;
+    uint32_t max_iters;
     const libxl_domain_remus_info *remus;
     /* private */
     int rc;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index ca1dfa3525..9b6b3c99aa 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -174,7 +174,8 @@ const struct cmd_spec cmd_table[] = {
       "                of the domain.\n"
       "--debug         Ignored.\n"
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
 

