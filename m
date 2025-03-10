Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828FA58C35
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905958.1313436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-0001VD-Uc; Mon, 10 Mar 2025 06:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905958.1313436; Mon, 10 Mar 2025 06:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-0001Q4-PO; Mon, 10 Mar 2025 06:43:00 +0000
Received: by outflank-mailman (input) for mailman id 905958;
 Mon, 10 Mar 2025 04:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEA-00070S-TF
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:58:58 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f03c64d-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:57 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22435603572so30007585ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:57 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:55 -0700 (PDT)
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
X-Inumbo-ID: 5f03c64d-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582736; x=1742187536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKLFWb+An2Ks9U+R2rK1VtO2Tw0/JUbGbAmdQc7IQwE=;
        b=d8E/aEnpuRQkUpOaZn5NmjBDE5tx1OV+ELlwxUK8LwHAFdwbjFA7aaKbNtPsVXFMSn
         aYYEEc30wAIYa9xxROFlqZBI09sXwj4/P56iFtXYUsl+CktnpcgEmtReAeVtKN7ru0By
         v/5HuVQ4bT9883O7Y8DVwpTryW95ThE5fMjGjnUMELOAFPY62I29WhXcbSny1+NNVIoJ
         RSWYstgoK7mRa9cYBjndF7SSyAuIfT8sbGyERqXj2h3Kj0UqwCB5ovmxME30svMaIkb5
         ccJOVfNPV/qe98BDxFrTpaNL2RbFeVAMMZNRkt1Aqeljp1IFypPOMfiuqxuZbIB6mAxF
         kiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582736; x=1742187536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKLFWb+An2Ks9U+R2rK1VtO2Tw0/JUbGbAmdQc7IQwE=;
        b=W1IwdS8TXx4J18CemnzO5n90Dm2/QlaOy74CUPE0dZDPBqt4nHZC6SF4zO0+TEA9/s
         GcJN3VPUdP9MzNzFHI/1UCXiB9iLYmuo2njpLlA2oo1qZEJ946wtCFuKmjvXBfG8VBLb
         ntpANZYKPSXp7e7ELQbl5PQfJm++o4JArE0reg1OIQueNdE4Vx73m4OeWJAcaEwyZ00s
         cFbmXh8/D0J6XxA6/a0qP2iZDlHIA0XTPjhux8SqsBpmlxlEmUhrTVnNgHAkKnMgD1eL
         1t/7yGB/Dt/0KU6SO9v6Zj8ZIEYtXbaCxu2C0zCEjKf7pDEZeexVG6KtFdY9dMJ1SqiC
         yMTg==
X-Forwarded-Encrypted: i=1; AJvYcCXyP0BGBGg4uB+gkCWD5NCR3GDInLXatlkhIv0h0mJij76ledFZkSJDD2DbIDAlRZBKnyNy2RrBU5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys5liU36GIX+yXciIajej7g+PAsfiqZM3psrafYkzlq1DEIJqy
	ScbRN6hEZnchwLdOONld1qDf7Dtn0nb6HWO6mDkVwGnSyc6q1GEo9/XsfEaTGaA=
X-Gm-Gg: ASbGncsbRTf69cXWTmUUaeC48Y7758ZaLJT5dQRfndawnq4zuzpeYjyJL87Z7mnYYKf
	9iEhmKyWdJcsyzEjVZI8tm0dAIVB7zMVro3ySkTYRfxAl7mSisvHVXlVtmJf5hA6XB3H6Be8rGT
	DCw+HnvoBGyAPd02PF5llkYziuBwb4MXGmp5rP9Q9wlAz6htQHKTj6/4vdNMZati8C7O+4rO/Ii
	zTsPjhUl9mtNC2tPdH5qj6eK319IzqkAs11iydJnXDz3fSrHgEFv9bWuSD80LOfFpQERmh20EHx
	L1t7lKpSm8/ea3AzT7yWgcOBKgFTyxUNLxDaS9KXckXD
X-Google-Smtp-Source: AGHT+IEAovvlOy2ME9s2bcowigrmpQEpYOhHLOJWN1HotCTdKvUP3vKFXajlsE4wLKble7VBohAKKQ==
X-Received: by 2002:a05:6a00:4fc6:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-736aab17045mr17832470b3a.23.1741582735793;
        Sun, 09 Mar 2025 21:58:55 -0700 (PDT)
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
Subject: [PATCH 05/16] qemu/bswap: implement {ld,st}.*_p as functions
Date: Sun,  9 Mar 2025 21:58:31 -0700
Message-Id: <20250310045842.2650784-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, they are duplicate of the same macros in cpu-all.h that we
eliminate in next commit.

Keep code readable by not defining them with macros, but simply their
implementation.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/bswap.h | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ebf6f9e5f5c..46ec62f716d 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -442,6 +442,76 @@ DO_STN_LDN_P(be)
 
 #undef DO_STN_LDN_P
 
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
 #undef le_bswap
 #undef be_bswap
 #undef le_bswaps
-- 
2.39.5


