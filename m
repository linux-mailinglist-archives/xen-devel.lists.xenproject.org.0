Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B48B7D9C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715056.1116545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgX-0005Fe-Uz; Tue, 30 Apr 2024 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715056.1116545; Tue, 30 Apr 2024 16:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgX-00058b-QF; Tue, 30 Apr 2024 16:50:29 +0000
Received: by outflank-mailman (input) for mailman id 715056;
 Tue, 30 Apr 2024 16:50:28 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgV-0003oL-Su
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:27 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbabb852-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:21 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5196fe87775so6618014e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:21 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05651210c300b0051d7d7a21d7sm1000646lfg.308.2024.04.30.09.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:19 -0700 (PDT)
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
X-Inumbo-ID: bbabb852-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495821; x=1715100621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ebca77e5IYL9WEAaF2UYa4r/GkVpnh2Kl3ta9A5c+4=;
        b=LuQ742VUw+vkIfqZxv5gWWnyAs4uVlIPMUOi9VOnVpF2WcdU1h2nI10VNUKCe4H4pv
         TgRgqT1PcnMpCcg+/OOtzyFtY10oyHryikU7Wxpg8y7IT44KigBCZY7hGeZs6rq5dA3U
         uMHA3iv7yN9PmYOzQafQa2bxzO1qxMI/Q8Fw+hDlzOFRQIHSJ3oGaCOomQEtrWb35+sy
         dchR3NJontNUQuOAR9NSeCPaD4UzbwY1PPgGgiU+eQKHHOInCrZp4q8n4R3nr9rPjiOd
         nLmJtJG7SRG0PNFfsrlaaaMpjEqmLYJlbG+8GLLoxos9ULr12dukbX5PIC8q9BIr/4or
         mnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495821; x=1715100621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ebca77e5IYL9WEAaF2UYa4r/GkVpnh2Kl3ta9A5c+4=;
        b=TRrQc13rwuoeMLqtRL/f30XKDnHFckXvLRuGmYtH9sSGgHl0k6dzj0dGRh1XyHweFz
         8TcmDtKCv83Sy1T19zb2XJnjhp8dWx7L4mJ/Ra0ExXxCeauehde6QJTVOh6bl3PsSA9t
         JOAkFg0cY0nnlovanTwIgaEWivzYTgm6XoG42WUV7HKrMXCskh3Zg28Og/aYpu3ctEVA
         buHu9Fs5XAGMhyH5EJff6F1Ao6YugRfgsLJ07WDhMg0Ub5Clko6ov4RriigO3psF23xj
         +k/9EajyiKzyq+TVV4eWs7VVoC27V5K1TsYR1qDRQcsdwM1BqXmnN6gW34MA+s5YbBsd
         kxYA==
X-Forwarded-Encrypted: i=1; AJvYcCVKGrAu/sa4+UCb/yZuGzCdcTpt48o5vbK198otY8ClGgv7aV6OcCxGUlQoF4H6j6fBzOZB8TNcspmRMGgg80aSL/gTZyA/dRuosnnMBWw=
X-Gm-Message-State: AOJu0Yy5hLY7/meWhc3nycHh+40AidgKrjARwO+bgZp11jsrRwC2Q+PR
	HOiGJHvZL5dGNzk9CBP4PV2gNL+gkw+ImL1q9UZ3pAc97uNPj8HE
X-Google-Smtp-Source: AGHT+IEM3Jz9S/DKrWu5RICfZqu5IuAbuhDXbfyJpfQLWPTCw63HqZI9CE91kUAd3S8w9gG9YoAS8w==
X-Received: by 2002:a05:6512:1386:b0:516:cc06:fa03 with SMTP id fc6-20020a056512138600b00516cc06fa03mr23704lfb.56.1714495821221;
        Tue, 30 Apr 2024 09:50:21 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 06/17] xen: mapcache: Break out xen_ram_addr_from_mapcache_single
Date: Tue, 30 Apr 2024 18:49:28 +0200
Message-Id: <20240430164939.925307-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out xen_ram_addr_from_mapcache_single(), a multi-cache
aware version of xen_ram_addr_from_mapcache.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 326a9b61ca..d2deff70c8 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -377,7 +377,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
     return p;
 }
 
-ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
 {
     MapCacheEntry *entry = NULL;
     MapCacheRev *reventry;
@@ -386,8 +386,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     ram_addr_t raddr;
     int found = 0;
 
-    mapcache_lock(mapcache);
-    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
+    mapcache_lock(mc);
+    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
         if (reventry->vaddr_req == ptr) {
             paddr_index = reventry->paddr_index;
             size = reventry->size;
@@ -396,11 +396,11 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        mapcache_unlock(mapcache);
+        mapcache_unlock(mc);
         return RAM_ADDR_INVALID;
     }
 
-    entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
+    entry = &mc->entry[paddr_index % mc->nr_buckets];
     while (entry && (entry->paddr_index != paddr_index || entry->size != size)) {
         entry = entry->next;
     }
@@ -411,10 +411,15 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
     }
-    mapcache_unlock(mapcache);
+    mapcache_unlock(mc);
     return raddr;
 }
 
+ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+{
+    return xen_ram_addr_from_mapcache_single(mapcache, ptr);
+}
+
 static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
 {
     MapCacheEntry *entry = NULL, *pentry = NULL;
-- 
2.40.1


