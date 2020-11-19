Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA12B98F3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31211.61534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQD-0007kf-Df; Thu, 19 Nov 2020 17:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31211.61534; Thu, 19 Nov 2020 17:08:37 +0000
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
	id 1kfnQD-0007jx-8r; Thu, 19 Nov 2020 17:08:37 +0000
Received: by outflank-mailman (input) for mailman id 31211;
 Thu, 19 Nov 2020 17:08:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfnQB-0007iR-Cg
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQB-0000va-04; Thu, 19 Nov 2020 17:08:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQB-0000U1-ML; Thu, 19 Nov 2020 17:08:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQB-0007iR-Cg
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=QAujMV9Xzy7Ut9dM8y6NKak187oQRubSEIiR6ad+wBs=; b=aCJJJb6sjI77v6nqN0uVYCtU1
	50k3k2Qm1ZfPgDgkoeXxmsu/PQ4GmrTTGwy9W2yoOoeAgpU28w2huwx1+bLqexzs5wl2UV6WsY+Kp
	VYmRA7KKUSuy61RcjC0Q6+MXJIi/nTrtOW6RydU8NuBuGVeLIGQZPnx91HG3TIOdKB4x8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQB-0000va-04; Thu, 19 Nov 2020 17:08:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQB-0000U1-ML; Thu, 19 Nov 2020 17:08:35 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/3] xen/arm: gic: acpi: Use the correct length for the GICC structure
Date: Thu, 19 Nov 2020 17:08:28 +0000
Message-Id: <20201119170829.9923-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119170829.9923-1-julien@xen.org>
References: <20201119170829.9923-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

The length of the GICC structure in the MADT ACPI table differs between
version 5.1 and 6.0, although there are no other relevant differences.

Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
overcome this issue.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Update the commit title as we also modify GICv3 code
        - Use the correct length in more places

    Changes in v2:
        - Patch added
---
 xen/arch/arm/acpi/boot.c | 2 +-
 xen/arch/arm/gic-v2.c    | 5 +++--
 xen/arch/arm/gic-v3.c    | 6 +++---
 xen/arch/arm/gic.c       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 30e4bd1bc5a7..55c3e5cbc834 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -131,7 +131,7 @@ acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     acpi_table_print_madt_entry(header);
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 581ea5ba6b2c..b2adc8ec9a64 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1136,7 +1136,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
 
     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
                              header);
-    size = sizeof(struct acpi_madt_generic_interrupt);
+
+    size = ACPI_MADT_GICC_LENGTH;
     /* Add Generic Interrupt */
     for ( i = 0; i < d->max_vcpus; i++ )
     {
@@ -1165,7 +1166,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     /* Read from APIC table and fill up the GIC variables */
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 2a344393a0e4..ac28013c1967 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1499,7 +1499,7 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
 
     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
                              header);
-    size = sizeof(struct acpi_madt_generic_interrupt);
+    size = ACPI_MADT_GICC_LENGTH;
     for ( i = 0; i < d->max_vcpus; i++ )
     {
         gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
@@ -1558,7 +1558,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
-    if ( BAD_MADT_ENTRY(processor, end) )
+    if ( BAD_MADT_GICC_ENTRY(processor, end) )
         return -EINVAL;
 
     /* Read from APIC table and fill up the GIC variables */
@@ -1628,7 +1628,7 @@ gic_acpi_get_madt_cpu_num(struct acpi_subtable_header *header,
     struct acpi_madt_generic_interrupt *cpuif;
 
     cpuif = (struct acpi_madt_generic_interrupt *)header;
-    if ( BAD_MADT_ENTRY(cpuif, end) || !cpuif->gicr_base_address )
+    if ( BAD_MADT_GICC_ENTRY(cpuif, end) || !cpuif->gicr_base_address )
         return -EINVAL;
 
     return 0;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index fe60619e99cf..3b0331b53830 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -454,7 +454,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
     unsigned long madt_size;
 
     madt_size = sizeof(struct acpi_table_madt)
-                + sizeof(struct acpi_madt_generic_interrupt) * d->max_vcpus
+                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
                 + sizeof(struct acpi_madt_generic_distributor)
                 + gic_hw_ops->get_hwdom_extra_madt_size(d);
 
-- 
2.17.1


