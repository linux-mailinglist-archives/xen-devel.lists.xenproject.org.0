Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9321746D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqo9-0000FB-NU; Tue, 07 Jul 2020 16:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqo8-0000Ey-IF
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:51:00 +0000
X-Inumbo-ID: 07f329a9-c072-11ea-8dc2-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 07f329a9-c072-11ea-8dc2-12813bfff9fa;
 Tue, 07 Jul 2020 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtSQ9ltFDy+ZS6gTE2EcxmbrVjKJQ192ZTarFddQmh4=;
 b=IdDMDYb/dEoY+IcSojtJq4x9TvwqizZgjdmay49JAj2Ox5uivpsDaZhhlUlMIHHRQEq0XB
 kt2zhOLsOW4NViO3QKYTB9Hcb46uvSixtEPxtRw3X2PFSgIQoZHxzgowVMtPLwkynGqHMp
 oNc0tsGch4HuRRSQl/HK1WxdHvaj59o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-0UWQII4DOdu_QowMQ0wkdA-1; Tue, 07 Jul 2020 12:50:55 -0400
X-MC-Unique: 0UWQII4DOdu_QowMQ0wkdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39B2E80183C;
 Tue,  7 Jul 2020 16:50:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5415C1D0;
 Tue,  7 Jul 2020 16:50:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3102611326F0; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 6/8] virtio-9p: Use ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:35 +0200
Message-Id: <20200707165037.1026246-7-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &error_fatal
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

If we want to check error after errp-function call, we need to
introduce local_err and then propagate it to errp. Instead, use
ERRP_AUTO_PROPAGATE macro, benefits are:
1. No need of explicit error_propagate call
2. No need of explicit local_err variable: use errp directly
3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
   &error_fatal, this means that we don't break error_abort
   (we'll abort on error_set, not on error_propagate)

This commit is generated by command

    sed -n '/^virtio-9p$/,/^$/{s/^F: //p}' MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Acked-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/9p-local.c | 12 +++++-------
 hw/9pfs/9p.c       |  1 +
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 54e012e5b4..0361e0c0b4 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -1479,10 +1479,10 @@ static void error_append_security_model_hint(Error *const *errp)
 
 static int local_parse_opts(QemuOpts *opts, FsDriverEntry *fse, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     const char *sec_model = qemu_opt_get(opts, "security_model");
     const char *path = qemu_opt_get(opts, "path");
     const char *multidevs = qemu_opt_get(opts, "multidevs");
-    Error *local_err = NULL;
 
     if (!sec_model) {
         error_setg(errp, "security_model property not set");
@@ -1516,11 +1516,10 @@ static int local_parse_opts(QemuOpts *opts, FsDriverEntry *fse, Error **errp)
             fse->export_flags &= ~V9FS_FORBID_MULTIDEVS;
             fse->export_flags &= ~V9FS_REMAP_INODES;
         } else {
-            error_setg(&local_err, "invalid multidevs property '%s'",
+            error_setg(errp, "invalid multidevs property '%s'",
                        multidevs);
-            error_append_hint(&local_err, "Valid options are: multidevs="
+            error_append_hint(errp, "Valid options are: multidevs="
                               "[remap|forbid|warn]\n");
-            error_propagate(errp, local_err);
             return -1;
         }
     }
@@ -1530,9 +1529,8 @@ static int local_parse_opts(QemuOpts *opts, FsDriverEntry *fse, Error **errp)
         return -1;
     }
 
-    if (fsdev_throttle_parse_opts(opts, &fse->fst, &local_err)) {
-        error_propagate_prepend(errp, local_err,
-                                "invalid throttle configuration: ");
+    if (fsdev_throttle_parse_opts(opts, &fse->fst, errp)) {
+        error_prepend(errp, "invalid throttle configuration: ");
         return -1;
     }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9755fba9a9..bdb1360482 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4011,6 +4011,7 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr)
 int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
                                Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     int i, len;
     struct stat stat;
     FsDriverEntry *fse;
-- 
2.26.2


