Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CFA554D99
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353979.580995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41VL-0004Rv-9g; Wed, 22 Jun 2022 14:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353979.580995; Wed, 22 Jun 2022 14:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41VL-0004Pw-6W; Wed, 22 Jun 2022 14:38:51 +0000
Received: by outflank-mailman (input) for mailman id 353979;
 Wed, 22 Jun 2022 14:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41VJ-0004Nu-Ub
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:38:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 06943b83-f239-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:38:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8737D6E;
 Wed, 22 Jun 2022 07:38:48 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5333D3F792;
 Wed, 22 Jun 2022 07:38:47 -0700 (PDT)
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
X-Inumbo-ID: 06943b83-f239-11ec-b725-ed86ccbb4733
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
Subject: [PATCH 1/8] xen/evtchn: make evtchn_bind_interdomain global
Date: Wed, 22 Jun 2022 15:37:58 +0100
Message-Id: <b8324e47bcbd7feeb992501b22b46f0ede3c2c3d.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event channel support will be added for dom0less domains to allocate
static event channel. It is necessary to have access to the
evtchn_bind_interdomain function to do that, so make
evtchn_bind_interdomain global and also make it __must_check.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/common/event_channel.c | 2 +-
 xen/include/xen/event.h    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index e60cd98d75..8cbe9681da 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -347,7 +347,7 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
     evtchn_write_unlock(rchn);
 }
 
-static int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
+int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
 {
     struct evtchn *lchn, *rchn;
     struct domain *ld = current->domain, *rd;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index f3021fe304..61615ebbe3 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -74,6 +74,9 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
 /* Allocate a new event channel */
 int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
 
+/* Bind an event channel port to interdomain */
+int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1


