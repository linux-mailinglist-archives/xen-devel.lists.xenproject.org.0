Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2B7057DB
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535650.833600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eg-0004sh-BV; Tue, 16 May 2023 19:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535650.833600; Tue, 16 May 2023 19:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eg-0004qr-8K; Tue, 16 May 2023 19:48:18 +0000
Received: by outflank-mailman (input) for mailman id 535650;
 Tue, 16 May 2023 19:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0UW-0001kC-4H
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 227d6cb6-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:37:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85B5863EA1;
 Tue, 16 May 2023 19:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BB4C433D2;
 Tue, 16 May 2023 19:37:39 +0000 (UTC)
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
X-Inumbo-ID: 227d6cb6-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265865;
	bh=ePOLp5lrYksDFnI5SruvVtfGvFIosnERaoYqbpISZdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QzHHLwTINJvvcADDWDAFD53gb0rzvbfM+9frChQz9nOeJdPvDbN96AuXaWQc9Zvxr
	 aIMvdYvF3T+QNbI/k5wpwc6MSujK2ulBi7AB+gIW4MAFtORYIB6dloPpaU3136n4im
	 28e0oQ/gFuMmWEVqE32GvMwA8QC1R8ZOSDj5aB75yht+WU7UenY2JSg291k/G5ntiU
	 9aBuw8l68CYZc+TZWL+A0oDAj4k2nTmi3WAfSETq8X/lpMsTNhdlRU1e3qXY/DCjc8
	 kbTXiAG5OAPFlElt+nbApNzKv5CT7DQpkoHI/Mebhyj1HGkKmozLCY+jMgkk1Bebd7
	 De/Gp233G0FBg==
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
Subject: [PATCH 16/20] x86: vdso: include vdso/processor.h
Date: Tue, 16 May 2023 21:35:45 +0200
Message-Id: <20230516193549.544673-17-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

__vdso_getcpu is declared in a header but this is not included
before the definition, causing a W=1 warning:

arch/x86/entry/vdso/vgetcpu.c:13:1: error: no previous prototype for '__vdso_getcpu' [-Werror=missing-prototypes]
arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1: error: no previous prototype for '__vdso_getcpu' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/entry/vdso/vgetcpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/entry/vdso/vgetcpu.c b/arch/x86/entry/vdso/vgetcpu.c
index 0a9007c24056..e4640306b2e3 100644
--- a/arch/x86/entry/vdso/vgetcpu.c
+++ b/arch/x86/entry/vdso/vgetcpu.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/getcpu.h>
 #include <asm/segment.h>
+#include <vdso/processor.h>
 
 notrace long
 __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
-- 
2.39.2


