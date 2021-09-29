Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F230A41C016
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198727.352382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIQ-0005gY-O7; Wed, 29 Sep 2021 07:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198727.352382; Wed, 29 Sep 2021 07:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIQ-0005eR-JP; Wed, 29 Sep 2021 07:46:30 +0000
Received: by outflank-mailman (input) for mailman id 198727;
 Wed, 29 Sep 2021 07:46:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVUIP-0005MR-4R
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:46:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 575f9920-20f9-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 07:46:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 69CB91FFD6;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 539081407B;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JtFE84ZVGFRdwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Sep 2021 07:46:22 +0000
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
X-Inumbo-ID: 575f9920-20f9-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632901582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBKFAtiMuRXfQlNUaLpeC377i///8nXozdU/6NrtRs8=;
	b=Z4zCcwx+Rifii1g8JPWcVyg40ABUdEZxBKuk8fterrpmuqYBmiKXC3O95eM3/xJQOt/Ekg
	kBEqohA6Hu0QbhOJnWcatZByfRpmeBP6fHArdsWd1EHIfgXdEaLSRbZidJpnCZdeYqI5XX
	ofUTt0msxDDFGhOz11xSKelLBlQpiew=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/3] include/public: add possible status values to usbif.h
Date: Wed, 29 Sep 2021 09:46:18 +0200
Message-Id: <20210929074620.28495-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929074620.28495-1-jgross@suse.com>
References: <20210929074620.28495-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface definition of PV USB devices is lacking the specification
of possible values of the status field in a response. Those are
negative errno values as used in Linux, so they might differ in other
OS's. Specify them via appropriate defines.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add parentheses to macro values (Jan Beulich)
---
 xen/include/public/io/usbif.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
index c6a58639d6..96b9fb661d 100644
--- a/xen/include/public/io/usbif.h
+++ b/xen/include/public/io/usbif.h
@@ -221,6 +221,13 @@ struct usbif_urb_response {
 	uint16_t id; /* request id */
 	uint16_t start_frame;  /* start frame (ISO) */
 	int32_t status; /* status (non-ISO) */
+#define USBIF_STATUS_OK		0
+#define USBIF_STATUS_NODEV	(-19)
+#define USBIF_STATUS_INVAL	(-22)
+#define USBIF_STATUS_STALL	(-32)
+#define USBIF_STATUS_IOERROR	(-71)
+#define USBIF_STATUS_BABBLE	(-75)
+#define USBIF_STATUS_SHUTDOWN	(-108)
 	int32_t actual_length; /* actual transfer length */
 	int32_t error_count; /* number of ISO errors */
 };
-- 
2.26.2


