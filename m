Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873C8763A7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690252.1076089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYlb-0006mu-Nz; Fri, 08 Mar 2024 11:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690252.1076089; Fri, 08 Mar 2024 11:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYlb-0006jk-KZ; Fri, 08 Mar 2024 11:51:59 +0000
Received: by outflank-mailman (input) for mailman id 690252;
 Fri, 08 Mar 2024 11:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XKKn=KO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1riYla-0006je-4y
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:51:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e1142b-dd42-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 12:51:57 +0100 (CET)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-58-32-177.retail.telecomitalia.it [82.58.32.177])
 by support.bugseng.com (Postfix) with ESMTPSA id 797D54EE0738;
 Fri,  8 Mar 2024 12:51:56 +0100 (CET)
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
X-Inumbo-ID: 43e1142b-dd42-11ee-afda-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules 16.3 and 16.4
Date: Fri,  8 Mar 2024 12:51:49 +0100
Message-Id: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C:2012
Rule 16.3 ("An unconditional `break' statement shall terminate every
switch-clause").

Add missing default cases to address violations of MISRA C:2012
Rule 16.4 (Every `switch' statement shall have a `default' label).

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/event_channel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 15aec5dcbb..cf19020e49 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -130,9 +130,12 @@ static bool virq_is_global(unsigned int virq)
 
     case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
         return arch_virq_is_global(virq);
+
+    default:
+        ASSERT(virq < NR_VIRQS);
+        break;
     }
 
-    ASSERT(virq < NR_VIRQS);
     return true;
 }
 
@@ -846,6 +849,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
         break;
     default:
         ret = -EINVAL;
+        break;
     }
 
 out:
@@ -1672,6 +1676,9 @@ static void domain_dump_evtchn_info(struct domain *d)
         case ECS_VIRQ:
             printk(" v=%d", chn->u.virq);
             break;
+        default:
+            /* Nothing to do in other cases. */
+            break;
         }
 
         ssid = xsm_show_security_evtchn(d, chn);
-- 
2.34.1


