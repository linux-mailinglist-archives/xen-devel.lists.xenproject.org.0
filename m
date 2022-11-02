Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC06161C7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435805.689612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvk-00024P-BW; Wed, 02 Nov 2022 11:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435805.689612; Wed, 02 Nov 2022 11:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvk-00022k-7s; Wed, 02 Nov 2022 11:29:12 +0000
Received: by outflank-mailman (input) for mailman id 435805;
 Wed, 02 Nov 2022 11:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqBvi-00021c-Ng
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:29:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f745791-5aa1-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 12:29:07 +0100 (CET)
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
X-Inumbo-ID: 8f745791-5aa1-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667388547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sdBaG8nza+w2eZvi73Kk9Zj+hZVkMYunpXxpVdr9hzQ=;
  b=g8rtRZ2qw0KHt3/bu6i6daM8MWTNKGiFKOV/mDoCJogV9FCAgEHQJ9dZ
   h4SpmUx3A9J7aHEPhvangoYNkDFxTw7Pc+m7lHTyOpK56Fzysc61/uNFX
   DLPHShzpyfxv7onrRlRy0+D4+/9wN++YPOzGEJGFELW86KCWbWy0Ydsfh
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84016366
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wwnYDKoVDoZP1FIIzQGUGXinGBheBmLVZRIvgKrLsJaIsI4StFCzt
 garIBnUM/iPMzahLdEla9uzoRsAvJCGxoBgTwc+rilgRCxB95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W5wUmAWP6gR5gaHzyNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADBVcSC52fz1/KmybehypMMHC9bkGqpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 j6epjqiXE9y2Nq3xSC182yehPL1uzLSSK43L7K2x85WjwjGroAUIEJPDgbqyRWjsWa8RtZeJ
 ko86ico668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YVKQ8K2F6wy7Pyc9JHUHIyQDSGMt89Tl5Y0+kB/LZtJiC7KuyM34Hynqx
 DKHpzR4gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8Ct5PJGVXdK2qmTA5NFBMqSean6es
 14tzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr741s52XNFAJe9gUabiaqVAt9i86XvHM+Nuhv8PosXOcgZmONqEUhTia+sM4LFyhZEfUIXY
 83znSOQ4ZEyUP0P8dZOb71BuYLHPwhnrY8pebj1zg68zZ2Vb2OPRLEOPTOmN75ns/je/1qNo
 ocGa6NmLimzt8WnPEHqHXM7dwhWfRDX+7irwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 xmAtrtj4AOm3RX6xfCiMC8LhEXHAcki9hrW/EUEYT6V5pTUSd/xsvdEL8tmI+dPGS4K5accc
 sTpsv6oWpxnIgkrMRxEBXUhhOSOrCiWuD8=
IronPort-HdrOrdr: A9a23:orygW6E5DywoYn+EpLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84016366"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH for-4.17 1/4] xen: Add licence information to public/errno.h
Date: Wed, 2 Nov 2022 11:28:51 +0000
Message-ID: <20221102112854.49020-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102112854.49020-1-anthony.perard@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes: 81f559e97974 ("make error codes a formal part of the ABI")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/public/errno.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5c53af6af9..6bdc8c5079 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: MIT */
+
 /*
  * There are two expected ways of including this header.
  *
-- 
Anthony PERARD


