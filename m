Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE83652E6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 09:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113311.215942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVd-0006W8-BO; Tue, 20 Apr 2021 07:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113311.215942; Tue, 20 Apr 2021 07:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVc-0006UO-SX; Tue, 20 Apr 2021 07:09:20 +0000
Received: by outflank-mailman (input) for mailman id 113311;
 Tue, 20 Apr 2021 07:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVa-0006RY-VL
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id da5caf71-00df-4133-af6e-706a268879af;
 Tue, 20 Apr 2021 07:09:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF3F01435;
 Tue, 20 Apr 2021 00:09:17 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E773F85F;
 Tue, 20 Apr 2021 00:09:16 -0700 (PDT)
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
X-Inumbo-ID: da5caf71-00df-4133-af6e-706a268879af
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 9/9] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
Date: Tue, 20 Apr 2021 09:08:53 +0200
Message-Id: <20210420070853.8918-10-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210420070853.8918-1-michal.orzel@arm.com>
References: <20210420070853.8918-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 system registers are 64bit whereas AArch32 ones
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 sysregs have upper 32bit reserved
it does not mean that they can't be widen in the future.

As there are no other places in the code using READ/WRITE_SYSREG32,
remove the helper macros.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/vcpreg.c               | 16 ++++++++++++++++
 xen/include/asm-arm/arm64/sysregs.h |  5 -----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index c7f516ee0a..6cb7f3108c 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -48,6 +48,7 @@
  */
 
 /* The name is passed from the upper macro to workaround macro expansion. */
+#ifdef CONFIG_ARM_32
 #define TVM_REG(sz, func, reg...)                                           \
 static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
 {                                                                           \
@@ -61,6 +62,21 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
                                                                             \
     return true;                                                            \
 }
+#else /* CONFIG_ARM_64 */
+#define TVM_REG(sz, func, reg...)                                           \
+static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
+{                                                                           \
+    struct vcpu *v = current;                                               \
+    bool cache_enabled = vcpu_has_cache_enabled(v);                         \
+                                                                            \
+    GUEST_BUG_ON(read);                                                     \
+    WRITE_SYSREG(*r, reg);                                                  \
+                                                                            \
+    p2m_toggle_cache(v, cache_enabled);                                     \
+                                                                            \
+    return true;                                                            \
+}
+#endif
 
 #define TVM_REG32(regname, xreg) TVM_REG(32, vreg_emulate_##regname, xreg)
 #define TVM_REG64(regname, xreg) TVM_REG(64, vreg_emulate_##regname, xreg)
diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
index 077fd95fb7..83a1157ac4 100644
--- a/xen/include/asm-arm/arm64/sysregs.h
+++ b/xen/include/asm-arm/arm64/sysregs.h
@@ -86,11 +86,6 @@
 #endif
 
 /* Access to system registers */
-
-#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
-
-#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
-
 #define WRITE_SYSREG64(v, name) do {                    \
     uint64_t _r = v;                                    \
     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
-- 
2.29.0


