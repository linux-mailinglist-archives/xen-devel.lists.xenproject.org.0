Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147A70574C
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535579.833471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Tf-0004tk-0p; Tue, 16 May 2023 19:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535579.833471; Tue, 16 May 2023 19:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Te-0004r7-Rq; Tue, 16 May 2023 19:36:54 +0000
Received: by outflank-mailman (input) for mailman id 535579;
 Tue, 16 May 2023 19:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Td-00020V-A3
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 011342a9-f421-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:36:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7895663DB9;
 Tue, 16 May 2023 19:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB288C433D2;
 Tue, 16 May 2023 19:36:44 +0000 (UTC)
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
X-Inumbo-ID: 011342a9-f421-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265810;
	bh=UIw2cpO0M7mgQJomy8Z1KQIbzqHPSHzZkNPw0ZSZdik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JMo/H+dcAwoiU2BvKT+/qzV35hAeKJ89YTDQRfZVp5VuxZ7AAwO6XIq6mGKGPLHPM
	 n9Kgl0NxgfysUuyDXpoIpuKvgQDWBsj4qr+esrqhkg9QY7EaCjoIEcFFWSEs2pEGzA
	 FnkLwXZ2J/6v8Go5SZJp9S7qOEGXEQwUg5o1OEKHvC0coA5trawZlHiYQ1s91VRsLo
	 WQUb4Fjw53QsgtZj9Y0iaE8RIw4x3ZsPuMC/axFjq2EAqnJ7Ryi+ghY1T0ksu98x57
	 czRJOOwVX2pWrVR691opbv/O3yATTIWa99EE41FEQBTMfS2DReIvbrilOoBUrVW/Kl
	 t+ouxwrQLLJeA==
From: Arnd Bergmann <arnd@kernel.org>
To: x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 07/20] x86: doublefault: avoid missing-prototype warnings
Date: Tue, 16 May 2023 21:35:36 +0200
Message-Id: <20230516193549.544673-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Two functions in the 32-bit doublefault code are lacking a prototype:

arch/x86/kernel/doublefault_32.c:23:36: error: no previous prototype for 'doublefault_shim' [-Werror=missing-prototypes]
   23 | asmlinkage noinstr void __noreturn doublefault_shim(void)
      |                                    ^~~~~~~~~~~~~~~~
arch/x86/kernel/doublefault_32.c:114:6: error: no previous prototype for 'doublefault_init_cpu_tss' [-Werror=missing-prototypes]
  114 | void doublefault_init_cpu_tss(void)

The first one is only called from assembler, while the second one is
declared in doublefault.h, but this file is not included.

Include the header file and add the other declaration there as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/doublefault.h | 4 ++++
 arch/x86/kernel/doublefault_32.c   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/x86/include/asm/doublefault.h b/arch/x86/include/asm/doublefault.h
index 54a6e4a2e132..de0e88b32207 100644
--- a/arch/x86/include/asm/doublefault.h
+++ b/arch/x86/include/asm/doublefault.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_DOUBLEFAULT_H
 #define _ASM_X86_DOUBLEFAULT_H
 
+#include <linux/linkage.h>
+
 #ifdef CONFIG_X86_32
 extern void doublefault_init_cpu_tss(void);
 #else
@@ -10,4 +12,6 @@ static inline void doublefault_init_cpu_tss(void)
 }
 #endif
 
+asmlinkage void __noreturn doublefault_shim(void);
+
 #endif /* _ASM_X86_DOUBLEFAULT_H */
diff --git a/arch/x86/kernel/doublefault_32.c b/arch/x86/kernel/doublefault_32.c
index 3b58d8703094..6eaf9a6bc02f 100644
--- a/arch/x86/kernel/doublefault_32.c
+++ b/arch/x86/kernel/doublefault_32.c
@@ -9,6 +9,7 @@
 #include <asm/processor.h>
 #include <asm/desc.h>
 #include <asm/traps.h>
+#include <asm/doublefault.h>
 
 #define ptr_ok(x) ((x) > PAGE_OFFSET && (x) < PAGE_OFFSET + MAXMEM)
 
-- 
2.39.2


