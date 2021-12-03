Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F000467463
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237244.411444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5L5-0002FO-L2; Fri, 03 Dec 2021 09:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237244.411444; Fri, 03 Dec 2021 09:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5L5-0002CD-H3; Fri, 03 Dec 2021 09:58:47 +0000
Received: by outflank-mailman (input) for mailman id 237244;
 Fri, 03 Dec 2021 09:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek4d=QU=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mt5L4-0002C7-7E
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:58:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 99496710-541f-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 10:58:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC931435;
 Fri,  3 Dec 2021 01:58:43 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.0.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ABEA3F5A1;
 Fri,  3 Dec 2021 01:58:42 -0800 (PST)
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
X-Inumbo-ID: 99496710-541f-11ec-b1df-f38ee3fbfdf7
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] arm/vgic: Fix reference to a non-existing function
Date: Fri,  3 Dec 2021 10:58:37 +0100
Message-Id: <20211203095837.20394-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
(xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
forgot to modify a comment about lr_pending list,
referring to a function that has been renamed.
Fix that.

Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/asm-arm/vgic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index e69a59063a..ade427a808 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -195,7 +195,7 @@ struct vgic_cpu {
      * corresponding LR it is also removed from this list. */
     struct list_head inflight_irqs;
     /* lr_pending is used to queue IRQs (struct pending_irq) that the
-     * vgic tried to inject in the guest (calling gic_set_guest_irq) but
+     * vgic tried to inject in the guest (calling gic_raise_guest_irq) but
      * no LRs were available at the time.
      * As soon as an LR is freed we remove the first IRQ from this
      * list and write it to the LR register.
-- 
2.29.0


