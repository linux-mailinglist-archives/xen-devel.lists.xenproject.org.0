Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C1442328
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219449.380352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfV7-0004y6-11; Mon, 01 Nov 2021 22:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219449.380352; Mon, 01 Nov 2021 22:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfV6-0004uf-Rv; Mon, 01 Nov 2021 22:09:56 +0000
Received: by outflank-mailman (input) for mailman id 219449;
 Mon, 01 Nov 2021 22:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfV5-0007pr-OE
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 61ecb4d2-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:28 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-1I9Q6WROPouj75ijb7n91g-1; Mon, 01 Nov 2021 18:09:27 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso6748669wrj.20
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u16sm620998wmc.21.2021.11.01.15.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:25 -0700 (PDT)
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
X-Inumbo-ID: 61ecb4d2-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xgA8Pg4pioYTYcQYYaUz2yN31K5Rcv8HQjmwYm8rweY=;
	b=P3PUolCz4j4ymEn/0u53vtsuTYUJ2crPH6lHWspESqFkkPYiBJ2ZFimpYFTl3CEJfed1b3
	eBQubuPdQ83yo3v71Fs0IpFQi52Qjmd4csSJO0cCyI+Cz6QL9ngRmga2MadZqlwu73xsUP
	DVjT94/OzHHw/2r3QDvTeIbtgrP7Aus=
X-MC-Unique: 1I9Q6WROPouj75ijb7n91g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xgA8Pg4pioYTYcQYYaUz2yN31K5Rcv8HQjmwYm8rweY=;
        b=ojdnY+mxsT4AP/6/20bLnTMobtYctrO/o2KlhCgGYHw3n4WAfS6v1AsCX6yHe4Stn5
         mAv/M2znq/JEzHqZ0gyT11aPFMppJDWHHaDXGaEz9FC/qe+BxcLKZr/U9hd9hy9OefRW
         9DVvi7fAprkXwQsWwH/7gDtgz/CxGEb64daX9Fb3f8uPJJ0zkU34LwUasClm8/EPN4W7
         NOscsXCEq6rul1bJcM63zQH2NkGIK8Bs7LQmid4ZtwAvyGf+z42ik8OVgOym9DiT/r4h
         tCvg79beY5m3/1yl2xU0v0YT2fL1UR0sP/VxlceTH2VMRZcGRcIbkztdL59k7OJe6QiL
         tZyw==
X-Gm-Message-State: AOAM530ZR2IS499UrAZDWvvD4gn94SOPuxLxLEJb9+nd5xtooeLll2xJ
	aVudnqflFA5NSCGDNGwZlqUPw1uZElpcbrf/Q5BPOhSdAhfTB40byWCHTTiOAp6XI0ApCdgfA2b
	vGN0pf/FjFwXkLwlPUVHDRE4hhqQ=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr40015414wrg.154.1635804566477;
        Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUrxZpRrNYU7lx4z1CYr7OY2cCtGorBz1ob+LkkuKyWgUku8HgKdZfOfBOrsPY7hoBqfW6RQ==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr40015380wrg.154.1635804566314;
        Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
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
Subject: [PULL 09/20] migration: Add migrate_add_blocker_internal()
Date: Mon,  1 Nov 2021 23:09:01 +0100
Message-Id: <20211101220912.10039-10-quintela@redhat.com>
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

An internal version that removes -only-migratable implications.  It can be used
for temporary migration blockers like dump-guest-memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/blocker.h | 16 ++++++++++++++++
 migration/migration.c       | 21 +++++++++++++--------
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index acd27018e9..9cebe2ba06 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -25,6 +25,22 @@
  */
 int migrate_add_blocker(Error *reason, Error **errp);
 
+/**
+ * @migrate_add_blocker_internal - prevent migration from proceeding without
+ *                                 only-migrate implications
+ *
+ * @reason - an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @returns - 0 on success, -EBUSY on failure, with errp set.
+ *
+ * Some of the migration blockers can be temporary (e.g., for a few seconds),
+ * so it shouldn't need to conflict with "-only-migratable".  For those cases,
+ * we can call this function rather than @migrate_add_blocker().
+ */
+int migrate_add_blocker_internal(Error *reason, Error **errp);
+
 /**
  * @migrate_del_blocker - remove a blocking error from migration
  *
diff --git a/migration/migration.c b/migration/migration.c
index e81e473f5a..e1c0082530 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2049,15 +2049,8 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-int migrate_add_blocker(Error *reason, Error **errp)
+int migrate_add_blocker_internal(Error *reason, Error **errp)
 {
-    if (only_migratable) {
-        error_propagate_prepend(errp, error_copy(reason),
-                                "disallowing migration blocker "
-                                "(--only-migratable) for: ");
-        return -EACCES;
-    }
-
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
         error_propagate_prepend(errp, error_copy(reason),
@@ -2070,6 +2063,18 @@ int migrate_add_blocker(Error *reason, Error **errp)
     return 0;
 }
 
+int migrate_add_blocker(Error *reason, Error **errp)
+{
+    if (only_migratable) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(--only-migratable) for: ");
+        return -EACCES;
+    }
+
+    return migrate_add_blocker_internal(reason, errp);
+}
+
 void migrate_del_blocker(Error *reason)
 {
     migration_blockers = g_slist_remove(migration_blockers, reason);
-- 
2.33.1


