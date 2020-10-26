Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDD299238
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12430.32369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5GH-00062x-Uv; Mon, 26 Oct 2020 16:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12430.32369; Mon, 26 Oct 2020 16:22:21 +0000
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
	id 1kX5GH-00062Y-Rp; Mon, 26 Oct 2020 16:22:21 +0000
Received: by outflank-mailman (input) for mailman id 12430;
 Mon, 26 Oct 2020 16:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kX5GF-00062L-PW
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:19 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 99e5f00d-760e-4ee2-b636-b0d79a51e480;
 Mon, 26 Oct 2020 16:22:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E33C1042;
 Mon, 26 Oct 2020 09:22:18 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9023F719;
 Mon, 26 Oct 2020 09:22:17 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kX5GF-00062L-PW
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:19 +0000
X-Inumbo-ID: 99e5f00d-760e-4ee2-b636-b0d79a51e480
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 99e5f00d-760e-4ee2-b636-b0d79a51e480;
	Mon, 26 Oct 2020 16:22:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E33C1042;
	Mon, 26 Oct 2020 09:22:18 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9023F719;
	Mon, 26 Oct 2020 09:22:17 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] xen/arm: use printk_once for errata warning prints
Date: Mon, 26 Oct 2020 16:21:31 +0000
Message-Id: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603728729.git.bertrand.marquis@arm.com>
References: <cover.1603728729.git.bertrand.marquis@arm.com>

Replace usage of warning_add by printk_once with a **** prefix and
suffix for errata related warnings.

This prevents the need for the assert which is not secure enough to
protect this print against wrong usage.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpuerrata.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 0c63dfa779..0430069a84 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -157,7 +157,6 @@ extern char __smccc_workaround_1_smc_start[], __smccc_workaround_1_smc_end[];
 static int enable_smccc_arch_workaround_1(void *data)
 {
     struct arm_smccc_res res;
-    static bool warned = false;
     const struct arm_cpu_capabilities *entry = data;
 
     /*
@@ -182,13 +181,8 @@ static int enable_smccc_arch_workaround_1(void *data)
                                      "call ARM_SMCCC_ARCH_WORKAROUND_1");
 
 warn:
-    if ( !warned )
-    {
-        ASSERT(system_state < SYS_STATE_active);
-        warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
-                    "Please update your firmware.\n");
-        warned = true;
-    }
+    printk_once("**** No support for ARM_SMCCC_ARCH_WORKAROUND_1. ****\n"
+                "**** Please update your firmware.                ****\n");
 
     return 0;
 }
-- 
2.17.1


