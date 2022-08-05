Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548D58AB50
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 15:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381227.615821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx3n-0003ve-Hi; Fri, 05 Aug 2022 13:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381227.615821; Fri, 05 Aug 2022 13:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx3n-0003ts-Ep; Fri, 05 Aug 2022 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 381227;
 Fri, 05 Aug 2022 13:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LiuH=YJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1oJx3m-0003tk-0K
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 13:08:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a88ede06-14bf-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 15:08:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29B9C106F;
 Fri,  5 Aug 2022 06:08:12 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAAA3F73B;
 Fri,  5 Aug 2022 06:08:10 -0700 (PDT)
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
X-Inumbo-ID: a88ede06-14bf-11ed-924f-1f966e50362f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/domain: fix comment for arch_set_info_guest
Date: Fri,  5 Aug 2022 14:08:00 +0100
Message-Id: <20220805130800.16387-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The function arch_set_info_guest is not reached anymore through
VCPUOP_initialise on arm, update the comment.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
 - rephrased comment to not list caller functions (Julien)
---
 xen/arch/arm/domain.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2cd481979cf1..9db8a37a089c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -885,9 +885,8 @@ static int is_guest_pv64_psr(uint64_t psr)
 #endif
 
 /*
- * Initialise VCPU state. The context can be supplied by either the
- * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
- * (VCPUOP_initialise) and therefore must be properly validated.
+ * Initialise vCPU state. The context may be supplied by an external entity, so
+ * we need to validate it
  */
 int arch_set_info_guest(
     struct vcpu *v, vcpu_guest_context_u c)
-- 
2.17.1


