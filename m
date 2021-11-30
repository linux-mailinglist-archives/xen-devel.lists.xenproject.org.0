Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D14630A2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234950.407670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007Si-1F; Tue, 30 Nov 2021 10:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234950.407670; Tue, 30 Nov 2021 10:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00b-0007Qu-TU; Tue, 30 Nov 2021 10:05:09 +0000
Received: by outflank-mailman (input) for mailman id 234950;
 Tue, 30 Nov 2021 10:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00a-0007QY-Cw
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd5d471c-51c4-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 11:05:06 +0100 (CET)
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
X-Inumbo-ID: fd5d471c-51c4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cT97y0C7d9fsmdvUf53cmo5D+BKq2IWrRAFvHOURbtA=;
  b=hpp+eLLgTal2PTLlXyc7TR7Tnq44xohu9e8vNBjqki/TEibk1+xTJV5q
   tD2G3e8CGg3b53TTKvzkQOWfKu6lPF5tJBKhLpA8ER5tHzBSx7GV7k61C
   Tee8gD/tfJd0ls4MEmxuUE/BMzo+eEYiZ5YWONlH6V1js6FPFJi/MmgcF
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1ugllMO8PACqbb9Lma/II4lkYp/RsDyYscBFOmcML4AU9ZeFkCV0AV5YfdJByw1zWBlMy17lSZ
 lbRxY2zera0Z1MCkuNdxJeJMxXbKa4OL3TyPHq5sg/rrrsvjHl1Yl7IJ6A9ymXoHiofA1cGbFO
 IfYURyrmSLNDd5+pGCJfc9KkVBAcDaTdcS9kp2DRbw/8OWTweyHgKpKUVfHO/nuQZTSIygT4Zd
 ebiJJd2JkkrxQerWNEHr9CKICXQnwoI+gRVR5vpj7kTzQcwkod38dSwlCSsS8RjpR85uGhMaxD
 Fr0+vqdI74r2UuzTFEC1xFlB
X-SBRS: 5.1
X-MesageID: 58889161
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FBNkiqDhRAqCJBVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD4i0DUBz
 2IeW27TO6mOYGCkeN92aoTip05X6JTRmIA2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540ko7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tDySstZX8
 It364W1aDt1PO7Ip8NCTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGdg15kQRJ4yY
 eI2Vytkbh7PTiQeHQ4pMrZnley3iF7GJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiEGNpTMafeIOKbMj7SCxlqiX5zm+WXdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBN3CJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtAKuWglfxkzbpxsldrVj
 Kn74lg5CHh7ZibCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:W9aCnKMKfG708sBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58889161"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] x86/boot: Fix data placement around __high_start()
Date: Tue, 30 Nov 2021 10:04:40 +0000
Message-ID: <20211130100445.31156-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

multiboot_ptr should be in __initdata - it is only used on the BSP path.
Furthermore, the .align 8 then .long means that stack_start is misaligned.

Move both into setup.c, which lets the compiler handle the details correctly,
as well as providling proper debug information for them.

Declare stack_start in setup.h and avoid extern-ing it locally in smpboot.c.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/boot/x86_64.S  | 8 --------
 xen/arch/x86/setup.c        | 6 ++++++
 xen/arch/x86/smpboot.c      | 3 +--
 xen/include/asm-x86/setup.h | 2 ++
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index d61048c583b3..27f52e7a7708 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -67,14 +67,6 @@ ENTRY(__high_start)
         call    __start_xen
         BUG     /* __start_xen() shouldn't return. */
 
-        .data
-        .align 8
-multiboot_ptr:
-        .long   0
-
-GLOBAL(stack_start)
-        .quad   cpu0_stack + STACK_SIZE - CPUINFO_sizeof
-
         .section .data.page_aligned, "aw", @progbits
         .align PAGE_SIZE, 0
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 495b4b7d51fb..6613e56a2184 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -141,6 +141,12 @@ unsigned long __read_mostly xen_virt_end;
 char __section(".bss.stack_aligned") __aligned(STACK_SIZE)
     cpu0_stack[STACK_SIZE];
 
+/* Used by the BSP/AP paths to find the higher half stack mapping to use. */
+void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
+
+/* Used by the boot asm to stash the relocated multiboot info pointer. */
+unsigned int __initdata multiboot_ptr;
+
 struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
 
 unsigned long __read_mostly mmu_cr4_features = XEN_MINIMAL_CR4;
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 329cfdb6c9f6..08c0f2d9df04 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -42,6 +42,7 @@
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/mtrr.h>
+#include <asm/setup.h>
 #include <asm/spec_ctrl.h>
 #include <asm/time.h>
 #include <asm/tboot.h>
@@ -419,8 +420,6 @@ void start_secondary(void *unused)
     startup_cpu_idle_loop();
 }
 
-extern void *stack_start;
-
 static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 24be46115df2..eb9d7b433c13 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -12,6 +12,8 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
 extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;
 
+extern void *stack_start;
+
 void early_cpu_init(void);
 void early_time_init(void);
 
-- 
2.11.0


