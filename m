Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE8A5B7CF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907038.1314429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvq-0004SQ-14; Tue, 11 Mar 2025 04:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907038.1314429; Tue, 11 Mar 2025 04:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvp-0004NO-9p; Tue, 11 Mar 2025 04:09:29 +0000
Received: by outflank-mailman (input) for mailman id 907038;
 Tue, 11 Mar 2025 04:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvn-0003IE-Eo
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:27 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f8cd8cb-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:01 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225477548e1so45549675ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:01 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:08:59 -0700 (PDT)
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
X-Inumbo-ID: 8f8cd8cb-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666139; x=1742270939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9XKPWEC1FDWwfXw4amuYrHiaWnSduBZ0xkgSDXw7jg=;
        b=GQfywY3MIxqH86zEipic01g+SOZZzmBk4CoeHOvaO0kNGX0NCggqYL8HVQnuCNTCaE
         29qPO3D2nhX+hualstaAJQU+6TBFuHaH6HoDgW1w5Z42LF77IqeuYCoh+qQm+NSGGSmc
         y3Uso7Cwc7xlNKd/Rlm65brmfSFoOQJpkSmoRns/+JZZzMHNZnycOanAGTk5UX1S9W3E
         3jZILVxRwGJ49K9q7yJVIFC6PpuHdaSIM5cp5jiHzND4/l9Jht3RiUTw1bq3yPdWg0hV
         IgijoZn4yWjWyOormLqZmEbn7v0NqbYjeRmnhCpagMdoL7f8bZQw2HU9nHtNhXqfKLaO
         R7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666139; x=1742270939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9XKPWEC1FDWwfXw4amuYrHiaWnSduBZ0xkgSDXw7jg=;
        b=IqyXJco4bfwk4sUQAbrfBgx/ruDNJD+1UJ7doOoO+PclkiNpIg0RREp8hUaJk+6+Kr
         Lt8nF5MsCYa0h37kxOpm1Olz0UabbAuKCEfbH6ocaCfV+dkI3EBl0xgWFuAT2TbjHjAa
         Fwnm/Wiqd6IMNELArfkrm/Kf8cSVHzkxYXxFdAShw+4n2FaYqcggxMV7Z5TopIMMw8zf
         2gPic4DgFCyy2mNG03/XPtwGl/3lj61R9t0AZ5oSxGxNkj0c6skXbz9ckYsysC3cDmC2
         5ExXHyhxN4HZo09fz1FWCPv6ZUL70qiJpaFJh3bvKhuwwAWo/ER2E85NeJ9dfiJM2UCk
         hxgA==
X-Forwarded-Encrypted: i=1; AJvYcCUO3RasBoGHHanfKXRF35dQCeBlEg6U5g5fM5915yIgSUihXxViJLJUuCMbB27fkHwfWHlVoGtjYkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9IqMdgNENKz6saShPcThJ0S9n9brE8ySbjgOudwGA7Ct/BFJT
	Zv0j465BIysJKBnao09FZfQklYwxEwb4PVD03jxMjHSmrIo6qk+UlSCOI4wO9A4=
X-Gm-Gg: ASbGncvktes1RLSd63jjGaSdFdQsdpHEAN4BV/TJz51eXaIWI4G8uA1QbxmANG3gUX4
	zKkp7NC0sLD3olt+keZd2IKqDb/RcsAyOxhJshvsfUoNOcee7e8uhLAry/ZYLqa2R+UIxTPIb8K
	Jgd+AwZIn0xIgCKZUxVM+5IGfdUD1kzTZW0NZ4lMx6oAX4dsvFY6mPP+TiKVS67/FvHY6RxSGZt
	Ow3jAMohz8mwKh9Bl8hRR7x+qAfgPFUbzOwbamAjczEGUayHu8kr3wN7yayw/zenvlVaVaGJ8f2
	okFQLQVGFBNbmM0UE7qT7UvwrJSVb5w9qAGi8YvTW4tG
X-Google-Smtp-Source: AGHT+IFULxKXKLSRt6Qs0nLWBVqgQyDOkjRhSbU6XrRQVwLJue3Ph3bi7X9tYlurUTD8KJTtNJkwJQ==
X-Received: by 2002:a05:6a20:2d24:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-1f57008366dmr14192716637.37.1741666139634;
        Mon, 10 Mar 2025 21:08:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/16] exec/tswap: implement {ld,st}.*_p as functions instead of macros
Date: Mon, 10 Mar 2025 21:08:24 -0700
Message-Id: <20250311040838.3937136-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defining functions allows to use them from common code, by not depending
on TARGET_BIG_ENDIAN.
Remove previous macros from exec/cpu-all.h.
By moving them out of cpu-all.h, we'll be able to break dependency on
cpu.h for memory related functions coming in next commits.

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


