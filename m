Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271D44231D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219428.380252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUf-0000H7-Nv; Mon, 01 Nov 2021 22:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219428.380252; Mon, 01 Nov 2021 22:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUf-0000FE-KC; Mon, 01 Nov 2021 22:09:29 +0000
Received: by outflank-mailman (input) for mailman id 219428;
 Mon, 01 Nov 2021 22:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUe-0000By-BX
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:28 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id faed5ff8-c9c6-43ca-808f-521c3c679996;
 Mon, 01 Nov 2021 22:09:27 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-TpMtcGBdNeesXy2DrtFEFQ-1; Mon, 01 Nov 2021 18:09:26 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso1198922wrw.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o17sm685487wmq.11.2021.11.01.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:24 -0700 (PDT)
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
X-Inumbo-ID: faed5ff8-c9c6-43ca-808f-521c3c679996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGo9WanuJU04tuhhnw4peEWGOBw6c3WDbeGbMBl0UrM=;
	b=CxE49QFwEnLn5ozH0njoOjqV0y/Y9CbD0DHU97jOrCpeiZ73tHyjt2KFCAkRCrotaFm8PT
	IOP4IFxlq+NBRFVWHQC+dynHM0bhn+EQJe3r+cRU1Sr4oouxMZaZK6gT+ZwT4lBt5cvNBf
	w9Cl+GmwmkIY40c9fqDupbx4Sf43htg=
X-MC-Unique: TpMtcGBdNeesXy2DrtFEFQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGo9WanuJU04tuhhnw4peEWGOBw6c3WDbeGbMBl0UrM=;
        b=v3VabxmKuOXMtxhN/3foCTRQD0Ig48DNpNt2XkKDiICJahE8tlavhjnQPhK5ITRkaX
         JRRKAPwl7VUOl0aGG8kgnx9UJH5zMqE/NPHzolt5pueYGZhdV1vveJpbU4DkmtqmD4rn
         bQjeIu6yXtRMaQbo9uyBRAXc4nlJ/Mb3FoFbi98X00m/kqCvJWZgBfgEI+8oINcC8Vtf
         LS4XUyfpJHjiS60qDPGCPLSyvHobEzpHv4eR/f8PgFy8vsnS4mV0I9UiA9LkJxFkiTVC
         ZkG8Jh6uGKZbHDP12q9CV5lP2pe3J5UwSCGTqQIo4F9ppReM6VZF75ymfSCbiZL9+0P/
         Jn0A==
X-Gm-Message-State: AOAM530y5dVFML1YVVIOY0n6n/TVsuq2omMrQ4eSbrm+UiRiMxheKr2s
	1nBAtHwyaX712b3ReMnPqSQEDr9BMPcUg+a3ZVVHooP16w4heBhOtKvueRASJAgfIdZGSXonWPY
	PZY8glQ/L3UBVcSOH1djOrmhCv5k=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1955936wmc.9.1635804565091;
        Mon, 01 Nov 2021 15:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpSY2086+CnGB9WPrHW5bo96aeVOpNDlLfr+WAapyjvAt6zv6pqshWIvxGHLts1sX02fyU2g==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1955923wmc.9.1635804564942;
        Mon, 01 Nov 2021 15:09:24 -0700 (PDT)
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
Subject: [PULL 08/20] migration: Make migration blocker work for snapshots too
Date: Mon,  1 Nov 2021 23:09:00 +0100
Message-Id: <20211101220912.10039-9-quintela@redhat.com>
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

From: Peter Xu <peterx@redhat.com>

save_snapshot() checks migration blocker, which looks sane.  At the meantime we
should also teach the blocker add helper to fail if during a snapshot, just
like for migrations.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9172686b89..e81e473f5a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2058,15 +2058,16 @@ int migrate_add_blocker(Error *reason, Error **errp)
         return -EACCES;
     }
 
-    if (migration_is_idle()) {
-        migration_blockers = g_slist_prepend(migration_blockers, reason);
-        return 0;
+    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
+    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(migration/snapshot in progress) for: ");
+        return -EBUSY;
     }
 
-    error_propagate_prepend(errp, error_copy(reason),
-                            "disallowing migration blocker "
-                            "(migration in progress) for: ");
-    return -EBUSY;
+    migration_blockers = g_slist_prepend(migration_blockers, reason);
+    return 0;
 }
 
 void migrate_del_blocker(Error *reason)
-- 
2.33.1


