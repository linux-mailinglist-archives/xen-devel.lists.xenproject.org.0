Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EC30E12B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80998.148807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4Z-0008VP-B9; Wed, 03 Feb 2021 17:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80998.148807; Wed, 03 Feb 2021 17:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4Z-0008Ul-76; Wed, 03 Feb 2021 17:36:11 +0000
Received: by outflank-mailman (input) for mailman id 80998;
 Wed, 03 Feb 2021 17:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7M4Y-0008Tz-5S
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:36:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b008ad3-6a96-418a-91a1-c75a1770c9a8;
 Wed, 03 Feb 2021 17:36:08 +0000 (UTC)
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
X-Inumbo-ID: 8b008ad3-6a96-418a-91a1-c75a1770c9a8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+a0zjEE5v0WInnTQX+eiSAhYh9ndjnBsYijZ422tKA=;
  b=fs8xPXZKpH1sZfIJlXXr+ldYqu/g/tiqtxvJDMOXUddIMOtmmgbBk6hy
   WM5ZlfpvNSeUQDxVxMmT9INJl83SCUz6kCsAJtjzmKnG5HjO35MN54khp
   nE++qJZROaJZ8+jn0EUrIEZ2Y75sB3Ofo9GF0p11FC+rKug1WnZm2uuZq
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +x0IaZ3Lv3ThQBPVJscpHNRMxzB/BYwmXJhwj5OFmM6hJOqn45xZqQCsWXfPxdtUitE8b+bm0r
 YOKqsNPk7vmN1z3mTSA+c/oNaMdzlREZdwzF1aKNdeHVqh1HXe/rs3UxGM1NCbI/L2lHHI6Pdx
 EblhuLgnJO5COnFhalVab6pGjV+lo00qV+TVJXOLSgE6D2FgfVFah6car82xxYk4GAlclweyQT
 Idq1iFqQaucakg53vqqKN+aBawbcP1E6tJcyhzb8VpK4TJuQWqW+Ln7Hzus+Xw3te1q04myv6T
 ues=
X-SBRS: 4.0
X-MesageID: 36517500
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36517500"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: [PATCH 3/3] tools/oxenstored: mkdir conflicts were sometimes missed
Date: Wed, 3 Feb 2021 17:35:49 +0000
Message-ID: <20210203173549.21159-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173549.21159-1-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Due to how set_write_lowpath was used here it didn't detect create/delete
conflicts.  When we create an entry we must mark our parent as modified
(this is what creating a new node via write does).

Otherwise we can have 2 transactions one creating, and another deleting a node
both succeeding depending on timing.  Or one transaction reading an entry,
concluding it doesn't exist, do some other work based on that information and
successfully commit even if another transaction creates the node via mkdir
meanwhile.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/ocaml/xenstored/transaction.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/transaction.ml b/tools/ocaml/xenstored/transaction.ml
index 25bc8c3b4a..17b1bdf2ea 100644
--- a/tools/ocaml/xenstored/transaction.ml
+++ b/tools/ocaml/xenstored/transaction.ml
@@ -165,7 +165,7 @@ let write t perm path value =
 
 let mkdir ?(with_watch=true) t perm path =
 	Store.mkdir t.store perm path;
-	set_write_lowpath t path;
+	set_write_lowpath t (Store.Path.get_parent path);
 	if with_watch then
 		add_wop t Xenbus.Xb.Op.Mkdir path
 
-- 
2.11.0


