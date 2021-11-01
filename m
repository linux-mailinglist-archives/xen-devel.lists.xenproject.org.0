Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F244232B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219456.380384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVH-0006q5-8Q; Mon, 01 Nov 2021 22:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219456.380384; Mon, 01 Nov 2021 22:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVH-0006kq-3G; Mon, 01 Nov 2021 22:10:07 +0000
Received: by outflank-mailman (input) for mailman id 219456;
 Mon, 01 Nov 2021 22:10:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVF-0007pr-Ov
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 645c45ac-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:32 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-P0W4ND1lNVGjo1WzmCnSTw-1; Mon, 01 Nov 2021 18:09:31 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so4821993wrw.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f133sm655275wmf.31.2021.11.01.15.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
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
X-Inumbo-ID: 645c45ac-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSoWVIR9hKZoxnk9uhtu16nhbmo8V4KFxeuBGBhsQZ8=;
	b=g5IBJUWP2yKXZE+swNWoz9MBOkji3KR974PW0xf/9MkNpokE954S+yRF1gFvJn24o2UjMg
	cOTc1HmEfYynv9itQrGPCQIndoC8P+9NdqxrJrShp3vqt87/CsaN/qU5L0yhXJ2ZiCunuC
	c6BgNTrRAE0hI1SCCRbvY39s/D5q2sY=
X-MC-Unique: P0W4ND1lNVGjo1WzmCnSTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSoWVIR9hKZoxnk9uhtu16nhbmo8V4KFxeuBGBhsQZ8=;
        b=gWdYUV47bsH1KQjLMDUsUHb1ERdqL6wRrjCaF93Y/MOSW4N8kM5jbzRSi7os/UyfcU
         9e/aUhMhIicOKZRJAJFVWtecytkAGH6AzMwAsStdM5+A11/J5c8Ekpa/hA9LVbjZTuEc
         CdJrWVQgO9mYRidHhqfaVc7SMWK22JCRmocQIGOye0EKpV0HRSSqfcgA0n6h11UnyiF1
         CVG6dK6ybsMMEzA8lZ2OYbtXwri6J3maxso/GbN9zu/90fZTeFBvi51IkDa7cS6H3KYM
         3KLpSb/1UaQlPgLp21x3CAmBKafziyWHKwbV9toGgaxhqyA3/r+lXxcM8NrBn+YnS+/c
         yM6A==
X-Gm-Message-State: AOAM532vRyj2GQ2aOSfZdDDl0iw6Dr44XtAWBj/DgT17i4PCvnmS8JCh
	X2hBDuFjiwGmvFJoPOW0wqICL5e0FEX1JiimJlJP+VXcNLi2zzhfK3KRRSKx3bJrYm5Z6lzk88p
	uVN8YgD7n3Fnli6mz6JERwQHY9u8=
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr1960964wmh.19.1635804570445;
        Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/QxnhEuNymsrQqTg8NiGiNIcnxGmbn+stcw6LipoHUBGhkcJBUusifbHj5C9b6NJX/heIQ==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr1960945wmh.19.1635804570300;
        Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
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
Subject: [PULL 12/20] virtio-mem: Implement replay_discarded RamDiscardManager callback
Date: Mon,  1 Nov 2021 23:09:04 +0100
Message-Id: <20211101220912.10039-13-quintela@redhat.com>
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

Implement it similar to the replay_populated callback.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/virtio/virtio-mem.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index df91e454b2..284096ec5f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -228,6 +228,38 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
     return ret;
 }
 
+static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
+                                                 MemoryRegionSection *s,
+                                                 void *arg,
+                                                 virtio_mem_section_cb cb)
+{
+    unsigned long first_bit, last_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
+    while (first_bit < vmem->bitmap_size) {
+        MemoryRegionSection tmp = *s;
+
+        offset = first_bit * vmem->block_size;
+        last_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                 first_bit + 1) - 1;
+        size = (last_bit - first_bit + 1) * vmem->block_size;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            break;
+        }
+        ret = cb(&tmp, arg);
+        if (ret) {
+            break;
+        }
+        first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                       last_bit + 2);
+    }
+    return ret;
+}
+
 static int virtio_mem_notify_populate_cb(MemoryRegionSection *s, void *arg)
 {
     RamDiscardListener *rdl = arg;
@@ -1170,6 +1202,31 @@ static int virtio_mem_rdm_replay_populated(const RamDiscardManager *rdm,
                                             virtio_mem_rdm_replay_populated_cb);
 }
 
+static int virtio_mem_rdm_replay_discarded_cb(MemoryRegionSection *s,
+                                              void *arg)
+{
+    struct VirtIOMEMReplayData *data = arg;
+
+    ((ReplayRamDiscard)data->fn)(s, data->opaque);
+    return 0;
+}
+
+static void virtio_mem_rdm_replay_discarded(const RamDiscardManager *rdm,
+                                            MemoryRegionSection *s,
+                                            ReplayRamDiscard replay_fn,
+                                            void *opaque)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    struct VirtIOMEMReplayData data = {
+        .fn = replay_fn,
+        .opaque = opaque,
+    };
+
+    g_assert(s->mr == &vmem->memdev->mr);
+    virtio_mem_for_each_unplugged_section(vmem, s, &data,
+                                          virtio_mem_rdm_replay_discarded_cb);
+}
+
 static void virtio_mem_rdm_register_listener(RamDiscardManager *rdm,
                                              RamDiscardListener *rdl,
                                              MemoryRegionSection *s)
@@ -1234,6 +1291,7 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
     rdmc->is_populated = virtio_mem_rdm_is_populated;
     rdmc->replay_populated = virtio_mem_rdm_replay_populated;
+    rdmc->replay_discarded = virtio_mem_rdm_replay_discarded;
     rdmc->register_listener = virtio_mem_rdm_register_listener;
     rdmc->unregister_listener = virtio_mem_rdm_unregister_listener;
 }
-- 
2.33.1


