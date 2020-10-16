Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE22906B5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8117.21616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTQG4-0001eW-95; Fri, 16 Oct 2020 13:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8117.21616; Fri, 16 Oct 2020 13:59:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTQG4-0001e7-5d; Fri, 16 Oct 2020 13:59:00 +0000
Received: by outflank-mailman (input) for mailman id 8117;
 Fri, 16 Oct 2020 13:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl+D=DX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kTQG2-0001e2-Ba
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:58:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 61c52061-1400-4d69-b071-feed78196bf4;
 Fri, 16 Oct 2020 13:58:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338C530E;
 Fri, 16 Oct 2020 06:58:57 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6273F71F;
 Fri, 16 Oct 2020 06:58:56 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wl+D=DX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kTQG2-0001e2-Ba
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:58:58 +0000
X-Inumbo-ID: 61c52061-1400-4d69-b071-feed78196bf4
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 61c52061-1400-4d69-b071-feed78196bf4;
	Fri, 16 Oct 2020 13:58:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338C530E;
	Fri, 16 Oct 2020 06:58:57 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6273F71F;
	Fri, 16 Oct 2020 06:58:56 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Print message if reset did not work
Date: Fri, 16 Oct 2020 14:58:47 +0100
Message-Id: <74a7359983a9d25ca62a6edd41805ab92918e2a1.1602856636.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

If for some reason the hardware reset is not working, print a message to
the user every 5 seconds to warn him that the system did not reset
properly and Xen is still looping.

The message is printed infinitely so that someone connecting to a serial
console with no history would see the message coming after 5 seconds.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/shutdown.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index b32f07ec0e..600088ec48 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -36,6 +36,7 @@ void machine_halt(void)
 void machine_restart(unsigned int delay_millisecs)
 {
     int timeout = 10;
+    unsigned long count = 0;
 
     watchdog_disable();
     console_start_sync();
@@ -59,6 +60,9 @@ void machine_restart(unsigned int delay_millisecs)
     {
         platform_reset();
         mdelay(100);
+        if ( (count % 50) == 0 )
+            printk(XENLOG_ERR "Xen: Platform reset did not work properly!!\n");
+        count++;
     }
 }
 
-- 
2.17.1


