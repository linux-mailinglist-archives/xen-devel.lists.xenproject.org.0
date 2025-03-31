Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742DDA76180
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932004.1334277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARK-0004Ds-CP; Mon, 31 Mar 2025 08:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932004.1334277; Mon, 31 Mar 2025 08:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARK-00045B-0Y; Mon, 31 Mar 2025 08:24:14 +0000
Received: by outflank-mailman (input) for mailman id 932004;
 Mon, 31 Mar 2025 08:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARF-0001uf-QP
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:09 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 818e157e-0e09-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:24:05 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp0B3171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:20 -0700
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
X-Inumbo-ID: 818e157e-0e09-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp0B3171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409402;
	bh=AliY8eRLGXH0M9T1YLICUMbSBraUzdLknMsijvvtjSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PnRobvTiAXfnZAA5cVvRKq7KE/T/TrORn+EtVp1jCTqA8ycun7Wucl8DJLIO71N2/
	 uSEpnYPaUafO8DpxST6jufpuHWqLkzTNOnaZtZniIJpVjolE8yipeVlu40jxS3AxVz
	 SQXxQMsab++sLuUC9KkA/PcH3r95hKodFUqGxFZQ9js7SuO8Is0I08vsCNtKya5bjI
	 mij9VKqWcRygtaCmMG+i1TdPNItSumUg5xfXgt/1D8fSuKbEzPD6bPqWH0ZclRLlBQ
	 yjIIY+aIXe/tviO8O3oyYbGBtYyk40Hm4yPMyYxfnoNqsAUOTo4DSLZ+1BUmRmGqR4
	 89R6xqzhUgPLQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
        acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v1 11/15] x86/extable: Implement EX_TYPE_FUNC_REWIND
Date: Mon, 31 Mar 2025 01:22:47 -0700
Message-ID: <20250331082251.3171276-12-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add a new exception type, which allows emulating an exception as if it
had happened at or near the call site of a function.  This allows a
function call inside an alternative for instruction emulation to "kick
back" the exception into the alternatives pattern, possibly invoking a
different exception handling pattern there, or at least indicating the
"real" location of the fault.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/asm.h                 |   6 +
 arch/x86/include/asm/extable_fixup_types.h |   1 +
 arch/x86/mm/extable.c                      | 135 +++++++++++++--------
 3 files changed, 91 insertions(+), 51 deletions(-)

diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
index cc2881576c2c..c05c33653194 100644
--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -243,5 +243,11 @@ register unsigned long current_stack_pointer asm(_ASM_SP);
 #define _ASM_EXTABLE_FAULT(from, to)				\
 	_ASM_EXTABLE_TYPE(from, to, EX_TYPE_FAULT)
 
+#define _ASM_EXTABLE_FUNC_REWIND(from, ipdelta, spdelta)	\
+	_ASM_EXTABLE_TYPE(from, from /* unused */,		\
+			  EX_TYPE_FUNC_REWIND |			\
+			  EX_DATA_REG(spdelta) |		\
+			  EX_DATA_IMM(ipdelta))
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_X86_ASM_H */
diff --git a/arch/x86/include/asm/extable_fixup_types.h b/arch/x86/include/asm/extable_fixup_types.h
index 906b0d5541e8..9cd1cea45052 100644
--- a/arch/x86/include/asm/extable_fixup_types.h
+++ b/arch/x86/include/asm/extable_fixup_types.h
@@ -67,5 +67,6 @@
 #define	EX_TYPE_ZEROPAD			20 /* longword load with zeropad on fault */
 
 #define	EX_TYPE_ERETU			21
+#define	EX_TYPE_FUNC_REWIND		22
 
 #endif
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 51986e8a9d35..eb9331240a88 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -290,6 +290,27 @@ static bool ex_handler_eretu(const struct exception_table_entry *fixup,
 }
 #endif
 
