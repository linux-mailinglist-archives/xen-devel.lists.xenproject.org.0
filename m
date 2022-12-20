Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D03651CB3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466676.725694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YPC-0003LN-4C; Tue, 20 Dec 2022 08:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466676.725694; Tue, 20 Dec 2022 08:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YPC-0003HV-0O; Tue, 20 Dec 2022 08:55:22 +0000
Received: by outflank-mailman (input) for mailman id 466676;
 Tue, 20 Dec 2022 08:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLU-0001kP-K3
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7f8a504d-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843961688;
 Tue, 20 Dec 2022 00:52:11 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFB6D3F71A;
 Tue, 20 Dec 2022 00:51:29 -0800 (PST)
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
X-Inumbo-ID: 7f8a504d-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 15/18] public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_64.h
Date: Tue, 20 Dec 2022 08:50:57 +0000
Message-Id: <20221220085100.22848-16-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros
__DECL_REG_LOHI, __DECL_REG_LO8 and __DECL_REG_LO16, but the macro
parameters are used as variable identifiers, so it is safe to
suppress the findings.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/arch-x86/xen-x86_64.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 5d9035ed2230..7e375cd6f45f 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -115,6 +115,7 @@ struct iret_context {
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 /* Anonymous unions include all permissible names (e.g., al/ah/ax/eax/rax). */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG_LOHI(which) union { \
     uint64_t r ## which ## x; \
     uint32_t e ## which ## x; \
@@ -124,12 +125,14 @@ struct iret_context {
         uint8_t which ## h; \
     }; \
 }
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG_LO8(name) union { \
     uint64_t r ## name; \
     uint32_t e ## name; \
     uint16_t name; \
     uint8_t name ## l; \
 }
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __DECL_REG_LO16(name) union { \
     uint64_t r ## name; \
     uint32_t e ## name; \
-- 
2.17.1


