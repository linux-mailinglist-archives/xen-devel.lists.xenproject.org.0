Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C65510E7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352437.579276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRc-0004os-Ao; Mon, 20 Jun 2022 07:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352437.579276; Mon, 20 Jun 2022 07:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRc-0004jS-4g; Mon, 20 Jun 2022 07:03:32 +0000
Received: by outflank-mailman (input) for mailman id 352437;
 Mon, 20 Jun 2022 07:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRa-0001Yx-90
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 16150c3d-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87ADE1424;
 Mon, 20 Jun 2022 00:03:28 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AA9E3F5A1;
 Mon, 20 Jun 2022 00:03:27 -0700 (PDT)
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
X-Inumbo-ID: 16150c3d-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 9/9] drivers/acpi: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:45 +0200
Message-Id: <20220620070245.77979-10-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
This patch may not be applicable as these files come from Linux.
---
 xen/drivers/acpi/tables/tbfadt.c  | 2 +-
 xen/drivers/acpi/tables/tbutils.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
index f11fd5a900..ad55cd769a 100644
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -235,7 +235,7 @@ void __init acpi_tb_create_local_fadt(struct acpi_table_header *table, u32 lengt
 		ACPI_WARNING((AE_INFO,
 			      "FADT (revision %u) is longer than ACPI 5.0 version,"
 			      " truncating length %u to %zu",
-			      table->revision, (unsigned)length,
+			      table->revision, (unsigned int)length,
 			      sizeof(struct acpi_table_fadt)));
 	}
 
diff --git a/xen/drivers/acpi/tables/tbutils.c b/xen/drivers/acpi/tables/tbutils.c
index d135a50ff9..ddb7f628c9 100644
--- a/xen/drivers/acpi/tables/tbutils.c
+++ b/xen/drivers/acpi/tables/tbutils.c
@@ -481,7 +481,7 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
 			if (ACPI_FAILURE(status)) {
 				ACPI_WARNING((AE_INFO,
 					      "Truncating %u table entries!",
-					      (unsigned)
+					      (unsigned int)
 					      (acpi_gbl_root_table_list.size -
 					       acpi_gbl_root_table_list.
 					       count)));
-- 
2.25.1


