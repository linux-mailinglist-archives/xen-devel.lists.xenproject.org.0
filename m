Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20839A5D019
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908965.1315992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k0-0006XZ-Tk; Tue, 11 Mar 2025 19:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908965.1315992; Tue, 11 Mar 2025 19:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k0-0006W6-Ng; Tue, 11 Mar 2025 19:58:16 +0000
Received: by outflank-mailman (input) for mailman id 908965;
 Tue, 11 Mar 2025 19:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5jz-0006Vp-K2
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:15 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7004f3-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:14 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-219f8263ae0so113519475ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:14 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:12 -0700 (PDT)
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
X-Inumbo-ID: 2a7004f3-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723093; x=1742327893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=vbVp4dsNToGMVrDhoBatcBUBf1bpDRAGTd5lG3yKXmKFrR1tqHo0lgCq+XOcN7Q7Np
         uVNjfQFi/ED1hT8+vUM1GG5WEjUasqZHnrIQtI38nvSRQSJQUzVwxAkGrKqfdzHMPbMC
         2VHilX5fHGyK+cMmrrUEj4qovYYesf8e0RDkFrRt7/NaT/4m5tXpmQz3ujEtR3DCTqn9
         jSDwOud7QqCEXC5kfXhNjdp+Cw3atjyyTS5O/Qel9MKIi1cNZzejiptC2UIdfYuhUdsO
         tPbiNsp2I2ne9ig9qCvAdn2XlmeFl4uotqL46rjz/jXDY0RGXdJBR1e3vsnhGerbL4QH
         7XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723093; x=1742327893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=cwKPShV1sDu8Mmc08eNFU/+0XKysJC+6XQ2b4QN8rmO+jd+mNf3eeyiuxq3ErL7rxz
         6/r1xThfCKQunSIros8Y9FpxCr8Z3t2N8Ir5D+CKdfZmt3PZomKoLVD6ahjFCcuWKWzd
         x+3jkCuAOGLvOKs1UEsGUgJnkqC6R8lleYMSx84Fvv71L4tzQC+2K56BPt5+vein7b/3
         rzijq/+MZXGf/76PPRsoB1bEUHhTZpDldIrVnfHHsqif/cANq05rnM/YeDa9XCfULAsc
         NTLU15lQCQVxXeoeZqwAHDjZwEbBJLlDQ1M/XcsjlCKeMXoIS28ty8+qrlcvcVh2EyOj
         TVCw==
X-Forwarded-Encrypted: i=1; AJvYcCVKoIPnG9iDx/NC7gmTFRzgGlGcvDxVEdqWBN+j11jdb3hbc0hi+i7M489w1DdKXC3xUXemHHYzGPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFobBoqZ92bPtIk9R6+HnNvP6QPKZvFIvYAnTQU/FkLOGpCz3G
	kpczWPwyDtKdNaRcEQt7mABtvT7nMAP9gkV+d+IrMJVFau7xer+ZpY6Tcf9tV0E=
X-Gm-Gg: ASbGncsikKRNAIcUAWWnnk8SKLw8V7PUj5w9MYQAV0/hR5VyWeKfrZRdFs/Bsgzs/fp
	6zQonC+kk5Vx7pEaJmSKFhfuurs9BueG4fr1EzIESV1e9YtFBwDFFj1Ka7Sqvo0Cn1LzGk5IgsV
	YQzEOwcQNDJJGPIVNtmIA2AgB4ZYeq2MAURk3jRCpaRCjy1kDPHJEyuGnr5JwvuvJFdcvzOrOi4
	L9zLeATy2Wif2JoyrY9HDetW3xaXrtQWvkvty5bCzXElsi7gQ3qMfGf1NZeTxCdrvxWdUveQDAw
	zQQCW8e8PeOx3KeetJY4dyLTUT0linrT2pTnsOt7wS9j
X-Google-Smtp-Source: AGHT+IF/o3Z1voLQASAUjPWBawCvXOSnOMhb8Nk2igLOMO9aCbEfuSVrBfikbaQLM80fsMV5kN5HDw==
X-Received: by 2002:aa7:8892:0:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-736eb8a17b5mr7090307b3a.20.1741723093074;
        Tue, 11 Mar 2025 12:58:13 -0700 (PDT)
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
Subject: [PATCH v3 02/17] exec/tswap: implement {ld,st}.*_p as functions instead of macros
Date: Tue, 11 Mar 2025 12:57:48 -0700
Message-Id: <20250311195803.4115788-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


