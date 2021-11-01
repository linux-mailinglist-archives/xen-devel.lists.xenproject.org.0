Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB8442346
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219519.380406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdB-0002CT-Fp; Mon, 01 Nov 2021 22:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219519.380406; Mon, 01 Nov 2021 22:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfdB-0002An-Bt; Mon, 01 Nov 2021 22:18:17 +0000
Received: by outflank-mailman (input) for mailman id 219519;
 Mon, 01 Nov 2021 22:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVK-0007pr-P1
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:10 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 665c7387-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:36 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-570G33pbNI-j4P4ohZf5Fg-1; Mon, 01 Nov 2021 18:09:33 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so184408wmd.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:32 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h16sm9219637wrm.27.2021.11.01.15.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
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
X-Inumbo-ID: 665c7387-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAlWjWoEMOZw+xZxC0WiKGp4PGVHqFH6WrrAJ6wsQRw=;
	b=ND5+484L/VIHEwuXA49K43iuygLlkhXpQF+UGCow1qLrWqETFQTAVltvR2UUjS975973sL
	fCLKwvtj34ISb1XpWFUKd7L/8cMi0FWr8ZjeRe6xFUbxsx7+QMt+Izf2fP9lmNeUG9V1i4
	r+P3pxeNqkZnkA6DxTV7JSYNouM51e0=
X-MC-Unique: 570G33pbNI-j4P4ohZf5Fg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAlWjWoEMOZw+xZxC0WiKGp4PGVHqFH6WrrAJ6wsQRw=;
        b=pF1PMhciodxBPNrHVw/IBSqU+Vd9ldq1mbJ8BJ03TYh8e3pyCArHdUjb6lcd3IfLPG
         WsjcnvYZD8Gc/OwqOjy/ztHzsgT/UcEc+RAPsKA5SuXZcoHktUaCQDPDqb+7sG8va6GJ
         D/SWEZsadPvujElD0RgwWcHu4FVTZhrPc4hJru8syOdsA2Elns4MLiUDmneoV8nbURqN
         t8Vm+x+60mScLK33/0NlZJTmk4GJs3eFN+0I86uRY2gXAVPo5CPtG2q7w6gDWWax5aHR
         DakbwSaELUvU7g2duxdDxMLk4Voa6QokhkRLFANz7i2FZ0PC7DfNq5qwVjNBB6IlXykR
         uR/g==
X-Gm-Message-State: AOAM533FJdba+q7gNQLpSb0TlDkC56xatPUnkFlVw5VTxr+lAbCA060b
	5Q5FZhjH6JKsgNvIsNnrXn1ZdILylZQ2h1Uo+fN0wD2tl2ikZnAdQQNma1E6LleYRLBkqsrLF3/
	DbhVAH45XUYJCrstlUYrNHOqkOmY=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr33450599wrt.275.1635804571734;
        Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtxtTYPSTZydDNAKjX/wG8BXfEAdBg4wUEf4pzVhU0q8NeY6R4dn/NUoY2vV1PgKczmSzIOA==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr33450569wrt.275.1635804571558;
        Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
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
Subject: [PULL 13/20] migration/ram: Handle RAMBlocks with a RamDiscardManager on the migration source
Date: Mon,  1 Nov 2021 23:09:05 +0100
Message-Id: <20211101220912.10039-14-quintela@redhat.com>
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

We don't want to migrate memory that corresponds to discarded ranges as
managed by a RamDiscardManager responsible for the mapped memory region of
the RAMBlock. The content of these pages is essentially stale and
without any guarantees for the VM ("logically unplugged").

Depending on the underlying memory type, even reading memory might populate
memory on the source, resulting in an undesired memory consumption. Of
course, on the destination, even writing a zeropage consumes memory,
which we also want to avoid (similar to free page hinting).

Currently, virtio-mem tries achieving that goal (not migrating "unplugged"
memory that was discarded) by going via qemu_guest_free_page_hint() - but
it's hackish and incomplete.

For example, background snapshots still end up reading all memory, as
they don't do bitmap syncs. Postcopy recovery code will re-add
previously cleared bits to the dirty bitmap and migrate them.

