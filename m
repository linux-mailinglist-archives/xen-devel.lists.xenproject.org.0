Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD04A58C31
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905952.1313416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-00019A-1W; Mon, 10 Mar 2025 06:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905952.1313416; Mon, 10 Mar 2025 06:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqp-00015R-Tg; Mon, 10 Mar 2025 06:42:59 +0000
Received: by outflank-mailman (input) for mailman id 905952;
 Mon, 10 Mar 2025 04:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVE7-00070S-Nq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:58:55 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cdc72d1-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:53 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-219f8263ae0so68330215ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:53 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:51 -0700 (PDT)
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
X-Inumbo-ID: 5cdc72d1-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582732; x=1742187532; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OIqebmv6TCVHIjcnbRR2ASx6yOnmt3f1dkycngreo0=;
        b=PP9Bbu0X9Ufi0FV6MFFY5KAFGCsSYwKZzoypWbzHTAAw/ZTpJkQ18V2BzZZeb2ZhN+
         NsHfVE95eQWbHPIVMThuOFki7WJH8FvzN4IvGx3zHcLDbSMetRqrSN2nDl7sm4+Fg73h
         IrbHgyWOmyQbHVm/LqqsID7NkQrlJWVlnyhG9/AgdRxzqb4asUsm0xUR3Hz8jSQq+zEg
         7i5veS7pN0bPS+/Cudb7rHrhG7PpM0N2I6Qya/soXIQw13nhMXdX3aFU8STToXuoeq6w
         aOhdt9h6MBdz+GWXZ/v2nj3ZnhF3bwCT8TkIiiG00pyuiXidbVFMDj3mqhf/SOi3gJ3t
         ganw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582732; x=1742187532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OIqebmv6TCVHIjcnbRR2ASx6yOnmt3f1dkycngreo0=;
        b=vqhUVkA81OU4VXFf7Sqm5E0MZdVQH6iJKy068escnaesqrC3bvT0WzJlI1KUX10Bk6
         h+2NlwZz8oplOdULZPhLhbuFa3s5nKrMWhYN30cw1w/X9Opdgjr092v7bViPIzKu/d6M
         MEZ7xyqMHGOAd1zkn+Lm0/KWAAfvAAyNyPYRmtyYDDO0MjFthfgGBhonBRs8cSt07j4L
         J4MNByakfWzs7t2/gT4HI/5Y6mdk2oLOpDCTd51t7DzuCiLiiDNT+G/e+8EF07S9OGRS
         tKnLB1iiBeg0seKQHbhDwXiTaiALbFxiMqm/NfwobwFEyCvMKJmMxXycjjcqeJMiavXU
         Wmqg==
X-Forwarded-Encrypted: i=1; AJvYcCU2aHRcAekSE7L7gP5rv+I4gAwJTxTpZP3FWB6pybFvNnDOwnjMYt/hdvTDQgZLfbtCzqjhiE+iM6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpAPnbpD640dJuBz/2WvY4pOJTQgQX5yk2y8sdKNdDJYxysfbl
	tkUZ5AfD4DDhL0T7uMRinowmgxKCd1AB+o5ZmLiDilRSu8kO/rhXTuU+ZNh7Nc8=
X-Gm-Gg: ASbGnculWWAgu8SB7K888L1Dw0+H9ian7SB0LRzkkLXDzEes5zXllNEYLsEn0IAPrvH
	9jqKxiOW2VrSWRxjthH1oYXus2wwAZstXbhp011bv1fod+tOXkXvuBWzI9K0IFC7eZt/QD8vvE5
	bP6+/PhPnlagMm6m+lGAmCzrWDnaxxyj3/6cG/U+vHO/NeXmNLxaZsW7dqhiWMS1x8VBJH53Dl+
	Xbe8QZb1J0ocS7X3+VE5ySQ9iKmaIgseY8lnTVPlkVlgyDtTY9qXFOIIz0TwUA53TsoqRXbMEYA
	t7xbIKms4BwymFj9vlAh9ks1c4ZhF4l4ML1b8QWsuP4i
X-Google-Smtp-Source: AGHT+IFiauNE3phtYbHOElNurEea3KFBOmPJM6YIEsLLcuetadtqaCJcJRoQf8PU7u5dj3ax/cwksA==
X-Received: by 2002:a05:6a00:17a7:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-736aa9bc787mr17756988b3a.1.1741582732211;
        Sun, 09 Mar 2025 21:58:52 -0700 (PDT)
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
Subject: [PATCH 02/16] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Sun,  9 Mar 2025 21:58:28 -0700
Message-Id: <20250310045842.2650784-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

To allow this, we need to implement address_space_st{*}_cached, simply
forwarding the calls to _cached_slow variants.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h              | 15 ------------
 include/exec/memory.h               | 36 +++++++++++++++++++++++++++++
 include/exec/memory_ldst_phys.h.inc |  5 +---
 3 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 17ea82518a0..1c2e18f492b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -75,21 +75,6 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
                                MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-#define SUFFIX
-#define ARG1         as
-#define ARG1_DECL    AddressSpace *as
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.h.inc"
-
-/* Inline fast path for direct RAM access.  */
-#define ENDIANNESS
-#include "exec/memory_ldst_cached.h.inc"
-
-#define SUFFIX       _cached
-#define ARG1         cache
-#define ARG1_DECL    MemoryRegionCache *cache
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.h.inc"
 #endif
 
 /* page related stuff */
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 78c4e0aec8d..7c20f36a312 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2798,6 +2798,42 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
     }
 }
 
+static inline uint16_t address_space_lduw_cached(MemoryRegionCache *cache,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+{
+    return address_space_lduw_cached_slow(cache, addr, attrs, result);
+}
+
+static inline void address_space_stw_cached(MemoryRegionCache *cache,
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
+{
+    address_space_stw_cached_slow(cache, addr, val, attrs, result);
+}
+
+static inline uint32_t address_space_ldl_cached(MemoryRegionCache *cache,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+{
+    return address_space_ldl_cached_slow(cache, addr, attrs, result);
+}
+
+static inline void address_space_stl_cached(MemoryRegionCache *cache,
+    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+{
+    address_space_stl_cached_slow(cache, addr, val, attrs, result);
+}
+
+static inline uint64_t address_space_ldq_cached(MemoryRegionCache *cache,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+{
+    return address_space_ldq_cached_slow(cache, addr, attrs, result);
+}
+
+static inline void address_space_stq_cached(MemoryRegionCache *cache,
+    hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
+{
+    address_space_stq_cached_slow(cache, addr, val, attrs, result);
+}
+
 #define ENDIANNESS   _le
 #include "exec/memory_ldst_cached.h.inc"
 
diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index ecd678610d1..db67de75251 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -19,7 +19,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef TARGET_ENDIANNESS
 static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw, SUFFIX)(ARG1, addr,
@@ -55,7 +54,7 @@ static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
     glue(address_space_stq, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
-#else
+
 static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldub, SUFFIX)(ARG1, addr,
@@ -139,9 +138,7 @@ static inline void glue(stq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t va
     glue(address_space_stq_be, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
-#endif
 
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
-#undef TARGET_ENDIANNESS
-- 
2.39.5


