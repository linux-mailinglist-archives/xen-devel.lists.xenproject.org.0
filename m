Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76397057D7
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535638.833580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eP-0003l4-Sv; Tue, 16 May 2023 19:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535638.833580; Tue, 16 May 2023 19:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eP-0003ga-OC; Tue, 16 May 2023 19:48:01 +0000
Received: by outflank-mailman (input) for mailman id 535638;
 Tue, 16 May 2023 19:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0UP-0001kC-Hb
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e7f1bec-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:37:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEFFF63E87;
 Tue, 16 May 2023 19:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6AFC433EF;
 Tue, 16 May 2023 19:37:33 +0000 (UTC)
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
X-Inumbo-ID: 1e7f1bec-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265859;
	bh=wLf8lxCTTft8AHgx+lACsU6Y90fX557lCughigKxTwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzNvSRgB1AKUSR+3LeaTPh3l60rOTsZilQhWDzOcQ+x5oMBRGFpj+Je09FDcA2oKs
	 bQKEk9CQaOZxW+LjeDZNGHoi1VyqvarfbYPZrFtOwIBWfmcUKXnPsDxk3K2zk5rI3y
	 gwROMzkPtIsOFqQj7b/viChMDejdNvfGdFXbZ5vHvg75Pj4BpgPv1EfIB110tOzdqm
	 cbrsbReFRHuvu0B87vAMax0fJ9PYXNdrYINAB0Gk032nABAs1PIVnq46ho2ehxCbAo
	 4W56TKdQY4nVBka2U6Mo+efkQ7TvUoLDyo62gyH/6bIRgyrLCuMeysKv+AAj4wS8d9
	 cMd2D7IKCRhyg==
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
Subject: [PATCH 15/20] x86: mce: add copy_mc_fragile_handle_tail prototype
Date: Tue, 16 May 2023 21:35:44 +0200
Message-Id: <20230516193549.544673-16-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

copy_mc_fragile_handle_tail() is only called from assembler,
but 'make W=1' complains about a missing prototype:

arch/x86/lib/copy_mc.c:26:1: warning: no previous prototype for ‘copy_mc_fragile_handle_tail’ [-Wmissing-prototypes]
   26 | copy_mc_fragile_handle_tail(char *to, char *from, unsigned len)

Add the prototype to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/mce.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h
index 9646ed6e8c0b..180b1cbfcc4e 100644
--- a/arch/x86/include/asm/mce.h
+++ b/arch/x86/include/asm/mce.h
@@ -350,4 +350,7 @@ static inline void mce_amd_feature_init(struct cpuinfo_x86 *c)		{ }
 #endif
 
 static inline void mce_hygon_feature_init(struct cpuinfo_x86 *c)	{ return mce_amd_feature_init(c); }
+
+unsigned long copy_mc_fragile_handle_tail(char *to, char *from, unsigned len);
+
 #endif /* _ASM_X86_MCE_H */
-- 
2.39.2


