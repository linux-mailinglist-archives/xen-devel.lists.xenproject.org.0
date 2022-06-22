Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F6554DC7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354039.581083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41eo-0001PN-Bk; Wed, 22 Jun 2022 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354039.581083; Wed, 22 Jun 2022 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41eo-0001Mb-7B; Wed, 22 Jun 2022 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 354039;
 Wed, 22 Jun 2022 14:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41WV-0003uL-0k
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:40:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 323eee82-f239-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:40:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0F0D6E;
 Wed, 22 Jun 2022 07:40:01 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A02233F792;
 Wed, 22 Jun 2022 07:39:59 -0700 (PDT)
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
X-Inumbo-ID: 323eee82-f239-11ec-bd2d-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] xen/evtchn: don't set notification in evtchn_bind_interdomain()
Date: Wed, 22 Jun 2022 15:38:03 +0100
Message-Id: <0cb096d37f2ac6cb7c5aa04cad7ad5377a0934db.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_bind_interdomain() sets the notification on the local port to
handle the lost notification on remote unbound port.

Static event-channel will be created during domain creation, there is no
need to set the notification as remote domain is not alive.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/common/event_channel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index cedc98ccaf..420d18b986 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -435,8 +435,13 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
     /*
      * We may have lost notifications on the remote unbound port. Fix that up
      * here by conservatively always setting a notification on the local port.
+     *
+     * There is no need to set the notification if event channel is created in
+     * Xen because domain is not created at this time and no chance of lost
+     * notification.
      */
-    evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
+    if ( !is_static )
+        evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
 
     double_evtchn_unlock(lchn, rchn);
 
-- 
2.25.1


