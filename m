Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E3442345
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219504.380396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfco-0001fT-7h; Mon, 01 Nov 2021 22:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219504.380396; Mon, 01 Nov 2021 22:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfco-0001cI-3g; Mon, 01 Nov 2021 22:17:54 +0000
Received: by outflank-mailman (input) for mailman id 219504;
 Mon, 01 Nov 2021 22:17:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVZ-0007pr-PS
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6a7a852a-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:43 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-FrnHLC8ePXqrWehZRaew_Q-1; Mon, 01 Nov 2021 18:09:39 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so171817wmn.6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o1sm7544314wrn.63.2021.11.01.15.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
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
X-Inumbo-ID: 6a7a852a-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unY7TGVSo3gAzWqEez72wIx+FCQs3PCeVqZ11RSh+wo=;
	b=BqpdqJx8R6ZUlb/1e1CYAiu81KBUJStj/gJa8TEKOD9AikhgzxSqKAAglpVCkZmGelpAj3
	y2InS+pefppXvFUKuGnphDjtyqI6titDhvpvnuMJ3fM3/Vq/UoBZTmHUJqZgWUjZCMjXyY
	rf/Dr/ucfC9vpYpsDCbhC8KQF4d8738=
X-MC-Unique: FrnHLC8ePXqrWehZRaew_Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=unY7TGVSo3gAzWqEez72wIx+FCQs3PCeVqZ11RSh+wo=;
        b=TvXDRfwsyfIQza+DohYkq1wcBjZdyKrK9WcPZswoGH1YmX922DMBlqUeCZAJacqrnv
         4sPIIMJvXT5lHilvKbuiZS5OCyj0z77nKsU1u4DUFNGQikH0RBhZ9otuvXs257eptiOq
         ipyBPdb+lFsozd2uMUiSXmV+8qWHDrFRLBXs5G7fBcTxiyArTYB1V9atArUBxq/gzJpj
         EP6YfnhPCM6/fQNN+BoKPztQpOoyCYmBAgGj/iGBGaAZhh0Ys70FDnUj+vkz7nvtbH07
         tIOfucHaZVste3OERSkh0NujOQTtfwLyrNREX13jjmU3YS6skgm7joJUyyJzhuawXj38
         UXFA==
X-Gm-Message-State: AOAM533HaUBquDZ0f6GLTWnnNyubmEgXyCCjaCWjzR5ys2uShQpvwakg
	fkOo2ACLMbF71uTcxo+fuJH6g6R/EMqwPLCywWh4X/s8iksq3q+KdLoXFMB9U3W8zc4QnuGjgdm
	QMhCYthfPz5O1f9hZ6vji5o1H1CI=
X-Received: by 2002:a5d:568c:: with SMTP id f12mr30759729wrv.240.1635804578728;
        Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNZg4k6DRhmX852xk77R95Xufg4HlBWhkQxhZujNVoSP0nUJe8lhm/J27V+ocUqFpop+mG2g==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr30759714wrv.240.1635804578506;
        Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
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
Subject: [PULL 18/20] migration/ram: Handle RAMBlocks with a RamDiscardManager on background snapshots
Date: Mon,  1 Nov 2021 23:09:10 +0100
Message-Id: <20211101220912.10039-19-quintela@redhat.com>
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

We already don't ever migrate memory that corresponds to discarded ranges
as managed by a RamDiscardManager responsible for the mapped memory region
of the RAMBlock.

virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
Right now, we still populate zeropages for the whole usable part of the
RAMBlock, which is undesired because:

1. Even populating the shared zeropage will result in memory getting
   consumed for page tables.
2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
   will populate an actual, fresh page, resulting in an unintended
   memory consumption.

Discarded ("logically unplugged") parts have to remain discarded. As
these pages are never part of the migration stream, there is no need to
track modifications via userfaultfd WP reliably for these parts.

Further, any writes to these ranges by the VM are invalid and the
behavior is undefined.

Note that Linux only supports userfaultfd WP on private anonymous memory
for now, which usually results in the shared zeropage getting populated.
The issue will become more relevant once userfaultfd WP supports shmem
and hugetlb.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 92c7b788ae..680a5158aa 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1656,6 +1656,17 @@ static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
     }
 }
 
+static inline int populate_read_section(MemoryRegionSection *section,
+                                        void *opaque)
+{
+    const hwaddr size = int128_get64(section->size);
+    hwaddr offset = section->offset_within_region;
+    RAMBlock *block = section->mr->ram_block;
+
+    populate_read_range(block, offset, size);
+    return 0;
+}
+
 /*
  * ram_block_populate_read: preallocate page tables and populate pages in the
  *   RAM block by reading a byte of each page.
@@ -1665,9 +1676,32 @@ static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_read(RAMBlock *block)
+static void ram_block_populate_read(RAMBlock *rb)
 {
-    populate_read_range(block, 0, block->used_length);
+    /*
+     * Skip populating all pages that fall into a discarded range as managed by
+     * a RamDiscardManager responsible for the mapped memory region of the
+     * RAMBlock. Such discarded ("logically unplugged") parts of a RAMBlock
+     * must not get populated automatically. We don't have to track
+     * modifications via userfaultfd WP reliably, because these pages will
+     * not be part of the migration stream either way -- see
+     * ramblock_dirty_bitmap_exclude_discarded_pages().
+     *
+     * Note: The result is only stable while migrating (precopy/postcopy).
+     */
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = rb->mr->size,
+        };
+
+        ram_discard_manager_replay_populated(rdm, &section,
+                                             populate_read_section, NULL);
+    } else {
+        populate_read_range(rb, 0, rb->used_length);
+    }
 }
 
 /*
-- 
2.33.1


