Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F582AB3F8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22268.48539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc3oh-00034K-Q5; Mon, 09 Nov 2020 09:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22268.48539; Mon, 09 Nov 2020 09:50:27 +0000
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
	id 1kc3oh-00033v-N0; Mon, 09 Nov 2020 09:50:27 +0000
Received: by outflank-mailman (input) for mailman id 22268;
 Mon, 09 Nov 2020 09:50:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc3of-00032y-Ve
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abd59ebd-efb6-4d95-a147-c7bb5d752dbe;
 Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0472AC65;
 Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc3of-00032y-Ve
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:26 +0000
X-Inumbo-ID: abd59ebd-efb6-4d95-a147-c7bb5d752dbe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id abd59ebd-efb6-4d95-a147-c7bb5d752dbe;
	Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604915424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLBR9EmjHCFkPapKcP0kRX3wmjiDirIrvyn/L7SIsBk=;
	b=ZMdQFefCGQLexNWbgcUpKI//N649BSfQt+iiuKYf3V80m/cdf+zyipd2CdYWR5MhtGzZJ8
	TObwY6Pcy9GRx6gO/Ha7bhJA/+fHa35BErQ/FoBRcq8AIVelWvsclOFaUwxLYcPoYonyY+
	1li17/vxGJ+D5DTiosZo/BOzOaGW+cw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E0472AC65;
	Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/3] xen/x86: issue pci_serr error message via NMI continuation
Date: Mon,  9 Nov 2020 10:50:21 +0100
Message-Id: <20201109095021.9897-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109095021.9897-1-jgross@suse.com>
References: <20201109095021.9897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a softirq pci_serr_error() can use NMI continuation
for issuing an error message.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- rework to less generic approach
---
 xen/arch/x86/traps.c          | 21 +++++++++++++++------
 xen/include/asm-x86/softirq.h |  5 ++---
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7cb7d7e09c..6aeccef32d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1660,10 +1660,18 @@ void do_general_protection(struct cpu_user_regs *regs)
     panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
 }
 
-static void pci_serr_softirq(void)
+static bool pci_serr_cont;
+
+static bool pci_serr_nmicont(void)
 {
+    if ( !pci_serr_cont )
+        return false;
+
+    pci_serr_cont = false;
     printk("\n\nNMI - PCI system error (SERR)\n");
     outb(inb(0x61) & 0x0b, 0x61); /* re-enable the PCI SERR error line. */
+
+    return true;
 }
 
 static void nmi_hwdom_report(unsigned int reason_idx)
@@ -1688,9 +1696,9 @@ static void pci_serr_error(const struct cpu_user_regs *regs)
         nmi_hwdom_report(_XEN_NMIREASON_pci_serr);
         /* fallthrough */
     case 'i': /* 'ignore' */
-        /* Would like to print a diagnostic here but can't call printk()
-           from NMI context -- raise a softirq instead. */
-        raise_softirq(PCI_SERR_SOFTIRQ);
+        /* Issue error message in NMI continuation. */
+        pci_serr_cont = true;
+        trigger_nmi_continuation();
         break;
     default:  /* 'fatal' */
         console_force_unlock();
@@ -1808,6 +1816,9 @@ bool nmi_check_continuation(void)
     if ( nmi_oprofile_send_virq() )
         ret = true;
 
+    if ( pci_serr_nmicont() )
+        ret = true;
+
     return ret;
 }
 
@@ -2154,8 +2165,6 @@ void __init trap_init(void)
     percpu_traps_init();
 
     cpu_init();
-
-    open_softirq(PCI_SERR_SOFTIRQ, pci_serr_softirq);
 }
 
 void activate_debugregs(const struct vcpu *curr)
diff --git a/xen/include/asm-x86/softirq.h b/xen/include/asm-x86/softirq.h
index 0b7a77f11f..415ee866c7 100644
--- a/xen/include/asm-x86/softirq.h
+++ b/xen/include/asm-x86/softirq.h
@@ -6,9 +6,8 @@
 #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
 
 #define MACHINE_CHECK_SOFTIRQ  (NR_COMMON_SOFTIRQS + 3)
-#define PCI_SERR_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
-#define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 5)
-#define NR_ARCH_SOFTIRQS       6
+#define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
+#define NR_ARCH_SOFTIRQS       5
 
 bool arch_skip_send_event_check(unsigned int cpu);
 
-- 
2.26.2


