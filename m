Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6259516C66
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 10:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318724.538613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlRiR-00007e-0j; Mon, 02 May 2022 08:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318724.538613; Mon, 02 May 2022 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlRiQ-0008WL-TJ; Mon, 02 May 2022 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 318724;
 Mon, 02 May 2022 08:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+C6=VK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlRiP-0008WF-LS
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 08:47:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81483a6e-c9f4-11ec-a405-831a346695d4;
 Mon, 02 May 2022 10:47:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE33E210EC;
 Mon,  2 May 2022 08:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89207133E5;
 Mon,  2 May 2022 08:47:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PO4iIKOab2JXFgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 02 May 2022 08:47:31 +0000
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
X-Inumbo-ID: 81483a6e-c9f4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651481251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3YGp09FIL19SEfwLZBKJrZGe61G82XI/DK4ZCzyeUww=;
	b=uHWnRqYyDeNiAhGeSvNuQVtBugZZEBF/T3GhiUaydYzG90eZypJtp4QeUXrx3dnsOVXce6
	ScpkEKO/0DvyK13BT4zUog+/CXq5CgvfICC5RnnGpTj782kQwRvrh2dPFpC/3GxHRZy3fB
	tp+lDkHG46df8exc7WKvu8y6jrY9GVM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3] tools/libs/light: update xenstore entry when setting max domain memory
Date: Mon,  2 May 2022 10:47:29 +0200
Message-Id: <20220502084729.13044-1-jgross@suse.com>
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
V3:
- really adjust the docs (Anthony Perard)
---
 docs/man/xl.1.pod.in         | 11 +++++------
 tools/libs/light/libxl_mem.c | 12 ++++++++++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..101e14241d 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -442,15 +442,14 @@ allocate.
 The default unit is kiB.  Add 't' for TiB, 'g' for GiB, 'm' for
 MiB, 'k' for kiB, and 'b' for bytes (e.g., `2048m` for 2048 MiB).
 
-NB that users normally shouldn't need this command; B<xl mem-set> will
-set this as appropriate automatically.
-
 I<mem> can't be set lower than the current memory target for
 I<domain-id>.  It is allowed to be higher than the configured maximum
 memory size of the domain (B<maxmem> parameter in the domain's
-configuration). Note however that the initial B<maxmem> value is still
-used as an upper limit for B<xl mem-set>.  Also note that calling B<xl
-mem-set> will reset this value.
+configuration).
+
+Setting the maximum memory size above the configured maximum memory size
+will require special guest support (memory hotplug) in order to be usable
+by the guest.
 
 The domain will not receive any signal regarding the changed memory
 limit.
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


