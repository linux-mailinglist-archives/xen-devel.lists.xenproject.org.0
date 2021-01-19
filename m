Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2652FB615
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 13:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70331.126178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1q7V-0002Wq-7b; Tue, 19 Jan 2021 12:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70331.126178; Tue, 19 Jan 2021 12:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1q7V-0002WR-4C; Tue, 19 Jan 2021 12:28:25 +0000
Received: by outflank-mailman (input) for mailman id 70331;
 Tue, 19 Jan 2021 12:28:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1q7T-0002WL-Ix
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 12:28:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d95d99a9-6f72-4b9c-badc-f41b5e1c254d;
 Tue, 19 Jan 2021 12:28:21 +0000 (UTC)
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
X-Inumbo-ID: d95d99a9-6f72-4b9c-badc-f41b5e1c254d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611059301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c0A7OMN1EfokLuqRtenZsFJGjhevkL56GYxhObEj+/U=;
  b=fCkMmH6jUpI5j8BV3tCfRlPY+pM6TtkyQCtEXLw12k0OH616wBAGiiHD
   2OdUAo1w9Pja0I/MvZ0wysSUs3v5aUlsrqGGAmVkbAqGLM63P50tOPZ4p
   aeCXSziCCUi8SpujfhDh+3oOtYWPTP7CQSIqc00NgBqrONog77g7NN4c0
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1HPtCO1GEU4D62pzfndjMtQCpbrp6N96kVZLarahPxFqzuKH1C99onb0hebOlXdkFwecILr8d7
 NvRf6klTGWcRk9KColt6gVpkU3jIUgWry+6zt8tJdhYezaOXRap2ZLa9eHAsl6PHugHNswbV8d
 7ygyRfsBH5VEbqMNEwnjUfIIJMNElkf2dH7O8Y/jPSosDQKitYWddNafSG9Itv0wMGUfbjFl8m
 BkAnMUIKmlKfPz/YxqU7t5r3C9hImsua/pURoErgMMt0U1add9vg6UfeXMuN4eamMsXHOUzErW
 +wY=
X-SBRS: 5.1
X-MesageID: 36660351
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="36660351"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v2] x86/mm: Short circuit damage from "fishy" ref/typecount failure
Date: Tue, 19 Jan 2021 12:27:56 +0000
Message-ID: <20210119122756.27772-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210119094122.23713-1-andrew.cooper3@citrix.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This code has been copied in 3 places, but it is problematic.

All cases will hit a BUG() later in domain teardown, when a the missing
type/count reference is underflowed.

Don't complicated the logic by leaving a totally unqualified domain crash, and
a timebomb which will be triggered by the toolstack at a slightly later, and
seemingly unrelated, point.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v2:
 * Reword the commit message.
 * Switch BUG() to BUG_ON() to further reduce code volume.
---
 xen/arch/x86/hvm/ioreq.c     | 11 ++---------
 xen/arch/x86/hvm/vmx/vmx.c   | 11 ++---------
 xen/arch/x86/mm/mem_paging.c | 17 ++++-------------
 3 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df87f..0c38cfa151 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -366,15 +366,8 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
     if ( !page )
         return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+    /* Domain can't know about this page yet - something fishy going on. */
+    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
 
     iorp->va = __map_domain_page_global(page);
     if ( !iorp->va )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3d..8e438cb781 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3042,15 +3042,8 @@ static int vmx_alloc_vlapic_mapping(struct domain *d)
     if ( !pg )
         return -ENOMEM;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(d);
-        return -ENODATA;
-    }
+    /* Domain can't know about this page yet - something fishy going on. */
+    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
 
     mfn = page_to_mfn(pg);
     clear_domain_page(mfn);
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786e..6e90019e76 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -379,19 +379,10 @@ static int prepare(struct domain *d, gfn_t gfn,
         page = alloc_domheap_page(d, 0);
         if ( unlikely(page == NULL) )
             goto out;
-        if ( unlikely(!get_page(page, d)) )
-        {
-            /*
-             * The domain can't possibly know about this page yet, so failure
-             * here is a clear indication of something fishy going on.
-             */
-            gprintk(XENLOG_ERR,
-                    "%pd: fresh page for GFN %"PRI_gfn" in unexpected state\n",
-                    d, gfn_x(gfn));
-            domain_crash(d);
-            page = NULL;
-            goto out;
-        }
+
+        /* Domain can't know about this page yet - something fishy going on. */
+        BUG_ON(!get_page(page, s->target));
+
         mfn = page_to_mfn(page);
         page_extant = 0;
 
-- 
2.11.0


