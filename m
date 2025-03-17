Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77147A65CAE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917738.1322571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIH-00072N-7d; Mon, 17 Mar 2025 18:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917738.1322571; Mon, 17 Mar 2025 18:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIH-0006yn-45; Mon, 17 Mar 2025 18:34:33 +0000
Received: by outflank-mailman (input) for mailman id 917738;
 Mon, 17 Mar 2025 18:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIF-0006uj-PC
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:31 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75fa56c0-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:29 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22435603572so76549815ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:29 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:27 -0700 (PDT)
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
X-Inumbo-ID: 75fa56c0-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236468; x=1742841268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=AfnojC/5gkUWfjboFs4WXvfy+JUz6P1sbqKk5455V0cgJcXT0VqPZ/Lh2GYBNrtkHF
         LJ5Uoaw8ATOX/LaR5TTVmnUVXJUwP0YVEMcU5RNmtgPUf2Ca4/4VB2glZLrf7LiJ9ru4
         fI9OS4FtdNgIcsxzUdojcwwxHrrOSz3YnpHz0qw1nQd2R+mw4QkJdslnS4KDn5C3y814
         H2BQJFs4tnByI1zkl2ziiqeRxOZxEppl8qaRa8Yz4PzuVAqLDWJ7hJugRKsbgBY/vQKZ
         iRuV1nIRPuoMQy4gwqc0ZKUPg6G+QqtlGSBbQleFbJ6roXmQ/jXTAN9PhUFtE6mMwzkj
         ei5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236468; x=1742841268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
        b=lvh6MUZpnueZdBvu09tj0nql3cUnLW0705P/0DdFbBJ6wxdLZBcB/IkmMAyhJgypMp
         T8GwDW/SMYmLFmGteKOHCgz3maRyPpoKE2MiDrwtCXfb0aseBpBqZwqbncAXbFKtOsf+
         +1O8aWh9GzU+1Am9lXO5nWqPxg0SHvPKVDWp2HkEGIf2llCfdmP+yb68MAv8HKMXUnSs
         tmWjWlBMsiccbLBQx2PMCY7a3PmvPSAVnDea5GANbhfiR8pFL1EVFYRKqUi8fVeosndP
         Z/9KgouQi2xTAEpOAnwTRWme2VZ/xzupse7u3T2I7M07Qc58EDjQ+raZa7kBQuEWr/Vu
         gdLg==
X-Forwarded-Encrypted: i=1; AJvYcCXSLtP1it+o6NgUTl5bh1rPK6sidYwklmPC3bWi9NHeUbDIV52IS/QdhXSjZAkGLC+9vwCX+AJNoqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx674MeGIM8Q/9Zw6ydYNCtyis5vbeUx0XNT+pEjCA7SGgzzJIL
	RbI+4Cj21zAe8BQI4FT9StaaKfwxJDmycjl3P0YVC6ajM7UkErkZnaKEzbwAVos=
X-Gm-Gg: ASbGncuOIJwGBJRG2gBNAUquLvEDYgG5Fe9qIiKN9gz+v1MP9y7rIFO/rgK9vn9eZbS
	zDsNPWaVY2RzsDopQrJrhRUILKIz9xQMDlk7UA8j+Hizg8zYcw0aTGVke6uGcjeKdFocWua6e0J
	vgz43PNK9/fGwWctakPNqlWlkZJywTIYSudxsjz66NDaMlaXypvY2zAfHZkGGJ88K4A7LmWBp69
	T70vPfFsV/hNhTPYIiOn73P+rQrlWRjdEaGkLnXxwhs53ETPpujsqaRujF0nxEZMm+6j/xs3QD6
	uW9FPAUzpdBsqw7dWcPOHvnryUZqALb6/3ww56YJ6jtV
X-Google-Smtp-Source: AGHT+IHQDcKJsv+Vb17cz20O+u5FV4YlvIefcRPItg35hxavnuYTE6e3UlOmHk58oIUa6dLl2/Rvnw==
X-Received: by 2002:a05:6a00:13a6:b0:736:7175:f252 with SMTP id d2e1a72fcca58-7372239d970mr17183784b3a.14.1742236468325;
        Mon, 17 Mar 2025 11:34:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 03/18] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Mon, 17 Mar 2025 11:34:02 -0700
Message-Id: <20250317183417.285700-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


