Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9B3A39786
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 10:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891192.1300261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKGX-0003aC-BR; Tue, 18 Feb 2025 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891192.1300261; Tue, 18 Feb 2025 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKGX-0003XA-7v; Tue, 18 Feb 2025 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 891192;
 Tue, 18 Feb 2025 09:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q2U=VJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tkKGW-0003Wq-4d
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 09:51:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f542b6bc-eddd-11ef-9aa6-95dc52dad729;
 Tue, 18 Feb 2025 10:51:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B1F25E0;
 Tue, 18 Feb 2025 01:52:01 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FD8C3F6A8;
 Tue, 18 Feb 2025 01:51:41 -0800 (PST)
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
X-Inumbo-ID: f542b6bc-eddd-11ef-9aa6-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC coloring
Date: Tue, 18 Feb 2025 09:51:30 +0000
Message-Id: <20250218095130.2666580-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218095130.2666580-1-luca.fancellu@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLC coloring can be used only on MMU system, move the code
that selects it from ARM_64 to MMU and add the ARM_64
dependency.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - Dropped comment on top of boot_fdt_info()

v2 changes:
 - dropped part of the v1 code, now this one is simpler, I will
   discuss better how to design a common boot flow for MPU and
   implement on another patch.

---
---
 xen/arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827c..ffdff1f0a36c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,7 +8,6 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
-	select HAS_LLC_COLORING if !NUMA
 
 config ARM
 	def_bool y
@@ -76,6 +75,7 @@ choice
 
 config MMU
 	bool "MMU"
+	select HAS_LLC_COLORING if !NUMA && ARM_64
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
-- 
2.34.1


