Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8A775484
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 09:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580727.909135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2Y-00084R-Ib; Wed, 09 Aug 2023 07:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580727.909135; Wed, 09 Aug 2023 07:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2Y-000822-EG; Wed, 09 Aug 2023 07:55:34 +0000
Received: by outflank-mailman (input) for mailman id 580727;
 Wed, 09 Aug 2023 07:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTe2X-0007py-5M
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 07:55:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ca55bb2-368a-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 09:55:31 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F0374EE0740;
 Wed,  9 Aug 2023 09:55:30 +0200 (CEST)
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
X-Inumbo-ID: 1ca55bb2-368a-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] xen/delay: address MISRA C:2012 Rule 5.3.
Date: Wed,  9 Aug 2023 09:55:09 +0200
Message-Id: <47e2c8770e38ab064cbcdfaafa8467c5e733f11d.1691567429.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691567429.git.nicola.vetrini@bugseng.com>
References: <cover.1691567429.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'msec' declared in the macro shadows the local
variable in 'ehci_dbgp_bios_handoff', but to prevent any
future clashes with other functions the macro is converted to
a static inline function.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/delay.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
index 9d70ef035f..9150226271 100644
--- a/xen/include/xen/delay.h
+++ b/xen/include/xen/delay.h
@@ -4,7 +4,11 @@
 /* Copyright (C) 1993 Linus Torvalds */
 
 #include <asm/delay.h>
-#define mdelay(n) (\
-	{unsigned long msec=(n); while (msec--) udelay(1000);})
+
+static inline void mdelay(unsigned long msec)
+{
+    while ( msec-- )
+        udelay(1000);
+}
 
 #endif /* defined(_LINUX_DELAY_H) */
-- 
2.34.1


