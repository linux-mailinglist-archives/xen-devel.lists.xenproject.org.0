Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D2A960F8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961788.1353200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ug-00078N-3d; Tue, 22 Apr 2025 08:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961788.1353200; Tue, 22 Apr 2025 08:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78uf-0006vx-H0; Tue, 22 Apr 2025 08:23:29 +0000
Received: by outflank-mailman (input) for mailman id 961788;
 Tue, 22 Apr 2025 08:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78uc-0004wM-5a
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:26 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c784155-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:21 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9X1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:59 -0700
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
X-Inumbo-ID: 0c784155-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9X1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310181;
	bh=NNx/bsW0ODtmJpfsi048P3Fj6b4nBpFrrvypKuPXLIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbIqq/wL911bUtP7+WKZQwUp5BP2uQDF0M396c/1wV9SxBhoCkZqNqqK/X5WlcGHr
	 ashWQDaWODnE6g9w4+IW/hSEyKjNsaVVVc+pObXiea4M3kb3inrzeAuXhSDfHp6Cx+
	 HfUn2y8wZAC5H0mjajud2hEDrBLl2csSFGl0BMmU/YjJkF1ob54eK/BjPWWd13ikh9
	 kLIBXoce48SGlAb8V3FWMUzo67hW5FrpbagoXdvt+RFV1FYEkIe1lKQFkOEY7FcA+R
	 eeiYsX+Bcaf3/8X8V8OUbwLjuG+YkH53wOp7lVVoobhRWAMn1YmRpvzx2zJd94GdB2
	 hN1HWhqneMGyA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v2 19/34] x86/extable: Add support for immediate form MSR instructions
Date: Tue, 22 Apr 2025 01:22:00 -0700
Message-ID: <20250422082216.1954310-20-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h | 18 ++++++++++++++++++
 arch/x86/mm/extable.c      | 39 +++++++++++++++++++++++++++++++++-----
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index c955339be9c9..8f7a67b1c61c 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -78,6 +78,24 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
 extern u64 xen_read_pmc(int counter);
 #endif
 
+/*
+ * Called only from an MSR fault handler, the instruction pointer points to
+ * the MSR access instruction that caused the fault.
+ */
+static __always_inline bool is_msr_imm_insn(void *ip)
+{
+	/*
+	 * A full decoder for immediate form MSR instructions appears excessive.
+	 */
+#ifdef CONFIG_X86_64
+	const u8 msr_imm_insn_prefix[] = { 0xc4, 0xe7 };
+
+	return !memcmp(ip, msr_imm_insn_prefix, sizeof(msr_imm_insn_prefix));
+#else
+	return false;
+#endif
+}
+
 /*
  * __rdmsr() and __wrmsr() are the two primitives which are the bare minimum MSR
  * accessors and should not have any tracing or other functionality piggybacking
diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index bf8dab18be97..f1743babafc8 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -167,23 +167,52 @@ static bool ex_handler_uaccess(const struct exception_table_entry *fixup,
 static bool ex_handler_msr(const struct exception_table_entry *fixup,
 			   struct pt_regs *regs, bool wrmsr, bool safe, int reg)
 {
+	bool imm_insn = is_msr_imm_insn((void *)regs->ip);
+	u32 msr;
+
+	if (imm_insn)
+		/*
+		 * The 32-bit immediate specifying a MSR is encoded into
+		 * byte 5 ~ 8 of an immediate form MSR instruction.
+		 */
+		msr = *(u32 *)(regs->ip + 5);
+	else
+		msr = (u32)regs->cx;
+
 	if (__ONCE_LITE_IF(!safe && wrmsr)) {
-		pr_warn("unchecked MSR access error: WRMSR to 0x%x (tried to write 0x%08x%08x) at rIP: 0x%lx (%pS)\n",
-			(unsigned int)regs->cx, (unsigned int)regs->dx,
-			(unsigned int)regs->ax,  regs->ip, (void *)regs->ip);
+		/*
+		 * To maintain consistency with existing RDMSR and WRMSR(NS) instructions,
+		 * the register operand for immediate form MSR instructions is ALWAYS
+		 * encoded as RAX in <asm/msr.h> for reading or writing the MSR value.
+		 */
+		u64 msr_val = regs->ax;
+
+		if (!imm_insn) {
+			/*
+			 * On processors that support the Intel 64 architecture, the
+			 * high-order 32 bits of each of RAX and RDX are ignored.
+			 */
+			msr_val &= 0xffffffff;
+			msr_val |= (u64)regs->dx << 32;
+		}
+
+		pr_warn("unchecked MSR access error: WRMSR to 0x%x (tried to write 0x%016llx) at rIP: 0x%lx (%pS)\n",
+			msr, msr_val, regs->ip, (void *)regs->ip);
 		show_stack_regs(regs);
 	}
 
 	if (__ONCE_LITE_IF(!safe && !wrmsr)) {
 		pr_warn("unchecked MSR access error: RDMSR from 0x%x at rIP: 0x%lx (%pS)\n",
-			(unsigned int)regs->cx, regs->ip, (void *)regs->ip);
+			msr, regs->ip, (void *)regs->ip);
 		show_stack_regs(regs);
 	}
 
 	if (!wrmsr) {
 		/* Pretend that the read succeeded and returned 0. */
 		regs->ax = 0;
-		regs->dx = 0;
+
+		if (!imm_insn)
+			regs->dx = 0;
 	}
 
 	if (safe)
-- 
2.49.0


