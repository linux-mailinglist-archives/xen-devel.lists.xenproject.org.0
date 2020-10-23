Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCE2973A6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11209.29818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzty-0001ej-Bw; Fri, 23 Oct 2020 16:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11209.29818; Fri, 23 Oct 2020 16:26:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztx-0001cp-Qi; Fri, 23 Oct 2020 16:26:49 +0000
Received: by outflank-mailman (input) for mailman id 11209;
 Fri, 23 Oct 2020 16:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztv-0000v2-Gn
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:47 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15e9921f-64bf-430c-8b85-f3d2e864f4a5;
 Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008NW-O7; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqj-000376-3f; Fri, 23 Oct 2020 16:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztv-0000v2-Gn
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:47 +0000
X-Inumbo-ID: 15e9921f-64bf-430c-8b85-f3d2e864f4a5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15e9921f-64bf-430c-8b85-f3d2e864f4a5;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=GUr1/jWBqMoyqKCH+//ockHXZ9S72D3qfXA2SoYLOJs=; b=fltJbSQ7mhgz40Z9DOfjMZ85W
	RQsoLGbyaE54ZzwCBoeIfnI26GSASuInU+DU1+RIw8Fq86Zk0/st1PW6IutuwNYPhoE0Qyna653lt
	9BnFkpvVp81qDYSrtGwOPnYRuSIAhkE6fKLA5zDg4j7Aba4ljUmoBBPTvr/BoftPHlZgE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008NW-O7; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqj-000376-3f; Fri, 23 Oct 2020 16:23:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 11/25] libxl: make sure callers of libxl_device_pci_list() free the list after use
Date: Fri, 23 Oct 2020 16:23:00 +0000
Message-Id: <20201023162314.2235-12-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

A previous patch introduced libxl_device_pci_list_free() which should be used
by callers of libxl_device_pci_list() to properly dispose of the exported
'libxl_device_pci' types and the free the memory holding them. Whilst all
current callers do ensure the memory is freed, only the code in xl's
pcilist() function actually calls libxl_device_pci_dispose(). As it stands
this laxity does not lead to any memory leaks, but the simple addition of
.e.g. a 'string' into the idl definition of 'libxl_device_pci' would lead
to leaks.

This patch makes sure all callers of libxl_device_pci_list() can call
libxl_device_pci_list_free() by keeping copies of 'libxl_device_pci'
structures inline in 'pci_add_state' and 'pci_remove_state' (and also making
sure these are properly disposed at the end of the operations) rather
than keeping pointers to the structures returned by libxl_device_pci_list().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_pci.c | 68 ++++++++++++++++++++++++--------------------
 tools/xl/xl_pci.c            |  3 +-
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 879b1b24a0..3162facb37 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1006,7 +1006,7 @@ typedef struct pci_add_state {
     libxl__xswait_state xswait;
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
-    libxl_device_pci *pci;
+    libxl_device_pci pci;
     libxl_domid pci_domid;
 } pci_add_state;
 
@@ -1078,7 +1078,7 @@ static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1099,7 +1099,7 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
     libxl__ev_qmp *const qmp = &pas->qmp;
 
     rc = libxl__ev_time_register_rel(ao, &pas->timeout,
@@ -1180,7 +1180,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
     int dev_slot, dev_func;
 
     /* Convenience aliases */
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) goto out;
 
@@ -1280,7 +1280,7 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     /* Convenience aliases */
     bool starting = pas->starting;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
     bool hvm = libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM;
 
     libxl__ev_qmp_dispose(gc, &pas->qmp);
@@ -1496,7 +1496,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     GCNEW(pas);
     pas->aodev = aodev;
     pas->domid = domid;
-    pas->pci = pci;
+
+    libxl_device_pci_copy(CTX, &pas->pci, pci);
+    pci = &pas->pci;
+
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
@@ -1535,12 +1538,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
     if (stubdomid != 0) {
-        libxl_device_pci *pci_s;
-
-        GCNEW(pci_s);
-        libxl_device_pci_init(pci_s);
-        libxl_device_pci_copy(CTX, pci_s, pci);
-        pas->pci = pci_s;
         pas->callback = device_pci_add_stubdom_wait;
 
         do_pci_add(egc, stubdomid, pas); /* must be last */
@@ -1599,7 +1596,7 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) goto out;
 
