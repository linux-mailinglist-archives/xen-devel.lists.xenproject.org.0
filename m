Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00790A65D08
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917893.1322710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQ6-00005N-TF; Mon, 17 Mar 2025 18:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917893.1322710; Mon, 17 Mar 2025 18:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQ6-0008UZ-PH; Mon, 17 Mar 2025 18:42:38 +0000
Received: by outflank-mailman (input) for mailman id 917893;
 Mon, 17 Mar 2025 18:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIa-0006uj-Im
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:52 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb3177f-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:44 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-225fbdfc17dso32766005ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:44 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
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
X-Inumbo-ID: 7eb3177f-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236483; x=1742841283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
        b=KW9R9HObKD5U09VnfIjvhEk3sMVk5B2sPMSRR3qd0sDGPDIrql20Szv/vigmpkgbZ+
         WDJpyPgsvYoqJ0wEnNcTPqnMZbHonyEsFpVLOvncxy6YjN61XN8pkLvBUUwLMSZRiwve
         jWZ0mIbaN4CTlU7o51F6CoR44PyL7MSXfpwInrIMxYIhDCMdauv/YLT0NjT8X/40H/bF
         IxZp1yh72IrV1Dhoz0zFkh/iHY6uX3ijyIY4THPdqhYJk6+EiitNZU/ahRbdWceJ7Zzj
         EdUxECOG3C9V6q20I2mItjFj1ByUZ36hsND1YJe4ZyVhr1U0eB2pzWnOjjqt+S2MIHk/
         nvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236483; x=1742841283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
        b=SK2HxNn9m4ZVRveB2qlJnhRNV02FWF1vlvT96pMG1MYBYE+elAFVwUhZLypngd2O2U
         PYIIsL+u4Kw7kzEq2q2o8+3vyqH98mi4W1jinZ86pXnCG5+lKzSXOpZo9aS3ql3gs5RW
         fVDGjv52cMQCVvWBuPgt/mmydT0Kbbz3o5gwY2/fft7Q4YkQpf4ioeYc1cDykfyJhAFE
         oTYYoM5s0Xk6JwwCq8BQ55DUkeH1hb9/M0Y4elPUHtF1mB4bazabOHrhQXqIlB3wHt29
         MKRZNoYK2vHuMmgkzt2pJbwXAj+/aY7MpOawd/rf/ozFTgOv/NJhuGJ2l1mIP3Ba8Z1Z
         833g==
X-Forwarded-Encrypted: i=1; AJvYcCVmZ+BiXk05m8YE1pTtjuX6qSmYFA5YSS9B6WnAwJR9Gp8oAhClDk3GRRnJMezT4DwHljHU8gvA3eQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1UwGruPmaJxtSHa9vb+3aHDaqGmhmjRaMl7gjcZR7p3+lLt2B
	62FJshBjgngAUK5eUzcE24pAISPpH6Pr6WWssaJ32KvNG2RiHMnw/ZxmutICpb4=
X-Gm-Gg: ASbGncsq5f5aLgEvWzcl+sS7RAmmGTnZn0v3JIlDdJ/S99o6KfuFpOcxsPSDWH0feeE
	UX4RV4gV6c5eHaq7EGldtB19440UZG7cFYmCYSL/3023oWtYUu/M9tx5UHgw2cf6BjrAO7Ua6Uv
	3aN/S9CUR6FNillNxEQo3vfTQQ4me3nbs8DloE5bMcBfqzS2DT+aYAZIwacKJ6oJ4cB5Dl6Aee9
	QkjI8PD29Rlmz/4/q+3OoRZHZ8rchT0Arx3Ar401MQQC3iNQAahiEkHoDMGRQ0wuJIE2q34rpsa
	uDhCSKJyq3JP2T7fjdpPRs2Tgiug2VW8XKWuKXV+LT9v
X-Google-Smtp-Source: AGHT+IEkZnLpN2CL+GDmBOdEKBU4dHJiRJeeADCMAkJ+O9oEFhXHqcZxYnGUH5GSlkI3pMVX0bW4VQ==
X-Received: by 2002:a05:6a00:1a87:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-7372236c6b2mr14484100b3a.2.1742236482975;
        Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
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
Subject: [PATCH v6 16/18] include/exec/memory: move devend functions to memory-internal.h
Date: Mon, 17 Mar 2025 11:34:15 -0700
Message-Id: <20250317183417.285700-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only system/physmem.c and system/memory.c use those functions, so we can
move then to internal header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 19 +++++++++++++++++++
 include/exec/memory.h          | 18 ------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index b729f3b25ad..c75178a3d6b 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -43,5 +43,24 @@ void address_space_dispatch_free(AddressSpaceDispatch *d);
 
 void mtree_print_dispatch(struct AddressSpaceDispatch *d,
                           MemoryRegion *root);
+
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
+{
+    QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
+                      DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
+
+    if (end == DEVICE_NATIVE_ENDIAN) {
+        return target_words_bigendian();
+    }
+    return end == DEVICE_BIG_ENDIAN;
+}
+
+/* enum device_endian to MemOp.  */
+static inline MemOp devend_memop(enum device_endian end)
+{
+    return devend_big_endian(end) ? MO_BE : MO_LE;
+}
+
 #endif
 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 70177304a92..a3bb0542bf6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,24 +3138,6 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* returns true if end is big endian. */
-static inline bool devend_big_endian(enum device_endian end)
-{
-    QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
-                      DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
-
-    if (end == DEVICE_NATIVE_ENDIAN) {
-        return target_words_bigendian();
-    }
-    return end == DEVICE_BIG_ENDIAN;
-}
-
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
-{
-    return devend_big_endian(end) ? MO_BE : MO_LE;
-}
-
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
  * to manage the actual amount of memory consumed by the VM (then, the memory
-- 
2.39.5


