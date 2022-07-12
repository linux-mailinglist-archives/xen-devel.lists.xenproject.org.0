Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C88571231
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 08:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365481.595653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9EA-0008RF-PV; Tue, 12 Jul 2022 06:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365481.595653; Tue, 12 Jul 2022 06:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9EA-0008PG-Mp; Tue, 12 Jul 2022 06:18:34 +0000
Received: by outflank-mailman (input) for mailman id 365481;
 Tue, 12 Jul 2022 06:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AePn=XR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oB9E9-0008PA-H1
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 06:18:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73ec27f5-01aa-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 08:18:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A21B4223FD;
 Tue, 12 Jul 2022 06:18:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7981A13A94;
 Tue, 12 Jul 2022 06:18:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w2RIHDcSzWL7dQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Jul 2022 06:18:31 +0000
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
X-Inumbo-ID: 73ec27f5-01aa-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657606711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=etVadWMEcaCmHQolsuZnIQPLKMBgj6AO3enT5B9eJ14=;
	b=SV9AxBqjGnW7jPyyRN2MIPBldiftwFiA8LPhlTIS6S8WeywkFTOT5WSGOMV/j8tUriDXXK
	UgHOosw1XJRCKiFerjjFLiHPLnFXzyHFvzCthgGo7e4TMSEei+ktD63+BxLqu3kPxGOV0T
	1FewGqHWxqnOf9iOw/12vIjm/UHSu5Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/init-xenstore-domain: fix memory map for PVH stubdom
Date: Tue, 12 Jul 2022 08:18:30 +0200
Message-Id: <20220712061830.20208-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of maxmem != memsize the E820 map of the PVH stubdom is wrong,
as it is missing the RAM above memsize.

Additionally the memory map should only specify the Xen special pages
as reserved.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't change mmio area settings (Anthony Perard)
---
 tools/helpers/init-xenstore-domain.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index b4f3c65a8a..2d9ab6f1c5 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -71,8 +71,9 @@ static int build(xc_interface *xch)
     char cmdline[512];
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
-    int limit_kb = (maxmem ? : (memory + 1)) * 1024;
+    int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
     uint64_t mem_size = MB(memory);
+    uint64_t max_size = MB(maxmem ? : memory);
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
@@ -165,13 +166,16 @@ static int build(xc_interface *xch)
         dom->mmio_start = LAPIC_BASE_ADDRESS;
         dom->max_vcpus = 1;
         e820[0].addr = 0;
-        e820[0].size = dom->lowmem_end;
+        e820[0].size = (max_size > LAPIC_BASE_ADDRESS) ?
+                       LAPIC_BASE_ADDRESS : max_size;
         e820[0].type = E820_RAM;
-        e820[1].addr = LAPIC_BASE_ADDRESS;
-        e820[1].size = dom->mmio_size;
+        e820[1].addr = (X86_HVM_END_SPECIAL_REGION -
+                        X86_HVM_NR_SPECIAL_PAGES) << XC_PAGE_SHIFT;
+        e820[1].size = X86_HVM_NR_SPECIAL_PAGES << XC_PAGE_SHIFT;
         e820[1].type = E820_RESERVED;
         e820[2].addr = GB(4);
-        e820[2].size = dom->highmem_end - GB(4);
+        e820[2].size = (max_size > LAPIC_BASE_ADDRESS) ?
+                       max_size - LAPIC_BASE_ADDRESS : 0;
         e820[2].type = E820_RAM;
     }
 
-- 
2.35.3


