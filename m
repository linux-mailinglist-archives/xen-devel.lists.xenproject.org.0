Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57D3EEF08
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 17:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167967.306657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0uq-00085h-Gt; Tue, 17 Aug 2021 15:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167967.306657; Tue, 17 Aug 2021 15:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0uq-00083V-DU; Tue, 17 Aug 2021 15:22:12 +0000
Received: by outflank-mailman (input) for mailman id 167967;
 Tue, 17 Aug 2021 15:22:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Pxr=NI=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mG0uo-00083H-GW
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 15:22:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 604c8f7d-5024-4711-b71a-28c620c49a9e;
 Tue, 17 Aug 2021 15:22:09 +0000 (UTC)
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
X-Inumbo-ID: 604c8f7d-5024-4711-b71a-28c620c49a9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629213729;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=TY0qismOk1WtVVSMXWeyaUUstM67+EHkiHh7oNQ0olg=;
  b=J260tM1WOdr8ZScGekElFS1ZZtJNr11cw7rVlXYNSUuw81wODbXvtHrP
   z8Qd77kIb7U759+aLq+FtsT/xlcdolEEUTb2Etd78GZvZEUfFMHg47jKC
   kLA3MZYaYWuZUlS1Y0bvDNpJbTSm3cCuP6A50C4v8uJbLbfkmO5RyAt3i
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xjW3u0gF7PP+I0m3LAQkvSQyKUu32M7NAKTvPnRw3IKwkG4BsbspjsMdn/voJ1GJyhelgFebFY
 pfounqrlRfD24PGH4zP9xkedgFedyLFbiNHy8a00tQaBFnI/0pHsvWqmfk5bThke84zpB4fLoK
 6qW04RRjxe+vwpWgDCYWZsKe9W3RJaXcHiCAgn1/VQPVT7N8BSiU9YzOtLnrCimyl+bB1+lC4C
 VwqK2H+vvxWhfbMWAJsQo617IIlJ/kXPI7fU+T5JgDVMUr0YdvNYGe7OL+TMqJNOHHMyJkyP+n
 PkaKZPSjtiCaW7QyUV4kzq46
X-SBRS: 5.1
X-MesageID: 50650082
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cvk4HanDMkZI9fMNuIRNWXQ5fV7pDfI63DAbv31ZSRFFG/Fxl6
 iV8sjztCWE7wr5N0tBpTntAsW9qBDnhPpICOsqTNSftWDd0QPCRuxfBOPZsljd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50650082"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] libs/guest: Move the guest ABI check earlier into xc_dom_parse_image()
Date: Tue, 17 Aug 2021 16:19:24 +0100
Message-ID: <20210817151924.6674-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Xen may not support 32-bit PV guest for a number of reasons (lack of
CONFIG_PV32, explicit pv=no-32 command line argument, or implicitly
due to CET being enabled) and advertises this to the toolstack via the
absence of xen-3.0-x86_32p ABI.

Currently, when trying to boot a 32-bit PV guest, the ABI check is too
late and the build explodes in the following manner yielding an
unhelpful error message:

  xc: error: panic: xg_dom_boot.c:121: xc_dom_boot_mem_init: can't allocate low memory for domain: Out of memory
  libxl: error: libxl_dom.c:586:libxl__build_dom: xc_dom_boot_mem_init failed: Operation not supported
  libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
  libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 1:Non-existant domain
  libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Unable to destroy guest
  libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destruction of domain failed

Move the ABI check earlier into xc_dom_parse_image() along with other
ELF-note feature checks.  With this adjustment, it now looks like
this:

  xc: error: panic: xg_dom_boot.c:88: xc_dom_compat_check: guest type xen-3.0-x86_32p not supported by xen kernel, sorry: Invalid kernel
  libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
  domainbuilder: detail: xc_dom_release: called
  libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 11:cannot (re-)build domain: -3
  libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 11:Non-existant domain
  libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 11:Unable to destroy guest
  libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 11:Destruction of domain failed

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_boot.c | 4 ----
 tools/libs/guest/xg_dom_core.c | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index dac96b17a5..f809dcbe97 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -191,10 +191,6 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
     }
     dom->shared_info_mfn = info.shared_info_frame;
 
-    /* sanity checks */
-    if ( !xc_dom_compat_check(dom) )
-        return -1;
-
     /* initial mm setup */
     if ( dom->arch_hooks->setup_pgtables &&
          (rc = dom->arch_hooks->setup_pgtables(dom)) != 0 )
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index 4918ee517b..2e4c1330ea 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -922,6 +922,10 @@ int xc_dom_parse_image(struct xc_dom_image *dom)
         goto err;
     }
 
+    /* Check guest ABI */
+    if ( !xc_dom_compat_check(dom) )
+        return -1;
+
     /* check features */
     for ( i = 0; i < XENFEAT_NR_SUBMAPS; i++ )
     {
-- 
2.11.0


