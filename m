Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3B7C7171
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615840.957345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcV-0006vf-DT; Thu, 12 Oct 2023 15:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615840.957345; Thu, 12 Oct 2023 15:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcV-0006tr-AV; Thu, 12 Oct 2023 15:29:03 +0000
Received: by outflank-mailman (input) for mailman id 615840;
 Thu, 12 Oct 2023 15:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqxcT-0006QI-Og
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:29:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a4e2d1-6914-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 17:29:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 89A164EE0746;
 Thu, 12 Oct 2023 17:28:59 +0200 (CEST)
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
X-Inumbo-ID: 11a4e2d1-6914-11ee-98d4-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH][for-4.19 v2 2/8] arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
Date: Thu, 12 Oct 2023 17:28:46 +0200
Message-Id: <042f79da9c4480955c5fb82a25e4847c4777fbea.1697123806.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697123806.git.nicola.vetrini@bugseng.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definitions of ffs{l}? violate Rule 10.1, by using the well-known
pattern (x & -x); its usage is wrapped by the LOWEST_BIT macro.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/bitops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 71ae14cab355..8b5d61545e19 100644
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
+#define ffs(x) ({ unsigned int __t = (x); fls(LOWEST_BIT(__t)); })
+#define ffsl(x) ({ unsigned long __t = (x); flsl(LOWEST_BIT(__t)); })
 
 /**
  * find_first_set_bit - find the first set bit in @word
-- 
2.34.1


