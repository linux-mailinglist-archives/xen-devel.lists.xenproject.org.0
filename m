Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A462A65CB6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917752.1322647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIR-0000gQ-Rk; Mon, 17 Mar 2025 18:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917752.1322647; Mon, 17 Mar 2025 18:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIR-0000Zu-Jc; Mon, 17 Mar 2025 18:34:43 +0000
Received: by outflank-mailman (input) for mailman id 917752;
 Mon, 17 Mar 2025 18:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIQ-0006VW-4P
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:42 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cb34f52-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:41 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22349bb8605so102852145ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:41 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:39 -0700 (PDT)
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
X-Inumbo-ID: 7cb34f52-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236479; x=1742841279; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL1NPApLGPlk4f7q724/4D7b3IECBRPwWShMeYRIDxA=;
        b=Ufd+wUjqdIj67ViH+k8bkR/9OHv0GTXCv5BPAL6JxDK8rOnFiBm5RyT7jR9pART7RR
         VZYclZAsDJqfUOM7DGFWMaNHcpH2p9Y2brVCa7xVQrSltOTZ1f8kRZwPAiu0K5WPKVBt
         5CIMJTB61CbRlLQmEavv1uO6UVhzM0GEvpgLMdCKdf1lf3ZytUDtngddfteHVK4ZM3wG
         tE18j7L1cWtjmfFYym4uKBd9Khh/jtlQfEjNbUXCC0d3UoxX2ElrFwMuc35G1JMBixQw
         b2viPyiG0o2JAW2CjmKf+J1gif8Y9XuiAr/S0h5hqWdFXUNyNd5UQftuuAoS/scr1kQH
         gHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236479; x=1742841279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL1NPApLGPlk4f7q724/4D7b3IECBRPwWShMeYRIDxA=;
        b=alCWjp2+gytb/BFtA9eBQ2BcXsz99FeAZvR/jtwLLShVXnymv+CHO+EFq4dzI+lE8a
         uaelkV1xipjEaR6Y9r+gMb1b3Qc+Ys4Wfg5nl0sCXx8Vs+4ULVWrC8dlP4YrBMynaUd9
         VIs/Ny5IoOYGJ5xOOPSjTRG2+2zkn0tjpo6N0aHuPDjcIelWJrgODqj+9wSCg1eG9SB+
         xfqJNTE9Lz6lvCUcE/keF+YeKUD93lw2zP9zW4aM/7L35eV135c42czfGQen2+UzREGL
         lmJtrdgSDsWjJtKV6sC31KPmLV1pb97kjeJJG1mkHPSSEYTe77D8nLqmWyFoUJPcGzmJ
         yBLA==
X-Forwarded-Encrypted: i=1; AJvYcCWtwU6RkztJRUxWl5p82RDMsyDaXelku7+xmO1G46Q0LCoSdHFtp8BNLAQUgP8AVwNmkkvXFsMwHvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlooS7a//ajo8PiRyc48BJhAzwxCZBr/H/ALhJxm7TGO0hQu7L
	btbNe37qIRuZS8ComByj1obVtM7nFdldCSDgtd9DB2E/tKSDGjyLKK3CnzC74JY=
X-Gm-Gg: ASbGncvRMuS8tRplNFvvD+Oipo9lv1puU/g2/+AxsoRTI5796Q7AIt6iw5ybRS5D3m7
	LYrbwyW/wpy9/SVDRBp4QupxhlGryOlm4snKUkMoxnG0i3IsaMWGZCoFQ0XOCyQM5aV3AhWp5+A
	fllP763xiBFoiu0Jp6aopeTGRsVHn8Q1SzK/iv5DAv8Wa/OcJrKkORX6msDl0EQPfFFhitpdUkR
	ZonE0LKLsYXo+YK/juxCWqkAKaSVk8ewuJtNzvdhiHRBhGuRg7/zHJCTzZK8yZnvYhnNCizB/Ee
	2sB/IuGOANUmbMIgZyK8vkMyXfiqDFVNfb9ge9I9adWx
X-Google-Smtp-Source: AGHT+IFOOeyV31jwF+pNrENhCRDzbP+OAMMjvkw2JiLIZfPvEZk2AdzmBDyPiAzaxdBUCsyNl+0UJg==
X-Received: by 2002:a05:6a00:1c83:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-7372240f41dmr13708249b3a.15.1742236479639;
        Mon, 17 Mar 2025 11:34:39 -0700 (PDT)
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
Subject: [PATCH v6 13/18] system/xen: remove inline stubs
Date: Mon, 17 Mar 2025 11:34:12 -0700
Message-Id: <20250317183417.285700-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/xen-mapcache.h | 41 -----------------------------------
 include/system/xen.h          | 21 +++---------------
 2 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
index b68f196ddd5..bb454a7c96c 100644
--- a/include/system/xen-mapcache.h
+++ b/include/system/xen-mapcache.h
@@ -14,8 +14,6 @@
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN_IS_POSSIBLE
-
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
 uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
@@ -28,44 +26,5 @@ void xen_invalidate_map_cache(void);
 uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
                                  hwaddr new_phys_addr,
                                  hwaddr size);
-#else
-
-static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
-                                      void *opaque)
-{
-}
-
-static inline uint8_t *xen_map_cache(MemoryRegion *mr,
-                                     hwaddr phys_addr,
-                                     hwaddr size,
-                                     ram_addr_t ram_addr_offset,
-                                     uint8_t lock,
-                                     bool dma,
-                                     bool is_write)
-{
-    abort();
-}
-
-static inline ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
-{
-    abort();
-}
-
-static inline void xen_invalidate_map_cache_entry(uint8_t *buffer)
-{
-}
-
-static inline void xen_invalidate_map_cache(void)
-{
-}
-
-static inline uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
-                                               hwaddr new_phys_addr,
-                                               hwaddr size)
-{
-    abort();
-}
-
-#endif
 
 #endif /* XEN_MAPCACHE_H */
diff --git a/include/system/xen.h b/include/system/xen.h
index 990c19a8ef0..5f41915732b 100644
--- a/include/system/xen.h
+++ b/include/system/xen.h
@@ -25,30 +25,15 @@
 #endif /* COMPILING_PER_TARGET */
 
 #ifdef CONFIG_XEN_IS_POSSIBLE
-
 extern bool xen_allowed;
-
 #define xen_enabled()           (xen_allowed)
-
-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
-
 #else /* !CONFIG_XEN_IS_POSSIBLE */
-
 #define xen_enabled() 0
-static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
-{
-    /* nothing */
-}
-static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                                 MemoryRegion *mr, Error **errp)
-{
-    g_assert_not_reached();
-}
-
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   struct MemoryRegion *mr, Error **errp);
 bool xen_mr_is_memory(MemoryRegion *mr);
 bool xen_mr_is_grants(MemoryRegion *mr);
 #endif
-- 
2.39.5


