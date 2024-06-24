Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206B9145C7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746334.1153445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfdF-00066O-FN; Mon, 24 Jun 2024 09:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746334.1153445; Mon, 24 Jun 2024 09:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfdE-0005pX-Mg; Mon, 24 Jun 2024 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 746334;
 Mon, 24 Jun 2024 09:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfdB-0002x1-EO
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d353f119-3208-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:04:56 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id 437414EE0738;
 Mon, 24 Jun 2024 11:04:55 +0200 (CEST)
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
X-Inumbo-ID: d353f119-3208-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 12/13] x86/vPIC: address a violation of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:36 +0200
Message-Id: <bf0f2ac1c8e9443b2c4f8ae6f02659927d5f7dea.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719218291.git.federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pseudokeyword fallthrough to meet the requirements to deviate
a violation of MISRA C Rul 16.3: "An unconditional `break' statement
shall terminate every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/vpic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 7c3b5c7254..6427b08086 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -309,6 +309,7 @@ static void vpic_ioport_write(
             if ( !(vpic->init_state & 8) )
                 break; /* CASCADE mode: wait for write to ICW3. */
             /* SNGL mode: fall through (no ICW3). */
+            fallthrough;
         case 2:
             /* ICW3 */
             vpic->init_state++;
-- 
2.34.1


