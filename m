Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0D7057D6
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535635.833560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eD-00030E-9F; Tue, 16 May 2023 19:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535635.833560; Tue, 16 May 2023 19:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eD-0002yB-6Q; Tue, 16 May 2023 19:47:49 +0000
Received: by outflank-mailman (input) for mailman id 535635;
 Tue, 16 May 2023 19:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Uo-0001kC-2Y
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:38:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d0c97a7-f421-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:38:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF5F63EBA;
 Tue, 16 May 2023 19:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AE9C433A0;
 Tue, 16 May 2023 19:37:57 +0000 (UTC)
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
X-Inumbo-ID: 2d0c97a7-f421-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265883;
	bh=j24rSNRgDIgmGiT2yXwRSRo4ZogPVSrZkif28sPhRnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeITFFPyf4T1O9Bk8T43ZhPjTAAH6Vi8ipARvhqNOYnVJGtz4HnVAYe+g/BzZ7026
	 fDFAQ+Kwic0E1tpyAEjk9jRaCFQp+kn6j5QUapAXkZVr+cEC/j8Xd57pjknKmNJ40L
	 YYnEhKGr6uzcXrPYT/H7qqH1VyhkhaztOT4kZMMxyyb3x1FoZRxS3qYbRHji3EIhxJ
	 GIf04p+6OuzTuprxdmvEFq7KckfwLT/GHmqgM9hv9SmOoyBUuMT0F5NhocTm6xphV4
	 BngR4+JYE7FOd9LAO6LyB06VqLeGQ76wR+h5GIBrwd5zRDNTjAQuZi2Pu27xvTgXI9
	 pzCAFRefSXgnA==
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
Subject: [PATCH 19/20] x86: purgatory: include header for warn() declaration
Date: Tue, 16 May 2023 21:35:48 +0200
Message-Id: <20230516193549.544673-20-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The purgatory code has uses parts of the decompressor and provides
its own warn() function, but has to include the corresponding
header file to avoid a -Wmissing-prototypes warning.

It turns out that this the function prototype actually differs
from the declaration, so change it to get a constant pointer
in the declaration and the other definition as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/boot/compressed/error.c | 2 +-
 arch/x86/boot/compressed/error.h | 2 +-
 arch/x86/purgatory/purgatory.c   | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/boot/compressed/error.c b/arch/x86/boot/compressed/error.c
index c881878e56d3..ce5ed7d8265e 100644
--- a/arch/x86/boot/compressed/error.c
+++ b/arch/x86/boot/compressed/error.c
@@ -7,7 +7,7 @@
 #include "misc.h"
 #include "error.h"
 
-void warn(char *m)
+void warn(const char *m)
 {
 	error_putstr("\n\n");
 	error_putstr(m);
diff --git a/arch/x86/boot/compressed/error.h b/arch/x86/boot/compressed/error.h
index 1de5821184f1..87062dea9a20 100644
--- a/arch/x86/boot/compressed/error.h
+++ b/arch/x86/boot/compressed/error.h
@@ -4,7 +4,7 @@
 
 #include <linux/compiler.h>
 
-void warn(char *m);
+void warn(const char *m);
 void error(char *m) __noreturn;
 
 #endif /* BOOT_COMPRESSED_ERROR_H */
diff --git a/arch/x86/purgatory/purgatory.c b/arch/x86/purgatory/purgatory.c
index 7558139920f8..aea47e793963 100644
--- a/arch/x86/purgatory/purgatory.c
+++ b/arch/x86/purgatory/purgatory.c
@@ -14,6 +14,7 @@
 #include <crypto/sha2.h>
 #include <asm/purgatory.h>
 
+#include "../boot/compressed/error.h"
 #include "../boot/string.h"
 
 u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
-- 
2.39.2


