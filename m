Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D43512D6A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316084.534826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxv-00046f-Ri; Thu, 28 Apr 2022 07:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316084.534826; Thu, 28 Apr 2022 07:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxv-00042b-Mh; Thu, 28 Apr 2022 07:53:31 +0000
Received: by outflank-mailman (input) for mailman id 316084;
 Thu, 28 Apr 2022 07:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njyxt-0003jr-I3
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:53:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c964a4-c6c8-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:53:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F77A1F88A;
 Thu, 28 Apr 2022 07:53:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDA913AF8;
 Thu, 28 Apr 2022 07:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aAN4DfdHamIoHAAAMHmgww
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
X-Inumbo-ID: 49c964a4-c6c8-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651132407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZ3HQWGQIijrKpRTy/DK1bE6hLtaRKbTQP99RtUeXZU=;
	b=ECk+vYsxELyggamzu+fuy1Zg+vf3nxF8Xo8jfyaBEZ5MSiWoM3kjkusDS3n/hYiRHbrfRf
	Nf3kM6vz9MrZAUvcswEVd/h4c+g3zQxeLSzcaiBTOfK5cX0KozAVYCpMadi+hLPF/edAtj
	bo9+5HS5avOOL7Uemt9gJLBheTHiTYk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] xen: update vscsiif.h
Date: Thu, 28 Apr 2022 09:53:20 +0200
Message-Id: <20220428075323.12853-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428075323.12853-1-jgross@suse.com>
References: <20220428075323.12853-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update include/xen/interface/io/vscsiif.h to its newest version.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/xen/interface/io/vscsiif.h | 133 ++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 4 deletions(-)

diff --git a/include/xen/interface/io/vscsiif.h b/include/xen/interface/io/vscsiif.h
index 1f6047d3de44..7ea4dc9611c4 100644
--- a/include/xen/interface/io/vscsiif.h
+++ b/include/xen/interface/io/vscsiif.h
@@ -43,7 +43,7 @@
  *
  *      A string specifying the backend device: either a 4-tuple "h:c:t:l"
  *      (host, controller, target, lun, all integers), or a WWN (e.g.
- *      "naa.60014054ac780582").
+ *      "naa.60014054ac780582:0").
  *
  * v-dev
  *      Values:         string
@@ -87,6 +87,75 @@
  *      response structures.
  */
 
+/*
+ * Xenstore format in practice
+ * ===========================
+ *
+ * The backend driver uses a single_host:many_devices notation to manage domU
+ * devices. Everything is stored in /local/domain/<backend_domid>/backend/vscsi/.
+ * The xenstore layout looks like this (dom0 is assumed to be the backend_domid):
+ *
+ *     <domid>/<vhost>/feature-host = "0"
+ *     <domid>/<vhost>/frontend = "/local/domain/<domid>/device/vscsi/0"
+ *     <domid>/<vhost>/frontend-id = "<domid>"
+ *     <domid>/<vhost>/online = "1"
+ *     <domid>/<vhost>/state = "4"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/p-dev = "8:0:2:1" or "naa.wwn:lun"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/state = "4"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/v-dev = "0:0:0:0"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/p-dev = "8:0:2:2"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/state = "4"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/v-dev = "0:0:1:0"
+ *
+ * The frontend driver maintains its state in
+ * /local/domain/<domid>/device/vscsi/.
+ *
+ *     <vhost>/backend = "/local/domain/0/backend/vscsi/<domid>/<vhost>"
+ *     <vhost>/backend-id = "0"
+ *     <vhost>/event-channel = "20"
+ *     <vhost>/ring-ref = "43"
+ *     <vhost>/state = "4"
+ *     <vhost>/vscsi-devs/dev-0/state = "4"
+ *     <vhost>/vscsi-devs/dev-1/state = "4"
+ *
+ * In addition to the entries for backend and frontend these flags are stored
+ * for the toolstack:
+ *
+ *     <domid>/<vhost>/vscsi-devs/dev-1/p-devname = "/dev/$device"
+ *     <domid>/<vhost>/libxl_ctrl_index = "0"
+ *
+ *
+ * Backend/frontend protocol
+ * =========================
+ *
+ * To create a vhost along with a device:
+ *     <domid>/<vhost>/feature-host = "0"
+ *     <domid>/<vhost>/frontend = "/local/domain/<domid>/device/vscsi/0"
+ *     <domid>/<vhost>/frontend-id = "<domid>"
+ *     <domid>/<vhost>/online = "1"
+ *     <domid>/<vhost>/state = "1"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/p-dev = "8:0:2:1"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/state = "1"
+ *     <domid>/<vhost>/vscsi-devs/dev-0/v-dev = "0:0:0:0"
+ * Wait for <domid>/<vhost>/state + <domid>/<vhost>/vscsi-devs/dev-0/state become 4
+ *
+ * To add another device to a vhost:
+ *     <domid>/<vhost>/state = "7"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/p-dev = "8:0:2:2"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/state = "1"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/v-dev = "0:0:1:0"
+ * Wait for <domid>/<vhost>/state + <domid>/<vhost>/vscsi-devs/dev-1/state become 4
+ *
+ * To remove a device from a vhost:
+ *     <domid>/<vhost>/state = "7"
+ *     <domid>/<vhost>/vscsi-devs/dev-1/state = "5"
+ * Wait for <domid>/<vhost>/state to become 4
+ * Wait for <domid>/<vhost>/vscsi-devs/dev-1/state become 6
+ * Remove <domid>/<vhost>/vscsi-devs/dev-1/{state,p-dev,v-dev,p-devname}
+ * Remove <domid>/<vhost>/vscsi-devs/dev-1/
+ *
+ */
+
 /* Requests from the frontend to the backend */
 
 /*
@@ -117,7 +186,8 @@
  * (plus the set VSCSIIF_SG_GRANT bit), the number of scsiif_request_segment
  * elements referencing the target data buffers is calculated from the lengths
  * of the seg[] elements (the sum of all valid seg[].length divided by the
- * size of one scsiif_request_segment structure).
+ * size of one scsiif_request_segment structure). The frontend may use a mix of
+ * direct and indirect requests.
  */
 #define VSCSIIF_ACT_SCSI_CDB		1
 
