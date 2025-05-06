Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568AAACD3C
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 20:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977941.1364846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0U-0002w5-JL; Tue, 06 May 2025 18:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977941.1364846; Tue, 06 May 2025 18:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0U-0002ub-GE; Tue, 06 May 2025 18:27:06 +0000
Received: by outflank-mailman (input) for mailman id 977941;
 Tue, 06 May 2025 18:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7voa=XW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uCN0U-0002uP-1z
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 18:27:06 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b435cadc-2aa7-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 20:27:02 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso53911181fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 11:27:02 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a89ef11sm20952331fa.81.2025.05.06.11.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 11:26:59 -0700 (PDT)
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
X-Inumbo-ID: b435cadc-2aa7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746556021; x=1747160821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpP4TBaydimBJ+yCxRqJxX0SmD5odScGLmy0sP+rMAs=;
        b=Ag7+s0ebFEaVMcK5P8qDlVyz8AAvT0By8pM04tho9fcqwOrrNWhwBji+VmoVs34nxy
         /uDyJeDh6v26QYRYLfWqeXaNx+eKbvqm8NC1+6apkOzd9Xlqb0JX4cdThTDrDEZ2ny/g
         b1JtcLu4hxln83ltTClQqw49oaiz64BolfADFeRb9vfzbOXGpo8mjW6wrp9t1ja4ey00
         BOxs4CbUnnhMoQSxAe5dNBExrxqfL9Ifpva6gB90AHaMLZgd320mvODRvc48D4dyFanb
         UsvZgOKNqJZe2dWb5mql4zTFuf5q+P2raX0YevnjHiTtcA+/E9lrOGc9RmA1HT9enxju
         2Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556021; x=1747160821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpP4TBaydimBJ+yCxRqJxX0SmD5odScGLmy0sP+rMAs=;
        b=MhBAnhFqC7EK3sys+Cb7IN9nBESHchjfWNhYVrIGCUILL2K58G+isN7X1iJSoGYRJC
         BhY19ODBOxN6mVVF8owtR0eoBnQtq8UKL+PRkAni7U6Lx7CkZ1hFj+yPzRqYaSbJmqQE
         CkygsRhlIXQIIqOGAInr9iqM7WgjREoRoU89Qk++0zrb96TlSy1rQk/X76YpUfN0Xtdz
         bHZ9JfCd/7ZiaUwk00cPk5CJy7gk80mu8F9cr+SmBsmmLeAbp6EIj3DR++7PUstILPBx
         EeXFK2dz32QbnQdt3+tbD/GJTq6ZR+n2Sh0LyDdSc3NTxMgdxuuR7wYEzyBQt6frjbQh
         o0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVGN99Hac3kg8pyb3M5t4D9mp90Nq4EcFrOsbMKAjpTya/ZFmHSbKStmkznuyysZogjKMP4hql0x6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/LHK1idLRSmxYZldWDHExh8HMVG3zwqPCllkOqwlg4un9c/e0
	i5d5T7T3UYGAdEXqEYZsBuV/ZqPRUXNQzEGEpSXOhQ92VzYLVZOz
X-Gm-Gg: ASbGncs/598SLGG5UkAu+kzLn/0HICdL8n4B6SVJOER3Uq11yGfSdDfTgDSq/T98uS+
	5cNC+F4IC8+Pt2C0QAHN3ANf3T5A6xQngdfwICKrjdL18fh62GVFGXHeaxx+x0su4ZaIy5Kk4Iu
	PH/QADg0wYQg7gg8EPGqYFNzoMBM6sk1I8TCx9DWb9W6r1AIc2U131zrAZ59kxN+nrw25jevGGS
	UPj3TFrnkHJ9ha3sTniCiIb1hteliFdNBF8+P1oDHvxIJ4zDUTVXdHSND80BQdmeaaLiFwtKXEw
	tZigkVMcxT3BJUtudPtoFaooLmWkBaycjec5Jyk9iTJjqJ1rn9zwvEm0CDEcqeaQV15QFclzS0e
	IaJXxQ0nxrmZp7Rpd34Vm2zA=
X-Google-Smtp-Source: AGHT+IHBa9ho1ThyDkNxpwI0/3LxpQeg41uCA79/UXOH2n/099VZv3LAbpb5LyXBZ2fI612cdcWfAw==
X-Received: by 2002:a2e:be1a:0:b0:30b:ed5a:6f3c with SMTP id 38308e7fff4ca-326ad19a978mr314741fa.10.1746556021307;
        Tue, 06 May 2025 11:27:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	alex.pentagrid@gmail.com,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 2/2] xen: mapcache: Split mapcache_grants by ro and rw
Date: Tue,  6 May 2025 20:26:47 +0200
Message-ID: <20250506182647.302961-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506182647.302961-1-edgar.iglesias@gmail.com>
References: <20250506182647.302961-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Today, we don't track write-abiliy in the cache, if a user
requests a readable mapping followed by a writeable mapping
on the same page, the second lookup will incorrectly hit
the readable entry.

Split mapcache_grants by ro and rw access. Grants will now
have separate ways in the cache depending on writeability.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 2c8f861fdb..e31d379702 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -75,7 +75,8 @@ typedef struct MapCache {
 } MapCache;
 
 static MapCache *mapcache;
-static MapCache *mapcache_grants;
+static MapCache *mapcache_grants_ro;
+static MapCache *mapcache_grants_rw;
 static xengnttab_handle *xen_region_gnttabdev;
 
 static inline void mapcache_lock(MapCache *mc)
@@ -176,9 +177,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
      * Grant mappings must use XC_PAGE_SIZE granularity since we can't
      * map anything beyond the number of pages granted to us.
      */
-    mapcache_grants = xen_map_cache_init_single(f, opaque,
-                                                XC_PAGE_SHIFT,
-                                                max_mcache_size);
+    mapcache_grants_ro = xen_map_cache_init_single(f, opaque,
+                                                   XC_PAGE_SHIFT,
+                                                   max_mcache_size);
+    mapcache_grants_rw = xen_map_cache_init_single(f, opaque,
+                                                   XC_PAGE_SHIFT,
+                                                   max_mcache_size);
 
     setrlimit(RLIMIT_AS, &rlimit_as);
 }
@@ -456,9 +460,13 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
                        bool is_write)
 {
     bool grant = xen_mr_is_grants(mr);
-    MapCache *mc = grant ? mapcache_grants : mapcache;
+    MapCache *mc = mapcache;
     uint8_t *p;
 
+    if (grant) {
+        mc = is_write ? mapcache_grants_rw : mapcache_grants_ro;
+    }
+
     if (grant && !lock) {
         /*
          * Grants are only supported via address_space_map(). Anything
@@ -523,7 +531,10 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
 
     addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
     if (addr == RAM_ADDR_INVALID) {
-        addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
+        addr = xen_ram_addr_from_mapcache_single(mapcache_grants_ro, ptr);
+    }
+    if (addr == RAM_ADDR_INVALID) {
+        addr = xen_ram_addr_from_mapcache_single(mapcache_grants_rw, ptr);
     }
 
     return addr;
@@ -626,7 +637,8 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
 static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
 {
     xen_invalidate_map_cache_entry_single(mapcache, buffer);
-    xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
+    xen_invalidate_map_cache_entry_single(mapcache_grants_ro, buffer);
+    xen_invalidate_map_cache_entry_single(mapcache_grants_rw, buffer);
 }
 
 static void xen_invalidate_map_cache_entry_bh(void *opaque)
-- 
2.43.0


