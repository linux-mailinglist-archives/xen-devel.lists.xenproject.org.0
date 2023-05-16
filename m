Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545B70574D
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535585.833482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Tk-0005PU-Au; Tue, 16 May 2023 19:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535585.833482; Tue, 16 May 2023 19:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0Tk-0005LZ-50; Tue, 16 May 2023 19:37:00 +0000
Received: by outflank-mailman (input) for mailman id 535585;
 Tue, 16 May 2023 19:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Tj-0001kC-BU
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f4fb5e-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:36:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E42CB63E92;
 Tue, 16 May 2023 19:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1AFC4339C;
 Tue, 16 May 2023 19:36:50 +0000 (UTC)
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
X-Inumbo-ID: 04f4fb5e-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265816;
	bh=QhfcjWc94ABit5CqNae5vJwGdRyTTfKtDRBYc+KBnK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MvDSmMsr+ldstYZFWxt0d/Qx2DvIFE1q3iE1Bqb+M+VmlMkwcfXpUcl5LvraEDI6S
	 HnWIuY+SqiBpKZk8dhmFw5ETZeXvKwhiOJcQGWdhuNVfBEaKkHmXH0FVPCeGls5BT5
	 vQMZLkokAMdjoie4w/QtXptZ4gsEiXXyWgx+GJHuazf/GDKjvdN6Gt3EWJ4oMBeTkr
	 FvGz1X+Q4Zbr9Q6Y3k/+TvHBSHypXy399/8SZG8zFY/uPkbqkgKPF1SzwLyfarV+rm
	 t6q653S9gdfUGKRgliLv3S1pFZQjCqHtNzTcpq1utdvmK5duCxYK7yPT5e0S7iC690
	 mE1gVTCKwKBiQ==
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
Subject: [PATCH 08/20] x86: highmem: include asm/numa.h for set_highmem_pages_init
Date: Tue, 16 May 2023 21:35:37 +0200
Message-Id: <20230516193549.544673-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The set_highmem_pages_init() function is declared in asm/numa.h, which
must be included in the file that defines it to avoid a W=1 warning:

arch/x86/mm/highmem_32.c:7:13: error: no previous prototype for 'set_highmem_pages_init' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/mm/highmem_32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 2c54b76d8f84..d9efa35711ee 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -3,6 +3,7 @@
 #include <linux/export.h>
 #include <linux/swap.h> /* for totalram_pages */
 #include <linux/memblock.h>
+#include <asm/numa.h>
 
 void __init set_highmem_pages_init(void)
 {
-- 
2.39.2


