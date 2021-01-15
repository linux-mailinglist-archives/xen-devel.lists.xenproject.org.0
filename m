Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB62F88E9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68741.123204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxp-0002Ji-0e; Fri, 15 Jan 2021 22:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68741.123204; Fri, 15 Jan 2021 22:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxo-0002Io-Sg; Fri, 15 Jan 2021 22:53:04 +0000
Received: by outflank-mailman (input) for mailman id 68741;
 Fri, 15 Jan 2021 22:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xxm-0001Wj-W2
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:53:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 880bf2fc-3093-4f9a-a717-2ccf85eaf5af;
 Fri, 15 Jan 2021 22:52:34 +0000 (UTC)
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
X-Inumbo-ID: 880bf2fc-3093-4f9a-a717-2ccf85eaf5af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f2+2EkVgRSKwnJg04mCaQfo6Y0AeER0uEpuI0RzaCok=;
  b=iL948vxEipj/eqMhk7+3/rU+EnlL26wqVZVlWPMI6+iDvA7fpblkCYSh
   bRDFJlGHvZ8E13vwTGLFO5vvOMJq7FzR4YTOXki9tg7pAEyDr7EDAiGAy
   KfTpvwN1TzqHu6tuHvLbYy/m69B5BiAtt9gOtRi1pBuWr9dLs25lYhAwC
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v+h0zdLX7VPiugjB/jYhRxC8UwuubOWqPqzGEsksAgLzCC/Rn75Wan3af3zyCWny0Fdu7dCw4f
 4vlEDqsqF4qdUCSqtBwrh0GfvWwNo6QO66WhL2q9klC4o0DjYF1OJfaETC2r89EgSrMxQobTnq
 9IlY3KJm534NjMuAGG6D9ZnUe9W/Q92gsckucHjNWNJRKCrz0oHKC38FseKa9BY1H4uVRLfPQo
 7AZ5EJ8bjx1uY3UEJS785XbVAbgYvpnBhQcUT3cbeAVLrFp3sEESG+1Lkb/gE0ycNOEceeLsSr
 GyU=
X-SBRS: 5.1
X-MesageID: 35263548
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35263548"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 4/4] tools/ocaml/xenstored: mkdir conflicts were sometimes missed
Date: Fri, 15 Jan 2021 22:29:09 +0000
Message-ID: <db01981b9be8247b8786caf923cb6ac221b9a3b3.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Due to how set_write_lowpath was used here it didn't detect
create/delete conflicts.
When we create an entry we must mark our parent as modified
(this is what creating a new node via write does).

Otherwise we can have 2 transactions one creating, and another deleting
a node both succeeding depending on timing.
Or one transaction reading an entry, concluding it doesn't exist,
do some other work based on that information and successfully commit
even if another transaction creates the node via mkdir meanwhile.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/transaction.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/transaction.ml b/tools/ocaml/xenstored/transaction.ml
index 4ee77b6e14..0466b04ae3 100644
--- a/tools/ocaml/xenstored/transaction.ml
+++ b/tools/ocaml/xenstored/transaction.ml
@@ -172,7 +172,7 @@ let write t perm path value =
 
 let mkdir ?(with_watch=true) t perm path =
 	Store.mkdir t.store perm path;
-	set_write_lowpath t path;
+	set_write_lowpath t (Store.Path.get_parent path);
 	if with_watch then
 		add_wop t Xenbus.Xb.Op.Mkdir path
 
-- 
2.29.2


