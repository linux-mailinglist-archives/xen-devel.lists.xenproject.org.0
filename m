Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBC7F7170
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640369.998432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSv-0007bd-7z; Fri, 24 Nov 2023 10:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640369.998432; Fri, 24 Nov 2023 10:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSv-0007U6-3i; Fri, 24 Nov 2023 10:31:17 +0000
Received: by outflank-mailman (input) for mailman id 640369;
 Fri, 24 Nov 2023 10:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSu-0006hx-08
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f58903-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:14 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so246879666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:14 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:13 -0800 (PST)
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
X-Inumbo-ID: 97f58903-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821874; x=1701426674; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=259RAC7XAfk5+EQfsx3xCtMTAgEy8wwM0yRzf9WWoaA=;
        b=aKHNYu/qxkSbDXsxWCCITzvNAJEi4hYcKO61aEpXotfKzf66kI7TPrTqHRSvKKkKL5
         9nyGzs38jGsWwSJs7ptSFXq7LwQIf2bwGDvP61zRgjPtZzeatr0KlifXgR3N9tbd1VYJ
         UgQTytyH3Myf87fFA/tNGARugSib6l0WEZLuJBfxCaOyZ36fsoKZAxgh8gQDKGsErIax
         8NiXYT9rluEX2sEBu+3AGtD6TGa3e7A02G+pZhH+idnV5kbRzC1X1+/MXWelERv/rp8d
         81aaQwmRfoaq3pS8NKoJwVNVgWCS1NcR96opyiNwigskJi0g3lO5lbHgnuIq9/LueV0U
         B92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821874; x=1701426674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=259RAC7XAfk5+EQfsx3xCtMTAgEy8wwM0yRzf9WWoaA=;
        b=jeq/Iy+sQ8rRK20gpaMm2WQ0Rn9zhja2Vt5jyQ+ZQKOc0jvL2w742KRmL1c0JnfgpA
         YuzOwb+GpyF0p5f9UMOKpnnTxuxGHYd9KIN7YFETCcoG1MpJWsR05a9oAmkujQG0VCu0
         4KjYJtatHFOlQWjYcQMPGxzWzs+stdbskwBq1uSjaBz1xKAJJ3Qr947gfTeEqTZ52tEf
         ZiqBFCYUcjFZ2jU9/bMp/TMj4ywnz7zs8FOMf/AWwLMosP/hFNsBd/erL3oYCcfPJvEw
         IPI29zi/rfRMYKrrn+J6f+5d/7YInbhk4kQJ2Lvqt7tK5W1q/M60Namzmgw04k0nHF6g
         4Vgg==
X-Gm-Message-State: AOJu0YzEqBY2wmRkTf3uB4d+vWLVaoPFdeQG7XE5CEAnHHttMdNMO4+B
	x8a2v8gj3OFFUwOHu+WG0S74pimBb93kaQ==
X-Google-Smtp-Source: AGHT+IHA03ZCeUzKsjh22ZiTY+iJkZin+9ClD55pQlGdxOHkJnKYQjRH1t4xFZpOJeqs9pUVqJukZQ==
X-Received: by 2002:a17:906:57ce:b0:a03:8ac8:a1e2 with SMTP id u14-20020a17090657ce00b00a038ac8a1e2mr1671981ejr.31.1700821873709;
        Fri, 24 Nov 2023 02:31:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/39] xen/riscv: add public arch-riscv.h
Date: Fri, 24 Nov 2023 12:30:24 +0200
Message-ID: <fc7bb0a821ce58ef908ed0282b6678d19269ffc1.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - align with arch-arm.h.
---

 xen/include/public/arch-riscv.h | 93 +++++++++++++++++++++++++++++++++
 xen/include/public/xen.h        |  2 +
 2 files changed, 95 insertions(+)
 create mode 100644 xen/include/public/arch-riscv.h

diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
new file mode 100644
index 0000000000..168263b920
--- /dev/null
+++ b/xen/include/public/arch-riscv.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Guest OS interface to RISC-V Xen.
+ * Initially based on the ARM implementation.
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
+#define __XEN_PUBLIC_ARCH_RISCV_H__
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
+#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
+#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
+#endif
+
+#ifndef __ASSEMBLY__
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
+    typedef union { type *p; unsigned long q; }                 \
+        __guest_handle_ ## name;                                \
+    typedef union { type *p; uint64_aligned_t q; }              \
+        __guest_handle_64_ ## name
+
+/*
+ * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
+ * in a struct in memory. On RISCV is always 8 bytes sizes and 8 bytes
+ * aligned.
+ * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
+ * hypercall argument. It is 4 bytes on riscv32 and 8 bytes on riscv64.
+ */
+#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
+    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
+    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
+#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
+#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
+#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
+#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
+#define set_xen_guest_handle_raw(hnd, val)                  \
+    do {                                                    \
+        typeof(&(hnd)) sxghr_tmp_ = &(hnd);                 \
+        sxghr_tmp_->q = 0;                                  \
+        sxghr_tmp_->p = (val);                              \
+    } while ( 0 )
+#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
+
+typedef uint64_t xen_pfn_t;
+#define PRI_xen_pfn PRIx64
+#define PRIu_xen_pfn PRIu64
+
+typedef uint64_t xen_ulong_t;
+#define PRI_xen_ulong PRIx64
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+struct vcpu_guest_context {
+};
+typedef struct vcpu_guest_context vcpu_guest_context_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
+
+struct xen_arch_domainconfig {
+};
+
+#endif
+
+/* TODO:  add a placeholder entry if no real ones surface */
+struct arch_vcpu_info {
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+/* TODO:  add a placeholder entry if no real ones surface */
+struct arch_shared_info {
+};
+typedef struct arch_shared_info arch_shared_info_t;
+
+/*
+ * Maximum number of virtual CPUs in legacy multi-processor guests.
+ * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
+ */
+#define XEN_LEGACY_MAX_VCPUS 1
+
+/* Stub definition of PMU structure */
+typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+#endif
+
+#endif /*  __XEN_PUBLIC_ARCH_RISCV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b812a0a324..b47d48d0e2 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -18,6 +18,8 @@
 #include "arch-arm.h"
 #elif defined(__powerpc64__)
 #include "arch-ppc.h"
+#elif defined(__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.42.0