@@ -1650,7 +1647,7 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) {
         LOGD(ERROR, domid,
@@ -1660,6 +1657,7 @@ static void device_pci_add_done(libxl__egc *egc,
              rc);
         pci_info_xs_remove(gc, pci, "domid");
     }
+    libxl_device_pci_dispose(pci);
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
@@ -1766,7 +1764,7 @@ static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
 typedef struct pci_remove_state {
     libxl__ao_device *aodev;
     libxl_domid domid;
-    libxl_device_pci *pci;
+    libxl_device_pci pci;
     bool force;
     bool hvm;
     unsigned int orig_vdev;
@@ -1808,22 +1806,25 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    libxl_device_pci *assigned;
+    libxl_device_pci *pcis;
+    bool attached;
     uint32_t domid = prs->domid;
     libxl_domain_type type = libxl__domain_type(gc, domid);
-    libxl_device_pci *pci = prs->pci;
+    libxl_device_pci *pci = &prs->pci;
     int rc, num;
 
-    assigned = libxl_device_pci_list(ctx, domid, &num);
-    if (assigned == NULL) {
+    pcis = libxl_device_pci_list(ctx, domid, &num);
+    if (!pcis) {
         rc = ERROR_FAIL;
         goto out_fail;
     }
-    libxl__ptr_add(gc, assigned);
+
+    attached = is_pci_in_array(pcis, num, pci->domain,
+                               pci->bus, pci->dev, pci->func);
+    libxl_device_pci_list_free(pcis, num);
 
     rc = ERROR_INVAL;
-    if ( !is_pci_in_array(assigned, num, pci->domain,
-                          pci->bus, pci->dev, pci->func) ) {
+    if (!attached) {
         LOGD(ERROR, domid, "PCI device not attached to this domain");
         goto out_fail;
     }
@@ -1923,7 +1924,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = prs->domid;
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1945,7 +1946,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     int rc;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     rc = libxl__ev_time_register_rel(ao, &prs->timeout,
                                      pci_remove_timeout,
@@ -2015,7 +2016,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl__ao *const ao = prs->aodev->ao;
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     if (rc) goto out;
 
@@ -2070,7 +2071,7 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     pci_remove_state *prs = CONTAINER_OF(ev, *prs, timeout);
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     LOGD(WARN, prs->domid, "timed out waiting for DM to remove "
          PCI_PT_QDEV_ID, pci->bus, pci->dev, pci->func);
@@ -2091,7 +2092,7 @@ static void pci_remove_detached(libxl__egc *egc,
     bool isstubdom;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     /* Cleaning QMP states ASAP */
     libxl__ev_qmp_dispose(gc, &prs->qmp);
@@ -2153,7 +2154,7 @@ static void pci_remove_done(libxl__egc *egc,
 
     if (rc) goto out;
 
-    libxl__device_pci_remove_xenstore(gc, prs->domid, prs->pci);
+    libxl__device_pci_remove_xenstore(gc, prs->domid, &prs->pci);
 out:
     device_pci_remove_common_next(egc, prs, rc);
 }
@@ -2171,7 +2172,10 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     GCNEW(prs);
     prs->aodev = aodev;
     prs->domid = domid;
-    prs->pci = pci;
+
+    libxl_device_pci_copy(CTX, &prs->pci, pci);
+    pci = &prs->pci;
+
     prs->force = force;
     libxl__xswait_init(&prs->xswait);
     libxl__ev_qmp_init(&prs->qmp);
@@ -2206,7 +2210,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
     EGC_GC;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
     libxl__ao_device *const aodev = prs->aodev;
     const unsigned int pfunc_mask = prs->pfunc_mask;
     const unsigned int orig_vdev = prs->orig_vdev;
@@ -2237,6 +2241,7 @@ out:
 
     if (!rc) pci_info_xs_remove(gc, pci, "domid");
 
+    libxl_device_pci_dispose(pci);
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
@@ -2339,7 +2344,6 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
     pcis = libxl_device_pci_list(CTX, domid, &num);
     if ( pcis == NULL )
         return;
-    libxl__ptr_add(gc, pcis);
 
     for (i = 0; i < num; i++) {
         /* Force remove on shutdown since, on HVM, qemu will not always
@@ -2350,6 +2354,8 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
         libxl__device_pci_remove_common(egc, domid, pcis + i, true,
                                         aodev);
     }
+
+    libxl_device_pci_list_free(pcis, num);
 }
 
 int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 34fcf5a4fa..7c0f102ac7 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -35,9 +35,8 @@ static void pcilist(uint32_t domid)
         printf("%02x.%01x %04x:%02x:%02x.%01x\n",
                (pcis[i].vdevfn >> 3) & 0x1f, pcis[i].vdevfn & 0x7,
                pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
-        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcis);
+    libxl_device_pci_list_free(pcis, num);
 }
 
 int main_pcilist(int argc, char **argv)
-- 
2.11.0


