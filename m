Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7D651C9C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466598.725562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLL-0003P9-Iw; Tue, 20 Dec 2022 08:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466598.725562; Tue, 20 Dec 2022 08:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLL-0003NR-Bu; Tue, 20 Dec 2022 08:51:23 +0000
Received: by outflank-mailman (input) for mailman id 466598;
 Tue, 20 Dec 2022 08:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLI-0001kP-UJ
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 78fea8da-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE642F4;
 Tue, 20 Dec 2022 00:52:00 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51A63F71A;
 Tue, 20 Dec 2022 00:51:18 -0800 (PST)
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
X-Inumbo-ID: 78fea8da-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 06/18] public: cppcheck: misra rule 20.7 on public/arch-arm.h
Date: Tue, 20 Dec 2022 08:50:48 +0000
Message-Id: <20221220085100.22848-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros
___DEFINE_XEN_GUEST_HANDLE, set_xen_guest_handle_raw and __DECL_REG.
For the first and third finding, the macro parameters are never
used in an expression, cppcheck is not taking into account the
context where the arguments are used, so we can suppress the findings.
For the set_xen_guest_handle_raw, the argument is not involved in any
expression but it doesn't harm the code or readability to have
parenthesis on it, so fix it.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/arch-arm.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced5097a..7afc0d1ca23d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -156,6 +156,7 @@
 #define uint64_aligned_t uint64_t __attribute__((aligned(8)))
 
 #ifndef __ASSEMBLY__
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
     typedef union { type *p; unsigned long q; }                 \
         __guest_handle_ ## name;                                \
@@ -180,7 +181,7 @@
     do {                                                    \
         __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \
         _sxghr_tmp->q = 0;                                  \
-        _sxghr_tmp->p = val;                                \
+        _sxghr_tmp->p = (val);                              \
     } while ( 0 )
 #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
 
@@ -206,6 +207,7 @@ typedef uint64_t xen_ulong_t;
     }
 #else
 /* Non-gcc sources must always use the proper 64-bit name (e.g., x0). */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG(n64, n32) uint64_t n64
 #endif
 
-- 
2.17.1


