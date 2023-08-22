Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F778417B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588451.919954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR1L-0006MG-W9; Tue, 22 Aug 2023 13:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588451.919954; Tue, 22 Aug 2023 13:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR1L-0006Jf-Sd; Tue, 22 Aug 2023 13:02:07 +0000
Received: by outflank-mailman (input) for mailman id 588451;
 Tue, 22 Aug 2023 13:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u85s=EH=citrix.com=prvs=59133c41f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYR1K-0006JZ-Qw
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:02:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 160bb14a-40ec-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 15:02:04 +0200 (CEST)
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
X-Inumbo-ID: 160bb14a-40ec-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692709324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TlVAlZ31s9tX04Xo26upFirMQYSev2Qp3mm81UZZICQ=;
  b=J5lKD4p4OcrNEAVAaaG4EydFsvHart6h8NEBJGCJhPutlQ+ODksA88FU
   OQk3S740A7X2msb8qtNC/6HOjPkGOwiN/Q1+CAw2iHop+CAlqrpdE0CcQ
   KvW7nhpLF5Hc8roFP+f/aZl8q+u8a7luavjJ8dA38c6fQ2+qegi/v0nzX
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118928949
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6KOb0KjmVD90NF0gFdJiTS7UX161aBAKZh0ujC45NGQN5FlHY01je
 htvW2iDOvnYNDamKtx2b9vk9hwHu5fczoRqSwVor309RC8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AWEzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ9LSIxfC2n2tmW64KpWuVHgPgoDPHCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zKXpTSoXkBy2Nq30Hmbo0mjpPD2oQTCeJkoDoKzscYxnwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAwKH0+dxIgEDAlyOnxsI0YiC7Ebu5KRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoS7LkWN4umsWyKJV3iEsIGSBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YgLlHbpnA3NRTAhwgBdXTAdollZ
 f+mnTuEVy5GWcyLMhLrLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/L7/celc/RDh/UZc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AWXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:rV4Rfa5gng2VK40TJQPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AoRrnz2tOJoSbV9233eIPcJuQ6IsAd2/h3kr0fnS?=
 =?us-ascii?q?YIlZ7WLG+T2Ob2JtNxp8=3D?=
X-Talos-MUID: 9a23:3R6JFwUGd4Ch4xPq/CavmmBZO+V32piJMWAWq485sI68bjMlbg==
X-IronPort-AV: E=Sophos;i="6.01,193,1684814400"; 
   d="scan'208";a="118928949"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: Update FreeBSD to 12.4
Date: Tue, 22 Aug 2023 14:01:42 +0100
Message-ID: <20230822130142.430189-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Example run:

  https://cirrus-ci.com/task/4911727880437760
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 9bb6cce4ead3..7e0beb200d7b 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -17,7 +17,7 @@ freebsd_template: &FREEBSD_TEMPLATE
 task:
   name: 'FreeBSD 12'
   freebsd_instance:
-    image_family: freebsd-12-3
+    image_family: freebsd-12-4
   << : *FREEBSD_TEMPLATE
 
 task:

base-commit: a7d04b0e7935620e9f8b9e693d818bf043a5ecd6
-- 
2.30.2


