Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856513C681B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 03:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154926.286129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37HA-0005Fi-8R; Tue, 13 Jul 2021 01:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154926.286129; Tue, 13 Jul 2021 01:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37HA-0005E8-5O; Tue, 13 Jul 2021 01:31:56 +0000
Received: by outflank-mailman (input) for mailman id 154926;
 Tue, 13 Jul 2021 01:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6+yj=MF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m37H8-0005E2-Cp
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 01:31:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fbb7b1b-f65c-4a29-bddb-06a340249361;
 Tue, 13 Jul 2021 01:31:53 +0000 (UTC)
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
X-Inumbo-ID: 7fbb7b1b-f65c-4a29-bddb-06a340249361
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626139913;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=NkwRuJxlwnRRpB4yrKu+6gXylzkNyPxMz5n1KzPcKMM=;
  b=GbG7w/8kUVSnftxIc+jrcN2ycUwNVcrMecuzHDKuXL3vhq4fJ70hdumF
   PpmkgauT3wTyp+qKmH+ccRrWIX0uJPtDGvE1jaD71uYF9rmeu6ilpswIo
   NBZNlHG7i2CFmiW7Sa7fTm59TAnm98OBxo4D0Z0msaV/BgQ3Tj2n569Q2
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P4dJ5aX6S1uEC8ZSiiJyKE3adwg2pQF/tC5RqfwNfyM69Plhct4gHXII/6uc8bWss/6/lX5BzT
 VjNKtWnK/KXaJgw7CLj6vhU47dLTcXw2oFV2ADnLqBjfZ5wNb5HhFuKSVg/rQZc6SC8GTU+0G+
 oWVaNWnAjFgHXZRHvm1FfSXH+7wzz9SBE38Ka7S6j4KsGo0nte+uVniqLLtW0VLeyHc6bztlER
 v/YSCO0zA+qSDUK9nRmf2ZSjp6HrQ10du+WckQ5b13pHgZOA9Hg5gkCkV1ShXFGx5OggD8GIEA
 i0Q=
X-SBRS: 5.1
X-MesageID: 48122841
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BWtsVKqssXqj+b3Fya/xptIaV5ojeYIsimQD101hICG8cqSj9v
 xG/c5rsyMc5wxhO03I9eruBEDiewK6yXcW2/hyAV7KZmCP0wHEQL2KhbGSpwEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="48122841"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <jgross@suse.com>, <christian.lindig@citrix.com>,
	<dave@recoil.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2] tools/libxc: use uint32_t for pirq in xc_domain_irq_permission
Date: Tue, 13 Jul 2021 02:31:41 +0100
Message-ID: <1626139901-9444-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Current unit8_t for pirq argument in this interface is too restrictive
causing failures on modern hardware with lots of GSIs. That extends down to
XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
as well.

Internal Xen structures appear to be fine. Existing users of the interface
in tree (libxl, ocaml and python bindings) are currently using signed int
for pirq representation which should be wide enough. Converting them to
uint32_t now is desirable to avoid accidental passing of a negative
number (probably denoting an error code) by caller as pirq, but left for
the future clean up.

Domctl interface version is needed to be bumped with this change but that
was already done by 918b8842a8 ("arm64: Change type of hsr, cpsr, spsr_el1
to uint64_t") in this release cycle.

Additionally, take a change and convert allow_access argument to bool.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---

Changes in v2:
- extra wording for clarity in commit message (Julien)
- change allow_access to bool (Andrew)
- add padding (Jan)

---
 tools/include/xenctrl.h             | 4 ++--
 tools/libs/ctrl/xc_domain.c         | 4 ++--
 tools/ocaml/libs/xc/xenctrl_stubs.c | 4 ++--
 xen/include/public/domctl.h         | 3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2a7c836..14adaa0 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1385,8 +1385,8 @@ int xc_domain_ioport_permission(xc_interface *xch,
 
 int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t domid,
-                             uint8_t pirq,
-                             uint8_t allow_access);
+                             uint32_t pirq,
+                             bool allow_access);
 
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 7d11884..1cdf3d1 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1384,8 +1384,8 @@ int xc_vcpu_setcontext(xc_interface *xch,
 
 int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t domid,
-                             uint8_t pirq,
-                             uint8_t allow_access)
+                             uint32_t pirq,
+                             bool allow_access)
 {
     DECLARE_DOMCTL;
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 6e4bc56..266eb32 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1077,8 +1077,8 @@ CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
 					     value pirq, value allow)
 {
 	CAMLparam4(xch, domid, pirq, allow);
-	uint8_t c_pirq;
-	uint8_t c_allow;
+	uint32_t c_pirq;
+	bool c_allow;
 	int ret;
 
 	c_pirq = Int_val(pirq);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4dbf107..088c964 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -441,8 +441,9 @@ struct xen_domctl_setdebugging {
 
 /* XEN_DOMCTL_irq_permission */
 struct xen_domctl_irq_permission {
-    uint8_t pirq;
+    uint32_t pirq;
     uint8_t allow_access;    /* flag to specify enable/disable of IRQ access */
+    uint8_t pad[3];
 };
 
 
-- 
2.7.4


