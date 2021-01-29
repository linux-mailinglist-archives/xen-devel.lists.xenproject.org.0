Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC43308A8B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78324.142452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WxT-0002VF-VI; Fri, 29 Jan 2021 16:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78324.142452; Fri, 29 Jan 2021 16:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WxT-0002Uq-Rl; Fri, 29 Jan 2021 16:49:19 +0000
Received: by outflank-mailman (input) for mailman id 78324;
 Fri, 29 Jan 2021 16:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxIo=HA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l5WxS-0002Ul-J0
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:49:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00d1802a-4421-4d12-a1c9-603742ba8341;
 Fri, 29 Jan 2021 16:49:16 +0000 (UTC)
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
X-Inumbo-ID: 00d1802a-4421-4d12-a1c9-603742ba8341
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611938956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fx8pfyR8GpaX/cQZRXRpbtJyfp3Ui/pl/1dQ1j4Xc1k=;
  b=UaCFa8ffV4orQYEjit4QVOSz5EkPRLnKTX+OsyjRaQzBISaY23akonpu
   h8Aw+x4cpmtvj1AKvfJrtHVnTjvN6ufrG/Pi8ESRi0pDQF4ZEpPjyNUJ7
   8qzuMo1xL4hLhKoeawAVUjWDB269V3PfVgKPzg0/dihXeUuEyZVDqDKXM
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LcC8RRopGDFivETS+HGhF84M6HeLaBEk96paohktnQRGxoV/4aK+Acln1zuW6aMGUadAVYDmju
 yALU6ECJNiA90bjDpUnpwZIy9+qFN6h7U6YkmzMygS5oHIuF3N6royVdeWmyiQCYZ8T88isRLS
 7qUQKOEI5PwsDJxF9ylTnBF9TFZvNpKiq9hAS4hajgnnyyVGEwZLG9fOPDdWM+PFGqGvwFQA43
 pye41QBIOx7TqhJJAte6yHQOUBGm+OeqzjT+8UYlktJ5xiXHFWftJXOsib+E5cAKhJObyAWT0A
 nxI=
X-SBRS: 5.1
X-MesageID: 37493462
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="37493462"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits
Date: Fri, 29 Jan 2021 16:48:58 +0000
Message-ID: <20210129164858.3280477-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When in "autoballoon" mode, xl will attempt to balloon dom0 down in
order to free up memory to start a guest, based on the expected amount
of memory reported by libxl.  Currently, this is limited in libxl with
a hard-coded value of 128MiB, to prevent squeezing dom0 so hard that
it OOMs.  On many systems, however, 128MiB is far too low a limit, and
dom0 may crash anyway.

Furthermore, "autoballoon" mode, although strongly recommended
against, must be the default mode for most distros: Having the memory
available to Linux drop to 1GiB would be too much of an unexpected
surprise for those not familiar with Xen.  This leads to a situation,
however, where starting too many guests on a large-ish system can
unexpectedly cause the system to slow down and crash with no warning,
as xl squeezes dom0 until it OOMs.

Ideally what we want is to retain the "just works after install"
functionality that we have now with respect to autoballooning, but
prompts the admin to consider autoballooning issues once they've
demonstrated that they intend to use a significant percentage of the
host memory to start guests, and also allow knowledgable users the
flexibility to configure the system as they see fit.

To do this, introduce two new xl.conf-based dom0 autoballoon limits:
autoballoon_dom0_min_memmb, and autoballoon_dom0_min_mempct.

When parsing xl.conf, xl will always calculate a minimum value for
dom0 target.  If autoballoon_dom0_min_memmb is set, it will just use
that; if that is not set and _min_mempct is set, it will calculate the
minimum target based on a percentage of host memory.  If neither is
set, it will default to 25% of host memory.

Add a more useful error message when autoballoon fails due to missing
the target.  Additionally, if the autoballoon target was automatic,
post an additional message prompting the admin to consider autoballoon
explicitly.  Hopefully this will balance things working out of the box
(and make it possible for advanced users to configure their systems as
they wish), yet prompt admins to explore further when it's
appropriate.

NB that there's a race in the resulting code between
libxl_get_memory_target() and libxl_set_memory_target(); but there was
already a race between the latter and libxl_get_free_memory() anyway;
this doesn't really make the situation worse.

While here, reduce the scope of the free_memkb variable, which isn't
used outside the do{} loop in freemem().

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
NB this is targeted at 4.16, having missed the last posting date.
Just trying to get early feedback.

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/man/xl.conf.5.pod  | 19 +++++++++++++++++++
 tools/examples/xl.conf  |  9 +++++++++
 tools/xl/xl.c           | 38 ++++++++++++++++++++++++++++++++++++++
 tools/xl/xl.h           |  2 ++
 tools/xl/xl_vmcontrol.c | 23 +++++++++++++++++++++--
 5 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.conf.5.pod b/docs/man/xl.conf.5.pod
index 41ee428744..efe259e47d 100644
--- a/docs/man/xl.conf.5.pod
+++ b/docs/man/xl.conf.5.pod
@@ -72,6 +72,25 @@ of memory given to domain 0 by default.
 
 Default: C<"auto">
 
+=item B<autoballoon_dom0_min_memmb=NUMBER>
+
+When autoballooning, C<xl> will refuse to balloon dom0 down below this
+number of megabytes.
+
+Note that C<libxl> has its own internal limit for ballooning dom0.
+
+If unset, C<autoballoon_dom0_min_mempct> will be used instead.
+
+=item B<autoballoon_dom0_min_mempct=NUMBER>
+
+When autoballooning, C<xl> will refuse to balloon dom0 down below this
+percentage of host memory.
+
+If C<autoballoon_dom0_min_memmb> is set, then this value will be
+ignored.
+
+Default: C<25>
+
 =item B<run_hotplug_scripts=BOOLEAN>
 
 If disabled hotplug scripts will be called from udev, as it used to
