Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE967057D9
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535643.833591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0ea-0004Nr-4r; Tue, 16 May 2023 19:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535643.833591; Tue, 16 May 2023 19:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0ea-0004LC-1Q; Tue, 16 May 2023 19:48:12 +0000
Received: by outflank-mailman (input) for mailman id 535643;
 Tue, 16 May 2023 19:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Uw-00020V-PD
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:38:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30cbe691-f421-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:38:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 753B66183C;
 Tue, 16 May 2023 19:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28787C433EF;
 Tue, 16 May 2023 19:38:03 +0000 (UTC)
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
X-Inumbo-ID: 30cbe691-f421-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265889;
	bh=xg0nY/5XuAoC5Y+aT1n09akQv/zFSJ5XVH0JIB0YwTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJHg8XNuGiy8jTFn+IFpgUXTvuRIAwq7VY4K/2aG+9oDXR9V6HWZw9BoV/Iby3Y3D
	 ciQJCcSCN88ZGK79OW2jW+p1Mcr53FymRzsq3aD57yhmrL6X5s0JHYpe2CHPA22HlU
	 vtyjpMlDJ94LuFullCZvqENjJQpN0VpNDcwlo9gDKsPudVss3sLnvUVGlKZDHrWJKC
	 9hYO4n8OiF35vwW0mCeLD6vxQ51+sc9aB2SOI5vmH0t/cuFzcMA5Ms2ki0dFUhjZ6z
	 F+j0NZXOgRpsDihxxL0McykAWvZ3icJuNiaB3wLMzOKImpSeGeJaJv64l87FCV2Wpu
	 UeiC9WTSfPICw==
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
Subject: [PATCH 20/20] x86: olpc: avoid missing-prototype warnings
Date: Tue, 16 May 2023 21:35:49 +0200
Message-Id: <20230516193549.544673-21-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There are two functions in the olpc platform that have no prototype:

arch/x86/platform/olpc/olpc_dt.c:237:13: error: no previous prototype for 'olpc_dt_fixup' [-Werror=missing-prototypes]
arch/x86/platform/olpc/olpc-xo1-pm.c:73:26: error: no previous prototype for 'xo1_do_sleep' [-Werror=missing-prototypes]

The first one should just be marked 'static' as there are no other
callers, while the second one is called from assembler and is
just a false-positive warning that can be silenced by adding a
prototype.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/platform/olpc/olpc_dt.c | 2 +-
 include/linux/olpc-ec.h          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index 75e3319e8bee..74ebd6882690 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -234,7 +234,7 @@ static int __init olpc_dt_compatible_match(phandle node, const char *compat)
 	return 0;
 }
 
-void __init olpc_dt_fixup(void)
+static void __init olpc_dt_fixup(void)
 {
 	phandle node;
 	u32 board_rev;
diff --git a/include/linux/olpc-ec.h b/include/linux/olpc-ec.h
index c4602364e909..3c2891d85c41 100644
--- a/include/linux/olpc-ec.h
+++ b/include/linux/olpc-ec.h
@@ -56,6 +56,8 @@ extern int olpc_ec_sci_query(u16 *sci_value);
 
 extern bool olpc_ec_wakeup_available(void);
 
+asmlinkage int xo1_do_sleep(u8 sleep_state);
+
 #else
 
 static inline int olpc_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *outbuf,
-- 
2.39.2


