Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD99095D61C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782599.1192113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5W-0002VZ-NY; Fri, 23 Aug 2024 19:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782599.1192113; Fri, 23 Aug 2024 19:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5W-0002RI-Jv; Fri, 23 Aug 2024 19:36:46 +0000
Received: by outflank-mailman (input) for mailman id 782599;
 Fri, 23 Aug 2024 19:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sha5V-0002Oa-0z
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:36:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05721e38-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:36:42 +0200 (CEST)
Received: from BN9PR03CA0787.namprd03.prod.outlook.com (2603:10b6:408:13f::12)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 19:36:37 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::41) by BN9PR03CA0787.outlook.office365.com
 (2603:10b6:408:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22 via Frontend
 Transport; Fri, 23 Aug 2024 19:36:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 19:36:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 14:36:35 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 14:36:33 -0500
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
X-Inumbo-ID: 05721e38-6187-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glKcDYjbTAAV9QqRFb3gE29XVc5EUgIBABxXIjd7IKvkId4JZU7pDco/neWOWoJ3DfaJR6ap3LvGcsV7MB7yKWNcQ+e69neisjInrfNqsuEinmkk5xLnSY/SzmdyK58nZVIPr91keS3XWtxtLnDOQMDtNiVZa5SybzqOi1eBFSFNcioPw6G+Tyyg4n74gHRlnoqjpAYIAL+D61v+mTiFhnzPrWdVfc/dEqCgnU8BO8R8PZTTwcKzh9ruDAg+URjXTYYev4w/wqEmVFJLnAGULL8ggnsOuvCV8IvH2AUjlHvDAt4wYrNn0tII93az+OCOGboK5/x5JVsSZdntG1IWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55nJnnKdgeDx4oUSXrJ9Q+OVSfhHt48p1gn05H5VmsQ=;
 b=ipZLfcKjewCf/5hEs5ZX5Qux+kItX4LeWjZiGxnezz4tUmwjMNd3kmj2C+oqOQt7Rzcho6PmLrlXl0qOegxS67wk+CFcc7UZ/pHTnAmEXT8L1i+CMedaJW571BY73IECjPfUGVPBa+126HyTo5mdg51jGjXN8Qi/lwhKEBZtsHn/ca/0yKn9XXtm7sojbMZof/jUL0oAwe3nyj8lYLFzeBdY4A0FNtg9Q4BYxNELRBhBDN/NihMTLl5ZVNQ1jGUQapVklySs3djzPmNNDBR1F+ODIu69xUvdJTHXiqiquL5glAv9I8YubBlqH4y6zkpMqZ6I7AZuXOn1v59ove4rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55nJnnKdgeDx4oUSXrJ9Q+OVSfhHt48p1gn05H5VmsQ=;
 b=J8yek0kab9gu+QiruPgP5X+JOvunBFxIfZ8KqKBv0rtNILjdlofoXBrNWKihFAVyKj4oo05urZb/49GbhxKhYKWEw1+SriCoNwE8Z7IVtHwIfVPEAJJve3WYIEiUM1GZ0jc8v6KnXXUZKR1D/Er9HtwDux5UnuTm4sPGBaw+TzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v3 1/5] xen: sync elfnote.h from xen tree
