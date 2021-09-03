Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B04001B8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178121.324008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAmF-00064U-Dl; Fri, 03 Sep 2021 15:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178121.324008; Fri, 03 Sep 2021 15:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAmF-00062a-AG; Fri, 03 Sep 2021 15:06:47 +0000
Received: by outflank-mailman (input) for mailman id 178121;
 Fri, 03 Sep 2021 15:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAmD-000623-QD
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:06:45 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb533620-ee78-4d74-8252-62769fbfdca1;
 Fri, 03 Sep 2021 15:06:44 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681595567909.1171948642584;
 Fri, 3 Sep 2021 08:06:35 -0700 (PDT)
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
X-Inumbo-ID: eb533620-ee78-4d74-8252-62769fbfdca1
ARC-Seal: i=1; a=rsa-sha256; t=1630681598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W/3McJcH+hgLEXU0Oay4LDpRFo+o9UmyNcl2T52y37Pfk55++hvihDEapiW2fcK3E2TP6aO2L6B0ysCgW2ntpHS23FK7yD6D0vvRfG46mTlgklV4vSQhTN+N8kCvv5POu9lECoMuYUAVPb5PVTIKe0QsIiJsLr69AOZV8oMb0/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681598; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=FwXfAdIv2IZUMTi0r+WhHxk4n1x2ncGtKlCWXV3sMlc=; 
	b=c8SfnD45zPwJ6Ashw9ih+Res04Da/g3ui7778oLj/rcvHtarNTDK+guDvCpcWar0Ze+kMg4B1BFOZwogPQjBOD5pae4ueq9r/ynCR71sUC5ESWGWIYQ39ogM82A/wbWoWqpY8TYsBsXXTK1G5me+uMt4eRYIuxoFMTkdu2AAkoU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681598;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FwXfAdIv2IZUMTi0r+WhHxk4n1x2ncGtKlCWXV3sMlc=;
	b=ZJBR/Tr+MzGvXgfIVcXhA7m7rmRYtb8FkKKBuQfAeA0npTHJWgmqWkg5/fe0StER
	7+fzsDItRiLRfyqhsp+LIjygyQ2C1b3WjX/9S5TCz+z/eKRbsNv3xvvfRAvTIS3z4/v
	64FEX45XVGtrIFqN1D2N7HiJGnoBPbOumzYKF2i0=
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
Subject: [PATCH v4 01/11] xen: Implement xen/alternative-call.h for use in common code
Date: Fri,  3 Sep 2021 15:06:19 -0400
Message-Id: <20210903190629.11917-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
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
index 0000000000..d10af90b1b
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
+#define __alt_call_maybe_initdata __read_mostly
+
+#endif /* !CONFIG_ALTERNATIVE_CALL */
+#endif /* XEN_ALTERNATIVE_CALL */
-- 
2.20.1


