Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B779ECAD1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854557.1267737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKUn-0001E6-11; Wed, 11 Dec 2024 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854557.1267737; Wed, 11 Dec 2024 11:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKUm-0001Cq-Sy; Wed, 11 Dec 2024 11:03:08 +0000
Received: by outflank-mailman (input) for mailman id 854557;
 Wed, 11 Dec 2024 11:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbrR=TE=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tLKUk-0001Ch-2u
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:03:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ea22e79-b7af-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:03:04 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id D00484EE073C;
 Wed, 11 Dec 2024 12:02:59 +0100 (CET)
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
X-Inumbo-ID: 7ea22e79-b7af-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1733914983; bh=7j8r/F7MsJqKq9M3+20mKheIJOo4WeDF5Oz3cppvmFY=;
	h=From:To:Cc:Subject:Date:From;
	b=MmFo/hmj1kDRxuieH8lygwwdU2o9F5jUxbmC7UBpna4hcjCWqmVy45b+g6dyJ+Kts
	 3yUT3L8dWYezNKzUEZCXfQ4o+3ovA6IaQu+HJxims/39+K+J5a4iFv30c5TspoPrw8
	 sdwqnPkKuJjlez12kMKwjacdtdCBqhjMQX2u7gHQiIa5WkS4NDH/XZp7bRKby+coBK
	 eruqixTsuCV/gkHCcoMG5OcQGk1GorzClopYg8JQaZFjELg6r0MED8ggzDY/2k1D6r
	 1mPscwRz/frtAsS0phWnRGj2MQfdCrUaXTj//69VcYOGNC2cp20EPTp/hD1mwZw0YA
	 mKQ4TGf03kFvg==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: address violation of MISRA C Rule 11.1
Date: Wed, 11 Dec 2024 12:02:48 +0100
Message-ID: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.1 states as following: "Conversions shall not be performed
between a pointer to a function and any other type".

Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
functions and subsequently passed as parameters to function calls.
This violates the rule in Clang, where the "noreturn" attribute is
considered part of the function"s type. By removing the "noreturn"
attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
these violations are addressed.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/arm/shutdown.c | 3 ++-
 xen/arch/x86/shutdown.c | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index c9778e5786..e679ae8d72 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -8,7 +8,7 @@
 #include <asm/platform.h>
 #include <asm/psci.h>
 
-static void noreturn halt_this_cpu(void *arg)
+static void halt_this_cpu(void *arg)
 {
     local_irq_disable();
     /* Make sure the write happens before we sleep forever */
@@ -38,6 +38,7 @@ void machine_halt(void)
     /* Alternative halt procedure */
     platform_poweroff();
     halt_this_cpu(NULL);
+    ASSERT_UNREACHABLE();
 }
 
 void machine_restart(unsigned int delay_millisecs)
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 902076cf67..b684e19754 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -118,7 +118,7 @@ static inline void kb_wait(void)
             break;
 }
 
-static void noreturn cf_check __machine_halt(void *unused)
+static void cf_check __machine_halt(void *unused)
 {
     local_irq_disable();
 
@@ -127,6 +127,7 @@ static void noreturn cf_check __machine_halt(void *unused)
 
     for ( ; ; )
         halt();
+    ASSERT_UNREACHABLE();
 }
 
 void machine_halt(void)
@@ -141,6 +142,7 @@ void machine_halt(void)
     }
 
     __machine_halt(NULL);
+    ASSERT_UNREACHABLE();
 }
 
 static void default_reboot_type(void)
@@ -520,9 +522,10 @@ static int __init cf_check reboot_init(void)
 }
 __initcall(reboot_init);
 
-static void cf_check noreturn __machine_restart(void *pdelay)
+static void cf_check __machine_restart(void *pdelay)
 {
     machine_restart(*(unsigned int *)pdelay);
+    ASSERT_UNREACHABLE();
 }
 
 void machine_restart(unsigned int delay_millisecs)
-- 
2.43.0


