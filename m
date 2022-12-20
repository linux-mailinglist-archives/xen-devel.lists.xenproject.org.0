Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AED651CB4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466711.725705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YPU-00044Q-Bv; Tue, 20 Dec 2022 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466711.725705; Tue, 20 Dec 2022 08:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YPU-00042X-7V; Tue, 20 Dec 2022 08:55:40 +0000
Received: by outflank-mailman (input) for mailman id 466711;
 Tue, 20 Dec 2022 08:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLY-0001kV-AJ
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7ff5cb8b-8043-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:51:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CB1D168F;
 Tue, 20 Dec 2022 00:52:12 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C82883F71A;
 Tue, 20 Dec 2022 00:51:30 -0800 (PST)
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
X-Inumbo-ID: 7ff5cb8b-8043-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 16/18] public/x86: cppcheck: misra rule 20.7 deviation on arch-x86/xen.h
Date: Tue, 20 Dec 2022 08:50:58 +0000
Message-Id: <20221220085100.22848-17-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros
___DEFINE_XEN_GUEST_HANDLE and set_xen_guest_handle_raw.
For the first one, the macro parameters are never used as an
expression, so it is safe to suppress the finding.
For the second one, while the argument "val" is never used
in an expression, it doesn't harm the code or the readability,
so add them.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/arch-x86/xen.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index c0f4551247f4..04f5bc899ae3 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -14,6 +14,7 @@
 
 /* Structural guest handles introduced in 0x00030201. */
 #if __XEN_INTERFACE_VERSION__ >= 0x00030201
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type) \
     typedef struct { type *p; } __guest_handle_ ## name
 #else
@@ -36,7 +37,7 @@
 #define __XEN_GUEST_HANDLE(name)        __guest_handle_ ## name
 #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
 #define XEN_GUEST_HANDLE_PARAM(name)    XEN_GUEST_HANDLE(name)
-#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = val; } while (0)
+#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = (val); } while (0)
 #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
 
 #if defined(__i386__)
-- 
2.17.1


