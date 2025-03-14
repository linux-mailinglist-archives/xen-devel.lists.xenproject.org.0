Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B033A617AD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914965.1320592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sx-0002gU-8p; Fri, 14 Mar 2025 17:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914965.1320592; Fri, 14 Mar 2025 17:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sx-0002eA-4j; Fri, 14 Mar 2025 17:31:51 +0000
Received: by outflank-mailman (input) for mailman id 914965;
 Fri, 14 Mar 2025 17:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8sv-0000Ih-ES
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:49 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f68fcf-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:31:48 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-219f8263ae0so42497105ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:48 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:46 -0700 (PDT)
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
X-Inumbo-ID: 34f68fcf-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973507; x=1742578307; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=RBhlbKFT6B+RLi5oJUJxl0lHPgD0UvV+GQPzzL6HgsOHDqXz/PEaFUrGBgbU47Rfju
         VHponTgnpwMuQKMJCmXqdtt5njac1BoxA7uZoglk1f5jqzPQ8FBJ905mzrI24oy93BEW
         arF5LSrZ1rijyb/GUDfctZwY5zei/Zq9anY371yJpHkcyn7Mm4EExHUtM674C+PTxTWi
         Lf5C3+rxVt1PvD85HTZdf8dfeGp3X7Ndu5BydqPKpqSF1XY90uydWtD2/I72E7GOJ+hp
         xkfSd4Oi+zEJVmVlzqfqGYAaiLLXauLmiwFpBrOkuRJw+lJFPXl5sJ2KsbMM24BtmvEU
         LPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973507; x=1742578307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=filHEVwuFyvYM9cAwvSCPNq1iZWhLs1bQyfHaJ75Ecp4NB4eWyb5cfGjxIHCGlRF2R
         8GgkQ4GlDCQmfHJd4D5806mcoV5UMPvdPrg/mKzEhDl/0Q8c7OF9MoUaYNjms/Rrn+4R
         o92rTtt+WClt9FcaXi7LLNgw92XMwfcY4u6jiIDzMgtjJFUlk6jgk2LF3blstKh1WrL5
         G2FTAqV7UdMchKVztdCH1KKfu2T1zPQJqtOBHvUv4X6mDiHGNkBSwFZf4l4f93ddaU5o
         NWGh6FZoVkQS0SUW0j2b5q3WkhSh60D8doX50YurDSKzNK+SsE1SdgTyGxD182JpKXYd
         xs8A==
X-Forwarded-Encrypted: i=1; AJvYcCXMAYwC6uX4s1Yh997ZgH4iP3MOlEEgVxlTE7sCaTa1Pthvj4OLCemvoJN4Kp2nciWtUSm6C9qIc68=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg8F0R29N8CSU+nM71+t6XYZNtgBVEQZXMrnm9BTBxc1OvK9cw
	nzhiMOOfLjAtwKoErFpHYB4CBJU0O6PGXyDODqdQrrcNeCllvcK+HeHNmZxqR7M=
X-Gm-Gg: ASbGnct/76THHAy24uyo05dac14yUmoDwHiGDBuJM7yoLd7/hZBVwZrg/61TYhG4efB
	ZRi3KC6nFNIcQR+VAfdwC3p8D4130+t3rmG9hDobTLAKTa+oNWauq2zZMEkVezvv/l8S/IYBOt+
	g9JhwSGVMVnoOS8WhpYbHX9VmWCKGeB3jdxIyH7XxH4smcrX9dPmbI4HEvjXCqCUiE3WhVBmMZP
	TgTy+4XlIVLuW0oH1eUtVdUVkKlzYyh/mHkqcDiJHKHfNhD9vLxdL10g7T7RoAYONYE4NBM18xM
	TWOmTrV/PM+fJ4uM3TpQoZ0SjKYOqX4rOqLo3ND/GCfm
