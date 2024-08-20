Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6395808E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780101.1189687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgJu9-00048y-5X; Tue, 20 Aug 2024 08:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780101.1189687; Tue, 20 Aug 2024 08:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgJu9-000464-2W; Tue, 20 Aug 2024 08:07:49 +0000
Received: by outflank-mailman (input) for mailman id 780101;
 Tue, 20 Aug 2024 08:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M/mv=PT=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sgJu7-00045y-Mb
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:07:47 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46841b26-5ecb-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 10:07:44 +0200 (CEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47K87fVP115774;
 Tue, 20 Aug 2024 03:07:41 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47K87fSU056773
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Aug 2024 03:07:41 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 03:07:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Aug 2024 03:07:41 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47K87der082013;
 Tue, 20 Aug 2024 03:07:40 -0500
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
X-Inumbo-ID: 46841b26-5ecb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724141261;
	bh=TeBOwM+tXteEQrANYjoamP9LUorPNZlyzsIFVa/Uvrg=;
	h=From:To:CC:Subject:Date;
	b=Edxz/75f3WrPZh1rysl3J3/V/+EggY9lDXzeZrzox9svaGXTIiDElV+o/+zYeBgUt
	 My+NFdkHOh9ClvB23NLXLfVpZVTf9v5hR1YMMDD2T5v82La5ZQYnpKihCvVizOjTUK
	 2yr2Z5IaDosVtMTRsPb3+WNLq3SpsYK5+jOleJTQ=
From: Amneesh Singh <a-singh21@ti.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony.perard@vates.tech>, Amneesh Singh <a-singh21@ti.com>
Subject: [PATCH v2] tools/helpers/init-dom0less: fix vcpu availability
Date: Tue, 20 Aug 2024 13:34:17 +0530
Message-ID: <20240820080416.323725-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Currently, writing at cpu/<cpu>/availability in xenstore fails for a
couple of reasons: a trailing slash in the path and the fact that
cpupool isn't a bitmap but the cpupool id. This patch fixes this by
just getting libxl_vcpuinfo for each dom0less domain.

Signed-off-by: Amneesh Singh <a-singh21@ti.com>
---
 tools/helpers/init-dom0less.c | 46 ++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 14 deletions(-)
---
v1 -> v2:
- check for libxl_list_vcpu failure
- skip writing cpu availability to store if the above failure occurs

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee9345..722a5af 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -99,8 +99,8 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  * domain started by xl/libxl.
  */
 static int create_xenstore(struct xs_handle *xsh,
-                           libxl_dominfo *info, libxl_uuid uuid,
-                           evtchn_port_t xenstore_port)
+                           libxl_dominfo *info, libxl_vcpuinfo *vcpuinfo,
+                           libxl_uuid uuid, evtchn_port_t xenstore_port)
 {
     domid_t domid;
     unsigned int i;
@@ -167,15 +167,20 @@ retry_transaction:
     /* /domain */
     if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
     if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
-    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
-    for (i = 0; i < info->vcpu_max_id; i++) {
-        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
-        if (rc < 0 || rc >= STR_MAX_LENGTH)
-            goto err;
-        rc = -EIO;
-        if (!do_xs_write_dom(xsh, t, domid, cpu_str,
-                             (info->cpupool & (1 << i)) ? "online" : "offline"))
-            goto err;
+
+    if (!vcpuinfo) {
+        fprintf(stderr, "vcpu information unavailable, proceeding without it\n");
+    } else {
+        if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
+        for (i = 0; i <= info->vcpu_max_id; i++) {
+            rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability", i);
+            if (rc < 0 || rc >= STR_MAX_LENGTH)
+                goto err;
+            rc = -EIO;
+            if (!do_xs_write_dom(xsh, t, domid, cpu_str,
+                                vcpuinfo[i].online ? "online" : "offline"))
+                goto err;
+        }
     }
 
     if (!do_xs_write_dom(xsh, t, domid, "memory", "")) goto err;
@@ -225,7 +230,8 @@ err:
 static int init_domain(struct xs_handle *xsh,
                        struct xc_interface_core *xch,
                        xenforeignmemory_handle *xfh,
-                       libxl_dominfo *info)
+                       libxl_dominfo *info,
+                       libxl_vcpuinfo *vcpuinfo)
 {
     libxl_uuid uuid;
     uint64_t xenstore_evtchn, xenstore_pfn;
@@ -278,7 +284,7 @@ static int init_domain(struct xs_handle *xsh,
     if (rc < 0)
         return rc;
 
-    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    rc = create_xenstore(xsh, info, vcpuinfo, uuid, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
@@ -330,14 +336,24 @@ int main(int argc, char **argv)
 
     for (i = 0; i < nb_vm; i++) {
         domid_t domid = info[i].domid;
+        libxl_vcpuinfo *vcpuinfo;
+        int nb_vcpu = 0, nr_cpus = 0;
+
 
         /* Don't need to check for Dom0 */
         if (!domid)
             continue;
 
+        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);
+
+        if (!vcpuinfo) {
+          fprintf(stderr, "libxl_list_vcpu failed.\n");
+          nb_vcpu = 0;
+        }
+
         printf("Checking domid: %u\n", domid);
         if (!domain_exists(xsh, domid)) {
-            rc = init_domain(xsh, xch, xfh, &info[i]);
+            rc = init_domain(xsh, xch, xfh, &info[i], vcpuinfo);
             if (rc < 0) {
                 fprintf(stderr, "init_domain failed.\n");
                 goto out;
@@ -345,6 +361,8 @@ int main(int argc, char **argv)
         } else {
             printf("Domain %u has already been initialized\n", domid);
         }
+
+        libxl_vcpuinfo_list_free(vcpuinfo, nb_vcpu);
     }
 out:
     libxl_dominfo_list_free(info, nb_vm);
-- 
2.34.1


