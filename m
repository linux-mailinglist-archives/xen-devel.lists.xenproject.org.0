Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E666C894C93
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699997.1092471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVL-00041j-Na; Tue, 02 Apr 2024 07:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699997.1092471; Tue, 02 Apr 2024 07:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVL-0003yE-II; Tue, 02 Apr 2024 07:24:23 +0000
Received: by outflank-mailman (input) for mailman id 699997;
 Tue, 02 Apr 2024 07:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVJ-0003jD-LS
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05a21cdf-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:20 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 082074EE0744;
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
X-Inumbo-ID: 05a21cdf-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/7] console: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:05 +0200
Message-Id: <c1dbd9f26ad88f667075926e85dc971c41c7d5d4.1712042178.git.federico.serafini@bugseng.com>
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
 xen/drivers/char/console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ccd5f8cc14..e185f80efe 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -568,6 +568,8 @@ static void __serial_rx(char c)
 
         if ( d != NULL )
             rcu_unlock_domain(d);
+
+        break;
     }
 #endif
     }
-- 
2.34.1


