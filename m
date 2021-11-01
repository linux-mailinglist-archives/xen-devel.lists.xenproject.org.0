Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79918442325
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219430.380275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUk-0000yq-Gd; Mon, 01 Nov 2021 22:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219430.380275; Mon, 01 Nov 2021 22:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUk-0000v4-AL; Mon, 01 Nov 2021 22:09:34 +0000
Received: by outflank-mailman (input) for mailman id 219430;
 Mon, 01 Nov 2021 22:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUi-0000By-9t
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b65a47f6-8a9d-4e66-a3c3-9c5627dd4137;
 Mon, 01 Nov 2021 22:09:31 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-oaQcOdmsOy23wGt1XVINGQ-1; Mon, 01 Nov 2021 18:09:30 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so171636wmn.6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id q18sm658847wmc.7.2021.11.01.15.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:28 -0700 (PDT)
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
X-Inumbo-ID: b65a47f6-8a9d-4e66-a3c3-9c5627dd4137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGFGnLXWsheb/qmVvEQnfSbPAvk7Yei/m0I6VzGvNKw=;
	b=Dti34Bt/3o7YSr0yhjpfNanaxCofwtozWCTM4T7La4Hjfr0q02nOLKBBZdQ/259bpsDnf1
	kgXG+6pXs+BO95W++iTylv03wtdX+AbQO9MqteqCsMY9qQQtdIet9lUl/a27JhC8Uo06GZ
	OKBLF/BHr/C8ZZcBeAUxuOlBQq5UUJQ=
X-MC-Unique: oaQcOdmsOy23wGt1XVINGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGFGnLXWsheb/qmVvEQnfSbPAvk7Yei/m0I6VzGvNKw=;
        b=uaE21kGiSJ78Ttprwl//kRtpQoykKiuLyVLzEdo7gyNBB8MNyrSi+vxs4qwkp45us6
         P3IRk1Jkhsil0BjxCNEkmMl1Yl+FZBIowxHFq7Nf/Y/5gpQ+Jpt2aOKHx8oTrltxCTC3
         cueRf9nYQdEneh7kF3sPbbWZIKesqVSW4XJhN0clG49EJY2Vk5kxx6toPPcugoLshOWb
         FBFham2GHTGRcJiIZbFIjF2kV5CdRNNdaUBbw7VzO339+ZW9LgMPuZo1FMS/2HKMSeDk
         LGh8RvXzg3+NsVm35ywaxiw74hH2LkzAIotAcCRfUfj8P0kJkHBvkxv8Focczr4AHM1J
         GzBw==
X-Gm-Message-State: AOAM530QYkHRJEpOp2JGI9sgkfDADx7B6r907MbcA0uMQ+Qj24YcrTdB
	gwJGooqgqF8Du3yxgGnPvAlE45QgJZuWkhIxyiW7WITKPIMA3QZnsZ3Sr6pGeAPgBU5Wg3A9nuq
	X5PLNEDd8PA9pEbqTDXzK2QS3/D4=
X-Received: by 2002:a7b:cb52:: with SMTP id v18mr2063968wmj.10.1635804569185;
        Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycZK3+VR9iW1fa+cGg38G9Qb59TRFSiW9klW7eikgdbxXetfRBE2KmtCFvsskBng80n8r0wQ==
X-Received: by 2002:a7b:cb52:: with SMTP id v18mr2063943wmj.10.1635804569026;
        Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
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
Subject: [PULL 11/20] memory: Introduce replay_discarded callback for RamDiscardManager
Date: Mon,  1 Nov 2021 23:09:03 +0100
Message-Id: <20211101220912.10039-12-quintela@redhat.com>
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

Introduce replay_discarded callback similar to our existing
replay_populated callback, to be used my migration code to never migrate
discarded memory.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/memory.h | 21 +++++++++++++++++++++
 softmmu/memory.c      | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 04280450c9..20f1b27377 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -550,6 +550,7 @@ static inline void ram_discard_listener_init(RamDiscardListener *rdl,
 }
 
 typedef int (*ReplayRamPopulate)(MemoryRegionSection *section, void *opaque);
+typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
 
 /*
  * RamDiscardManagerClass:
@@ -638,6 +639,21 @@ struct RamDiscardManagerClass {
                             MemoryRegionSection *section,
                             ReplayRamPopulate replay_fn, void *opaque);
 
+    /**
+     * @replay_discarded:
+     *
+     * Call the #ReplayRamDiscard callback for all discarded parts within the
+     * #MemoryRegionSection via the #RamDiscardManager.
+     *
+     * @rdm: the #RamDiscardManager
+     * @section: the #MemoryRegionSection
+     * @replay_fn: the #ReplayRamDiscard callback
+     * @opaque: pointer to forward to the callback
+     */
+    void (*replay_discarded)(const RamDiscardManager *rdm,
+                             MemoryRegionSection *section,
+                             ReplayRamDiscard replay_fn, void *opaque);
+
     /**
      * @register_listener:
      *
@@ -682,6 +698,11 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
                                          ReplayRamPopulate replay_fn,
                                          void *opaque);
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque);
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index f2ac0d2e89..7340e19ff5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2081,6 +2081,17 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
     return rdmc->replay_populated(rdm, section, replay_fn, opaque);
 }
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->replay_discarded);
+    rdmc->replay_discarded(rdm, section, replay_fn, opaque);
+}
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section)
-- 
2.33.1


