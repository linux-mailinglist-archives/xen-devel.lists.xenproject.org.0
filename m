Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44164894C97
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699998.1092476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVM-00044d-14; Tue, 02 Apr 2024 07:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699998.1092476; Tue, 02 Apr 2024 07:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVL-00041l-R5; Tue, 02 Apr 2024 07:24:23 +0000
Received: by outflank-mailman (input) for mailman id 699998;
 Tue, 02 Apr 2024 07:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVK-0003jQ-8f
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05647a33-f0c2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 09:24:20 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 772D94EE0742;
 Tue,  2 Apr 2024 09:24:19 +0200 (CEST)
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
X-Inumbo-ID: 05647a33-f0c2-11ee-a1ef-f123f15fe8a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/7] xen/domctl: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:04 +0200
Message-Id: <c730993f757afcaeb327e7fb8528b70b716cd5db.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712042178.git.federico.serafini@bugseng.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break statement to address a violation of MISRA C:2012 Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause ").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/domctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index d94a9dae91..f2e0e36a17 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -316,6 +316,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         d = rcu_lock_domain_by_id(op->domain);
         if ( !d )
             return -ESRCH;
+        break;
     }
 
     ret = xsm_domctl(XSM_OTHER, d, op->cmd);
-- 
2.34.1