@@ -154,12 +224,14 @@
 
 /*
  * based on Linux kernel 2.6.18, still valid
+ *
  * Changing these values requires support of multiple protocols via the rings
  * as "old clients" will blindly use these values and the resulting structure
  * sizes.
  */
 #define VSCSIIF_MAX_COMMAND_SIZE	16
 #define VSCSIIF_SENSE_BUFFERSIZE	96
+#define VSCSIIF_PAGE_SIZE		4096
 
 struct scsiif_request_segment {
 	grant_ref_t gref;
@@ -167,7 +239,8 @@ struct scsiif_request_segment {
 	uint16_t length;
 };
 
-#define VSCSIIF_SG_PER_PAGE (PAGE_SIZE / sizeof(struct scsiif_request_segment))
+#define VSCSIIF_SG_PER_PAGE	(VSCSIIF_PAGE_SIZE / \
+				 sizeof(struct scsiif_request_segment))
 
 /* Size of one request is 252 bytes */
 struct vscsiif_request {
@@ -207,6 +280,58 @@ struct vscsiif_response {
 	uint32_t reserved[36];
 };
 
+/* SCSI I/O status from vscsiif_response->rslt */
+#define XEN_VSCSIIF_RSLT_STATUS(x)  ((x) & 0x00ff)
+
+/* Host I/O status from vscsiif_response->rslt */
+#define XEN_VSCSIIF_RSLT_HOST(x)    (((x) & 0x00ff0000) >> 16)
+#define XEN_VSCSIIF_RSLT_HOST_OK                   0
+/* Couldn't connect before timeout */
+#define XEN_VSCSIIF_RSLT_HOST_NO_CONNECT           1
+/* Bus busy through timeout */
+#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY             2
+/* Timed out for other reason */
+#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT             3
+/* Bad target */
+#define XEN_VSCSIIF_RSLT_HOST_BAD_TARGET           4
+/* Abort for some other reason */
+#define XEN_VSCSIIF_RSLT_HOST_ABORT                5
+/* Parity error */
+#define XEN_VSCSIIF_RSLT_HOST_PARITY               6
+/* Internal error */
+#define XEN_VSCSIIF_RSLT_HOST_ERROR                7
+/* Reset by somebody */
+#define XEN_VSCSIIF_RSLT_HOST_RESET                8
+/* Unexpected interrupt */
+#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR             9
+/* Force command past mid-layer */
+#define XEN_VSCSIIF_RSLT_HOST_PASSTHROUGH         10
+/* Retry requested */
+#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERROR          11
+/* Hidden retry requested */
+#define XEN_VSCSIIF_RSLT_HOST_IMM_RETRY           12
+/* Requeue command requested */
+#define XEN_VSCSIIF_RSLT_HOST_REQUEUE             13
+/* Transport error disrupted I/O */
+#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_DISRUPTED 14
+/* Transport class fastfailed */
+#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_FAILFAST  15
+/* Permanent target failure */
+#define XEN_VSCSIIF_RSLT_HOST_TARGET_FAILURE      16
+/* Permanent nexus failure on path */
+#define XEN_VSCSIIF_RSLT_HOST_NEXUS_FAILURE       17
+/* Space allocation on device failed */
+#define XEN_VSCSIIF_RSLT_HOST_ALLOC_FAILURE       18
+/* Medium error */
+#define XEN_VSCSIIF_RSLT_HOST_MEDIUM_ERROR        19
+/* Transport marginal errors */
+#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_MARGINAL  20
+
+/* Result values of reset operations */
+#define XEN_VSCSIIF_RSLT_RESET_SUCCESS  0x2002
+#define XEN_VSCSIIF_RSLT_RESET_FAILED   0x2003
+
 DEFINE_RING_TYPES(vscsiif, struct vscsiif_request, struct vscsiif_response);
 
-#endif /*__XEN__PUBLIC_IO_SCSI_H__*/
+
+#endif  /*__XEN__PUBLIC_IO_SCSI_H__*/
-- 
2.34.1


