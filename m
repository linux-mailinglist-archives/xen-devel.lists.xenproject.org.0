Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCCC88B1E0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697879.1089113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCF-0007xK-J5; Mon, 25 Mar 2024 20:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697879.1089113; Mon, 25 Mar 2024 20:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCF-0007rA-F7; Mon, 25 Mar 2024 20:45:31 +0000
Received: by outflank-mailman (input) for mailman id 697879;
 Mon, 25 Mar 2024 20:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCE-0007L7-LC
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:30 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cab45cf-eae8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 21:45:28 +0100 (CET)
Received: from BL1PR13CA0138.namprd13.prod.outlook.com (2603:10b6:208:2bb::23)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 20:45:26 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::c0) by BL1PR13CA0138.outlook.office365.com
 (2603:10b6:208:2bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:24 -0500
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
X-Inumbo-ID: 9cab45cf-eae8-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW42aADAmMPGR9Pgh+6NlXpd9cbDaA85hex+5vgSzKweK9BCz1eTsuXosmSAvJrrYwP1Zq8XO2IK23QNYE4lmWOyK7mePeeAHFeof0Fw6FmuMJKWq8P42tZ3OHJX+Qmbe3NOAm7zdDndHXD3431AIhcuZyJph13jFcXz8aTkllm7ekPZ7tn83ZjWiGmA1jvJy39DN0OEA1zAqf9DmmKvQG0NlAINrY0NdQQW/yLSMAY4nNu3MHbZ7Nwg20iE5MzYRqdXqXJeOdrXD3qTnLiW+7KGSB5fI2Dg4B8NIL2AYlQmRpIo+MSKH3iv5nO4MI81Ul7gVKy+1YCUcZtMhs0x5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePBeoHAZ89v7gvk2hxDlL5ktUBtUjVi0i6hIkMIc1ds=;
 b=QbLf5G0PUPeOiVT1J2cPAVppwzzd5tvUgfXEtvydoKiOh3UZZWcfU5Qp6K8IFBNSePVHAH8GyKVOMsyD+2+UolHP/JFMIzTHa8v7yKSWwLcezabmeIKV9OsHPWl18NP+P59mbhHoEJ6Bf859se14hrr/3W8nHIXWUaKgkUTXDd/OmioBv+Oo4ce8SbVpn9N/mT6PpvZQyzNJD9GpSsec40VNJCBi8n/jNYJCpBxnvLuUcJw4HP4oi9jIGRUDvBBVSakKWIVLow0aKnlIzyY5Jf+uFva6n8eT+u4tyydZhuv+VP4c6HTBaIZNfnkNkiYf96sE1Dc+9NDAb+NVQ99JBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePBeoHAZ89v7gvk2hxDlL5ktUBtUjVi0i6hIkMIc1ds=;
 b=5O4lp8aseLPPRGcci8B3nEEhF4JCRp7wPezA5Og/K+H+PyEQx+e9nnztU6JdSZo9jClhC04cvRYPNYt5fVB2JOQFoQYOux7Qoai+OT3F58lURXlb+cH21znZD8KqT7BnmYm+acFp7TTcFPYhFBPCkiSJTIDYUYfwN9E69CFlLxs=
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
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 4/5] libelf: Expand ELF note printing
Date: Mon, 25 Mar 2024 16:45:14 -0400
Message-ID: <20240325204515.250203-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204515.250203-1-jason.andryuk@amd.com>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba94830-f9ca-4a6a-3df1-08dc4d0c7fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f5BqoaUWWbLZO3K2yNThcgZZ/IENu0PLQ6N8rz3FkhjaGMcOXXp6eIryWbLRe5EVXKik/VeYaAgiErVukDpOSOeDfV9uJCTGzNYEUrR6J2D1puHsgzoiusmJmQ5Y+78/O5HpoFKhVlHg69uhCdYVDEuO9wMGNZx27r8yCUQKcklOM5qMO8U4EAPhYMS8oXVfPFFm1ZoKr3UroSXKiTwTSKjKWd0i4zclJ5BG2M5zwYCIVasNOIeRIE8hD8zmsJKhclZxEmvI0d7VmlyX2GTdu6lLxZbwdzAtD2mlEoLQUS7MBlCfwRFWW4qiTftD2/J9yumyUrANspuqcjI9XuV+MgovYvj0D0HXXoj52+ewiq8JsG2djv60sPXN3LTN6LE9fYh6DJaw0mVCqY2Jf+ojgGuL3IPGptH9L0yvpxzVVh+1kjJs5LPKWeuec0GnzvmdWz2k61U53/rzQHf8uOchf0zR6i3AJLtoR3L+51GtIGh2V2eUymp+ks4T7xKaLi6xSK5KQJiJu/XYAsgTEzLMJS9ftdwV7hEYnR+E8SwQDGvLdFFLkLwkFJAI+WeKLE+99qIq34dZZvhqnuV++qSlvmnoua7Cy13niPAixe5KE58P7Wc8m3SRXTTAfQujxV00D240CK9SqyDwOfeEagPWbhOJ/k6AKXejeslorZWEwHPkktCzSjkTNQmbjuiLZizA1ALuATPncsu1+As7qUG7Nc3E2niTrL6lIt4XkzV9qwirE4LD9ePhCeNZtkHjRjDW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:25.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba94830-f9ca-4a6a-3df1-08dc4d0c7fa9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234

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
---
v3:
Remove fatal size check
Don't print values - just the name for presence

v4:
Use switch
Always print newline for ELFNOTE_NAME
---
 xen/common/libelf/libelf-dominfo.c | 60 ++++++++++++++++++------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index a13a5e4db6..e7b44d238b 100644
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
@@ -145,13 +150,18 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
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
+        elf_msg(elf, "ELF: note: %s", note_desc[type].name);
+        break;
     }
     parms->elf_notes[type].name = note_desc[type].name;
 
@@ -218,6 +228,10 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
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


