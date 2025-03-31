Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6FA7617B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932000.1334240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARG-0003H8-Jd; Mon, 31 Mar 2025 08:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932000.1334240; Mon, 31 Mar 2025 08:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARG-000370-3A; Mon, 31 Mar 2025 08:24:10 +0000
Received: by outflank-mailman (input) for mailman id 932000;
 Mon, 31 Mar 2025 08:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARD-0001uf-QN
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:07 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8126a2b5-0e09-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:24:04 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp0A3171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:18 -0700
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
X-Inumbo-ID: 8126a2b5-0e09-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp0A3171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409400;
	bh=K1q53eo/E11QGaBNCmuuiEewoEjYIhJFKtCNyzdMWfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYJJM8Xj8oLRQMrpq1oZ9Rnts/L5sB1pkc/gbLLiuGLqwOG9qwxAGu/4BG68QY0E9
	 wfBdSwh4eQvvh2/Y3Z6WaX7t7pE5x/AyF9EYYVoeYUsrgjy5aQsLhKl3r8wbyqsS8o
	 qh1pRd13tdt4PmpmLxqluvo/m8RcpuW2x76HH/JRrb1yV8WiUIE4hCpEtDNED/Yh+6
	 sNVHvloh/CyqgKztI+Tc3MQqU27RJiZ6HQl+pwJmYWKADo2kfVmQTIr7agdhUDKEDb
	 anOJ6HwZplUeZ1KVIk1BWCIusZV2JYQ1KiyYhKxPqQ6qOrnhQXCF8X6edaiE7NigVe
	 yW2IFXjim5dUQ==
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
Subject: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form when available
Date: Mon, 31 Mar 2025 01:22:46 -0700
Message-ID: <20250331082251.3171276-11-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr-index.h |  6 ++++++
 arch/x86/kvm/vmx/vmenter.S       | 28 ++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e6134ef2263d..04244c3ba374 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1226,4 +1226,10 @@
 						* a #GP
 						*/
 
+/* Instruction opcode for WRMSRNS supported in binutils >= 2.40 */
+#define ASM_WRMSRNS		_ASM_BYTES(0x0f,0x01,0xc6)
+
+/* Instruction opcode for the immediate form RDMSR/WRMSRNS */
+#define ASM_WRMSRNS_RAX		_ASM_BYTES(0xc4,0xe7,0x7a,0xf6,0xc0)
+
 #endif /* _ASM_X86_MSR_INDEX_H */
diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
index f6986dee6f8c..9fae43723c44 100644
--- a/arch/x86/kvm/vmx/vmenter.S
+++ b/arch/x86/kvm/vmx/vmenter.S
@@ -64,6 +64,29 @@
 	RET
 .endm
 
+/*
+ * Write EAX to MSR_IA32_SPEC_CTRL.
+ *
+ * Choose the best WRMSR instruction based on availability.
+ *
+ * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' once binutils support them.
+ */
+.macro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
+	ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
+				  xor %edx, %edx;				\
+				  mov %edi, %eax;				\
+				  ds wrmsr),					\
+		      __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
+				  xor %edx, %edx;				\
+				  mov %edi, %eax;				\
+				  ASM_WRMSRNS),					\
+		      X86_FEATURE_WRMSRNS,					\
+		      __stringify(xor %_ASM_AX, %_ASM_AX;			\
+				  mov %edi, %eax;				\
+				  ASM_WRMSRNS_RAX; .long MSR_IA32_SPEC_CTRL),	\
+		      X86_FEATURE_MSR_IMM
+.endm
+
 .section .noinstr.text, "ax"
 
 /**
@@ -123,10 +146,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
 	movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
 	cmp %edi, %esi
 	je .Lspec_ctrl_done
-	mov $MSR_IA32_SPEC_CTRL, %ecx
-	xor %edx, %edx
-	mov %edi, %eax
-	wrmsr
+	WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
 
 .Lspec_ctrl_done:
 
-- 
2.49.0


