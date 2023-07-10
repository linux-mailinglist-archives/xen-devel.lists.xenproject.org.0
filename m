Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280274E5C1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 06:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561380.877974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rO-00071Y-2m; Tue, 11 Jul 2023 04:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561380.877974; Tue, 11 Jul 2023 04:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rN-0006tR-Vx; Tue, 11 Jul 2023 04:20:21 +0000
Received: by outflank-mailman (input) for mailman id 561380;
 Mon, 10 Jul 2023 19:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6PHc=C4=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qIwVJ-0005bX-56
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 19:25:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e96e22-1f57-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 21:24:58 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-991da766865so621284266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 12:24:58 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a170906480f00b0096a6be0b66dsm110076ejq.208.2023.07.10.12.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 12:24:56 -0700 (PDT)
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
X-Inumbo-ID: 74e96e22-1f57-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689017097; x=1691609097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jftu1XapvOLMzEYkqywXgUEUxuMrQszDRi+r4S9T/B8=;
        b=jFKS0dDJt25TajexlB3hdj0BfuVDTTR2cNBPmf6qukrN+1LWfsXoV1T2h3hMn11QA7
         PVdUNSGV8fNwqYlSRRmyhqaLM4ctHU2vDoVaOjgmxwQ1mTesI4qIpka4EGOuxewv/777
         HUwt1q2YZucKXu8Ew9w2AGcbpraL2lrANBy/H87nIkET4S/EVNiN5FxqKhHDkTHIr0AH
         ZRhGfVbts058LX9BW6ssPRYfynYgC9yAmNQ1V5Lu/Nsg0plw43AjSQyyQFRI7RPTBjD9
         VR9T8R8SOgbdiqHefLbmNbw0rrKfrtzs1LNjqjFnJNkDbwm/R0EED27L2yKFN9S4KtaW
         2i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017097; x=1691609097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jftu1XapvOLMzEYkqywXgUEUxuMrQszDRi+r4S9T/B8=;
        b=kjCILL+ufzxy6O0Qf6zXTpiug4sB36ZEGCsgyyZRnyqhSqJVRSfTy3vpDQkAxT2PQz
         HhMJ/Z+I93eDm/LVz6ozgQ7cqj/QwsxzQjlYcDgw/9WBNhXzZK4xMa5Cvoxj/cQKVGGm
         M97p0Dbr0LO5AcCWBaApf2hcbQzSKkrZTC7C92VCDQ7SzbAH3kwW2J6Vqr/5+gwIKpLB
         rCu/P1wB7TCJcqZTtp1tfJXLbDiDRB+35PDb3bS+YSeh+81NzXeyr78eKoXu5qvk4v1I
         EFKPxMsdHQQzit4LvB3uRqI/wrTC16Sj6PYNuWHfc9vmNgKqYfmni6Qjx0LqkJtNrRrw
         FTgA==
X-Gm-Message-State: ABy/qLZqWhUV6xQyILKlErINmleBWQfI8KIMq33OZbVmteUH4YuKcRts
	53uGpiIocN40oIRu/0nleEQ=
X-Google-Smtp-Source: APBJJlH5IVyTpedE5IkFA68q07QVykSKpgW8fZffI7YRGbCbmTiXrGVpLLobb4Cs4f1LpCQFV5itgQ==
X-Received: by 2002:a17:906:edbb:b0:98d:63c5:d135 with SMTP id sa27-20020a170906edbb00b0098d63c5d135mr750873ejb.54.1689017097267;
        Mon, 10 Jul 2023 12:24:57 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/3] locking/generic: Add generic support for sync_try_cmpxchg and its falback
Date: Mon, 10 Jul 2023 21:21:54 +0200
Message-ID: <20230710192440.47140-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the generic sync_try_cmpxchg function from the
raw_ prefixed version, also adding explicit instrumentation.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 15 +++++++++-
 include/linux/atomic/atomic-instrumented.h  | 10 ++++++-
 scripts/atomic/gen-atomic-fallback.sh       | 33 +++++++++++----------
 scripts/atomic/gen-atomic-instrumented.sh   |  3 +-
 4 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 18f5744dfb5d..037742c9f97d 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -428,6 +428,19 @@ extern void raw_cmpxchg128_relaxed_not_implemented(void);
 
 #define raw_sync_cmpxchg arch_sync_cmpxchg
 
+#ifdef arch_sync_try_cmpxchg
+#define raw_sync_try_cmpxchg arch_sync_try_cmpxchg
+#else
+#define raw_sync_try_cmpxchg(_ptr, _oldp, _new) \
+({ \
+	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	___r = raw_sync_cmpxchg((_ptr), ___o, (_new)); \
+	if (unlikely(___r != ___o)) \
+		*___op = ___r; \
+	likely(___r == ___o); \
+})
+#endif
+
 /**
  * raw_atomic_read() - atomic load with relaxed ordering
  * @v: pointer to atomic_t
@@ -4657,4 +4670,4 @@ raw_atomic64_dec_if_positive(atomic64_t *v)
 }
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// 202b45c7db600ce36198eb1f1fc2c2d5268ace2d
+// 2eb1fe994b6dcab645bbb5a642a4aaa9374c5600
diff --git a/include/linux/atomic/atomic-instrumented.h b/include/linux/atomic/atomic-instrumented.h
index d401b406ef7c..54d7bbe0aeaa 100644
--- a/include/linux/atomic/atomic-instrumented.h
+++ b/include/linux/atomic/atomic-instrumented.h
@@ -4998,6 +4998,14 @@ atomic_long_dec_if_positive(atomic_long_t *v)
 	raw_try_cmpxchg128_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
 })
 
+#define sync_try_cmpxchg(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	kcsan_mb(); \
+	instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	raw_sync_try_cmpxchg(__ai_ptr, __VA_ARGS__); \
+})
+
 
 #endif /* _LINUX_ATOMIC_INSTRUMENTED_H */
