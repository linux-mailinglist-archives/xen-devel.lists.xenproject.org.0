Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEDEA58C37
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905976.1313524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqw-0003N2-SE; Mon, 10 Mar 2025 06:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905976.1313524; Mon, 10 Mar 2025 06:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqw-00038R-67; Mon, 10 Mar 2025 06:43:06 +0000
Received: by outflank-mailman (input) for mailman id 905976;
 Mon, 10 Mar 2025 04:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEL-000735-TF
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:09 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 663d603f-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:09 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-224341bbc1dso35375245ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:09 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:07 -0700 (PDT)
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
X-Inumbo-ID: 663d603f-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582748; x=1742187548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca5XHIZHBD7tCKLnU5sMNG3rMchaOW2xdNGbrtAeUuA=;
        b=ShIznCKlcc13AfUB+Fz+JnpwLHMXWsyLkK4YQyQcAypnnQ8zySP/fgd9MXbtm8uqBj
         /sH4bgtBdmesuKImOPQxM8zX38eA4QRrJFJ8RWEqeeH5FZ/K0liPsIy1Wqcg04t/SYnn
         0YdFLoRWnGJ0+xHJcK/wjzdSePTdniYhmAxyv4VR5dkJi7O4BCotlw68ARRZBYy1YZfj
         /SOH4plbmK3iUWEQhNigEBKjLXqyBY+JiWoUbGHhQvkSG5mi/o5U4pl0HhoSXAkO22Py
         bUEIj4QOViFhpel8aB86CZKS+zIVpjCDRHa6th5fvU+LZp27bVKBUnNsbjKiMUQIS/Et
         pZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582748; x=1742187548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca5XHIZHBD7tCKLnU5sMNG3rMchaOW2xdNGbrtAeUuA=;
        b=m9H4/hPdEvh8mlyE82q77gB8urFzvHTPro7ZY2lxOcc2zN1IKj5PvyrFZuy5J7AFpa
         VwXkAbhZ81N266krHY9Tdj+utL1nNpvQq6j66a9V1zshd4eygQL/ah4dDVh0Y84YbkQ7
         L9EkFQBEJauzHWpeVVwNGCW55LFxDr9KBgOzKadkBIZBmV63qzIVWg4JR1h0mLkolH3Z
         jYOgWghf9zMgPILaaiMBGnJ7xGoVyA09guD1TyjWwBiK6PoCvW1G7x2DMhassTB/2p62
         leEpHOqvRzgCb/KQTRYXdspG/R4v7Wo1K4KXxpoEqQkzoaQ6st6QTFHFxToKGbwU0r9I
         045g==
X-Forwarded-Encrypted: i=1; AJvYcCX9A7e8NrVtnN1Ook/6E3li1YkowH7ViYFRhRyUY/OrZjOoIBchdwolDTx8LUhh2kgDZj1i7bvptUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx84FSA+ouzyZ50fm9/bPHs8UXRa2XZy4O8O1cDJEqTeNc0fldh
	mh1+hjl0dWaM11lvqd2uMZJuPVNW04/R0bETJX2nVb2Au2rsI/RmftbU8RjoOHU=
X-Gm-Gg: ASbGncsmrDZzrZdqMPIk9ibCZvFSLfxfzifFQIaUeggn+W+mW1cQnB/SJ848p2J8BTy
	lbbVc/Gkn2W9Kq6+Mgei3TNjzU1TwpW+IjCab6YwZW+TJ2CZQlgfmtdkjBUFw/lZQXDnT0vl3fW
	SVfOeD2nz/XG0F6M0QblIx64u58jOE2x+5ClCNBSGqzrieZNjISLHb3kVRmx9y9KN0LiakPxi4Y
	AVoNEpDAuOljMeHeh2c8Ufg/m0HnY9UvR1nLQxJK8MSS1TRjgvbAecw6BAPSPmlPGVt2g6B4rSi
	cE6oBh5GC5sMVrsM1Qv9IVvO1mlZHONSAfaI4N6wqUSo
X-Google-Smtp-Source: AGHT+IHOxR50kjFp3DQk9gSBOkNND2h3Drx9YEHpcRm5j+6hJ+poi1niGnSE9oReFoFKVWczKyJ1NQ==
X-Received: by 2002:a05:6a00:2315:b0:730:7600:aeab with SMTP id d2e1a72fcca58-736aa9fea71mr18336179b3a.13.1741582748003;
        Sun, 09 Mar 2025 21:59:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 15/16] system/memory: make compilation unit common
Date: Sun,  9 Mar 2025 21:58:41 -0700
Message-Id: <20250310045842.2650784-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/memory.c    | 22 +++++++++++++++-------
 system/meson.build |  2 +-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 4c829793a0a..b401be8b5f1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -355,11 +355,11 @@ static void flatview_simplify(FlatView *view)
 
 static bool memory_region_big_endian(MemoryRegion *mr)
 {
-#if TARGET_BIG_ENDIAN
-    return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
-#else
-    return mr->ops->endianness == DEVICE_BIG_ENDIAN;
-#endif
+    if (target_words_bigendian()) {
+        return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
+    } else {
+        return mr->ops->endianness == DEVICE_BIG_ENDIAN;
+    }
 }
 
 static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
@@ -2584,7 +2584,11 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        if (target_words_bigendian()) {
+            adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_BE);
+        } else {
+            adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_LE);
+        }
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
@@ -2619,7 +2623,11 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        if (target_words_bigendian()) {
+            adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_BE);
+        } else {
+            adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_LE);
+        }
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
diff --git a/system/meson.build b/system/meson.build
index 9d0b0122e54..881cb2736fe 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,7 +1,6 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
-  'memory.c',
 )])
 
 system_ss.add(files(
@@ -14,6 +13,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'memory.c',
   'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
-- 
2.39.5


