Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BCA9CBBA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968183.1357867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8K68-0003xB-Ui; Fri, 25 Apr 2025 14:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968183.1357867; Fri, 25 Apr 2025 14:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8K68-0003qQ-Pr; Fri, 25 Apr 2025 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 968183;
 Fri, 25 Apr 2025 14:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9qI=XL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1u8K67-0003o0-8y
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:32:11 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 129e7857-21e2-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 16:32:10 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30bfc79ad97so37116341fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 07:32:10 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a8312sm7745871fa.86.2025.04.25.07.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 07:32:08 -0700 (PDT)
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
X-Inumbo-ID: 129e7857-21e2-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591530; x=1746196330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG4zYuYYpcJqlLYEG5C5mY3Kfpvlarp9AnNvsczkLIA=;
        b=DqMDCf/iPMtvs34r9EtWEvCSIlDDZthL63Ex9zK9k4c9gfUjlyBuWSvr56/OTJN5se
         h5xIbSvPQxdQJRa7uD558d/M+GsL4AQQdGAsIODbXhzp8wBVozwj25UC7u9kd4wuPcyN
         2hKYGntfEAavWC+lkynwt7NX88Psy8TyUeCTVrukTnf8RBmTmLEraLh8C+uIgfnYh6P7
         inVfiFQywdWE8AHQCOLZaExCycjJWNH2Tn0Ch0PZp2s34p1Tv2FByv9hSNUHX0pBCJAq
         636Q2FDLxMESyOB626IeERfxEQwnvbVXMj20E07VMZhtN8C4GYYQ6cq1rTN5jMwygs51
         jxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591530; x=1746196330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG4zYuYYpcJqlLYEG5C5mY3Kfpvlarp9AnNvsczkLIA=;
        b=QW1bQeGf+h+ghIZMKhbss3nZ6uTEUFAPAyHCDRaYim6dL7mdomQDwc/PcxEOj/d+Eu
         AbZz7TaJ5ferVJDcRSem57FY5lJMgTGfcXQV6eVl8JrWQa7zc/SQ+aiLxlGsDELADnse
         kpd5x9l4kMzWnhOQsKhzRQC4VmZ3vbDi4mkAr6EhQufEbBOgQm4nLY4TZa8eHsYwLI59
         8dNPMz39M0k8RyLo4z8UKmo4VU91HVZLxG/FoQWBxPUWIsyqtzE+ap/IWJJxd7bYMe0k
         Ad9rg52RemAuvlb0sca/F/GlmBvlA9VZOT/K1t3F1rvRopJ0zrUtiqxvh0u+1GiZJbPf
         e9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVC7TPTjo394HocZdOBiuizFl2FX1vaqK291FGPZBUhaMAUMJcc0f1B3c+g1sJlasbk6Onb9HZEG+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXWpumcsxiEGBPXkmTjdYsjVg8i/SrKUJwpzMQDYPMmgw9KHl1
	+W48iUHqR7/ffOGSYSMie0O+6OYrR5BwxsL+EuVPiwJ8HuRHdDV9
X-Gm-Gg: ASbGncv5NzGZ0XOzXxRHMDmrh5D0+5y1ToUQqNx8YBnkg1ulfaiqoftCkOY9xbzWovI
	s+hdx7XFpcyZNMXwoolBYGtfbw2m0Y874g0mQRwXXM6a2K6EB4tP6hwD8h87lQAWShU0E7n20S5
	fcPY1GXIfnlr5FjV5RqzSijXq/ZCE3ZOD0/SxL9iLNDqZP/KJnqKKsO3Gxd+OsnqOziZAh5gSAP
	LAstoD+GXZ458WTFAXGBfbdZXHOAzPJlSJARDeWCE8T8aTKYT6XNJo5QtCsgQZ8FPiRxM+uYBQ3
	P9R/VSWkvpBN7Nzw7XDpBUaQJN3esl0+pZbKvGZ4C1uMnKXWPauDw9b5TFqnr4VlsST+r6uJN06
	AwqXiNX4/ueYLDGWCDgAgRpg=
X-Google-Smtp-Source: AGHT+IHWARaFw57BZ01THUTSc2KFZuId+pV+qu+u3iEKnTFsjDPBoBcWZkR34cYxgsb/mk2/7B64+Q==
X-Received: by 2002:a05:651c:881:b0:30d:e10c:cae0 with SMTP id 38308e7fff4ca-317ce4c347amr22810961fa.20.1745591529939;
        Fri, 25 Apr 2025 07:32:09 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v1 1/1] xen: mapcache: Split mapcache_grants by ro and rw
Date: Fri, 25 Apr 2025 16:31:56 +0200
Message-ID: <20250425143156.204452-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425143156.204452-1-edgar.iglesias@gmail.com>
References: <20250425143156.204452-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Today, we don't track write-abiliy in the cache, if a user
requests a readable mapping followed by a writeable mapping
on the same page, the second lookup will incorrectly hit
the readable entry.

Split mapcache_grants by ro and rw access. Grants will now
have separate ways in the cache depending on writeability.

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