-// 1568f875fef72097413caab8339120c065a39aa4
+// 2cc4bc990fef44d3836ec108f11b610f3f438184
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index c0c8a85d7c81..d87148d6e588 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -223,14 +223,15 @@ gen_xchg_fallbacks()
 
 gen_try_cmpxchg_fallback()
 {
+	local prefix="$1"; shift
 	local cmpxchg="$1"; shift;
-	local order="$1"; shift;
+	local suffix="$1"; shift;
 
 cat <<EOF
-#define raw_try_${cmpxchg}${order}(_ptr, _oldp, _new) \\
+#define raw_${prefix}try_${cmpxchg}${suffix}(_ptr, _oldp, _new) \\
 ({ \\
 	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \\
-	___r = raw_${cmpxchg}${order}((_ptr), ___o, (_new)); \\
+	___r = raw_${prefix}${cmpxchg}${suffix}((_ptr), ___o, (_new)); \\
 	if (unlikely(___r != ___o)) \\
 		*___op = ___r; \\
 	likely(___r == ___o); \\
@@ -259,11 +260,11 @@ gen_try_cmpxchg_order_fallback()
 	fi
 
 	printf "#else\n"
-	gen_try_cmpxchg_fallback "${cmpxchg}" "${order}"
+	gen_try_cmpxchg_fallback "" "${cmpxchg}" "${order}"
 	printf "#endif\n\n"
 }
 
-gen_try_cmpxchg_fallbacks()
+gen_try_cmpxchg_order_fallbacks()
 {
 	local cmpxchg="$1"; shift;
 
@@ -272,15 +273,17 @@ gen_try_cmpxchg_fallbacks()
 	done
 }
 
-gen_cmpxchg_local_fallbacks()
+gen_def_and_try_cmpxchg_fallback()
 {
+	local prefix="$1"; shift
 	local cmpxchg="$1"; shift
+	local suffix="$1"; shift
 
-	printf "#define raw_${cmpxchg} arch_${cmpxchg}\n\n"
-	printf "#ifdef arch_try_${cmpxchg}\n"
-	printf "#define raw_try_${cmpxchg} arch_try_${cmpxchg}\n"
+	printf "#define raw_${prefix}${cmpxchg}${suffix} arch_${prefix}${cmpxchg}${suffix}\n\n"
+	printf "#ifdef arch_${prefix}try_${cmpxchg}${suffix}\n"
+	printf "#define raw_${prefix}try_${cmpxchg}${suffix} arch_${prefix}try_${cmpxchg}${suffix}\n"
 	printf "#else\n"
-	gen_try_cmpxchg_fallback "${cmpxchg}" ""
+	gen_try_cmpxchg_fallback "${prefix}" "${cmpxchg}" "${suffix}"
 	printf "#endif\n\n"
 }
 
@@ -302,15 +305,15 @@ for xchg in "xchg" "cmpxchg" "cmpxchg64" "cmpxchg128"; do
 done
 
 for cmpxchg in "cmpxchg" "cmpxchg64" "cmpxchg128"; do
-	gen_try_cmpxchg_fallbacks "${cmpxchg}"
+	gen_try_cmpxchg_order_fallbacks "${cmpxchg}"
 done
 
-for cmpxchg in "cmpxchg_local" "cmpxchg64_local" "cmpxchg128_local"; do
-	gen_cmpxchg_local_fallbacks "${cmpxchg}" ""
+for cmpxchg in "cmpxchg" "cmpxchg64" "cmpxchg128"; do
+	gen_def_and_try_cmpxchg_fallback "" "${cmpxchg}" "_local"
 done
 
-for cmpxchg in "sync_cmpxchg"; do
-	printf "#define raw_${cmpxchg} arch_${cmpxchg}\n\n"
+for cmpxchg in "cmpxchg"; do
+	gen_def_and_try_cmpxchg_fallback "sync_" "${cmpxchg}" ""
 done
 
 grep '^[a-z]' "$1" | while read name meta args; do
diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
index 8f8f8e3b20f9..592f3ec89b5f 100755
--- a/scripts/atomic/gen-atomic-instrumented.sh
+++ b/scripts/atomic/gen-atomic-instrumented.sh
@@ -169,7 +169,8 @@ for xchg in "xchg" "cmpxchg" "cmpxchg64" "cmpxchg128" "try_cmpxchg" "try_cmpxchg
 	done
 done
 
-for xchg in "cmpxchg_local" "cmpxchg64_local" "cmpxchg128_local" "sync_cmpxchg" "try_cmpxchg_local" "try_cmpxchg64_local" "try_cmpxchg128_local"; do
+for xchg in "cmpxchg_local" "cmpxchg64_local" "cmpxchg128_local" "sync_cmpxchg" \
+	    "try_cmpxchg_local" "try_cmpxchg64_local" "try_cmpxchg128_local" "sync_try_cmpxchg"; do
 	gen_xchg "${xchg}" ""
 	printf "\n"
 done
-- 
2.41.0


