Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19455B9D0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356612.584922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obO-0007lo-Dq; Mon, 27 Jun 2022 13:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356612.584922; Mon, 27 Jun 2022 13:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obO-0007jD-4f; Mon, 27 Jun 2022 13:16:30 +0000
Received: by outflank-mailman (input) for mailman id 356612;
 Mon, 27 Jun 2022 13:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5obN-0005lc-47
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 59fdf657-f61b-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:16:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666D9175A;
 Mon, 27 Jun 2022 06:16:27 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697053F5A1;
 Mon, 27 Jun 2022 06:16:25 -0700 (PDT)
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
X-Inumbo-ID: 59fdf657-f61b-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 7/7] drivers/acpi: Drop the unneeded casts to unsigned
Date: Mon, 27 Jun 2022 15:15:43 +0200
Message-Id: <20220627131543.410971-8-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627131543.410971-1-michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and make use of PRIu format specifiers when applicable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/drivers/acpi/tables/tbfadt.c  | 6 +++---
 xen/drivers/acpi/tables/tbutils.c | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
index f11fd5a900..d8fcc50dec 100644
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -233,9 +233,9 @@ void __init acpi_tb_create_local_fadt(struct acpi_table_header *table, u32 lengt
 	 */
 	if (length > sizeof(struct acpi_table_fadt)) {
 		ACPI_WARNING((AE_INFO,
-			      "FADT (revision %u) is longer than ACPI 5.0 version,"
-			      " truncating length %u to %zu",
-			      table->revision, (unsigned)length,
+			      "FADT (revision %"PRIu8") is longer than ACPI 5.0 version,"
+			      " truncating length %"PRIu32" to %zu",
+			      table->revision, length,
 			      sizeof(struct acpi_table_fadt)));
 	}
 
diff --git a/xen/drivers/acpi/tables/tbutils.c b/xen/drivers/acpi/tables/tbutils.c
index d135a50ff9..11412c47de 100644
--- a/xen/drivers/acpi/tables/tbutils.c
+++ b/xen/drivers/acpi/tables/tbutils.c
@@ -481,7 +481,6 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
 			if (ACPI_FAILURE(status)) {
 				ACPI_WARNING((AE_INFO,
 					      "Truncating %u table entries!",
-					      (unsigned)
 					      (acpi_gbl_root_table_list.size -
 					       acpi_gbl_root_table_list.
 					       count)));
-- 
2.25.1


