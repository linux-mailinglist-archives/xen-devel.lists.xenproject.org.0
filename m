Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF17A5B7FC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907129.1314472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trrCc-0003r1-4h; Tue, 11 Mar 2025 04:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907129.1314472; Tue, 11 Mar 2025 04:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trrCc-0003ou-1R; Tue, 11 Mar 2025 04:26:50 +0000
Received: by outflank-mailman (input) for mailman id 907129;
 Tue, 11 Mar 2025 04:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvc-0000fJ-8N
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:16 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9804f499-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:15 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-219f8263ae0so94074805ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:15 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
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
X-Inumbo-ID: 9804f499-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666154; x=1742270954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3CzVNwffqVfXfk4NE2Z+/4EFEG8FprDV2OFnBt+VLQ=;
        b=lHYcu5UR+CRlsq8ONACNAtRNYpVMz0JUMju0IMGdHhSXscP4gZBkaLsFIKp+kVXbxb
         SYg2j1EW0nPvNI7xE7Nq9L1pIgRwO7Qyu90IocE6V6OW44TuO/t7R2qb0vlFN3EUTkRo
         oaR8zJ5zaac9oMNV92hXfFYCZCMw3d11IXJc5AuvD/EHTJvroz9RBa9OHqIZBdw0fLL3
         8wLple5wL/ojs8CmAT/WOt5lkW3T6BCvGnkcDAhV00y/+6Z51qu1bQpETMRIBXqx7Wbl
         gjzC0ZJMtKQ71vgbCNwxSRH4SE2BN/49E5iwpvEp9OeLXKtW3rrSc4Tqj0HeKYVpOw4J
         BATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666154; x=1742270954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3CzVNwffqVfXfk4NE2Z+/4EFEG8FprDV2OFnBt+VLQ=;
        b=RxezKDUSC3dgHW1N0kTRpuSc3qXKVZMNvYQL2kT4C3uVr2B6pXxaznxQ7Z2UuuVTSU
         /tZGu+Oh2MOu7JRRbXzrlE0dpD4aEtDV3eDZ7APHlWSpAkhdg/Ch2oXrb2Z7PyooGaV8
         oxGJ1FqNKFGvrfKcB6nscbIhNfsLtY3h81oir995o6RWSrpjVoNC9D9QUB2UwAZG9wq0
         gViEQOprY8LWlfZO6IF5fq1vIwOuiunDLiQV4K+0cwipNnKQL2DnD6OT8AgQ5t/a/eEP
         iAe++l8omL80WHdfNGJEWU98ZKT5C+34eh2nnN3Q2zzQMEpNCcvsdnoIFbL4pBlhaNNK
         HDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKTNUMHbKMLEP7L6O6KjirQ7N38p6A28AeEIHDvrloMBdDZyQ3Bem+z5TyzRKNAzIKUuJCx6dUsv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6ca1YI+WWv30p8i6hljRPwraom0SsG6+pQVvywGP39x49Dp1j
	m3SjvfyUxkcx50axZVMOXlmvhBhcY5S+OdXohpoSxNDP7K2Yk+J4JNlGVB8NILk=
X-Gm-Gg: ASbGnctj7I688k5/FKVHZIBDA4V1tEhDbtbyQn5aENtvk/vB8wI1GQpSBRHUhQHrGH3
	STJwZWjB1csGkvHhlyBR0YKXp0sRBrEvLH/wV3Y/Br5HFWfXjWkWkHFe+hYaXTAFWnXbbbWJWoZ
	0/L/ChkWSrxMxHSOnh8/eQeHbsWwvDTChY/R5WfWu8Km/SYrQofIndqrpXCnvoUAX6ebIxVIcWC
	YSbluyWuaouExj30WnPacbAR+6cdIuuhnoGw8c7kQc/HP+Y1VTPJZ/AVa15XC/M799Oji5FO33x
	tg1/YyyKoal0EHjZ23ceK1f4pigzJ5C4/+k4JZE44MLS
X-Google-Smtp-Source: AGHT+IFvXFjaslvNGXJjltHn8NjSjDrKRDjnKt7uWKtRausP/KT3hgu5XPa6ctrl8hlKzv3rih4ocw==
X-Received: by 2002:a05:6a20:c6c1:b0:1f5:59e5:8ad2 with SMTP id adf61e73a8af0-1f58cb40fa8mr3753307637.24.1741666153903;
        Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 15/16] system/memory: make compilation unit common
Date: Mon, 10 Mar 2025 21:08:37 -0700
Message-Id: <20250311040838.3937136-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/memory.c    | 17 +++++------------
 system/meson.build |  2 +-
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 4c829793a0a..eddd21a6cdb 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -353,15 +353,6 @@ static void flatview_simplify(FlatView *view)
     }
 }
 
-static bool memory_region_big_endian(MemoryRegion *mr)
-{
-#if TARGET_BIG_ENDIAN
-    return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
-#else
-    return mr->ops->endianness == DEVICE_BIG_ENDIAN;
-#endif
-}
-
 static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
 {
     if ((op & MO_BSWAP) != devend_memop(mr->ops->endianness)) {
@@ -563,7 +554,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
-    if (memory_region_big_endian(mr)) {
+    if (devend_big_endian(mr->ops->endianness)) {
         for (i = 0; i < size; i += access_size) {
             r |= access_fn(mr, addr + i, value, access_size,
                         (size - access_size - i) * 8, access_mask, attrs);
@@ -2584,7 +2575,8 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        MemOp mop = (target_words_bigendian() ? MO_BE : MO_LE) | size_memop(size);
+        adjust_endianness(mr, &mrfd.data, mop);
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
@@ -2619,7 +2611,8 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;
 
     if (size) {
-        adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
+        MemOp mop = (target_words_bigendian() ? MO_BE : MO_LE) | size_memop(size);
+        adjust_endianness(mr, &mrfd.data, mop);
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


