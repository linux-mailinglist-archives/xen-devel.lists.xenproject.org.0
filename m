Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590FA61847
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915059.1320692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt92Q-0001mc-VT; Fri, 14 Mar 2025 17:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915059.1320692; Fri, 14 Mar 2025 17:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt92Q-0001jW-Rq; Fri, 14 Mar 2025 17:41:38 +0000
Received: by outflank-mailman (input) for mailman id 915059;
 Fri, 14 Mar 2025 17:41:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8tB-0000Ih-Rq
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:05 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e033356-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:32:04 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22398e09e39so51807585ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:03 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:02 -0700 (PDT)
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
X-Inumbo-ID: 3e033356-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973522; x=1742578322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
        b=RVxT1nJMAeHp6753vqOl+3FN9eP7M9RUNM9SSPBPY/r+fC2/eRLJLx4LN6svDeBH+O
         s7WUzAqctoB1/r0bJTBIMtZxTdxWMXnFTFzKKAA2cdcZCn5ttaz1m2MDyxVDV757kLDD
         qyi/98WyCQ6cX0vMSVeIfJltc4cg0Qv37S+kqoh9FOPSYu4QBHNNxdMetSkRWJU69C6C
         qN1wHGPbyu5cQifSVIMaXFaMHIoU4oZq+EeZtQ/iRHU/juII9xy0mIhYt2fEuwFresZx
         rikkgzMZhjQlB1Z8e4WttmviteGQaHPt4JTANIKzCJA7R8abIAH8/J8pCjKv85JD/X9K
         xQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973522; x=1742578322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
        b=K4Qjbps2bwarcEsIBb4f7XCXELKO17V6Cihw1mTMbqeKZKQDCnSDpm6vYvN04PjEYI
         sMq0A4v36ysRD7bGKwwabUiVu7Kh9Hj2lPV/piDfmGXZcDkZz7OuJAjJUcxJtNOJxnil
         ZwkAqDtFdenhvkQL2Ui+sdiiRLUGATBADkpMrEQl6IkT6Jl5w158T+KtESX7fS6pquBe
         02KiTY0bM/aJMDUOFiauegN4S+/wU0JqNHTIzfnZZSizQl+FSUcuIqBAD8RfCLwMwzWw
         nUcDSgcIEle2X2lGx+QMUTPw9PyCEczw14VDPv5J4YlgaF3qMEp6KZSTfyEtR9d3nOhg
         67kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Dgq+NHUiYdnEYIsrRihUqMCRsx64uIX2qSWlYvMgyp6dFXYKP75VGY+eiZjhANrB+CNN9codyDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycBeEmiDAeacVegtvwAlY9lmp4xGjrXIk7OPivaignQHcXSI68
	Xz25groSQbtQfN5bXOJL2QXyBG82NaumutVeBrCU78mHRVs/RDg413dTMxBI1bw=
X-Gm-Gg: ASbGncs+kUx0LBjT8rWI7XgFlX4iWliU2/exC2FTVk92gFJhw/vQX3ap7J/v7aSklTa
	Y7IQuEqTSBCzrCnTUWzEuM5vTX/EIF6Mnol2cSPxKTd5Kowh6+OvnCkiu9GWGhTnme7UvaL+jrJ
	CFAiO/umN4GPLSiv7s4dvyEzMS94qxV/arkp5GyQEWHCVSjxBJUhBmlsDn4mR2e/6D59gA5tEak
	419gbZqP4uLyjrUWFgZEVU5NfVJ4UuOHe7cnjUjX24xBrfz4QyEb6SQDS6tVCvuOK5q7l33hzaw
	E4EzefmCgPrK/NHgiJmUeM/QjLAnHTnon5QUPJ79J4iE
X-Google-Smtp-Source: AGHT+IEtHSmevJ6R5avE3bKBZZosO5sZ+P9hAoOgJtZ8OftQtbIF6mLlVq94OOMFZzJGHDBT5BJrHg==
X-Received: by 2002:a05:6a21:6d88:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-1f5c12ec5b1mr4773946637.29.1741973522470;
        Fri, 14 Mar 2025 10:32:02 -0700 (PDT)
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
Subject: [PATCH v5 15/17] include/exec/memory: move devend functions to memory-internal.h
Date: Fri, 14 Mar 2025 10:31:37 -0700
Message-Id: <20250314173139.2122904-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


