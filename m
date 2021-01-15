Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CBE2F886E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68661.122963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbP-00068D-Qe; Fri, 15 Jan 2021 22:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68661.122963; Fri, 15 Jan 2021 22:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbP-00067W-N2; Fri, 15 Jan 2021 22:29:55 +0000
Received: by outflank-mailman (input) for mailman id 68661;
 Fri, 15 Jan 2021 22:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbO-00062b-7z
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baa3299e-2f51-4b81-8b79-0bcd3ff41003;
 Fri, 15 Jan 2021 22:29:49 +0000 (UTC)
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
X-Inumbo-ID: baa3299e-2f51-4b81-8b79-0bcd3ff41003
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NHqTfTuH/ZE50yfbzAZKh31IXsGU89p4AdJLcN9tjb0=;
  b=bBB0TI/EpCW2h9OIlINjoJxd7NsDmRVd2+p/uwKR/QnOW/soMLFoVMtu
   A19hBsvL8j0RaZDxNK6FcU6/ZBzkF1eqxxAs6On9YpynnoA2L+sfNs4mc
   sN2a5zGNFc4bBEG6BkUh/51fM7c7s3RgeAprnVdc4mUkv+slQnrtKF10C
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Wo0p2h268fOq2mvPfOhvZ6ygDMuZtg6OFRmvbqMszVyh23LaMimvh9i2eRntArErmyZWK2orkQ
 7jkLcwQGs89rczUZgR/Zu1TXzRFUcwkTVXElzRFvS5hxbAQS1CFTOE/fYmI6R97udzMKst4jtf
 Py2UODmWIaTJ1JsQ5zBtn3jEiKOSUywK5sH1p70NF4fKolFKLKFNmUogdqJhui/KqH3ZjNYIRo
 n232mpYy/ZubG6MwqauNBrIbTABJ6tnm6soONt12PmZ8jXRf8aB06DmHXl4KjlmKvkJsqPusPM
 jpU=
X-SBRS: 5.1
X-MesageID: 35262766
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35262766"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/8] docs/designs/xenstore-migration.md: clarify that deletes are recursive
Date: Fri, 15 Jan 2021 22:28:45 +0000
Message-ID: <9f3823a494bd512348812355fbfecf6be447aca0.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since V1:
* post publicly now that the XSA is out
---
 docs/designs/xenstore-migration.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 2ce2c836f5..f44bc0c61d 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -365,7 +365,8 @@ record previously present).
 |              | 0x0001: read                                   |
 |              | 0x0002: written                                |
 |              |                                                |
-|              | The value will be zero for a deleted node      |
+|              | The value will be zero for a recursively       |
+|              | deleted node                                   |
 |              |                                                |
 | `perm-count` | The number (N) of node permission specifiers   |
 |              | (which will be 0 for a node deleted in a       |
-- 
2.29.2


