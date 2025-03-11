Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89308A5D0B9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909158.1316175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts678-0004r9-Sb; Tue, 11 Mar 2025 20:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909158.1316175; Tue, 11 Mar 2025 20:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts678-0004o1-PS; Tue, 11 Mar 2025 20:22:10 +0000
Received: by outflank-mailman (input) for mailman id 909158;
 Tue, 11 Mar 2025 20:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kF-0006Vp-GO
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:31 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340a6615-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:30 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2232aead377so19364785ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:28 -0700 (PDT)
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
X-Inumbo-ID: 340a6615-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723109; x=1742327909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z06CcN5pABW+zUVUk9wuBNFYUJo3O9KfWdv+N0a9H8A=;
        b=UKK5ULX4PGc1su16XTflG3SNOD2+yxjyQlOB3bWnaKz9IhnRAqATtfdxCpD+epOOW9
         d0CF+wYR2zAm+iKQVhmcf1CnKu73NwP1oMtkV8NXf+52HggorcMrFKbrMEDwTbPruzvK
         8ZTVNtjVYakYsaztD6kYZequpiSWzg8KLH9uVJkt6OEdVl/Kj00353dU7/8ucTCYEt+a
         nkEHvZEF2Mzu9NlmWAcTzQpwrYHZ5gBFbpEE7TnO3tLP9B6uB/wrhGu/cMZO7PV8SNRj
         0LKA9tg/mJxSJWB2UEMpP0L1jVl0O9i57pknmmVxm7lN4qfWYhQpwMgcUUuG4ifghobr
         5igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723109; x=1742327909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z06CcN5pABW+zUVUk9wuBNFYUJo3O9KfWdv+N0a9H8A=;
        b=l00cf7WqCNzI9uWx9sT9iLiKzRNNXdfXSgd8xjbEisiSIq19Fpropufs85ppYm6t3t
         FeLKQgVppPtxRNesE1DQmjkXpFG01L3LES/LD/I+l2opiqHJetHaQIvjOUr11HRxCRl0
         Uo7ktswJD61uycLwruFY265ZvrAjqwRhx93q4EOEtO90PA1M7GeAzLG3ANmdoiwAq3NY
         0ZXm1bz8ySAuJM12oggbU5CTgEYI71qEdglsjEg8VrmR0psGVw0y0VmyGgcJocmpJWK0
         3YReSKjocVY34kPXjl6GGY7I06IAmaKC9iz/XHiALlRCd44C55JdNd8LTcq5B0BxG9Ju
         3VHA==
X-Forwarded-Encrypted: i=1; AJvYcCWJo8b3zwMmB/iQ2BzQSJIchFdVo7QW0sPp/2OHaeZjXPF5eyQNL0AYSmf3ilFYi9idy4y/E0T5e80=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxodq+WGsO4EseIbdqiQ/pC0fxVDIWMiMZcYuvLJy4vcwgW6Rjv
	IbsRtVT5JRMwkyHaGuGeKfP0WMMzaaGDdkc+i+WG0EIUK0fwaP27fhprZcCVwdM=
X-Gm-Gg: ASbGncusDCFLtRwi6LpC8EsP9SqdRyAmztchyR0AnxzQt3wjlUWkH1hDNjLp+tezEjF
	VIYRC9b2W5KRsKIisG5pIr+FvcuglDCEDxeg1uGa8EuxPzAKW/2GgCEdIKljaMDM6LVmbLWcHj2
	r3ZOBqL6AeQzLslNUwgYA3/PAfHO2SEQFxGjBQ9mNqqcFBjDxuoMucfN8TyvtI1kW1dFgI2ocSM
	HjjadUdOBbDCBBcH6wgyEQvZmwDIcnVqYqlOKblnh54sPZ/EvnTqFu1PgkFSJhbhYVSh9qI5i8i
	ba28KS2rISk27PFgKUUsGg2FElPE1DC5Mkk8BGg8uX8O
X-Google-Smtp-Source: AGHT+IFWZfAhxvvEDgAAce92ETlma5STi2t3r8z3LElksShqNyxmTswS//w9tvWqHBQDxaqLnsB1Kg==
X-Received: by 2002:a05:6a00:2e17:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-736aa9e745amr30276190b3a.3.1741723109168;
        Tue, 11 Mar 2025 12:58:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 16/17] system/memory: make compilation unit common
Date: Tue, 11 Mar 2025 12:58:02 -0700
Message-Id: <20250311195803.4115788-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


