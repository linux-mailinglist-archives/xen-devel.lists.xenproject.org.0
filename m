Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44387B20A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 20:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692753.1080209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURV-0007th-DY; Wed, 13 Mar 2024 19:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692753.1080209; Wed, 13 Mar 2024 19:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURV-0007rR-A2; Wed, 13 Mar 2024 19:39:13 +0000
Received: by outflank-mailman (input) for mailman id 692753;
 Wed, 13 Mar 2024 19:39:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOmT=KT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkURT-0007Yd-U2
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 19:39:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce1089e-e171-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 20:39:10 +0100 (CET)
Received: from CY5P221CA0145.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::25)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Wed, 13 Mar
 2024 19:39:06 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:6a:cafe::44) by CY5P221CA0145.outlook.office365.com
 (2603:10b6:930:6a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Wed, 13 Mar 2024 19:39:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 19:39:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:39:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:39:04 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Mar 2024 14:39:02 -0500
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
X-Inumbo-ID: 5ce1089e-e171-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSEtrjmKZKsOC7FOfgVsewbMOvUuqXGS5Zh+kjMOlVgaxscvewr2+QZmV1WNRvn2R2VRilaqTTo0luK5ScITdm1Rv9drtGnNBBNZzT75dAYtBK/yJ7kxSmIJ58NWN1i/lQs3mkfRRsp71XPs6LVpGs1iK+0JWGx+Y52ZFB6yLjK+T6j2MGcAZNm0HedXdPuGvzl96JlrfOnQxbWbBLGnKG18lip6CuaFD4tYeeHAa24DAyh6u8mzSLWo3+UXOYLGJl7QSLGIRtGdncL2mzaTMKCu6oNKyp6gg4cpoOVn5Wx159ERHcoq2ZdYcLoJZ92ZjvuqBnHSjaXKasEulAx+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaYStxNKhxziDBKjMiI264ns3R4OBvC1TLDcC7wP1GE=;
 b=c8V27ODprsF40khRs7sXT878TaNomsTM3deuhqat6hMdP2Y3aqTb5N5Td5sxSsggb97dosDP50wPH9tFRlvmlErCQ8SBkbgR5AT/ME3iZcnuDTOs8K0LdN6n3VVSmZkTWW1TVFHTaerYJHJpv0lxGe63l8NZDyTopFPfFQiHfE7DDD0B1/AcadokcgCWPGBdvYAAJaTbp/ZCI7oXrSM7Md5kHyJYBqFEX78PkvfOvUT1qcgMsh5NfiXMd/pM4kty2XR+qRyL7tQgDUnBnt0PoIqQLN/bYjm/9WcnBktEZikLT98T8cvbwFWyxiobT0ZOZYfLcGaK/xRjrIOWB5Q71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaYStxNKhxziDBKjMiI264ns3R4OBvC1TLDcC7wP1GE=;
 b=1AIdR64+BBhfKZrT5wZXd2DOXZsy15FrI5hLVo/FK1NEvUzEtataiEYK8PKEKI6XNN3o06njZdl0loLPSzcp1E4GdclbPUoR1lNBCM4r09NPnzC74VKsJ3j+AuEk/OhzICaIq3B61/1DoIuU9QrpaYhE8tRfTNK5K4GCyTEPJis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] libelf: Expand ELF note printing
Date: Wed, 13 Mar 2024 15:30:20 -0400
Message-ID: <20240313193021.241764-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313193021.241764-1-jason.andryuk@amd.com>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 338926f9-b4e0-4fd2-fcee-08dc43953e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xDEYkK9IRi2EoBCjF20Ik0ap0chhjn7aMoWF7sNlv/qF5/23/chd7BB/9UKtnBGJH/gGVc1HA9qKapPR0gDVueC2BbVCY/szsK0xmKo3eD1PGIYlhVVxkBV0AZDCVICHnU4HGNO5ZL9+L+68QPD1Bl3YkfZppxFXsalCs9nhJfQKj3ng+l55GrTdyx4u4caVlq0VR0SOkOzEWBqTsAAG6HV6pX2GGNhpA9I7Q/xTKURXtR5+wW50ySKF+MPiC2AhVh2WoviA3/2UtR9vXGNH1swE5t8eYqumikW2vXYYpbm88c60V8RNHXmC5WmF5NwpHnwBQsyJe+UWD8lTY8ef5iMAvYhgr4N0jYZPb4FI4DEez1nLR4BxSYu3Htt7mlP32kkTGk2uolVCtY8CUNqY2tQJU0xaOVySuG5DmWXCSTKbbj1m3A2rbQgro2lCI1IcspMGGYPLMaMxMQIdKl3ALMD89yBdBSCt9oLSxiMHBCDxQmQQTwZG/dagBJRfPLFQN7fx20wJ3QUxbnrmWUTs+Pq5UQ9SewQdmkgHOXWJGXohTpgghdlp+wxu+7edwPxB4dHw0OxrXQO3Y1PhXV22tkBr3yhQQpEYIETkrMPmaSYepeEKWL8ONQY2GT3ClJ6TQTv4KJTEx8o/y8NhHBTx5qOvcE5lny8Uj3kEcEtn6XkOJTNMOyzhB4MQdvOjlJctnw7nLyjDCx+dIMoj6Xcp5daf8K++4Me06C0vqoHEZOHaAJZjdRzxsWEFvTnQcXsn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:39:05.1587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 338926f9-b4e0-4fd2-fcee-08dc43953e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369

The XEN_ELFNOTE_L1_MFN_VALID is an arrray of two values, but it is
printed as:
(XEN) ELF: note: L1_MFN_VALID = 0

Expand the printing to handle an array.
(XEN) ELF: note: L1_MFN_VALID = mask: 0x1 val: 0x1

ELFNOTE_OTHER prints the name and " = ", but not the value.
Implementing a switch case is needed to show the value, which should
include a newline.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/libelf/libelf-dominfo.c | 59 +++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index a13a5e4db6..7cc7b18a51 100644
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
+            ELFNOTE_OTHER
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
+        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", ELFNOTE_OTHER },
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
+    else
+    {
+        elf_msg(elf, "ELF: note: %s = ", note_desc[type].name);
+    }
     parms->elf_notes[type].name = note_desc[type].name;
 
     switch ( type )
@@ -217,6 +225,15 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     case XEN_ELFNOTE_PHYS32_ENTRY:
         parms->phys_entry = val;
         break;
+
+    case XEN_ELFNOTE_L1_MFN_VALID:
+        if ( elf_uval(elf, note, descsz) != 2 * sizeof(uint64_t) )
+            return -1;
+
+        elf_msg(elf, "mask: %#"PRIx64" val: %#"PRIx64"\n",
+                elf_note_numeric_array(elf, note, 8, 0),
+                elf_note_numeric_array(elf, note, 8, 1));
+        break;
     }
     return 0;
 }
-- 
2.44.0


