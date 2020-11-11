Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1A2AE86C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 06:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24235.51363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcj10-0003Vs-Uj; Wed, 11 Nov 2020 05:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24235.51363; Wed, 11 Nov 2020 05:49:54 +0000
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
	id 1kcj10-0003VT-RI; Wed, 11 Nov 2020 05:49:54 +0000
Received: by outflank-mailman (input) for mailman id 24235;
 Wed, 11 Nov 2020 05:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcj0z-0003VO-U5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 05:49:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdbb153a-9754-4576-bc1f-b1305e7789a5;
 Wed, 11 Nov 2020 05:49:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6101DAD66;
 Wed, 11 Nov 2020 05:49:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcj0z-0003VO-U5
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 05:49:54 +0000
X-Inumbo-ID: cdbb153a-9754-4576-bc1f-b1305e7789a5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cdbb153a-9754-4576-bc1f-b1305e7789a5;
	Wed, 11 Nov 2020 05:49:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605073788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8HUl3sIsB7tj41whqo0AC809SMSfM+7DMkhJUHNhwxE=;
	b=aqXSvtmZIjbQ8QC9UXLDMOAC6MUfCxxoSwXcCFQgbEfsuVyvFeiu4aQ9OGyg/i00pFO2OK
	QDSJJTnNAcFJvhDsPh79F6GQZi2UVvH/pOfnbMZWhHJusf6L8sbIYVHXkOi1jGSaOhQWf/
	QBRAw2XNUV8nv1jxcXE6BniXb4t5A+g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6101DAD66;
	Wed, 11 Nov 2020 05:49:48 +0000 (UTC)
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
Subject: [PATCH] xen/events: fix build
Date: Wed, 11 Nov 2020 06:49:46 +0100
Message-Id: <20201111054946.3229-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
introduced a build failure for NDEBUG builds.

Fixes: 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_channel.c | 2 ++
 xen/include/xen/sched.h    | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index eacd96b92f..da85d536f4 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -61,7 +61,9 @@ static inline void evtchn_write_lock(struct evtchn *evtchn)
 {
     write_lock(&evtchn->lock);
 
+#ifndef NDEBUG
     evtchn->old_state = evtchn->state;
+#endif
 }
 
 static inline void evtchn_write_unlock(struct evtchn *evtchn)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 7251b3ae3e..95f96e7a33 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -114,9 +114,7 @@ struct evtchn
         u16 virq;      /* state == ECS_VIRQ */
     } u;
     u8 priority;
-#ifndef NDEBUG
     u8 old_state;      /* State when taking lock in write mode. */
-#endif
     u8 last_priority;
     u16 last_vcpu_id;
 #ifdef CONFIG_XSM
-- 
2.26.2


