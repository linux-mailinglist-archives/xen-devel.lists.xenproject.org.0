Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0127812FBD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654526.1021540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWL-0002JN-E3; Thu, 14 Dec 2023 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654526.1021540; Thu, 14 Dec 2023 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWK-0002Bh-Rs; Thu, 14 Dec 2023 12:08:52 +0000
Received: by outflank-mailman (input) for mailman id 654526;
 Thu, 14 Dec 2023 12:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWI-0000tI-KY
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 892a5a09-9a79-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:08:48 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 7D10A4EE0C8F;
 Thu, 14 Dec 2023 13:08:47 +0100 (CET)
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
X-Inumbo-ID: 892a5a09-9a79-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 6/9] xen/ppc: address violations of MISRA C:2012 Rule 11.8.
Date: Thu, 14 Dec 2023 13:07:48 +0100
Message-Id: <0dcaf3a85f3293168b993c42303dfd55684a7bb7.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
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


