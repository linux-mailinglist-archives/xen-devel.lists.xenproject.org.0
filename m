Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947347C888E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616667.958884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2A-0004RP-PM; Fri, 13 Oct 2023 15:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616667.958884; Fri, 13 Oct 2023 15:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2A-0004Oy-LK; Fri, 13 Oct 2023 15:25:02 +0000
Received: by outflank-mailman (input) for mailman id 616667;
 Fri, 13 Oct 2023 15:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK28-0002kz-TI
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:25:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac42960f-69dc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:25:00 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 9739C4EE073D;
 Fri, 13 Oct 2023 17:24:58 +0200 (CEST)
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
X-Inumbo-ID: ac42960f-69dc-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 06/10] arm/cmpxchg: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:36 +0200
Message-Id: <7323f8210d16e58d8b4cdac89a10d67e7d7d023f.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/arm32/cmpxchg.h | 2 +-
 xen/arch/arm/include/asm/arm64/cmpxchg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/cmpxchg.h b/xen/arch/arm/include/asm/arm32/cmpxchg.h
index b0bd1d8b68..37b2d64eb6 100644
--- a/xen/arch/arm/include/asm/arm32/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm32/cmpxchg.h
@@ -3,7 +3,7 @@
 
 #include <xen/prefetch.h>
 
-extern void __bad_xchg(volatile void *, int);
+extern void __bad_xchg(volatile void *ptr, int size);
 
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
 {
diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index 10e4edc022..dbfaf91567 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM64_CMPXCHG_H
 #define __ASM_ARM64_CMPXCHG_H
 
-extern void __bad_xchg(volatile void *, int);
+extern void __bad_xchg(volatile void *ptr, int size);
 
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
 {
-- 
2.34.1


