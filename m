Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FB780CBA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586328.917555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmX-0003SD-Bw; Fri, 18 Aug 2023 13:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586328.917555; Fri, 18 Aug 2023 13:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmX-0003Pq-8N; Fri, 18 Aug 2023 13:44:53 +0000
Received: by outflank-mailman (input) for mailman id 586328;
 Fri, 18 Aug 2023 13:44:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWzmV-00034T-6g
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:44:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmV-0002FT-36; Fri, 18 Aug 2023 13:44:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmU-00023L-Rg; Fri, 18 Aug 2023 13:44:51 +0000
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
	bh=lf3E6qWM/eYtxtUMYYrXFPP69s9JP5c1zgdxZnGHfo4=; b=swKHiGCGFvxejmKdL/hpiUNxhz
	8ZF+q6EvrHvFPpN8MQQm0/6gaNJgVZLE9eioHmEJ57dct1wC911FKpZLKKiBsr7201nAVfRkO7NZ5
	ulmZuuFDt9abwG4IWVonkSF4HDFu8Dc0oFmXP4nL3SQ15/xBPoq4GCu5k1XScQiCznZM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/x86: ioapic: Bail out from timer_irq_works() as soon as possible
Date: Fri, 18 Aug 2023 14:44:41 +0100
Message-Id: <20230818134441.45586-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818134441.45586-1-julien@xen.org>
References: <20230818134441.45586-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently timer_irq_works() will wait the full 100ms before checking
that pit0_ticks has been incremented at least 4 times.

However, the bulk of the BIOS/platform should not have a buggy timer.
So waiting for the full 100ms is a bit harsh.

Rework the logic to only wait until 100ms passed or we saw more than
4 ticks. So now, in the good case, this will reduce the wait time
to ~50ms.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/io_apic.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 4875bb97003f..0bd774962a68 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1509,6 +1509,8 @@ static void __init setup_ioapic_ids_from_mpc(void)
 static int __init timer_irq_works(void)
 {
     unsigned long t1, flags;
+    /* Wait for maximum 10 ticks */
+    unsigned long msec = (10 * 1000) / HZ;
 
     if ( no_timer_check )
         return 1;
@@ -1517,19 +1519,25 @@ static int __init timer_irq_works(void)
 
     local_save_flags(flags);
     local_irq_enable();
-    /* Let ten ticks pass... */
-    mdelay((10 * 1000) / HZ);
-    local_irq_restore(flags);
 
-    /*
-     * Expect a few ticks at least, to be sure some possible
-     * glue logic does not lock up after one or two first
-     * ticks in a non-ExtINT mode.  Also the local APIC
-     * might have cached one ExtINT interrupt.  Finally, at
-     * least one tick may be lost due to delays.
-     */
-    if ( (ACCESS_ONCE(pit0_ticks) - t1) > 4 )
+    while ( msec-- )
+    {
+        mdelay(1);
+        /*
+         * Expect a few ticks at least, to be sure some possible
+         * glue logic does not lock up after one or two first
+         * ticks in a non-ExtINT mode.  Also the local APIC
+         * might have cached one ExtINT interrupt.  Finally, at
+         * least one tick may be lost due to delays.
+         */
+        if ( (ACCESS_ONCE(pit0_ticks) - t1) <= 4 )
+            continue;
+
+        local_irq_restore(flags);
         return 1;
+    }
+
+    local_irq_restore(flags);
 
     return 0;
 }
-- 
2.40.1


