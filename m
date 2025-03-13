Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9443A5FBF9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912882.1319065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaX-0000nI-91; Thu, 13 Mar 2025 16:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912882.1319065; Thu, 13 Mar 2025 16:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaX-0000kz-5f; Thu, 13 Mar 2025 16:39:17 +0000
Received: by outflank-mailman (input) for mailman id 912882;
 Thu, 13 Mar 2025 16:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaV-0000Wy-Ru
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:15 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ef7577-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:15 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso2501371a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:15 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:13 -0700 (PDT)
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
X-Inumbo-ID: b2ef7577-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883954; x=1742488754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=q+TIxJJPFQpJ80hjqKuu01SX5jj4bMVSKl8AIGqJR+uufkpGZJfomwHzeh9rhl0zfh
         x+KBPurnJpt7AwbCU8L5k995dU69/OOFSwN+ce/4XtCSoSorot6dyNf+h1rYQklO+QhE
         neLfOPXNsKiTxnvl/Mp0ncrz/97hrZZfyAGenE5tuUfcGfRU2SzcIQOlyX8+Cjdjp/Yr
         24h6BiSF+oajyj0BC8VnZrXcFL6mYaZjya23TC2VauBXalfjgOAGmpgAFLcpLNKrrPrk
         3XPcdpyBBAAT/RLUMtdax3JJBU+ut32gCDrnBRehxpgLKxFJv5OdDSmrgunb/EqK6QSo
         TuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883954; x=1742488754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjQjYNlvDIsMbe7+veFF5h4s6vvln32m8yANkT1fS5Y=;
        b=H7P/tzqZMmfctHCKNJN2bFTNzmk7GBMHj8ixYL0x/F7QSxnAmKJpyJwXluVXRqV0HQ
         tjMCZvYk1tmz7DrzKEvjzpIZ2sp63f03xzINEEC/IsNDabJNN6pup5F2ILTQYz3X/GSC
         KiLJNbodwvxeuG+4LdVMiWahccTOmHoJtFqvtWQeOjCGEzMFlv4dcadlyKsQvNI4qI71
         GOvxSLBQsoSIwDtusLjuKfOTs2/qWw1Hf9Xs2v10yc83dCIYAFx2aFsOHCpeAN9Yf2O/
         Cg6UVcBtYBAkUzVPYVhJ24j99uawJPKhwIHQMw6Sj5ONp+jBcaelGQnYHn9N5LQrwuh8
         MTzA==
X-Forwarded-Encrypted: i=1; AJvYcCW6KwUQmK1RsN2KCV/K6P8oVkQOhJEKuyH9yiKw425NFbupoa8sEhUKaKjZMPmF9npbvuXC08m9ZkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiD8mSIFHeSkJHHmYqwFTDIdrzqfs0y3NPlQf3G8+L5eA2GU4b
	cmNenAMVuMMhOxD8DVCTxeGD2KIqRGDmhi2D3TmDKARNkjEuv+7B863p0cU4sv8=
X-Gm-Gg: ASbGnctrieV/8PnQ7Ha9zNj7qm9yB5gMT7FQ74c0JLNQObvt08qWysrDuyVHb9maINF
	1dwjiJY47AjtShujsJR/+/UxnviHG69cf0PVuwe0vAQ3bSG9D1bgEdej6BViho3bJp/yYWdh2rS
	4qLqIp1xSYccGJJta0WUeIV2IDJpeK/n7a4DQC9KN14St7Io6eiBrB0+eUPE+TnnEjIpq3fpuSV
	Fi6U1uhM4qZ8bfU9Uej4i/0cxt3rxqRe+NFbyr1Zf1adbI1lV0I3HU/Lm6h1w/J/WXLLwRv1cXI
	cK45bld2swSZhDm6jSp7+etTCC01eKa4ByCOxIVuyqnp
X-Google-Smtp-Source: AGHT+IGAE0wRrFnOgUSptf/ZCGVy3gy2ROtBxgIz+VJH5KWtqtjx8oj2KP2h7DP6p39QjbuO2M6/IQ==
X-Received: by 2002:a17:90b:264c:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-3014e821305mr250112a91.3.1741883953849;
        Thu, 13 Mar 2025 09:39:13 -0700 (PDT)
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
Subject: [PATCH v4 02/17] exec/tswap: implement {ld,st}.*_p as functions instead of macros
Date: Thu, 13 Mar 2025 09:38:48 -0700
Message-Id: <20250313163903.1738581-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


