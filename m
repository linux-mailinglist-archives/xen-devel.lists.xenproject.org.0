Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMHLAtX7MWqQtQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 03:43:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C5695FCE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 03:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cLm4GRJ4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339787.1600883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZfIY-0003QM-9Z; Wed, 17 Jun 2026 01:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339787.1600883; Wed, 17 Jun 2026 01:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZfIY-0003Nd-32; Wed, 17 Jun 2026 01:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1339787;
 Wed, 17 Jun 2026 01:42:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wZfIW-0003NX-Da
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 01:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZfIV-005awm-2u
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 03:42:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a31fb40-2eae-0a2a0a5409dd-0a2a45069c06-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 03:42:31 +0200
Received: from [209.85.160.179] (helo=mail-qt1-f179.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a31fb86-7371-0a2a45060019-d155a0b3ace5-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 03:42:30 +0200
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-51788280e71so57026611cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 18:42:30 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net.
 [68.48.65.54]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-517fb7ec47asm156567221cf.24.2026.06.16.18.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 18:42:28 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781660549; x=1782265349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ltgoW4HzxXM53BHwLsRBi+lA49LaXw3fkOJPn5XnrI=;
        b=cLm4GRJ4dh+7ZFGrDnHjMYdjSucuxsQzNaGr1yo/JKnD+YsGwvDYRo6Qfgz3qQi1Ok
         FVbW/YTqUIl1P7wUazU/pwEDxuNjs1SRZNIEOWzqC1XcmDBkiZ7rWIQ1aRwGhKsc6JRu
         PTHvJ++qv/mIokIQjYu85hfst7L/ti8TkDw5Yvl4kWk56Skqf0Q19YR4rYKvQegevKNG
         FV2OuCV3A3E2VDz98o+q9k+0uTRBBx4l11G0FTsXMjqnNqGFFLBiqpMuXMS8tnFxFhiF
         blgVWXiTjEM3ONEVNv3NRs5Kd0Hb65lpdSA/n5XD29pVlQJV0AbutTESiS5GC+MNVe1L
         ZNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781660549; x=1782265349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ltgoW4HzxXM53BHwLsRBi+lA49LaXw3fkOJPn5XnrI=;
        b=WICS0pbbS1er5r+puET4zNcObbDVfmizDY1/tluzDYEZjIoMjl8iPOlhQq70q/hiym
         CZiXlZyB4oxErd+Rat+M0uyX1heK+AETR/Vuxy/w3sh1EhJjMl/vj9rV0hltMkSbCjjo
         yZIAgj52KNF+AoRSBPrR6lJRFEoMqnsm6ut9uhSXxonisYaz5lV6yt5CFUZdgteCFDKg
         51v95OwwMkDogCzrJnuaUFySWS0+65I3b2UO99N0dW3D1DHJNOY1klOeWGRfgf6yxVVA
         kB8Sy5xUHt7m3TjYCILK1IlkDmgOHoCdX/SbbjYOOQpc9ZJQV/MBUlAYFjeIYxJl6D+l
         zSVA==
X-Gm-Message-State: AOJu0YyZv+ICB4h1Na4+wRrdZEqPZ9XZ/TDO+WQ4o4Zee3ahoPnfRQrv
	BHJRL9fBrCgy5oMlRKnJKb04wAroercrM2ngOkjPjInbjRQx2jadruNl
X-Gm-Gg: Acq92OGHrJiJ9HbACWqRO6IatKL/fB2err3C6I26EewZdKRrO7tvN2oxtlcmVDj3h3c
	GS2y9Y417xYDODGYCBxly2jort4HAUdGb2kAy7c1onTdT1NZzk1uFzPjM34WwIFRNlTaEtjl4j9
	z4MpYEijPi1eLemFcTYJ8WObwgj8A7gGyOuhvKLxorIe5EXvQN8/F7/I0yjTEzi8pUPoGR4gYeM
	+BWMJGFLcStB4R6lIXYrZ58DD9ETnbrV/ooDY21OL7OXiHC9OdduQN7WV/rLJy3TfAwu5CQgzZf
	v+aedyTAqvrAGMrnIAYTtMlaYAd//kWZFxEmZW0KWHmGxzsdTj4SyMMq87VqfaRD8/hgunsHPmb
	zfO65W/w47fN6x/GpWUtmkTAg9QEAhTKFqf1M28B/z1Pc5nAc6k0m5Kk+T4qoyjCLqVApnsY9Qp
	i8dt6lvJK903IR/qx2ZrttH1s6Ho6qFa6zCq8NBH8h4rJGxz0n8EeTNU8VOq3JNied22HvQSFrQ
	26mqz0EHBw4F+/n3uTgajUmg/5gk7Gu
X-Received: by 2002:a05:622a:56cc:b0:517:6350:ed50 with SMTP id d75a77b69052e-519a8faa207mr25326481cf.45.1781660549330;
        Tue, 16 Jun 2026 18:42:29 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] xen/pvcalls: bound backend response req_id before indexing rsp[]
