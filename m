Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE306690719
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492345.761873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51w-0002vU-JL; Thu, 09 Feb 2023 11:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492345.761873; Thu, 09 Feb 2023 11:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51w-0002tF-Ff; Thu, 09 Feb 2023 11:23:56 +0000
Received: by outflank-mailman (input) for mailman id 492345;
 Thu, 09 Feb 2023 11:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ51u-0002J1-Q2
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:23:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c5783f4-a86c-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 12:23:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 055735C830;
 Thu,  9 Feb 2023 11:23:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C222E1339E;
 Thu,  9 Feb 2023 11:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4G8qLsnX5GONPAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 11:23:53 +0000
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
X-Inumbo-ID: 3c5783f4-a86c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675941834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9hWyX1xxO2Hr5xWFMrMhIclyrLkWDLxq1LOLbj+I4I=;
	b=cnhgXp3QLOM22dAa7iRHOVdKpkMg18w1JaOg3jmcq2AVgi8YWHZcTkRa1ICbbL190fAENl
	ToyEe2sNNx6IUFhuH49oVwBp/dCk0HRnTCxLSUjzcmJB348wrE/2pESJP9WwSqV1PXYBs8
	GJAh7ysO0cVYdUy1dsEGJ+znJl0Bttc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/2 RESEND] xen/public: fix 9pfs documentation of connection sequence
Date: Thu,  9 Feb 2023 12:23:38 +0100
Message-Id: <20230209112338.26287-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230209112338.26287-1-jgross@suse.com>
References: <20230209112338.26287-1-jgross@suse.com>
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


