Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F07680A77
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486776.754250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5b-0000a2-F4; Mon, 30 Jan 2023 10:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486776.754250; Mon, 30 Jan 2023 10:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5b-0000W0-AT; Mon, 30 Jan 2023 10:08:39 +0000
Received: by outflank-mailman (input) for mailman id 486776;
 Mon, 30 Jan 2023 10:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMR5a-0007zj-1R
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:08:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f4fb7ba-a086-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 11:08:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 11A701F8C4;
 Mon, 30 Jan 2023 10:08:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBD5513444;
 Mon, 30 Jan 2023 10:08:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8jdJOCOX12PpfgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 10:08:35 +0000
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
X-Inumbo-ID: 0f4fb7ba-a086-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675073316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9hWyX1xxO2Hr5xWFMrMhIclyrLkWDLxq1LOLbj+I4I=;
	b=BxYB/DNEWRCHsmyS3EpSsivX0/aho+AoE2IVhSnhlc9tYl5U4poTocdzx/q3SuxMLnzIvs
	usgKW3GlIbwCbAhOsoUPdcRdJIFCyEQA2IXLTFelllHVSBbzqv33TAxmeTCQiWXpVV/9is
	EhsQRunnJe9xhGj2KTXe3Aq2mKjLZUQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/3] xen/public: fix 9pfs documentation of connection sequence
Date: Mon, 30 Jan 2023 11:08:13 +0100
Message-Id: <20230130100813.3298-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230130100813.3298-1-jgross@suse.com>
References: <20230130100813.3298-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documented connection sequence in xen/include/public/io/9pfs.h has
a bug: the frontend needs to wait for the backend to have published its
features before being able to allocate its rings and event-channels.

While correcting that, make it clear that there might be multiple
rings and event-channels by adding "(s)".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- patch split off (Julien Grall)
---
 xen/include/public/io/9pfs.h | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index 617ad9afd7..a0ce82d0a8 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -114,14 +114,26 @@
  *
  *    *Front*                               *Back*
  *    XenbusStateInitialising               XenbusStateInitialising
- *    - Query virtual device                - Query backend device
- *      properties.                           identification data.
- *    - Setup OS device instance.           - Publish backend features
- *    - Allocate and initialize the           and transport parameters
- *      request ring.                                      |
- *    - Publish transport parameters                       |
- *      that will be in effect during                      V
- *      this connection.                            XenbusStateInitWait
+ *                                          - Query backend device
+ *                                            identification data.
+ *                                          - Publish backend features
+ *                                            and transport parameters.
+ *                                                         |
+ *                                                         |
+ *                                                         V
+ *                                                  XenbusStateInitWait
+ *
+ *    - Query virtual device
+ *      properties.
+ *    - Query backend features and
+ *      transport parameters.
+ *    - Setup OS device instance.
+ *    - Allocate and initialize the
+ *      request ring(s) and
+ *      event-channel(s).
+ *    - Publish transport parameters
+ *      that will be in effect during
+ *      this connection.
  *                 |
  *                 |
  *                 V
@@ -129,8 +141,8 @@
  *
  *                                          - Query frontend transport
  *                                            parameters.
- *                                          - Connect to the request ring and
- *                                            event channel.
+ *                                          - Connect to the request ring(s)
+ *                                            and event channel(s).
  *                                                         |
  *                                                         |
  *                                                         V
-- 
2.35.3


