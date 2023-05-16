Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6047057DA
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535637.833571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eL-0003Lf-Ix; Tue, 16 May 2023 19:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535637.833571; Tue, 16 May 2023 19:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eL-0003JS-Es; Tue, 16 May 2023 19:47:57 +0000
Received: by outflank-mailman (input) for mailman id 535637;
 Tue, 16 May 2023 19:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Uc-00020V-A1
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 258fa881-f421-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:37:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A17B563EC0;
 Tue, 16 May 2023 19:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9F0C4339C;
 Tue, 16 May 2023 19:37:45 +0000 (UTC)
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
X-Inumbo-ID: 258fa881-f421-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265871;
	bh=gSQe4II2iJtS+QQtWHfwrqCvLdxK7Wzo7e0HtFoFV5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j20kxPBBFRIlxqq0mFZaJS7pQ1cCrLadjW3BuMisWulwenHNraGn3QWbXEUvelZB9
	 k8AScRxshCwAwrVHCxXAtcvrlQ6DnbnlQVpLaumX7l4EAkHg/GHsGYTQGiOvmWdeHV
	 nnvqCAqbFDpb6jdopaiVGQxZ8tQP14F6vLmY6rEGNbIsMSxZRZfWCAbLoJmiLJul9v
	 mHgb9qRmHAMRdPNwGH1ZJuxcpbeasYeDWHN2uDuIqWD3/Br6dub6irvZhT2xBqimyR
	 5zR/L6TK+jHMgzzDqKoPOtdy3hz/UK9lh7gf7JJ+DhFN6pkHpaPxXMMg+7/fxjhdum
	 PLw3akFNr0smA==
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
Subject: [PATCH 17/20] x86: usercopy: include arch_wb_cache_pmem declaration
Date: Tue, 16 May 2023 21:35:46 +0200
Message-Id: <20230516193549.544673-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

arch_wb_cache_pmem() is declared in a global header but defined by
the architecture. On x86, the implementation needs to include the header
to avoid this warning:

arch/x86/lib/usercopy_64.c:39:6: error: no previous prototype for 'arch_wb_cache_pmem' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/lib/usercopy_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
index 003d90138e20..e9251b89a9e9 100644
--- a/arch/x86/lib/usercopy_64.c
+++ b/arch/x86/lib/usercopy_64.c
@@ -9,6 +9,7 @@
 #include <linux/export.h>
 #include <linux/uaccess.h>
 #include <linux/highmem.h>
+#include <linux/libnvdimm.h>
 
 /*
  * Zero Userspace
-- 
2.39.2


