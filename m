Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6254F2962
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 11:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298651.508836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfIe-0003gU-PY; Tue, 05 Apr 2022 09:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298651.508836; Tue, 05 Apr 2022 09:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfIe-0003dy-MT; Tue, 05 Apr 2022 09:16:32 +0000
Received: by outflank-mailman (input) for mailman id 298651;
 Tue, 05 Apr 2022 09:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qA5z=UP=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nbfId-0003OJ-Pv
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 09:16:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1455d9f3-b4c1-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 11:16:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BDBD6E;
 Tue,  5 Apr 2022 02:16:30 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.6.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BCC13F73B;
 Tue,  5 Apr 2022 02:16:28 -0700 (PDT)
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
X-Inumbo-ID: 1455d9f3-b4c1-11ec-a405-831a346695d4
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
Subject: [PATCH v4 1/2] xen: Introduce a header to store common linker scripts content
Date: Tue,  5 Apr 2022 11:16:15 +0200
Message-Id: <20220405091616.200270-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405091616.200270-1-michal.orzel@arm.com>
References: <20220405091616.200270-1-michal.orzel@arm.com>
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
index 7921d8fa28..c666fc3e69 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -3,6 +3,7 @@
 /* Modified for ARM Xen by Ian Campbell */
 
 #include <xen/cache.h>
+#include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 3f9f633f55..3e65c09bb3 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -2,6 +2,7 @@
 /* Modified for i386/x86-64 Xen by Keir Fraser */
 
 #include <xen/cache.h>
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


