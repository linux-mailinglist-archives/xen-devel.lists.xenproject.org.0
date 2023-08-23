Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFB786131
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589512.921455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8d-0004eA-Vb; Wed, 23 Aug 2023 20:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589512.921455; Wed, 23 Aug 2023 20:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8d-0004Y5-R7; Wed, 23 Aug 2023 20:07:35 +0000
Received: by outflank-mailman (input) for mailman id 589512;
 Wed, 23 Aug 2023 20:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8c-0004Vf-Tu
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:34 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b209b77c-41f0-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 22:07:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B772182867AA;
 Wed, 23 Aug 2023 15:07:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bA0joZWNG15C; Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A3E95828673D;
 Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zdPqsOnk9JTT; Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3BF4F8285AAD;
 Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
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
X-Inumbo-ID: b209b77c-41f0-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A3E95828673D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821251; bh=9nVzFL8mf98lW8LMjk2/1F+wWeQACbM53mGneF01BrE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vf4FuqWQv59VlnJBhvvYQra6ycKaFSkoZ3LdMjp0DuwanfGhKDTtUNRoHKjmwcYGt
	 3qqarE4Te+s9TDwmjGqiJAO84oWoADx/SsMdvr68QfRlcqXnmzlh+kULp9/HRTKmQ7
	 osNf3Yu307zYQuhJ9GrnOaOHn/8xY/Bbu0oNL8fE=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/8] xen/ppc: Add public/arch-ppc.h
Date: Wed, 23 Aug 2023 15:07:13 -0500
Message-Id: <85bc5f57ad41a54f84ac9fa118ff0d9e02b71461.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692816595.git.sanastasio@raptorengineering.com>
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2:
  - Drop full license text in favor of SPDX header
  - Fix include guard naming (s/PPC64/PPC/g)
  - Use __aligned__ instead of aligned keyword
  - Fix macro naming conventions (use trailing underscore)
  - Drop unused MEMORY_PADDING, TRAP_INSTR definitions
  - Drop XENCOMM_INLINE_FLAG definition
  - Fix vcpu_guest_core_regs comment styling and spelling
  - Drop trailing comment at bottom of file

 xen/include/public/arch-ppc.h | 110 ++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 xen/include/public/arch-ppc.h

diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.=
h
new file mode 100644
index 0000000000..b7864b67ef
--- /dev/null
+++ b/xen/include/public/arch-ppc.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) IBM Corp. 2005, 2006
+ * Copyright (C) Raptor Engineering, LLC 2023
+ *
+ * Authors: Hollis Blanchard <hollisb@us.ibm.com>
+ *          Timothy Pearson <tpearson@raptorengineering.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_PPC_H__
+#define __XEN_PUBLIC_ARCH_PPC_H__
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
+#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
+    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
+    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
+#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, =
name)
+#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
+#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
+#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
+#define set_xen_guest_handle_raw(hnd, val)                  \
+    do {                                                    \
+        __typeof__(&(hnd)) sxghr_tmp_ =3D &(hnd);             \
+        sxghr_tmp_->q =3D 0;                                  \
+        sxghr_tmp_->p =3D (val);                                \
+    } while ( 0 )
+#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val=
)
+
+#ifdef __XEN_TOOLS__
+#define get_xen_guest_handle(val, hnd)  do { val =3D (hnd).p; } while (0=
)
+#endif
+
+typedef uint64_t xen_pfn_t;
+#define PRI_xen_pfn PRIx64
+#define PRIu_xen_pfn PRIu64
+
+/*
+ * Maximum number of virtual CPUs in legacy multi-processor guests.
+ * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
+ */
+#define XEN_LEGACY_MAX_VCPUS 1
+
+typedef uint64_t xen_ulong_t;
+#define PRI_xen_ulong PRIx64
+#endif
+
+#ifndef __ASSEMBLY__
+
+typedef uint64_t xen_ulong_t;
+
+/*
+ * User-accessible registers: most of these need to be saved/restored
+ * for every nested Xen invocation.
+ */
+struct vcpu_guest_core_regs
+{
+    uint64_t gprs[32];
+    uint64_t lr;
+    uint64_t ctr;
+    uint64_t srr0;
+    uint64_t srr1;
+    uint64_t pc;
+    uint64_t msr;
+    uint64_t fpscr;             /* XXX Is this necessary */
+    uint64_t xer;
+    uint64_t hid4;              /* debug only */
+    uint64_t dar;               /* debug only */
+    uint32_t dsisr;             /* debug only */
+    uint32_t cr;
+    uint32_t __pad;             /* good spot for another 32bit reg */
+    uint32_t entry_vector;
+};
+typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
+
+typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */ /* XXX timebase =
*/
+
+/* ONLY used to communicate with dom0! See also struct exec_domain. */
+struct vcpu_guest_context {
+    vcpu_guest_core_regs_t user_regs;         /* User-level CPU register=
s     */
+    uint64_t sdr1;                     /* Pagetable base               *=
/
+    /* XXX etc */
+};
+typedef struct vcpu_guest_context vcpu_guest_context_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
+
+struct arch_shared_info {
+    uint64_t boot_timebase;
+};
+
+struct arch_vcpu_info {
+};
+
+struct xen_arch_domainconfig {
+};
+
+typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+
+#endif
+
+#endif /* __XEN_PUBLIC_ARCH_PPC_H__ */
--
2.30.2


