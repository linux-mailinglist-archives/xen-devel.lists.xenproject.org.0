Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF29A617B1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914970.1320622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t1-0003Z1-Hx; Fri, 14 Mar 2025 17:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914970.1320622; Fri, 14 Mar 2025 17:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t1-0003WX-DI; Fri, 14 Mar 2025 17:31:55 +0000
Received: by outflank-mailman (input) for mailman id 914970;
 Fri, 14 Mar 2025 17:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t0-0000xy-14
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:54 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a4cb4e-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:49 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22403cbb47fso45115365ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:49 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:48 -0700 (PDT)
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
X-Inumbo-ID: 35a4cb4e-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973508; x=1742578308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=aZSmT5jRYQBGwWjDtUsLhl678rFHFxibP6wFupLEeQfhK51rdf7vzlHlot1wwzCOWr
         6z+WeKKOt7mH21sI7aHma6+ZZDWTHjxuk71TmFUNxcdsf563lVpakWmSyHTF5ATgiHZY
         RmIjQOyCN3szcmMyeT7eCltnB3oAsTPrQVpu97zLeP1d+lXOgc9DgzPoQbDX9bxeVtZ8
         mYPEMDpkgelXxifhAZT/+fWqXGgvtQr9qaUgchnQOoYnPN+nuj6KlwEkFflGFNIIOua0
         5ddaFumi/POqtFPe9R07GH2CKNK2KA+v0Phi1gW+lIYsSXg2+EmkyA3aW+3lDZ4H4DI1
         2OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973508; x=1742578308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=ph/uPrg9cZD6Me1mQTBXF7V6c/SFHblPw7uP/pSBFD/f10Fd/kailEB8ldoV3KHvzN
         a91MTAOyBgsGOOA7Ar024mWcA0CrWGSk2jJjMBkCMfscHB2G8Cu9r/b0oeCO9OMCozJi
         /LZuT/3ioJqfXgiZetFw9k7RojD+vz+IwFZixRVhbUY+8xhfRT2FepcPQdqizgy7ZSXm
         TotN6Mm6WtYDR+mjycujg1ny3SAbcoYLz0PImMYcxggVN7dNd6b9AXDEJoM/NXaAJOdH
         r7jRBmnwUZJoK/bWhxZ4v2bYROwo7CNrGTCZgc3Mx7IK5fXsGcWpe97M0Xw6J45xg6+R
         4j8w==
X-Forwarded-Encrypted: i=1; AJvYcCUNFO6ji0Y79I25P6va8OwrIGXyrl6HNMR9DLP4CIWf06TipHTabQ8VQqY+NUig5M4hZQ7ItAyHD1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLc8NqywL1VahYe2JW1jCeT0WLe4sMfJ2U2Je891jQUs20aZsm
	aWX477x2O0Rxc7RJ8fSg9b05+HK+01AVDKJIYZeltniIXia0Fq94v8CsLTtUAJk=
X-Gm-Gg: ASbGncvNduuzzVszGfIY2xCdhIHc1ebyguYcEF6Tobqu+iQjIo3SPvRzfQXUY5hIWco
	CKMA3IjZgegL6LTOaSCMuwKkDneDM6JABgIhPza6W7o4DKGTUcz/8bShz4iVLE3CcIcKfmM0YAk
	l4v0qufsZeCrNT/MjfkbnjFC3ui+6cAaQuG7ubaoPVaPBxBw3O8nXqnCNPt9+Js0XVnCQvcuUDI
	qmwHChhJ1kdnviTPok0S3TCP8iVeq0nwEgDSNpU7ujElfOgmJam87LbwgFKzA/Eg6tZjMynooqy
	MqrQq48Ym0JliCEil+dDG5OMom4iIqGTIZro1iLZPWjm
X-Google-Smtp-Source: AGHT+IEybdH1a4UlSgUtF+/hwXdxnavqEZfmFC1l+XuioTIMcBmIgOmIQCQoptJbICxTDzesMl+Yag==
X-Received: by 2002:a05:6a00:a1f:b0:732:5164:3cc with SMTP id d2e1a72fcca58-737223e7399mr3832395b3a.19.1741973508455;
        Fri, 14 Mar 2025 10:31:48 -0700 (PDT)
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
Subject: [PATCH v5 03/17] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Fri, 14 Mar 2025 10:31:25 -0700
Message-Id: <20250314173139.2122904-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


