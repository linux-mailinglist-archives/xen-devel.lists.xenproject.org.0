Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B313C239A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153646.283842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1poG-0003ur-3C; Fri, 09 Jul 2021 12:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153646.283842; Fri, 09 Jul 2021 12:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1poF-0003rz-Vw; Fri, 09 Jul 2021 12:40:47 +0000
Received: by outflank-mailman (input) for mailman id 153646;
 Fri, 09 Jul 2021 12:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SDc5=MB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m1poF-0003rt-5W
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:40:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e0c7a59b-e0b2-11eb-85e5-12813bfff9fa;
 Fri, 09 Jul 2021 12:40:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5932AED1;
 Fri,  9 Jul 2021 05:40:45 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB99E3F5A1;
 Fri,  9 Jul 2021 05:40:43 -0700 (PDT)
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
X-Inumbo-ID: e0c7a59b-e0b2-11eb-85e5-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
Date: Fri,  9 Jul 2021 14:40:35 +0200
Message-Id: <20210709124035.5520-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 system registers are 64bit whereas AArch32 ones
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.

The last place in code making use of READ/WRITE_SYSREG32
on arm64 is in TVM_REG macro defining functions vreg_emulate_<register>.
Implement a macro WRITE_SYSREG_SZ which expands as follows:
-on arm64: WRITE_SYSREG
-on arm32: WRITE_SYSREG{32/64}

As there are no other places in the code using these helpers
on arm64 - remove them.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
---
 xen/arch/arm/vcpreg.c               | 12 +++++++++++-
 xen/include/asm-arm/arm64/sysregs.h |  4 ----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index f0cdcc8a54..10c4846954 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -47,6 +47,16 @@
  *
  */
 
+#ifdef CONFIG_ARM_64
+#define WRITE_SYSREG_SZ(sz, val, sysreg)     WRITE_SYSREG(val, sysreg)
+#else
+/*
+ * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
+ * on the below macro to be defined like that as well.
+ */
+#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
+#endif
+
 /* The name is passed from the upper macro to workaround macro expansion. */
 #define TVM_REG(sz, func, reg...)                                           \
 static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
@@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
     bool cache_enabled = vcpu_has_cache_enabled(v);                         \
                                                                             \
     GUEST_BUG_ON(read);                                                     \
-    WRITE_SYSREG##sz(*r, reg);                                              \
+    WRITE_SYSREG_SZ(sz, *r, reg);                                           \
                                                                             \
     p2m_toggle_cache(v, cache_enabled);                                     \
                                                                             \
diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
index 077fd95fb7..795901e1ba 100644
--- a/xen/include/asm-arm/arm64/sysregs.h
+++ b/xen/include/asm-arm/arm64/sysregs.h
@@ -87,10 +87,6 @@
 
 /* Access to system registers */
 
-#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
-
-#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
-
 #define WRITE_SYSREG64(v, name) do {                    \
     uint64_t _r = v;                                    \
     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
-- 
2.29.0


