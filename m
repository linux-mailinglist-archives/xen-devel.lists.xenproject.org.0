Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2496C3446ED
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100237.190860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLNT-0005x6-Lc; Mon, 22 Mar 2021 14:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100237.190860; Mon, 22 Mar 2021 14:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLNT-0005wl-IE; Mon, 22 Mar 2021 14:17:55 +0000
Received: by outflank-mailman (input) for mailman id 100237;
 Mon, 22 Mar 2021 14:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdHa=IU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lOLNR-0005wg-IF
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:17:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f112ac4-98f6-4f94-ac7f-98ffaa9f65c6;
 Mon, 22 Mar 2021 14:17:52 +0000 (UTC)
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
X-Inumbo-ID: 4f112ac4-98f6-4f94-ac7f-98ffaa9f65c6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616422672;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zbCA7xPzOeIvFMMUTDAmfGCrX4UtpDvlzVZISRSEDMo=;
  b=aZUFkAZ2qIzuFn5WuMWtR9ajrQM0QTE5u+hiRSy1yRNFymMeX5XhIfMc
   kJUmdC/O5aEE/vPU8vA+e3VmvoEWB/R1RnMau8JT5NyqeglPvDs1eUz6f
   7ftmYs4gc17cDq8O4IxSx8t1xNrlF0j2agH6zhKWY4lDPfXzNZ5Z+XT32
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gDU9YOZltnPkmbL5qfoHnDE2uuKo84dBf3CW8NukPI6cUvyn19Z92/c42QM1Kl+6PtDZGOjwrY
 AOKdU7b9fGFoh2tyEN9HIcBv2z7YcNRRFWilY1rciwOIdp0KBdp70jD2o4TPn16rX0gEdW19jp
 68rK4YlO2x5hXnycSL79ZIYNygiHi2Gd5QvH+6LYgKhPVJzQy7JEdBUHdKMh1roMaMoaj6dcM7
 9TZlEJ6ULNQ/TwA9wWJRKv6GNnR5JzJ4kbYwGfGRzx63Nm09AGCyllrFX4mYpAHTokgKwsU8NF
 l/c=
X-SBRS: 5.1
X-MesageID: 41257215
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zfm48q20pkwbpXJTZ3UPIwqjBFAkLtp033Aq2lEZdDV+WKWj+P
 yGtvIdyBPylXItQ3kmg9+NI+2tRnnb+J5z7+AqTNKfdSPhv3alK5wn0Jv6z1TbakrD38NUyK
 sISclDIfLqC1wSt6vHyS2ZN/pl/9Wd6qCvgo7lvhVQZCVncbtp4Qs8KivzKC1LbTJLD5Y4C5
 aQj/Avz1HLRV0tYtmmHX5AZuDfprTw5fbbSCQbDB0q4hTmt12VwYP9eiL14j4uFxdGwbIv6g
 H+4m/E2pk=
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="41257215"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by "query-cpus-fast"
Date: Mon, 22 Mar 2021 14:17:44 +0000
Message-ID: <20210322141744.522041-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We use the deprecated QMP command "query-cpus" which will be remove in
the upcoming QEMU 6.0 release. There's a replacement which is
"query-cpus-fast", and have been available since QEMU 2.12 (April
2018).

In order to been able to keep using recent version of QEMU, this patch
replace the deprecated command by the newer version. And because we
are in the "feature freeze" period, this patch is kept simple without
fallback (which could have been used when "query-cpus-fast" wasn't
available).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_domain.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5d4ec9071160..e32e1cd39fea 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1740,23 +1740,23 @@ static int libxl__set_vcpuonline_xenstore(libxl__gc *gc, uint32_t domid,
     return rc;
 }
 
-static int qmp_parse_query_cpus(libxl__gc *gc,
-                                libxl_domid domid,
-                                const libxl__json_object *response,
-                                libxl_bitmap *const map)
+static int qmp_parse_query_cpus_fast(libxl__gc *gc,
+                                     libxl_domid domid,
+                                     const libxl__json_object *response,
+                                     libxl_bitmap *const map)
 {
     int i;
     const libxl__json_object *cpu;
 
     libxl_bitmap_set_none(map);
-    /* Parse response to QMP command "query-cpus":
-     * [ { 'CPU': 'int',...} ]
+    /* Parse response to QMP command "query-cpus-fast":
+     * [ { 'cpu-index': 'int',...} ]
      */
     for (i = 0; (cpu = libxl__json_array_get(response, i)); i++) {
         unsigned int cpu_index;
         const libxl__json_object *o;
 
-        o = libxl__json_map_get("CPU", cpu, JSON_INTEGER);
+        o = libxl__json_map_get("cpu-index", cpu, JSON_INTEGER);
         if (!o) {
             LOGD(ERROR, domid, "Failed to retrieve CPU index.");
             return ERROR_QEMU_API;
@@ -1841,7 +1841,7 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
                                              LIBXL_QMP_CMD_TIMEOUT * 1000);
             if (rc) goto out;
             qmp->callback = set_vcpuonline_qmp_cpus_queried;
-            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus", NULL);
+            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus-fast", NULL);
             if (rc) goto out;
             return AO_INPROGRESS;
         default:
@@ -1876,7 +1876,7 @@ static void set_vcpuonline_qmp_cpus_queried(libxl__egc *egc,
     if (rc) goto out;
 
     libxl_bitmap_alloc(CTX, &current_map, svos->info.vcpu_max_id + 1);
-    rc = qmp_parse_query_cpus(gc, qmp->domid, response, &current_map);
+    rc = qmp_parse_query_cpus_fast(gc, qmp->domid, response, &current_map);
     if (rc) goto out;
 
     libxl_bitmap_copy_alloc(CTX, final_map, svos->cpumap);
@@ -2199,7 +2199,7 @@ static void retrieve_domain_configuration_lock_acquired(
         libxl_bitmap_alloc(CTX, &rdcs->qemuu_cpus,
                            d_config->b_info.max_vcpus);
         rdcs->qmp.callback = retrieve_domain_configuration_cpu_queried;
-        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus", NULL);
+        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus-fast", NULL);
         if (rc) goto out;
         has_callback = true;
     }
@@ -2220,7 +2220,7 @@ static void retrieve_domain_configuration_cpu_queried(
 
     if (rc) goto out;
 
-    rc = qmp_parse_query_cpus(gc, qmp->domid, response, &rdcs->qemuu_cpus);
+    rc = qmp_parse_query_cpus_fast(gc, qmp->domid, response, &rdcs->qemuu_cpus);
 
 out:
     retrieve_domain_configuration_end(egc, rdcs, rc);
-- 
Anthony PERARD


