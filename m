Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B788D032
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698211.1089692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVf-00064z-Nn; Tue, 26 Mar 2024 21:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698211.1089692; Tue, 26 Mar 2024 21:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVf-0005yf-Bj; Tue, 26 Mar 2024 21:39:07 +0000
Received: by outflank-mailman (input) for mailman id 698211;
 Tue, 26 Mar 2024 21:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVe-0005br-8g
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:06 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4471adf7-ebb9-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 22:39:05 +0100 (CET)
Received: from DS7PR03CA0334.namprd03.prod.outlook.com (2603:10b6:8:55::11) by
 SJ2PR12MB8033.namprd12.prod.outlook.com (2603:10b6:a03:4c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:39:02 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::aa) by DS7PR03CA0334.outlook.office365.com
 (2603:10b6:8:55::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:39:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:39:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:39:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 14:39:00 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:39:00 -0500
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
X-Inumbo-ID: 4471adf7-ebb9-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEGfIXnKzDHv2ZrMSbPJ4KoFsMVLBkbRoseXrlA9cRqGE7Bo+10Eqyz//ZOR1cfLxK7TU6N89kjw9OKRzi117gaPUWx/nqiP6+pV+RiHzDwvHSzBd+3cAmmRzDhus4FQVL4NpuWLl+P18a/HkJWoTjCurE+4fLtNoMY2KRfaOxSKaM6Bnt6MZKpTiIwptVmyO3iJXDz8nP4yLbL898pcExlmLO1xipgnSFeoJKr7MjJc3HwD8/C5Wtyfz6kkEpuyAW1BGgjY8SPuJA+aOFA1cjkYRi5oFWS3nFtauiq/7wFG8ZMMRXgnmkdCTlwpmJkzBKSbPRld9kn0oiq0H+dPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAWSRBxqx9TWCT5t93ONlKSjz28ZclhdZGQsIXJ8iMY=;
 b=cePQPKntSFaPO+lOrfItCFLDEun72N3VrvM73B6GhOG00L6+VVEiSzjJ5CLCQ9G2G8ZF8ZT0HbpSxcq3MDujw4AHepW/ABVkz/hBQ29Qou9H9fAUCKEz76FGAy+g5/rSvuJWwiDWfd0e4aWzyj4LJp4N9kgFTBY6iEAF4DfyxXU0/acyCf9W5+49vnt01GDoeATys4T9dqEjI/ZlRkTRxOBnebD1MUH2UXWEK5+ZRZvJglI1esMPYQPvxtfaFMC65g5XzN48Y3HduE++ztsSJ5hyc4u3Q4in3mU3/rDiuzgnwuQPbJHHDAzjXaiMhKedhESMvOs+WM9newZgLvCkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAWSRBxqx9TWCT5t93ONlKSjz28ZclhdZGQsIXJ8iMY=;
 b=gsYPCml7wTVlrfrO/4jyvXXJm9yAd6b9kvdCEnZW5mXlUQOgXhzPUj1q/UWYXS7dPmcrV6PgmKyuwGyCjXl3rThPwkaFiY1swi7SIgnd2GtbeqV6xAzJoePew8X3cMFfpqG0xrwhZGQSXerf65QY0NWzqVtntl9MdPnmDbpiOoI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v5 4/6] libelf: Expand ELF note printing
Date: Tue, 26 Mar 2024 17:38:45 -0400
Message-ID: <20240326213847.3944-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326213847.3944-1-jason.andryuk@amd.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SJ2PR12MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5818a040-0896-46d3-7ae1-08dc4ddd2748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qFry+tKo3Z3kenPU9t52oavXVSw50loeziGAxNBhHM4Qrzt+UTlZPz/vrJiVe6JF2Vr3wBDPIfaI9OZiOtf0zF+D+locEeYZWtHQ8DmevtTT5nnyQpA6K6slvbgeYcy+VhtjMzU5v2/EgFK3lZTY9fwjJNRp4wySKRlJO+IZQ0bm76zAJBWQHArmQlkmqGr80hiw+ct/tuygoEuSFej3yN3XGcVOBgeB5Bflzma7LnXCmxud06QXiYejzgqaJR5derHN3pE+XWjJzhk+upl9zAkC/2wvqIZbAsT+suskNcGJW0NWYu2iAlFwHVDMDNLI7FbUZWswUzkqrlmnVIcjSXzRKrA6G4AYCqKU5MxppOaES1jgIP1iySBOzWA9qJ5KMv9Y7sfUN45g40/YzQl4xg6VrjBxyAUQJIp7JU6OnE+DF2qNL52oxjlSXvElayitmYwesRTBuBfjgSnc24MTuYYRz6/mzBsgbUi+kp1WA6gDI+Fl7hPEO3m+onZRU+hjGsUJa+XVTNotJ1To9TZGSy7ve9zsfEa2oJQrJQEMKb11PBOUAVIVGNZziH9L+urPJKkwyr/PcgxA2fxgBTWHqf2qa9HESi9A4YSW9pbWBf1dny9jhzT5xgHUIdsBmHhtqPHKrBxwXmDb6LuemiEoUhWPzRN6LTvjbCDPI7cWanuPLE44eHABGZ8p3kkTuUnzH7sur6l3eNeMP/z1V78nrmivrnmosoeJVEVll5gwiS1u32Oy8oLOMWwBjKRW4AGV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:39:01.9596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5818a040-0896-46d3-7ae1-08dc4ddd2748
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8033

The XEN_ELFNOTE_L1_MFN_VALID is an array of pairs of values, but it is
printed as:
(XEN) ELF: note: L1_MFN_VALID = 0

