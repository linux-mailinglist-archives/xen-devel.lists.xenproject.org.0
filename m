Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AA512D6B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316086.534853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxx-0004no-PD; Thu, 28 Apr 2022 07:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316086.534853; Thu, 28 Apr 2022 07:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxx-0004hU-K0; Thu, 28 Apr 2022 07:53:33 +0000
Received: by outflank-mailman (input) for mailman id 316086;
 Thu, 28 Apr 2022 07:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njyxv-0003jr-I6
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:53:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4c4aef-c6c8-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:53:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 410E81F88C;
 Thu, 28 Apr 2022 07:53:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0412813AF8;
 Thu, 28 Apr 2022 07:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGFaO/dHamIoHAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 07:53:27 +0000
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
X-Inumbo-ID: 4a4c4aef-c6c8-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651132408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQy1x+fRNHgv0+hbA7kZO4avv6jlEcwjeAC24DRrSzI=;
	b=aT2gbQ4cLusb6bFR/NVvfh2fUPPiBfScImg4BQauGsfXBe4tL9IvgxoXAd1IB/RhKzgOdZ
	sJJ8KvFn5k04VCyST136HD4Mo7vqC1tdff9LRZ+bWfwxN0JB29OJLWU0Fim4lB8nn62eQK
	x71dMrdYjnsr0/Cra1B4XnCmpFJ8P8E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 4/4] xen/scsifront: harden driver against malicious backend
Date: Thu, 28 Apr 2022 09:53:23 +0200
Message-Id: <20220428075323.12853-5-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428075323.12853-1-jgross@suse.com>
References: <20220428075323.12853-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of relying on a well behaved PV scsi backend verify all meta
data received from the backend and avoid multiple reads of the same
data from the shared ring page.

In case any illegal data from the backend is detected switch the
PV device to a new "error" state and deactivate it for further use.

