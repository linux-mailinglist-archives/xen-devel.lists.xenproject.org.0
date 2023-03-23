Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD66C62DA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513698.795120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwt-0006L4-S8; Thu, 23 Mar 2023 09:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513698.795120; Thu, 23 Mar 2023 09:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwt-0006Ig-Nh; Thu, 23 Mar 2023 09:09:31 +0000
Received: by outflank-mailman (input) for mailman id 513698;
 Thu, 23 Mar 2023 09:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfGws-0004iI-J6
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:09:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b26617f-c95a-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 10:09:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC9183421D;
 Thu, 23 Mar 2023 09:09:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C526413596;
 Thu, 23 Mar 2023 09:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 84OtLkkXHGRfPAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 09:09:29 +0000
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
X-Inumbo-ID: 6b26617f-c95a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679562569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3ZkLxPJUvo+zj64n5geObIPSNljnDCOHNBqeqoIUno=;
	b=GELWIzEVwFp9cZyFOHWJwkCjahL80Y0FQcsCu0lFxihPoSnv2gkGlh94yKxI1sfsh18w9H
	zscSzlmh81jKSi/Z9Z8Kfxv6ubzBJmymgZEj1qZqdHvEOc14rE0yfD9GrAg7bJIqZp14oO
	jxpn2s3MfgE8oIDo1Fww6YvRmYhrGyw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 5/5] tools/libs/vchan: remove private offsetof() definition
Date: Thu, 23 Mar 2023 10:08:59 +0100
Message-Id: <20230323090859.25240-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323090859.25240-1-jgross@suse.com>
References: <20230323090859.25240-1-jgross@suse.com>
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


