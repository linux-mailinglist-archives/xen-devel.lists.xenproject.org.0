Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB23818606
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656670.1025048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvR-0004YX-PT; Tue, 19 Dec 2023 11:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656670.1025048; Tue, 19 Dec 2023 11:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvR-0004OG-LZ; Tue, 19 Dec 2023 11:06:13 +0000
Received: by outflank-mailman (input) for mailman id 656670;
 Tue, 19 Dec 2023 11:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvP-0003Hq-Lb
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bb7bc45-9e5e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:06:07 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 1B7B04EE0C92;
 Tue, 19 Dec 2023 12:06:07 +0100 (CET)
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
X-Inumbo-ID: 9bb7bc45-9e5e-11ee-98eb-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/6] xen/ppc: address violations of MISRA C:2012 Rule 11.8.
Date: Tue, 19 Dec 2023 12:05:10 +0100
Message-Id: <9270a4fe1712cff6a99e60c7862de1c1b2dde3d6.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Fix violation by adding missing const qualifier in cast.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Adaptation requested by the community to make the code more consistent.
---
 xen/arch/ppc/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm/atomic.h
index 64168aa3f1..fe778579fb 100644
--- a/xen/arch/ppc/include/asm/atomic.h
+++ b/xen/arch/ppc/include/asm/atomic.h
@@ -16,7 +16,7 @@
 
 static inline int atomic_read(const atomic_t *v)
 {
-    return *(volatile int *)&v->counter;
+    return *(const volatile int *)&v->counter;
 }
 
 static inline int _atomic_read(atomic_t v)
-- 
2.40.0


