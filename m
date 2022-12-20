Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9170651CA0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466606.725621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLU-0005Fl-Ka; Tue, 20 Dec 2022 08:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466606.725621; Tue, 20 Dec 2022 08:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLT-000538-U1; Tue, 20 Dec 2022 08:51:31 +0000
Received: by outflank-mailman (input) for mailman id 466606;
 Tue, 20 Dec 2022 08:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLQ-0001kV-J0
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7d4575f3-8043-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:51:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 392AD13D5;
 Tue, 20 Dec 2022 00:52:08 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62E6A3F71A;
 Tue, 20 Dec 2022 00:51:26 -0800 (PST)
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
X-Inumbo-ID: 7d4575f3-8043-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 12/18] arm: cppcheck: misra rule 20.7 deviation on asm/arm64/sysregs.h
Date: Tue, 20 Dec 2022 08:50:54 +0000
Message-Id: <20221220085100.22848-13-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro
WRITE_SYSREG64, the macro parameter "v" is never used in an
expression, but adding parenthesis to it doesn't harm the code
or the readability, so add parenthesis to it.

Eclair and coverity does not report this finding.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/sysregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 463899951414..3f709d26a299 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -461,7 +461,7 @@
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-    uint64_t _r = v;                                    \
+    uint64_t _r = (v);                                  \
     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
 } while (0)
 #define READ_SYSREG64(name) ({                          \
-- 
2.17.1


