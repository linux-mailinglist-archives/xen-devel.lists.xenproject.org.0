Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAE762FD8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 10:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570189.891752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZs6-0006qq-Uu; Wed, 26 Jul 2023 08:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570189.891752; Wed, 26 Jul 2023 08:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZs6-0006ot-S8; Wed, 26 Jul 2023 08:27:50 +0000
Received: by outflank-mailman (input) for mailman id 570189;
 Wed, 26 Jul 2023 08:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+seJ=DM=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOZs4-0006on-IT
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 08:27:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cc25310-2b8e-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 10:27:47 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.229.19])
 by support.bugseng.com (Postfix) with ESMTPSA id 8A7A54EE0738;
 Wed, 26 Jul 2023 10:27:45 +0200 (CEST)
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
X-Inumbo-ID: 4cc25310-2b8e-11ee-b242-6b7b168915f2
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
Subject: [XEN PATCH] xen/event: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed, 26 Jul 2023 10:27:38 +0200
Message-Id: <367ab3b09deaab82dfea0e833eeceaf8de49f5c1.1690359344.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/event.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 8eae9984a9..8e509e0784 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -48,10 +48,10 @@ int set_global_virq_handler(struct domain *d, uint32_t virq);
  *  @d:        Domain to which physical IRQ should be sent
  *  @pirq:     Physical IRQ number
  */
-void send_guest_pirq(struct domain *, const struct pirq *);
+void send_guest_pirq(struct domain *d, const struct pirq *pirq);
 
 /* Send a notification from a given domain's event-channel port. */
-int evtchn_send(struct domain *d, unsigned int lport);
+int evtchn_send(struct domain *ld, unsigned int lport);
 
 /* Bind a local event-channel port to the specified VCPU. */
 int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id);
@@ -69,7 +69,7 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
 void evtchn_free(struct domain *d, struct evtchn *chn);
 
 /* Allocate a specific event channel port. */
-int evtchn_allocate_port(struct domain *d, unsigned int port);
+int evtchn_allocate_port(struct domain *d, evtchn_port_t port);
 
 /* Allocate a new event channel */
 int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
@@ -78,7 +78,7 @@ int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
 /* Bind an event channel port to interdomain */
 int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
                                          struct domain *ld,
-                                         evtchn_port_t port);
+                                         evtchn_port_t lport);
 
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
-- 
2.34.1


