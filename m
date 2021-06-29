Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314413B76ED
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 19:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148063.273514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHFS-0005SJ-18; Tue, 29 Jun 2021 17:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148063.273514; Tue, 29 Jun 2021 17:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyHFR-0005Po-Rh; Tue, 29 Jun 2021 17:10:09 +0000
Received: by outflank-mailman (input) for mailman id 148063;
 Tue, 29 Jun 2021 17:10:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrVS=LX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lyHFQ-0003oo-2Y
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 17:10:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 51d1fbfe-0e80-4af1-b3da-52a946aa9230;
 Tue, 29 Jun 2021 17:10:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE8FA11D4;
 Tue, 29 Jun 2021 10:09:59 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39D353F694;
 Tue, 29 Jun 2021 10:09:59 -0700 (PDT)
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
X-Inumbo-ID: 51d1fbfe-0e80-4af1-b3da-52a946aa9230
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 4/4] xen/arm: Use sanitize values for p2m
Date: Tue, 29 Jun 2021 18:08:56 +0100
Message-Id: <9ef2c92f4f749bce4cabad34fefe2d886b1deffe.1624974370.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624974370.git.bertrand.marquis@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1624974370.git.bertrand.marquis@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>

Replace the code in p2m trying to find a sane value for the VMID size
supported and the PAR to use. We are now using the boot cpuinfo as the
values there are sanitized during boot and the value for those
parameters is now the safest possible value on the system.

On arm32, the system will panic if there are different types of core so
those checks were not needed anyway.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/p2m.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d414c4feb9..2536a86a13 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2030,31 +2030,21 @@ void __init setup_virt_paging(void)
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
+    if ( pa_range_info[boot_cpu_data.mm64.pa_range].pabits < p2m_ipa_bits )
+        p2m_ipa_bits = pa_range_info[boot_cpu_data.mm64.pa_range].pabits;
 
     /*
-     * If the flag is not set then it means all CPUs support 16-bit
-     * VMIDs.
+     * cpu info sanitization made sure we support 16bits VMID only if all
+     * cores are supporting it.
      */
-    if ( !vmid_8_bit )
+    if ( boot_cpu_data.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
-- 
2.17.1


