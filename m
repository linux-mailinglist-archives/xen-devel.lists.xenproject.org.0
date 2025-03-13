Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCFA5FBF8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912883.1319076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaY-00012c-HY; Thu, 13 Mar 2025 16:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912883.1319076; Thu, 13 Mar 2025 16:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaY-0000zm-Du; Thu, 13 Mar 2025 16:39:18 +0000
Received: by outflank-mailman (input) for mailman id 912883;
 Thu, 13 Mar 2025 16:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaW-0000Wy-Tx
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:16 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3930728-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:16 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2fe9759e5c1so2145238a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:16 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:14 -0700 (PDT)
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
X-Inumbo-ID: b3930728-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883955; x=1742488755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=xkQjl35VPy+F23VkPda0ZPTwoNxj3meH5FNAFxRt48hqtUJZQVHP05dF5k9GeIwYo5
         n5HGhYyqdbdcsXlw35tq2fpC2+slatJZoC0pd9q2POwgtFKYlERmC2y3nV8XdzIR4Mn9
         h8uLVi8JOb4L8JpOr0QjATh1YuDzlsBjKRFkcw6rVlaQ60GQn24w3hroD9m/Zh1/kVkV
         BJn8k7CnQcIOrbX2PI2T1UVFi2IEI6BufkYVQWqv9FlX59BjPsFfQJb/npG4rwZFwNz6
         a/FBAjSNBEriHtl9Wvd+7mSF4R7aHPQIkGl3UQCqtBwFhFgu6DMzw9SzrkWtVBXRLDBN
         UgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883955; x=1742488755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=g3qHqucFIyciBW5E5s/1uitMk4OZQd3TTuih0zXU2qGF9JDIePmz7VMIOZKBwd50Hy
         F1DiKCi3ZcS2SdLVT1+QM8tuG6KZYBaAD7+caU3cX9Xdmi97vlgbooMd84kauGMmOCy+
         yGBWbDx1dJX+EvQrMXKMETIkJoWIAzRPO7iX27qjHg3oRh+Z8ZPjFOvlqiK0dXBKe14E
         xzsDo4YpOvd1il5p+UmT/NrCQrFba+vDzmRFmQH6dcOcquiyUihqnQjc8siEQh25LcnU
         vYzcWIBeEQGXeWOaZXOkeOI3TMNGrzhhbkxgFaaSW3XWpnkDNr6tdcZgMPkbs/4ICE3w
         w8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXqj7bE1y7lMnzwsbqkn7zzJRqZGV0ukK3J+Qr3mKhWQh6PKBPmoo8eznKlx3cqSCT7vzbn77+H37M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRy+EmloFsfrGK/ZOSGWgBlms5FSEueBAti93PRPCwELeQ2OJ0
	iLu24Fk4bb7qRDJEvZkpTda5CWJKC1BWeITooLukWH73BQCvJAjE2DCG1sAp8h4=
X-Gm-Gg: ASbGnctEK7N4RK/+KB6APzKZzFZO36l5znIdXh9WFSlzbvgovzzxyKvd/i83nq4CNVy
	DQcdo5gsaT6E8Q004HVD9rl7bRJ8c0Mgu546fnFhZ+3ctjKziB8yv/bEfTOZrV3AxP/XStfHAKi
	1+/6SrfC+Dv3V19mGUrrecTwEln/DGO3BH0w3mUfw+HJb+5sSuA801/iNNFXRJ0Ly7V+lY3R8f3
	zvcIFOijjvVL0TDUN1GwW87AQe3ZQoipNEBYghXDM3b6x+WmjpiTcmPDtKT/RN5k0rmEaN5K2Yj
	NYE0QtIqZdSVDakwhg0OGaIPYS7SUTLXJblEN8Ejl7CD
X-Google-Smtp-Source: AGHT+IHnwSLAPNKXU3gMx+5tsTTteDKv4SHyK4UxOMNd4PXKbxpy7VaCfSFX9w53V0ZmsOD5PjeQ6g==
X-Received: by 2002:a17:90b:2f4c:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-300ff10d6d1mr14553930a91.21.1741883954948;
        Thu, 13 Mar 2025 09:39:14 -0700 (PDT)
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
Subject: [PATCH v4 03/17] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Thu, 13 Mar 2025 09:38:49 -0700
Message-Id: <20250313163903.1738581-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h         | 12 ------------
 include/exec/memory_ldst.h.inc |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e56c064d46f..0e8205818a4 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -44,18 +44,6 @@
 
 #include "exec/hwaddr.h"
 
-#define SUFFIX
-#define ARG1         as
-#define ARG1_DECL    AddressSpace *as
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst.h.inc"
-
-#define SUFFIX       _cached_slow
-#define ARG1         cache
-#define ARG1_DECL    MemoryRegionCache *cache
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst.h.inc"
-
 static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
 {
     address_space_stl_notdirty(as, addr, val,
diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 92ad74e9560..7270235c600 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -19,7 +19,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef TARGET_ENDIANNESS
 uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
@@ -34,7 +33,6 @@ void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
-#else
 uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
@@ -63,9 +61,7 @@ void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
-#endif
 
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
-#undef TARGET_ENDIANNESS
-- 
2.39.5


