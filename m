Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F6705790
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535606.833530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0We-0008Vf-Sd; Tue, 16 May 2023 19:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535606.833530; Tue, 16 May 2023 19:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0We-0008Se-PG; Tue, 16 May 2023 19:40:00 +0000
Received: by outflank-mailman (input) for mailman id 535606;
 Tue, 16 May 2023 19:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0U1-0001kC-Tz
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdbeda6-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:37:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4538563EA1;
 Tue, 16 May 2023 19:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D45FC433EF;
 Tue, 16 May 2023 19:37:08 +0000 (UTC)
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
X-Inumbo-ID: 0fdbeda6-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265834;
	bh=+aTnWzkkpkhZD/Q7mAQ3dRAZxC9ekU9RPhso/2vdjUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMBAvFb2VaJhJEHCkXY8xN9dopzfCYxzGAVtlxmPc4ecgoxsfcVqAYWppizbCyYp/
	 VTvljPsItuhT+KslruGdf17RZHnkXZTeI5SNB0HcVA3Q2is1QzaTJ7NIWpw6KBUWf/
	 zV4XavdE98t65jnuE5hyhNvdFmgDjcz0+x8JQ3Pa2M+Ke5oMTbpixoiurollUeJB73
	 blh6OUjzwzOwaiTkJeA6SFn1+VvUJj1MKmXFKzsle/9hQMjVA4gOvU8RBqzqzy+ig5
	 svmuwCrWyPhEepXDnslmThYsgGibYlGdcBhMAypATUJEGwuGF8kbOigthqqwhCFfB8
	 Ic0+xYNIrQ58Q==
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
Subject: [PATCH 11/20] x86: entry: add  do_SYSENTER_32() prototype
Date: Tue, 16 May 2023 21:35:40 +0200
Message-Id: <20230516193549.544673-12-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The 32-bit system call entry points can be called on both 32-bit
and 64-bit kernels, but on the former the declarations are hidden:

arch/x86/entry/common.c:238:24: error: no previous prototype for 'do_SYSENTER_32' [-Werror=missing-prototypes]

Move them all out of the #ifdef block to avoid the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/syscall.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
index 5b85987a5e97..4fb36fba4b5a 100644
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -127,9 +127,11 @@ static inline int syscall_get_arch(struct task_struct *task)
 }
 
 void do_syscall_64(struct pt_regs *regs, int nr);
-void do_int80_syscall_32(struct pt_regs *regs);
-long do_fast_syscall_32(struct pt_regs *regs);
 
 #endif	/* CONFIG_X86_32 */
 
+void do_int80_syscall_32(struct pt_regs *regs);
+long do_fast_syscall_32(struct pt_regs *regs);
+long do_SYSENTER_32(struct pt_regs *regs);
+
 #endif	/* _ASM_X86_SYSCALL_H */
-- 
2.39.2


