Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E58A5B7CE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907016.1314317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvQ-0000nA-Db; Tue, 11 Mar 2025 04:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907016.1314317; Tue, 11 Mar 2025 04:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvQ-0000hU-93; Tue, 11 Mar 2025 04:09:04 +0000
Received: by outflank-mailman (input) for mailman id 907016;
 Tue, 11 Mar 2025 04:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvO-0000fJ-Ks
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:02 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 902e64e9-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:02 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-223fb0f619dso93349925ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:02 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
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
X-Inumbo-ID: 902e64e9-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666141; x=1742270941; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTcsPgfp4qWHKI5IiGC/xRJnn7HmZtcbIn5ZIF7f/ys=;
        b=cSbNj25mA5HsZT5KVjKrE0TLwJV6j9DrVK5wgfTSbC3nASEmC8LQqvS2O/Ni9rsnc+
         G0OF8otUYOSUnS3iZ8OBiHGh9bXN8DigRl3bg5a1AhbB7Q6dj//F3fgm+TF5NgupOF1w
         rPWd5nIhor0AnwVchF639ppfnmvjoLZmaeYDA5O/heas/6U+bbCjmAEPIP610qjjgk99
         zgzLiJKyeuMly6na50OJVHd8zvFRnNtda+YmDzzDyWshND7By7iUcQzlnnvy6DrtAPKl
         SQ523UA4F4wMh21d/cgUlplO2+9EoLPMPda/HrbDpGVT4sgCvUAiaSsE72DVMH+p7B/p
         VFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666141; x=1742270941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTcsPgfp4qWHKI5IiGC/xRJnn7HmZtcbIn5ZIF7f/ys=;
        b=KfwbGOq1OLAp6nTkU3+yORFIVW/IZ4VScFCgZWs/zn0/Pha/Yu0arDZ4gybRfj4AwU
         5FYkr+l/7XEGnYE8iYnheAghxJsXbvT5aon7IXseryx9FDjOQlywTNYmYeJo5vI7lsLO
         83TXZTchAgZySSVpOHPG/IfRd5eUEC9Np4eqxtG5sEmAYmdEdhZHQuLsrM9pC1SOaf4l
         Ce29AIAYHaMZzvotcKH2vjKnpYAwm4py3mSbnEIoNHhRPL/j+eB1O0frYah7CLfdPYIn
         gZ6EacdfZJp+SyXF6TCpmQOkqNUaejA96/sseLPdzQPe5qmoH6FpTHQpCKZ1porm3J7Z
         tkLg==
X-Forwarded-Encrypted: i=1; AJvYcCXDFQQK66w1OC6jAKgNdYILvAw80J7JkRM+MBWvSh2n9kd/yfRvaqDDa4h26+1kbLAKigbCSBJLbZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrKOa3q93fEyzPZFLiK8IInFz0LxB73Jg0I1L7Dkx7OuwZpOsh
	n+C9M/G9gC8hIDUL6ZeWeJs/sxWVynQKKU3ufIEQAUfyW6asTz56ZP/UtkHDdYE=
X-Gm-Gg: ASbGnctW4VlWONDzIbCw7Dk/rzOoydnpXKFcxDHMhstF0mjbHSNmPuoS7a1WYiz+BpE
	NcJEMjNOLYXLbnic2iNucdj1HlAx7eH+XEuA+wclRr+b/7xkzXBNUo6SYP03/wkBYacasH3XMFY
	s9ozY7RoQ5sZpa/Bft+IeQvFPRwZlJfB/aaflBzfeRhnMMox8CaLWgaKXADiXwG+U0Ez/ldVofe
	TEGn9qqNrHyT7Hft8zveWaml/+IcYRAyDfXk6RUKH+V4iXk+p+VqZCeKfDzZgAG5xykvNf9RSFF
	bSjY3cXlOM9nC71e6BOqjPlcqVFKEqgW2tLZOgBLNocx+RC2Y1V7CyQ=
X-Google-Smtp-Source: AGHT+IFvmMV6FR9w9HRJlmca+n7Q/Lcb7qpOce3I31boqIZsCEXwR+2F1i3uigVa31tDctZYbS6W9g==
X-Received: by 2002:a05:6a21:6b18:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-1f58cbef8a4mr4223140637.36.1741666140734;
        Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
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
Subject: [PATCH v2 03/16] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Mon, 10 Mar 2025 21:08:25 -0700
Message-Id: <20250311040838.3937136-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

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


