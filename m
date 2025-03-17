Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A0A65D0E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917965.1322741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFRB-0002CP-Je; Mon, 17 Mar 2025 18:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917965.1322741; Mon, 17 Mar 2025 18:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFRB-0002Aj-Gs; Mon, 17 Mar 2025 18:43:45 +0000
Received: by outflank-mailman (input) for mailman id 917965;
 Mon, 17 Mar 2025 18:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIe-0006uj-J0
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:56 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5b228c-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:45 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-225d66a4839so58053755ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:45 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:43 -0700 (PDT)
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
X-Inumbo-ID: 7f5b228c-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236484; x=1742841284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=RdSTHXVxIHcLeyR3x8MsVLJe2TbujWjoryb73VEkvUSDBD0722O9urdVewCT6tBtUJ
         Y5TD9dyyb7SEEkXH+MMMBwJOxUrLaTzhD+/07l03VjD20vtpPW2erVf3oh31O8Zcyu3d
         DV3ZoDWAtZCIvzDIf4Nl2J+XqOp+nYkAYQ15x5huwf90bvF6VPj6amayUj4AlMp96RAn
         xwbM+WP9kXvV9TVgd90mL4H9/y93fvzH584/nox+bk3WrYNqq0E7XhxGPpeA99BUhxzG
         lGfNvcMpvqOEDKHpowo2vwVCf8RMX/Al9DEgH92gCs892p3DZq5hkthhLPgPS4wxtH+K
         Sf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236484; x=1742841284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=f30St5a59J/Fm0vcG4A9V8f5UKWEb5G78RCrIxIwPHWmVDZhDUZGYimiKLmDL9MA61
         Lf2tub34z6HabfvQ0FeQtFLKLq/0edjUDK+EjBsgbBsJsfBAyAbKi9bGs+RJiG/kb4Ls
         sTlEvoqCXv56dPdvNmasrPQZihCqv2pgdvv6NyLn6gujNAq8yxgKM/0fDcwYK3Y5pLEs
         mPhVaHVLbOjFrZLSJQVvhXy2yVdQK2413B2SotcvKBiuMpvBnvKjInRebCvwQ2ogqbn/
         CT2z04/yeRsQR52EgmTmN5neB19ZgKgX6VNweKbjyAJovs/pnu5s7HZ6eMDFZGwrGImk
         RwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeDj433MpGhAGtE67N5HOa6C4l1Ph/BNUG/XUIJUKPHzeirBz2QZN4wVqDa7C7vpO5qZR8ulYX924=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz00NEAnuDA6tZfL3PhpfpV1Xa7PewsABk2ydOqcZmGQYGkCIYc
	PDVMbdqyDk8r/jKLRzC+t/xIU73syYX9WWqNypQgfl6Gq+VAkk5uec11/AkxWuw=
X-Gm-Gg: ASbGncvi4ZRYcNaxzqwSwSkaAKc54qwCTGdLyO3nxG4Hqk1yQDohguUK5HRJUZj8wff
	HU4jW+Nkfh2N8JAh8fJKdPIa0sHrvi2VrE1OeXxU2A0yk5ye30X7Gjr8OrrJhVhGcHWCJhPZ66V
	8SM33UAsuDgfdAQ8Nd/2hAt9qAqmZUQvuQRjK0LFNtd0pA88HDWGp+udG/NkkFEmKO6Z/Tmbnmm
	57/ijosx/3tlM5Hx/hmzPlklWTpts+WdG6rVArChz6GhFE1HIsswErtLd56p6P5exRaVRr8aC3Z
	Jyvo4tmDqNy9HoTaJIoX1p0/7EGRUMd4fhSLBwDHMYDr
X-Google-Smtp-Source: AGHT+IHaIWG93SjaignFKD4IVBdMoq9cQTxlUlmFhZIj0sg1/yp4Pm5Fp9URm2R1oo2C+UJzak1b5Q==
X-Received: by 2002:a05:6a00:2e84:b0:736:476b:fccc with SMTP id d2e1a72fcca58-737577c60dcmr700300b3a.8.1742236484037;
        Mon, 17 Mar 2025 11:34:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 17/18] system/memory: make compilation unit common
Date: Mon, 17 Mar 2025 11:34:16 -0700
Message-Id: <20250317183417.285700-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index bd82ef132e7..4f44b78df31 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -2,7 +2,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
   'globals-target.c',
-  'memory.c',
 )])
 
 system_ss.add(files(
@@ -15,6 +14,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'memory.c',
   'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
-- 
2.39.5


