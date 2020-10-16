Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B729003B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 10:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7832.20651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLV0-0002Lt-CD; Fri, 16 Oct 2020 08:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7832.20651; Fri, 16 Oct 2020 08:54:06 +0000
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
	id 1kTLV0-0002L7-7d; Fri, 16 Oct 2020 08:54:06 +0000
Received: by outflank-mailman (input) for mailman id 7832;
 Fri, 16 Oct 2020 08:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTLUy-0002Cr-6n
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:54:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdcc0cbe-beb2-429a-a324-e4a52de30dda;
 Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF079AE3A;
 Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTLUy-0002Cr-6n
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:54:04 +0000
X-Inumbo-ID: fdcc0cbe-beb2-429a-a324-e4a52de30dda
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fdcc0cbe-beb2-429a-a324-e4a52de30dda;
	Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602838433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+pus/iAw/KMl2PmZi703thdM1sjdiTbovsr4cajzfc=;
	b=VSxgyH+2PWjo2xPWP/qIbyRFuRCFo3Of0OnO9Qgy5pLDBvtfGPVQsJjkJ5mkNT0qF2Hx/8
	SqhNvCbgfpz1XlZ/XxUiD3+wS+QDiMHJYxkZeAbL3ggnTvcgOmj61u9OzHi6712OMHL8QF
	UpZHlN4tMzBL7E9nNaVGpU9fS8DgcE4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DF079AE3A;
	Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] xen/x86: issue pci_serr error message via NMI continuation
Date: Fri, 16 Oct 2020 10:53:50 +0200
Message-Id: <20201016085350.10233-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016085350.10233-1-jgross@suse.com>
References: <20201016085350.10233-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a softirq pci_serr_error() can use NMI continuation
for issuing an error message.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/traps.c          | 9 +++------
 xen/include/asm-x86/softirq.h | 5 ++---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 6f4db9d549..7a68ac40be 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1659,7 +1659,7 @@ void do_general_protection(struct cpu_user_regs *regs)
     panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
 }
 
-static void pci_serr_softirq(void)
+static void pci_serr_nmicont(void *arg)
 {
     printk("\n\nNMI - PCI system error (SERR)\n");
     outb(inb(0x61) & 0x0b, 0x61); /* re-enable the PCI SERR error line. */
@@ -1687,9 +1687,8 @@ static void pci_serr_error(const struct cpu_user_regs *regs)
         nmi_hwdom_report(_XEN_NMIREASON_pci_serr);
         /* fallthrough */
     case 'i': /* 'ignore' */
-        /* Would like to print a diagnostic here but can't call printk()
-           from NMI context -- raise a softirq instead. */
-        raise_softirq(PCI_SERR_SOFTIRQ);
+        /* Issue error message in NMI continuation. */
+        set_nmi_continuation(pci_serr_nmicont, NULL);
         break;
     default:  /* 'fatal' */
         console_force_unlock();
@@ -2183,8 +2182,6 @@ void __init trap_init(void)
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


