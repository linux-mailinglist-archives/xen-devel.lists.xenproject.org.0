Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524B2C1E92
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 08:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35378.66901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khSKE-0001nx-Jr; Tue, 24 Nov 2020 07:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35378.66901; Tue, 24 Nov 2020 07:01:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khSKE-0001nH-FM; Tue, 24 Nov 2020 07:01:18 +0000
Received: by outflank-mailman (input) for mailman id 35378;
 Tue, 24 Nov 2020 07:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khSKD-0001kq-3z
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38370360-fb20-49fc-88ce-cf4fc5afc72c;
 Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A013DADCD;
 Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khSKD-0001kq-3z
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:17 +0000
X-Inumbo-ID: 38370360-fb20-49fc-88ce-cf4fc5afc72c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 38370360-fb20-49fc-88ce-cf4fc5afc72c;
	Tue, 24 Nov 2020 07:01:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606201269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY+rObtaesBiYwhFR54/hfk+UTURWjLhSDOKmBjo9Hk=;
	b=DuiB6acuqrH4C2absqcxEFRbDrXB2fDjBgSxIwxTz1tlybaHV+QEpsJU02wI1BLe46mAw0
	QMHW2k4JCUWGGaNTw0+FqZKNpJPpydJ3mutCADpZN9FTGdUIzLDMcOLuaegMoB+IhE4m7h
	YMuNtsNn46pIrv/Xlh+AWDys/+6aZfQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A013DADCD;
	Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 2/3] xen/events: modify struct evtchn layout
Date: Tue, 24 Nov 2020 08:01:05 +0100
Message-Id: <20201124070106.26854-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124070106.26854-1-jgross@suse.com>
References: <20201124070106.26854-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid latent races when updating an event channel put
xen_consumer and pending fields in different bytes.

At the same time move some other fields around to have less implicit
paddings and to keep related fields more closely together.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xen/sched.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a345cc01f8..e6d09aa055 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -80,8 +80,7 @@ extern domid_t hardware_domid;
 #define EVTCHNS_PER_GROUP  (BUCKETS_PER_GROUP * EVTCHNS_PER_BUCKET)
 #define NR_EVTCHN_GROUPS   DIV_ROUND_UP(MAX_NR_EVTCHNS, EVTCHNS_PER_GROUP)
 
-#define XEN_CONSUMER_BITS 3
-#define NR_XEN_CONSUMERS ((1 << XEN_CONSUMER_BITS) - 1)
+#define NR_XEN_CONSUMERS 8
 
 struct evtchn
 {
@@ -94,9 +93,10 @@ struct evtchn
 #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
 #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
     u8  state;             /* ECS_* */
-    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */
-    u8  pending:1;
-    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
+#ifndef NDEBUG
+    u8  old_state;     /* State when taking lock in write mode. */
+#endif
+    u8  xen_consumer;  /* Consumer in Xen if nonzero */
     u32 port;
     union {
         struct {
@@ -113,11 +113,13 @@ struct evtchn
         } pirq;        /* state == ECS_PIRQ */
         u16 virq;      /* state == ECS_VIRQ */
     } u;
-    u8 priority;
-#ifndef NDEBUG
-    u8 old_state;      /* State when taking lock in write mode. */
-#endif
-    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
+
+    /* FIFO event channels only. */
+    u8  pending;
+    u8  priority;
+    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
+    u32 fifo_lastq;        /* Data for identifying last queue. */
+
 #ifdef CONFIG_XSM
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
-- 
2.26.2


