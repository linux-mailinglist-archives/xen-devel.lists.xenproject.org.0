Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C431DD86
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86354.162118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPvF-0003j6-W9; Wed, 17 Feb 2021 16:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86354.162118; Wed, 17 Feb 2021 16:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPvF-0003iO-Ry; Wed, 17 Feb 2021 16:43:29 +0000
Received: by outflank-mailman (input) for mailman id 86354;
 Wed, 17 Feb 2021 16:43:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2sW=HT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCPvD-0003Xr-Su
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:43:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed5c5453-c7cc-4fbf-967e-74a5772ed26d;
 Wed, 17 Feb 2021 16:43:18 +0000 (UTC)
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
X-Inumbo-ID: ed5c5453-c7cc-4fbf-967e-74a5772ed26d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613580198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=YoxtGpvRbXNh9imaug3gf79BTXd/2y72nycSyNyRXCg=;
  b=eI46XjKk6Em84++U+WHODnrzt2CgHcS/U+obnWZgKmWInA1hyFT9NhVj
   EcuHYt7PoUaX2VADDrbp3hmjaYSjJ+ZY2nW7nl+Prqq+8HGBE1Ki+k1g1
   GmQNgtigNstLd32xKEpOGDlvWhEfGX3GXA2XLp9GjtfMk0LdwvRnHf7KL
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: veN/DLGoe6oZH6JG+7YX0Jwp/aRqbZ4EWH5CTCNGti/k9h0KWFwEcpAPxKIpLwOdBQ6emzfnxL
 NpDKAXMPXrMEW8p5Nt86aszLYI7RRh+ln64NwbQjGF9TXkTRRdxYo4ZZqvxXVsO1Y2VVwN0WQ2
 wJCZmeQnRVpc0oZYUjEWTNZ8YFptQpxdQqrC7C6vL3WmtAxnR68eP+SLKlp2v4d4dv4iatVKDS
 ujmmJ9rc6fY5qTm9Ah3YAMEsosAr5xG0ftnNYjI1cIZgUKJmrNQ8UW62WfvKc75wsZU7wjwBth
 KZg=
X-SBRS: 5.1
X-MesageID: 37456612
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37456612"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 2/3] tools/libxl: Simplfy the out path in libxl__domain_get_device_model_uid()
Date: Wed, 17 Feb 2021 16:42:50 +0000
Message-ID: <20210217164251.11005-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210217164251.11005-1-andrew.cooper3@citrix.com>
References: <20210217164251.11005-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

All paths heading towards `out` have rc = 0.  Assert this property.

The intended_uid check is an error path.  Use the err label rather than
falling into subsequent success logic.

With the above two changes, the two `if (!rc)` checks can be dropped.

Now, both remaining tests start with `if (user ...)`.  Combine the two blocks.

No functional change, but far simpler logic to follow.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 30b3242e57..7843c283ca 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -243,16 +243,17 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     goto err;
 
 out:
-    /* First, do a root check if appropriate */
-    if (!rc) {
-        if (user && intended_uid == 0) {
+    assert(rc == 0);
+
+    if (user) {
+        /* First, do a root check if appropriate */
+        if (intended_uid == 0) {
             LOGD(ERROR, guest_domid, "intended_uid is 0 (root)!");
             rc = ERROR_INVAL;
+            goto err;
         }
-    }
 
-    /* Then do the final set, if still appropriate */
-    if (!rc && user) {
+        /* Then do the final set. */
         state->dm_runas = user;
         if (kill_by_uid)
             state->dm_kill_uid = GCSPRINTF("%ld", (long)intended_uid);
-- 
2.11.0


