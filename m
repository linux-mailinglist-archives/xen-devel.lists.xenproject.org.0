Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290436C1D1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118158.224205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8s-0007Aa-R7; Tue, 27 Apr 2021 09:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118158.224205; Tue, 27 Apr 2021 09:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8s-0007A2-N7; Tue, 27 Apr 2021 09:36:30 +0000
Received: by outflank-mailman (input) for mailman id 118158;
 Tue, 27 Apr 2021 09:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbK8q-00078W-Th
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:36:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a2e6f0ca-dac9-499f-b95e-afb98979a864;
 Tue, 27 Apr 2021 09:36:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84C9BD6E;
 Tue, 27 Apr 2021 02:36:27 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03933F694;
 Tue, 27 Apr 2021 02:36:18 -0700 (PDT)
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
X-Inumbo-ID: a2e6f0ca-dac9-499f-b95e-afb98979a864
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 08/10] arm/page: Get rid of READ/WRITE_SYSREG32
Date: Tue, 27 Apr 2021 11:35:44 +0200
Message-Id: <20210427093546.30703-9-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210427093546.30703-1-michal.orzel@arm.com>
References: <20210427093546.30703-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 registers are 64bit whereas AArch32 registers
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 registers have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify accesses to CTR_EL0 to use READ/WRITE_SYSREG.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/page.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
index 131507a517..c6f9fb0d4e 100644
--- a/xen/include/asm-arm/page.h
+++ b/xen/include/asm-arm/page.h
@@ -137,10 +137,10 @@ extern size_t dcache_line_bytes;
 
 static inline size_t read_dcache_line_bytes(void)
 {
-    uint32_t ctr;
+    register_t ctr;
 
     /* Read CTR */
-    ctr = READ_SYSREG32(CTR_EL0);
+    ctr = READ_SYSREG(CTR_EL0);
 
     /* Bits 16-19 are the log2 number of words in the cacheline. */
     return (size_t) (4 << ((ctr >> 16) & 0xf));
-- 
2.29.0


