Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C364026A6D9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIBf0-0004A5-7H; Tue, 15 Sep 2020 14:10:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIBey-00048m-IT
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:10:16 +0000
X-Inumbo-ID: e5515df6-853b-4950-a6a0-89a8ef8e1fb0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5515df6-853b-4950-a6a0-89a8ef8e1fb0;
 Tue, 15 Sep 2020 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=G29K1P/YFTJV0Scb7azCBDKwMu+4INdbb4rZTi0L8OU=; b=JPi8bSm+FEyU1y+DxnKibKCQbc
 A9ycFVYS1xBmNEmxJUNlpWIzl12R0d7sptSE1qZK3T+8b5VsWBLe4i56gFB+bq/F3pDyDK5BozlWW
 SgLpeP31kOwANYfwPSNcpM9w+JskpiMnqdY0znBnNp4v99c7aJYFdSYNsuaScqqqi06c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBet-0003nS-Lt; Tue, 15 Sep 2020 14:10:11 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBet-0001rP-Cd; Tue, 15 Sep 2020 14:10:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/2] xl: implement documented '--force' option for
 block-detach
Date: Tue, 15 Sep 2020 15:10:07 +0100
Message-Id: <20200915141007.25965-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915141007.25965-1-paul@xen.org>
References: <20200915141007.25965-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The manpage for 'xl' documents an option to force a block device to be
released even if the domain to which it is attached does not co-operate.
The documentation also states that, if the force flag is not specified, the
block-detach operation should fail.

Currently the force option is not implemented and a non-forced block-detach
will auto-force after a time-out of 10s. This patch implements the force
option and also stops auto-forcing a non-forced block-detach by calling
libxl_device_disk_safe_remove() rather than libxl_device_disk_remove(),
allowing the operation to fail cleanly as per the documented behaviour.

NOTE: The documentation is also adjusted since the normal positioning of
      options is before compulsory parameters. It is also noted that use of
      the --force option may lead to a guest crash.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v2:
 - Add missing '.'
 - Use the new libxl_device_disk_safe_remove() function
 - Keep Wei's A-b as the modifications are trivial
---
 docs/man/xl.1.pod.in   |  4 ++--
 tools/xl/xl_block.c    | 21 ++++++++++++++++-----
 tools/xl/xl_cmdtable.c |  3 ++-
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 52a47a6fbd..5f7d3a7134 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1389,7 +1389,7 @@ Note that only PV block devices are supported by block-attach.
 Requests to attach emulated devices (eg, vdev=hdc) will result in only
 the PV view being available to the guest.
 
-=item B<block-detach> I<domain-id> I<devid> [I<OPTIONS>]
+=item B<block-detach> [I<OPTIONS>] I<domain-id> I<devid>
 
 Detach a domain's virtual block device. I<devid> may be the symbolic
 name or the numeric device id given to the device by domain 0.  You
@@ -1406,7 +1406,7 @@ B<OPTIONS>
 =item B<--force>
 
 If this parameter is specified the device will be forcefully detached, which
-may cause IO errors in the domain.
+may cause IO errors in the domain and possibly a guest crash
 
 =back
 
diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
index acaf9b96b8..70eed431e4 100644
--- a/tools/xl/xl_block.c
+++ b/tools/xl/xl_block.c
@@ -96,12 +96,21 @@ int main_blocklist(int argc, char **argv)
 
 int main_blockdetach(int argc, char **argv)
 {
+    static struct option opts[] = {
+        {"force", 0, 0, 'f'},
+        COMMON_LONG_OPTS
+    };
     uint32_t domid;
     int opt, rc = 0;
     libxl_device_disk disk;
-
-    SWITCH_FOREACH_OPT(opt, "", NULL, "block-detach", 2) {
-        /* No options */
+    bool force = false;
+
+    SWITCH_FOREACH_OPT(opt, "f", opts, "block-detach", 2) {
+    case 'f':
+        force = true;
+        break;
+    default:
+        break;
     }
 
     domid = find_domain(argv[optind]);
@@ -110,9 +119,11 @@ int main_blockdetach(int argc, char **argv)
         fprintf(stderr, "Error: Device %s not connected.\n", argv[optind+1]);
         return 1;
     }
-    rc = libxl_device_disk_remove(ctx, domid, &disk, 0);
+    rc = !force ? libxl_device_disk_safe_remove(ctx, domid, &disk, 0) :
+        libxl_device_disk_destroy(ctx, domid, &disk, 0);
     if (rc) {
-        fprintf(stderr, "libxl_device_disk_remove failed.\n");
+        fprintf(stderr, "libxl_device_disk_%s failed.\n",
+                !force ? "safe_remove" : "destroy");
         return 1;
     }
     libxl_device_disk_dispose(&disk);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 2b8e1b321a..7da6c1b927 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -368,7 +368,8 @@ struct cmd_spec cmd_table[] = {
     { "block-detach",
       &main_blockdetach, 0, 1,
       "Destroy a domain's virtual block device",
-      "<Domain> <DevId>",
+      "[option] <Domain> <DevId>",
+      "-f, --force        do not wait for the domain to release the device"
     },
     { "vtpm-attach",
       &main_vtpmattach, 1, 1,
-- 
2.20.1


