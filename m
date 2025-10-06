Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354FBBD17B
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 08:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137832.1473673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5eGA-00043I-DW; Mon, 06 Oct 2025 05:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137832.1473673; Mon, 06 Oct 2025 05:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5eGA-00041K-Ap; Mon, 06 Oct 2025 05:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1137832;
 Mon, 06 Oct 2025 05:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kU4J=4P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v5eG9-00041C-5l
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 05:59:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7692bd1-a279-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 07:59:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97A6F336CB;
 Mon,  6 Oct 2025 05:59:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6011E13700;
 Mon,  6 Oct 2025 05:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WDjuFc5a42j9AgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Oct 2025 05:59:42 +0000
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
X-Inumbo-ID: a7692bd1-a279-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759730382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lMMx06A22MtFuMC+zl4zErRh88MKU5WGuhzSRKp3WEk=;
	b=BoB2Vv+qJruFXJDdYvUzB7CKNILGNt+WTatUg7bZ0MURSxPEK/jfPWtdmrwvOl7sdlfMBd
	GlCK8W9ZyP2fDPcwN5nOJbvmg/fI5WIpelqUl8I6kkwQND0fKR6ok/tjWnaVt0vSI1pVze
	EiMy9wM64FPewICGT1RlRDrYEQjNVd4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759730382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lMMx06A22MtFuMC+zl4zErRh88MKU5WGuhzSRKp3WEk=;
	b=BoB2Vv+qJruFXJDdYvUzB7CKNILGNt+WTatUg7bZ0MURSxPEK/jfPWtdmrwvOl7sdlfMBd
	GlCK8W9ZyP2fDPcwN5nOJbvmg/fI5WIpelqUl8I6kkwQND0fKR6ok/tjWnaVt0vSI1pVze
	EiMy9wM64FPewICGT1RlRDrYEQjNVd4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2] libs/guest: don't use unsigned long as type for PFNs
Date: Mon,  6 Oct 2025 07:59:39 +0200
Message-ID: <20251006055939.27286-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,arm.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,amd.com,gmail.com,arm.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Declarations of xc_dom_console_init() and
xc_dom_console_set_disconnected() in libxenguest.h don't match their
implementation in the library.

Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long.

Use xen_pfn_t for GFNs in the library to fix that. At the same time
change the parameter name of the implementation to console_gfn,
matching the interface declaration in the header and reality (it is
a GFN, not a PFN).

Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switch parameter name as well (Andrew Cooper)
---
 tools/libs/guest/xg_dom_boot.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index f51b6a78c8..420222cf37 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -430,12 +430,12 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
 
 static int dom_console_init(xc_interface *xch,
                             uint32_t domid,
-                            unsigned long dst_pfn,
+                            xen_pfn_t console_gfn,
                             bool clear)
 {
     const size_t size = PAGE_SIZE;
     struct xencons_interface *xencons = xc_map_foreign_range(
-        xch, domid, size, PROT_WRITE, dst_pfn);
+        xch, domid, size, PROT_WRITE, console_gfn);
 
     if ( xencons == NULL )
         return -1;
@@ -445,22 +445,22 @@ static int dom_console_init(xc_interface *xch,
     xencons->connection = XENCONSOLE_DISCONNECTED;
 
     munmap(xencons, size);
-    xc_domain_cacheflush(xch, domid, dst_pfn, 1);
+    xc_domain_cacheflush(xch, domid, console_gfn, 1);
     return 0;
 }
 
 int xc_dom_console_init(xc_interface *xch,
                         uint32_t domid,
-                        unsigned long dst_pfn)
+                        xen_pfn_t console_gfn)
 {
-    return dom_console_init(xch, domid, dst_pfn, true);
+    return dom_console_init(xch, domid, console_gfn, true);
 }
 
 int xc_dom_console_set_disconnected(xc_interface *xch,
                                     uint32_t domid,
-                                    unsigned long dst_pfn)
+                                    xen_pfn_t console_gfn)
 {
-    return dom_console_init(xch, domid, dst_pfn, false);
+    return dom_console_init(xch, domid, console_gfn, false);
 }
 
 /*
-- 
2.51.0


