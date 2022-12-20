Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E85651CA2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466610.725635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLX-0005pI-Sh; Tue, 20 Dec 2022 08:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466610.725635; Tue, 20 Dec 2022 08:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLW-0005bU-M8; Tue, 20 Dec 2022 08:51:34 +0000
Received: by outflank-mailman (input) for mailman id 466610;
 Tue, 20 Dec 2022 08:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLS-0001kP-PS
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7ee2d949-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BD0E13D5;
 Tue, 20 Dec 2022 00:52:10 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9701D3F71A;
 Tue, 20 Dec 2022 00:51:28 -0800 (PST)
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
X-Inumbo-ID: 7ee2d949-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 14/18] public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_32.h
Date: Tue, 20 Dec 2022 08:50:56 +0000
Message-Id: <20221220085100.22848-15-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros
___DEFINE_XEN_GUEST_HANDLE, set_xen_guest_handle_raw, __DECL_REG_LO8
and __DECL_REG_LO16.
For set_xen_guest_handle_raw, while the "val" argument is never used
in an expression, it doesn't harm the code or the readability to add
parenthesis, so add them to the argument.
For the other findings, the macro parameters are never used as an
expression, cppcheck is not taking into account the context for their
use, so we can suppress the finding.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/arch-x86/xen-x86_32.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 139438e83534..6755f12044e4 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -74,6 +74,7 @@
 /* 32-/64-bit invariability for control interfaces (domctl/sysctl). */
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 #undef ___DEFINE_XEN_GUEST_HANDLE
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
     typedef struct { type *p; }                                 \
         __guest_handle_ ## name;                                \
@@ -82,7 +83,7 @@
 #undef set_xen_guest_handle_raw
 #define set_xen_guest_handle_raw(hnd, val)                  \
     do { if ( sizeof(hnd) == 8 ) *(uint64_t *)&(hnd) = 0;   \
-         (hnd).p = val;                                     \
+         (hnd).p = (val);                                     \
     } while ( 0 )
 #define  int64_aligned_t  int64_t __attribute__((aligned(8)))
 #define uint64_aligned_t uint64_t __attribute__((aligned(8)))
@@ -96,6 +97,7 @@
 /* nothing */
 #elif defined(__XEN__) || defined(__XEN_TOOLS__)
 /* Anonymous unions include all permissible names (e.g., al/ah/ax/eax). */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG_LO8(which) union { \
     uint32_t e ## which ## x; \
     uint16_t which ## x; \
@@ -104,6 +106,7 @@
         uint8_t which ## h; \
     }; \
 }
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG_LO16(name) union { \
     uint32_t e ## name, _e ## name; \
     uint16_t name; \
-- 
2.17.1


