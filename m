Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC678A961CB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962041.1353413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u794T-0006Bs-So; Tue, 22 Apr 2025 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962041.1353413; Tue, 22 Apr 2025 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u794T-00066Q-Q4; Tue, 22 Apr 2025 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 962041;
 Tue, 22 Apr 2025 08:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78uz-0004wM-TJ
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:49 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17b62d18-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:40 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9i1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:21 -0700
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
X-Inumbo-ID: 17b62d18-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9i1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310203;
	bh=KF9UoUhpkeUaxol5GmRaBP0wotoAE475jYCZa+6vJrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N6j53RZda7Hnrm3Z8UyJWyl2m7EfT1Jh76ZttRjn46pCv8YaQQ+xpoMdgq0mPnpKT
	 EwUMoOWhnYnb1/5hgNgmETHvL/rJmUEuW/oCXN9+U/55daY2aP+9r3mvUTRZj/8bsV
	 Hiuiyy+A89g2q4kl9x9SYelhIwx/krb/rTlGpcOePi8Lcb7Yrrt0i5MwE/MwittSk8
	 DUwskE+3zk5l9DH1aLljDwGukqrX7eL9Kc94LgWeRGlyrPWt2CjUbcUdgwBwaB+ifk
	 emZJByhMB2HFpmTeT9i0/P2Ha3s458mTGVQRX0DFn5l6yAdmgruipzB9tsCHO66Px/
	 QI5yU9wp4aydw==
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
Subject: [RFC PATCH v2 30/34] x86/msr: Rename native_rdmsr() to native_rdmsr_no_trace()
Date: Tue, 22 Apr 2025 01:22:11 -0700
Message-ID: <20250422082216.1954310-31-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

native_rdmsr() doesn't do trace thus can be used in noinstr context,
rename it to native_rdmsr_no_trace() to make it explicit.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/microcode.h      | 2 +-
 arch/x86/include/asm/msr.h            | 8 ++++----
 arch/x86/kernel/cpu/microcode/amd.c   | 2 +-
 arch/x86/kernel/cpu/microcode/core.c  | 2 +-
 arch/x86/kernel/cpu/microcode/intel.c | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index da482f430d80..d581fdaf1f36 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -69,7 +69,7 @@ static inline u32 intel_get_microcode_revision(void)
 	native_cpuid_eax(1);
 
 	/* get the current revision from MSR 0x8B */
-	native_rdmsr(MSR_IA32_UCODE_REV, dummy, rev);
+	native_rdmsr_no_trace(MSR_IA32_UCODE_REV, dummy, rev);
 
 	return rev;
 }
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 050d750a5ab7..dfaac42b6258 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -158,9 +158,9 @@ static __always_inline bool is_msr_imm_insn(void *ip)
  *                            /     \                                |
  *                           /       \                               |
  *        native_rdmsrq_no_trace()    native_read_msr_safe()         |
- *                   /    \                                          |
- *                  /      \                                         |
- *      native_rdmsr()    native_read_msr()                          |
+ *                   /      \                                        |
+ *                  /        \                                       |
+ * native_rdmsr_no_trace()    native_read_msr()                      |
  *                                                                   |
  *                                                                   |
  *                                                                   |
@@ -256,7 +256,7 @@ static __always_inline u64 native_rdmsrq_no_trace(u32 msr)
 	return val;
 }
 
-#define native_rdmsr(msr, low, high)			\
+#define native_rdmsr_no_trace(msr, low, high)		\
 do {							\
 	u64 __val = native_rdmsrq_no_trace(msr);	\
 	(void)((low) = (u32)__val);			\
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 41c553396500..f1f275ddab57 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -256,7 +256,7 @@ static u32 get_patch_level(void)
 {
 	u32 rev, dummy __always_unused;
 
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
+	native_rdmsr_no_trace(MSR_AMD64_PATCH_LEVEL, rev, dummy);
 
 	return rev;
 }
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..9bda8fd987ab 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -84,7 +84,7 @@ static bool amd_check_current_patch_level(void)
 	u32 lvl, dummy, i;
 	u32 *levels;
 
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
+	native_rdmsr_no_trace(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
 
 	levels = final_levels;
 
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 26e13dc4cedd..c0307b1ad63d 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -78,7 +78,7 @@ void intel_collect_cpu_info(struct cpu_signature *sig)
 		unsigned int val[2];
 
 		/* get processor flags from MSR 0x17 */
-		native_rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
+		native_rdmsr_no_trace(MSR_IA32_PLATFORM_ID, val[0], val[1]);
 		sig->pf = 1 << ((val[1] >> 18) & 7);
 	}
 }
-- 
2.49.0


