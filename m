Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80231545F3A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345958.571688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza60-0001bF-Pq; Fri, 10 Jun 2022 08:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345958.571688; Fri, 10 Jun 2022 08:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza60-0001Z7-MW; Fri, 10 Jun 2022 08:34:20 +0000
Received: by outflank-mailman (input) for mailman id 345958;
 Fri, 10 Jun 2022 08:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nza5z-0001Ib-5j
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:34:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1dee1c74-e898-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:34:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6B41576;
 Fri, 10 Jun 2022 01:34:17 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B28C03F73B;
 Fri, 10 Jun 2022 01:34:15 -0700 (PDT)
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
X-Inumbo-ID: 1dee1c74-e898-11ec-bd2c-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: traps: Fix reference to invalid erratum ID
Date: Fri, 10 Jun 2022 10:33:56 +0200
Message-Id: <20220610083358.101412-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610083358.101412-1-michal.orzel@arm.com>
References: <20220610083358.101412-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The correct erratum ID should be 834220.

Fixes: 0a7ba2936457 ("xen/arm: arm64: Add Cortex-A57 erratum 834220 workaround")
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 43f30747cf..e989e742fd 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1856,7 +1856,7 @@ static inline bool hpfar_is_valid(bool s1ptw, uint8_t fsc)
      *  1. the stage 2 fault happen during a stage 1 page table walk
      *  (the bit ESR_EL2.S1PTW is set)
      *  2. the fault was due to a translation fault and the processor
-     *  does not carry erratum #8342220
+     *  does not carry erratum #834220
      *
      * Note that technically HPFAR is valid for other cases, but they
      * are currently not supported by Xen.
-- 
2.25.1


