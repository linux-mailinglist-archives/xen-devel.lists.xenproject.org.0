Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0407D99FA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624380.972912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000eE-CG; Fri, 27 Oct 2023 13:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624380.972912; Fri, 27 Oct 2023 13:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000bW-5l; Fri, 27 Oct 2023 13:34:23 +0000
Received: by outflank-mailman (input) for mailman id 624380;
 Fri, 27 Oct 2023 13:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMyk-0000bB-C1
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b6eba4-74cd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:34:20 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CA8504EE0C81;
 Fri, 27 Oct 2023 15:34:19 +0200 (CEST)
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
X-Inumbo-ID: 88b6eba4-74cd-11ee-98d6-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v4 2/8] arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
Date: Fri, 27 Oct 2023 15:34:09 +0200
Message-Id: <a7138472e788dafe3a8c3787030a1715dd230ec9.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698410970.git.nicola.vetrini@bugseng.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definitions of ffs{l}? violate Rule 10.1, by using the well-known
pattern (x & -x); its usage is wrapped by the ISOLATE_LOW_BIT macro.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Changes in v4:
- Changed macro name.
---
 xen/arch/arm/include/asm/bitops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 71ae14cab355..e674634d03bf 100644
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
+#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LOW_BIT(__t)); })
+#define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LOW_BIT(__t)); })
 
 /**
  * find_first_set_bit - find the first set bit in @word
-- 
2.34.1