Date: Tue, 16 Jun 2026 21:41:49 -0400
Message-ID: <20260617014149.2647404-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610114137.3749027-1-michael.bommarito@gmail.com>
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781660551-87D7AD75-0B6B2B87/0/0
X-purgate-type: clean
X-purgate-size: 8757
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 572C5695FCE

pvcalls_front_event_handler() takes req_id directly from the
backend-supplied ring response and uses it to index the fixed-size
bedata->rsp[] array for a memcpy() and a store, with no range check. A
malicious or buggy backend can set req_id past PVCALLS_NR_RSP_PER_RING
and drive an out-of-bounds write past the bedata allocation.

req_id was also declared int while the wire field rsp->req_id is u32, so
a range check on the signed value alone is insufficient: a backend
req_id of 0xffffffff becomes -1, passes a >= PVCALLS_NR_RSP_PER_RING
test and indexes bedata->rsp[-1]. Declare req_id as u32 so a single
bound covers both ends.

A backend that sends an out-of-range req_id has violated the wire
protocol, so rather than silently dropping the response, log once and
stop trusting the backend: set bedata->disabled. The event handler then
ignores further responses, and the request paths that wait for a
response return -EIO instead of blocking forever. This mirrors the
fatal-error handling xen-netback uses (xenvif_fatal_tx_err()).

The pvcalls frontend currently trusts its backend, so this is not a
classic-Xen security issue, but it matters for hardening PV frontends
against malicious backends (confidential and disaggregated deployments).

