Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927759DA9C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391868.629878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQR5C-0008Va-8P; Tue, 23 Aug 2022 10:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391868.629878; Tue, 23 Aug 2022 10:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQR5C-0008TQ-4s; Tue, 23 Aug 2022 10:24:30 +0000
Received: by outflank-mailman (input) for mailman id 391868;
 Tue, 23 Aug 2022 10:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oQR59-0008Eq-QX
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:24:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c39987e8-22cd-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 12:24:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DF12113E;
 Tue, 23 Aug 2022 03:24:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97633F70D;
 Tue, 23 Aug 2022 03:24:24 -0700 (PDT)
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
X-Inumbo-ID: c39987e8-22cd-11ed-bd2e-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH] libacpi: Fix cross building x86 on arm
Date: Tue, 23 Aug 2022 11:24:15 +0100
Message-Id: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Xen is compiled for x86 on an arm machine, libacpi build is failing
due to a wrong include path:
- arch-x86/xen.h includes xen.h
- xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
but arm ones are).

To workaround this for now, enforce defining __x86_64__ in mk_dsdt.c
when compiled for x86 to follow the right include path.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
The x86 header is including ../xen.h before the ifndef/define so that it
gets included back by xen.h. This is wrongly making the assumption that
we are using an x86 compiler which is not the case when building the
tools for x86 on an arm host.
This patch is not a good solution but the headers are doing some weird
stuff which are going back to 2008 in the git history and the commit
message do not include any valid reason.
---
---
 tools/libacpi/mk_dsdt.c           | 10 ++++++++++
 xen/include/public/arch-x86/xen.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index c5ba4c0b2fd3..ba5468f43c13 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -18,6 +18,16 @@
 #include <stdlib.h>
 #include <stdbool.h>
 #if defined(CONFIG_X86)
+/*
+ * When building on non x86 host, arch-x86/xen.h will include xen.h which will
+ * try to include the arch xen.h (for example if built on arm, x86/xen.h will
+ * include xen.h which will include arch-arm.h).
+ * To prevent this effect, define x86 to have the proper sub arch included when
+ * the compiler does not define it.
+ */
+#if !(defined(__i386__) || defined(__x86_64__))
+#define __x86_64__
+#endif
 #include <xen/arch-x86/xen.h>
 #include <xen/hvm/hvm_info_table.h>
 #elif defined(CONFIG_ARM_64)
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 58a1e87ee971..ea33a56eb6a0 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -24,6 +24,7 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
+/* TODO: when cross building, this will include the wrong arch header */
 #include "../xen.h"
 
 #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
-- 
2.25.1


