Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A93187E4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83800.156862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92s-0001ot-Hp; Thu, 11 Feb 2021 10:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83800.156862; Thu, 11 Feb 2021 10:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92s-0001o6-Ck; Thu, 11 Feb 2021 10:17:58 +0000
Received: by outflank-mailman (input) for mailman id 83800;
 Thu, 11 Feb 2021 10:17:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA92r-0001VI-7w
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:17:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c958570c-1b54-4414-a274-bdc203af6dae;
 Thu, 11 Feb 2021 10:17:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FD2CAF49;
 Thu, 11 Feb 2021 10:17:41 +0000 (UTC)
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
X-Inumbo-ID: c958570c-1b54-4414-a274-bdc203af6dae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613038661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYiBLOOS0jKaGXZR/xdp5WHTi+5sOW1v2m88NDrZNbI=;
	b=LmkY0cY/xUPQabBZ2K6py6iwlNSohSvZqtVGIKhgfs/Vd+e3i0HPowZRhK5GJgyUl5o28/
	Lx47YRJ3EXvR1/z8sPJDmrvUc6rf00u386Gf1+f8cdN9vhlSbjkIEU7foEmfSwD4BZQf/a
	zldb9aBFKnXvuTux4U/p6Gw35AZbFbs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 7/8] xen/evtch: use smp barriers for user event ring
Date: Thu, 11 Feb 2021 11:16:15 +0100
Message-Id: <20210211101616.13788-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211101616.13788-1-jgross@suse.com>
References: <20210211101616.13788-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ring buffer for user events is local to the given kernel instance,
so smp barriers are fine for ensuring consistency.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 drivers/xen/evtchn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index a7a85719a8c8..421382c73d88 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -173,7 +173,7 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
 
 	if ((u->ring_prod - u->ring_cons) < u->ring_size) {
 		*evtchn_ring_entry(u, u->ring_prod) = evtchn->port;
-		wmb(); /* Ensure ring contents visible */
+		smp_wmb(); /* Ensure ring contents visible */
 		if (u->ring_cons == u->ring_prod++) {
 			wake_up_interruptible(&u->evtchn_wait);
 			kill_fasync(&u->evtchn_async_queue,
@@ -245,7 +245,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
 	}
 
 	rc = -EFAULT;
-	rmb(); /* Ensure that we see the port before we copy it. */
+	smp_rmb(); /* Ensure that we see the port before we copy it. */
 	if (copy_to_user(buf, evtchn_ring_entry(u, c), bytes1) ||
 	    ((bytes2 != 0) &&
 	     copy_to_user(&buf[bytes1], &u->ring[0], bytes2)))
-- 
2.26.2


