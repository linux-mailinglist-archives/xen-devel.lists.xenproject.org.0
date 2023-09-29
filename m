Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E97B2EB5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610428.949825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-0008Kc-4v; Fri, 29 Sep 2023 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610428.949825; Fri, 29 Sep 2023 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-0008DE-00; Fri, 29 Sep 2023 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 610428;
 Fri, 29 Sep 2023 08:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qm9Jt-0007un-9L
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:57:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 485340ee-5ea6-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:57:56 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 287E54EE0C87;
 Fri, 29 Sep 2023 10:57:56 +0200 (CEST)
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
X-Inumbo-ID: 485340ee-5ea6-11ee-878b-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 3/4] x86/xstate: address a violation of MISRA C:2012 Rule 8.3
Date: Fri, 29 Sep 2023 10:56:16 +0200
Message-Id: <198577fa8876efc48a08a89b55fa5f95694b37c1.1695972930.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695972930.git.federico.serafini@bugseng.com>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/xstate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index f442610fc5..cf94761d05 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -54,16 +54,16 @@ static inline bool xsetbv(u32 index, u64 xfeatures)
     return lo != 0;
 }
 
-bool set_xcr0(u64 val)
+bool set_xcr0(u64 xfeatures)
 {
     uint64_t *this_xcr0 = &this_cpu(xcr0);
 
-    if ( *this_xcr0 != val )
+    if ( *this_xcr0 != xfeatures )
     {
-        if ( !xsetbv(XCR_XFEATURE_ENABLED_MASK, val) )
+        if ( !xsetbv(XCR_XFEATURE_ENABLED_MASK, xfeatures) )
             return false;
 
-        *this_xcr0 = val;
+        *this_xcr0 = xfeatures;
     }
 
     return true;
-- 
2.34.1


