Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D6705743
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535569.833441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TM-0003O3-45; Tue, 16 May 2023 19:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535569.833441; Tue, 16 May 2023 19:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TM-0003Kd-06; Tue, 16 May 2023 19:36:36 +0000
Received: by outflank-mailman (input) for mailman id 535569;
 Tue, 16 May 2023 19:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0TK-0001kC-IQ
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f671ba2c-f420-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:36:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E97263E84;
 Tue, 16 May 2023 19:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA1EC4339B;
 Tue, 16 May 2023 19:36:26 +0000 (UTC)
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
X-Inumbo-ID: f671ba2c-f420-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265792;
	bh=NCehg1lkd+BZGGfLe6zB+YpAMyX3wRQS6FlZqTExKsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pMmYMmj61h1ryVXMWXgEPNi4c4GgRS8wGlxnCd9UxrJ05iwjecyfTOduY+WoqWZpO
	 Cvm/AJCD+MXi+4Shut/6HQufiGCdANXUBd424+CiNufUW6Mt2CPMf2SX0Erut/1Yjz
	 CZmpdbkHOQ1xlqE6pSRjeDiYME9avcj4NHsxu1xrpZ1j/RY+4x7QvymeScI7FPaZ6A
	 7vr/gZpCa3X1Nt6lxKZnO93JGkaChZ3M73Qb3fsEPkq2r9hKpfzvuhPaebh6V7v7p/
	 EnZrHT3z5U/r3Es9dGNnRROzYJFVNwRgJqycAOQQGvYgjBv9ea9EtDpGHUpfp80+kM
	 +ZmQV+6dglcAw==
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
Subject: [PATCH 04/20] x86: avoid unneeded __div64_32 function definition
Date: Tue, 16 May 2023 21:35:33 +0200
Message-Id: <20230516193549.544673-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The __div64_32() function is provided for 32-bit architectures that
don't have a custom do_div() implementation. x86_32 has one, and
does not use the header file that declares the function prototype,
so the definition causes a W=1 warning:

lib/math/div64.c:31:32: error: no previous prototype for '__div64_32' [-Werror=missing-prototypes]

Define an empty macro to prevent the function definition from getting
built, which avoids the warning and saves a little .text space.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/div64.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index b8f1dc0761e4..9826d5fc12e3 100644
--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -71,6 +71,8 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
 }
 #define mul_u32_u32 mul_u32_u32
 
+#define __div64_32 /* not needed */
+
 #else
 # include <asm-generic/div64.h>
 
-- 
2.39.2


