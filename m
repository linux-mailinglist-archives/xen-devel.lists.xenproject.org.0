Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7588065C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695611.1085502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY9-0008KX-Nr; Tue, 19 Mar 2024 20:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695611.1085502; Tue, 19 Mar 2024 20:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY9-0008HU-Kd; Tue, 19 Mar 2024 20:59:09 +0000
Received: by outflank-mailman (input) for mailman id 695611;
 Tue, 19 Mar 2024 20:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmgY8-0007jV-Hg
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:59:08 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 865926d3-e633-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 21:59:07 +0100 (CET)
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 20:59:02 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::ba) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Tue, 19 Mar 2024 20:59:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 20:59:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 15:59:01 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 15:59:00 -0500
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
X-Inumbo-ID: 865926d3-e633-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBzRTvisDlefOi9ZyMK7LQIdFVUzW/fGjGCj4THYmsSQJ3jhYb5yVrqWiPDeziDY0w5kX4sQfpmvtchL180JErnKNGZlCA6177rgwVT3ZdKr3/67VBA6yHY7tnW8O2aAkwvVs98W7xE8YQ65LA1ynUTPXrXdmQQNY2MgoTUF8OCssc8oUE8EqaR/38IxkkPH1hs0ur3Wxg1IgDuWUZJqn7K0N7ws7GQuGh7tgnOB+rycM8AfmjtLIaySly8H6f4dnP5QEgJhQKfKAQvgIrdsOh1dvuvzpPYn6rGvyAAQKyUJdaF3ewLFaX84sDE8ZtiPxWDPyuDEhlyMFz/RAq4Wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDm0ZtVyDBysq2xkYmsebdtkUyX6X2/ReXcGS+SS/nU=;
 b=kwprMUzI8IFE5wjhqZDCqZtcY3a+sB8t9SUHJ+m3gfRtvfrhPoqodprbqXf+wOXmT8RpBRh9wcPGQLC39gtduH8Ln5/OjDKxfR4ALGAHqhvQbkc6uW+okAWOrIJ0nexrwZrAJ9n65ERKAMMpaXckXPlsACiCFVFMnF79S12M7rrMiP5RyEqQ87TbHpYKh/j2fgyj1xmVNiYrvI/o2g6/230+f4/sz08epA0tZZj3zoFMZhzK/3n88o/JHWLMoP4CNGCQzeEF4zkL49lKef9vpS3bJfbCKPGLYpDsB8NwUanbXsZQ16scJRQ6OSQHiQ7PCeCe2d0dsT4IaunQgtM92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDm0ZtVyDBysq2xkYmsebdtkUyX6X2/ReXcGS+SS/nU=;
 b=XJlX0xIalPXa2OCZY/7xPbtPOtTvKRGDSQF3ScK9BxU9T+e7w3toQKCIoaas50Xwhbv0mqVC4MjoPKJZwkIw6lsRSoQL2ZyHCsXxNc2CmZ2iDEhqLpbOKZfyiXOUOn32JuGyndr5XFx5qzDPBQTaR9GzF+9OfU6FDRwknOPOG3w=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] libelf: Expand ELF note printing
Date: Tue, 19 Mar 2024 16:58:48 -0400
Message-ID: <20240319205849.115884-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319205849.115884-1-jason.andryuk@amd.com>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 955bdd22-30f8-4648-08f7-08dc4857680f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aPMiu3QItUiwzdgKym7VRj33rEQPotKrYMRnIbvy6DQt9e/SGYPVNXoSC586xV0Zen2Q8ZannXTJcLbfrIFsO6vAjE2LusAbUvxQBXVuzlEvhVVIDWybiLw8LahdyoQF/AT57kjy70D4EZh5VU0c9BGRoBCpXruB6IYa054TYlen9UG8J3URqORCyIbre2X5fXHqPyVTyCArcVkRbwVBn8sr82WEk6FJXqnGIIVDoblqzPeJ3RF/Z/ODdPXkXVRyvGGU0O8A88f9IxD883fQ2PCS8jESLQ8RRs0eatK7O9ORJaqE6wuGyeGv/jlM6WtXTFjeWnhyFg+yMgqeOfy6GrkOFCtntWzCYngCwx5qA3cE3i1trfcszFK6C9Dbu9HNxCobdbzRCOsQ3MbMOBllHkBbblhOJttFR5LBYo8oH5o74DAjKHsIgsy9RgFV6mf3LnJVqPLEJt8II47lRzAERRwKrbDMO6q9v/rK7TP9L2OMYXzg2QmInNCbkxAHg1GZJmSw5XGnEi2RkGS4M4dQ1YHzy3M4/scVq39ZCioNlOp2WcHPdTDN2ISv6y7YXF1Tk5aLGk4dXU7/q1Y3eLMByeEsXThUvPe8vQjwjtG+x34E02ZFg0pXWAGZbExUWBtvWvr39rkOMIoTTSjWuh8kTMpeCxuYg3nTSUpJ9KLoiIB3e+oHhGsdYKRkXO0OcPC8ZWaeOf30EDLmai9L1sWQr76ol9jNPi5hb06R/O42HyZ2Hl+BGwYIR3NxSSPF6zN6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 20:59:02.4313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 955bdd22-30f8-4648-08f7-08dc4857680f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736

The XEN_ELFNOTE_L1_MFN_VALID is an array of pairs of values, but it is
printed as:
(XEN) ELF: note: L1_MFN_VALID = 0

This is a limitation of only printing either string or numeric values.
Switch from the boolean to an enum which allows more flexibility in
printing the values.  Introduce ELFNOTE_NAME to only print the name
without a value like:
(XEN) ELF: note: L1_MFN_VALID

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Remove fatal size check
Don't print values - just the name for presence
---
 xen/common/libelf/libelf-dominfo.c | 50 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index a13a5e4db6..405510ead9 100644
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
 
@@ -136,7 +140,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         return 0;
     }
 
-    if ( note_desc[type].str )
+    if ( note_desc[type].type == ELFNOTE_STRING )
     {
         str = elf_strval(elf, elf_note_desc(elf, note));
         if (str == NULL)
@@ -146,13 +150,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         parms->elf_notes[type].type = XEN_ENT_STR;
         parms->elf_notes[type].data.str = str;
     }
-    else
+    else if ( note_desc[type].type == ELFNOTE_INT )
     {
         val = elf_note_numeric(elf, note);
         elf_msg(elf, "ELF: note: %s = %#" PRIx64 "\n", note_desc[type].name, val);
         parms->elf_notes[type].type = XEN_ENT_LONG;
         parms->elf_notes[type].data.num = val;
     }
+    else if ( note_desc[type].type == ELFNOTE_NAME )
+    {
+        elf_msg(elf, "ELF: note: %s\n", note_desc[type].name);
+    }
     parms->elf_notes[type].name = note_desc[type].name;
 
     switch ( type )
-- 
2.44.0


