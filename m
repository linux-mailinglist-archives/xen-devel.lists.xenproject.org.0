Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E65E7902
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 13:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410736.653887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgT0-0002ka-0o; Fri, 23 Sep 2022 11:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410736.653887; Fri, 23 Sep 2022 11:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgSz-0002ha-Ta; Fri, 23 Sep 2022 11:03:33 +0000
Received: by outflank-mailman (input) for mailman id 410736;
 Fri, 23 Sep 2022 11:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQMd=Z2=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1obgSy-0001gy-Ro
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 11:03:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5c6eeda0-3b2f-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 13:03:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8D2139F;
 Fri, 23 Sep 2022 04:03:38 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09033F73D;
 Fri, 23 Sep 2022 04:03:30 -0700 (PDT)
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
X-Inumbo-ID: 5c6eeda0-3b2f-11ed-9647-05401a9f4f97
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: fix booting ACPI based system after static evtchn series
Date: Fri, 23 Sep 2022 12:02:18 +0100
Message-Id: <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663928523.git.rahul.singh@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ACPI is enabled and the system booted with ACPI, BUG() is observed
after merging the static event channel series. As there is not DT when
booted with ACPI there will be no chosen node because of that
"BUG_ON(chosen == NULL)" will be hit.

(XEN) Xen BUG at arch/arm/domain_build.c:3578

Move call to alloc_static_evtchn() under acpi_disabled check to fix the
issue.

Fixes: 1fe16b3ed78a (xen/arm: introduce xen-evtchn dom0less property)
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/setup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 61b4f258a0..4395640019 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_offset,
         printk(XENLOG_INFO "Xen dom0less mode detected\n");
 
     if ( acpi_disabled )
+    {
         create_domUs();
-
-    alloc_static_evtchn();
+        alloc_static_evtchn();
+    }
 
     /*
      * This needs to be called **before** heap_init_late() so modules
-- 
2.25.1


