Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A202A5B7C4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907042.1314444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvs-000594-46; Tue, 11 Mar 2025 04:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907042.1314444; Tue, 11 Mar 2025 04:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvr-00050C-MC; Tue, 11 Mar 2025 04:09:31 +0000
Received: by outflank-mailman (input) for mailman id 907042;
 Tue, 11 Mar 2025 04:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvp-0003IE-FH
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:29 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9760f55a-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:14 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22359001f1aso119439535ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:12 -0700 (PDT)
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
X-Inumbo-ID: 9760f55a-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666153; x=1742270953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEAQ9wvxViIwfRRF7MZBxVkXSE0tKicEinIFunB945A=;
        b=e7B1TpjeCg/ErBImGbfk6MpwK3S3fMFoxord7abVhnWVndkTmJclfG0wagCGOaUHh2
         /Ph8UA8U5Wgj5djqXeAjGH1TWka9sKJFO116B1Jw17ap/Ad/+sNGMJU8ag90yzbTvN0S
         AUN1W5JCbfiQUfeu9UFC+/Tx52sRdN9y/VX0z8KntM+1yTyHCWVFL8jQJyod2Ddi7QA9
         qW40eo7MgFm0tNW8FjUMdpHZYtIHJAFUjJalzTPCRKxhuOijpQ//dNlbgYp+rGpr8CRe
         RVYmFFzZ3gwsP3gMufTlRZdWvJUdTMzmj7Ze0qy/85BXSEq8MpGw3VFAQqbwvAFPpf0J
         BeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666153; x=1742270953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEAQ9wvxViIwfRRF7MZBxVkXSE0tKicEinIFunB945A=;
        b=TdSTlLSsgo+YuMflH3VgECTnkCV2AH3w2AQ1YNGH99u0huoWb8iTDxYq8BzzFTE7on
         Rckb5LrIgFudhuXh0yVef188O8YIZoSt0FJjGRaxokIvxEAw24ZDeCpLpuCUXWXjNZOA
         bP+r8KHWd0Jy8ahsXnuaKsIATkOsA4xRia7LU4WiqYzT1cVMAkA3709uPX8TtGdFVYmk
         i9xmYN4zYMBOIXi83+U7LG4iqQ1jtHKIFMQbkO+EMIWYro6LbvYZdDQHgWEzWHC3Ush8
         jJ43t8VLlOJitmkqmvgcKAO+Lr49ndHerq6kAtlf+hF8z3JyOjoqN6OXWqAZ6Zz+S4A+
         I1OA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqVgMG17q9IR4twfo8tg2yoIgouwYcg4u/RlAiBEagGHEEJMjV1H+Lidq2iN8q7chGtc531UjEc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw37/A94MjI5InC/XCc1F9kApkViUONQPGgI1+Np8t5N7pZQhVh
	/UrvSckqgaPDDlA+FWU8q0nZHFGtmp5JRZaSQqyxqUHcPz3nf9wkEynAWU1Kc7c=
X-Gm-Gg: ASbGncv86DFXemVyH+/JXB7mkuTvj400BsNJ9mybOvrBmVPgYYbpH0Ges5ArQtAsxUy
	Z2Z6kYC5Sz0+usaN3YL07eFjM1JMkZrYB8muvm1gWejOoetP4mqLLZq1BP+EwtAVZ0t0JRI8y6S
	ljEgNU79OTMGQwGsQDzE7ZVIhFi/4RTUGhXAuQS8iXMhbIxIL991Ccq+MWemimSEzOsKIhc9Ybu
	rSpmMSigOO9LAyccahAeE+aKJfdw0FzXVgGqRwGCYfKvBUc7j9VO+IjdVQ4Cr20LNQqVDJee/PI
	dJK9G8LdbqiLqnGsjMir9Hm1wKxwBjwXTQ1+ZCqwZGBR
X-Google-Smtp-Source: AGHT+IEEBIqVh4ZJ8rHFVsra/zLBqrrO/2Z7wqCz/tbRxr6Sh6SkveOkvqyI/KznC/OO1HDpbbusNw==
X-Received: by 2002:a05:6a21:4d17:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-1f56e71100cmr14244196637.6.1741666152825;
        Mon, 10 Mar 2025 21:09:12 -0700 (PDT)
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
Subject: [PATCH v2 14/16] include/exec/memory: extract devend_big_endian from devend_memop
Date: Mon, 10 Mar 2025 21:08:36 -0700
Message-Id: <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

we'll use it in system/memory.c.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 60c0fb6ccd4..57661283684 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
-                       ? target_words_bigendian()
-                       : end == DEVICE_BIG_ENDIAN);
-    return big_endian ? MO_BE : MO_LE;
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
 }
 
 /*
-- 
2.39.5


