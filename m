Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C38D38BA
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731991.1137781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy0-0004W3-AG; Wed, 29 May 2024 14:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731991.1137781; Wed, 29 May 2024 14:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy0-0004U9-5p; Wed, 29 May 2024 14:07:48 +0000
Received: by outflank-mailman (input) for mailman id 731991;
 Wed, 29 May 2024 14:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nLQ=NA=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sCJxy-0004Fc-6z
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:07:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ef8959-1dc4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:07:44 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52ab1d7243fso1309798e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:07:44 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b233sm1274418e87.135.2024.05.29.07.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:07:42 -0700 (PDT)
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
X-Inumbo-ID: d1ef8959-1dc4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716991664; x=1717596464; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=FVt1ngxRLYD1k7hvosEvjumaiPvYRKgMOLSuMGarKcuTVZTzSxEeN8rKR1NUZl+mi5
         /iZY4xs3MHZOQhUCXrXb+ESynSEjxvPHo/IimW7RSSo8lEJn+T67B8opXVMC4zSHYINu
         EsbpDLo4z7j+U0l8vKjOsPs2wCs5qNqIYHgItXZzTABZJeNT3hKDi87Sq7XSAW9QbA5j
         y57EHS3XiQl7ScWMWeaOpfllUYrprMgMrk+EUnw7QumZThyp6W/67ZX/8iu7IYZKovQD
         6xDsH8XruihqB3mGeXuQYuQwoc0TteibaikDYPr2UIJWJd9iJYYIigHIUZwyCsUio5r6
         f1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991664; x=1717596464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=XUZoH+llZJFkUagjVEvlOGJPCeA/RUVNzIJbcY5McfXT7XauDkXKKDuQvAeHe7CsjW
         YRx6QiXQRCfnM6R4T8kZEbIcUVTfIy6+eWrfWM85Z6Qiua57YsQAo0JwCyilC4ezrsQm
         N4q63+Y3eI3tdP9iu2mq4EOuvCziXn4TW7DtXrGnyG4Kx7kSDQxYdqQwsXV/gzE5I+C9
         cqvRbdAzCyGp3e8SBtzD24TA0+v7pmj+rjWwtD5wdcQqYe3MgnrDh4RLjdfe0uHLXzxc
         KVia15B04xOxkPYQS1nmZC5D4g2j4r07cBk40ASrh1JajFxNyq69Cdr/GoeZUQTrqz6T
         7Z8w==
X-Forwarded-Encrypted: i=1; AJvYcCV36Yczd0UzPednRoF+T9lucLpAtnG62olT0Qh7cuRv9oHJlq/gz8QGKfofP1647k4Z2CXSjs0LzRRjn3DMx7Lvxz9gPQUTbA4Xm8P6vXs=
X-Gm-Message-State: AOJu0YxexOGC/uzxYNQVEBTg5V1VqGN/QonnR6a4NxhaO23mDkwKKc8p
	SdrwWmzw/OKy2TrQhX1fmqRklb/TfgPHifz/Do1BNgBlxaDv/lYk
X-Google-Smtp-Source: AGHT+IGdkBzBgEhHrd1LW9KAGa/cGv5sdiBTlj+GoDqEM5VjT/z9rWbfYzsj/AoEXZVsdTS9qD3Uag==
X-Received: by 2002:a05:6512:3b12:b0:51d:2529:7c4d with SMTP id 2adb3069b0e04-52961a82092mr14632029e87.0.1716991663724;
        Wed, 29 May 2024 07:07:43 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v8 2/8] xen: mapcache: Unmap first entries in buckets
Date: Wed, 29 May 2024 16:07:33 +0200
Message-Id: <20240529140739.1387692-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

When invalidating memory ranges, if we happen to hit the first
entry in a bucket we were never unmapping it. This was harmless
for foreign mappings but now that we're looking to reuse the
mapcache for transient grant mappings, we must unmap entries
when invalidated.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index bc860f4373..ec95445696 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -491,18 +491,23 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
         return;
     }
     entry->lock--;
-    if (entry->lock > 0 || pentry == NULL) {
+    if (entry->lock > 0) {
         return;
     }
 
-    pentry->next = entry->next;
     ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
     if (munmap(entry->vaddr_base, entry->size) != 0) {
         perror("unmap fails");
         exit(-1);
     }
+
     g_free(entry->valid_mapping);
-    g_free(entry);
+    if (pentry) {
+        pentry->next = entry->next;
+        g_free(entry);
+    } else {
+        memset(entry, 0, sizeof *entry);
+    }
 }
 
 typedef struct XenMapCacheData {
-- 
2.40.1


