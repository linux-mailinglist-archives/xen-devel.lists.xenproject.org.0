Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01A4E4ECC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 09:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293812.499252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwp9-00055n-Kx; Wed, 23 Mar 2022 08:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293812.499252; Wed, 23 Mar 2022 08:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwp9-00053y-Hp; Wed, 23 Mar 2022 08:58:35 +0000
Received: by outflank-mailman (input) for mailman id 293812;
 Wed, 23 Mar 2022 08:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E8iV=UC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWwp8-00053s-Gj
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 08:58:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ad67aac-aa87-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 09:58:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB68D1F387;
 Wed, 23 Mar 2022 08:58:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3A1813B9C;
 Wed, 23 Mar 2022 08:58:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bV6AMjjhOmIGFgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Mar 2022 08:58:32 +0000
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
X-Inumbo-ID: 6ad67aac-aa87-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648025912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=j2/DQyPxlFHrTEMlyx5he23M+6rpoQfgdZ40JUEg7ns=;
	b=rg1Z6A0QkLqawW+h1KWIJTDDy8NVcDv2tutAdvMpLs2ZHRdBjFx/xc75mTzmXrWV433D7n
	PwH6Iin2rfmztAC7uAOe+QoN+x4Am3yZnylY+Ru8qHDQsjbYnAOtXotifFYR58jvIQcdv6
	YBvkmQIkLw2BJLTGeWVOxOSe+U+Gaas=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] include/public: add command result definitions to vscsiif.h
Date: Wed, 23 Mar 2022 09:58:31 +0100
Message-Id: <20220323085831.27057-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result field of struct vscsiif_response is lacking a detailed
definition. Today the Linux kernel internal scsi definitions are being
used, which is not a sane interface for a PV device driver.

Add macros to change that by using today's values in the XEN namespace.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- put macro parameters in parentheses (Jan Beulich)
- correct XEN_VSCSIIF_RSLT_HOST() (Jan Beulich)
- more verbose result defines (Jan Beulich)
- add reset result defines (Jan Beulich)
---
 xen/include/public/io/vscsiif.h | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/xen/include/public/io/vscsiif.h b/xen/include/public/io/vscsiif.h
index c9ceb1884d..8553b17cc6 100644
--- a/xen/include/public/io/vscsiif.h
+++ b/xen/include/public/io/vscsiif.h
@@ -315,6 +315,57 @@ struct vscsiif_response {
 };
 typedef struct vscsiif_response vscsiif_response_t;
 
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
 
 
-- 
2.34.1


