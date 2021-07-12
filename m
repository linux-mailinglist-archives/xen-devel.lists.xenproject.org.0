Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38983C64F1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154760.285871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WK-0007pk-1p; Mon, 12 Jul 2021 20:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154760.285871; Mon, 12 Jul 2021 20:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WJ-0007mp-Uk; Mon, 12 Jul 2021 20:27:15 +0000
Received: by outflank-mailman (input) for mailman id 154760;
 Mon, 12 Jul 2021 20:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32WI-0007Vs-78
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:27:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a2cacf4-e34f-11eb-8706-12813bfff9fa;
 Mon, 12 Jul 2021 20:27:13 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121624633615.1024060464936;
 Mon, 12 Jul 2021 13:27:04 -0700 (PDT)
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
X-Inumbo-ID: 8a2cacf4-e34f-11eb-8706-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L/vL9BjiRAQyNL5o6PslUOP9aWfjW041mBBJz1L0MDilxaAByMQhYiv3FvkviZ7+dWuaTDYGGVLkXpgQQc9zrVLLQbYgxiq+nG21QITwXkEs4qAILClM7lKAbdj/snQiLNirmdUdALvvgRkL4O9m6ig/j0erSjM6zesvF2OXKr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121627; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jFGpZRxd7dAEvfpeCIB9cuklmVsrATB/7yKSZCVWMz4=; 
	b=nd8KcewbpDx7kr6z9QgeK48sayquQlREsorgldErpYA0H09TuMObsgTCwvS/xsU8q079MKTRzMuylrt7NEUSFALReXJrd6lpJuSrQbk1lfoSoRn4qdNb915F7agxQYKfGUB+973wZOCULub/B+1Zr7vdtE1+CDhI3q0GyMWauI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121627;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jFGpZRxd7dAEvfpeCIB9cuklmVsrATB/7yKSZCVWMz4=;
	b=iJ9urGDK0LCfdkxTRDUByAD7np8r+mMoajgGLKeA4RExmgFruoK3BpG/FBEv1JpX
	v4VNf3/QKyElkqUy/XXnp77r47L3MvpwhMfMbo0QJ8gx5AVfkNN9d2e7do6zGuehVlk
	SDyOhyATA0/a8heLJjikwT4rHMrrw15awZocL2tY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in common code
Date: Mon, 12 Jul 2021 16:32:24 -0400
Message-Id: <20210712203233.20289-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Andrew Cooper <andrew.cooper3@citrix.com>

The alternative call infrastructure is x86-only for now, but the common iommu
code has a variant and more common code wants to use the infrastructure.

Introduce CONFIG_ALTERNATIVE_CALL and a conditional implemetnation so common
code can use the optimisation when available, without requiring all
architectures to implement no-op stubs.

Write some documentation, which was thus far entirely absent, covering the
requirements for an architecture to implement this optimsiation, and how to
use the infrastructure in general code.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/Kconfig               |  1 +
 xen/common/Kconfig                 |  3 ++
 xen/include/xen/alternative-call.h | 65 ++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 xen/include/xen/alternative-call.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db641..c91cdd83dc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -9,6 +9,7 @@ config X86
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
+	select ALTERNATIVE_CALL
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_EHCI
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..1594ce4e73 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -25,6 +25,9 @@ config GRANT_TABLE
 config HAS_ALTERNATIVE
 	bool
 
+config ALTERNATIVE_CALL
+	bool
+
 config HAS_COMPAT
 	bool
 
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
new file mode 100644
index 0000000000..11d1c26068
--- /dev/null
+++ b/xen/include/xen/alternative-call.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XEN_ALTERNATIVE_CALL
+#define XEN_ALTERNATIVE_CALL
+
+/*
+ * Some subsystems in Xen may have multiple implementions, which can be
+ * resolved to a single implementation at boot time.  By default, this will
+ * result in the use of function pointers.
+ *
+ * Some architectures may have mechanisms for dynamically modifying .text.
+ * Using this mechnaism, function pointers can be converted to direct calls
+ * which are typically more efficient at runtime.
+ *
+ * For architectures to support:
+ *
+ * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
+ *   requirements are to emit a function pointer call at build time, and stash
+ *   enough metadata to simplify the call at boot once the implementation has
+ *   been resolved.
+ * - Select ALTERNATIVE_CALL in Kconfig.
+ *
+ * To use:
+ *
+ * Consider the following simplified example.
+ *
+ *  1) struct foo_ops __alt_call_maybe_initdata ops;
+ *
+ *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops = { ... };
+ *     struct foo_ops __alt_call_maybe_initconst foo_b_ops = { ... };
+ *
+ *     void foo_init(void)
+ *     {
+ *         ...
+ *         if ( use_impl_a )
+ *             ops = *foo_a_ops;
+ *         else if ( use_impl_b )
+ *             ops = *foo_b_ops;
+ *         ...
+ *     }
+ *
+ *  3) alternative_call(ops.bar, ...);
+ *
+ * There needs to a single ops object (1) which will eventually contain the
+ * function pointers.  This should be populated in foo's init() function (2)
+ * by one of the available implementations.  To call functions, use
+ * alternative_{,v}call() referencing the main ops object (3).
+ */
+
+#ifdef CONFIG_ALTERNATIVE_CALL
+
+#include <asm/alternative.h>
+
+#define __alt_call_maybe_initdata  __initdata
+#define __alt_call_maybe_initconst __initconst
+
+#else
+
+#define alternative_call(func, args...)  (func)(args)
+#define alternative_vcall(func, args...) (func)(args)
+
+#define __alt_call_maybe_initdata
+#define __alt_call_maybe_initconst
+
+#endif /* !CONFIG_ALTERNATIVE_CALL */
+#endif /* XEN_ALTERNATIVE_CALL */
-- 
2.20.1


