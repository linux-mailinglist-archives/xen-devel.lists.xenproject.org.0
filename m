Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BB42A5BF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207192.362943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHu8-0007Wh-4p; Tue, 12 Oct 2021 13:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207192.362943; Tue, 12 Oct 2021 13:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHu8-0007UD-1d; Tue, 12 Oct 2021 13:33:16 +0000
Received: by outflank-mailman (input) for mailman id 207192;
 Tue, 12 Oct 2021 13:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cVDt=PA=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1maHu5-0007U7-Mk
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:33:13 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 343866f4-3828-4a5e-a860-abfad85b9e75;
 Tue, 12 Oct 2021 13:33:11 +0000 (UTC)
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
X-Inumbo-ID: 343866f4-3828-4a5e-a860-abfad85b9e75
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1634045590; h=from:from:reply-to:subject:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=kzzhCfXTDEtjAULZoQTQAQVk/vJzN0Qs+xvw5wZ2xW8=;
	b=fshm+r6GuZJqUIjderhxFapYx9zHU+cgacgZcb4X3qqfOA3jGaDvAbH+anIC+WP9685mk6
	q0TKBkDt0g/d8TCr49QoRZoKVvEr9W7tfTXsay5DDNIsnJLYAZcf91hSz8dBlwGedoMCo9
	E74g57CWEurmdTWYM21l5cxRenKL2vF/eJBF0PpyTMLJ6QaH0Fobe2OR8yswaRfFby+9eA
	hDJbrq09yA+2Jq8k3m5/rJ7IQVWFni4JnkTVKlxJRtH1NXEuWURVID/OZfZGLUcu+Ku8wc
	jpIijHLw/98IL8yJ54WQkKkChMx7UdL3OlW8F8slrV1oEnGz20/GXC4PLQttvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1634045590; h=from:from:reply-to:subject:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=kzzhCfXTDEtjAULZoQTQAQVk/vJzN0Qs+xvw5wZ2xW8=;
	b=Jtzxoe+JH4LioMrpry7wl7nAZ54N2HKh7QirrOr/uYKDM93VU1+yZMsGl5o/abis+gR7Hv
	XGzy0J0vXb45WQCQ==
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Remove redundant irq_enter/exit() invocations
Subject: 
Date: Tue, 12 Oct 2021 15:33:09 +0200
Message-ID: <877deicqqy.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

All these handlers are regular device interrupt handlers, so they already
went through the proper entry code which handles this correctly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/xen/smp.c    |    4 ----
 arch/x86/xen/smp_pv.c |    2 --
 2 files changed, 6 deletions(-)

--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -268,20 +268,16 @@ void xen_send_IPI_allbutself(int vector)
 
 static irqreturn_t xen_call_function_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	generic_smp_call_function_interrupt();
 	inc_irq_stat(irq_call_count);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t xen_call_function_single_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	generic_smp_call_function_single_interrupt();
 	inc_irq_stat(irq_call_count);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -458,10 +458,8 @@ static void xen_pv_stop_other_cpus(int w
 
 static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	irq_work_run();
 	inc_irq_stat(apic_irq_work_irqs);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }

