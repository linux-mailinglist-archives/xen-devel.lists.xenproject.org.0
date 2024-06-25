Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA69916507
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 12:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747550.1155007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CN-00087d-0h; Tue, 25 Jun 2024 10:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747550.1155007; Tue, 25 Jun 2024 10:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CM-000843-T8; Tue, 25 Jun 2024 10:14:50 +0000
Received: by outflank-mailman (input) for mailman id 747550;
 Tue, 25 Jun 2024 10:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=075v=N3=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sM3CL-0007WK-9l
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 10:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03fbf98-32db-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 12:14:47 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id F3BAD4EE0754;
 Tue, 25 Jun 2024 12:14:45 +0200 (CEST)
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
X-Inumbo-ID: c03fbf98-32db-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] xen/event: address violation of MISRA C Rule 13.6
Date: Tue, 25 Jun 2024 12:14:20 +0200
Message-Id: <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file include/xen/event.h macro set_bit is called with argument
current->pause_flags.
Once expanded this set_bit's argument is used in sizeof operations
and thus 'current', being a macro that expands to a function
call with potential side effects, generates a violation.

To address this violation the value of current is therefore stored in a
variable called 'v' before passing it to macro set_bit.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/include/xen/event.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index f1472ea1eb..48b79f3d62 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -183,13 +183,14 @@ static bool evtchn_usable(const struct evtchn *evtchn)
 /* Wait on a Xen-attached event channel. */
 #define wait_on_xen_event_channel(port, condition)                      \
     do {                                                                \
+        struct vcpu *v = current;                                       \
         if ( condition )                                                \
             break;                                                      \
-        set_bit(_VPF_blocked_in_xen, &current->pause_flags);            \
+        set_bit(_VPF_blocked_in_xen, &v->pause_flags);                  \
         smp_mb(); /* set blocked status /then/ re-evaluate condition */ \
         if ( condition )                                                \
         {                                                               \
-            clear_bit(_VPF_blocked_in_xen, &current->pause_flags);      \
+            clear_bit(_VPF_blocked_in_xen, &v->pause_flags);            \
             break;                                                      \
         }                                                               \
         raise_softirq(SCHEDULE_SOFTIRQ);                                \
@@ -198,7 +199,8 @@ static bool evtchn_usable(const struct evtchn *evtchn)
 
 #define prepare_wait_on_xen_event_channel(port)                         \
     do {                                                                \
-        set_bit(_VPF_blocked_in_xen, &current->pause_flags);            \
+        struct vcpu *v = current;                                       \
+        set_bit(_VPF_blocked_in_xen, &v->pause_flags);                  \
         raise_softirq(SCHEDULE_SOFTIRQ);                                \
         smp_mb(); /* set blocked status /then/ caller does his work */  \
     } while ( 0 )
-- 
2.34.1


