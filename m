Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C714A960F9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961792.1353234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78uk-00084V-Ds; Tue, 22 Apr 2025 08:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961792.1353234; Tue, 22 Apr 2025 08:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78uj-0007iB-Gy; Tue, 22 Apr 2025 08:23:33 +0000
Received: by outflank-mailman (input) for mailman id 961792;
 Tue, 22 Apr 2025 08:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ue-0004wM-69
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:28 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f39a560-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:25 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9b1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:07 -0700
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
X-Inumbo-ID: 0f39a560-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9b1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310189;
	bh=1txH+adcfOwIr5LH/ZlSlDHGsa/VNPa8LSISbt9l4Ro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxFRBToWvEqJ0D8+VHe17wCVzLMgXTwVfmryl84uMGCcCa1OR1gcYgk3F9JimIkEm
	 Id/7hCRonS1tRSe3XbDtDY2rOOSRAECeUFgk8SnqUTUQVMI7fMsmlmLdA+V1Isnccx
	 NyOxGoeye8+rFjFY7d/LaanWDAMzgutZnK7I8bQcQOzDgKbXuT2nLEFt3l17FoQjbN
	 0MBd1FBVWKYzzM4HdY+mKWx4rA3pjbiDgR4YfpiXTsRCo/G4/quQSJEIDnLLYiZ/pn
	 +gaaR0PJHyRUhR9gBfrfjXO0nxpya9KvdRYx5dSosavK3jrRh2vDAAe1RpFOl3uFKb
	 EUpT5J98djaIA==
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
Subject: [RFC PATCH v2 23/34] x86/extable: Remove new dead code in ex_handler_msr()
Date: Tue, 22 Apr 2025 01:22:04 -0700
Message-ID: <20250422082216.1954310-24-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSR read APIs no longer expect RAX or EDX:EAX to be cleared upon
returning from #GP caused by MSR read instructions.

The MSR safe APIs no longer assume -EIO being returned in a register
from #GP caused by MSR instructions.

Remove new dead code due to above changes.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/mm/extable.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 6bf4c2a43c2c..ea3fe7f32772 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -165,7 +165,7 @@ static bool ex_handler_uaccess(const struct exception_table_entry *fixup,
 }
 
 static bool ex_handler_msr(const struct exception_table_entry *fixup,
-			   struct pt_regs *regs, bool wrmsr, bool safe, int reg)
+			   struct pt_regs *regs, bool wrmsr, bool safe)
 {
 	bool imm_insn = is_msr_imm_insn((void *)regs->ip);
 	u32 msr;
@@ -207,17 +207,6 @@ static bool ex_handler_msr(const struct exception_table_entry *fixup,
 		show_stack_regs(regs);
 	}
 
-	if (!wrmsr) {
-		/* Pretend that the read succeeded and returned 0. */
-		regs->ax = 0;
-
-		if (!imm_insn)
-			regs->dx = 0;
-	}
-
-	if (safe)
-		*pt_regs_nr(regs, reg) = -EIO;
-
 	return ex_handler_default(fixup, regs);
 }
 
@@ -395,13 +384,13 @@ int fixup_exception(struct pt_regs *regs, int trapnr, unsigned long error_code,
 		case EX_TYPE_BPF:
 			return ex_handler_bpf(e, regs);
 		case EX_TYPE_WRMSR:
-			return ex_handler_msr(e, regs, true, false, reg);
+			return ex_handler_msr(e, regs, true, false);
 		case EX_TYPE_RDMSR:
-			return ex_handler_msr(e, regs, false, false, reg);
+			return ex_handler_msr(e, regs, false, false);
 		case EX_TYPE_WRMSR_SAFE:
-			return ex_handler_msr(e, regs, true, true, reg);
+			return ex_handler_msr(e, regs, true, true);
 		case EX_TYPE_RDMSR_SAFE:
-			return ex_handler_msr(e, regs, false, true, reg);
+			return ex_handler_msr(e, regs, false, true);
 		case EX_TYPE_WRMSR_IN_MCE:
 			ex_handler_msr_mce(regs, true);
 			break;
-- 
2.49.0


