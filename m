Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DD7B2EB3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610429.949832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-0008Sh-HS; Fri, 29 Sep 2023 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610429.949832; Fri, 29 Sep 2023 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-0008KS-CA; Fri, 29 Sep 2023 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 610429;
 Fri, 29 Sep 2023 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qm9Jt-0007us-PU
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:57:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480b17ea-5ea6-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:57:56 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id A91CA4EE0C81;
 Fri, 29 Sep 2023 10:57:55 +0200 (CEST)
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
X-Inumbo-ID: 480b17ea-5ea6-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 2/4] x86/uaccess: address violations of MISRA C:2012 Rule 8.3
Date: Fri, 29 Sep 2023 10:56:15 +0200
Message-Id: <7e32d3b6c078a7692668a509d05c44175ad99310.1695972930.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695972930.git.federico.serafini@bugseng.com>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/uaccess.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 684fccd95c..7443519d5b 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -10,10 +10,10 @@
 #include <asm/x86_64/uaccess.h>
 
 unsigned int copy_to_guest_pv(void __user *to, const void *from,
-                              unsigned int len);
-unsigned int clear_guest_pv(void __user *to, unsigned int len);
+                              unsigned int n);
+unsigned int clear_guest_pv(void __user *to, unsigned int n);
 unsigned int copy_from_guest_pv(void *to, const void __user *from,
-                                unsigned int len);
+                                unsigned int n);
 
 /* Handles exceptions in both to and from, but doesn't do access_ok */
 unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);
-- 
2.34.1


