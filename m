Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7EE8C79AB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723474.1128353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL6-00005W-Hl; Thu, 16 May 2024 15:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723474.1128353; Thu, 16 May 2024 15:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL6-0008Up-Cr; Thu, 16 May 2024 15:48:16 +0000
Received: by outflank-mailman (input) for mailman id 723474;
 Thu, 16 May 2024 15:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxoZ=MT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s7dL4-0008G5-Kp
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:48:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3daf367-139b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 17:48:13 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42016c8daa7so31427305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:48:13 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420193b0903sm135397305e9.47.2024.05.16.08.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:48:11 -0700 (PDT)
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
X-Inumbo-ID: b3daf367-139b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715874492; x=1716479292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=aho6bzCe+jDxNs4ys9vUT726OAdpjtZWNUfY80B3aVOIwdymqUwl2YyBOKYtA3Gh70
         SKtQzIib9/xxdPHaI1fKpD2STAPKLCPmbtA1N52qlyLQlb4R3htuz1HsbVOzQg8h1IDd
         wPglEJE7s6b7lIagoemGctAfZl6jQd6Mj9ScDgllSVk9vaCAT/vE3yEOWiZ3QrAwUReF
         DBvYhzwABOteiJQz0onRLbgs9Gc1JlwFj6T1Yj7BHn9VaYjNWck/sKqFaBMnnjrUu9vE
         gbFIst0ELd9NvA3nPNJXgC9xg08m2ohknXWReJ+AYHJ5Zy3m+vVnqKxQD9l9P5YHbaKo
         C+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874492; x=1716479292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=GRsrSdnR84iZGK98B+bMxOdD617Bk5gB9erpadPna3HHrOpmFE68EjgqYQ3Sj6o5z1
         CddrzOs2hTwPFAusqcp1LIYFxSliBQfsP934FWllMgk5scSuKssl4LKg4sVQ1/n2iR0U
         yrEYwq5e5vol5RS4OjVQ0kYf1MS2UTH6uHTlSOmczk4ipb0jcIWKqWTM4YpRniVrwcPv
         Ziex6xe4XM+MLnBh0YrZV3vncV1kDsxTWhUcjDAaPszmsGuYQU1cGYm5gwroiR76XxI6
         4PpaFJQnCYNgEMK6ycFiHwqhl/6THa+hSZ+T74voDU4/LGBhmY3ftbSaRGT27SNgyb5X
         EaUw==
X-Forwarded-Encrypted: i=1; AJvYcCVxsFHXRuhZS219ix2H84yIBOuk2oJAT4SNX1ZTGas5vT93vuJxVRtiJ+LVoNh+JjjXYJmzqbWsGKX5atGUTfQLl3wM7TvKGCJSqnfHgcA=
X-Gm-Message-State: AOJu0Yy74WKXIGLFaT8hn2ntdCiLYAOxFNwUwbNbIQY9vW+cRGh19kF6
	4hdMRXKinhk2/LvfBrLpQukl1/2j2UvFA8mTJTho2gpIqu3sPXt8
X-Google-Smtp-Source: AGHT+IFjr0fT67BiVLzPhzx72CFQaxGN4vZsogPbdN+2UbY4Li7I/8td4kLMOJN0uGIq1S8SJxxrwg==
X-Received: by 2002:a05:600c:154e:b0:41f:e959:9053 with SMTP id 5b1f17b1804b1-41fead6ae10mr166768825e9.38.1715874492348;
        Thu, 16 May 2024 08:48:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 2/8] xen: mapcache: Unmap first entries in buckets
Date: Thu, 16 May 2024 17:47:58 +0200
Message-Id: <20240516154804.1114245-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
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


