Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A75A7617E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932002.1334260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARI-0003jV-Ig; Mon, 31 Mar 2025 08:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932002.1334260; Mon, 31 Mar 2025 08:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARH-0003TT-Oa; Mon, 31 Mar 2025 08:24:11 +0000
Received: by outflank-mailman (input) for mailman id 932002;
 Mon, 31 Mar 2025 08:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARE-0001uf-QP
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81794632-0e09-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:24:05 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp0F3171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:28 -0700
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
X-Inumbo-ID: 81794632-0e09-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp0F3171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409410;
	bh=cMFNgaQ/yU5pBBnUjuHrZWgQ7p+gEOsEGfeLMhV/cHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SuHDQIJy8AzSLC0DrXz1UGsHXHhDsnDQpCgFuieur9l29e7EM1ArYQl7rGjnX8wD+
	 WkraR40jpmWTpADYisOZ7nbeYq+ByLQ5TLLYH8kKM7DCg5buwGVA5GHhHZVrggSeZ4
	 p9nifPZWSuSDm1534yUVgXXqF/kvTz/WBhHohMexeK1jikiHydt9HM2bVqx8MyrHLR
	 c8M6luTBzpzY8I0f63iDe6i8yCHSJXzCnLx3cOikN4ytSEhwdKsNU/oWb2NhlDUBla
	 mlZbjuvfxWirBhjjqog8XtnbNx9xitJDGMf/rsrr0eINZ0q1eEmyIbBAiN8ijpnMcH
	 lJXB3Tmz/tP0A==
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
Subject: [RFC PATCH v1 15/15] x86/msr: Move the ARGS macros after the MSR read/write APIs
Date: Mon, 31 Mar 2025 01:22:51 -0700
Message-ID: <20250331082251.3171276-16-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the ARGS macros are no longer used in the MSR read/write API
implementation, move them after their definitions.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index fc93c2601853..9b109d1d92aa 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -37,23 +37,6 @@ struct saved_msrs {
 	struct saved_msr *array;
 };
 
-/*
- * both i386 and x86_64 returns 64-bit value in edx:eax, but gcc's "A"
- * constraint has different meanings. For i386, "A" means exactly
- * edx:eax, while for x86_64 it doesn't mean rdx:rax or edx:eax. Instead,
- * it means rax *or* rdx.
- */
-#ifdef CONFIG_X86_64
-/* Using 64-bit values saves one instruction clearing the high half of low */
-#define DECLARE_ARGS(val, low, high)	unsigned long low, high
-#define EAX_EDX_VAL(val, low, high)	((low) | (high) << 32)
-#define EAX_EDX_RET(val, low, high)	"=a" (low), "=d" (high)
-#else
-#define DECLARE_ARGS(val, low, high)	unsigned long long val
-#define EAX_EDX_VAL(val, low, high)	(val)
-#define EAX_EDX_RET(val, low, high)	"=A" (val)
-#endif
-
 /*
  * Be very careful with includes. This header is prone to include loops.
  */
@@ -620,6 +603,23 @@ static __always_inline int wrmsrl_safe(const u32 msr, const u64 val)
 extern int rdmsr_safe_regs(u32 regs[8]);
 extern int wrmsr_safe_regs(u32 regs[8]);
 
+/*
+ * both i386 and x86_64 returns 64-bit value in edx:eax, but gcc's "A"
+ * constraint has different meanings. For i386, "A" means exactly
+ * edx:eax, while for x86_64 it doesn't mean rdx:rax or edx:eax. Instead,
+ * it means rax *or* rdx.
+ */
+#ifdef CONFIG_X86_64
+/* Using 64-bit values saves one instruction clearing the high half of low */
+#define DECLARE_ARGS(val, low, high)	unsigned long low, high
+#define EAX_EDX_VAL(val, low, high)	((low) | (high) << 32)
+#define EAX_EDX_RET(val, low, high)	"=a" (low), "=d" (high)
+#else
+#define DECLARE_ARGS(val, low, high)	unsigned long long val
+#define EAX_EDX_VAL(val, low, high)	(val)
+#define EAX_EDX_RET(val, low, high)	"=A" (val)
+#endif
+
 /**
  * rdtsc() - returns the current TSC without ordering constraints
  *
-- 
2.49.0


