Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C297A5A0D0F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393209.632022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Tz-0000G2-4g; Thu, 25 Aug 2022 09:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393209.632022; Thu, 25 Aug 2022 09:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Tz-0000CV-0u; Thu, 25 Aug 2022 09:49:03 +0000
Received: by outflank-mailman (input) for mailman id 393209;
 Thu, 25 Aug 2022 09:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oR9Tw-0000AM-QW
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:49:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 243634cf-245b-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 11:48:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1C2D6E;
 Thu, 25 Aug 2022 02:49:03 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3AE33FAF5;
 Thu, 25 Aug 2022 02:48:57 -0700 (PDT)
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
X-Inumbo-ID: 243634cf-245b-11ed-9250-1f966e50362f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: henry.wang@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Date: Thu, 25 Aug 2022 10:48:43 +0100
Message-Id: <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Xen is compiled for x86 on an arm machine, libacpi build is failing
due to a wrong include path:
- arch-x86/xen.h includes xen.h
- xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
but arm ones are).

To solve this issue move XEN_ACPI_ definitions in a new header
guest-acpi.h that can be included cleanly by mk_dsdt.c.
Inside this header, only protect the definitions using ifdef
__XEN_TOOLS__ as the defines are not used anywhere in the hypervisor and
are not expected to be.

Previous users needing any of the XEN_ACPI_ definitions will now need to
include arch-x86/guest-acpi.h instead of arch-x86/xen.h

Fixes: d6ac8e22c7c5 ("acpi/x86: define ACPI IO registers for PVH guests")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
The x86 header is including ../xen.h before the ifndef/define so that it
gets included back by xen.h. This is wrongly making the assumption that
we are using an x86 compiler which is not the case when building the
tools for x86 on an arm host.
Moving the definitions to an independent header is making things cleaner
but some might need to include a new header but the risk is low.

For the release manager:
- risk: very low, the definitions moved are only used in mk_dsdt and
external users would just have to include the new header.
- advantage: we can now compile xen for x86 on arm build machines
---
Changes in v2:
- fix commit message
- remove ifdef __XEN__ protecting the definitions
- fix name in description and ifdef guards of the file
- fix description
Changes in v1:
- was "libacpi: Fix cross building x86 on arm"
- move XEN_ACPI_ definitions in a new header guest-acpi.h
- adapt mk_dsdt.c
- remove todo in public header
---
 tools/libacpi/mk_dsdt.c                  |  2 +-
 xen/include/public/arch-x86/guest-acpi.h | 50 ++++++++++++++++++++++++
 xen/include/public/arch-x86/xen.h        |  6 ---
 3 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100644 xen/include/public/arch-x86/guest-acpi.h

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index c5ba4c0b2fd3..1176da80ef44 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -18,7 +18,7 @@
 #include <stdlib.h>
 #include <stdbool.h>
 #if defined(CONFIG_X86)
-#include <xen/arch-x86/xen.h>
+#include <xen/arch-x86/guest-acpi.h>
 #include <xen/hvm/hvm_info_table.h>
 #elif defined(CONFIG_ARM_64)
 #include <xen/arch-arm.h>
diff --git a/xen/include/public/arch-x86/guest-acpi.h b/xen/include/public/arch-x86/guest-acpi.h
new file mode 100644
index 000000000000..3d79a31fd865
--- /dev/null
+++ b/xen/include/public/arch-x86/guest-acpi.h
@@ -0,0 +1,50 @@
+/******************************************************************************
+ * arch-x86/guest-acpi.h
+ *
+ * Guest ACPI interface to x86 Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__
+#define __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__
+
+#ifdef __XEN_TOOLS__
+
+/* Location of online VCPU bitmap. */
+#define XEN_ACPI_CPU_MAP             0xaf00
+#define XEN_ACPI_CPU_MAP_LEN         ((HVM_MAX_VCPUS + 7) / 8)
+
+/* GPE0 bit set during CPU hotplug */
+#define XEN_ACPI_GPE0_CPUHP_BIT      2
+
+#endif /* __XEN_TOOLS__ */
+
+#endif /* __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 58a1e87ee971..546dd4496ac6 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -325,12 +325,6 @@ struct xen_arch_domainconfig {
 /* Max  XEN_X86_* constant. Used for ABI checking. */
 #define XEN_X86_MISC_FLAGS_MAX XEN_X86_ASSISTED_X2APIC
 
-/* Location of online VCPU bitmap. */
-#define XEN_ACPI_CPU_MAP             0xaf00
-#define XEN_ACPI_CPU_MAP_LEN         ((HVM_MAX_VCPUS + 7) / 8)
-
-/* GPE0 bit set during CPU hotplug */
-#define XEN_ACPI_GPE0_CPUHP_BIT      2
 #endif
 
 /*
-- 
2.25.1


