Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B85800ED
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 16:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374639.606757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzM7-00023Z-OR; Mon, 25 Jul 2022 14:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374639.606757; Mon, 25 Jul 2022 14:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzM7-00020e-LF; Mon, 25 Jul 2022 14:46:47 +0000
Received: by outflank-mailman (input) for mailman id 374639;
 Mon, 25 Jul 2022 14:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFkY=X6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1oFzM5-00020K-Vv
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 14:46:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9996d8ad-0c28-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 16:46:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8482C2B;
 Mon, 25 Jul 2022 07:46:43 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13B053F73D;
 Mon, 25 Jul 2022 07:46:41 -0700 (PDT)
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
X-Inumbo-ID: 9996d8ad-0c28-11ed-bd2d-47488cf2e6aa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/domain: fix comment for arch_set_info_guest
Date: Mon, 25 Jul 2022 15:46:34 +0100
Message-Id: <20220725144634.8086-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The function arch_set_info_guest is not reached anymore through
VCPUOP_initialise on arm, update the comment.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2f8eaab7b56b..6451cd013c1a 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -882,9 +882,9 @@ static int is_guest_pv64_psr(uint64_t psr)
 #endif
 
 /*
- * Initialise VCPU state. The context can be supplied by either the
- * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
- * (VCPUOP_initialise) and therefore must be properly validated.
+ * Initialise VCPU state. The context can be supplied by the toolstack
+ * (XEN_DOMCTL_setvcpucontext) and therefore must be properly validated,
+ * or by PSCI call (PSCI_cpu_on) handled by vpsci module.
  */
 int arch_set_info_guest(
     struct vcpu *v, vcpu_guest_context_u c)
-- 
2.17.1


