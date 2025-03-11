Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D7A5D020
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908972.1316051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k9-00087P-R2; Tue, 11 Mar 2025 19:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908972.1316051; Tue, 11 Mar 2025 19:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k9-00083H-IM; Tue, 11 Mar 2025 19:58:25 +0000
Received: by outflank-mailman (input) for mailman id 908972;
 Tue, 11 Mar 2025 19:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k7-0007Uu-J5
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:23 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b1e613f-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:15 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22401f4d35aso106632935ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:15 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:13 -0700 (PDT)
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
X-Inumbo-ID: 2b1e613f-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723094; x=1742327894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=RjxedlZ+LW41z+BebQ4BXMVeF3VJ5Ei1rh961kAkVbOMN2hI83W/ET8I2lfir2hfsz
         aKIkH2Cq9h7pN5YVvGTkfqSrlcJuElxS8j/tbUbRHgy+8s5b1kL4x0qL66yPKF4djurI
         EOaqaeh9XNI2lKYJGs2S1LQJolhiUiMDsi+4SyubEY+3tBXqDiyq258G5Pdt1CkDNluG
         s0G+FA7XUdbyD8qx9/+5WV9GwpceU2LLo4UDn2UxJqtPkCM3yY4jD+xSzU8plkWa9fCW
         JfsMyJ30uepyxe1wFxHMnCQYbsvQw9ol20d/aor4aapLuB6dz2SLrZ0bFm7uNJxi0lX5
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723094; x=1742327894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=oPxDILh1crm6Ta796d3j8QvgQhd4rl1/ssPFQUpVsCGU3dnAy8gESjjlQhox4qk6n0
         /QF+9SkyaEYXFyv5P7ipYHvT6t9TVuvpmET3grux0SHW+KMGqmtApFiVwIvMqkBGbig1
         bGIsWgI0KZ/51rDjFr70qD0TLtY6Jgq/q8g5vNbfxw9az1p8TuKGWsiovRCXXCsmpSC8
         abL4tfjU9k4ilj07QFMf+fcoBa6KVwCf+3G4dhrqYeUX9UdhIKqTUoeclof07LYOA24f
         juLVYRDv1sz+2es1hj+0KBgIX3Tb9A+szEXwsYq33KLP2XIAvFwZpdYR9OAfnMd0A5JH
         314w==
X-Forwarded-Encrypted: i=1; AJvYcCVGUSZhEM1N+BZvWAq6PfCHWHMUsd4mhFJoE/dzHtwxlWAdE1L3ClJ1M4rQT9Y5bYfMqPaUoCilWDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyozfjsNAGwjPXkinDmPhnxUgn6kODf6LiPouls4rec17R2n1l
	KMHB7Y9lOQOUtX0/7cObZ1DPVdWDZtsz/Gu/2EiR429GhExYP0cgihUpVFxOq/E=
X-Gm-Gg: ASbGncuxmS2q1UEj0KMiS+Mmf8y4N5E4aOrll8xpaT6oiLTkEtcPILuCCyGVHQV9hXR
	Q99K8u4PuYvvf4EL2DBTmEB3wIMEbO6cHns3eazQ+1tNuDWlNxSKrZMFeU8mEeGujOKx8ELxI0M
	UXxC5Im1Bnl/sqzSmeGkinaE3uXdarlEFMDxVxFAQF2lZ1dhD8ntdQLWQLZT/EfZf/5XhwL0yA2
	ea3qaMvJLMsgoTp1GDfkrwuCmZ6BLnyub6QnqG6EGRdyFLUYb+lopx4WYgsaAPYH+g32jWQVjwh
	wWjYCkJIr+eq8bKQCuOL5I5evFUmdzb/dntEV9Q/33L0
X-Google-Smtp-Source: AGHT+IHtn3wjueX80hXlhR3WWJLzlWQ/GjOadBaAC9ISUpU84/t/abdjw/+6bEkcmiHY0rapbw+ALA==
X-Received: by 2002:a05:6a00:189b:b0:736:755b:8317 with SMTP id d2e1a72fcca58-736eb8a15femr7017121b3a.21.1741723094173;
        Tue, 11 Mar 2025 12:58:14 -0700 (PDT)
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
Subject: [PATCH v3 03/17] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Tue, 11 Mar 2025 12:57:49 -0700
Message-Id: <20250311195803.4115788-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


