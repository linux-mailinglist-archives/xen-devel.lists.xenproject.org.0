Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3333417739
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195458.348188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkc-0008U3-Sn; Fri, 24 Sep 2021 15:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195458.348188; Fri, 24 Sep 2021 15:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkc-0008RI-PA; Fri, 24 Sep 2021 15:04:34 +0000
Received: by outflank-mailman (input) for mailman id 195458;
 Fri, 24 Sep 2021 15:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VJv2=OO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTmkb-0007sV-5K
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:04:33 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5f7e3e8-1d48-11ec-bae9-12813bfff9fa;
 Fri, 24 Sep 2021 15:04:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A634D22443;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DA5E13EF2;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uApJIfroTWHvWwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Sep 2021 15:04:26 +0000
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
X-Inumbo-ID: b5f7e3e8-1d48-11ec-bae9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632495866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tphERlob2bA1MgckZcUA+BdGjUEA0arBUyhlGjAd/Jk=;
	b=EGRoMJqGtU71p4HR0OUXjRB4s/I7Ei7S1JupQsmisywq22LeNLFz+qSPtk0OwuN/I7i7kG
	6rchKZIharlauG9ztdDEWUyY9IiWXo9jnOKZaECL6oKXFjFS9C+ioEoANBnhnzJiDt4h4r
	Ail97ujF6VXLYHCJU5qEvONddANrsQA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] include/public: add possible status values to usbif.h
Date: Fri, 24 Sep 2021 17:04:23 +0200
Message-Id: <20210924150424.10047-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210924150424.10047-1-jgross@suse.com>
References: <20210924150424.10047-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface definition of PV USB devices is lacking the specification
of possible values of the status filed in a response. Those are
negative errno values as used in Linux, so they might differ in other
OS's. Specify them via appropriate defines.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/usbif.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
index c6a58639d6..fbd6f953f8 100644
--- a/xen/include/public/io/usbif.h
+++ b/xen/include/public/io/usbif.h
@@ -221,6 +221,13 @@ struct usbif_urb_response {
 	uint16_t id; /* request id */
 	uint16_t start_frame;  /* start frame (ISO) */
 	int32_t status; /* status (non-ISO) */
+#define USBIF_STATUS_OK		0
+#define USBIF_STATUS_NODEV	-19
+#define USBIF_STATUS_INVAL	-22
+#define USBIF_STATUS_STALL	-32
+#define USBIF_STATUS_IOERROR	-71
+#define USBIF_STATUS_BABBLE	-75
+#define USBIF_STATUS_SHUTDOWN	-108
 	int32_t actual_length; /* actual transfer length */
 	int32_t error_count; /* number of ISO errors */
 };
-- 
2.26.2


