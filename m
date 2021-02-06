Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71380311CB3
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 11:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82122.151794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA3-0005Yn-LZ; Sat, 06 Feb 2021 10:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82122.151794; Sat, 06 Feb 2021 10:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA3-0005Y3-FY; Sat, 06 Feb 2021 10:49:55 +0000
Received: by outflank-mailman (input) for mailman id 82122;
 Sat, 06 Feb 2021 10:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l8LA1-0005VY-IM
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 10:49:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22f2ff8f-1608-4480-8ae5-8185a34135e6;
 Sat, 06 Feb 2021 10:49:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DFC9AD78;
 Sat,  6 Feb 2021 10:49:47 +0000 (UTC)
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
X-Inumbo-ID: 22f2ff8f-1608-4480-8ae5-8185a34135e6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612608587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlVL2Y2ASTFVpwcU4SmdSz79vlZWGd1T5oGBYzvUtKQ=;
	b=CaAOHRpv7RYB3U4+TM6JjEfbGxTHtF6cA58Si23ab7AwqoG6YglxUsLmvFuf0c94PPFVIm
	SpAadYtJiVApk9QAnqoPFKPJPHt+6euf4qwQg6uIr8CsiyoWiW+qlFD/zWnyEkhfhkHS8b
	Gs1DtsywWPRDSXVKB3DIktuDeZYkblE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/7] xen/events: fix lateeoi irq acknowledgment
Date: Sat,  6 Feb 2021 11:49:28 +0100
Message-Id: <20210206104932.29064-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206104932.29064-1-jgross@suse.com>
References: <20210206104932.29064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When having accepted an irq as result from receiving an event the
related event should be cleared. The lateeoi model is missing that,
resulting in a continuous stream of events being signalled.

Fixes: 54c9de89895e0a ("xen/events: add a new late EOI evtchn framework")
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 6a836d131e73..7b26ef817f8b 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1826,6 +1826,7 @@ static void lateeoi_ack_dynirq(struct irq_data *data)
 	if (VALID_EVTCHN(evtchn)) {
 		info->eoi_pending = true;
 		mask_evtchn(evtchn);
+		clear_evtchn(evtchn);
 	}
 }
 
@@ -1838,6 +1839,7 @@ static void lateeoi_mask_ack_dynirq(struct irq_data *data)
 		info->masked = true;
 		info->eoi_pending = true;
 		mask_evtchn(evtchn);
+		clear_evtchn(evtchn);
 	}
 }
 
-- 
2.26.2


