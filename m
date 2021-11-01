Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC68442329
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219452.380363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVC-0005kp-KD; Mon, 01 Nov 2021 22:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219452.380363; Mon, 01 Nov 2021 22:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVC-0005f5-7w; Mon, 01 Nov 2021 22:10:02 +0000
Received: by outflank-mailman (input) for mailman id 219452;
 Mon, 01 Nov 2021 22:10:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfV9-0000By-Uo
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6b2d1a7e-0af0-4180-a813-9d980d389361;
 Mon, 01 Nov 2021 22:09:44 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-xcyTHfv5PXuvlLEvakV6YA-1; Mon, 01 Nov 2021 18:09:41 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso6799441wri.17
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:40 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d24sm610262wmb.35.2021.11.01.15.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
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
X-Inumbo-ID: 6b2d1a7e-0af0-4180-a813-9d980d389361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DiI4EfnW7YWT1ASaakXUWvRZyN7+/5k2450FBy0sI4=;
	b=Xb0g7SXKN3gMQwrDbVTtqyQ9hWaE7hszEykvM35dqycnip/y5ibYBxuXLVIBAdWw6q+N2U
	ozD2VZb7xovP6qa1DsYYZ95Itzd4WUuSQYQ5thWAZ6ikfdb2nkLHOJjwkToK9FFLcRHDxC
	eTdjFTllwP1GqPbVN76tcWgEfVsg+DM=
X-MC-Unique: xcyTHfv5PXuvlLEvakV6YA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DiI4EfnW7YWT1ASaakXUWvRZyN7+/5k2450FBy0sI4=;
        b=wLnKDiV/fsXXFUTG2E/Xp/4LF9YCf7lziCLSUwsB8Ulr1daUseUDIQrd4BaEPP7N01
         AUFalc258gry9oEXQ2tN7vPS5k3eJ2TPH1XZv8MQz29D1VAu93kyKIjB5rnidWbNehBQ
         yHXLubUfglBXMNHyU2qWIw374AfDpfkiFcJEC8y7j6d/95gvPFX3khp+JtF6w+oVNaBL
         2FoEKMxK8wHDr5zhzxVug4md1NBCMcNNc9U2mYmT/WJD+WoViFNMtFpVTArk8kAWc7pR
         fBLdSLBFR8H7ZUnmmB4N1OsVAuVFE1b9szsBEl2BPjKRBm/4G2iIhEUcTgmIXglDDbwh
         PuFg==
X-Gm-Message-State: AOAM533D9ySq9D3QqPciMgb6zz4PLpoacHR75L52ePfr8OhkDhzVAdsq
	1hN8QONEMvsJnMIphOvsuYWgG8QVE8j0WUh7s9fLIhHpXWKoVbgNXXtQY7MuHB/nuDCKS169LrC
	cO0jbrK3TdF/xHUh6+afMUH7MBg8=
X-Received: by 2002:adf:e292:: with SMTP id v18mr39964931wri.369.1635804579986;
        Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysID67lQG9xljT2Fw7myH50fBYiqoMMqtw2ZP9fgHwBDYxBz5RqDHeu2EAgEpnNBhOmOcEEQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr39964906wri.369.1635804579845;
        Mon, 01 Nov 2021 15:09:39 -0700 (PDT)
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
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PULL 19/20] memory: introduce total_dirty_pages to stat dirty pages
Date: Mon,  1 Nov 2021 23:09:11 +0100
Message-Id: <20211101220912.10039-20-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

introduce global var total_dirty_pages to stat dirty pages
along with memory_global_dirty_log_sync.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/ram_addr.h | 9 +++++++++
 migration/dirtyrate.c   | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c913264a..64fb936c7c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,8 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 
+extern uint64_t total_dirty_pages;
+
 /**
  * clear_bmap_size: calculate clear bitmap size
  *
@@ -373,6 +375,10 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
+                        if (unlikely(
+                            global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                            total_dirty_pages += ctpopl(temp);
+                        }
                     }
 
                     if (tcg_enabled()) {
@@ -403,6 +409,9 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         for (i = 0; i < len; i++) {
             if (bitmap[i] != 0) {
                 c = leul_to_cpu(bitmap[i]);
+                if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                    total_dirty_pages += ctpopl(c);
+                }
                 do {
                     j = ctzl(c);
                     c &= ~(1ul << j);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index f92c4b498e..17b3d2cbb5 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -28,6 +28,13 @@
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
 
+/*
+ * total_dirty_pages is procted by BQL and is used
+ * to stat dirty pages during the period of two
+ * memory_global_dirty_log_sync
+ */
+uint64_t total_dirty_pages;
+
 typedef struct DirtyPageRecord {
     uint64_t start_pages;
     uint64_t end_pages;
-- 
2.33.1


