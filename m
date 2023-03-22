Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971476C49F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513377.794280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexHL-0001z9-QZ; Wed, 22 Mar 2023 12:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513377.794280; Wed, 22 Mar 2023 12:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexHL-0001vs-Nb; Wed, 22 Mar 2023 12:09:19 +0000
Received: by outflank-mailman (input) for mailman id 513377;
 Wed, 22 Mar 2023 12:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexHJ-0008Jp-Ky
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:09:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dac9b35-c8aa-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:09:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E422133AB2;
 Wed, 22 Mar 2023 12:09:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCEE513416;
 Wed, 22 Mar 2023 12:09:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W6y8LOvvGmRkTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:09:15 +0000
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
X-Inumbo-ID: 5dac9b35-c8aa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679486955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3ZkLxPJUvo+zj64n5geObIPSNljnDCOHNBqeqoIUno=;
	b=W9YS8reMntWblbZK2gVcAw1KYqnXHccn95nPIItbO+l1UTzL9AszuB9ecZp9hNEnZyru0q
	joxmeDlfB5KYO5H1C5C80yDcC/ANESFrsIqN/T5kZzL/Ujt5MRZLnx127ikDfNsJ3ac+XR
	mq7gO7BMMZahIRpcxO+8qpUC9Jg/M7A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 5/5] tools/libs/vchan: remove private offsetof() definition
Date: Wed, 22 Mar 2023 13:08:44 +0100
Message-Id: <20230322120844.19657-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322120844.19657-1-jgross@suse.com>
References: <20230322120844.19657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchan/init.c is defining offsetof privately. Remove that definition
and just use stddef.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 tools/libs/vchan/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 021e1f29e1..a081dd4c9a 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -32,6 +32,7 @@
 #include <sys/mman.h>
 #include <sys/ioctl.h>
 #include <sys/user.h>
+#include <stddef.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdint.h>
@@ -69,10 +70,6 @@
 #define MAX_RING_SHIFT 20
 #define MAX_RING_SIZE (1 << MAX_RING_SHIFT)
 
-#ifndef offsetof
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-#endif
-
 static int init_gnt_srv(struct libxenvchan *ctrl, int domain)
 {
 	int pages_left = ctrl->read.order >= PAGE_SHIFT ? 1 << (ctrl->read.order - PAGE_SHIFT) : 0;
-- 
2.35.3