This is a limitation of only printing either string or numeric values.
Switch from the boolean to an enum which allows more flexibility in
printing the values.  Introduce ELFNOTE_NAME to only print the name
without a value like:
(XEN) ELF: note: L1_MFN_VALID

Details can optionally be printed for specific notes.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3:
Remove fatal size check
Don't print values - just the name for presence

v4:
Use switch
Always print newline for ELFNOTE_NAME

v5:
Add comment about newline printing
Add Jan's R-b
---
 xen/common/libelf/libelf-dominfo.c | 62 +++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index a13a5e4db6..77bd582a37 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -101,26 +101,30 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
 /* *INDENT-OFF* */
     static const struct {
         const char *name;
-        bool str;
+        enum {
+            ELFNOTE_INT,
+            ELFNOTE_STRING,
+            ELFNOTE_NAME,
+        } type;
     } note_desc[] = {
-        [XEN_ELFNOTE_ENTRY] = { "ENTRY", 0},
-        [XEN_ELFNOTE_HYPERCALL_PAGE] = { "HYPERCALL_PAGE", 0},
-        [XEN_ELFNOTE_VIRT_BASE] = { "VIRT_BASE", 0},
-        [XEN_ELFNOTE_INIT_P2M] = { "INIT_P2M", 0},
-        [XEN_ELFNOTE_PADDR_OFFSET] = { "PADDR_OFFSET", 0},
-        [XEN_ELFNOTE_HV_START_LOW] = { "HV_START_LOW", 0},
-        [XEN_ELFNOTE_XEN_VERSION] = { "XEN_VERSION", 1},
-        [XEN_ELFNOTE_GUEST_OS] = { "GUEST_OS", 1},
-        [XEN_ELFNOTE_GUEST_VERSION] = { "GUEST_VERSION", 1},
-        [XEN_ELFNOTE_LOADER] = { "LOADER", 1},
-        [XEN_ELFNOTE_PAE_MODE] = { "PAE_MODE", 1},
-        [XEN_ELFNOTE_FEATURES] = { "FEATURES", 1},
-        [XEN_ELFNOTE_SUPPORTED_FEATURES] = { "SUPPORTED_FEATURES", 0},
-        [XEN_ELFNOTE_BSD_SYMTAB] = { "BSD_SYMTAB", 1},
-        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", false },
-        [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", 0 },
-        [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", 0 },
-        [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", 0 },
+        [XEN_ELFNOTE_ENTRY] = { "ENTRY", ELFNOTE_INT },
+        [XEN_ELFNOTE_HYPERCALL_PAGE] = { "HYPERCALL_PAGE", ELFNOTE_INT },
+        [XEN_ELFNOTE_VIRT_BASE] = { "VIRT_BASE", ELFNOTE_INT },
+        [XEN_ELFNOTE_INIT_P2M] = { "INIT_P2M", ELFNOTE_INT },
+        [XEN_ELFNOTE_PADDR_OFFSET] = { "PADDR_OFFSET", ELFNOTE_INT },
+        [XEN_ELFNOTE_HV_START_LOW] = { "HV_START_LOW", ELFNOTE_INT },
+        [XEN_ELFNOTE_XEN_VERSION] = { "XEN_VERSION", ELFNOTE_STRING },
+        [XEN_ELFNOTE_GUEST_OS] = { "GUEST_OS", ELFNOTE_STRING },
+        [XEN_ELFNOTE_GUEST_VERSION] = { "GUEST_VERSION", ELFNOTE_STRING },
+        [XEN_ELFNOTE_LOADER] = { "LOADER", ELFNOTE_STRING },
+        [XEN_ELFNOTE_PAE_MODE] = { "PAE_MODE", ELFNOTE_STRING },
+        [XEN_ELFNOTE_FEATURES] = { "FEATURES", ELFNOTE_STRING },
+        [XEN_ELFNOTE_SUPPORTED_FEATURES] = { "SUPPORTED_FEATURES", ELFNOTE_INT },
+        [XEN_ELFNOTE_BSD_SYMTAB] = { "BSD_SYMTAB", ELFNOTE_STRING },
+        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", ELFNOTE_NAME },
+        [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
+        [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
+        [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
     };
 /* *INDENT-ON* */
 
@@ -136,8 +140,9 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         return 0;
     }
 
-    if ( note_desc[type].str )
+    switch ( note_desc[type].type )
     {
+    case ELFNOTE_STRING :
         str = elf_strval(elf, elf_note_desc(elf, note));
         if (str == NULL)
             /* elf_strval will mark elf broken if it fails so no need to log */
@@ -145,13 +150,20 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         elf_msg(elf, "ELF: note: %s = \"%s\"\n", note_desc[type].name, str);
         parms->elf_notes[type].type = XEN_ENT_STR;
         parms->elf_notes[type].data.str = str;
-    }
-    else
-    {
+        break;
+
+    case ELFNOTE_INT:
         val = elf_note_numeric(elf, note);
         elf_msg(elf, "ELF: note: %s = %#" PRIx64 "\n", note_desc[type].name, val);
         parms->elf_notes[type].type = XEN_ENT_LONG;
         parms->elf_notes[type].data.num = val;
+        break;
+
+    case ELFNOTE_NAME:
+        /* ELFNOTE_NAME has a newline printed at the end of the function to
+         * optionally allow printing customized details. */
+        elf_msg(elf, "ELF: note: %s", note_desc[type].name);
+        break;
     }
     parms->elf_notes[type].name = note_desc[type].name;
 
@@ -218,6 +230,10 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         parms->phys_entry = val;
         break;
     }
+
+    if ( note_desc[type].type == ELFNOTE_NAME)
+        elf_msg(elf, "\n");
+
     return 0;
 }
 
-- 
2.44.0


