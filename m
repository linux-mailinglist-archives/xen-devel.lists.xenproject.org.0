Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB653BC304
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150632.278506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzk-0003Kl-EX; Mon, 05 Jul 2021 19:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150632.278506; Mon, 05 Jul 2021 19:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzk-0003I7-Ay; Mon, 05 Jul 2021 19:11:04 +0000
Received: by outflank-mailman (input) for mailman id 150632;
 Mon, 05 Jul 2021 19:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tzj-0003HJ-02
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:11:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5d8e537-8481-41c3-9533-1295432eb5e4;
 Mon, 05 Jul 2021 19:11:02 +0000 (UTC)
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
X-Inumbo-ID: b5d8e537-8481-41c3-9533-1295432eb5e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LyGR43uHEWb6t2bUOODNzpfUs/a64k/3YzkKZGB+u+c=;
  b=TdgK53jhLj0+ImqmTKRC0uZ7TQ7CGP93dFFfWy0c1ZJbHYHGW7YuKO4/
   iB1eBZWIenNrwplvOJ4rYopxO29w/S0ZDfxX5LeTNQgoqb1yDTnLI/rrY
   HjOpYUIVWpnYepvvmNgR5rrV0uOmL5KNIreZIUcL7lDpZ8bxo4r51bGmQ
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zQgEcGNxfycW0ynA3O1Td4yotW/XnQR3ldkBfHRa0frV98SDnxaIICPEu81NmOM+lVMa48PQw8
 HKKcCfkeajlNObbmcTrhwKkzMEVChahIxXjS+RM6QOgb3G/gCLGR+gL2hHbEtdAIp/Y7ZP5sGc
 Ii3iSjein3WaHlWizSucTl4grmtqXOkaJb/idT36E7oCRnkGW14LFQc1CMSjvW61vbL1hgfHA9
 6B+wk91+yy8X+Y9Ce0+K9bgsqkS6osqGkiOJ/Tk0/cEkR3ckk5diqvu72sel5lmkvqtkcu/uHc
 u9k=
X-SBRS: 5.1
X-MesageID: 47973427
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jlPoQqGR/IwqK6/TpLqE7MeALOsnbusQ8zAXP0AYc31om62j5r
 iTdZsgpHzJYVoqN03I3OrwXJVoIkmsjKKdg7NhX4tKNTOO0ADDQe1fBMnZslrd8kXFh4hgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47973427"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 4/5] tools/migration: unify type checking for data pfns in the VM
Date: Mon, 5 Jul 2021 20:10:26 +0100
Message-ID: <20210705191027.15107-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Olaf Hering <olaf@aepfle.de>

Introduce a helper which decides if a given pfn in the migration
stream is backed by memory.

This highlights more clearly that type XEN_DOMCTL_PFINFO_XALLOC (a
synthetic toolstack-only type used between Xen 4.2 to 4.5 which
indicated a dirty page on the sending side for which no data will be
send in the initial iteration) does get populated in the VM.

No change in behaviour intended, except for invalid page types which now
have a safer default.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  | 29 +++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_restore.c |  4 +---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e8436d1abb14..7f4b0439f6bd 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -484,6 +484,35 @@ static inline bool is_known_page_type(uint32_t type)
     }
 }
 
+/* Page type backed by RAM in the guest? */
+static inline bool page_type_to_populate(uint32_t type)
+{
+    switch ( type )
+    {
+    case XEN_DOMCTL_PFINFO_NOTAB:
+
+    case XEN_DOMCTL_PFINFO_L1TAB:
+    case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L2TAB:
+    case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L3TAB:
+    case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L4TAB:
+    case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_XALLOC:
+        return true;
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+    default:
+        return false;
+    }
+}
+
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 508953fd3cf7..3d63442d4537 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -152,9 +152,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
-        if ( (!types || (types &&
-                         (types[i] != XEN_DOMCTL_PFINFO_XTAB &&
-                          types[i] != XEN_DOMCTL_PFINFO_BROKEN))) &&
+        if ( (!types || page_type_to_populate(types[i])) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
             rc = pfn_set_populated(ctx, original_pfns[i]);
-- 
2.11.0