+/*
+ * Emulate a fault taken at the call site of a function.
+ *
+ * The combined reg and flags field are used as an unsigned number of
+ * machine words to pop off the stack before the return address, then
+ * the signed imm field is used as a delta from the return IP address.
+ */
+static bool ex_handler_func_rewind(struct pt_regs *regs, int data)
+{
+	const long ipdelta = FIELD_GET(EX_DATA_IMM_MASK, data);
+	const unsigned long pops = FIELD_GET(EX_DATA_REG_MASK | EX_DATA_FLAG_MASK, data);
+	unsigned long *sp;
+
+	sp = (unsigned long *)regs->sp;
+	sp += pops;
+	regs->ip = *sp++ + ipdelta;
+	regs->sp = (unsigned long)sp;
+
+	return true;
+}
+
 int ex_get_fixup_type(unsigned long ip)
 {
 	const struct exception_table_entry *e = search_exception_tables(ip);
@@ -302,6 +323,7 @@ int fixup_exception(struct pt_regs *regs, int trapnr, unsigned long error_code,
 {
 	const struct exception_table_entry *e;
 	int type, reg, imm;
+	bool again;
 
 #ifdef CONFIG_PNPBIOS
 	if (unlikely(SEGMENT_IS_PNP_CODE(regs->cs))) {
@@ -317,60 +339,71 @@ int fixup_exception(struct pt_regs *regs, int trapnr, unsigned long error_code,
 	}
 #endif
 
-	e = search_exception_tables(regs->ip);
-	if (!e)
-		return 0;
-
-	type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
-	reg  = FIELD_GET(EX_DATA_REG_MASK,  e->data);
-	imm  = FIELD_GET(EX_DATA_IMM_MASK,  e->data);
-
-	switch (type) {
-	case EX_TYPE_DEFAULT:
-	case EX_TYPE_DEFAULT_MCE_SAFE:
-		return ex_handler_default(e, regs);
-	case EX_TYPE_FAULT:
-	case EX_TYPE_FAULT_MCE_SAFE:
-		return ex_handler_fault(e, regs, trapnr);
-	case EX_TYPE_UACCESS:
-		return ex_handler_uaccess(e, regs, trapnr, fault_addr);
-	case EX_TYPE_CLEAR_FS:
-		return ex_handler_clear_fs(e, regs);
-	case EX_TYPE_FPU_RESTORE:
-		return ex_handler_fprestore(e, regs);
-	case EX_TYPE_BPF:
-		return ex_handler_bpf(e, regs);
-	case EX_TYPE_WRMSR:
-		return ex_handler_msr(e, regs, true, false, reg);
-	case EX_TYPE_RDMSR:
-		return ex_handler_msr(e, regs, false, false, reg);
-	case EX_TYPE_WRMSR_SAFE:
-		return ex_handler_msr(e, regs, true, true, reg);
-	case EX_TYPE_RDMSR_SAFE:
-		return ex_handler_msr(e, regs, false, true, reg);
-	case EX_TYPE_WRMSR_IN_MCE:
-		ex_handler_msr_mce(regs, true);
-		break;
-	case EX_TYPE_RDMSR_IN_MCE:
-		ex_handler_msr_mce(regs, false);
-		break;
-	case EX_TYPE_POP_REG:
-		regs->sp += sizeof(long);
-		fallthrough;
-	case EX_TYPE_IMM_REG:
-		return ex_handler_imm_reg(e, regs, reg, imm);
-	case EX_TYPE_FAULT_SGX:
-		return ex_handler_sgx(e, regs, trapnr);
-	case EX_TYPE_UCOPY_LEN:
-		return ex_handler_ucopy_len(e, regs, trapnr, fault_addr, reg, imm);
-	case EX_TYPE_ZEROPAD:
-		return ex_handler_zeropad(e, regs, fault_addr);
+	do {
+		e = search_exception_tables(regs->ip);
+		if (!e)
+			return 0;
+
+		again = false;
+
+		type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
+		reg  = FIELD_GET(EX_DATA_REG_MASK,  e->data);
+		imm  = FIELD_GET(EX_DATA_IMM_MASK,  e->data);
+
+		switch (type) {
+		case EX_TYPE_DEFAULT:
+		case EX_TYPE_DEFAULT_MCE_SAFE:
+			return ex_handler_default(e, regs);
+		case EX_TYPE_FAULT:
+		case EX_TYPE_FAULT_MCE_SAFE:
+			return ex_handler_fault(e, regs, trapnr);
+		case EX_TYPE_UACCESS:
+			return ex_handler_uaccess(e, regs, trapnr, fault_addr);
+		case EX_TYPE_CLEAR_FS:
+			return ex_handler_clear_fs(e, regs);
+		case EX_TYPE_FPU_RESTORE:
+			return ex_handler_fprestore(e, regs);
+		case EX_TYPE_BPF:
+			return ex_handler_bpf(e, regs);
+		case EX_TYPE_WRMSR:
+			return ex_handler_msr(e, regs, true, false, reg);
+		case EX_TYPE_RDMSR:
+			return ex_handler_msr(e, regs, false, false, reg);
+		case EX_TYPE_WRMSR_SAFE:
+			return ex_handler_msr(e, regs, true, true, reg);
+		case EX_TYPE_RDMSR_SAFE:
+			return ex_handler_msr(e, regs, false, true, reg);
+		case EX_TYPE_WRMSR_IN_MCE:
+			ex_handler_msr_mce(regs, true);
+			break;
+		case EX_TYPE_RDMSR_IN_MCE:
+			ex_handler_msr_mce(regs, false);
+			break;
+		case EX_TYPE_POP_REG:
+			regs->sp += sizeof(long);
+			fallthrough;
+		case EX_TYPE_IMM_REG:
+			return ex_handler_imm_reg(e, regs, reg, imm);
+		case EX_TYPE_FAULT_SGX:
+			return ex_handler_sgx(e, regs, trapnr);
+		case EX_TYPE_UCOPY_LEN:
+			return ex_handler_ucopy_len(e, regs, trapnr, fault_addr, reg, imm);
+		case EX_TYPE_ZEROPAD:
+			return ex_handler_zeropad(e, regs, fault_addr);
 #ifdef CONFIG_X86_FRED
-	case EX_TYPE_ERETU:
-		return ex_handler_eretu(e, regs, error_code);
+		case EX_TYPE_ERETU:
+			return ex_handler_eretu(e, regs, error_code);
 #endif
-	}
+		case EX_TYPE_FUNC_REWIND:
+			again = ex_handler_func_rewind(regs, e->data);
+			break;
+		default:
+			break;	/* Will BUG() */
+		}
+	} while (again);
+
 	BUG();
+	return 0;
 }
 
 extern unsigned int early_recursion_flag;
-- 
2.49.0


