Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74178B32C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591520.923966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFq-0003xF-C9; Mon, 28 Aug 2023 14:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591520.923966; Mon, 28 Aug 2023 14:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFq-0003qL-89; Mon, 28 Aug 2023 14:30:10 +0000
Received: by outflank-mailman (input) for mailman id 591520;
 Mon, 28 Aug 2023 13:20:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAS-00031h-1E
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ab7628-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:31 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D3C664EE0C87;
 Mon, 28 Aug 2023 15:20:30 +0200 (CEST)
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
X-Inumbo-ID: a9ab7628-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 07/13] x86/asm: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:04 +0200
Message-Id: <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add or move inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere).

The text of the beggining comment of cpufeatures.h has been changed
to match the deviation in automation/eclair_analysis/ECLAIR/deviations.ecl,
moreover this new formulation is already used in other files.

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/include/asm/compat.h      | 5 +++++
 xen/arch/x86/include/asm/cpufeatures.h | 4 +---
 xen/arch/x86/include/asm/efibind.h     | 5 +++++
 xen/arch/x86/include/asm/hypercall.h   | 6 +++---
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 818cad87db..3d3891d061 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -2,6 +2,9 @@
  * compat.h
  */
 
+#ifndef __ASM_X86_COMPAT_H__
+#define __ASM_X86_COMPAT_H__
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_BITS_PER_LONG 32
@@ -18,3 +21,5 @@ int switch_compat(struct domain *);
 #include <xen/errno.h>
 static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
 #endif
+
+#endif /* __ASM_X86_COMPAT_H__ */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index da0593de85..1dfdd478ab 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -1,6 +1,4 @@
-/*
- * Explicitly intended for multiple inclusion.
- */
+/* This file is legitimately included multiple times */
 
 #include <xen/lib/x86/cpuid-autogen.h>
 
diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
index bce02f3707..f2eb8b5496 100644
--- a/xen/arch/x86/include/asm/efibind.h
+++ b/xen/arch/x86/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef __ASM_X86_EFIBIND_H__
+#define __ASM_X86_EFIBIND_H__
+
 #include <xen/types.h>
 #include <asm/x86_64/efibind.h>
+
+#endif /* __ASM_X86_EFIBIND_H__ */
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index ec2edc771e..2ade5d71b8 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -2,13 +2,13 @@
  * asm-x86/hypercall.h
  */
 
+#ifndef __ASM_X86_HYPERCALL_H__
+#define __ASM_X86_HYPERCALL_H__
+
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_X86_HYPERCALL_H__
-#define __ASM_X86_HYPERCALL_H__
-
 #include <xen/types.h>
 #include <public/physdev.h>
 #include <public/event_channel.h>
-- 
2.34.1


