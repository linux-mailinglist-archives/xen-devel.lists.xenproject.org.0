Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A23BE073
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 03:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151786.280443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0vxp-0000QK-CV; Wed, 07 Jul 2021 01:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151786.280443; Wed, 07 Jul 2021 01:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0vxp-0000N9-8m; Wed, 07 Jul 2021 01:02:57 +0000
Received: by outflank-mailman (input) for mailman id 151786;
 Wed, 07 Jul 2021 01:02:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NG9=L7=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m0vxn-0000N3-L7
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 01:02:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f3ba340-debf-11eb-84d2-12813bfff9fa;
 Wed, 07 Jul 2021 01:02:54 +0000 (UTC)
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
X-Inumbo-ID: 0f3ba340-debf-11eb-84d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625619774;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=svGxtjeWU2QEtWezfIyOjtpwm4dPoekGlQ1IL+Wj9bU=;
  b=BPii4c7hqGnV3j/NSCXXieZydnFNX130GIYvfarPVAwycXdd3sUBc4p9
   k5UNJdp9rHPmqQBWR2PsZ2vtW5DxTkjvDFNx2PQHuw6QaLY6ZBdT4/qCj
   IYNal86tKlIY44FB1lLRv/I5Gg3Lm7dJ7R9HFcsfYE7IfNp/IfkQ8GYvA
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tMcjHEATz6LTqHmgq2WktRSk6PUNfBONgubEEnisX/+O10CWhChYsR+KAYpYhUboQgQFU/KWhj
 hLS+fWbd1wcAV62jOpNB1vQ7BzNQo2wVH/a+3Ok4+rAfHCzdeQ0ONr428NAdTMytAYWP9DGBZt
 6KQmjeVczy4qRp+jiapcxILmHFwKbufxNjKT/OXfaq4f9YLNZapG9c5Xa2xGqVK2/qC7I9dTVr
 IFwWh6sG4Lb8uvFILNi+FqdsTn+eu4mVE17UhOoeZEDFrFGADZBm5vkN2+mJTm+uz4Yev50P9G
 I2s=
X-SBRS: 5.1
X-MesageID: 47700246
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7QK7yqNrDgS9K8BcTtejsMiBIKoaSvp037Eqv3oedfU1SL3+qy
 nAppQmPHPP5Ar5O0tQ/exoWpPwIk80nKQdieJ6UItKNDOW3VdAR7sC0WKN+VLd8lXFh4xg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.83,330,1616472000"; 
   d="scan'208";a="47700246"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <jgross@suse.com>, <christian.lindig@citrix.com>,
	<dave@recoil.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH] tools/libxc: use uint32_t for pirq in xc_domain_irq_permission
Date: Wed, 7 Jul 2021 02:02:44 +0100
Message-ID: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Current unit8_t for pirq argument in this interface is too restrictive
causing failures on modern hardware with lots of GSIs. That extends down to
XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
as well. Internal Xen structures appear to be fine. Existing users of
the interface in tree (libxl, ocaml and python bindings) are already using
int for pirq representation that should be wide enough.

Domctl interface version is needed to be bumped with this change but that
was already done by 918b8842a8 ("arm64: Change type of hsr, cpsr, spsr_el1
to uint64_t") in this release cycle.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/include/xenctrl.h             | 2 +-
 tools/libs/ctrl/xc_domain.c         | 2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
 xen/include/public/domctl.h         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2a7c836..8974747 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
 
 int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t domid,
-                             uint8_t pirq,
+                             uint32_t pirq,
                              uint8_t allow_access);
 
 int xc_domain_iomem_permission(xc_interface *xch,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 7d11884..8e4ffd0 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1384,7 +1384,7 @@ int xc_vcpu_setcontext(xc_interface *xch,
 
 int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t domid,
-                             uint8_t pirq,
+                             uint32_t pirq,
                              uint8_t allow_access)
 {
     DECLARE_DOMCTL;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 6e4bc56..e5837e6 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1077,7 +1077,7 @@ CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
 					     value pirq, value allow)
 {
 	CAMLparam4(xch, domid, pirq, allow);
-	uint8_t c_pirq;
+	uint32_t c_pirq;
 	uint8_t c_allow;
 	int ret;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4dbf107..277478e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -441,7 +441,7 @@ struct xen_domctl_setdebugging {
 
 /* XEN_DOMCTL_irq_permission */
 struct xen_domctl_irq_permission {
-    uint8_t pirq;
+    uint32_t pirq;
     uint8_t allow_access;    /* flag to specify enable/disable of IRQ access */
 };
 
-- 
2.7.4