Fixes: 2195046bfd69 ("xen/pvcalls: implement socket command and handle events")
Suggested-by: Juergen Gross <jgross@suse.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2: per Juergen Gross's review
    (https://lore.kernel.org/all/ecb43fc6-e821-4532-9f75-06c86a6ac76c@suse.com/):
    - Log the out-of-range req_id once with pr_err_once() instead of
      silently dropping the response.
    - Stop trusting the backend on a protocol violation: set
      bedata->disabled so the event handler ignores further responses and
      the request paths waiting for a response return -EIO instead of
      blocking forever, following the xen-netback xenvif_fatal_tx_err()
      pattern you pointed to.
    - Declare req_id as u32 (was int) so a single bound covers both ends.
    - pvcalls_front_accept() has a second waiter (a concurrent accept
      blocked on PVCALLS_FLAG_ACCEPT_INFLIGHT). On the disabled path,
      clear that flag and wake inflight_accept_req so the queued accept
      also returns -EIO rather than waiting for a response that the
      disabled handler will never deliver.
    - Corrected the Fixes: tag to 2195046bfd69, the commit that
      introduced the unbounded bedata->rsp[req_id] indexing in the event
      handler; the previously cited 235a71c53903 (release command) only
      added a waiter and is a descendant.
    v1: https://lore.kernel.org/all/20260610114137.3749027-1-michael.bommarito@gmail.com/

 drivers/xen/pvcalls-front.c | 88 ++++++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 12 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 50ce4820f7eeb..3e7aa807c3173 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -32,6 +32,7 @@ struct pvcalls_bedata {
 	struct xen_pvcalls_front_ring ring;
 	grant_ref_t ref;
 	int irq;
+	bool disabled;
 
 	struct list_head socket_mappings;
 	spinlock_t socket_lock;
@@ -131,6 +132,20 @@ static inline int get_request(struct pvcalls_bedata *bedata, int *req_id)
 	return 0;
 }
 
+/*
+ * Wait for the backend's response to req_id, or for the frontend to be
+ * disabled because the backend violated the wire protocol. Returns 0 once
+ * the response has arrived, or -EIO if the frontend was disabled.
+ */
+static int pvcalls_front_wait_rsp(struct pvcalls_bedata *bedata, u32 req_id)
+{
+	wait_event(bedata->inflight_req,
+		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id ||
+		   READ_ONCE(bedata->disabled));
+
+	return READ_ONCE(bedata->disabled) ? -EIO : 0;
+}
+
 static bool pvcalls_front_write_todo(struct sock_mapping *map)
 {
 	struct pvcalls_data_intf *intf = map->active.ring;
@@ -168,7 +183,8 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 	struct pvcalls_bedata *bedata;
 	struct xen_pvcalls_response *rsp;
 	uint8_t *src, *dst;
-	int req_id = 0, more = 0, done = 0;
+	u32 req_id = 0;
+	int more = 0, done = 0;
 
 	if (dev == NULL)
 		return IRQ_HANDLED;
@@ -179,12 +195,31 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 		pvcalls_exit();
 		return IRQ_HANDLED;
 	}
+	if (READ_ONCE(bedata->disabled)) {
+		pvcalls_exit();
+		return IRQ_HANDLED;
+	}
 
 again:
 	while (RING_HAS_UNCONSUMED_RESPONSES(&bedata->ring)) {
 		rsp = RING_GET_RESPONSE(&bedata->ring, bedata->ring.rsp_cons);
 
 		req_id = rsp->req_id;
+		if (req_id >= PVCALLS_NR_RSP_PER_RING) {
+			/*
+			 * The backend supplied a req_id that would index
+			 * bedata->rsp[] out of bounds: a protocol violation
+			 * from a malicious or buggy backend. Log once, stop
+			 * trusting this backend and disable the frontend rather
+			 * than silently dropping the response and continuing.
+			 */
+			pr_err_once("pvcalls: backend sent out-of-range req_id %u, disabling frontend\n",
+				    req_id);
+			WRITE_ONCE(bedata->disabled, true);
+			bedata->ring.rsp_cons++;
+			done = 1;
+			break;
+		}
 		if (rsp->cmd == PVCALLS_POLL) {
 			struct sock_mapping *map = (struct sock_mapping *)(uintptr_t)
 						   rsp->u.poll.id;
@@ -217,7 +252,7 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 	}
 
 	RING_FINAL_CHECK_FOR_RESPONSES(&bedata->ring, more);
-	if (more)
+	if (more && !READ_ONCE(bedata->disabled))
 		goto again;
 	if (done)
 		wake_up(&bedata->inflight_req);
@@ -330,8 +365,11 @@ int pvcalls_front_socket(struct socket *sock)
 	if (notify)
 		notify_remote_via_irq(bedata->irq);
 
-	wait_event(bedata->inflight_req,
-		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id);
+	ret = pvcalls_front_wait_rsp(bedata, req_id);
+	if (ret) {
+		pvcalls_exit();
+		return ret;
+	}
 
 	/* read req_id, then the content */
 	smp_rmb();
@@ -477,8 +515,11 @@ int pvcalls_front_connect(struct socket *sock, struct sockaddr *addr,
 	if (notify)
 		notify_remote_via_irq(bedata->irq);
 
-	wait_event(bedata->inflight_req,
-		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id);
+	ret = pvcalls_front_wait_rsp(bedata, req_id);
+	if (ret) {
+		pvcalls_exit_sock(sock);
+		return ret;
+	}
 
 	/* read req_id, then the content */
 	smp_rmb();
@@ -711,8 +752,11 @@ int pvcalls_front_bind(struct socket *sock, struct sockaddr *addr, int addr_len)
 	if (notify)
 		notify_remote_via_irq(bedata->irq);
 
-	wait_event(bedata->inflight_req,
-		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id);
+	ret = pvcalls_front_wait_rsp(bedata, req_id);
+	if (ret) {
+		pvcalls_exit_sock(sock);
+		return ret;
+	}
 
 	/* read req_id, then the content */
 	smp_rmb();
@@ -761,8 +805,11 @@ int pvcalls_front_listen(struct socket *sock, int backlog)
 	if (notify)
 		notify_remote_via_irq(bedata->irq);
 
-	wait_event(bedata->inflight_req,
-		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id);
+	ret = pvcalls_front_wait_rsp(bedata, req_id);
+	if (ret) {
+		pvcalls_exit_sock(sock);
+		return ret;
+	}
 
 	/* read req_id, then the content */
 	smp_rmb();
@@ -820,6 +867,14 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
 		}
 	}
 
+	if (READ_ONCE(bedata->disabled)) {
+		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
+			  (void *)&map->passive.flags);
+		wake_up(&map->passive.inflight_accept_req);
+		pvcalls_exit_sock(sock);
+		return -EIO;
+	}
+
 	map2 = kzalloc_obj(*map2);
 	if (map2 == NULL) {
 		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
@@ -880,10 +935,18 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
 	}
 
 	if (wait_event_interruptible(bedata->inflight_req,
-		READ_ONCE(bedata->rsp[req_id].req_id) == req_id)) {
+		READ_ONCE(bedata->rsp[req_id].req_id) == req_id ||
+		READ_ONCE(bedata->disabled))) {
 		pvcalls_exit_sock(sock);
 		return -EINTR;
 	}
+	if (READ_ONCE(bedata->disabled)) {
+		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
+			  (void *)&map->passive.flags);
+		wake_up(&map->passive.inflight_accept_req);
+		pvcalls_exit_sock(sock);
+		return -EIO;
+	}
 	/* read req_id, then the content */
 	smp_rmb();
 
@@ -1054,7 +1117,8 @@ int pvcalls_front_release(struct socket *sock)
 		notify_remote_via_irq(bedata->irq);
 
 	wait_event(bedata->inflight_req,
-		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id);
+		   READ_ONCE(bedata->rsp[req_id].req_id) == req_id ||
+		   READ_ONCE(bedata->disabled));
 
 	if (map->active_socket) {
 		/*
-- 
2.53.0


