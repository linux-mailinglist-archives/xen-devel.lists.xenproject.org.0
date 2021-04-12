Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9A35BA20
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 08:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108799.207581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVq43-0001vh-Mv; Mon, 12 Apr 2021 06:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108799.207581; Mon, 12 Apr 2021 06:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVq43-0001vI-JO; Mon, 12 Apr 2021 06:28:51 +0000
Received: by outflank-mailman (input) for mailman id 108799;
 Mon, 12 Apr 2021 06:28:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lVq41-0001vB-AX
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 06:28:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26cd1147-9695-4101-b337-9d3edc036ae3;
 Mon, 12 Apr 2021 06:28:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AC3CAEB6;
 Mon, 12 Apr 2021 06:28:47 +0000 (UTC)
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
X-Inumbo-ID: 26cd1147-9695-4101-b337-9d3edc036ae3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618208927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hIOX7yB5Y0iyrXL4fYN85Uind6dSDN3lEdKNG2E6Sx4=;
	b=lBcjwNYz+YxHtnSTj9qd0CwfQJhYM039W3b0CHzlbcZpkEGE9mpTHGTjoseZpUu/Q/Q9I1
	vzleBGHOdaaWrqN3543kLKe7/SbCv/lRweORzy97oI7/MpLoByW4DRiI7BEgJd2tS91dSQ
	hqsDNMYC0pyecL0xf6uYcGZ29OkH4WU=
From: Juergen Gross <jgross@suse.com>
To: stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen/events: fix setting irq affinity
Date: Mon, 12 Apr 2021 08:28:45 +0200
Message-Id: <20210412062845.13946-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backport of upstream patch 25da4618af240fbec61 ("xen/events: don't
unmask an event channel when an eoi is pending") introduced a
regression for stable kernels 5.10 and older: setting IRQ affinity for
IRQs related to interdomain events would no longer work, as moving the
IRQ to its new cpu was not included in the irq_ack callback for those
events.

Fix that by adding the needed call.

Note that kernels 5.11 and later don't need the explicit moving of the
IRQ to the target cpu in the irq_ack callback, due to a rework of the
affinity setting in kernel 5.11.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This patch should be applied to all stable kernel branches up to
(including) linux-5.10.y, where upstream patch 25da4618af240fbec61 has
been added.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 7bd03f6e0422..ee5269331406 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1809,7 +1809,7 @@ static void lateeoi_ack_dynirq(struct irq_data *data)
 
 	if (VALID_EVTCHN(evtchn)) {
 		do_mask(info, EVT_MASK_REASON_EOI_PENDING);
-		event_handler_exit(info);
+		ack_dynirq(data);
 	}
 }
 
@@ -1820,7 +1820,7 @@ static void lateeoi_mask_ack_dynirq(struct irq_data *data)
 
 	if (VALID_EVTCHN(evtchn)) {
 		do_mask(info, EVT_MASK_REASON_EXPLICIT);
-		event_handler_exit(info);
+		ack_dynirq(data);
 	}
 }
 
-- 
2.26.2