X-Google-Smtp-Source: AGHT+IG98FFUYfg0sUj6szpvN+iBBsyjmwTHoAxx0itmB7R9pQNc8XnfcIaBUehzGw+xAOY05im+Eg==
X-Received: by 2002:a05:6a20:c106:b0:1f3:47e2:80b3 with SMTP id adf61e73a8af0-1f5c11c3cd2mr3981620637.20.1741973507092;
        Fri, 14 Mar 2025 10:31:47 -0700 (PDT)
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
Subject: [PATCH v5 02/17] exec/tswap: implement {ld,st}.*_p as functions instead of macros
Date: Fri, 14 Mar 2025 10:31:24 -0700
Message-Id: <20250314173139.2122904-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defining functions allows to use them from common code, by not depending
on TARGET_BIG_ENDIAN.
Remove previous macros from exec/cpu-all.h.
By moving them out of cpu-all.h, we'll be able to break dependency on
cpu.h for memory related functions coming in next commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 25 ---------------
 include/exec/tswap.h   | 70 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 8cd6c00cf89..e56c064d46f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,31 +38,6 @@
 #define BSWAP_NEEDED
 #endif
 
-/* Target-endianness CPU memory access functions. These fit into the
- * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
- */
-#if TARGET_BIG_ENDIAN
-#define lduw_p(p) lduw_be_p(p)
-#define ldsw_p(p) ldsw_be_p(p)
-#define ldl_p(p) ldl_be_p(p)
-#define ldq_p(p) ldq_be_p(p)
-#define stw_p(p, v) stw_be_p(p, v)
-#define stl_p(p, v) stl_be_p(p, v)
-#define stq_p(p, v) stq_be_p(p, v)
-#define ldn_p(p, sz) ldn_be_p(p, sz)
-#define stn_p(p, sz, v) stn_be_p(p, sz, v)
-#else
-#define lduw_p(p) lduw_le_p(p)
-#define ldsw_p(p) ldsw_le_p(p)
-#define ldl_p(p) ldl_le_p(p)
-#define ldq_p(p) ldq_le_p(p)
-#define stw_p(p, v) stw_le_p(p, v)
-#define stl_p(p, v) stl_le_p(p, v)
-#define stq_p(p, v) stq_le_p(p, v)
-#define ldn_p(p, sz) ldn_le_p(p, sz)
-#define stn_p(p, sz, v) stn_le_p(p, sz, v)
-#endif
-
 /* MMU memory access macros */
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 2683da0adb7..84060a49994 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -80,4 +80,74 @@ static inline void tswap64s(uint64_t *s)
     }
 }
 
+/* Return ld{word}_{le,be}_p following target endianness. */
+#define LOAD_IMPL(word, args...)                    \
+do {                                                \
+    if (target_words_bigendian()) {                 \
+        return glue(glue(ld, word), _be_p)(args);   \
+    } else {                                        \
+        return glue(glue(ld, word), _le_p)(args);   \
+    }                                               \
+} while (0)
+
+static inline int lduw_p(const void *ptr)
+{
+    LOAD_IMPL(uw, ptr);
+}
+
+static inline int ldsw_p(const void *ptr)
+{
+    LOAD_IMPL(sw, ptr);
+}
+
+static inline int ldl_p(const void *ptr)
+{
+    LOAD_IMPL(l, ptr);
+}
+
+static inline uint64_t ldq_p(const void *ptr)
+{
+    LOAD_IMPL(q, ptr);
+}
+
+static inline uint64_t ldn_p(const void *ptr, int sz)
+{
+    LOAD_IMPL(n, ptr, sz);
+}
+
+#undef LOAD_IMPL
+
+/* Call st{word}_{le,be}_p following target endianness. */
+#define STORE_IMPL(word, args...)           \
+do {                                        \
+    if (target_words_bigendian()) {         \
+        glue(glue(st, word), _be_p)(args);  \
+    } else {                                \
+        glue(glue(st, word), _le_p)(args);  \
+    }                                       \
+} while (0)
+
+
+static inline void stw_p(void *ptr, uint16_t v)
+{
+    STORE_IMPL(w, ptr, v);
+}
+
+static inline void stl_p(void *ptr, uint32_t v)
+{
+    STORE_IMPL(l, ptr, v);
+}
+
+static inline void stq_p(void *ptr, uint64_t v)
+{
+    STORE_IMPL(q, ptr, v);
+}
+
+static inline void stn_p(void *ptr, int sz, uint64_t v)
+{
+    STORE_IMPL(n, ptr, sz, v);
+}
+
+#undef STORE_IMPL
+
 #endif  /* TSWAP_H */
-- 
2.39.5