diff --git a/tools/examples/xl.conf b/tools/examples/xl.conf
index 95f2f442d3..c4cec25989 100644
--- a/tools/examples/xl.conf
+++ b/tools/examples/xl.conf
@@ -9,6 +9,15 @@
 # starts with all the host's memory.
 #autoballoon="auto"
 
+# If autoballooning is enabled, control the minimum value below which
+# xl will not balloon dom0.  autoballoon_dom0_min_memmb is the minimum
+# value in megabytes; autoballoon_dom0_min_mempct is a percentage of
+# host memory.  If autoballoon_dom0_min_memmb is set,
+# autoballoon_dom0_min_mempct will be ignored.  If neither is set, the
+# default value of autoballoon_dom0_min_mempct will be used.
+#autoballoon_dom0_min_memmb = 1024
+#autoballoon_dom0_min_mempct = 25
+
 # full path of the lockfile used by xl during domain creation
 #lockfile="/var/lock/xl"
 
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 2a5ddd4390..ab6ee09a9d 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -37,6 +37,8 @@ xentoollog_logger_stdiostream *logger;
 int dryrun_only;
 int force_execution;
 int autoballoon = -1;
+uint64_t autoballoon_dom0_min_memkb;
+bool autoballoon_dom0_min_is_default;
 char *blkdev_start;
 int run_hotplug_scripts = 1;
 char *lockfile;
@@ -124,6 +126,42 @@ static void parse_global_config(const char *configfile,
     if (autoballoon == -1)
         autoballoon = auto_autoballoon();
 
+    if (!xlu_cfg_get_long(config, "autoballoon_dom0_min_memmb", &l, 0)) {
+        /* Convert from megabytes to kilobytes */
+        autoballoon_dom0_min_memkb = l * 1024;
+    } else {
+        /* Minimum KB not set; look for a minimum percentage of host RAM */
+        libxl_physinfo info;
+        const libxl_version_info *vinfo;
+
+        if (!xlu_cfg_get_long(config, "autoballoon_dom0_min_mempct", &l, 0)) {
+            if (l < 0 || l > 100) {
+                fprintf(stderr, "Invalid autoballoon_dom0_min_memkb option");
+                exit(EXIT_FAILURE);
+            }
+        } else {
+            /*
+             * Default to 25% of host memory.  Lower than this should
+             * require admin intervention.
+             */
+            l = 25;
+            autoballoon_dom0_min_is_default = true;
+        }
+
+        if (libxl_get_physinfo(ctx, &info) != 0) {
+            fprintf(stderr, "libxl_get_physinfo failed.\n");
+            exit(EXIT_FAILURE);
+        }
+
+        vinfo = libxl_get_version_info(ctx);
+
+        /* First calculate total host memory in kb */
+        autoballoon_dom0_min_memkb = (info.total_pages * vinfo->pagesize) / (1 << 10);
+
+        /* Then apply the percentage */
+        autoballoon_dom0_min_memkb = autoballoon_dom0_min_memkb * l / 100;
+    }
+
     if (!xlu_cfg_get_long (config, "run_hotplug_scripts", &l, 0))
         run_hotplug_scripts = l;
 
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 06569c6c4a..d027656ed4 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -265,6 +265,8 @@ int child_report(xlchildnum child);
 
 /* global options */
 extern int autoballoon;
+uint64_t autoballoon_dom0_min_memkb;
+bool autoballoon_dom0_min_is_default;
 extern int run_hotplug_scripts;
 extern int dryrun_only;
 extern int claim_mode;
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..def8e6ee1a 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -322,7 +322,7 @@ static int domain_wait_event(uint32_t domid, libxl_event **event_r)
 static bool freemem(uint32_t domid, libxl_domain_config *d_config)
 {
     int rc, retries = 3;
-    uint64_t need_memkb, free_memkb;
+    uint64_t need_memkb;
 
     if (!autoballoon)
         return true;
@@ -332,6 +332,8 @@ static bool freemem(uint32_t domid, libxl_domain_config *d_config)
         return false;
 
     do {
+        uint64_t free_memkb, target_memkb;
+
         rc = libxl_get_free_memory(ctx, &free_memkb);
         if (rc < 0)
             return false;
@@ -339,7 +341,24 @@ static bool freemem(uint32_t domid, libxl_domain_config *d_config)
         if (free_memkb >= need_memkb)
             return true;
 
-        rc = libxl_set_memory_target(ctx, 0, free_memkb - need_memkb, 1, 0);
+        rc = libxl_get_memory_target(ctx, 0, &target_memkb);
+        if (rc < 0)
+            return false;
+
+        target_memkb -= need_memkb - free_memkb;
+
+        if (target_memkb < autoballoon_dom0_min_memkb) {
+            fprintf(stderr, "Autoballoon: %"PRIu64"kb below minimum dom0 target %"PRIu64"kb\n",
+                    target_memkb, autoballoon_dom0_min_memkb);
+            if (autoballoon_dom0_min_is_default) {
+                fprintf(stderr, "\nConsider setting autoballoon minimum target explicitly,\n" \
+                        "or setting dom0's memory allocation explicitly.\n" \
+                        "see the xl.conf man page for more information.\n\n");
+            }
+            return false;
+        }
+
+        rc = libxl_set_memory_target(ctx, 0, target_memkb, 0, 0);
         if (rc < 0)
             return false;
 
-- 
2.25.1


