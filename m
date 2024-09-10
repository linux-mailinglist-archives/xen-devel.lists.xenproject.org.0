Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D7973128
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795234.1204480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoE-0007U2-C4; Tue, 10 Sep 2024 10:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795234.1204480; Tue, 10 Sep 2024 10:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoE-0007QU-5w; Tue, 10 Sep 2024 10:09:18 +0000
Received: by outflank-mailman (input) for mailman id 795234;
 Tue, 10 Sep 2024 10:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoC-0006hI-2u
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb55668f-6f5c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:09:14 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 948624EE07BF;
 Tue, 10 Sep 2024 12:09:13 +0200 (CEST)
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
X-Inumbo-ID: bb55668f-6f5c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962954; bh=MaOKWAN8/iHkSkxPEna4IofkZpedWnhaY89MZEeE3co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgHfikcoR4ZMGX2PA869SFMOKlxagBEL9HZX8QiMnq70BklAx7qbyPZu4gCeR9JBM
	 on2OTlk6KV+/X5xZG1/uyQ9/mNj2TRFch7dXxq06t7SLOe/OT1DhD2KrptKeEmP5hT
	 3dRXnmKmHjyLCLsO2+HzxAMA0yPnbVD+V/QZG5luHJFUQc+bWrddz7QCCBmt9PsDQY
	 NXwMkpGmIV1h3ZoqLOfUi4cfDvffxt5+AOX/8Az+8tRK49GWkx5iX1CnxeAZJm3NXu
	 cM6qL5B5wt/ktcpBkMwZRkTRcbSFY4fvIErPWvCmCObl5mx8lF/5zga10qN1yRwtmV
	 +JAn1Y7kO75HA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 03/12] x86/vm_event: address violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:55 +0200
Message-Id: <d45ca82c321f74fa320472e3309d4c30bdfb32b9.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address a violation of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/vm_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index e6c7ad5337..0d15d363c3 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -190,6 +190,7 @@ static void vm_event_pack_segment_register(enum x86_segment segment,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 }
 #endif
-- 
2.34.1


