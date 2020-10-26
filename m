Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F829923B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12432.32394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5GM-00068J-Qy; Mon, 26 Oct 2020 16:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12432.32394; Mon, 26 Oct 2020 16:22:26 +0000
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
	id 1kX5GM-00067V-Ml; Mon, 26 Oct 2020 16:22:26 +0000
Received: by outflank-mailman (input) for mailman id 12432;
 Mon, 26 Oct 2020 16:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kX5GK-00062L-OP
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:24 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c1702353-f4d9-4f28-b0c4-315701b71e1f;
 Mon, 26 Oct 2020 16:22:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B34106F;
 Mon, 26 Oct 2020 09:22:21 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DFC23F719;
 Mon, 26 Oct 2020 09:22:20 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kX5GK-00062L-OP
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:24 +0000
X-Inumbo-ID: c1702353-f4d9-4f28-b0c4-315701b71e1f
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id c1702353-f4d9-4f28-b0c4-315701b71e1f;
	Mon, 26 Oct 2020 16:22:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B34106F;
	Mon, 26 Oct 2020 09:22:21 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DFC23F719;
	Mon, 26 Oct 2020 09:22:20 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Date: Mon, 26 Oct 2020 16:21:33 +0000
Message-Id: <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1603728729.git.bertrand.marquis@arm.com>
References: <cover.1603728729.git.bertrand.marquis@arm.com>

When a Cortex A57 processor is affected by CPU errata 832075, a guest
not implementing the workaround for it could deadlock the system.
Add a warning during boot informing the user that only trusted guests
should be executed on the system.
An equivalent warning is already given to the user by KVM on cores
affected by this errata.

Also taint the hypervisor as unsecure when this errata applies and
mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 SUPPORT.md               |  1 +
 xen/arch/arm/cpuerrata.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 5fbe5fc444..f7a3b046b0 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -38,6 +38,7 @@ supported in this document.
 ### ARM v8
 
     Status: Supported
+    Status, Cortex A57 r0p0 - r1p2, not security supported (Errata 832075)
 
 ## Host hardware support
 
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 0430069a84..b35e8cd0b9 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -503,6 +503,19 @@ void check_local_cpu_errata(void)
 void __init enable_errata_workarounds(void)
 {
     enable_cpu_capabilities(arm_errata);
+
+#ifdef CONFIG_ARM64_ERRATUM_832075
+    if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
+    {
+        printk_once("**** This CPU is affected by the errata 832075. ****\n"
+                    "**** Guests without CPU erratum workarounds     ****\n"
+                    "**** can deadlock the system!                   ****\n"
+                    "**** Only trusted guests should be used.        ****\n");
+
+        /* Taint the machine has being insecure */
+        add_taint(TAINT_MACHINE_UNSECURE);
+    }
+#endif
 }
 
 static int cpu_errata_callback(struct notifier_block *nfb,
-- 
2.17.1


