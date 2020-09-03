Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD425BEC9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 12:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDm7s-0000zA-Lx; Thu, 03 Sep 2020 10:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rObT=CM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kDm7q-0000xt-Ct
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 10:05:50 +0000
X-Inumbo-ID: ef668fae-544b-4d19-89d7-f8f985b47645
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef668fae-544b-4d19-89d7-f8f985b47645;
 Thu, 03 Sep 2020 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=/vJWDGDhMNKnK2icTtRJOoh810jE4F8SY8ycjNLUV20=; b=ZasX1IGSD5+s230ycwOgQpK46o
 6ADneBA2HVYR105S3VmN+Yg7Wwqh/Id1Sysw/mHuCk0q3ohkdEwOJ0UGTMXxK7zFK9KIf0pxbg5oX
 VjHb84Txh180unY/4Q0dHd7HfFopP51IgTpE+Th77Xi+KrPz4Bhwbqae6P8FU90FkSCE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7g-0005aw-2p; Thu, 03 Sep 2020 10:05:40 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7f-0007WE-Ow; Thu, 03 Sep 2020 10:05:39 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] xl: implement documented --force option for block-detach
Date: Thu,  3 Sep 2020 11:05:36 +0100
Message-Id: <20200903100537.1337-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903100537.1337-1-paul@xen.org>
References: <20200903100537.1337-1-paul@xen.org>
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
This option, however, is not implemented. This patch implements the option.

NOTE: The documentation is also adjusted since the normal positioning of
      options is before compulsory parameters. It is also noted that use of
      the --force option may lead to a guest crash.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
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
index acaf9b96b8..05696643bf 100644
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
+    rc = !force ? libxl_device_disk_remove(ctx, domid, &disk, 0) :
+        libxl_device_disk_destroy(ctx, domid, &disk, 0);
     if (rc) {
-        fprintf(stderr, "libxl_device_disk_remove failed.\n");
+        fprintf(stderr, "libxl_device_disk_%s failed.\n",
+                !force ? "remove" : "destroy");
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


