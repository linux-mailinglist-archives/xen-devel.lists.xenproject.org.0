Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9E651C97
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466596.725536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLI-0002in-VF; Tue, 20 Dec 2022 08:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466596.725536; Tue, 20 Dec 2022 08:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLI-0002ay-Nv; Tue, 20 Dec 2022 08:51:20 +0000
Received: by outflank-mailman (input) for mailman id 466596;
 Tue, 20 Dec 2022 08:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLG-0001kV-WC
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7762080d-8043-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:51:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4765B1688;
 Tue, 20 Dec 2022 00:51:58 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71BC33F71A;
 Tue, 20 Dec 2022 00:51:16 -0800 (PST)
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
X-Inumbo-ID: 7762080d-8043-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 04/18] arm: cppcheck: misra rule 20.7 deviation on config.h
Date: Tue, 20 Dec 2022 08:50:46 +0000
Message-Id: <20221220085100.22848-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros ENTRY(),
GLOBAL(), END() and ENDPROC(), but the macro parameters are never
used as an expression, they are used for text substitution but
cppcheck is not taking into account the context of them, so we can
suppress the findings.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/config.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..c4843ddffe24 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -54,15 +54,19 @@
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
 #define ALIGN .align 2
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
   name:
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define END(name) \
   .size name, .-name
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define ENDPROC(name) \
   .type name, %function; \
   END(name)
-- 
2.17.1