Date: Fri, 23 Aug 2024 15:36:26 -0400
Message-ID: <20240823193630.2583107-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823193630.2583107-1-jason.andryuk@amd.com>
References: <20240823193630.2583107-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 679b3fdf-9c96-4805-eb13-08dcc3aae788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xC/E2UfBxPY0SLN8cFrgafV2rpiMkAcU+reHtKF7Lp2uvJjIHOYf7HlGOjty?=
 =?us-ascii?Q?/hV6VkF9JND8mFtmWU14rMLlhh87FJLi2DCg67DGKsJ5/tEAKkVbiVax4nQg?=
 =?us-ascii?Q?Y8dWFJr6WciAuBtB106Wn9Vf5K4tyqYnkMgojasESTY++oMRqYELGHZygfkn?=
 =?us-ascii?Q?cfwOiT3Bs3moIweVoDwiRGzs04DPFT9d8hn5QOrs3TBrYKNW9CVR3E6yRVEV?=
 =?us-ascii?Q?sTs+AvFnWTcDs5HDno6wEIhO/2/eVjkM9F4dN9wKhR5+hJwyhbs7umHI6wTz?=
 =?us-ascii?Q?7qJyNu61hD1azova0fX4A4A9zT9VT3yoGtMFVtNq1UpyvhYj9VTlHielQBo5?=
 =?us-ascii?Q?tdyNJD9AiE5v9RqHUG77N8zAFIXzEsyteY1TvAJnxlW6rvriNwupc0Dgsxu+?=
 =?us-ascii?Q?q/Mjv+Xr9kBrE/843bjk+Sa7Uf7Zb499UJAs5J9q11F+55sxBauId39gP6lF?=
 =?us-ascii?Q?QDVWLogr27TEV95druTSSI4ZtvcWXEe+H/6lysscIf5VH9hlq3ToPe1ulPDf?=
 =?us-ascii?Q?h6Rxm5rxyojKwV+eHqB/qrliv7vj5J7uI/hKAh6VYW/dEoP0Y1eh02bSfnwQ?=
 =?us-ascii?Q?p2c5E7b9HTVLAn3mvyWTjmt7X+tW7W3Zow8vSoh1SRf6IlQ5lQi4clNTcNEz?=
 =?us-ascii?Q?IEu/Q2CLhNjQmVmYz7P/aGV5RCWygLTDhGqPTD+Mdz6CkMMmEMefqU8keQAS?=
 =?us-ascii?Q?foxRepz9AknUMqpmRSdBhbxgRCT3hc9bmPH36JjBhoi54qI5wh0/jLmXu/UI?=
 =?us-ascii?Q?jN+Mn+1buNlCU0BMkfzmiSofZl26o4pTFULMLgfgPWElArtIGWs/i2XyMtRn?=
 =?us-ascii?Q?8ozYsX85JUQ/4OgcIhd4+0Jm2f8W5GCAYRkaHQKPzicnM2kt6okMClVkFhY1?=
 =?us-ascii?Q?GwU7c2XsMonJ9iJfjVGjimpHz2RkceBIG+vTSjrZOW1MT4Az0U4j152rSyNb?=
 =?us-ascii?Q?ICkKFrRlOvgBpwPcuAZx+QNii1l+47Ei1yvq2pEyvQ4ZDU+tWXemQCCv+EZn?=
 =?us-ascii?Q?WyaE8yzUfMreZ1F0wZKb9puhYCeJbJe3ez9qZPFzRv+kJWW2KkpWQhpLwPBg?=
 =?us-ascii?Q?0VDpBsguaaVvm7mtUPvTVgH38Zo6OhXDkyvs6d58/4Cadj8Cr6jYPqiPZXnf?=
 =?us-ascii?Q?d3wtXkiUu0JClc21O2QIE6uVA2Qyt0joUKxd0zyTZNG3adntykm24cC7fZIU?=
 =?us-ascii?Q?bu29wmIHeNntx/ouaVW+EEY9XZuuq8jRSf1LY5qfiGt1eiYdetm0QQJcKSA0?=
 =?us-ascii?Q?uXAk7/7aGCzLSQrCBuzxGOxPaDUNZq2KTzk8ylt32Ds1390jXrGjkLLuEhFo?=
 =?us-ascii?Q?TF2CjAL65TXsiIAjFZrFAO9YMeCK0xHrbfw4J4wBTe0YInKD7mqh60wbFtxc?=
 =?us-ascii?Q?smJpnsd6Yv39Eam3RQxxxPMVv63p3NyaLCQS5WBJLiymiTl0tHmMhCiajmGZ?=
 =?us-ascii?Q?jYj1eW07QFUaOBUp+Nyo2CaKbmA817SRxeBYTL7GGeNVKn2ItAHiCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:36:37.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 679b3fdf-9c96-4805-eb13-08dcc3aae788
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867

Sync Xen's elfnote.h header from xen.git to pull in the
XEN_ELFNOTE_PHYS32_RELOC define.

xen commit dfc9fab00378 ("x86/PVH: Support relocatable dom0 kernels")

