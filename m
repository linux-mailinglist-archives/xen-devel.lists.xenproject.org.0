Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAA731A6F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 15:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549609.858225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nN1-0002wF-Sv; Thu, 15 Jun 2023 13:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549609.858225; Thu, 15 Jun 2023 13:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nN1-0002uG-Ps; Thu, 15 Jun 2023 13:50:39 +0000
Received: by outflank-mailman (input) for mailman id 549609;
 Thu, 15 Jun 2023 13:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eswf=CD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1q9nN0-0002uA-Ps
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 13:50:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b458cc1-0b83-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 15:50:37 +0200 (CEST)
Received: from federico.dell.bugseng.com (unknown [37.162.212.93])
 by support.bugseng.com (Postfix) with ESMTPSA id D4CF14EE0738;
 Thu, 15 Jun 2023 15:50:35 +0200 (CEST)
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
X-Inumbo-ID: 9b458cc1-0b83-11ee-b232-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH] xen/arch/arm/traps: remove inlining of handle_ro_raz()
Date: Thu, 15 Jun 2023 15:50:16 +0200
Message-Id: <98c6fb7ace8fce22bc263fe1d7fffac4e8130b57.1686835890.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To comply with MISRA C:2012 Rule 8.10 ("An inline function shall be
declared with the static storage class"), remove inline function
specifier from handle_ro_raz() since asking the compiler to inline
such function does not seem to add any kind of value.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/traps.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index f6437f6aa9..ef5c6a8195 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1677,11 +1677,11 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
 }
 
 /* Read only as read as zero */
-inline void handle_ro_raz(struct cpu_user_regs *regs,
-                          int regidx,
-                          bool read,
-                          const union hsr hsr,
-                          int min_el)
+void handle_ro_raz(struct cpu_user_regs *regs,
+                   int regidx,
+                   bool read,
+                   const union hsr hsr,
+                   int min_el)
 {
     handle_ro_read_val(regs, regidx, read, hsr, min_el, 0);
 }
-- 
2.34.1


