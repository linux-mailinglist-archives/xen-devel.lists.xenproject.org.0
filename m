Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BC3C5C5A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 14:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154543.285550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2vBV-0002RI-T4; Mon, 12 Jul 2021 12:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154543.285550; Mon, 12 Jul 2021 12:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2vBV-0002Oo-Q6; Mon, 12 Jul 2021 12:37:17 +0000
Received: by outflank-mailman (input) for mailman id 154543;
 Mon, 12 Jul 2021 12:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m2vBT-0002Oi-VY
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 12:37:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e25a4aae-e30d-11eb-86e8-12813bfff9fa;
 Mon, 12 Jul 2021 12:37:14 +0000 (UTC)
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
X-Inumbo-ID: e25a4aae-e30d-11eb-86e8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626093434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6yCF3T5XWJfLXzW7043PzCL0bWNDFETlXEvaGiXeQI=;
  b=Mx5NngajeUQ+tRhOgCFheSD9bDaaS3a41tbwd8/xlJuNZvi2iQqquAob
   GWHvU/L+DFUNtbSkcorGnEUCKOS0+ndad5V86FE3Nkxg1HWqZzcPgTZVX
   5LQjFXcqa1CDw3zx71Q5xtSuVdx1pTwMluqNab/ATzb3S6NY/LBzbkucK
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S42uZYb4tjTVEfpJY2qXTLYJT73DZlIDRDo4uXjbiWZkMho3BfINUeu30cveTzvcjbAYu3bauw
 NOKJ9BQQldwWP6ndnvmRmqwd79cUxBC//xbjw5KCzZQSBHJ/BhNuNfCMqjNYqY2pr+bGVJPf2Q
 PVdaOOHdPHzMgR8IbPhdjnbaJwsaG5d4N5TX56/yBKJQylLPesiwul3nL2zLhzk4xAi3UQcs2S
 zmVklq3UAKrH7eV38zdqbPRmcUp/6yUewc0JR8XYCizLhnKzrZDQr6IGEs/zBeJuaDUti+y0fi
 Y34=
X-SBRS: 5.1
X-MesageID: 48438713
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OVPStaBn4mBiKN7lHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.84,232,1620705600"; 
   d="scan'208";a="48438713"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0.5/6] xen: Implement xen/alternative-call.h for use in common code
Date: Mon, 12 Jul 2021 13:36:31 +0100
Message-ID: <20210712123631.3022-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210617233918.10095-2-dpsmith@apertussolutions.com>
References: <20210617233918.10095-2-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

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
 xen/include/xen/alternative-call.h | 65 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 xen/include/xen/alternative-call.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db64187..c91cdd83dc8a 100644
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
index 0ddd18e11af3..1594ce4e7313 100644
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
index 000000000000..11d1c2606818
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
2.11.0


