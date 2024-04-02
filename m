Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C710A894C98
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700001.1092510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVO-0004sf-7a; Tue, 02 Apr 2024 07:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700001.1092510; Tue, 02 Apr 2024 07:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVN-0004nD-VB; Tue, 02 Apr 2024 07:24:25 +0000
Received: by outflank-mailman (input) for mailman id 700001;
 Tue, 02 Apr 2024 07:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVL-0003jD-M9
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 062e93db-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:21 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id E6E614EE0746;
 Tue,  2 Apr 2024 09:24:20 +0200 (CEST)
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
X-Inumbo-ID: 062e93db-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 4/7] xen/evtchn: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:07 +0200
Message-Id: <98c4197ab3bcf82d0055836cf950f1268dbcc91c.1712042178.git.federico.serafini@bugseng.com>
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
 xen/common/event_channel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 20f586cf5e..aceee0695f 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -853,6 +853,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
         break;
     default:
         ret = -EINVAL;
+        break;
     }
 
 out:
-- 
2.34.1


