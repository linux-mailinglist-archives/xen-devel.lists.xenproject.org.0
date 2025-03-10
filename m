Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B39A58C39
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905951.1313413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqp-00015q-T9; Mon, 10 Mar 2025 06:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905951.1313413; Mon, 10 Mar 2025 06:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqp-000148-JM; Mon, 10 Mar 2025 06:42:59 +0000
Received: by outflank-mailman (input) for mailman id 905951;
 Mon, 10 Mar 2025 04:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVE7-00070S-Eq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:58:55 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c24e916-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:52 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2232aead377so1096105ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:52 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:50 -0700 (PDT)
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
X-Inumbo-ID: 5c24e916-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582731; x=1742187531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JZyw573LWlQgbC9bGnVcpJUmDARxtxiYGI4BMcj5vE=;
        b=f8A9xZQlQU9RBP+FJb9Jr9zPxlerCWiByInKxltateVQL7tJ02kSkGbHRn2YrveZun
         VS9MefhHxwbiDqPsSBMhoFmecoI/HBwSNtDQPsjvzMt960Tf4Z9DozX8UoWgyVhkWHJj
         1dQFVeCPc5eURe5gsANGiAQ9GTmzFjIsoaIe2CNASjc4tJJbPu4zYLh5m3Z87BoXok+5
         jWocmSWJaQfZ1OC5iWv967cSmfSQ6GwAhyCmQx9bzdqyNLOj9hioewY2FN37N8mf/aTt
         PrHvf+yMRhQtb94DTisBhkSNgPnFgCBoujTh8JvE152xfZKK/BKV+AkY+w07V+uUqBAJ
         9bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582731; x=1742187531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JZyw573LWlQgbC9bGnVcpJUmDARxtxiYGI4BMcj5vE=;
        b=nwolCvLPpGAmCueH8wpsemu4d/u8wOVKb1Q6Py3wua17x+xFF9mND/2H3oE8X04aAi
         rB5/cAHg48DOA+6W/dJJwNrk+9phMecR+WZtYuAeaizGEU8GHe4pp6uo/GBI564gfRCW
         0D8T7AvgCLqFAewStENWfu8ltA+6qGffSboFVYyk45zdTJaB5H1N0zEWroEL8t7vTO2u
         hNIV3EU/ms5Ml+xW0wEz19r5d1EkAJi6xSrgSyvzjgldhqxf+oi1VuWpwN4cU3dSwtH9
         8YKsrXVQXraiVDHFIWLWRsLAruFkiaDgb8FWn/u8cJhBSUTN2GVdAha9LQxUziiLFnVn
         K2YA==
X-Forwarded-Encrypted: i=1; AJvYcCX5zOB5qJyTKPqFPIREvYH4VOSYvKDVCyqGgptmTUYLQ8PQL652vJgmwvG7ZiOLQXPCSABM7gtW4l8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwV2xCzi1Sr2MuTmv0qFlrrFUls/cw7OitDdqFWMAdj093TfuhF
	GNy4rGrb2ca0cxlz6Ma0P9tWxGa/xKuALk2MDdedPJHPACcTTOqC/aovSlStoDI=
X-Gm-Gg: ASbGncuUPS9yvlg2XlsWVWxeMcSe2wbLpn8C6M05xCyG6mMJGd+I9t/E6FhoknPxQuq
	SEo+2WxRsFet0crFW81GsijNqZIXXyE/VtTSdZLAtdzFiunxtpkDaaU3xXzDMU8xM3kDszcw6wt
	iO02u+P5I69S4g1esKA8r6ADdPVT/DXnoeaOus6j4JC6shqKzvtnEwYYANmFs+VwnidS+BMVfOC
	7Y4MMdAoixML8mmWMdG1NVY5b/Y8uXmIezYfzVW05pIT8bOoBRJbiEaibnk1MQR7lBmmd+3v1XE
	eyRZh8PFVOD+AbzYv2dBpQMTQqt2iwys2L2RrFYEfYGp
X-Google-Smtp-Source: AGHT+IHsrTctZA7T98GoAjZcAG6E707cPIOSM6QcsZhsVvq9UPUg2kUQ9eJxgIpK7zPxh80fLwzPDw==
X-Received: by 2002:a17:902:f644:b0:224:76f:9e45 with SMTP id d9443c01a7336-22428a8c6femr219904905ad.21.1741582731096;
        Sun, 09 Mar 2025 21:58:51 -0700 (PDT)
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
Subject: [PATCH 01/16] exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
Date: Sun,  9 Mar 2025 21:58:27 -0700
Message-Id: <20250310045842.2650784-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h         | 12 ------------
 include/exec/memory_ldst.h.inc | 13 +++++--------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 8cd6c00cf89..17ea82518a0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -69,18 +69,6 @@
 
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
index 92ad74e9560..74519a88de0 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -19,7 +19,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef TARGET_ENDIANNESS
+uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
@@ -28,15 +29,15 @@ uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+void glue(address_space_stb, SUFFIX)(ARG1_DECL,
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stw, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
-#else
-uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
+
 uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
@@ -49,8 +50,6 @@ uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
@@ -63,9 +62,7 @@ void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
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


