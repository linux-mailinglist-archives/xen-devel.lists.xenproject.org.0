Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472C44232A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219453.380368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVD-0005oM-1i; Mon, 01 Nov 2021 22:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219453.380368; Mon, 01 Nov 2021 22:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfVC-0005kM-MO; Mon, 01 Nov 2021 22:10:02 +0000
Received: by outflank-mailman (input) for mailman id 219453;
 Mon, 01 Nov 2021 22:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfVA-0007pr-OS
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:10:00 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 62e4f7fa-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:30 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-4X10BvvaO2m5-Rv-dpJHvA-1; Mon, 01 Nov 2021 18:09:29 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3974740wro.19
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o17sm685550wmq.11.2021.11.01.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
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
X-Inumbo-ID: 62e4f7fa-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eb45pt+rx+z3d/QNqQ0ka/rPHoe06plBoXsL9wFgC3A=;
	b=XtbMSMGTQZvMco2cqRvB6sMNp2kXWpDgubhBSI/o3ct+u0hRuPelBE3jucBTFg1jjr/Why
	kLLoLyLGU6A1J7RIr1r7Aw5eUqFBllDRjog5qJtscdAYk0Pcq6YnQA8umpeYe5Vf8y85l5
	1KXLUFCxkvc4P7/ZD47YRfIPjKRP2l4=
X-MC-Unique: 4X10BvvaO2m5-Rv-dpJHvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eb45pt+rx+z3d/QNqQ0ka/rPHoe06plBoXsL9wFgC3A=;
        b=aYJn7Rxn/khwZxZTbJUD7I1kCMlJq+CtZe9BOtRhaP8thZJ0p2EjCV3/jTbEmBJA3e
         tb8IoaKUSx51lTjNX3B0IPxsU1MO8jIazFgdZIRF2PHP2hIuAR2Tem2xGHYuBIDT6pbQ
         TROZoOhnws655eeOIMm/PCcxbPzo39l1jFec1GVkvaykac8HjWluGWFTFMharn1tsBZv
         O0s9BMJxg0C5efXs+Lv9w41zWRXEaIwFEAR3camGtHcmND+36ChB8hpxDeV6awP9z713
         4n93ZblyM8L4QN7zyZ6nTA+57tM12TGyLch/EdpA/GINOHFrugzwi4hvf/SFEK0kL+Ve
         8JVQ==
X-Gm-Message-State: AOAM530xlU421PpnKjlZxWHr8bcUhNHN6eh22vOhMS9IcXiqm7VZx5gd
	GSCGrBl0eZD5RqH+spYncmNLWXG7gQqlKvhntPpgljVAxiDsiEqFBvKNG553eCc2X8x+F1E4fvQ
	Y9kVIp4fpp79p/8VT4svmj3KyAGg=
X-Received: by 2002:adf:e387:: with SMTP id e7mr30508149wrm.412.1635804567993;
        Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTDcj674kEGI9dl471cqGKZI5Q3j6okD5bAskecUMcRegbtpEz5VGFYHzxKsv8krfzx5uJsg==
X-Received: by 2002:adf:e387:: with SMTP id e7mr30508114wrm.412.1635804567768;
        Mon, 01 Nov 2021 15:09:27 -0700 (PDT)
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
Subject: [PULL 10/20] dump-guest-memory: Block live migration
Date: Mon,  1 Nov 2021 23:09:02 +0100
Message-Id: <20211101220912.10039-11-quintela@redhat.com>
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

Both dump-guest-memory and live migration caches vm state at the beginning.
Either of them entering the other one will cause race on the vm state, and even
more severe on that (please refer to the crash report in the bug link).

Let's block live migration in dump-guest-memory, and that'll also block
dump-guest-memory if it detected that we're during a live migration.

Side note: migrate_del_blocker() can be called even if the blocker is not
inserted yet, so it's safe to unconditionally delete that blocker in
dump_cleanup (g_slist_remove allows no-entry-found case).

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 dump/dump.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index ab625909f3..662d0a62cd 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
+#include "migration/blocker.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
@@ -47,6 +48,8 @@
 
 #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
 
+static Error *dump_migration_blocker;
+
 #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
     ((DIV_ROUND_UP((hdr_size), 4) +                     \
       DIV_ROUND_UP((name_size), 4) +                    \
@@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
             qemu_mutex_unlock_iothread();
         }
     }
+    migrate_del_blocker(dump_migration_blocker);
 
     return 0;
 }
@@ -2005,6 +2009,21 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
+    if (!dump_migration_blocker) {
+        error_setg(&dump_migration_blocker,
+                   "Live migration disabled: dump-guest-memory in progress");
+    }
+
+    /*
+     * Allows even for -only-migratable, but forbid migration during the
+     * process of dump guest memory.
+     */
+    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
+        /* Remember to release the fd before passing it over to dump state */
+        close(fd);
+        return;
+    }
+
     s = &dump_state_global;
     dump_state_prepare(s);
 
-- 
2.33.1