Use the "lateeoi" variant for the event channel in order to avoid
event storms blocking the guest.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- only remove spurious flag from eoiflag (Boris Ostrovsky)
---
 drivers/scsi/xen-scsifront.c | 104 +++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 8511bfc62963..56173beecbc6 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -83,6 +83,8 @@ struct vscsifrnt_shadow {
 	uint16_t rqid;
 	uint16_t ref_rqid;
 
+	bool inflight;
+
 	unsigned int nr_grants;		/* number of grants in gref[] */
 	struct scsiif_request_segment *sg;	/* scatter/gather elements */
 	struct scsiif_request_segment seg[VSCSIIF_SG_TABLESIZE];
@@ -104,7 +106,11 @@ struct vscsifrnt_info {
 	struct xenbus_device *dev;
 
 	struct Scsi_Host *host;
-	int host_active;
+	enum {
+		STATE_INACTIVE,
+		STATE_ACTIVE,
+		STATE_ERROR
+	}  host_active;
 
 	unsigned int evtchn;
 	unsigned int irq;
@@ -217,6 +223,8 @@ static int scsifront_do_request(struct vscsifrnt_info *info,
 	for (i = 0; i < (shadow->nr_segments & ~VSCSIIF_SG_GRANT); i++)
 		ring_req->seg[i] = shadow->seg[i];
 
+	shadow->inflight = true;
+
 	RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(ring, notify);
 	if (notify)
 		notify_remote_via_irq(info->irq);
@@ -224,6 +232,13 @@ static int scsifront_do_request(struct vscsifrnt_info *info,
 	return 0;
 }
 
+static void scsifront_set_error(struct vscsifrnt_info *info, const char *msg)
+{
+	shost_printk(KERN_ERR, info->host, KBUILD_MODNAME "%s\n"
+		     "Disabling device for further use\n", msg);
+	info->host_active = STATE_ERROR;
+}
+
 static void scsifront_gnttab_done(struct vscsifrnt_info *info,
 				  struct vscsifrnt_shadow *shadow)
 {
@@ -234,9 +249,8 @@ static void scsifront_gnttab_done(struct vscsifrnt_info *info,
 
 	for (i = 0; i < shadow->nr_grants; i++) {
 		if (unlikely(!gnttab_try_end_foreign_access(shadow->gref[i]))) {
-			shost_printk(KERN_ALERT, info->host, KBUILD_MODNAME
-				     "grant still in use by backend\n");
-			BUG();
+			scsifront_set_error(info, "grant still in use by backend");
+			return;
 		}
 	}
 
@@ -308,6 +322,8 @@ static void scsifront_cdb_cmd_done(struct vscsifrnt_info *info,
 	BUG_ON(sc == NULL);
 
 	scsifront_gnttab_done(info, shadow);
+	if (info->host_active == STATE_ERROR)
+		return;
 	scsifront_put_rqid(info, id);
 
 	set_host_byte(sc, scsifront_host_byte(ring_rsp->rslt));
@@ -348,9 +364,7 @@ static void scsifront_sync_cmd_done(struct vscsifrnt_info *info,
 			scsifront_wake_up(info);
 		return;
 	default:
-		shost_printk(KERN_ERR, info->host, KBUILD_MODNAME
-			     "bad reset state %d, possibly leaking %u\n",
-			     shadow->rslt_reset, id);
+		scsifront_set_error(info, "bad reset state");
 		break;
 	}
 	spin_unlock_irqrestore(&info->shadow_lock, flags);
@@ -361,28 +375,41 @@ static void scsifront_sync_cmd_done(struct vscsifrnt_info *info,
 static void scsifront_do_response(struct vscsifrnt_info *info,
 				  struct vscsiif_response *ring_rsp)
 {
-	if (WARN(ring_rsp->rqid >= VSCSIIF_MAX_REQS ||
-		 test_bit(ring_rsp->rqid, info->shadow_free_bitmap),
-		 "illegal rqid %u returned by backend!\n", ring_rsp->rqid))
+	struct vscsifrnt_shadow *shadow;
+
+	if (ring_rsp->rqid >= VSCSIIF_MAX_REQS ||
+	    !info->shadow[ring_rsp->rqid]->inflight) {
+		scsifront_set_error(info, "illegal rqid returned by backend!");
 		return;
+	}
+	shadow = info->shadow[ring_rsp->rqid];
+	shadow->inflight = false;
 
-	if (info->shadow[ring_rsp->rqid]->act == VSCSIIF_ACT_SCSI_CDB)
+	if (shadow->act == VSCSIIF_ACT_SCSI_CDB)
 		scsifront_cdb_cmd_done(info, ring_rsp);
 	else
 		scsifront_sync_cmd_done(info, ring_rsp);
 }
 
-static int scsifront_ring_drain(struct vscsifrnt_info *info)
+static int scsifront_ring_drain(struct vscsifrnt_info *info,
+				unsigned int *eoiflag)
 {
-	struct vscsiif_response *ring_rsp;
+	struct vscsiif_response ring_rsp;
 	RING_IDX i, rp;
 	int more_to_do = 0;
 
-	rp = info->ring.sring->rsp_prod;
-	rmb();	/* ordering required respective to dom0 */
+	rp = READ_ONCE(info->ring.sring->rsp_prod);
+	virt_rmb();	/* ordering required respective to backend */
+	if (RING_RESPONSE_PROD_OVERFLOW(&info->ring, rp)) {
+		scsifront_set_error(info, "illegal number of responses");
+		return 0;
+	}
 	for (i = info->ring.rsp_cons; i != rp; i++) {
-		ring_rsp = RING_GET_RESPONSE(&info->ring, i);
-		scsifront_do_response(info, ring_rsp);
+		RING_COPY_RESPONSE(&info->ring, i, &ring_rsp);
+		scsifront_do_response(info, &ring_rsp);
+		if (info->host_active == STATE_ERROR)
+			return 0;
+		*eoiflag &= ~XEN_EOI_FLAG_SPURIOUS;
 	}
 
 	info->ring.rsp_cons = i;
@@ -395,14 +422,15 @@ static int scsifront_ring_drain(struct vscsifrnt_info *info)
 	return more_to_do;
 }
 
-static int scsifront_cmd_done(struct vscsifrnt_info *info)
+static int scsifront_cmd_done(struct vscsifrnt_info *info,
+			      unsigned int *eoiflag)
 {
 	int more_to_do;
 	unsigned long flags;
 
 	spin_lock_irqsave(info->host->host_lock, flags);
 
-	more_to_do = scsifront_ring_drain(info);
+	more_to_do = scsifront_ring_drain(info, eoiflag);
 
 	info->wait_ring_available = 0;
 
@@ -416,20 +444,28 @@ static int scsifront_cmd_done(struct vscsifrnt_info *info)
 static irqreturn_t scsifront_irq_fn(int irq, void *dev_id)
 {
 	struct vscsifrnt_info *info = dev_id;
+	unsigned int eoiflag = XEN_EOI_FLAG_SPURIOUS;
+
+	if (info->host_active == STATE_ERROR) {
+		xen_irq_lateeoi(irq, XEN_EOI_FLAG_SPURIOUS);
+		return IRQ_HANDLED;
+	}
 
-	while (scsifront_cmd_done(info))
+	while (scsifront_cmd_done(info, &eoiflag))
 		/* Yield point for this unbounded loop. */
 		cond_resched();
 
+	xen_irq_lateeoi(irq, eoiflag);
+
 	return IRQ_HANDLED;
 }
 
 static void scsifront_finish_all(struct vscsifrnt_info *info)
 {
-	unsigned i;
+	unsigned int i, dummy;
 	struct vscsiif_response resp;
 
-	scsifront_ring_drain(info);
+	scsifront_ring_drain(info, &dummy);
 
 	for (i = 0; i < VSCSIIF_MAX_REQS; i++) {
 		if (test_bit(i, info->shadow_free_bitmap))
@@ -586,6 +622,9 @@ static int scsifront_queuecommand(struct Scsi_Host *shost,
 	unsigned long flags;
 	int err;
 
+	if (info->host_active == STATE_ERROR)
+		return SCSI_MLQUEUE_HOST_BUSY;
+
 	sc->result = 0;
 
 	shadow->sc  = sc;
@@ -638,6 +677,9 @@ static int scsifront_action_handler(struct scsi_cmnd *sc, uint8_t act)
 	struct vscsifrnt_shadow *shadow, *s = scsi_cmd_priv(sc);
 	int err = 0;
 
+	if (info->host_active == STATE_ERROR)
+		return FAILED;
+
 	shadow = kzalloc(sizeof(*shadow), GFP_NOIO);
 	if (!shadow)
 		return FAILED;
@@ -709,6 +751,9 @@ static int scsifront_sdev_configure(struct scsi_device *sdev)
 	struct vscsifrnt_info *info = shost_priv(sdev->host);
 	int err;
 
+	if (info->host_active == STATE_ERROR)
+		return -EIO;
+
 	if (info && current == info->curr) {
 		err = xenbus_printf(XBT_NIL, info->dev->nodename,
 			      info->dev_state_path, "%d", XenbusStateConnected);
@@ -784,7 +829,7 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 		goto free_gnttab;
 	}
 
-	err = bind_evtchn_to_irq(info->evtchn);
+	err = bind_evtchn_to_irq_lateeoi(info->evtchn);
 	if (err <= 0) {
 		xenbus_dev_fatal(dev, err, "bind_evtchn_to_irq");
 		goto free_gnttab;
@@ -914,7 +959,7 @@ static int scsifront_probe(struct xenbus_device *dev,
 		goto free_sring;
 	}
 	info->host = host;
-	info->host_active = 1;
+	info->host_active = STATE_ACTIVE;
 
 	xenbus_switch_state(dev, XenbusStateInitialised);
 
@@ -982,10 +1027,10 @@ static int scsifront_remove(struct xenbus_device *dev)
 	pr_debug("%s: %s removed\n", __func__, dev->nodename);
 
 	mutex_lock(&scsifront_mutex);
-	if (info->host_active) {
+	if (info->host_active != STATE_INACTIVE) {
 		/* Scsi_host not yet removed */
 		scsi_remove_host(info->host);
-		info->host_active = 0;
+		info->host_active = STATE_INACTIVE;
 	}
 	mutex_unlock(&scsifront_mutex);
 
@@ -1009,9 +1054,9 @@ static void scsifront_disconnect(struct vscsifrnt_info *info)
 	 */
 
 	mutex_lock(&scsifront_mutex);
-	if (info->host_active) {
+	if (info->host_active != STATE_INACTIVE) {
 		scsi_remove_host(host);
-		info->host_active = 0;
+		info->host_active = STATE_INACTIVE;
 	}
 	mutex_unlock(&scsifront_mutex);
 
@@ -1029,6 +1074,9 @@ static void scsifront_do_lun_hotplug(struct vscsifrnt_info *info, int op)
 	unsigned int hst, chn, tgt, lun;
 	struct scsi_device *sdev;
 
+	if (info->host_active == STATE_ERROR)
+		return;
+
 	dir = xenbus_directory(XBT_NIL, dev->otherend, "vscsi-devs", &dir_n);
 	if (IS_ERR(dir))
 		return;
-- 
2.34.1


