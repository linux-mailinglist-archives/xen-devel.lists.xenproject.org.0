Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9B5111E0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314403.532461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbhi-0006Da-GD; Wed, 27 Apr 2022 07:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314403.532461; Wed, 27 Apr 2022 07:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbhi-0006B5-D3; Wed, 27 Apr 2022 07:03:14 +0000
Received: by outflank-mailman (input) for mailman id 314403;
 Wed, 27 Apr 2022 07:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njbhg-0006Ax-W2
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 07:03:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19cb4761-c5f8-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 09:03:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67BAF1F380;
 Wed, 27 Apr 2022 07:03:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4ED0813A39;
 Wed, 27 Apr 2022 07:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKP3Ea/qaGKFHQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 07:03:11 +0000
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
X-Inumbo-ID: 19cb4761-c5f8-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651042991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Vjq7etHyeCtmVd5oMifGmezFnWjw8TaQ+sfePAnJ0yU=;
	b=SqSGRdaDvgxvKxoZnuP8dtYB2r5OwsnhDD4YAtuEOBOg+R6/s6aIUT5StEbsZPg8waQU9B
	nd83w01dfhfusz6TkZ9dole9/1UzrgiQYiGnHJVZn6ZEPBYyL0frYACbU0L7sxgXCBTAG3
	ckWVryhTgfjsPfKaPza2VJIMTSS2Hu8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] xen/public: add new macro to ring.h
Date: Wed, 27 Apr 2022 09:03:09 +0200
Message-Id: <20220427070309.15090-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the initialization of a ring page by the frontend two macros are
available in ring.h: SHARED_RING_INIT() and FRONT_RING_INIT().

All known users use always both of them in direct sequence.

Add another macro XEN_FRONT_RING_INIT() combining the two macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- modify comment (Jan Beulich)
- drop underscores from macro parameters (Jan Beulich)
---
 xen/include/public/io/ring.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 277af36e61..ab3439bd58 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -95,9 +95,8 @@ typedef unsigned int RING_IDX;
  * of the shared memory area (PAGE_SIZE, for instance). To initialise
  * the front half:
  *
- *     mytag_front_ring_t front_ring;
- *     SHARED_RING_INIT((mytag_sring_t *)shared_page);
- *     FRONT_RING_INIT(&front_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
+ *     mytag_front_ring_t ring;
+ *     XEN_FRONT_RING_INIT(&ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
  *
  * Initializing the back follows similarly (note that only the front
  * initializes the shared ring):
@@ -184,6 +183,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
 
 #define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
 
+#define XEN_FRONT_RING_INIT(r, s, size) do {                            \
+    SHARED_RING_INIT(s);                                                \
+    FRONT_RING_INIT(r, s, size);                                        \
+} while (0)
+
 #define BACK_RING_ATTACH(_r, _s, _i, __size) do {                       \
     (_r)->rsp_prod_pvt = (_i);                                          \
     (_r)->req_cons = (_i);                                              \
-- 
2.34.1


