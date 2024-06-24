Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264E9145C9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746335.1153452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfdG-0006I5-FZ; Mon, 24 Jun 2024 09:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746335.1153452; Mon, 24 Jun 2024 09:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfdF-000639-TA; Mon, 24 Jun 2024 09:05:01 +0000
Received: by outflank-mailman (input) for mailman id 746335;
 Mon, 24 Jun 2024 09:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfdC-0002x1-EV
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3c0caea-3208-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:04:56 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id E2C7D4EE0754;
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
X-Inumbo-ID: d3c0caea-3208-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 13/13] x86/vlapic: address a violation of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:37 +0200
Message-Id: <0aa39166696e46b6bb45a0f7b5ac06bfd9fdda8e.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719218291.git.federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of MISRA C
Rule 16.3: "An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/vlapic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666a..2ec9594271 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -367,6 +367,7 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
         gdprintk(XENLOG_ERR, "TODO: unsupported delivery mode in ICR %x\n",
                  icr_low);
         domain_crash(v->domain);
+        break;
     }
 }
 
-- 
2.34.1


