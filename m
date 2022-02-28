Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C74C6A33
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 12:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280435.478380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOe6r-0003Z5-3u; Mon, 28 Feb 2022 11:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280435.478380; Mon, 28 Feb 2022 11:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOe6r-0003Wj-0N; Mon, 28 Feb 2022 11:22:33 +0000
Received: by outflank-mailman (input) for mailman id 280435;
 Mon, 28 Feb 2022 11:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fISF=TL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nOe6p-0003Wb-AE
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 11:22:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b30f570a-9888-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 12:22:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8D7B1F894;
 Mon, 28 Feb 2022 11:22:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E0FC13BF2;
 Mon, 28 Feb 2022 11:22:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hQE6JXWwHGJXCwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 28 Feb 2022 11:22:29 +0000
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
X-Inumbo-ID: b30f570a-9888-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646047349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m7I5A173opEnfcDaFgzNXcoVpGQKDwm933aaAHHQBIg=;
	b=oXmlHk9EdajLlcNjlHupaNKu3FBZB35Y8RY8hCZYH8S9UW5Lp/xl9C+97NWSnKB8AtbEqz
	jI5vZg98fS7fZli3R3hI+BTJlhq/YkIPXJw3xLSbPeAqwuAMJnrRTMXZhU9Ofa4Vr7kMPU
	f3VE1akEbI0YQY28Luz7QWQEBhVbJ7M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] include/public: add command result definitions to vscsiif.h
Date: Mon, 28 Feb 2022 12:22:24 +0100
Message-Id: <20220228112224.18942-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result field of struct vscsiif_response is lacking a detailed
definition. Today the Linux kernel internal scsi definitions are being
used, which is not a sane interface for a PV device driver.

Add macros to change that by using today's values in the XEN namespace.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/vscsiif.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/include/public/io/vscsiif.h b/xen/include/public/io/vscsiif.h
index c9ceb1884d..17a9033b43 100644
--- a/xen/include/public/io/vscsiif.h
+++ b/xen/include/public/io/vscsiif.h
@@ -315,6 +315,33 @@ struct vscsiif_response {
 };
 typedef struct vscsiif_response vscsiif_response_t;
 
+/* SCSI I/O status from vscsiif_response->rslt */
+#define XEN_VSCSIIF_RSLT_STATUS(x)  (x & 0x00ff)
+
+/* Host I/O status from vscsiif_response->rslt */
+#define XEN_VSCSIIF_RSLT_HOST(x)    ((unsigned)x >> 16)
+#define XEN_VSCSIIF_RSLT_HOST_OK         0
+#define XEN_VSCSIIF_RSLT_HOST_NO_CONN    1 /* Couldn't connect before timeout */
+#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY   2 /* BUS busy through timeout */
+#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT   3 /* TIMED OUT for other reason */
+#define XEN_VSCSIIF_RSLT_HOST_BAD_TARG   4 /* BAD target */
+#define XEN_VSCSIIF_RSLT_HOST_ABORT      5 /* Abort for some other reason */
+#define XEN_VSCSIIF_RSLT_HOST_PARITY     6 /* Parity error */
+#define XEN_VSCSIIF_RSLT_HOST_ERROR      7 /* Internal error */
+#define XEN_VSCSIIF_RSLT_HOST_RESET      8 /* Reset by somebody */
+#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR   9 /* Unexpected interrupt */
+#define XEN_VSCSIIF_RSLT_HOST_PASSTHR   10 /* Force command past mid-layer */
+#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERR  11 /* Retry requested */
+#define XEN_VSCSIIF_RSLT_HOST_IMM_RETR  12 /* Hidden retry requested */
+#define XEN_VSCSIIF_RSLT_HOST_REQUEUE   13 /* Requeue command requested */
+#define XEN_VSCSIIF_RSLT_HOST_DISRUPT   14 /* Transport error disrupted I/O */
+#define XEN_VSCSIIF_RSLT_HOST_FAILFAST  15 /* Transport class fastfailed */
+#define XEN_VSCSIIF_RSLT_HOST_TARG_FAIL 16 /* Permanent target failure */
+#define XEN_VSCSIIF_RSLT_HOST_NEX_FAIL  17 /* Permanent nexus failure on path */
+#define XEN_VSCSIIF_RSLT_HOST_NOMEM     18 /* Space allocation failed */
+#define XEN_VSCSIIF_RSLT_HOST_MED_ERR   19 /* Medium error */
+#define XEN_VSCSIIF_RSLT_HOST_MARGINAL  20 /* Transport marginal errors */
+
 DEFINE_RING_TYPES(vscsiif, struct vscsiif_request, struct vscsiif_response);
 
 
-- 
2.34.1


