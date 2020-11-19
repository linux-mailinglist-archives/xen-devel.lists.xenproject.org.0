Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D795A2B9239
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 13:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30661.60839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfip2-0003o2-E2; Thu, 19 Nov 2020 12:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30661.60839; Thu, 19 Nov 2020 12:13:56 +0000
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
	id 1kfip2-0003nQ-A1; Thu, 19 Nov 2020 12:13:56 +0000
Received: by outflank-mailman (input) for mailman id 30661;
 Thu, 19 Nov 2020 12:13:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfip0-0003mV-H2
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:13:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfip0-0002ZO-31; Thu, 19 Nov 2020 12:13:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfioz-0001xd-PV; Thu, 19 Nov 2020 12:13:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfip0-0003mV-H2
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=mZpQmkQLUUO1hccs/83l4shhsGEQrqSCrng3B/PMRp8=; b=XLY8g2zOlxlwMzPy8nLAAtYc7
	bZZ2/ui0Ya1sVIL3ejNEJZC7gp/lHh4z8elebFs7GiFvwqwkqajEMQ6Bx9nE0JqvPxf4KOZ0Sk/71
	LV2itXj8wtvEP99t/1qcjZS55IsaHiwARdWWVsPvhqwtNBu6xz91Of00TGolfIDJw5IaU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfip0-0002ZO-31; Thu, 19 Nov 2020 12:13:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfioz-0001xd-PV; Thu, 19 Nov 2020 12:13:54 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 2/2] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
Date: Thu, 19 Nov 2020 12:13:47 +0000
Message-Id: <20201119121347.27139-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119121347.27139-1-julien@xen.org>
References: <20201119121347.27139-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment Xen requires the FADT ACPI table to be at least version
6.0, apparently because of some reliance on other ACPI v6.0 features.

But actually this is overzealous, and Xen works now fine with ACPI v5.1.

Let's relax the version check for the FADT table to allow QEMU to
run the hypervisor with ACPI.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v3:
        - Add Stefano's acked-by

    Changes in v2:
        - Patch added
---
 xen/arch/arm/acpi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 55c3e5cbc834..7ea2990cb82c 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -181,8 +181,8 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
      * we only deal with ACPI 6.0 or newer revision to get GIC and SMP
      * boot protocol configuration data, or we will disable ACPI.
      */
-    if ( table->revision > 6
-         || (table->revision == 6 && fadt->minor_revision >= 0) )
+    if ( table->revision > 5
+         || (table->revision == 5 && fadt->minor_revision >= 1) )
         return 0;
 
     printk("Unsupported FADT revision %d.%d, should be 6.0+, will disable ACPI\n",
-- 
2.17.1


