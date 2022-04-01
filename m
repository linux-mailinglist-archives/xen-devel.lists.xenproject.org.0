Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031504EF042
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297425.506665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIKF-0003Fc-DN; Fri, 01 Apr 2022 14:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297425.506665; Fri, 01 Apr 2022 14:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIKF-0003Cz-AR; Fri, 01 Apr 2022 14:32:31 +0000
Received: by outflank-mailman (input) for mailman id 297425;
 Fri, 01 Apr 2022 14:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=efvt=UL=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1naIKE-0003Ct-4X
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:32:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d11db65-b1c8-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:32:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96DEA61C50;
 Fri,  1 Apr 2022 14:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9B1C340EE;
 Fri,  1 Apr 2022 14:32:24 +0000 (UTC)
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
X-Inumbo-ID: 8d11db65-b1c8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648823545;
	bh=Vj4CtnGKUb63FsBPnORkP2HBgGUmnUAO7NFD8yaKwPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V9IoOOs4KK52b4HhNDRbajUpbkYDeEdjV06oDnl+DNMpRDkqplrmD3W08F4YED9VJ
	 jAfuZ8Y5mMbhfaAkDbUkzs2IMwfQ+hiv5EvUcurk2/Z6wEEZ/B/0zE1YZ5kLRRWdQZ
	 pV7Ogtr2y30/t5j9S9mgHCcO7jrYqzIRuJehDKNsn5qT5b9lBstZCfQoohJh/jxQfa
	 Hgbtvy7ZAUoW1XsDEpX0uUZZLiV/0WBINwWi+TvLx26u1gqjUwm71rFe0fuIrixSVF
	 1qFpRIhj7M0B0xcz9T10BIjWYst1pFoom8K4xhYUtnQW680IlME24TWP4xZRWOekSK
	 PbqunJ1zeLkHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 137/149] xen/usb: harden xen_hcd against malicious backends
Date: Fri,  1 Apr 2022 10:25:24 -0400
Message-Id: <20220401142536.1948161-137-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit aff477cb8f94613f501d386d10f20019e294bc35 ]

Make sure a malicious backend can't cause any harm other than wrong
I/O data.

Missing are verification of the request id in a response, sanitizing
the reported actual I/O length, and protection against interrupt storms
from the backend.

Signed-off-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20220311103509.12908-1-jgross@suse.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xen-hcd.c | 57 ++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 19b8c7ed74cb..4ed3ee328a4a 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -51,6 +51,7 @@ struct vdevice_status {
 struct usb_shadow {
 	struct xenusb_urb_request req;
 	struct urb *urb;
+	bool in_flight;
 };
 
 struct xenhcd_info {
@@ -722,6 +723,12 @@ static void xenhcd_gnttab_done(struct xenhcd_info *info, unsigned int id)
 	int nr_segs = 0;
 	int i;
 
+	if (!shadow->in_flight) {
+		xenhcd_set_error(info, "Illegal request id");
+		return;
+	}
+	shadow->in_flight = false;
+
 	nr_segs = shadow->req.nr_buffer_segs;
 
 	if (xenusb_pipeisoc(shadow->req.pipe))
@@ -805,6 +812,7 @@ static int xenhcd_do_request(struct xenhcd_info *info, struct urb_priv *urbp)
 
 	info->urb_ring.req_prod_pvt++;
 	info->shadow[id].urb = urb;
+	info->shadow[id].in_flight = true;
 
 	RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(&info->urb_ring, notify);
 	if (notify)
@@ -933,10 +941,27 @@ static int xenhcd_unlink_urb(struct xenhcd_info *info, struct urb_priv *urbp)
 	return ret;
 }
 
-static int xenhcd_urb_request_done(struct xenhcd_info *info)
+static void xenhcd_res_to_urb(struct xenhcd_info *info,
+			      struct xenusb_urb_response *res, struct urb *urb)
+{
+	if (unlikely(!urb))
+		return;
+
+	if (res->actual_length > urb->transfer_buffer_length)
+		urb->actual_length = urb->transfer_buffer_length;
+	else if (res->actual_length < 0)
+		urb->actual_length = 0;
+	else
+		urb->actual_length = res->actual_length;
+	urb->error_count = res->error_count;
+	urb->start_frame = res->start_frame;
+	xenhcd_giveback_urb(info, urb, res->status);
+}
+
+static int xenhcd_urb_request_done(struct xenhcd_info *info,
+				   unsigned int *eoiflag)
 {
 	struct xenusb_urb_response res;
-	struct urb *urb;
 	RING_IDX i, rp;
 	__u16 id;
 	int more_to_do = 0;
@@ -963,16 +988,12 @@ static int xenhcd_urb_request_done(struct xenhcd_info *info)
 			xenhcd_gnttab_done(info, id);
 			if (info->error)
 				goto err;
-			urb = info->shadow[id].urb;
-			if (likely(urb)) {
-				urb->actual_length = res.actual_length;
-				urb->error_count = res.error_count;
-				urb->start_frame = res.start_frame;
-				xenhcd_giveback_urb(info, urb, res.status);
-			}
+			xenhcd_res_to_urb(info, &res, info->shadow[id].urb);
 		}
 
 		xenhcd_add_id_to_freelist(info, id);
+
+		*eoiflag = 0;
 	}
 	info->urb_ring.rsp_cons = i;
 
