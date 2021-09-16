Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E040D330
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188031.337120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkrM-00047L-1n; Thu, 16 Sep 2021 06:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188031.337120; Thu, 16 Sep 2021 06:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQkrL-000456-U3; Thu, 16 Sep 2021 06:26:59 +0000
Received: by outflank-mailman (input) for mailman id 188031;
 Thu, 16 Sep 2021 06:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8py=OG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mQkrK-0002iA-50
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:26:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8d67f46b-a11a-442c-ad85-6366e62b5814;
 Thu, 16 Sep 2021 06:26:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 596711042;
 Wed, 15 Sep 2021 23:26:49 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A72E23F59C;
 Wed, 15 Sep 2021 23:26:48 -0700 (PDT)
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
X-Inumbo-ID: 8d67f46b-a11a-442c-ad85-6366e62b5814
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 5/7] xen/arm: Use sanitize values for p2m
Date: Thu, 16 Sep 2021 07:25:38 +0100
Message-Id: <927ce40a9a5d3c56e207275e0b4147840017acc9.1631772970.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1631772970.git.bertrand.marquis@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>

Replace the code in p2m trying to find a sane value for the VMID size
supported and the PAR to use. We are now using the boot cpuinfo as the
values there are sanitized during boot and the value for those
parameters is now the safest possible value on the system.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4: none
Changes in v3: drop arm32 mention in commmit message
Changes in v2:
 - use system_cpuinfo
---
 xen/arch/arm/p2m.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 6e01e83967..8b20b43077 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2042,31 +2042,21 @@ void __init setup_virt_paging(void)
         [7] = { 0 }  /* Invalid */
     };
 
-    unsigned int i, cpu;
+    unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
-    bool vmid_8_bit = false;
-
-    for_each_online_cpu ( cpu )
-    {
-        const struct cpuinfo_arm *info = &cpu_data[cpu];
 
-        /*
-         * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
-         * with IPA bits == PA bits, compare against "pabits".
-         */
-        if ( pa_range_info[info->mm64.pa_range].pabits < p2m_ipa_bits )
-            p2m_ipa_bits = pa_range_info[info->mm64.pa_range].pabits;
-
-        /* Set a flag if the current cpu does not support 16 bit VMIDs. */
-        if ( info->mm64.vmid_bits != MM64_VMID_16_BITS_SUPPORT )
-            vmid_8_bit = true;
-    }
+    /*
+     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
+     * with IPA bits == PA bits, compare against "pabits".
+     */
+    if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < p2m_ipa_bits )
+        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
 
     /*
-     * If the flag is not set then it means all CPUs support 16-bit
-     * VMIDs.
+     * cpu info sanitization made sure we support 16bits VMID only if all
+     * cores are supporting it.
      */
-    if ( !vmid_8_bit )
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
-- 
2.17.1


