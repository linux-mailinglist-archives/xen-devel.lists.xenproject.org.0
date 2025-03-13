Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFCA5FC1A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912952.1319166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslbq-0007KU-2l; Thu, 13 Mar 2025 16:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912952.1319166; Thu, 13 Mar 2025 16:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslbp-0007HY-WA; Thu, 13 Mar 2025 16:40:37 +0000
Received: by outflank-mailman (input) for mailman id 912952;
 Thu, 13 Mar 2025 16:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslap-0000Wy-Pp
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:35 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc73c532-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:31 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ff6cf448b8so2680806a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:31 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:29 -0700 (PDT)
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
X-Inumbo-ID: bc73c532-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883970; x=1742488770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=xlbH1Yhq02FPeTsM5C0Lq7XD3XZ61XmRDMPhzJsKLdXg6acKnQB4WYrkEO+QAPT1h7
         gJm+UI3kHUbhCtuC/GC7vq3rt8ivYxCJtZmmbArxwAf0hXV8p74ksYukuheboI8eGPvK
         7HSEbWsHiba/SX17rfhGJb5XhriS2b/irwi6WaRikLXaSV2s60euflfLbKzL/ILORmUN
         jFILBkZuZ5oHKYdR3ZyI5IP9sXMnKsIh5rKtxCFcg5KjcXAD6zTIDLSszZAk8TZJglu8
         1w07HPAQqQTjdFpbTzw8itvsScZouSnwK2qp1f+2L53oidmx8AhJ3AMQXH+ZnUE+2XhW
         t0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883970; x=1742488770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBRugwqnxw4q7Phz2P050i5IjB6Zbf1WGwdoEilqtkY=;
        b=EGAmGMYYyLajicQh4gmYks4eRdiGHEZWJVQgEs048NAgcTOd0zggKZlEBWSZ9dJdxf
         ZJf7HuheDa+vW9XVJuiUg2o5x+hzI/mdUNODs5xVMSsn3c8FAZrZmyqD8nlV2XpmmZI6
         OA68eqOUEvRBS6SgOD5LW6UachTLUNsZ6GUyCaTQZg7w50f4VLjH4rCWqv6Z9kvJmsHZ
         4B3KHfuG53gQY3K3cHUsLws6F8SI7SqqQ9WuflWEeqBz292QI1fb+UNog/MBSl3XZs2f
         MngNAJatnzJgt+jPjJYPbcIATXvlGyzkByGbvCLuoijFzHsFUoQRYb+EQJ6b2uUjmFbP
         uH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8Nu0rh6UTVm7jap8nOsds0EvtqtmPqpstgH/o+j/a2LssvC87bvkJKbZR8mhBhXAjKa/rGjWQwOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrjNsBhoCOeUaIDO+eK7MBgkQIila+qcjAIEl0KreHWrtVIZ0D
	gTt8+SUws4fa1rMPwJIFXnf+sfjjifYPjJs52kg8bNnAK514cQo9dXgTe9E0JMA=
X-Gm-Gg: ASbGncus0OrevZz6D98efq8DUKWUUDsNmNSmCCnFhH7PWr6gdrZN7hcisEWcTSK1I4O
	ccV97aFgfFib8BVO15BzWf28OQInOIf4TdWumK97wEVM+Lh/K2sWz/loPgjvXgVCcocZli9LfrH
	Ap18GZJhB/HXz4ttMDo8Uv1tFsSStiDypStjFlSinsv47Bl1RGW+0Ox9jhrWhFYjHWtBzA1pgjH
	cIVDifynKtizlcuOYMCZX+G8+QmbazA5Iatp39lZCnAp/1DXuvhGKP1kxjNLia/NQfujtn13ILA
	Jj3jOq+B4CKzKelqZdrKRiI8eblBuzyxGEcNap9/7O48
X-Google-Smtp-Source: AGHT+IHRyNfs/2JPL1rq+dZtoKg0Gk6ovyIhkaylwgSPQTAI/HYpqKgruBLvp53+c1fVanolW+jjbw==
X-Received: by 2002:a17:90b:51d1:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3014e815c62mr251908a91.3.1741883969872;
        Thu, 13 Mar 2025 09:39:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 16/17] system/memory: make compilation unit common
Date: Thu, 13 Mar 2025 09:39:02 -0700
Message-Id: <20250313163903.1738581-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


