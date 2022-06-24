Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66563559686
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355373.582996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fbn-0000aA-Vg; Fri, 24 Jun 2022 09:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355373.582996; Fri, 24 Jun 2022 09:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fbn-0000XY-RY; Fri, 24 Jun 2022 09:28:11 +0000
Received: by outflank-mailman (input) for mailman id 355373;
 Fri, 24 Jun 2022 09:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4fbm-0000XO-IW
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:28:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d8c341-f39f-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 11:28:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3F561F747;
 Fri, 24 Jun 2022 09:28:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E22A13ACA;
 Fri, 24 Jun 2022 09:28:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rNY9JaiDtWKmCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Jun 2022 09:28:08 +0000
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
X-Inumbo-ID: f5d8c341-f39f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656062888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NT2sb7YMg8LvPipkNj6Pv1Ue4PoLQCX83HM2YlOrZ/o=;
	b=BW+nJlWIaflIr8E3FcM5XhRFnw5/6cTo3t0GCtucY9V7OkTQzT7Xbx5j/e1rS6SOZJyTKy
	mukwRw4SsjDnPlVjc/CYTXTAGUcJF1Rs3qfVa48Gu4FAnvGb3bQD+2IVRWFAMY+eZ7/Exm
	iMbUNPXrBW1atfYuCLRcfKGJ9qYtss8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/init-xenstore-domain: fix memory map for PVH stubdom
Date: Fri, 24 Jun 2022 11:28:06 +0200
Message-Id: <20220624092806.27700-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of maxmem != memsize the E820 map of the PVH stubdom is wrong,
as it is missing the RAM above memsize.

Additionally the MMIO area should only cover the HVM special pages.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index b4f3c65a8a..dad8e43c42 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -71,8 +71,9 @@ static int build(xc_interface *xch)
     char cmdline[512];
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
-    int limit_kb = (maxmem ? : (memory + 1)) * 1024;
+    int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
     uint64_t mem_size = MB(memory);
+    uint64_t max_size = MB(maxmem);
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
@@ -157,21 +158,24 @@ static int build(xc_interface *xch)
         config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
         config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
         dom->target_pages = mem_size >> XC_PAGE_SHIFT;
-        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
+        dom->mmio_size = X86_HVM_NR_SPECIAL_PAGES << XC_PAGE_SHIFT;
         dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
                           LAPIC_BASE_ADDRESS : mem_size;
         dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
                            GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
-        dom->mmio_start = LAPIC_BASE_ADDRESS;
+        dom->mmio_start = (X86_HVM_END_SPECIAL_REGION -
+                           X86_HVM_NR_SPECIAL_PAGES) << XC_PAGE_SHIFT;
         dom->max_vcpus = 1;
         e820[0].addr = 0;
-        e820[0].size = dom->lowmem_end;
+        e820[0].size = (max_size > LAPIC_BASE_ADDRESS) ?
+                       LAPIC_BASE_ADDRESS : max_size;
         e820[0].type = E820_RAM;
-        e820[1].addr = LAPIC_BASE_ADDRESS;
+        e820[1].addr = dom->mmio_start;
         e820[1].size = dom->mmio_size;
         e820[1].type = E820_RESERVED;
         e820[2].addr = GB(4);
-        e820[2].size = dom->highmem_end - GB(4);
+        e820[2].size = (max_size > LAPIC_BASE_ADDRESS) ?
+                       max_size - LAPIC_BASE_ADDRESS : 0;
         e820[2].type = E820_RAM;
     }
 
-- 
2.35.3


