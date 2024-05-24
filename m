Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D78CE46B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729311.1134430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWo-0005xT-64; Fri, 24 May 2024 10:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729311.1134430; Fri, 24 May 2024 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWo-0005vS-2i; Fri, 24 May 2024 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 729311;
 Fri, 24 May 2024 10:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lVY=M3=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sASWn-0005h8-5G
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:52:01 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a55713ff-19bb-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 12:51:59 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e95abc7259so6768751fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:51:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcf4c32sm1421121fa.66.2024.05.24.03.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 03:51:57 -0700 (PDT)
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
X-Inumbo-ID: a55713ff-19bb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716547919; x=1717152719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=Tg3FNMBboZx20BiYsPxa1SM6q5Vk4G46zzScjpLP00Uqa5Xw8JFsocs6SpaboyuE8K
         x5LSBxJ05zW32ttuLuYZ8X8rO7kth3g4BqjS2QUhjz9/k1emvqCUDtWRTmzKtwoJSKsn
         p9yHOGLAze1OWuehrp+z8LQJ2/5YR+fqiani+hbfQMPkhd7P9dsmmW9BW8lYav9O9ECr
         T/jYD/76s30Em5nSLAF3zgEWjzzSEQHlasRCnLRdEEFhknsCkwBLzgTn7MOT0yPTPJxn
         ePozly39GugDYgSfHGLOoX0ZCUKxuJQoZMi8DRrilElyzwry8euM4q0Mhg+rHkePZdNy
         AORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716547919; x=1717152719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=fN9ym5fCjHRLOSH9dQk7lE5m/6/OkwME3hH9o79RHsGTCD0MbzZRzBW8JfAmauO3Ui
         j0A0GXpaz3x7mDxPUsbym67ihEJc4SUE52H379yUSff78KjF09LkS1+WlCYR1H6s0LAz
         ODddyE+ry5YnRgB3wiFFKc9+jJZ2lM7lw60RCh+gMCjbjbRiWCy+KxEPwS7waF5G4z1f
         0ubBa67dg9s22Zi/Uz1+8Mr3lyJaY6Dk1lua1wsYWn5KNTuL/mF7eJSQV+G+FBugsStp
         NLhDrHLukVPUn1cKqcTr5cCG5hqgW4B57wXj61gv+8TnyLSU7b6NmX0XXOGPUok/dpse
         rdiA==
X-Forwarded-Encrypted: i=1; AJvYcCXodxwlhHdV7HpjqiJZgVb/kPpGSuGf/EkVpLIXajx/OndWBhco47CMTt9+sT0+ybp9GV0zsSX02jORvv3BXHkhpKVby22TPGuZKkBB0Ss=
X-Gm-Message-State: AOJu0Yz17MvWknYm2bSFxrQptGIGGIpvWElIvj51+1+RpsKgWZ3qUwQi
	R88ABImeL12PDAu5WQQF2eBRT+Ke4mg5829I+1pzSTzf/kbFTz+z
X-Google-Smtp-Source: AGHT+IG7/58L7fP8XfkA17hx/P2HA+GooUSMBu7K0MzZTbJxr4odywyDF44eC1SlJ9lDqF4xGtjtyw==
X-Received: by 2002:a2e:8417:0:b0:2e5:751d:4b0f with SMTP id 38308e7fff4ca-2e95b2822ebmr10863631fa.34.1716547918939;
        Fri, 24 May 2024 03:51:58 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7 2/8] xen: mapcache: Unmap first entries in buckets
Date: Fri, 24 May 2024 12:51:46 +0200
Message-Id: <20240524105152.1301842-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
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


