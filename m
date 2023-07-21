Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B475CC17
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567631.886920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsCx-0005u5-9B; Fri, 21 Jul 2023 15:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567631.886920; Fri, 21 Jul 2023 15:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsCx-0005sD-6W; Fri, 21 Jul 2023 15:38:19 +0000
Received: by outflank-mailman (input) for mailman id 567631;
 Fri, 21 Jul 2023 15:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0zQ=DH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMsCv-0005rl-A3
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:38:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c6ea7ae-27dc-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 17:38:16 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.253.240])
 by support.bugseng.com (Postfix) with ESMTPSA id 63C824EE0C89;
 Fri, 21 Jul 2023 17:38:15 +0200 (CEST)
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
X-Inumbo-ID: 9c6ea7ae-27dc-11ee-b23a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH] atomic: change parameter name in atomic_cmpxchg() definition
Date: Fri, 21 Jul 2023 17:37:54 +0200
Message-Id: <cace061a0b574d56f9b12a43a7c82276ef56654f.1689953642.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name from 'ptr' to 'v' in the function definition thus
addressing violations of MISRA C:2012 Rule 8.3: "All declarations of an
object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/arm64/atomic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 2d42567866..4460165295 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -105,7 +105,7 @@ static inline void atomic_and(int m, atomic_t *v)
 	: "Ir" (m));
 }
 
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 {
 	unsigned long tmp;
 	int oldval;
@@ -119,7 +119,7 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
 "	stxr	%w0, %w4, %2\n"
 "	cbnz	%w0, 1b\n"
 "2:"
-	: "=&r" (tmp), "=&r" (oldval), "+Q" (ptr->counter)
+	: "=&r" (tmp), "=&r" (oldval), "+Q" (v->counter)
 	: "Ir" (old), "r" (new)
 	: "cc");
 
-- 
2.34.1


