Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96935084E8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 11:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309039.525040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6aD-0002VC-Mp; Wed, 20 Apr 2022 09:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309039.525040; Wed, 20 Apr 2022 09:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6aD-0002Rq-IS; Wed, 20 Apr 2022 09:25:09 +0000
Received: by outflank-mailman (input) for mailman id 309039;
 Wed, 20 Apr 2022 09:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh6aB-0002RO-Q4
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 09:25:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c42c7fe7-c08b-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 11:25:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 769D91F74E;
 Wed, 20 Apr 2022 09:25:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4677713A30;
 Wed, 20 Apr 2022 09:25:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ABXbD3LRX2J1EAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 09:25:06 +0000
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
X-Inumbo-ID: c42c7fe7-c08b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650446706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzGetu5Tlsv3I1MPmAuHS095rYfTokF5Upsuqhfi0HI=;
	b=toj9BqkiPlCcY7+VyibAoCPmzx/uqduINcjBtzYxO3TFOynfH+Hknsj6Htl4g5SF7U2fsu
	5NLA8e/D6n3fowkQNmFgp9et23oeIHAQokKiihK+SpcwXu+G9yXNZU8Qx1u0++tIVqIs+V
	l/m6a2PcEn8UTAsRpUKtAQiBpWb/RCE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/4] xen/scsiback: use new command result macros
Date: Wed, 20 Apr 2022 11:25:01 +0200
Message-Id: <20220420092503.11123-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420092503.11123-1-jgross@suse.com>
References: <20220420092503.11123-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using the kernel's values for the result of PV scsi
operations use the values of the interface definition.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-scsiback.c | 82 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 0c5e565aa8cf..673dd73844ff 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -280,6 +280,82 @@ static void scsiback_free_translation_entry(struct kref *kref)
 	kfree(entry);
 }
 
+static int32_t scsiback_result(int32_t result)
+{
+	int32_t host_status;
+
+	switch (result >> 16) {
+	case DID_OK:
+		host_status = XEN_VSCSIIF_RSLT_HOST_OK;
+		break;
+	case DID_NO_CONNECT:
+		host_status = XEN_VSCSIIF_RSLT_HOST_NO_CONNECT;
+		break;
+	case DID_BUS_BUSY:
+		host_status = XEN_VSCSIIF_RSLT_HOST_BUS_BUSY;
+		break;
+	case DID_TIME_OUT:
+		host_status = XEN_VSCSIIF_RSLT_HOST_TIME_OUT;
+		break;
+	case DID_BAD_TARGET:
+		host_status = XEN_VSCSIIF_RSLT_HOST_BAD_TARGET;
+		break;
+	case DID_ABORT:
+		host_status = XEN_VSCSIIF_RSLT_HOST_ABORT;
+		break;
+	case DID_PARITY:
+		host_status = XEN_VSCSIIF_RSLT_HOST_PARITY;
+		break;
+	case DID_ERROR:
+		host_status = XEN_VSCSIIF_RSLT_HOST_ERROR;
+		break;
+	case DID_RESET:
+		host_status = XEN_VSCSIIF_RSLT_HOST_RESET;
+		break;
+	case DID_BAD_INTR:
+		host_status = XEN_VSCSIIF_RSLT_HOST_BAD_INTR;
+		break;
+	case DID_PASSTHROUGH:
+		host_status = XEN_VSCSIIF_RSLT_HOST_PASSTHROUGH;
+		break;
+	case DID_SOFT_ERROR:
+		host_status = XEN_VSCSIIF_RSLT_HOST_SOFT_ERROR;
+		break;
+	case DID_IMM_RETRY:
+		host_status = XEN_VSCSIIF_RSLT_HOST_IMM_RETRY;
+		break;
+	case DID_REQUEUE:
+		host_status = XEN_VSCSIIF_RSLT_HOST_REQUEUE;
+		break;
+	case DID_TRANSPORT_DISRUPTED:
+		host_status = XEN_VSCSIIF_RSLT_HOST_TRANSPORT_DISRUPTED;
+		break;
+	case DID_TRANSPORT_FAILFAST:
+		host_status = XEN_VSCSIIF_RSLT_HOST_TRANSPORT_FAILFAST;
+		break;
+	case DID_TARGET_FAILURE:
+		host_status = XEN_VSCSIIF_RSLT_HOST_TARGET_FAILURE;
+		break;
+	case DID_NEXUS_FAILURE:
+		host_status = XEN_VSCSIIF_RSLT_HOST_NEXUS_FAILURE;
+		break;
+	case DID_ALLOC_FAILURE:
+		host_status = XEN_VSCSIIF_RSLT_HOST_ALLOC_FAILURE;
+		break;
+	case DID_MEDIUM_ERROR:
+		host_status = XEN_VSCSIIF_RSLT_HOST_MEDIUM_ERROR;
+		break;
+	case DID_TRANSPORT_MARGINAL:
+		host_status = XEN_VSCSIIF_RSLT_HOST_TRANSPORT_MARGINAL;
+		break;
+	default:
+		host_status = XEN_VSCSIIF_RSLT_HOST_ERROR;
+		break;
+	}
+
+	return (host_status << 16) | (result & 0x00ff);
+}
+
 static void scsiback_send_response(struct vscsibk_info *info,
 			char *sense_buffer, int32_t result, uint32_t resid,
 			uint16_t rqid)
@@ -295,7 +371,7 @@ static void scsiback_send_response(struct vscsibk_info *info,
 	ring_res = RING_GET_RESPONSE(&info->ring, info->ring.rsp_prod_pvt);
 	info->ring.rsp_prod_pvt++;
 
-	ring_res->rslt   = result;
+	ring_res->rslt   = scsiback_result(result);
 	ring_res->rqid   = rqid;
 
 	if (sense_buffer != NULL &&
@@ -555,7 +631,7 @@ static void scsiback_device_action(struct vscsibk_pend *pending_req,
 	struct scsiback_nexus *nexus = tpg->tpg_nexus;
 	struct se_cmd *se_cmd = &pending_req->se_cmd;
 	u64 unpacked_lun = pending_req->v2p->lun;
-	int rc, err = FAILED;
+	int rc, err = XEN_VSCSIIF_RSLT_RESET_FAILED;
 
 	init_completion(&pending_req->tmr_done);
 
@@ -569,7 +645,7 @@ static void scsiback_device_action(struct vscsibk_pend *pending_req,
 	wait_for_completion(&pending_req->tmr_done);
 
 	err = (se_cmd->se_tmr_req->response == TMR_FUNCTION_COMPLETE) ?
-		SUCCESS : FAILED;
+		XEN_VSCSIIF_RSLT_RESET_SUCCESS : XEN_VSCSIIF_RSLT_RESET_FAILED;
 
 	scsiback_do_resp_with_sense(NULL, err, 0, pending_req);
 	transport_generic_free_cmd(&pending_req->se_cmd, 0);
-- 
2.34.1


