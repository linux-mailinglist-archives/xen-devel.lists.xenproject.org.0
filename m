Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BD36C152
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 10:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118124.224099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJUi-0002sN-1M; Tue, 27 Apr 2021 08:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118124.224099; Tue, 27 Apr 2021 08:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJUh-0002ry-U1; Tue, 27 Apr 2021 08:54:59 +0000
Received: by outflank-mailman (input) for mailman id 118124;
 Tue, 27 Apr 2021 08:54:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXGC=JY=gmail.com=jiangshanlai@srs-us1.protection.inumbo.net>)
 id 1lbJUg-0002rt-PX
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 08:54:58 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53d7ae31-15f2-4883-9adb-0a6bda47f70c;
 Tue, 27 Apr 2021 08:54:57 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so3121635pjb.4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Apr 2021 01:54:57 -0700 (PDT)
Received: from localhost ([47.251.4.198])
 by smtp.gmail.com with ESMTPSA id a65sm1986221pfb.116.2021.04.27.01.54.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Apr 2021 01:54:56 -0700 (PDT)
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
X-Inumbo-ID: 53d7ae31-15f2-4883-9adb-0a6bda47f70c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvudTC2BwHZGDoQJqasDl9cPJYuqaFYI5WCZvH5B/Zw=;
        b=oZTdWHWa9y4vR0NRkwGHue6dwcl2JqZgsg7a6+YjFGuPfYA01jgtr5CG2FVV6JxsZ9
         mypKHQE3nwLiAe0xgegucJmA7TC2ZoXS596vwbQv8YCiSKBLOMOYJ8Im+ZlEXh+zSJ9g
         CHv2PTnEtz7IYhTMf68AtMxtuO4rUylhz0qM2NHyetmNgDmoXfdZvPmgKbnLQf4ilqyT
         H0MgsAj/qVMZiQ9HbXjDKU6nbYGbANvN+DVIMT23z4vlS7QnD53TDBNLTwkBxXpsNpZE
         +KC9qHwy4uf+fbZxJj96Zrs7SPVrj/7U1zxWyVqqlCxxH8NWiTS4Q0V+XrcwxNqP1099
         RhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvudTC2BwHZGDoQJqasDl9cPJYuqaFYI5WCZvH5B/Zw=;
        b=ZEd+Frre0uiGn3lBteE+5rFTRHhgL7QAZoUV5j8Nu+bHsPPt+p/2mWt3vxgloDBXay
         N3JBWpHiTA1M5HsGViqkZzNwH0IsoWQ5OcwApKroY2UFR21EzU7p+TNz2hu9XWVa43DX
         l+qCA47fcULtjOo+Zqpv+JNq4n1VePeQa1iHVtd9S/TdsVbA/3Gbga2qA57i4RK7rjN9
         XSTZTQt1kAKmVOj0NKcCY5fpkcM4MHaF2PMoS+nQmKWOUo+RbUvLE0yc62UJuwS2ygXi
         2ubxK9mx8Cuosau5xlbuA9E7Mi1JuwyEtZVFMNfGDq9qylAbdk3QRj766Mt/bEqPz8tP
         hDdA==
X-Gm-Message-State: AOAM532wVB6sxlv0bMB1Fr/JsYCexfXX/O+2StMoOj063fOYZTwXaToa
	WVLHIvybHHuhLqf757xj/wM=
X-Google-Smtp-Source: ABdhPJyED8YOs73pY8DPavmzXj80ySfIXNvSlWASjVV8n8Ia2PPeO5IlLOQb7WEVRwY9uJ/wGmcSPA==
X-Received: by 2002:a17:90b:2393:: with SMTP id mr19mr3656655pjb.24.1619513697046;
        Tue, 27 Apr 2021 01:54:57 -0700 (PDT)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <laijs@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andi Kleen <ak@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Joerg Roedel <jroedel@suse.de>,
	Jian Cai <caij2003@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/4] x86/xen/entry: Rename xenpv_exc_nmi to noist_exc_nmi
Date: Tue, 27 Apr 2021 07:09:46 +0800
Message-Id: <20210426230949.3561-2-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20210426230949.3561-1-jiangshanlai@gmail.com>
References: <20210426230949.3561-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

There is no any functionality change intended.  Just rename it and
move it to arch/x86/kernel/nmi.c so that we can resue it later in
next patch for early NMI and kvm.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Cc: Jim Mattson <jmattson@google.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: kvm@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/include/asm/idtentry.h | 2 +-
 arch/x86/kernel/nmi.c           | 8 ++++++++
 arch/x86/xen/enlighten_pv.c     | 9 +++------
 arch/x86/xen/xen-asm.S          | 2 +-
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index e35e342673c7..5b11d2ddbb5c 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -590,7 +590,7 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	xenpv_exc_machine_check);
 /* NMI */
 DECLARE_IDTENTRY_NMI(X86_TRAP_NMI,	exc_nmi);
 #ifdef CONFIG_XEN_PV
-DECLARE_IDTENTRY_RAW(X86_TRAP_NMI,	xenpv_exc_nmi);
+DECLARE_IDTENTRY_RAW(X86_TRAP_NMI,	noist_exc_nmi);
 #endif
 
 /* #DB */
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index bf250a339655..2b907a76d0a1 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -524,6 +524,14 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 		mds_user_clear_cpu_buffers();
 }
 
+#ifdef CONFIG_XEN_PV
+DEFINE_IDTENTRY_RAW(noist_exc_nmi)
+{
+	/* On Xen PV, NMI doesn't use IST.  The C part is the same as native. */
+	exc_nmi(regs);
+}
+#endif
+
 void stop_nmi(void)
 {
 	ignore_nmis++;
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4f18cd9eacd8..5efbdb0905b7 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -565,12 +565,6 @@ static void xen_write_ldt_entry(struct desc_struct *dt, int entrynum,
 
 void noist_exc_debug(struct pt_regs *regs);
 
-DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
-{
-	/* On Xen PV, NMI doesn't use IST.  The C part is the same as native. */
-	exc_nmi(regs);
-}
-
 DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
 {
 	/* On Xen PV, DF doesn't use IST.  The C part is the same as native. */
@@ -626,6 +620,9 @@ struct trap_array_entry {
 	.xen		= xen_asm_xenpv_##func,		\
 	.ist_okay	= ist_ok }
 
+/* Alias to make TRAP_ENTRY_REDIR() happy for nmi */
+#define xen_asm_xenpv_exc_nmi	xen_asm_noist_exc_nmi
+
 static struct trap_array_entry trap_array[] = {
 	TRAP_ENTRY_REDIR(exc_debug,			true  ),
 	TRAP_ENTRY_REDIR(exc_double_fault,		true  ),
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 1e626444712b..12e7cbbb2a8d 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -130,7 +130,7 @@ _ASM_NOKPROBE(xen_\name)
 xen_pv_trap asm_exc_divide_error
 xen_pv_trap asm_xenpv_exc_debug
 xen_pv_trap asm_exc_int3
-xen_pv_trap asm_xenpv_exc_nmi
+xen_pv_trap asm_noist_exc_nmi
 xen_pv_trap asm_exc_overflow
 xen_pv_trap asm_exc_bounds
 xen_pv_trap asm_exc_invalid_op
-- 
2.19.1.6.gb485710b


