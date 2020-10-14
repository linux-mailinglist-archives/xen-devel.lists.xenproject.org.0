Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD728DE42
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6519.17378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSdfS-0000Sg-Qr; Wed, 14 Oct 2020 10:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6519.17378; Wed, 14 Oct 2020 10:05:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSdfS-0000SK-Nb; Wed, 14 Oct 2020 10:05:58 +0000
Received: by outflank-mailman (input) for mailman id 6519;
 Wed, 14 Oct 2020 10:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlF3=DV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kSdfQ-0000SF-Bh
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:05:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 15fefb76-0b92-48dc-a36a-97eb20914a5c;
 Wed, 14 Oct 2020 10:05:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F7B30E;
 Wed, 14 Oct 2020 03:05:53 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.15.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7773F73C;
 Wed, 14 Oct 2020 03:05:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PlF3=DV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
	id 1kSdfQ-0000SF-Bh
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:05:56 +0000
X-Inumbo-ID: 15fefb76-0b92-48dc-a36a-97eb20914a5c
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 15fefb76-0b92-48dc-a36a-97eb20914a5c;
	Wed, 14 Oct 2020 10:05:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F7B30E;
	Wed, 14 Oct 2020 03:05:53 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.15.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7773F73C;
	Wed, 14 Oct 2020 03:05:52 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm: Document the erratum #853709 related to Cortex A72
Date: Wed, 14 Oct 2020 12:05:41 +0200
Message-Id: <20201014100541.11687-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workaround for Cortex-A57 erratum #852523 is already
in Xen but Cortex-A72 erratum #853709 is not although
it applies to the same issue.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 docs/misc/arm/silicon-errata.txt | 1 +
 xen/arch/arm/domain.c            | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index e15d0923e9..1f18a9df58 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -50,6 +50,7 @@ stable hypervisors.
 | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_834220    |
 | ARM            | Cortex-A57      | #1319537        | N/A                     |
 | ARM            | Cortex-A72      | #1319367        | N/A                     |
+| ARM            | Cortex-A72      | #853709         | N/A                     |
 | ARM            | Cortex-A76      | #1165522        | N/A                     |
 | ARM            | Neoverse-N1     | #1165522        | N/A
 | ARM            | MMU-500         | #842869         | N/A                     |
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3b37f899b9..18cafcdda7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -216,7 +216,8 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
 
     /*
-     * Erratum #852523: DACR32_EL2 must be restored before one of the
+     * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
+     * DACR32_EL2 must be restored before one of the
      * following sysregs: SCTLR_EL1, TCR_EL1, TTBR0_EL1, TTBR1_EL1 or
      * CONTEXTIDR_EL1.
      */
@@ -245,7 +246,8 @@ static void ctxt_switch_to(struct vcpu *n)
 
     /*
      * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
-     * #852523. I.e DACR32_EL2 is not correctly synchronized.
+     * #852523 (Cortex-A57) or #853709 (Cortex-A72).
+     * I.e DACR32_EL2 is not correctly synchronized.
      */
     WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
     WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
-- 
2.28.0


