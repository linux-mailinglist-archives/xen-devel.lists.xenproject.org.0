Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E650E295976
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10202.27086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVFB-0006dh-A7; Thu, 22 Oct 2020 07:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10202.27086; Thu, 22 Oct 2020 07:42:41 +0000
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
	id 1kVVFB-0006cX-03; Thu, 22 Oct 2020 07:42:41 +0000
Received: by outflank-mailman (input) for mailman id 10202;
 Thu, 22 Oct 2020 07:42:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVF9-0006JP-SE
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88c88692-d876-4f25-8902-6597f0279a03;
 Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1902BB1A5;
 Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVF9-0006JP-SE
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:39 +0000
X-Inumbo-ID: 88c88692-d876-4f25-8902-6597f0279a03
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 88c88692-d876-4f25-8902-6597f0279a03;
	Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603352546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iyLraNh4qsC0U9VAH0jIutbMoqMZ9rCRdDLW3b+ghk=;
	b=buOqT8orNctDSPPfKDdZ4gitpMoJYnx0HWmUlC1aRgdx74mP95sctuaKXF+JzlM36uSGkM
	p2xDJuqhtNo9VidkxVxYCRBcdUEkPOHDAmCxRS5Po5/c6d4/HReu+Z5NA3SH8iV7C+p2/I
	wrRCy+A/tIGlAMKNWyXwFMUaHgLtNRc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1902BB1A5;
	Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/5] xen/events: only register debug interrupt for 2-level events
Date: Thu, 22 Oct 2020 09:42:12 +0200
Message-Id: <20201022074214.21693-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022074214.21693-1-jgross@suse.com>
References: <20201022074214.21693-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_debug_interrupt() is specific to 2-level event handling. So don't
register it with fifo event handling being active.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/smp.c               | 19 +++++++++++--------
 arch/x86/xen/xen-ops.h           |  2 ++
 drivers/xen/events/events_base.c |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index 2097fa0ebdb5..b544e511b3c2 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -88,14 +88,17 @@ int xen_smp_intr_init(unsigned int cpu)
 	per_cpu(xen_callfunc_irq, cpu).irq = rc;
 	per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
 
-	debug_name = kasprintf(GFP_KERNEL, "debug%d", cpu);
-	rc = bind_virq_to_irqhandler(VIRQ_DEBUG, cpu, xen_debug_interrupt,
-				     IRQF_PERCPU | IRQF_NOBALANCING,
-				     debug_name, NULL);
-	if (rc < 0)
-		goto fail;
-	per_cpu(xen_debug_irq, cpu).irq = rc;
-	per_cpu(xen_debug_irq, cpu).name = debug_name;
+	if (!fifo_events) {
+		debug_name = kasprintf(GFP_KERNEL, "debug%d", cpu);
+		rc = bind_virq_to_irqhandler(VIRQ_DEBUG, cpu,
+					     xen_debug_interrupt,
+					     IRQF_PERCPU | IRQF_NOBALANCING,
+					     debug_name, NULL);
+		if (rc < 0)
+			goto fail;
+		per_cpu(xen_debug_irq, cpu).irq = rc;
+		per_cpu(xen_debug_irq, cpu).name = debug_name;
+	}
 
 	callfunc_name = kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
 	rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_SINGLE_VECTOR,
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 45d556f71858..e444c78b6e2b 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -29,6 +29,8 @@ extern struct start_info *xen_start_info;
 extern struct shared_info xen_dummy_shared_info;
 extern struct shared_info *HYPERVISOR_shared_info;
 
+extern bool fifo_events;
+
 void xen_setup_mfn_list_list(void);
 void xen_build_mfn_list_list(void);
 void xen_setup_machphys_mapping(void);
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 1c25580c7691..bb18cce4db06 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2050,7 +2050,7 @@ void xen_setup_callback_vector(void) {}
 static inline void xen_alloc_callback_vector(void) {}
 #endif
 
-static bool fifo_events = true;
+bool fifo_events = true;
 module_param(fifo_events, bool, 0);
 
 static int xen_evtchn_cpu_prepare(unsigned int cpu)
@@ -2082,8 +2082,10 @@ void __init xen_init_IRQ(void)
 
 	if (fifo_events)
 		ret = xen_evtchn_fifo_init();
-	if (ret < 0)
+	if (ret < 0) {
 		xen_evtchn_2l_init();
+		fifo_events = false;
+	}
 
 	xen_cpu_init_eoi(smp_processor_id());
 
-- 
2.26.2


