Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82D4FB459
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 09:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302693.516409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndo4w-0006NQ-Ee; Mon, 11 Apr 2022 07:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302693.516409; Mon, 11 Apr 2022 07:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndo4w-0006Jx-AK; Mon, 11 Apr 2022 07:03:14 +0000
Received: by outflank-mailman (input) for mailman id 302693;
 Mon, 11 Apr 2022 07:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hqm=UV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ndo4u-00063x-Ud
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 07:03:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 73509227-b965-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 09:03:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 897391FB;
 Mon, 11 Apr 2022 00:03:11 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.8.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB4BC3F73B;
 Mon, 11 Apr 2022 00:03:08 -0700 (PDT)
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
X-Inumbo-ID: 73509227-b965-11ec-8fbc-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/2] xen: Introduce a header to store common linker scripts content
Date: Mon, 11 Apr 2022 09:02:59 +0200
Message-Id: <20220411070300.77380-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411070300.77380-1-michal.orzel@arm.com>
References: <20220411070300.77380-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both x86 and arm linker scripts share quite a lot of common content.
It is difficult to keep syncing them up, thus introduce a new header
in include/xen called xen.lds.h to store the internals mutual to all
the linker scripts.

Include this header in linker scripts for x86 and arm.
This patch serves as an intermediate step before populating xen.lds.h
and making use of its content in the linker scripts later on.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
-rebased
Changes since v2,v3:
-none
Changes since v1:
-rename header to xen.lds.h to be coherent with Linux kernel
-include empty header in linker scripts
---
 xen/arch/arm/xen.lds.S    | 1 +
 xen/arch/x86/xen.lds.S    | 1 +
 xen/include/xen/xen.lds.h | 8 ++++++++
 3 files changed, 10 insertions(+)
 create mode 100644 xen/include/xen/xen.lds.h

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index ad7f966f0e..d20e5e94e4 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -4,6 +4,7 @@
 
 #include <xen/cache.h>
 #include <xen/lib.h>
+#include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 6926e88e54..1fcd8ab7c5 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -3,6 +3,7 @@
 
 #include <xen/cache.h>
 #include <xen/lib.h>
+#include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
new file mode 100644
index 0000000000..dd292fa7dc
--- /dev/null
+++ b/xen/include/xen/xen.lds.h
@@ -0,0 +1,8 @@
+#ifndef __XEN_LDS_H__
+#define __XEN_LDS_H__
+
+/*
+ * Common macros to be used in architecture specific linker scripts.
+ */
+
+#endif /* __XEN_LDS_H__ */
-- 
2.25.1


