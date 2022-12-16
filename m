Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9C64EAD4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464425.722826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D3-0003oV-MU; Fri, 16 Dec 2022 11:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464425.722826; Fri, 16 Dec 2022 11:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D3-0003ke-IW; Fri, 16 Dec 2022 11:49:01 +0000
Received: by outflank-mailman (input) for mailman id 464425;
 Fri, 16 Dec 2022 11:49:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D1-0003V6-Vy
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:48:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D1-0002Ck-IE; Fri, 16 Dec 2022 11:48:59 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D1-0004sN-Ac; Fri, 16 Dec 2022 11:48:59 +0000
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
	bh=X62OB5zEH/tDpewvEhcpco/a600UQZqosHxduopbkeM=; b=HPVAWQs2Y10cVfCLowvI46rn4J
	Rk7SZE68vWXFpoVTrvipRP1OoMIpQftR34TIzujyKous+0/kj9v44h+lVFnSmLeVgl+5bjWuUBA/6
	SO8fPL6Zzkj2xrK43va6J4T8CBABVMYS5MLTcfS2wJyZ2YYu3acL9yx/f982YCkmSJ7k=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 01/22] xen/common: page_alloc: Re-order includes
Date: Fri, 16 Dec 2022 11:48:32 +0000
Message-Id: <20221216114853.8227-2-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Order the includes with the xen headers first, then asm headers and
last public headers. Within each category, they are sorted alphabetically.

Note that the includes in protected by CONFIG_X86 hasn't been sorted
to avoid adding multiple #ifdef.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    I am open to add sort the includes protected by CONFIG_X86
    and add multiple #ifdef if this is preferred.
---
 xen/common/page_alloc.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 0c93a1078702..0a950288e241 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -120,27 +120,30 @@
  *   regions within it.
  */
 
+#include <xen/domain_page.h>
+#include <xen/event.h>
 #include <xen/init.h>
-#include <xen/types.h>
+#include <xen/irq.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
-#include <xen/sched.h>
-#include <xen/spinlock.h>
 #include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
 #include <xen/param.h>
-#include <xen/irq.h>
-#include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <xen/keyhandler.h>
 #include <xen/perfc.h>
 #include <xen/pfn.h>
-#include <xen/numa.h>
-#include <xen/nodemask.h>
-#include <xen/event.h>
+#include <xen/types.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <xen/spinlock.h>
+
+#include <asm/flushtlb.h>
+#include <asm/numa.h>
+#include <asm/page.h>
+
 #include <public/sysctl.h>
 #include <public/sched.h>
-#include <asm/page.h>
-#include <asm/numa.h>
-#include <asm/flushtlb.h>
+
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #include <asm/p2m.h>
-- 
2.38.1


