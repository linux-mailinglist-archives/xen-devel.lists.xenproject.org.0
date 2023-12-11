Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA980C9A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651732.1017528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfJq-0005j5-Bg; Mon, 11 Dec 2023 12:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651732.1017528; Mon, 11 Dec 2023 12:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfJq-0005h7-8H; Mon, 11 Dec 2023 12:23:30 +0000
Received: by outflank-mailman (input) for mailman id 651732;
 Mon, 11 Dec 2023 12:23:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCfJp-0005bX-AO
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:23:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfJp-0003oZ-6F; Mon, 11 Dec 2023 12:23:29 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfJo-0001JH-Uo; Mon, 11 Dec 2023 12:23:29 +0000
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
	bh=NOACs3hSf5sKsZ7DYPVi4JzNRj9JzZlqiodDxK0OPX8=; b=EA01PHDn8HByG6wWZ8jGzHOTUX
	XCWj3mgtucLQyaQglvRujJ7l7x1xPwTRPRDDr5yE6umdBm/hyJULEZRWXj/2pdIoARPdhVCu0Ady5
	b3BUJrCiZGz8ZYpYvVl57L4/y4skwStKOXBzU0AjiLjhwS50kCcCBZaVCEK1Gfx7g6/A=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen/x86: ioapic: Bail out from timer_irq_works() as soon as possible
Date: Mon, 11 Dec 2023 12:23:22 +0000
Message-Id: <20231211122322.15815-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231211122322.15815-1-julien@xen.org>
References: <20231211122322.15815-1-julien@xen.org>
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

Take the opportunity to change the prototype of timer_irq_works() to
return a bool rather than int (which was already acting as a bool because
only 0/1 could be returned).

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Note that local_irq_restore() cannot be replaced with local_irq_disable()
because the function is not consistently called with IRQs off.

Changes in v2:
    - Return bool rather than int
    - Have a single return path
    - Use 'unsigned int' rather than 'unsigned long' for msec
---
 xen/arch/x86/io_apic.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 238b6c1c2837..c89fbed8d675 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1506,32 +1506,41 @@ static void __init setup_ioapic_ids_from_mpc(void)
  *	- if this function detects that timer IRQs are defunct, then we fall
  *	  back to ISA timer IRQs
  */
-static int __init timer_irq_works(void)
+static bool __init timer_irq_works(void)
 {
     unsigned long t1, flags;
+    /* Wait for maximum 10 ticks */
+    unsigned int msec = (10 * 1000) / HZ;
+    bool works = false;
 
     if ( pit_irq_works )
-        return 1;
+        return true;
 
     t1 = ACCESS_ONCE(pit0_ticks);
 
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
-        return 1;
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
 
-    return 0;
+        works = true;
+        break;
+    }
+
+    local_irq_restore(flags);
+
+    return works;
 }
 
 /*
-- 
2.40.1


