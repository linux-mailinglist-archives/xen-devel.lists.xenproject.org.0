Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65889705745
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535570.833451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TS-0003nZ-AJ; Tue, 16 May 2023 19:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535570.833451; Tue, 16 May 2023 19:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TS-0003lc-6g; Tue, 16 May 2023 19:36:42 +0000
Received: by outflank-mailman (input) for mailman id 535570;
 Tue, 16 May 2023 19:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0TQ-00020V-W8
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9db99f2-f420-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:36:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DC6463E9F;
 Tue, 16 May 2023 19:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CFFC433A1;
 Tue, 16 May 2023 19:36:32 +0000 (UTC)
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
X-Inumbo-ID: f9db99f2-f420-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265798;
	bh=9077UjXDS1JwWtjrb4zvyxiWevrXkl5r2sPVXNElvI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nU4bcoQ15stgmO0CsrS+eCvsm+gCXhBNBFSdZUZJDZs6Fl6sPo6aQAEbL7HvpgQPw
	 34YU/6UqjzMRVqANQ++OmNHESa6zNkcaFm2LUOgnGFvueZRpIj33bI3tKq9iIVMOE8
	 GqW/XJRm7a1E2WWrjpdlejWdGAQtbuecvIZU5NAHZBM5oQh2e9un6it3oTQsqi/lTG
	 5kxTBEILwkSTC+lRDq4IqynAvKjTaueAozerHdsQ+TGjB+//lEcb2OOHgN+9Q9axD4
	 hkpT/62nrOrSL8vWP+nEXayygL8S/uqGna9VmOHK6w0B/JcOokBXElfO8XCeFSQKdo
	 bT2kB6PN6dMAg==
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
Subject: [PATCH 05/20] x86: head: add dummy prototype for mk_early_pgtbl_32
Date: Tue, 16 May 2023 21:35:34 +0200
Message-Id: <20230516193549.544673-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

'make W=1' warns about a function without a prototype in the x86-32 head code:

arch/x86/kernel/head32.c:72:13: error: no previous prototype for 'mk_early_pgtbl_32' [-Werror=missing-prototypes]

This is called from assembler code, so it does not actually need a prototype.
I could not find an appropriate header for it, so just declare it in front
of the definition to shut up th warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/head32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/head32.c b/arch/x86/kernel/head32.c
index 10c27b4261eb..246a609f889b 100644
--- a/arch/x86/kernel/head32.c
+++ b/arch/x86/kernel/head32.c
@@ -69,6 +69,7 @@ asmlinkage __visible void __init __noreturn i386_start_kernel(void)
  * to the first kernel PMD. Note the upper half of each PMD or PTE are
  * always zero at this stage.
  */
+void __init mk_early_pgtbl_32(void);
 void __init mk_early_pgtbl_32(void)
 {
 #ifdef __pa
-- 
2.39.2


