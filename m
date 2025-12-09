Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7DCAFA97
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181388.1504443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv6d-00025O-Pg; Tue, 09 Dec 2025 10:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181388.1504443; Tue, 09 Dec 2025 10:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv6d-00022B-MA; Tue, 09 Dec 2025 10:38:07 +0000
Received: by outflank-mailman (input) for mailman id 1181388;
 Tue, 09 Dec 2025 10:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rha=6P=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vSv6c-000225-AR
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:38:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2400a3d9-d4eb-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 11:38:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE4C71691;
 Tue,  9 Dec 2025 02:37:55 -0800 (PST)
Received: from C3HXLD123V.emea.arm.com (unknown [10.1.35.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7373F740;
 Tue,  9 Dec 2025 02:38:02 -0800 (PST)
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
X-Inumbo-ID: 2400a3d9-d4eb-11f0-9cce-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Date: Tue,  9 Dec 2025 10:37:55 +0000
Message-ID: <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force ThumbEE support to not available in the version of the PFR0
register value we present to guest.
Xen does not support ThumbEE and will trap all access to ThumbEE
registers so do not report it being supported if the hardware supports
it.

Fixes: 5bbe1fe413f9 ("ARM: Drop ThumbEE support")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1a80738571e3..4cde208e721a 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -225,6 +225,7 @@ static int __init create_domain_cpuinfo(void)
 #ifdef CONFIG_ARM_64
     domain_cpuinfo.pfr64.amu = 0;
 #endif
+    domain_cpuinfo.pfr32.thumbee = 0;
     domain_cpuinfo.pfr32.amu = 0;
 
     /* Hide RAS support as Xen does not support it */
-- 
2.51.2


