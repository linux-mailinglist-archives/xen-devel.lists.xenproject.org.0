Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC0A61865
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:44:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915156.1320742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt95O-0005fN-BE; Fri, 14 Mar 2025 17:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915156.1320742; Fri, 14 Mar 2025 17:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt95O-0005d0-80; Fri, 14 Mar 2025 17:44:42 +0000
Received: by outflank-mailman (input) for mailman id 915156;
 Fri, 14 Mar 2025 17:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8tI-0000xy-5G
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:12 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb861af-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:32:05 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225d66a4839so27413145ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:05 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:03 -0700 (PDT)
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
X-Inumbo-ID: 3eb861af-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973524; x=1742578324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=caI3rs+otVvKwdYgVP5CABrao6jK8ZQ4qsXSHgTDeZVHflhBu1lzgdBXe4Lg4RXQ5A
         M41IXQcZXrBLJB8OvaNtOQZ+UZCDN8k6Bub1l7Yd5EH7XHqVODJPnO06KSFRWtJBjoy8
         4GbrRFGUN/Pftvj8aniUDgbewPtRWzB4eTWO+++QEQ6N6eDmnbhD/nE5/S/LTQ4+I/9v
         6TRbr9bBscERKRtaNi+gCnfpzxnqGR5qo8c3Nbsm56Ew/UaSzrBOfpilrkBNcUzXJHDw
         zdS4XDWIEM7KLzP/XpJ5pajJHdD03PAVMJKpE6AMJTkeg70fal5gGTYQsdD//Nr2xd/b
         t7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973524; x=1742578324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=Pqzt605BO7PgypEJH1dr5yXVekwjJ/nLweebbWM1MiYU49gUvifPWTz9IQzWeCs0Tv
         EGHtgkqKRgQagTeFhgUt55XUsLh0cPOzOPMcTWQYuyrzYAcwwlfn6ii010h8/7rbzLWC
         f3yow7nML7hY7asdKKDuF1U0ImlJ/KTvvr/YZRY+ST8zC41+NzVQgjFtotwSqQM+ldal
         74ArdOm+Dmsjua2PoSDr+bmL9wOLpfaExDFbFziHHjCSLk3Szcw6Z4ub+NP04ZnDRVam
         ahLa4DfGYiorx6+l9JWq8eh+6es+4HOyXbP1jKyLciddDKenVJ+7LBgIBbZtVwQkpSun
         Rt4g==
X-Forwarded-Encrypted: i=1; AJvYcCU+TwnzkuWPR5xiq0kTUnjTjYt2p8nftX+F5jw/rop0PxtrVzWBlY88pu6/222h5DwItSvTEGhsFGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK0IRrmoqvuGfVdy7ig7SgMYqiuhDXe7oDqOr8fNKLjw5qY3B9
	YU0C3Sa77lZd52OxYv61EyWx9TurJWwYloMVKqyhK3LtU3Sxwf9SlD6G1KeDcG4=
X-Gm-Gg: ASbGncsM1eJGIt92tX4FHYUoYsMaTTdp32ES+hkus3V2ocmpIhxJXDYosbaFdNQVkzj
	syKqajqievP4wEP4+Ehr9jA66rzjSGEheiv2KVxtPws4v7h9aPrLZ0P53mjoINbIR6ExCdwJvYy
	FYHR0R1COZsr1AkR3RPtiDv0IZJHJ84RMCr4jqoyZSa01AiOmY1UvUbBYcJK5TKoZcnX9nX7bhC
	peXNG+OsHuow7xro6KTuceMCMkXWfVa6uFzLzKCzYN4qI6VXLlNkAqlUiE3AfaB/kqQ0muH269W
	eQURxi0CIXuxYjrMnhKr1b3wYwGBPQeKw6xQ+tEOKOc4D24AHK33c/g=
X-Google-Smtp-Source: AGHT+IFTScYSX7clzsDQUywbpsrF2iPQsXcqATUvOkRpCep5DuIqTnkqpSfhY4o7FVAe26d7sGjRdg==
X-Received: by 2002:a05:6a21:1583:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-1f5c279ef94mr4638551637.1.1741973523678;
        Fri, 14 Mar 2025 10:32:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 16/17] system/memory: make compilation unit common
Date: Fri, 14 Mar 2025 10:31:38 -0700
Message-Id: <20250314173139.2122904-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


