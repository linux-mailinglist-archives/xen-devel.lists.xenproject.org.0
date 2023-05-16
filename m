Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB807057DC
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535651.833610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0ei-0005Go-Jv; Tue, 16 May 2023 19:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535651.833610; Tue, 16 May 2023 19:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0ei-0005E1-Ga; Tue, 16 May 2023 19:48:20 +0000
Received: by outflank-mailman (input) for mailman id 535651;
 Tue, 16 May 2023 19:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Uh-0001kC-OM
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2963959c-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:37:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C45163EA7;
 Tue, 16 May 2023 19:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E563AC433EF;
 Tue, 16 May 2023 19:37:51 +0000 (UTC)
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
X-Inumbo-ID: 2963959c-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265877;
	bh=BMgSzYPnqUEEoyY2VRZWSxLxvLKRRE/JigFmOP6CVm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpGBW3oQfGokP+EqO9HPXqgBNDkoc36H1oosSB5XjEzBOg7yBtWPUSvXBHiX4Rn4Q
	 nPdmLvbLNil6YudLmIUT16A//m5E1l/d5GoNjyYA+FGYUUcB0t2DXV/Y8FzJPsCm/g
	 WSjrQhVBlok700vqB4usp49fWyRCAVJCMtG/hOkniDZfEqspZMur4GNXocMx9PVPyv
	 JJe6IYAyEollD++tusMr4MFE1ysVhpCHJNBmX4uqv8rrV1pvWM156/dMfMSZOF9/ow
	 oYS4tnWysUdqiVHzAJ2DPP9MsHPpjO23QeTGlMaWQS4Y+XN+rqnjj3iE0utAy7m/f2
	 S+exm0cd8OABA==
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
Subject: [PATCH 18/20] x86: ioremap: add early_memremap_pgprot_adjust prototype
Date: Tue, 16 May 2023 21:35:47 +0200
Message-Id: <20230516193549.544673-19-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

early_memremap_pgprot_adjust() is a __weak function with a local
prototype, but x86 has a custom implementation that does not
see the prototype, causing a W=1 warning:

arch/x86/mm/ioremap.c:785:17: error: no previous prototype for 'early_memremap_pgprot_adjust' [-Werror=missing-prototypes]

Move the declaration into the global linux/io.h header to avoid this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/io.h | 5 +++++
 mm/internal.h      | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 308f4f0cfb93..7304f2a69960 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -68,6 +68,11 @@ void *devm_memremap(struct device *dev, resource_size_t offset,
 		size_t size, unsigned long flags);
 void devm_memunmap(struct device *dev, void *addr);
 
+/* architectures can override this */
+pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
+					unsigned long size, pgprot_t prot);
+
+
 #ifdef CONFIG_PCI
 /*
  * The PCI specifications (Rev 3.0, 3.2.5 "Transaction Ordering and
diff --git a/mm/internal.h b/mm/internal.h
index 68410c6d97ac..e6029d94bdb2 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -178,12 +178,6 @@ extern unsigned long highest_memmap_pfn;
  */
 #define MAX_RECLAIM_RETRIES 16
 
-/*
- * in mm/early_ioremap.c
- */
-pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
-					unsigned long size, pgprot_t prot);
-
 /*
  * in mm/vmscan.c:
  */
-- 
2.39.2


