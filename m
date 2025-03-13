Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D17A5FC4D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913030.1319216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsleM-0003aJ-E9; Thu, 13 Mar 2025 16:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913030.1319216; Thu, 13 Mar 2025 16:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsleM-0003Xt-B2; Thu, 13 Mar 2025 16:43:14 +0000
Received: by outflank-mailman (input) for mailman id 913030;
 Thu, 13 Mar 2025 16:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslao-0000Wn-A9
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:34 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba9c1e4f-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:28 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff80290debso2584834a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
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
X-Inumbo-ID: ba9c1e4f-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883969; x=1742488769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
        b=FK+6ebUWD5Sapcuwjy7wYqq5wTRuRuk5HqYFrVy/OhkvAtlGQ7tE7KQGSL60kw7HcR
         pdsNE1IhXuyK/EkSw8jvtFlkTHEmfypneJ26kbXfqTxernJD4XdP3UDra58iMZV24vgd
         SohN7lHDQBecpl8JIlTzIyssEEaAdw1AF8woKqTYTf4dKUf9VdI6+gSwtiWltIgiIsrm
         SkwGU4r7GqDZ1rmnvebTOJlcvi6c7bfjMZmc6K4bdZ/CeWYBDPpuPkNe14scXeL6P7uR
         GUEoCn4o1icIWvGqByqGphPuPXg55P2HD8yJi1Nc6/h3sbWEULxVxmLaUESO7vV4OhmZ
         gXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883969; x=1742488769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
        b=m1JiOb1ipersXZ8QowoI5huqnCKfge5MgkM7HlO7EFb6sHzXKUOgEg+awEOtMr+Yap
         XYS51Tdz6jbKjYOQuBpj2emI8f5cW10lsygZDaZzMoUsgYWvrx5n2f8pMpZG+oEv0Ket
         sji2Df1P/B+9k0vO+OizE9QUHPmj9pA3sGfFC6tnR+aWts8v1K3qtg7zdYdNo1leLPq6
         dGAJo25GPxa2IOAKR6CWBJsa3lvXC6+uWxengB4gIN53/xDOjKK8EtiddxWz4tTLDQlF
         WhEe520875zeZoliJHpWJ2CrZepFUpLHSMjKRUF5qO8nYx4iE9qun5e7VQmJcRtynKlJ
         WBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOmGoRbzUYIt+VEv0lsxJrgbP99unnox2rwkV9wYXXIp9eWVKLRxSxClib6zw1PHRlkfOKefUicuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqTK7WI8Y6IYXD0cvIMck37gdjku/vcPlv5P7hVM2aDfDixjvD
	itnoONxUpRdUisSGnZSWHtH1RA98fk+ZS9GLvo/VgmRPctgUg8j67OE9l6MdHi0=
X-Gm-Gg: ASbGncslhRmWMocYtaDzq10MxoKQReJM6dkVcGRy7M3cNqYqyd2lv/ZnNS5nuS05I27
	AsrQ+/+qWTy0vLfH93nPq3Purdr+vp9BHRLVjOLeAgnv4Eqvx3q1HjKP/qw9koootMcSIUAPG5r
	0BlzHXi9adNhXOklBzPD43IhLZ8pNg4EXxQM6fT0f4XEolPQTlGmXVq3TY62myPJWezwEym06be
	ZHH82JnyeC6lFuFXXUabwDQCGKjCuV+wwYSGbaXht85vy0W2iv/6YEu3ewoCcD7OIa0Q+fRkl88
	vq4p/LC8pHSwB0plkrL/l/mO1EDqja/I8uYtCmSP9hbe
X-Google-Smtp-Source: AGHT+IE6Us2O77TYYfj/J/RmRU6RhpFIbMCr45wvgkThs0nxBWSPhVRimj63yvMeVhIF4wJ+N9MdKw==
X-Received: by 2002:a17:90b:3bc6:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-3014e82fd9amr271511a91.8.1741883968719;
        Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
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
Subject: [PATCH v4 15/17] include/exec/memory: move devend functions to memory-internal.h
Date: Thu, 13 Mar 2025 09:39:01 -0700
Message-Id: <20250313163903.1738581-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


