Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C715A77DE6F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584320.914893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdU-0003kg-1k; Wed, 16 Aug 2023 10:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584320.914893; Wed, 16 Aug 2023 10:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdT-0003is-Rb; Wed, 16 Aug 2023 10:20:19 +0000
Received: by outflank-mailman (input) for mailman id 584320;
 Wed, 16 Aug 2023 10:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdS-0003RA-EG
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:18 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9c0269-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:16 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3197b461bb5so2202889f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:16 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:15 -0700 (PDT)
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
X-Inumbo-ID: 7e9c0269-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181216; x=1692786016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NysU7SmZrC+vazQd+jdKnaJN8KaQN9ypnVKlA+c/VV0=;
        b=U8EpPegJCcVGR4gXJjwPRsFx63iXBYCEuAyZeNU8rYrSLHoesWTM4JL/8Ui4BtdlpA
         IR8sIQuMXT9SdEGOfAuy1XVvwhZwRaVrBh7GMVi33U5axDsj+eFo5vmPlGIWu6ouDj1X
         cTZf6wzijh+z0KnENEDNaeg4IgQwCKGyaYnX9zdMdGkQfEgy3sS5wQcSGXOZaZQ1UqR7
         dC+kULcmYFunNCdjVK4IiFRFwgf3yluKiDvQo9Ja8EgBc5O4cI7HN3fOQieBNACfdOQ+
         xJqurbm6VMc90ITlKaippXbva0o2qFCTNbhZN+NgMKNks6p+pra/6ThbGUMtlbXFkrvB
         fJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181216; x=1692786016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NysU7SmZrC+vazQd+jdKnaJN8KaQN9ypnVKlA+c/VV0=;
        b=WDQOMWzo4co4JGAxXlATtY02z19kj4ngJNjBYwFH6FSS3n2BeT4PB/x7XEfqPsjzSV
         ybX2Qh8WG87VjD0zAl7brtEJWZVTZzn2J6e8lKDUBOeuhDE3MpVk4JAPPc8wviwfigni
         knSGQigS4Y92QqPigNvFQsK7p14Uv4x+Og+L5lY9s5uh6arszhlxv5su1vvxTGykHgzo
         JN9pUTtp4MHsSYatecTmcGS9Hn9oZvBFMbwFHOw3Z0S8lGPYEum1la7GOLbGN/CxfIfb
         yq12JwObCSrxg/yBPZRahVolokJOomw8TFezyZfachAXcGnj+TRzBhhI+kQeHT94+aQ/
         P7oA==
X-Gm-Message-State: AOJu0YwLkdQO0/OR+aYRnJ/vLy5aDMu/o0R9pgq13SVE9ffimT2uRfTv
	DuYDrDT8+uSYil+WJcCo/hU02lSvM4yxNB2m
X-Google-Smtp-Source: AGHT+IGJlA93jd2q7npNEAlGI7KhkAPGvjmV+GWSnUAisGSQsL/8q19IE52XthKfaGWSAAKnR5MENw==
X-Received: by 2002:adf:f18a:0:b0:319:6ce2:cbcb with SMTP id h10-20020adff18a000000b003196ce2cbcbmr1036769wro.29.1692181215936;
        Wed, 16 Aug 2023 03:20:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 02/57] xen/riscv: add public arch-riscv.h
Date: Wed, 16 Aug 2023 13:19:12 +0300
Message-ID: <d9721f72f4a51b1240ba180e33193c551b987251.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/public/arch-riscv.h | 90 +++++++++++++++++++++++++++++++++
 xen/include/public/xen.h        |  2 +
 2 files changed, 92 insertions(+)
 create mode 100644 xen/include/public/arch-riscv.h

diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
new file mode 100644
index 0000000000..05f2c67f49
--- /dev/null
+++ b/xen/include/public/arch-riscv.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Guest OS interface to RISC-V Xen.
+ * Initially based on the ARM implementation.
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
+#define __XEN_PUBLIC_ARCH_RISCV_H__
+
+#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
+#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
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
+ * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
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
+        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
+        _sxghr_tmp->q = 0;                                  \
+        _sxghr_tmp->p = (val);                              \
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
+struct arch_vcpu_info {
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+struct arch_shared_info {
+};
+typedef struct arch_shared_info arch_shared_info_t;
+
+/* Maximum number of virtual CPUs in legacy multi-processor guests. */
+/* Only one. All other VCPUS must use VCPUOP_register_vcpu_info */
+#define XEN_LEGACY_MAX_VCPUS 1
+
+#endif /* __ASSEMBLY__ */
+
+#ifndef __ASSEMBLY__
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
index 920567e006..8a07032796 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -16,6 +16,8 @@
 #include "arch-x86/xen.h"
 #elif defined(__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined(__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.41.0


