Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC61651C94
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466597.725542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLJ-0002ms-AW; Tue, 20 Dec 2022 08:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466597.725542; Tue, 20 Dec 2022 08:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLJ-0002jT-3l; Tue, 20 Dec 2022 08:51:21 +0000
Received: by outflank-mailman (input) for mailman id 466597;
 Tue, 20 Dec 2022 08:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLH-0001kP-Og
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 785671f4-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 613F513D5;
 Tue, 20 Dec 2022 00:51:59 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AFEE3F71A;
 Tue, 20 Dec 2022 00:51:17 -0800 (PST)
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
X-Inumbo-ID: 785671f4-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 05/18] arm: cppcheck: fix misra rule 20.7 on arm/include/asm/string.h
Date: Tue, 20 Dec 2022 08:50:47 +0000
Message-Id: <20221220085100.22848-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro memset
about missing parenthesis for the "n" argument, while the parenthesis
are not mandatory because the argument is never used in an
expression, adding them will not harm code and readability, so fix
the finding adding parenthesis for the argument.

Eclair and coverity does not report this finding.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/string.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/string.h b/xen/arch/arm/include/asm/string.h
index b485e4904419..f1c87d215b0b 100644
--- a/xen/arch/arm/include/asm/string.h
+++ b/xen/arch/arm/include/asm/string.h
@@ -30,7 +30,7 @@ void __memzero(void *ptr, size_t n);
 
 #define memset(p, v, n)                                                 \
         ({                                                              \
-                void *__p = (p); size_t __n = n;                        \
+                void *__p = (p); size_t __n = (n);                      \
                 if ((__n) != 0) {                                       \
                         if (__builtin_constant_p((v)) && (v) == 0)      \
                                 __memzero((__p),(__n));                 \
-- 
2.17.1


