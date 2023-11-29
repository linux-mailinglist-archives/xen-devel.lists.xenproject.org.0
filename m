Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CB7FD2CF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 10:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643775.1004256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Gw6-0005F0-Hp; Wed, 29 Nov 2023 09:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643775.1004256; Wed, 29 Nov 2023 09:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Gw6-0005DI-Eu; Wed, 29 Nov 2023 09:32:50 +0000
Received: by outflank-mailman (input) for mailman id 643775;
 Wed, 29 Nov 2023 09:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8Gw5-0005DC-Ge
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 09:32:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4181106c-8e9a-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 10:32:47 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id D3C044EE0737;
 Wed, 29 Nov 2023 10:32:45 +0100 (CET)
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
X-Inumbo-ID: 4181106c-8e9a-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v6] arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
Date: Wed, 29 Nov 2023 10:32:39 +0100
Message-Id: <f9ea805110ccfecade0c9e617b52b033043f0166.1701248609.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definitions of ffs{l}? violate Rule 10.1, by using the well-known
pattern (x & -x); its usage is wrapped by the ISOLATE_LSB macro.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
- Changed macro name.
Changes in v5:
- Changed macro name.
Changes in v6:
- Add missing include
---
 xen/arch/arm/include/asm/bitops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 71ae14cab355..ab030b6cb032 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -9,6 +9,8 @@
 #ifndef _ARM_BITOPS_H
 #define _ARM_BITOPS_H
 
+#include <xen/macros.h>
+
 #include <asm/asm_defns.h>
 
 /*
@@ -155,8 +157,8 @@ static inline int fls(unsigned int x)
 }
 
 
-#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
-#define ffsl(x) ({ unsigned long __t = (x); flsl(__t & -__t); })
+#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
+#define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
 
 /**
  * find_first_set_bit - find the first set bit in @word
-- 
2.34.1


