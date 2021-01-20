Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE492FD349
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71509.128126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Evm-0001fW-48; Wed, 20 Jan 2021 14:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71509.128126; Wed, 20 Jan 2021 14:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Evm-0001f5-0Z; Wed, 20 Jan 2021 14:57:58 +0000
Received: by outflank-mailman (input) for mailman id 71509;
 Wed, 20 Jan 2021 14:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOez=GX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2Evk-0001et-RX
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:57:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c1e473da-0c96-4920-8a37-7c668fedafda;
 Wed, 20 Jan 2021 14:57:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB71331B;
 Wed, 20 Jan 2021 06:57:55 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D41C3F68F;
 Wed, 20 Jan 2021 06:57:54 -0800 (PST)
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
X-Inumbo-ID: c1e473da-0c96-4920-8a37-7c668fedafda
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 07/10] xen/compiler: import 'fallthrough' keyword from linux
Date: Wed, 20 Jan 2021 14:52:41 +0000
Message-Id: <451cc96ebe70bd7c7ffe34862412adc2f86caaca.1611153615.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>

-Wimplicit-fallthrough warns when a switch case falls through. Warning
can be suppress by either adding a /* fallthrough */ comment, or by
using a null statement: __attribute__ ((fallthrough))

Define the pseudo keyword 'fallthrough' for the ability to convert the
various case block /* fallthrough */ style comments to null statement
"__attribute__((__fallthrough__))"

In C mode, GCC supports the __fallthrough__ attribute since 7.1,
the same time the warning and the comment parsing were introduced.

fallthrough devolves to an empty "do {} while (0)" if the compiler
version (any version less than gcc 7) does not support the attribute.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v3:
 - This patch is introduce in this version.
Changes since v4: No changes
---
---
 xen/include/xen/compiler.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index e643e69128..0ec0b4698e 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -33,6 +33,22 @@
 #define unreachable() __builtin_unreachable()
 #endif
 
+/*
+ * Add the pseudo keyword 'fallthrough' so case statement blocks
+ * must end with any of these keywords:
+ *   break;
+ *   fallthrough;
+ *   goto <label>;
+ *   return [expression];
+ *
+ *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
+ */
+#if (!defined(__clang__) && (__GNUC__ >= 7))
+# define fallthrough        __attribute__((__fallthrough__))
+#else
+# define fallthrough        do {} while (0)  /* fallthrough */
+#endif
+
 #ifdef __clang__
 /* Clang can replace some vars with new automatic ones that go in .data;
  * mark all explicit-segment vars 'used' to prevent that. */
-- 
2.17.1


