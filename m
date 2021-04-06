Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8D35527A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105906.202539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk4q-0000pK-Qg; Tue, 06 Apr 2021 11:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105906.202539; Tue, 06 Apr 2021 11:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk4q-0000ou-NY; Tue, 06 Apr 2021 11:41:00 +0000
Received: by outflank-mailman (input) for mailman id 105906;
 Tue, 06 Apr 2021 11:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7nR=JD=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lTk4q-0000op-2U
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:41:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a8a90018-4185-4ad6-b665-11352dfccd80;
 Tue, 06 Apr 2021 11:40:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9CDF1042;
 Tue,  6 Apr 2021 04:40:58 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8BA3F73D;
 Tue,  6 Apr 2021 04:40:58 -0700 (PDT)
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
X-Inumbo-ID: a8a90018-4185-4ad6-b665-11352dfccd80
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 1/2] xen/pci: Move PCI ATS code to common directory
Date: Tue,  6 Apr 2021 12:39:10 +0100
Message-Id: <e61c9a1190018d8de434d71049b4a97980f22be0.1617702520.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617702520.git.rahul.singh@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
In-Reply-To: <cover.1617702520.git.rahul.singh@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>

PCI ATS code is common for all architecture, move code to common
directory to be usable for other architectures.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/Makefile        | 1 +
 xen/drivers/passthrough/{x86 => }/ats.c | 2 +-
 xen/drivers/passthrough/x86/Makefile    | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename xen/drivers/passthrough/{x86 => }/ats.c (99%)

diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index cc646612c7..445690e3e5 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_ARM) += arm/
 obj-y += iommu.o
 obj-$(CONFIG_HAS_PCI) += pci.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_HAS_PCI) += ats.o
diff --git a/xen/drivers/passthrough/x86/ats.c b/xen/drivers/passthrough/ats.c
similarity index 99%
rename from xen/drivers/passthrough/x86/ats.c
rename to xen/drivers/passthrough/ats.c
index 4628ffde45..7f7b16dc49 100644
--- a/xen/drivers/passthrough/x86/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -16,7 +16,7 @@
 #include <xen/sched.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
-#include "../ats.h"
+#include "ats.h"
 
 bool_t __read_mostly ats_enabled = 0;
 boolean_param("ats", ats_enabled);
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index 69284a5d19..75b2885336 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,3 +1,2 @@
-obj-y += ats.o
 obj-y += iommu.o
 obj-$(CONFIG_HVM) += hvm.o
-- 
2.17.1