Let's consult the RamDiscardManager after setting up our dirty bitmap
initially and when postcopy recovery code reinitializes it: clear
corresponding bits in the dirty bitmaps (e.g., of the RAMBlock and inside
KVM). It's important to fixup the dirty bitmap *after* our initial bitmap
sync, such that the corresponding dirty bits in KVM are actually cleared.

As colo is incompatible with discarding of RAM and inhibits it, we don't
have to bother.

Note: if a misbehaving guest would use discarded ranges after migration
started we would still migrate that memory: however, then we already
populated that memory on the migration source.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index ae2601bf3b..e8c06f207c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -858,6 +858,60 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
+static void dirty_bitmap_clear_section(MemoryRegionSection *section,
+                                       void *opaque)
+{
+    const hwaddr offset = section->offset_within_region;
+    const hwaddr size = int128_get64(section->size);
+    const unsigned long start = offset >> TARGET_PAGE_BITS;
+    const unsigned long npages = size >> TARGET_PAGE_BITS;
+    RAMBlock *rb = section->mr->ram_block;
+    uint64_t *cleared_bits = opaque;
+
+    /*
+     * We don't grab ram_state->bitmap_mutex because we expect to run
+     * only when starting migration or during postcopy recovery where
+     * we don't have concurrent access.
+     */
+    if (!migration_in_postcopy() && !migrate_background_snapshot()) {
+        migration_clear_memory_region_dirty_bitmap_range(rb, start, npages);
+    }
+    *cleared_bits += bitmap_count_one_with_offset(rb->bmap, start, npages);
+    bitmap_clear(rb->bmap, start, npages);
+}
+
+/*
+ * Exclude all dirty pages from migration that fall into a discarded range as
+ * managed by a RamDiscardManager responsible for the mapped memory region of
+ * the RAMBlock. Clear the corresponding bits in the dirty bitmaps.
+ *
+ * Discarded pages ("logically unplugged") have undefined content and must
+ * not get migrated, because even reading these pages for migration might
+ * result in undesired behavior.
+ *
+ * Returns the number of cleared bits in the RAMBlock dirty bitmap.
+ *
+ * Note: The result is only stable while migrating (precopy/postcopy).
+ */
+static uint64_t ramblock_dirty_bitmap_clear_discarded_pages(RAMBlock *rb)
+{
+    uint64_t cleared_bits = 0;
+
+    if (rb->mr && rb->bmap && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = int128_make64(qemu_ram_get_used_length(rb)),
+        };
+
+        ram_discard_manager_replay_discarded(rdm, &section,
+                                             dirty_bitmap_clear_section,
+                                             &cleared_bits);
+    }
+    return cleared_bits;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
@@ -2675,6 +2729,19 @@ static void ram_list_init_bitmaps(void)
     }
 }
 
+static void migration_bitmap_clear_discarded_pages(RAMState *rs)
+{
+    unsigned long pages;
+    RAMBlock *rb;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
+            pages = ramblock_dirty_bitmap_clear_discarded_pages(rb);
+            rs->migration_dirty_pages -= pages;
+    }
+}
+
 static void ram_init_bitmaps(RAMState *rs)
 {
     /* For memory_global_dirty_log_start below.  */
@@ -2691,6 +2758,12 @@ static void ram_init_bitmaps(RAMState *rs)
     }
     qemu_mutex_unlock_ramlist();
     qemu_mutex_unlock_iothread();
+
+    /*
+     * After an eventual first bitmap sync, fixup the initial bitmap
+     * containing all 1s to exclude any discarded pages from migration.
+     */
+    migration_bitmap_clear_discarded_pages(rs);
 }
 
 static int ram_init_all(RAMState **rsp)
@@ -4119,6 +4192,10 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
      */
     bitmap_complement(block->bmap, block->bmap, nbits);
 
+    /* Clear dirty bits of discarded ranges that we don't want to migrate. */
+    ramblock_dirty_bitmap_clear_discarded_pages(block);
+
+    /* We'll recalculate migration_dirty_pages in ram_state_resume_prepare(). */
     trace_ram_dirty_bitmap_reload_complete(block->idstr);
 
     /*
-- 
2.33.1


