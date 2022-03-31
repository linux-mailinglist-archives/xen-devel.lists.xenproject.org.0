Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C034ED463
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 09:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296694.505110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZouX-0000HN-A5; Thu, 31 Mar 2022 07:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296694.505110; Thu, 31 Mar 2022 07:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZouX-0000EY-5T; Thu, 31 Mar 2022 07:08:01 +0000
Received: by outflank-mailman (input) for mailman id 296694;
 Thu, 31 Mar 2022 07:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8eLM=UK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nZouV-0000EQ-Fz
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 07:07:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b7b5499-b0c1-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 09:07:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2435D1F7AB;
 Thu, 31 Mar 2022 07:07:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1CC6139C2;
 Thu, 31 Mar 2022 07:07:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id roseOU1TRWKFWQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 31 Mar 2022 07:07:57 +0000
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
X-Inumbo-ID: 4b7b5499-b0c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648710478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CwodxS3v8TjpSSyOje93Qv45jgmGMLCbfJozxFKuEgM=;
	b=PA+bHPWIdk9nhXbhoq7yMEvGCAcB45g8Crb89kFO1mptexKHe4055co4IY5X61LgAjh1mO
	Ekght1o9/cJNr1QF+MivH01A2az8+5scxLxUd/IWCfX6LZzrP/QqISWbj2NA1OtgTBfgId
	7tfNv8kgCXvZAOUEssQHxEOIUrM/jKc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: update xenstore entry when setting max domain memory
Date: Thu, 31 Mar 2022 09:07:55 +0200
Message-Id: <20220331070755.10894-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl_domain_setmaxmem() should update the domain's memory/static-max
Xenstore node, as otherwise "xl mem-set" won't be able to set the
memory size to the new maximum.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/light/libxl_mem.c b/tools/libs/light/libxl_mem.c
index c739d00f39..2f4f9d4a4a 100644
--- a/tools/libs/light/libxl_mem.c
+++ b/tools/libs/light/libxl_mem.c
@@ -82,6 +82,15 @@ int libxl_domain_setmaxmem(libxl_ctx *ctx, uint32_t domid, uint64_t max_memkb)
         goto out;
     }
 
+    rc = libxl__xs_printf(gc, XBT_NULL,
+                          GCSPRINTF("%s/memory/static-max", dompath),
+                          "%"PRIu64, max_memkb);
+    if (rc != 0) {
+        LOGED(ERROR, domid, "Couldn't set %s/memory/static-max, rc=%d\n",
+              dompath, rc);
+        goto out;
+    }
+
     rc = 0;
 out:
     libxl_domain_config_dispose(&d_config);
-- 
2.34.1


