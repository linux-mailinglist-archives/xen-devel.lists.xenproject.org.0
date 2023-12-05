Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D516E8051FD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647560.1010849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUX-0004YJ-Hd; Tue, 05 Dec 2023 11:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647560.1010849; Tue, 05 Dec 2023 11:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATUX-0004Rl-BO; Tue, 05 Dec 2023 11:21:29 +0000
Received: by outflank-mailman (input) for mailman id 647560;
 Tue, 05 Dec 2023 11:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUV-0003dP-SU
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:27 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd8b9cc-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:25 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:18 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:16 -0800
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
X-Inumbo-ID: 6cd8b9cc-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775286; x=1733311286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rcIX7hZP19m5L490VTf3i3xI4HPGPBfZoYyDd0t+hRM=;
  b=QyLJKSOHG1YURSmhSE6+Ta7wXoFOslKhEFLlXdEwWbeWKNpOf/239lUh
   b7aWw+f3m09tfUnJd5xYXWsLfr/M2FBQhCOPPMqXY73BO3zLvvFeMa5yS
   D0yRMdX2ndbyVT0VZhOz7vwW2MC9AHC0UlmnvEiCTzjbITAvPJ64yF/EW
   1na/LQUEv5Q6KTh0HzfHZtXlGYvOgjKUwnhFojZ5k8l3wVv2X34gmhKUz
   FxEZFC0R5QUxZLzghcBD4HasO6jmIO1b1y95Sw9me4SoFGqrlpeUNwls6
   brnaWD+/yHObbSC9e02DRWfyK37byBOjlKU+s9dVoM1AyPvwj/jsxLEHB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942335"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942335"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192908"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192908"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 04/35] Documentation/x86/64: Add a documentation for FRED
Date: Tue,  5 Dec 2023 02:49:53 -0800
Message-ID: <20231205105030.8698-5-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Briefly introduce FRED, and its advantages compared to IDT.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v10:
* Reword a sentence to improve readability (Nikolay Borisov).
---
 Documentation/arch/x86/x86_64/fred.rst  | 96 +++++++++++++++++++++++++
 Documentation/arch/x86/x86_64/index.rst |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/arch/x86/x86_64/fred.rst

diff --git a/Documentation/arch/x86/x86_64/fred.rst b/Documentation/arch/x86/x86_64/fred.rst
new file mode 100644
index 000000000000..9f57e7b91f7e
--- /dev/null
+++ b/Documentation/arch/x86/x86_64/fred.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Flexible Return and Event Delivery (FRED)
+=========================================
+
+Overview
+========
+
+The FRED architecture defines simple new transitions that change
+privilege level (ring transitions). The FRED architecture was
+designed with the following goals:
+
+1) Improve overall performance and response time by replacing event
+   delivery through the interrupt descriptor table (IDT event
+   delivery) and event return by the IRET instruction with lower
+   latency transitions.
+
+2) Improve software robustness by ensuring that event delivery
+   establishes the full supervisor context and that event return
+   establishes the full user context.
+
+The new transitions defined by the FRED architecture are FRED event
+delivery and, for returning from events, two FRED return instructions.
+FRED event delivery can effect a transition from ring 3 to ring 0, but
+it is used also to deliver events incident to ring 0. One FRED
+instruction (ERETU) effects a return from ring 0 to ring 3, while the
+other (ERETS) returns while remaining in ring 0. Collectively, FRED
+event delivery and the FRED return instructions are FRED transitions.
+
+In addition to these transitions, the FRED architecture defines a new
+instruction (LKGS) for managing the state of the GS segment register.
+The LKGS instruction can be used by 64-bit operating systems that do
+not use the new FRED transitions.
+
+Furthermore, the FRED architecture is easy to extend for future CPU
+architectures.
+
+Software based event dispatching
+================================
+
+FRED operates differently from IDT in terms of event handling. Instead
+of directly dispatching an event to its handler based on the event
+vector, FRED requires the software to dispatch an event to its handler
+based on both the event's type and vector. Therefore, an event dispatch
+framework must be implemented to facilitate the event-to-handler
+dispatch process. The FRED event dispatch framework takes control
+once an event is delivered, and employs a two-level dispatch.
+
+The first level dispatching is event type based, and the second level
+dispatching is event vector based.
+
+Full supervisor/user context
+============================
+
+FRED event delivery atomically save and restore full supervisor/user
+context upon event delivery and return. Thus it avoids the problem of
+transient states due to %cr2 and/or %dr6, and it is no longer needed
+to handle all the ugly corner cases caused by half baked entry states.
+
+FRED allows explicit unblock of NMI with new event return instructions
+ERETS/ERETU, avoiding the mess caused by IRET which unconditionally
+unblocks NMI, e.g., when an exception happens during NMI handling.
+
+FRED always restores the full value of %rsp, thus ESPFIX is no longer
+needed when FRED is enabled.
+
+LKGS
+====
+
+LKGS behaves like the MOV to GS instruction except that it loads the
+base address into the IA32_KERNEL_GS_BASE MSR instead of the GS
+segment’s descriptor cache. With LKGS, it ends up with avoiding
+mucking with kernel GS, i.e., an operating system can always operate
+with its own GS base address.
+
+Because FRED event delivery from ring 3 and ERETU both swap the value
+of the GS base address and that of the IA32_KERNEL_GS_BASE MSR, plus
+the introduction of LKGS instruction, the SWAPGS instruction is no
+longer needed when FRED is enabled, thus is disallowed (#UD).
+
+Stack levels
+============
+
+4 stack levels 0~3 are introduced to replace the nonreentrant IST for
+event handling, and each stack level should be configured to use a
+dedicated stack.
+
+The current stack level could be unchanged or go higher upon FRED
+event delivery. If unchanged, the CPU keeps using the current event
+stack. If higher, the CPU switches to a new event stack specified by
+the MSR of the new stack level, i.e., MSR_IA32_FRED_RSP[123].
+
+Only execution of a FRED return instruction ERET[US], could lower the
+current stack level, causing the CPU to switch back to the stack it was
+on before a previous event delivery that promoted the stack level.
diff --git a/Documentation/arch/x86/x86_64/index.rst b/Documentation/arch/x86/x86_64/index.rst
index a56070fc8e77..ad15e9bd623f 100644
--- a/Documentation/arch/x86/x86_64/index.rst
+++ b/Documentation/arch/x86/x86_64/index.rst
@@ -15,3 +15,4 @@ x86_64 Support
    cpu-hotplug-spec
    machinecheck
    fsgs
+   fred
-- 
2.43.0


