Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232827EA29
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712.2395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcOp-0004Xo-6O; Wed, 30 Sep 2020 13:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712.2395; Wed, 30 Sep 2020 13:44:03 +0000
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
	id 1kNcOp-0004XO-2k; Wed, 30 Sep 2020 13:44:03 +0000
Received: by outflank-mailman (input) for mailman id 712;
 Wed, 30 Sep 2020 13:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcOn-0004XG-Nf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7361e63-6388-4a26-a8f1-db055c534621;
 Wed, 30 Sep 2020 13:44:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcOn-0004XG-Nf
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:01 +0000
X-Inumbo-ID: d7361e63-6388-4a26-a8f1-db055c534621
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7361e63-6388-4a26-a8f1-db055c534621;
	Wed, 30 Sep 2020 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=75RX+AZWjDMe6ak5ckm6ABFszfT5TF31cklPbQHcxpg=;
  b=XZBWohuL54YIvny7D2e9VpoJVwojbxqvaU9x2Hw7eKj1ueXs2CW211nH
   nBFKy4kJqGzak6k/nODpqQ/Li+mZnQKpgZAWDAVqnYuXNkd3wVK4359GQ
   pqwaWBDg5CNIYI0zMu3ytM9ELc4jkKd5Qj9qAaAYTHTOXE1F0DWV/CJ/t
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3K4PJ/Y/F2MlGKIteVCm0+8eKfmy46PsqNoEUVhsURGR+kYwYalZOfCPHBMSXkjheV0tNZzyfl
 /29OcoAj21arAOUD0mrYjDWaLauRxRS9ZKQDeFkvuPiBrkPp/wads34uUBtxLAy59ny7NrLW9K
 bOuUZRfNMQmVAWyATv5rCN/iUqrXX4beCzczJ3zbNCgxhuOLvAXiw8Nd+QZd9PbE9cy/VugZqk
 4TC+1I7O68fdcwWSKQNZQFwhakrZtxDMTSg2uZJI1Xt0LRlDGN3pCM1dXeVVtYd4vy6MWcs0en
 CA4=
X-SBRS: None
X-MesageID: 28300089
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28300089"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 1/8] tools/libxl: Simplify DOMCTL_CDF_ flags handling in libxl__domain_make()
Date: Wed, 30 Sep 2020 14:42:41 +0100
Message-ID: <20200930134248.4918-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The use of the ternary operator serves only to obfuscate the code.  Rewrite it
in more simple terms, avoiding the need to conditionally OR zero into the
flags.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libxl/libxl_create.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 1031b75159..ed671052d7 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -612,10 +612,12 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
             create.flags |= XEN_DOMCTL_CDF_hvm;
-            create.flags |=
-                libxl_defbool_val(info->hap) ? XEN_DOMCTL_CDF_hap : 0;
-            create.flags |=
-                libxl_defbool_val(info->oos) ? 0 : XEN_DOMCTL_CDF_oos_off;
+
+            if ( libxl_defbool_val(info->hap) )
+                create.flags |= XEN_DOMCTL_CDF_hap;
+
+            if ( !libxl_defbool_val(info->oos) )
+                create.flags |= XEN_DOMCTL_CDF_oos_off;
         }
 
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
-- 
2.11.0


