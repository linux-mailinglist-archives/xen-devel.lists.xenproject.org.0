Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75442D32E4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47771.84644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAP-0005Jx-KC; Tue, 08 Dec 2020 20:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47771.84644; Tue, 08 Dec 2020 20:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAO-0005H0-RH; Tue, 08 Dec 2020 20:00:56 +0000
Received: by outflank-mailman (input) for mailman id 47771;
 Tue, 08 Dec 2020 20:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAE-0004ph-0u
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAD-00086U-2S; Tue, 08 Dec 2020 20:00:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihH-0001p0-Hc; Tue, 08 Dec 2020 19:30:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=JrM/ntLiiP2bhtck3185mew5Px47koc4HiV7GFFcjR4=; b=RCxDmlYtfDlShoJNgqqQhGRC/K
	+EC9OxNj1OESZtWMkku0W0BCNiG3fiDS+PpE7+U4FGTwePL+hbhe6knMyxcWCokvstCCXrigXzZWO
	BElmxg2gL4mcomUqNVz62xHeUus2qDuk9uA8nF1OLBAvW7W/QqBwNAkFmrJZAmxkhCrc=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 12/25] libxl: make sure callers of libxl_device_pci_list() free the list after use
Date: Tue,  8 Dec 2020 19:30:20 +0000
Message-Id: <20201208193033.11306-13-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_pci.c | 68 ++++++++++++++++++++----------------
 tools/xl/xl_pci.c            |  3 +-
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 37a6ec9eb443..c555f3ed29c4 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1025,7 +1025,7 @@ typedef struct pci_add_state {
     libxl__xswait_state xswait;
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
-    libxl_device_pci *pci;
+    libxl_device_pci pci;
     libxl_domid pci_domid;
 } pci_add_state;
 
@@ -1097,7 +1097,7 @@ static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1118,7 +1118,7 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
     libxl__ev_qmp *const qmp = &pas->qmp;
 
     rc = libxl__ev_time_register_rel(ao, &pas->timeout,
@@ -1199,7 +1199,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
     int dev_slot, dev_func;
 
     /* Convenience aliases */
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) goto out;
 
@@ -1300,7 +1300,7 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     /* Convenience aliases */
     bool starting = pas->starting;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
     bool hvm = libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM;
 
     libxl__ev_qmp_dispose(gc, &pas->qmp);
@@ -1516,7 +1516,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
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
 
@@ -1555,12 +1558,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 
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
@@ -1619,7 +1616,7 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) goto out;
 
@@ -1670,7 +1667,7 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = pas->pci;
+    libxl_device_pci *pci = &pas->pci;
 
     if (rc) {
         LOGD(ERROR, domid,
@@ -1680,6 +1677,7 @@ static void device_pci_add_done(libxl__egc *egc,
              rc);
         pci_info_xs_remove(gc, pci, "domid");
     }
+    libxl_device_pci_dispose(pci);
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
@@ -1770,7 +1768,7 @@ static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
 typedef struct pci_remove_state {
     libxl__ao_device *aodev;
     libxl_domid domid;
-    libxl_device_pci *pci;
+    libxl_device_pci pci;
     bool force;
     bool hvm;
     unsigned int orig_vdev;
@@ -1812,23 +1810,26 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
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
     uint32_t domainid = domid;
 
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
         LOGD(ERROR, domainid, "PCI device not attached to this domain");
         goto out_fail;
     }
@@ -1928,7 +1929,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl_domid domid = prs->domid;
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     rc = check_qemu_running(gc, domid, xswa, rc, state);
     if (rc == ERROR_NOT_READY)
@@ -1950,7 +1951,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     int rc;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     rc = libxl__ev_time_register_rel(ao, &prs->timeout,
                                      pci_remove_timeout,
@@ -2020,7 +2021,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
 
     /* Convenience aliases */
     libxl__ao *const ao = prs->aodev->ao;
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     if (rc) goto out;
 
@@ -2075,7 +2076,7 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     pci_remove_state *prs = CONTAINER_OF(ev, *prs, timeout);
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
 
     LOGD(WARN, prs->domid, "timed out waiting for DM to remove "
          PCI_PT_QDEV_ID, pci->bus, pci->dev, pci->func);
@@ -2096,7 +2097,7 @@ static void pci_remove_detached(libxl__egc *egc,
     bool isstubdom;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
     libxl_domid domid = prs->domid;
 
     /* Cleaning QMP states ASAP */
@@ -2159,7 +2160,7 @@ static void pci_remove_done(libxl__egc *egc,
 
     if (rc) goto out;
 
-    libxl__device_pci_remove_xenstore(gc, prs->domid, prs->pci);
+    libxl__device_pci_remove_xenstore(gc, prs->domid, &prs->pci);
 out:
     device_pci_remove_common_next(egc, prs, rc);
 }
@@ -2177,7 +2178,10 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
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
@@ -2212,7 +2216,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
     EGC_GC;
 
     /* Convenience aliases */
-    libxl_device_pci *const pci = prs->pci;
+    libxl_device_pci *const pci = &prs->pci;
     libxl__ao_device *const aodev = prs->aodev;
     const unsigned int pfunc_mask = prs->pfunc_mask;
     const unsigned int orig_vdev = prs->orig_vdev;
@@ -2243,6 +2247,7 @@ out:
 
     if (!rc) pci_info_xs_remove(gc, pci, "domid");
 
+    libxl_device_pci_dispose(pci);
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
@@ -2357,7 +2362,6 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
     pcis = libxl_device_pci_list(CTX, domid, &num);
     if ( pcis == NULL )
         return;
-    libxl__ptr_add(gc, pcis);
 
     for (i = 0; i < num; i++) {
         /* Force remove on shutdown since, on HVM, qemu will not always
@@ -2368,6 +2372,8 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
         libxl__device_pci_remove_common(egc, domid, pcis + i, true,
                                         aodev);
     }
+
+    libxl_device_pci_list_free(pcis, num);
 }
 
 int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 34fcf5a4fadf..7c0f102ac7b7 100644
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
2.20.1


