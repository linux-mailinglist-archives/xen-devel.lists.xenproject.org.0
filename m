Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE8D3087ED
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77962.141603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RJe-0000Wz-2x; Fri, 29 Jan 2021 10:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77962.141603; Fri, 29 Jan 2021 10:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RJd-0000WZ-Vx; Fri, 29 Jan 2021 10:47:49 +0000
Received: by outflank-mailman (input) for mailman id 77962;
 Fri, 29 Jan 2021 10:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4y6U=HA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l5RJc-0000WS-Cc
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:47:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3a0cefc5-1a33-4e81-8804-f1e72d9f74a2;
 Fri, 29 Jan 2021 10:47:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DDA11424;
 Fri, 29 Jan 2021 02:47:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E2A3F66E;
 Fri, 29 Jan 2021 02:47:44 -0800 (PST)
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
X-Inumbo-ID: 3a0cefc5-1a33-4e81-8804-f1e72d9f74a2
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	julien@xen.org,
	sstabellini@kernel.org,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] xen/arm: smmuv3: Disable the SMMUv3 driver when ACPI is enabled.
Date: Fri, 29 Jan 2021 10:47:33 +0000
Message-Id: <1a228e438f405c376d6fc36e4625c6c09f9d78f3.1611916545.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

SMMUv3 driver does not support ACPI device probe.If APCI is enabled with
SMMUv3 driver compiler will throw an error.

Disable SMMUv3 driver when ACPI is enabled in kconfig to fix compilation
error.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 341ba92b30..82f02f56af 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -15,7 +15,7 @@ config ARM_SMMU
 
 config ARM_SMMU_V3
 	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
-	depends on ARM_64
+	depends on ARM_64 && (!ACPI || BROKEN)
 	---help---
 	 Support for implementations of the ARM System MMU architecture
 	 version 3. Driver is in experimental stage and should not be used in
-- 
2.17.1


