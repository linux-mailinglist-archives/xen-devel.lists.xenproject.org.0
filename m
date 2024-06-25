Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2042D916506
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 12:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747548.1154997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CI-0007ng-Mr; Tue, 25 Jun 2024 10:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747548.1154997; Tue, 25 Jun 2024 10:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CI-0007m7-K2; Tue, 25 Jun 2024 10:14:46 +0000
Received: by outflank-mailman (input) for mailman id 747548;
 Tue, 25 Jun 2024 10:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=075v=N3=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sM3CH-0007WK-H4
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 10:14:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be0c93ce-32db-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 12:14:44 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 899554EE073D;
 Tue, 25 Jun 2024 12:14:41 +0200 (CEST)
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
X-Inumbo-ID: be0c93ce-32db-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] common/kernel: address violation of MISRA C Rule 13.6
Date: Tue, 25 Jun 2024 12:14:19 +0200
Message-Id: <54949b0561263b9f18da500255836d89ca8838ba.1719308599.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file common/kernel.c macro ARRAY_SIZE is called with argument
current->domain->handle.
Once expanded, this ARRAY_SIZE's argument is used in sizeof operations
and thus 'current', being a macro that expands to a function
call with potential side effects, generates a violation.

To address this violation the value of current->domain is therefore
stored in a variable called 'd' before passing it to macro ARRAY_SIZE.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/common/kernel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index b44b2439ca..76b4f27aef 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -660,14 +660,15 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case XENVER_guest_handle:
     {
+        struct domain *d = current->domain;
         xen_domain_handle_t hdl;
 
         if ( deny )
             memset(&hdl, 0, ARRAY_SIZE(hdl));
 
-        BUILD_BUG_ON(ARRAY_SIZE(current->domain->handle) != ARRAY_SIZE(hdl));
+        BUILD_BUG_ON(ARRAY_SIZE(d->handle) != ARRAY_SIZE(hdl));
 
-        if ( copy_to_guest(arg, deny ? hdl : current->domain->handle,
+        if ( copy_to_guest(arg, deny ? hdl : d->handle,
                            ARRAY_SIZE(hdl) ) )
             return -EFAULT;
         return 0;
-- 
2.34.1