@@ -990,7 +1011,7 @@ static int xenhcd_urb_request_done(struct xenhcd_info *info)
 	return 0;
 }
 
-static int xenhcd_conn_notify(struct xenhcd_info *info)
+static int xenhcd_conn_notify(struct xenhcd_info *info, unsigned int *eoiflag)
 {
 	struct xenusb_conn_response res;
 	struct xenusb_conn_request *req;
@@ -1035,6 +1056,8 @@ static int xenhcd_conn_notify(struct xenhcd_info *info)
 				       info->conn_ring.req_prod_pvt);
 		req->id = id;
 		info->conn_ring.req_prod_pvt++;
+
+		*eoiflag = 0;
 	}
 
 	if (rc != info->conn_ring.req_prod_pvt)
@@ -1057,14 +1080,19 @@ static int xenhcd_conn_notify(struct xenhcd_info *info)
 static irqreturn_t xenhcd_int(int irq, void *dev_id)
 {
 	struct xenhcd_info *info = (struct xenhcd_info *)dev_id;
+	unsigned int eoiflag = XEN_EOI_FLAG_SPURIOUS;
 
-	if (unlikely(info->error))
+	if (unlikely(info->error)) {
+		xen_irq_lateeoi(irq, XEN_EOI_FLAG_SPURIOUS);
 		return IRQ_HANDLED;
+	}
 
-	while (xenhcd_urb_request_done(info) | xenhcd_conn_notify(info))
+	while (xenhcd_urb_request_done(info, &eoiflag) |
+	       xenhcd_conn_notify(info, &eoiflag))
 		/* Yield point for this unbounded loop. */
 		cond_resched();
 
+	xen_irq_lateeoi(irq, eoiflag);
 	return IRQ_HANDLED;
 }
 
@@ -1141,9 +1169,9 @@ static int xenhcd_setup_rings(struct xenbus_device *dev,
 		goto fail;
 	}
 
-	err = bind_evtchn_to_irq(info->evtchn);
+	err = bind_evtchn_to_irq_lateeoi(info->evtchn);
 	if (err <= 0) {
-		xenbus_dev_fatal(dev, err, "bind_evtchn_to_irq");
+		xenbus_dev_fatal(dev, err, "bind_evtchn_to_irq_lateeoi");
 		goto fail;
 	}
 
@@ -1496,6 +1524,7 @@ static struct usb_hcd *xenhcd_create_hcd(struct xenbus_device *dev)
 	for (i = 0; i < XENUSB_URB_RING_SIZE; i++) {
 		info->shadow[i].req.id = i + 1;
 		info->shadow[i].urb = NULL;
+		info->shadow[i].in_flight = false;
 	}
 	info->shadow[XENUSB_URB_RING_SIZE - 1].req.id = 0x0fff;
 
-- 
2.34.1


