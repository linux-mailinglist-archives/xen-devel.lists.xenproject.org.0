Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDFA5D0C2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909190.1316204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67b-0006r2-JV; Tue, 11 Mar 2025 20:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909190.1316204; Tue, 11 Mar 2025 20:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67b-0006n0-Fk; Tue, 11 Mar 2025 20:22:39 +0000
Received: by outflank-mailman (input) for mailman id 909190;
 Tue, 11 Mar 2025 20:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kL-0007Uu-LS
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:37 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33586e4c-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:29 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22185cddbffso3407005ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:29 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:27 -0700 (PDT)
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
X-Inumbo-ID: 33586e4c-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723108; x=1742327908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
        b=anOuByKI5L2vCHBUc81Z0qcxDNcka/KqaPYuJtBxbhnSesw5eSbcrnsIbNDMj42zqH
         oxE9dLsjPytS0BFA1EcNdoDlgPiaRqq1+ByvQQ39cjRV+L3NnM459aIg/bNn/9MSSzOv
         jv1Nll5jy5g+O+LEQW7MGcGv73JFg9F1a41XKuOv0PfRDtk/weJiNWDeAzf7HG7e+u5j
         DKZ1eH83fGRNIkUM0fDjidAmWk8+/zcQYvYDVNiZMHKJJWDait4cUCOuD9ObmWRuz3Ge
         JeUdLAJl6ZyKYFAOb6DMfHJATTVb/e7gnwE6TiiklAWibddd1c2EHfBjGU/Yare7lFgl
         OiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723108; x=1742327908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
        b=A8KXhbjEhGlk4Z766k5n6NGSxI7KdWN4Z3WQKV6QDwNXa2yKCucayVSE3uWPl9VkNZ
         957tMYZIYk1HBB/TTeVgdTYzhgTtcEroKcO7pAu8aiW4l6Ko+Yl2lh1f3lrHRtNsoupg
         tIMwZQ30sG3wG8YbSAjk1xjjx+BWe9vkjG5Sj8OAD7s44Wbt/pkh65q1xBDqlNvajjiq
         a2XJKXeg+Yw6jy6MHzTYk+pQItP7NQ8/13kE150y1KHDz32BQR/lMD/qDmVpga209yJ7
         bVlHUUNrQ8ksiw8FKVnqQwKQG8qwH7tu2lVISLCXJYc0gpLVU0qTgU8/zh64wa9xPjOt
         voJw==
X-Forwarded-Encrypted: i=1; AJvYcCXMwJbteUifPSJTKA+igXg2NnBz0jEJeTIcpEZPESjOSCFrad/oJtf1qGBNF+uo/tBWXAwDpXD/JO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhAxa/ILz83LWQoFWTnedFOtGRhDeGS3PadDXJRX7taFpyeQvn
	eVe8Ot/eTwXTgw/VOBvk3Hc04AwtaDpUuNwMuH3a9IkgdAuiXUtftBN2XhvZO1s=
X-Gm-Gg: ASbGncvBrvhYHBPLvaUJFxUuFil+hraFI3+aoALtBRTXJpyBmeRlFZnPvhNK8MVdk5N
	8H5IDHCi29FkAxeBxoi20BD2ZmFQoel6AD9mBE7bmKQMpyxPlgTm1+EsQQi1PKy71ay4Yh7oMza
	SVEvR7ojsSvZWoIGbhk9Oc0g1y8s3+VrmTI0RVg6rXdo0CeS+R0LahsTVQekcxSCqGjtobJPsAO
	2fTsY8n5uO+cBt5yiCG9HYwobJP62dHo1MK65agUEPPTLh2uyeNEr/vomFLWW86eTmSkTQZDCts
	eYzeR84cOpi9hbYkFB3FlvFCKYlaVqnkbHzV50lUhiUh
X-Google-Smtp-Source: AGHT+IEFWhkhOunU64h5Vgyk432uXoYWcCQsdf3Qo3RWjfxu/zqVxr3PiSl8C3ffFvP7C/aGeequIA==
X-Received: by 2002:a05:6a00:638b:b0:732:57d3:f004 with SMTP id d2e1a72fcca58-736ec5f1748mr5532672b3a.6.1741723107984;
        Tue, 11 Mar 2025 12:58:27 -0700 (PDT)
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
Subject: [PATCH v3 15/17] include/exec/memory: move devend functions to memory-internal.h
Date: Tue, 11 Mar 2025 12:58:01 -0700
Message-Id: <20250311195803.4115788-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only system/physmem.c and system/memory.c use those functions, so we can
move then to internal header.

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