This is a copy except for the removal of the emacs editor config at the
end of the file.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 include/xen/interface/elfnote.h | 93 +++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/include/xen/interface/elfnote.h b/include/xen/interface/elfnote.h
index 38deb1214613..918f47d87d7a 100644
--- a/include/xen/interface/elfnote.h
+++ b/include/xen/interface/elfnote.h
@@ -11,7 +11,9 @@
 #define __XEN_PUBLIC_ELFNOTE_H__
 
 /*
- * The notes should live in a SHT_NOTE segment and have "Xen" in the
+ * `incontents 200 elfnotes ELF notes
+ *
+ * The notes should live in a PT_NOTE segment and have "Xen" in the
  * name field.
  *
  * Numeric types are either 4 or 8 bytes depending on the content of
@@ -22,6 +24,8 @@
  *
  * String values (for non-legacy) are NULL terminated ASCII, also known
  * as ASCIZ type.
+ *
+ * Xen only uses ELF Notes contained in x86 binaries.
  */
 
 /*
@@ -52,7 +56,7 @@
 #define XEN_ELFNOTE_VIRT_BASE      3
 
 /*
- * The offset of the ELF paddr field from the acutal required
+ * The offset of the ELF paddr field from the actual required
  * pseudo-physical address (numeric).
  *
  * This is used to maintain backwards compatibility with older kernels
@@ -92,7 +96,12 @@
 #define XEN_ELFNOTE_LOADER         8
 
 /*
- * The kernel supports PAE (x86/32 only, string = "yes" or "no").
+ * The kernel supports PAE (x86/32 only, string = "yes", "no" or
+ * "bimodal").
+ *
+ * For compatibility with Xen 3.0.3 and earlier the "bimodal" setting
+ * may be given as "yes,bimodal" which will cause older Xen to treat
+ * this kernel as PAE.
  *
  * LEGACY: PAE (n.b. The legacy interface included a provision to
  * indicate 'extended-cr3' support allowing L3 page tables to be
@@ -149,7 +158,9 @@
  * The (non-default) location the initial phys-to-machine map should be
  * placed at by the hypervisor (Dom0) or the tools (DomU).
  * The kernel must be prepared for this mapping to be established using
- * large pages, despite such otherwise not being available to guests.
+ * large pages, despite such otherwise not being available to guests. Note
+ * that these large pages may be misaligned in PFN space (they'll obviously
+ * be aligned in MFN and virtual address spaces).
  * The kernel must also be able to handle the page table pages used for
  * this mapping not being accessible through the initial mapping.
  * (Only x86-64 supports this at present.)
@@ -185,9 +196,81 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * The presence of this note indicates the kernel supports relocating itself.
+ *
+ * The note may include up to three 32bit values to place constraints on the
+ * guest physical loading addresses and alignment for a PVH kernel.  Values
+ * are read in the following order:
+ *  - a required start alignment (default 0x200000)
+ *  - a minimum address for the start of the image (default 0; see below)
+ *  - a maximum address for the last byte of the image (default 0xffffffff)
+ *
+ * When this note specifies an alignment value, it is used.  Otherwise the
+ * maximum p_align value from loadable ELF Program Headers is used, if it is
+ * greater than or equal to 4k (0x1000).  Otherwise, the default is used.
+ */
+#define XEN_ELFNOTE_PHYS32_RELOC 19
+
 /*
  * The number of the highest elfnote defined.
  */
-#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_ENTRY
+#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_RELOC
+
+/*
+ * System information exported through crash notes.
+ *
+ * The kexec / kdump code will create one XEN_ELFNOTE_CRASH_INFO
+ * note in case of a system crash. This note will contain various
+ * information about the system, see xen/include/xen/elfcore.h.
+ */
+#define XEN_ELFNOTE_CRASH_INFO 0x1000001
+
+/*
+ * System registers exported through crash notes.
+ *
+ * The kexec / kdump code will create one XEN_ELFNOTE_CRASH_REGS
+ * note per cpu in case of a system crash. This note is architecture
+ * specific and will contain registers not saved in the "CORE" note.
+ * See xen/include/xen/elfcore.h for more information.
+ */
+#define XEN_ELFNOTE_CRASH_REGS 0x1000002
+
+
+/*
+ * xen dump-core none note.
+ * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_NONE
+ * in its dump file to indicate that the file is xen dump-core
+ * file. This note doesn't have any other information.
+ * See tools/libxc/xc_core.h for more information.
+ */
+#define XEN_ELFNOTE_DUMPCORE_NONE               0x2000000
+
+/*
+ * xen dump-core header note.
+ * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_HEADER
+ * in its dump file.
+ * See tools/libxc/xc_core.h for more information.
+ */
+#define XEN_ELFNOTE_DUMPCORE_HEADER             0x2000001
+
+/*
+ * xen dump-core xen version note.
+ * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_XEN_VERSION
+ * in its dump file. It contains the xen version obtained via the
+ * XENVER hypercall.
+ * See tools/libxc/xc_core.h for more information.
+ */
+#define XEN_ELFNOTE_DUMPCORE_XEN_VERSION        0x2000002
+
+/*
+ * xen dump-core format version note.
+ * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_FORMAT_VERSION
+ * in its dump file. It contains a format version identifier.
+ * See tools/libxc/xc_core.h for more information.
+ */
+#define XEN_ELFNOTE_DUMPCORE_FORMAT_VERSION     0x2000003
 
 #endif /* __XEN_PUBLIC_ELFNOTE_H__ */
-- 
2.34.1


