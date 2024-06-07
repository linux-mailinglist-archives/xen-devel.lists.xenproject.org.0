Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C748FFEEF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 11:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736428.1142510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVbp-00075f-4I; Fri, 07 Jun 2024 09:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736428.1142510; Fri, 07 Jun 2024 09:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVbp-00072J-1W; Fri, 07 Jun 2024 09:10:05 +0000
Received: by outflank-mailman (input) for mailman id 736428;
 Fri, 07 Jun 2024 09:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NiIp=NJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sFVbn-0006BI-N6
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 09:10:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b51881a3-24ad-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 11:09:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-FnEQzJIXPkGraVrUGETiZw-1; Fri, 07 Jun 2024 05:09:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F3680B5C7;
 Fri,  7 Jun 2024 09:09:45 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D69F37E5;
 Fri,  7 Jun 2024 09:09:40 +0000 (UTC)
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
X-Inumbo-ID: b51881a3-24ad-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717751395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QzQrIOtS4DHvHPJ4+HHeRZGer7eituw1+x4QYHDabqc=;
	b=XqqJf/iFUUg+4jjekoOLnI0ZIzgLyta3BRrfvQQMtV+umQpgcMJJspR+mwPP58xqLPOpED
	Ni18FsDCECejZ+MEgIXOSUjsizDBKfZLtfw3K/VE5cM7sNKCvoTgpfcy5lDO70U7J/JVni
	6izv9q0obGBHxrQa6PlPQq5tkONUG7c=
X-MC-Unique: FnEQzJIXPkGraVrUGETiZw-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	kasan-dev@googlegroups.com,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH v1 0/3] mm/memory_hotplug: use PageOffline() instead of PageReserved() for !ZONE_DEVICE
Date: Fri,  7 Jun 2024 11:09:35 +0200
Message-ID: <20240607090939.89524-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

This can be a considered a long-overdue follow-up to some parts of [1].
The patches are based on [2], but they are not strictly required -- just
makes it clearer why we can use adjust_managed_page_count() for memory
hotplug without going into details about highmem.

We stop initializing pages with PageReserved() in memory hotplug code --
except when dealing with ZONE_DEVICE for now. Instead, we use
PageOffline(): all pages are initialized to PageOffline() when onlining a
memory section, and only the ones actually getting exposed to the
system/page allocator will get PageOffline cleared.

This way, we enlighten memory hotplug more about PageOffline() pages and
can cleanup some hacks we have in virtio-mem code.

What about ZONE_DEVICE? PageOffline() is wrong, but we might just stop
using PageReserved() for them later by simply checking for
is_zone_device_page() at suitable places. That will be a separate patch
set / proposal.

This primarily affects virtio-mem, HV-balloon and XEN balloon. I only
briefly tested with virtio-mem, which benefits most from these cleanups.

[1] https://lore.kernel.org/all/20191024120938.11237-1-david@redhat.com/
[2] https://lkml.kernel.org/r/20240607083711.62833-1-david@redhat.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>

David Hildenbrand (3):
  mm: pass meminit_context to __free_pages_core()
  mm/memory_hotplug: initialize memmap of !ZONE_DEVICE with
    PageOffline() instead of PageReserved()
  mm/memory_hotplug: skip adjust_managed_page_count() for PageOffline()
    pages when offlining

 drivers/hv/hv_balloon.c        |  5 ++--
 drivers/virtio/virtio_mem.c    | 29 +++++++++---------
 drivers/xen/balloon.c          |  9 ++++--
 include/linux/memory_hotplug.h |  4 +--
 include/linux/page-flags.h     | 20 +++++++------
 mm/internal.h                  |  3 +-
 mm/kmsan/init.c                |  2 +-
 mm/memory_hotplug.c            | 31 +++++++++----------
 mm/mm_init.c                   | 14 ++++++---
 mm/page_alloc.c                | 55 +++++++++++++++++++++++++++-------
 10 files changed, 108 insertions(+), 64 deletions(-)


base-commit: 19b8422c5bd56fb5e7085995801c6543a98bda1f
prerequisite-patch-id: ca280eafd2732d7912e0c5249dc0df9ecbef19ca
prerequisite-patch-id: 8f43ebc81fdf7b9b665b57614e9e569535094758
-- 
2.45.1


