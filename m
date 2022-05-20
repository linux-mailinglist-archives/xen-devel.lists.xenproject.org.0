Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6252EBB6
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333988.557949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wn-0003db-Lv; Fri, 20 May 2022 12:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333988.557949; Fri, 20 May 2022 12:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wn-0003WA-D0; Fri, 20 May 2022 12:14:45 +0000
Received: by outflank-mailman (input) for mailman id 333988;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003NP-R9
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005wW-Li; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sm-0001lI-S2; Fri, 20 May 2022 12:10:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=HwmRtt4otl1crmQ3IgjCxj/lVWCzBdIkM8zTQonw0lU=; b=EiJ687OV4u5psb86gk5OSHYba4
	gE5eOTcNprJA0+yjr3EcYZo+FUl/WEp+BWKB+Xz9owRPWsmeK6yZQz+y+7V+kIjhLXlPySjjEH4Qt
	+M7dZYhOx8bgcih8R1K/0YRJJKsbLBgy6DgZdCkI9YhC7Kl5vry0Ob7hKk4bU5PrzS4M=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 11/16] xen/arm: mm: Clean-up the includes and order them
Date: Fri, 20 May 2022 13:09:32 +0100
Message-Id: <20220520120937.28925-12-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The numbers of includes in mm.c has been growing quite a lot. However
some of them (e.g. xen/device_tree.h, xen/softirq.h) doesn't look
to be directly used by the file or other will be included by
larger headers (e.g asm/flushtlb.h will be included by xen/mm.h).

So trim down the number of includes. Take the opportunity to order
them with the xen headers first, then asm headers and last public
headers.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---

    Changes in v4:
        - Add Stefano's acked-by

    Changes in v3:
        - Patch added
---
 xen/arch/arm/mm.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index bd1348a99716..d40dd4e6c9e6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -17,33 +17,26 @@
  * GNU General Public License for more details.
  */
 
-#include <xen/compile.h>
-#include <xen/types.h>
-#include <xen/device_tree.h>
-#include <xen/init.h>
-#include <xen/mm.h>
-#include <xen/preempt.h>
+#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/grant_table.h>
-#include <xen/softirq.h>
-#include <xen/event.h>
 #include <xen/guest_access.h>
-#include <xen/domain_page.h>
-#include <xen/err.h>
-#include <asm/page.h>
-#include <asm/current.h>
-#include <asm/flushtlb.h>
-#include <public/memory.h>
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
 #include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
 #include <xen/vmap.h>
+
 #include <xsm/xsm.h>
-#include <xen/pfn.h>
-#include <xen/sizes.h>
-#include <xen/libfdt/libfdt.h>
 
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 
+#include <public/memory.h>
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
-- 
2.32.0


