Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7455A94595E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770296.1181249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnBt-00044y-LP; Fri, 02 Aug 2024 07:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770296.1181249; Fri, 02 Aug 2024 07:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnBt-00043U-If; Fri, 02 Aug 2024 07:59:09 +0000
Received: by outflank-mailman (input) for mailman id 770296;
 Fri, 02 Aug 2024 07:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwYV=PB=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sZnBr-00043L-Ie
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:59:07 +0000
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fdf6cc-50a5-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 09:59:05 +0200 (CEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4727x3uc062631
 for <xen-devel@lists.xenproject.org>; Fri, 2 Aug 2024 02:59:03 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4727x3Mj001183
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <xen-devel@lists.xenproject.org>; Fri, 2 Aug 2024 02:59:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 02:59:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 02:59:03 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4727x2Vd095063;
 Fri, 2 Aug 2024 02:59:03 -0500
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
X-Inumbo-ID: 15fdf6cc-50a5-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722585543;
	bh=gZkjzNK7QXC6oq7e03E4AvztlDUFXDZuTdvb6Y0z2xw=;
	h=From:To:CC:Subject:Date;
	b=usv4kR9R8ilG0VL1uN6sqpusOGLNHoavPu3v2LfQsOc97UZ54jNk7GYK0OJFhLz+n
	 nFkFyMFXZ6xATI2ckNq80as1xpLzRRSmd5gEILEC+hq7nVxVLi6g0Yv1b+F0hxcxVP
	 NVMHyKm6haWxVFiFOu67RcMr3Mvx62DMGZidr++0=
From: Amneesh Singh <a-singh21@ti.com>
To: <xen-devel@lists.xenproject.org>
CC: Amneesh Singh <a-singh21@ti.com>
Subject: [PATCH] tools/helpers/init-dom0less: fix vcpu availability
Date: Fri, 2 Aug 2024 13:28:25 +0530
Message-ID: <20240802075823.116920-1-a-singh21@ti.com>
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
 tools/helpers/init-dom0less.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee9345..a8cdc6d 100644
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
@@ -168,13 +168,13 @@ retry_transaction:
     if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
     if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
     if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
-    for (i = 0; i < info->vcpu_max_id; i++) {
-        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
+    for (i = 0; i <= info->vcpu_max_id; i++) {
+        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability", i);
         if (rc < 0 || rc >= STR_MAX_LENGTH)
             goto err;
         rc = -EIO;
         if (!do_xs_write_dom(xsh, t, domid, cpu_str,
-                             (info->cpupool & (1 << i)) ? "online" : "offline"))
+                             vcpuinfo[i].online ? "online" : "offline"))
             goto err;
     }
 
@@ -225,7 +225,8 @@ err:
 static int init_domain(struct xs_handle *xsh,
                        struct xc_interface_core *xch,
                        xenforeignmemory_handle *xfh,
-                       libxl_dominfo *info)
+                       libxl_dominfo *info,
+                       libxl_vcpuinfo *vcpuinfo)
 {
     libxl_uuid uuid;
     uint64_t xenstore_evtchn, xenstore_pfn;
@@ -278,7 +279,7 @@ static int init_domain(struct xs_handle *xsh,
     if (rc < 0)
         return rc;
 
-    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    rc = create_xenstore(xsh, info, vcpuinfo, uuid, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
@@ -300,7 +301,7 @@ int main(int argc, char **argv)
 {
     libxl_dominfo *info = NULL;
     libxl_ctx *ctx;
-    int nb_vm = 0, rc = 0, i;
+    int nb_vm = 0, nb_vcpu = 0, nr_cpus = 0, rc = 0, i;
     struct xs_handle *xsh = NULL;
     struct xc_interface_core *xch = NULL;
     xenforeignmemory_handle *xfh = NULL;
@@ -330,14 +331,17 @@ int main(int argc, char **argv)
 
     for (i = 0; i < nb_vm; i++) {
         domid_t domid = info[i].domid;
+        libxl_vcpuinfo *vcpuinfo;
 
         /* Don't need to check for Dom0 */
         if (!domid)
             continue;
 
+        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);
+
         printf("Checking domid: %u\n", domid);
         if (!domain_exists(xsh, domid)) {
-            rc = init_domain(xsh, xch, xfh, &info[i]);
+            rc = init_domain(xsh, xch, xfh, &info[i], vcpuinfo);
             if (rc < 0) {
                 fprintf(stderr, "init_domain failed.\n");
                 goto out;
@@ -345,6 +349,8 @@ int main(int argc, char **argv)
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


