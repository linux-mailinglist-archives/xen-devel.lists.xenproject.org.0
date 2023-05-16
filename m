Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDE705746
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535577.833460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TY-0004No-MO; Tue, 16 May 2023 19:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535577.833460; Tue, 16 May 2023 19:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TY-0004LK-JN; Tue, 16 May 2023 19:36:48 +0000
Received: by outflank-mailman (input) for mailman id 535577;
 Tue, 16 May 2023 19:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0TX-00020V-72
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9167d8-f420-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:36:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 640B963E9B;
 Tue, 16 May 2023 19:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98313C433A4;
 Tue, 16 May 2023 19:36:38 +0000 (UTC)
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
X-Inumbo-ID: fd9167d8-f420-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265804;
	bh=LoIviGdfSLH1ko7JOljz+WAWBtvFrxU7baITA30Kitg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0SoTDZCBXANhO1JcRHoynXaLVhlO4XJ4vTd5g+5q0mXl9+dwihXQSjEJ2aF5PXD/
	 YJxxo2zEzGeYvPkjnpK4ydF8PNotm4sCoP7sIPFgPh0+jYX3ClFJbP9hWa/pr/81FH
	 rmiMLwAicNzJUMwErqx6DSJsta/whdlp/sC/tZT1cvxj5paHYr0r+8Nyyo5u5xkv5T
	 3r84XCOMO59rOsDFBM8wNIcW0zhbFHV1ety++q1mSUr8ScvUEZcAnGwKVpfu1h2uwR
	 waDu2tWolCE9YEYKKmG7d67vPlyLJ4ZYk6cOavjtt4C56mPdY+e8uvRCKegTvnFXKC
	 xnJG4ywBEjUvw==
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
Subject: [PATCH 06/20] x86: math-emu: include asm/fpu/regset.h
Date: Tue, 16 May 2023 21:35:35 +0200
Message-Id: <20230516193549.544673-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The fpregs_soft_set/fpregs_soft_get functions are declared in a
header that is not included in the file that defines them, causing
a W=1 warning:

/home/arnd/arm-soc/arch/x86/math-emu/fpu_entry.c:638:5: error: no previous prototype for 'fpregs_soft_set' [-Werror=missing-prototypes]
  638 | int fpregs_soft_set(struct task_struct *target,
      |     ^~~~~~~~~~~~~~~
/home/arnd/arm-soc/arch/x86/math-emu/fpu_entry.c:690:5: error: no previous prototype for 'fpregs_soft_get' [-Werror=missing-prototypes]
  690 | int fpregs_soft_get(struct task_struct *target,

Include the file here to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/math-emu/fpu_entry.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/math-emu/fpu_entry.c b/arch/x86/math-emu/fpu_entry.c
index 7fe56c594aa6..91c52ead1226 100644
--- a/arch/x86/math-emu/fpu_entry.c
+++ b/arch/x86/math-emu/fpu_entry.c
@@ -32,6 +32,7 @@
 #include <asm/traps.h>
 #include <asm/user.h>
 #include <asm/fpu/api.h>
+#include <asm/fpu/regset.h>
 
 #include "fpu_system.h"
 #include "fpu_emu.h"
-- 
2.39.2


