Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CD36FED3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 18:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120711.228298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcWFS-0007MB-48; Fri, 30 Apr 2021 16:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120711.228298; Fri, 30 Apr 2021 16:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcWFS-0007Lm-0q; Fri, 30 Apr 2021 16:44:14 +0000
Received: by outflank-mailman (input) for mailman id 120711;
 Fri, 30 Apr 2021 16:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BSS5=J3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lcWFQ-0007Lf-67
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 16:44:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e71f58f-8a63-4e42-8d4b-e313e17a0d16;
 Fri, 30 Apr 2021 16:44:10 +0000 (UTC)
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
X-Inumbo-ID: 1e71f58f-8a63-4e42-8d4b-e313e17a0d16
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619801049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e1KPcgRLFVQq5UZPI+bESTLR9EztIF3MH6R2OTRSZm8=;
  b=JIEYHmS/CWvUnAGWY19Yz8AB6GkeNEmREJ72VIE2DbdyyacWtG33ymvP
   vsjUkeR0XYjPZ024CdhcIo9OAkq576KYZXWjvsOPHDTZPfsHx8ssPNdbd
   CnGxKv7IzhdaVs/bpxQEl6bOZNt67q9ulSgjw2V3nPvefrT46e5NAt4aF
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ajdkoYHch+jGte0LjBFzdAYVx8ARTXSnIvuO0PKRTJ3IFxUdXd1pQIuQayVN8G6AX+QSf/nRiz
 78ELuRJgdxB0EiCVec9bghLLdUYCnaIB80tD66ebuDJwC70HJj8znYcc94XSuYkxT81LPfJTgI
 5uz/QvTFujSXq9yMSl+l1PujZWb7DKkjg6Z9JBmiBrdYSZ1cAHraTNp0LNpfN/NM3UpIPKskmn
 ZUtXFkQnLxpMd/2T5k4GGOiRR2O81RORlPrh7WgDzVQ+bXGmcvOEw/yXqzwaIKSjEVHQeVjHNm
 AOc=
X-SBRS: 5.1
X-MesageID: 42934256
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Gk9oB6BdXmLW4fblHeh2sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOHRm7R8oMw3JkJMd6ZLWzbkUaLDKUn14vtxDX8Bzbzn9Q26Y
 5Me7VzYeeeMXFUlsD/iTPXL/8F4P2qtJ+lnv3fyXAFd3AJV4hF4x1iAgiWVm1aLTMnObMDGJ
 CR5tVKqlObEBx6Uu2BCmQYRO+GntXXlfvdCiIuPQIt6wWFkFqTmd3HOiWfty1+bxp/hY0M3E
 KAuAz/66WlvZiAu2Xh/l6W1bt6sp/MztNCAeaFl8QaLC794zzYGbhJavm5kx0e5M2p9VY2gP
 nAyi1QQ/hb2jfqUUye5TvrxgX63z4l5xbZuCClqEqmm+PVbnYeKaN69OZkWyqc0WUMlpVA9Z
 gO+GSju59eHXr77VzAzumNbT5GvA6Ju3Y4+NRj6EB3YM8lR5J6i5cQx09RGIdoJlOA1KkXVN
 NjC8zR/59tADWnRkGcumFuxeqlVWgoEiGHRVAfuteU3yI+pgEB83cl
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42934256"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xen: Free xenforeignmemory_resource at exit
Date: Fri, 30 Apr 2021 17:37:42 +0100
Message-ID: <20210430163742.469739-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

Because Coverity complains about it and this is one leak that Valgrind
reports.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-hvm.c       | 9 ++++++---
 include/hw/xen/xen_common.h | 6 ++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 7ce672e5a5c3..47ed7772fa39 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -109,6 +109,7 @@ typedef struct XenIOState {
     shared_iopage_t *shared_page;
     shared_vmport_iopage_t *shared_vmport_page;
     buffered_iopage_t *buffered_io_page;
+    xenforeignmemory_resource_handle *fres;
     QEMUTimer *buffered_io_timer;
     CPUState **cpu_by_vcpu_id;
     /* the evtchn port for polling the notification, */
@@ -1254,6 +1255,9 @@ static void xen_exit_notifier(Notifier *n, void *data)
     XenIOState *state = container_of(n, XenIOState, exit);
 
     xen_destroy_ioreq_server(xen_domid, state->ioservid);
+    if (state->fres != NULL) {
+        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
+    }
 
     xenevtchn_close(state->xce_handle);
     xs_daemon_close(state->xenstore);
@@ -1321,7 +1325,6 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
 static int xen_map_ioreq_server(XenIOState *state)
 {
     void *addr = NULL;
-    xenforeignmemory_resource_handle *fres;
     xen_pfn_t ioreq_pfn;
     xen_pfn_t bufioreq_pfn;
     evtchn_port_t bufioreq_evtchn;
@@ -1333,12 +1336,12 @@ static int xen_map_ioreq_server(XenIOState *state)
      */
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
-    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
+    state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
                                          XENMEM_resource_ioreq_server,
                                          state->ioservid, 0, 2,
                                          &addr,
                                          PROT_READ | PROT_WRITE, 0);
-    if (fres != NULL) {
+    if (state->fres != NULL) {
         trace_xen_map_resource_ioreq(state->ioservid, addr);
         state->buffered_io_page = addr;
         state->shared_page = addr + TARGET_PAGE_SIZE;
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 82e56339dd7e..a8118b41acfb 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -134,6 +134,12 @@ static inline xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
     return NULL;
 }
 
+static inline int xenforeignmemory_unmap_resource(
+    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
+{
+    return 0;
+}
+
 #endif /* CONFIG_XEN_CTRL_INTERFACE_VERSION < 41100 */
 
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41000
-- 
Anthony PERARD


