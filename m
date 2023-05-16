Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560EF705738
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535564.833410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0T5-00024s-Ag; Tue, 16 May 2023 19:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535564.833410; Tue, 16 May 2023 19:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0T5-00021R-7R; Tue, 16 May 2023 19:36:19 +0000
Received: by outflank-mailman (input) for mailman id 535564;
 Tue, 16 May 2023 19:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0T3-00020V-Dc
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb689075-f420-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:36:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE2E63E71;
 Tue, 16 May 2023 19:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C9EC4339B;
 Tue, 16 May 2023 19:36:07 +0000 (UTC)
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
X-Inumbo-ID: eb689075-f420-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265773;
	bh=+r42W67OGDQQqAy2PIbpqRJtm86RNedMVE1BNsE+HVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AOBuVWv84dy+YEirfBc0rOgB6n5+cRsHG61qC/Lnfi2dGn7Jv+JKh/H02eWWfMUF3
	 Ex2ZkwkMb7pU24/iLpb6Y8hKTZK4ttU1eJ2NobvkypPk2O2EnpVw+0yr+dF/PpkZQx
	 3eL/opgEW1QD86klpYN2w8CV+JEExP433BmmgiImAub0k+8is2vhhwVU/VPp6XDlfH
	 3XztpmqkQ5qaQ29gLQgBc9KgSs6vC4RdNI63NsfmLz+6t5LxvmdPqe41UvKb/ArBhl
	 S7oIwLXWs1/hwyZUUfG2KjSn5ZNqk85FsE1YOlhxhVLrZXk744pPU+X1xr/Njx6aQp
	 zQ2/DkqcjEvOQ==
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
Subject: [PATCH 01/20] x86: move prepare_ftrace_return prototype to header
Date: Tue, 16 May 2023 21:35:30 +0200
Message-Id: <20230516193549.544673-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit builds, the prepare_ftrace_return() function only has a global
definition, but no prototype before it, which causes a warning:

arch/x86/kernel/ftrace.c:625:6: warning: no previous prototype for ‘prepare_ftrace_return’ [-Wmissing-prototypes]
  625 | void prepare_ftrace_return(unsigned long ip, unsigned long *parent,

Move the prototype that is already needed for some configurations into
a header file where it can be seen unconditionally.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/ftrace.h | 3 +++
 arch/x86/kernel/ftrace.c      | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index 5061ac98ffa1..b8d4a07f9595 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -106,6 +106,9 @@ struct dyn_arch_ftrace {
 
 #ifndef __ASSEMBLY__
 
+void prepare_ftrace_return(unsigned long ip, unsigned long *parent,
+			   unsigned long frame_pointer);
+
 #if defined(CONFIG_FUNCTION_TRACER) && defined(CONFIG_DYNAMIC_FTRACE)
 extern void set_ftrace_ops_ro(void);
 #else
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 5e7ead52cfdb..01e8f34daf22 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -525,9 +525,6 @@ static void *addr_from_call(void *ptr)
 	return ptr + CALL_INSN_SIZE + call.disp;
 }
 
-void prepare_ftrace_return(unsigned long ip, unsigned long *parent,
-			   unsigned long frame_pointer);
-
 /*
  * If the ops->trampoline was not allocated, then it probably
  * has a static trampoline func, or is the ftrace caller itself.
-- 
2.39.2


