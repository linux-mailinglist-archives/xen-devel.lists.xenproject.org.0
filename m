Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4867DE8D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485313.752446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJED-0006u2-0f; Fri, 27 Jan 2023 07:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485313.752446; Fri, 27 Jan 2023 07:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJEC-0006rG-U5; Fri, 27 Jan 2023 07:32:52 +0000
Received: by outflank-mailman (input) for mailman id 485313;
 Fri, 27 Jan 2023 07:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLJEB-0006pK-2K
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:32:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb272f3c-9e14-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 08:32:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 008AD21DC8;
 Fri, 27 Jan 2023 07:32:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD16D138E3;
 Fri, 27 Jan 2023 07:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 41rDLB1+02MzYAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 07:32:45 +0000
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
X-Inumbo-ID: cb272f3c-9e14-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674804766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n76WnWUE/5YrtZqdKfCuwTkAbmeQBtDXu0yYOZuyFm0=;
	b=ue9gaEms7h+5KZTR5o6qE8naxYWtyoVA94IjgLmiULZBhqu3O5QbiMVwUYJ42PSaR1XOb+
	au4pv19pIbxXII5KM6kcR/1+nNo8/+74EA4kBSdqUdOCDMeCuZXtaDaz1Yiyo56fzB29+c
	mq5vcZ/t8nh4BX/huflxH3ksUppDcS8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: remove stale subdirs from Makefile
Date: Fri, 27 Jan 2023 08:32:44 +0100
Message-Id: <20230127073244.6883-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SUBDIRS make variable has some stale entries, remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f3acdd2f..747c7c01 100644
--- a/Makefile
+++ b/Makefile
@@ -34,7 +34,7 @@ EXTRA_OBJS =
 TARGET := mini-os
 
 # Subdirectories common to mini-os
-SUBDIRS := lib xenbus console
+SUBDIRS := lib
 
 src-$(CONFIG_BLKFRONT) += blkfront.c
 src-$(CONFIG_CONSFRONT) += consfront.c
-- 
2.35.3


