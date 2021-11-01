Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF6442347
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219528.380418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdH-0002aU-Oq; Mon, 01 Nov 2021 22:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219528.380418; Mon, 01 Nov 2021 22:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdH-0002XG-L0; Mon, 01 Nov 2021 22:18:23 +0000
Received: by outflank-mailman (input) for mailman id 219528;
 Mon, 01 Nov 2021 22:18:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVU-0007pr-PO
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 69b51b8c-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:41 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-xOwcUxRFPMS887nrzbfRvg-1; Mon, 01 Nov 2021 18:09:38 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2363625wrd.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f1sm14841974wrc.74.2021.11.01.15.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:36 -0700 (PDT)
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
X-Inumbo-ID: 69b51b8c-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ut0I0bOpeQjRvVatojvb4Hc5X8NOzmNkKKtiHDMU41A=;
	b=Mu4MzLgwItrojXmSjZalYoQ6+1MYX//a1sMWyAT2gsPa74RYthkpx3SD6RTcl/TJwPbpDo
	nYQ0qrhBED9e+BfIEhBa8CFT1YUJgVq6mWq/98vpSWWPNJzkSqF6wSu0PeVMzzvJe8s+kt
	22IVneHZaHAHJqN6oKEObKVAKUkpdVE=
X-MC-Unique: xOwcUxRFPMS887nrzbfRvg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ut0I0bOpeQjRvVatojvb4Hc5X8NOzmNkKKtiHDMU41A=;
        b=Ptrzf4HdrECptjY0Mpb7kVFfw1eopXxoOniLPxkRYxnso9MLHIAvD3lYwuu2sxglAi
         FxPDMqwkn+gwE0YMDOyRXk/QfZESFpLCzjWCw5FFkkwCeMgdVFO+D2w4DnixqXGwjEA6
         fvorUT/zEbmCOabIv09um0tSU2TLl/cMX4sYAflcftXGuh01NhQZXueSttTAWEsBG2+Q
         TyXo7gosjglrELTc6FNoqv1Mn0xjKXlJpxsbCVIZEbkSi6kGDjA+Yuc2vek9zEqtyIbd
         rRFutrY8Z1oaN5nPLkra3nIP7CkgFhq9toCvfyn9cL12eT99mcEjcHCQ8qcyX9ebqoTL
         tPeg==
X-Gm-Message-State: AOAM5303Tjsbs1lwnW5NlR0Sb0YR+eGpzvLa33veIeWn2KxVvg9Mq3ok
	Z0gNjg//Jv/5vGqGMH0xbR4jnP2H6Ju0I1EV3xS09HtFD0phJXubUntscfWIq2zxOqoNCeidjey
	MtVQPSVQ3y2tnJ0DF08Fnxk1Rxcs=
X-Received: by 2002:a05:600c:4f92:: with SMTP id n18mr1960070wmq.22.1635804577431;
        Mon, 01 Nov 2021 15:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk1mlsAWBnPV3UAdQaOyBp79mHrO95iLydgSFEaD+slGORmkvNAM202r9ngtyh0byPMnYLqg==
X-Received: by 2002:a05:600c:4f92:: with SMTP id n18mr1960047wmq.22.1635804577205;
        Mon, 01 Nov 2021 15:09:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PULL 17/20] migration/ram: Factor out populating pages readable in ram_block_populate_pages()
Date: Mon,  1 Nov 2021 23:09:09 +0100
Message-Id: <20211101220912.10039-18-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: David Hildenbrand <david@redhat.com>

Let's factor out prefaulting/populating to make further changes easier to
review and add a comment what we are actually expecting to happen. While at
it, use the actual page size of the ramblock, which defaults to
qemu_real_host_page_size for anonymous memory. Further, rename
ram_block_populate_pages() to ram_block_populate_read() as well, to make
it clearer what we are doing.

In the future, we might want to use MADV_POPULATE_READ to speed up
population.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 54df5dc0fc..92c7b788ae 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1639,26 +1639,35 @@ out:
     return ret;
 }
 
+static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
+                                       ram_addr_t size)
+{
+    /*
+     * We read one byte of each page; this will preallocate page tables if
+     * required and populate the shared zeropage on MAP_PRIVATE anonymous memory
+     * where no page was populated yet. This might require adaption when
+     * supporting other mappings, like shmem.
+     */
+    for (; offset < size; offset += block->page_size) {
+        char tmp = *((char *)block->host + offset);
+
+        /* Don't optimize the read out */
+        asm volatile("" : "+r" (tmp));
+    }
+}
+
 /*
- * ram_block_populate_pages: populate memory in the RAM block by reading
- *   an integer from the beginning of each page.
+ * ram_block_populate_read: preallocate page tables and populate pages in the
+ *   RAM block by reading a byte of each page.
  *
  * Since it's solely used for userfault_fd WP feature, here we just
  *   hardcode page size to qemu_real_host_page_size.
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_pages(RAMBlock *block)
+static void ram_block_populate_read(RAMBlock *block)
 {
-    char *ptr = (char *) block->host;
-
-    for (ram_addr_t offset = 0; offset < block->used_length;
-            offset += qemu_real_host_page_size) {
-        char tmp = *(ptr + offset);
-
-        /* Don't optimize the read out */
-        asm volatile("" : "+r" (tmp));
-    }
+    populate_read_range(block, 0, block->used_length);
 }
 
 /*
@@ -1684,7 +1693,7 @@ void ram_write_tracking_prepare(void)
          * UFFDIO_WRITEPROTECT_MODE_WP mode setting would silently skip
          * pages with pte_none() entries in page table.
          */
-        ram_block_populate_pages(block);
+        ram_block_populate_read(block);
     }
 }
 
-- 
2.33.1


