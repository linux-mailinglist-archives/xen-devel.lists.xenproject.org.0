Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4E50831F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 10:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308972.524910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5KB-0004yv-5m; Wed, 20 Apr 2022 08:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308972.524910; Wed, 20 Apr 2022 08:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5KB-0004x5-28; Wed, 20 Apr 2022 08:04:31 +0000
Received: by outflank-mailman (input) for mailman id 308972;
 Wed, 20 Apr 2022 08:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh5KA-0004wz-Cj
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 08:04:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80743973-c080-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 10:04:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C28761F380;
 Wed, 20 Apr 2022 08:04:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E77313A30;
 Wed, 20 Apr 2022 08:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /hRuJYy+X2JSagAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 08:04:28 +0000
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
X-Inumbo-ID: 80743973-c080-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650441868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OEc5VwXg/asXng3njAe1udGsbyNDGB6ncjnpuOLJcyg=;
	b=dhCIQlBq1C4d/blI+i/S/MUFxe24DyFePXLBW/bNoTQOurIzMZr/Uaee2uEtR0ORTiH/t5
	iAEPBmeh/mK+mTJn0UuX4GvKt283509HcTNmS2L84Gg9y1vIbiB8zvF5Kiih4PzYYBFqiJ
	Ivay+zy9A7wqo1jHNmfQ5qcNFrvm70o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/libs/light: update xenstore entry when setting max domain memory
Date: Wed, 20 Apr 2022 10:04:26 +0200
Message-Id: <20220420080426.7036-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl_domain_setmaxmem() called during "xl mem-max" should update the
domain's memory/static-max Xenstore node, as otherwise "xl mem-set"
won't be able to set the memory size to the new maximum.

Adjust the related comments and documentation accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- adjust comments and docs (Anthony Perard)
---
 tools/libs/light/libxl_mem.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_mem.c b/tools/libs/light/libxl_mem.c
index c739d00f39..92ec09f4cf 100644
--- a/tools/libs/light/libxl_mem.c
+++ b/tools/libs/light/libxl_mem.c
@@ -20,8 +20,7 @@
 /*
  * Set the maximum memory size of the domain in the hypervisor. There is no
  * change of the current memory size involved. The specified memory size can
- * even be above the configured maxmem size of the domain, but the related
- * Xenstore entry memory/static-max isn't modified!
+ * even be above the configured maxmem size of the domain.
  */
 int libxl_domain_setmaxmem(libxl_ctx *ctx, uint32_t domid, uint64_t max_memkb)
 {
@@ -82,6 +81,15 @@ int libxl_domain_setmaxmem(libxl_ctx *ctx, uint32_t domid, uint64_t max_memkb)
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


