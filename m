Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7573696BA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116486.222348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTT-00088d-LN; Fri, 23 Apr 2021 16:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116486.222348; Fri, 23 Apr 2021 16:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTT-000889-HQ; Fri, 23 Apr 2021 16:16:11 +0000
Received: by outflank-mailman (input) for mailman id 116486;
 Fri, 23 Apr 2021 16:16:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTS-00087R-K9
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35ced14c-ff98-4f12-9faa-725c624e5efe;
 Fri, 23 Apr 2021 16:16:09 +0000 (UTC)
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
X-Inumbo-ID: 35ced14c-ff98-4f12-9faa-725c624e5efe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e0LTxQLG6A5IsUQiwdNWsSmOOkLTe8ooqtK21GVQ8t0=;
  b=KbbgA7t4chdajQh13E9811kTq8blGUiLEmyZwhe5oITRqqR++5dWR9g8
   VLAtiBbBYoFgWDj7Ss4ZrRFozg8lIfzFXQQvGrfw/9fgOtj56eSciRUPF
   y4/japCsNtkwAyT6MSzZIgaMuzGe7uwCxp4Lmp1AiQHYH/ZuTI4scSnPl
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qYlh+ZA40hvYi3FXuKBxfCYHow35VphSwxelKsLG/C6xRdvct1yIlLIwiNzt7WQxkch5k22idJ
 iMqfBy0jmvglUt7U9nqfI1d/SO1kRIol0tjcmxWhYG0gKkjcThwylWoUkUd7i8OVg9hYZSN6UT
 jITG9HlladJSTws+m52CcUCd19KYrDvhI1lMZBVVCA4GWIrCFv9H0PNde9kxb+//iEmKkM+gNi
 Iw1wLE2yfs3/gtUTcTAf0ESDMNnILx6D7UL1bDGBQDZ/GhLXtGot47edv6DF1CKvwcUrVk7fQL
 veo=
X-SBRS: 5.1
X-MesageID: 42285532
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FzFZ56jvUfnojb/DnvvnlfflsHBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42285532"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 8/8] libxl: Replace QMP command "change" by "blockdev-change-media"
Date: Fri, 23 Apr 2021 17:15:58 +0100
Message-ID: <20210423161558.224367-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"change" command as been removed in QEMU 6.0. We can use
"blockdev-change-medium" instead.

Using `id` with "blockdev-change-medium" requires a change to the QEMU
command line, introduced by:
    "libxl: Use -device for cd-rom drives"

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_disk.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index faabdea7a4c3..93936d0dd0f8 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -962,12 +962,26 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     fdset = libxl__json_object_get_integer(o);
 
     devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
-    QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
-    QMP_PARAMETERS_SPRINTF(&args, "target", "/dev/fdset/%d", fdset);
-    libxl__qmp_param_add_string(gc, &args, "arg",
-        libxl__qemu_disk_format_string(disk->format));
     qmp->callback = cdrom_insert_inserted;
-    rc = libxl__ev_qmp_send(egc, qmp, "change", args);
+
+    /* "change" is deprecated since QEMU 2.5 and the `device` parameter for
+     * for "blockdev-change-medium" is deprecated in QEMU 2.8.
+     * But `id` is only available in 2.8 we'll start using the new command
+     * with `id` with QEMU 2.8.
+     */
+    if (libxl__qmp_ev_qemu_compare_version(qmp, 2, 8, 0) >= 0) {
+        QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
+        QMP_PARAMETERS_SPRINTF(&args, "filename", "/dev/fdset/%d", fdset);
+        libxl__qmp_param_add_string(gc, &args, "format",
+            libxl__qemu_disk_format_string(disk->format));
+        rc = libxl__ev_qmp_send(egc, qmp, "blockdev-change-medium", args);
+    } else {
+        QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
+        QMP_PARAMETERS_SPRINTF(&args, "target", "/dev/fdset/%d", fdset);
+        libxl__qmp_param_add_string(gc, &args, "arg",
+            libxl__qemu_disk_format_string(disk->format));
+        rc = libxl__ev_qmp_send(egc, qmp, "change", args);
+    }
 out:
     if (rc)
         cdrom_insert_done(egc, cis, rc); /* must be last */
-- 
Anthony PERARD


