Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3A780CBB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586327.917544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmW-0003Bk-47; Fri, 18 Aug 2023 13:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586327.917544; Fri, 18 Aug 2023 13:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzmW-0003A2-1N; Fri, 18 Aug 2023 13:44:52 +0000
Received: by outflank-mailman (input) for mailman id 586327;
 Fri, 18 Aug 2023 13:44:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWzmU-0002v7-6t
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:44:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmU-0002FH-2Z; Fri, 18 Aug 2023 13:44:50 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWzmT-00023L-Ot; Fri, 18 Aug 2023 13:44:49 +0000
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
	bh=BWbxLpVcdsByN5EAo3XWXuGnYzzBqiMaCs+W1sR2CtM=; b=XMFfOQU69Z2v/hs5HEQwqQrRKn
	uAVOYjQ8bZJZUmUytMc2iHxKKF8KUIgeLWwrBUvNcsdSFvuXLC8heMhKIu3yZbLvgIobQDjE7kzhK
	wDV/YRfTsjh69Lge3KLwu2VOphcKk84hDXIv1lkjLe66M3V2P7evp5A1BLBE0JC5feLk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to skip timer check
Date: Fri, 18 Aug 2023 14:44:40 +0100
Message-Id: <20230818134441.45586-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818134441.45586-1-julien@xen.org>
References: <20230818134441.45586-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, Xen will spend ~100ms to check if the timer works. If the
Admin knows their platform have a working timer, then it would be
handy to be able to bypass the check.

Introduce a command line option 'no_timer_check' (the name is
matching the Linux parameter) for this purpose.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/misc/xen-command-line.pandoc |  7 +++++++
 xen/arch/x86/io_apic.c            | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4872b9098e83..1f9d3106383f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
+### no_timer_works (x86)
+> `=<boolean>`
+
+> Default: `true`
+
+Disables the code which tests for broken timer IRQ sources.
+
 ### irq-max-guests (x86)
 > `= <integer>`
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b3afef8933d7..4875bb97003f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
 int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
 int __read_mostly nr_ioapics;
 
+/*
+ * The logic to check if the timer is working is expensive. So allow
+ * the admin to bypass it if they know their platform doesn't have
+ * a buggy timer.
+ */
+static bool __initdata no_timer_check;
+boolean_param("no_timer_check", no_timer_check);
+
 /*
  * Rough estimation of how many shared IRQs there are, can
  * be changed anytime.
@@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
 {
     unsigned long t1, flags;
 
+    if ( no_timer_check )
+        return 1;
+
     t1 = ACCESS_ONCE(pit0_ticks);
 
     local_save_flags(flags);
-- 
2.40.1


