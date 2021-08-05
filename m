Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4C3E166B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164246.300508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe22-0001bM-B9; Thu, 05 Aug 2021 14:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164246.300508; Thu, 05 Aug 2021 14:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe22-0001ZV-7A; Thu, 05 Aug 2021 14:07:34 +0000
Received: by outflank-mailman (input) for mailman id 164246;
 Thu, 05 Aug 2021 14:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBe20-0001Yx-Rq
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:07:32 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dec50b14-c45e-4bcd-acbf-8eb5e34fe270;
 Thu, 05 Aug 2021 14:07:31 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628172443284500.89520364699354;
 Thu, 5 Aug 2021 07:07:23 -0700 (PDT)
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
X-Inumbo-ID: dec50b14-c45e-4bcd-acbf-8eb5e34fe270
ARC-Seal: i=1; a=rsa-sha256; t=1628172446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DGH50UT2gM9fPgR/WQd1uWw50iQnqZ8P96lNgjAMyhfkLtqJ7L7b6Rx1TQlhzgsteOUNHA2jG2ZR3YlVrX53W/R05YkV/jI2lsNy4HlIi4iodMytzvUmt7g4KUX2+un8LK5cAwQtMgEX2PD9yQ1Cpo/Cf33diNUywsS/6blh/1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628172446; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pE9Z45Jk5+X07ZGFhuHKmX3SCjV8QdnUfGDxFvvXjqU=; 
	b=MBz/+ql5HkK1HJGj7CdQnBRB4Kmu7eKqWXJt8vIZzS+Ez8VWesI9kz9P8n8xLe1DO/DovOWk9Dw1NEC6mH2GeeH0e+ppxtSu5Lnv85cUS8guo3zfhNXjIx2FE1rnyKa8Rj/hk0UVfxmuyCjGd2z0Ytntr5EMgFFv8sY1ZbcymE4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628172446;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pE9Z45Jk5+X07ZGFhuHKmX3SCjV8QdnUfGDxFvvXjqU=;
	b=Qa6UhUeTfz7MkJpWXM04BQh8qNhZ9izLg0fOdQqq+nqp/dlPTScfx8OJjIhj+6qx
	+B8IqErqhFwZG63wsEkX7Twoj4caEcYx1Fn1m86ODzxVP5CyHnqzfAY/ePKZhhlExSl
	3yBNR8EBZkLa/V5akaRJ9IT3/2oIxac+41+pssk8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 1/7] xen: Implement xen/alternative-call.h for use in common code
Date: Thu,  5 Aug 2021 10:06:38 -0400
Message-Id: <20210805140644.357-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805140644.357-1-dpsmith@apertussolutions.com>
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v3:
 * Drop __alt_call_maybe_initconst

This is a pre-requisite to "xsm: refactor xsm_ops handling" to avoid breaking
the ARM build.

Build test for the XSM code:

  diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
  index 5eab21e1b168..592074e8f41c 100644
  --- a/xen/xsm/xsm_core.c
  +++ b/xen/xsm/xsm_core.c
  @@ -195,6 +195,16 @@ bool __init has_xsm_magic(paddr_t start)
   }
    #endif

  +#include <xen/alternative-call.h>
  +struct foo {
  +    int (*bar)(void *);
  +} foo __alt_call_maybe_initdata;
  +
  +int test_alternative_call(void)
  +{
  +    return alternative_call(foo.bar, NULL);
  +}
  +
   int __init register_xsm(struct xsm_operations *ops)
    {
         if ( verify(ops) )
---
 xen/arch/x86/Kconfig               |  1 +
 xen/common/Kconfig                 |  3 ++
 xen/include/xen/alternative-call.h | 63 ++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 xen/include/xen/alternative-call.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db641..1f83518ee0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..ac5491b1cc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,6 +22,9 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config ALTERNATIVE_CALL
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
new file mode 100644
index 0000000000..95ebd66728
--- /dev/null
+++ b/xen/include/xen/alternative-call.h
@@ -0,0 +1,63 @@
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
+ *  2) const struct foo_ops __initconst foo_a_ops = { ... };
+ *     const struct foo_ops __initconst foo_b_ops = { ... };
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
+#define __alt_call_maybe_initdata __initdata
+
+#else
+
+#define alternative_call(func, args...)  (func)(args)
+#define alternative_vcall(func, args...) (func)(args)
+
+#define __alt_call_maybe_initdata
+
+#endif /* !CONFIG_ALTERNATIVE_CALL */
+#endif /* XEN_ALTERNATIVE_CALL */
-- 
2.20.1


