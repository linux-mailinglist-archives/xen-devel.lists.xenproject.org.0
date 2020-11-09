Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628702AB3F7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22270.48563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc3or-0003CB-ED; Mon, 09 Nov 2020 09:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22270.48563; Mon, 09 Nov 2020 09:50:37 +0000
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
	id 1kc3or-0003BR-AS; Mon, 09 Nov 2020 09:50:37 +0000
Received: by outflank-mailman (input) for mailman id 22270;
 Mon, 09 Nov 2020 09:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc3op-00032y-UN
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10bdc7d8-87d4-43e9-a1d6-2b01eb3537ff;
 Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEB7BAC55;
 Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc3op-00032y-UN
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:35 +0000
X-Inumbo-ID: 10bdc7d8-87d4-43e9-a1d6-2b01eb3537ff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 10bdc7d8-87d4-43e9-a1d6-2b01eb3537ff;
	Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604915423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ehg+Oe06If61OaHeelhui6nZFa39xSlzfoRaxz8w3I=;
	b=fh9NlGNOOPqmb4A14oeD+pOVfS5y4p5QA6KODCl8vN86moulHHvmfxjKs0FNyuK40MakFd
	Wu6iKHP0Px1fltYULEvPx4jChyZcRVeTL7ldidbPNL3KNJMIsIHaeUKgSF2wwaOGdHNKOB
	r7R0lf+8qiwOfbkNg5MO46JbLuCMWn8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BEB7BAC55;
	Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending virq to guest
Date: Mon,  9 Nov 2020 10:50:20 +0100
Message-Id: <20201109095021.9897-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109095021.9897-1-jgross@suse.com>
References: <20201109095021.9897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calling send_guest_vcpu_virq() from NMI context use the
NMI continuation framework for that purpose. This avoids taking locks
in NMI mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- rework to less generic approach
---
 xen/arch/x86/oprofile/nmi_int.c | 20 ++++++++++++++++++--
 xen/arch/x86/traps.c            |  4 ++++
 xen/include/asm-x86/xenoprof.h  |  7 +++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 0f103d80a6..5f17cba0b2 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -38,6 +38,8 @@ static unsigned long saved_lvtpc[NR_CPUS];
 
 static char *cpu_type;
 
+static DEFINE_PER_CPU(struct vcpu *, nmi_cont_vcpu);
+
 static int passive_domain_msr_op_checks(unsigned int msr, int *typep, int *indexp)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(current);
@@ -83,14 +85,28 @@ void passive_domain_destroy(struct vcpu *v)
 		model->free_msr(v);
 }
 
+bool nmi_oprofile_send_virq(void)
+{
+	struct vcpu *v = this_cpu(nmi_cont_vcpu);
+
+	if ( v )
+		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
+
+	this_cpu(nmi_cont_vcpu) = NULL;
+
+	return v;
+}
+
 static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
 {
 	int xen_mode, ovf;
 
 	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
 	xen_mode = ring_0(regs);
-	if ( ovf && is_active(current->domain) && !xen_mode )
-		send_guest_vcpu_virq(current, VIRQ_XENOPROF);
+	if ( ovf && is_active(current->domain) && !xen_mode ) {
+		this_cpu(nmi_cont_vcpu) = current;
+		trigger_nmi_continuation();
+	}
 
 	if ( ovf == 2 )
 		current->arch.nmi_pending = true;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5005ac6e6e..7cb7d7e09c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -65,6 +65,7 @@
 #include <asm/debugger.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
+#include <asm/xenoprof.h>
 #include <asm/shared.h>
 #include <asm/x86_emulate.h>
 #include <asm/traps.h>
@@ -1804,6 +1805,9 @@ bool nmi_check_continuation(void)
 {
     bool ret = false;
 
+    if ( nmi_oprofile_send_virq() )
+        ret = true;
+
     return ret;
 }
 
diff --git a/xen/include/asm-x86/xenoprof.h b/xen/include/asm-x86/xenoprof.h
index 1026ba2e1f..cf6af8c5df 100644
--- a/xen/include/asm-x86/xenoprof.h
+++ b/xen/include/asm-x86/xenoprof.h
@@ -69,6 +69,8 @@ int passive_domain_do_rdmsr(unsigned int msr, uint64_t *msr_content);
 int passive_domain_do_wrmsr(unsigned int msr, uint64_t msr_content);
 void passive_domain_destroy(struct vcpu *v);
 
+bool nmi_oprofile_send_virq(void);
+
 #else
 
 static inline int passive_domain_do_rdmsr(unsigned int msr,
@@ -85,6 +87,11 @@ static inline int passive_domain_do_wrmsr(unsigned int msr,
 
 static inline void passive_domain_destroy(struct vcpu *v) {}
 
+static inline bool nmi_oprofile_send_virq(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_XENOPROF */
 
 #endif /* __ASM_X86_XENOPROF_H__ */
-- 
2.26.2


