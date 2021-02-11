Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4883187E3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83798.156839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92n-0001fv-J2; Thu, 11 Feb 2021 10:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83798.156839; Thu, 11 Feb 2021 10:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92n-0001fA-9g; Thu, 11 Feb 2021 10:17:53 +0000
Received: by outflank-mailman (input) for mailman id 83798;
 Thu, 11 Feb 2021 10:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA92l-0001Uu-O2
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:17:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cb82252-c671-4eed-821b-f7d2d3151973;
 Thu, 11 Feb 2021 10:17:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98FF9AF50;
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
X-Inumbo-ID: 8cb82252-c671-4eed-821b-f7d2d3151973
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613038661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYH24KPMu2VG4s1NBLZlXtQTIXh2Tv25DANk+uAGYuo=;
	b=u1DgoxnpEm4vOpyw48CO18ajkHrDW1uvBzT3RfgWYFijSi0+reRlAnvlKP1gg0r4P9Pi7i
	Vu5847ApQb2x84mlacvWnCjsZcJwu0yHNhZeZttlgZKVZRpMXgD4XgZOCcNZ5ySrNx83tW
	UvkSODeyNjTFab6FqCgs6SMINmH3iSc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 8/8] xen/evtchn: use READ/WRITE_ONCE() for accessing ring indices
Date: Thu, 11 Feb 2021 11:16:16 +0100
Message-Id: <20210211101616.13788-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211101616.13788-1-jgross@suse.com>
References: <20210211101616.13788-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For avoiding read- and write-tearing by the compiler use READ_ONCE()
and WRITE_ONCE() for accessing the ring indices in evtchn.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- modify all accesses (Julien Grall)
---
 drivers/xen/evtchn.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index 421382c73d88..620008f89dbe 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -162,6 +162,7 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
 {
 	struct user_evtchn *evtchn = data;
 	struct per_user_data *u = evtchn->user;
+	unsigned int prod, cons;
 
 	WARN(!evtchn->enabled,
 	     "Interrupt for port %u, but apparently not enabled; per-user %p\n",
@@ -171,10 +172,14 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
 
 	spin_lock(&u->ring_prod_lock);
 
-	if ((u->ring_prod - u->ring_cons) < u->ring_size) {
-		*evtchn_ring_entry(u, u->ring_prod) = evtchn->port;
+	prod = READ_ONCE(u->ring_prod);
+	cons = READ_ONCE(u->ring_cons);
+
+	if ((prod - cons) < u->ring_size) {
+		*evtchn_ring_entry(u, prod) = evtchn->port;
 		smp_wmb(); /* Ensure ring contents visible */
-		if (u->ring_cons == u->ring_prod++) {
+		if (cons == prod++) {
+			WRITE_ONCE(u->ring_prod, prod);
 			wake_up_interruptible(&u->evtchn_wait);
 			kill_fasync(&u->evtchn_async_queue,
 				    SIGIO, POLL_IN);
@@ -210,8 +215,8 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
 		if (u->ring_overflow)
 			goto unlock_out;
 
-		c = u->ring_cons;
-		p = u->ring_prod;
+		c = READ_ONCE(u->ring_cons);
+		p = READ_ONCE(u->ring_prod);
 		if (c != p)
 			break;
 
@@ -221,7 +226,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
 			return -EAGAIN;
 
 		rc = wait_event_interruptible(u->evtchn_wait,
-					      u->ring_cons != u->ring_prod);
+			READ_ONCE(u->ring_cons) != READ_ONCE(u->ring_prod));
 		if (rc)
 			return rc;
 	}
@@ -251,7 +256,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
 	     copy_to_user(&buf[bytes1], &u->ring[0], bytes2)))
 		goto unlock_out;
 
-	u->ring_cons += (bytes1 + bytes2) / sizeof(evtchn_port_t);
+	WRITE_ONCE(u->ring_cons, c + (bytes1 + bytes2) / sizeof(evtchn_port_t));
 	rc = bytes1 + bytes2;
 
  unlock_out:
@@ -552,7 +557,9 @@ static long evtchn_ioctl(struct file *file,
 		/* Initialise the ring to empty. Clear errors. */
 		mutex_lock(&u->ring_cons_mutex);
 		spin_lock_irq(&u->ring_prod_lock);
-		u->ring_cons = u->ring_prod = u->ring_overflow = 0;
+		WRITE_ONCE(u->ring_cons, 0);
+		WRITE_ONCE(u->ring_prod, 0);
+		u->ring_overflow = 0;
 		spin_unlock_irq(&u->ring_prod_lock);
 		mutex_unlock(&u->ring_cons_mutex);
 		rc = 0;
@@ -595,7 +602,7 @@ static __poll_t evtchn_poll(struct file *file, poll_table *wait)
 	struct per_user_data *u = file->private_data;
 
 	poll_wait(file, &u->evtchn_wait, wait);
-	if (u->ring_cons != u->ring_prod)
+	if (READ_ONCE(u->ring_cons) != READ_ONCE(u->ring_prod))
 		mask |= EPOLLIN | EPOLLRDNORM;
 	if (u->ring_overflow)
 		mask = EPOLLERR;
-- 
2.26.2


