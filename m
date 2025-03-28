Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E074A7521D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 22:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931244.1333651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyHKq-0003ZL-NB; Fri, 28 Mar 2025 21:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931244.1333651; Fri, 28 Mar 2025 21:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyHKq-0003Wx-K4; Fri, 28 Mar 2025 21:33:52 +0000
Received: by outflank-mailman (input) for mailman id 931244;
 Fri, 28 Mar 2025 21:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K3Bz=WP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tyHKo-0003Wn-RJ
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 21:33:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2406::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538d726c-0c1c-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 22:33:45 +0100 (CET)
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by CY3PR12MB9606.namprd12.prod.outlook.com (2603:10b6:930:102::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 21:33:40 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::1) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 21:33:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 21:33:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 16:33:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 16:33:39 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Mar 2025 16:33:38 -0500
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
X-Inumbo-ID: 538d726c-0c1c-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9DhJT3x5PMsStl7iMuwC6t/hkM2b962KCpq+0rZch2WBUlkdf0scUV0L0UTRzqitzPJoTF+GsA5wuqjra7bARqmf4tFkLkY9fmpqLfEx+i9wytMNS67uYiZYCxKH5KXBy6Q73agJ7u9GD+GLi8Epbskjj8Ms+co2ITUyc+GeqrnGWDTJjrdZxWTgo4/KFvT8tPl/CNePIa4qUi41fPhHMhT5nlPXxCp/kYXpM/mycexr7p/OVrqtzEs4jbovueYXShwx/1S3xFu/cS5AKkl0azs7jxEvE5DNUUJDK/Vf2lS4XxLpNdqBqGlW5fuiAIYo3JaH5j9/3g2a1Mn5cNNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4rvEA9vzE/jhzQX+UzNzxIIecWZfnCP8M/gRb4kabs=;
 b=IBtb2L5J/CoB79330V+KiKuNO0t1dobTI4kdJ2R7kkTjBrGOqmrdqV7dHfv5gnxHLrZWLfnvBpF+UM4wvPRF2Qg3B1yIFojjFeOFIR7mv+5h4GRC7+jrVxNBPirpwSmyhC173rJyosNlGhPm3db+ODE2BtJDCKGnv+qv3rl1MQDu0P9SaB80PU11tMqb6QbwR3SgCBMwiFUw6m9BWdJ+AOOZ/ENgPW4RAlgHBjjgV/tXPU1StJ1jN835VDKmeEbuQteKXCR/KWQVe0d7DyVBJl32FiQujTC/Pj+WwfW6elwPs9jaRaL+E4mLiUJssjKDkVveU5+mhYeTML2bWSURIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4rvEA9vzE/jhzQX+UzNzxIIecWZfnCP8M/gRb4kabs=;
 b=igmlHaYf/eiJnUir5KtrcdoYhRrNZE8zMuCzsCOT47W1zSgosoA/vl/8kG/6m101q6icpZ9fOID8MtV8KBXfwzYglliIggmmZ5+rcQoNhef1HsufernVjfRLoxgRZQwB6MmMFzidkN7nOl/APH1sPOd0SThWpW4QkRJMQviV9J4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm/efi: merge neighboring banks
Date: Fri, 28 Mar 2025 14:33:31 -0700
Message-ID: <20250328213331.1498584-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CY3PR12MB9606:EE_
X-MS-Office365-Filtering-Correlation-Id: daf95052-5f48-41ad-ebe1-08dd6e4034dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z4SM0Jez8Fk/9W5CM+0CB1RtsfD6SA45/aFFQrTE6fKugBbWuPEhiiWI/Ycu?=
 =?us-ascii?Q?SigGJzikSPshCg1MzxMfE2UJn9kKUg8ojvV9Q2PYQ5MXFhecrDpIH4k+rDYI?=
 =?us-ascii?Q?Ql+nX+xcFWJeFrw9T5hKZGABmtgK4RlZOzF+SPwd11Imko4eM+AUED97ANj1?=
 =?us-ascii?Q?/tgzlGeosZpeXEFycpaAbCjh6ljxsT6BTbY8XUFcIh73s73spFp+Fxo39yDq?=
 =?us-ascii?Q?THXw5kftnLlwR1Wd1qqGCvdwp/Ss2g8+O3weuMv5VshqxcxUStiUEKUSO1ph?=
 =?us-ascii?Q?ayrCiSvzPl7sGbkEtUg611a78JxheOIHPm40pcVpCy1z/j5qRjAVaFK3VGUY?=
 =?us-ascii?Q?CqdzVEiBhjkXjabZKaPYVNbT5I3x2ueLqDHkupNXpnArgSYEzg8L/dRciPP3?=
 =?us-ascii?Q?RfbkGUfh/uEXPZjqTLE4mSTP/JokuJAgZ6jmD19T/aGMOb954uhDGhRbgD9p?=
 =?us-ascii?Q?nWOyfqSNCAr3Cc1lZ/Z4ECI4FXNnjlC0Dc3F+9BWOGYZcEaxSEs48S8+xnPS?=
 =?us-ascii?Q?uaclwVlmtDBMAmlMn7FH1FdUtZferWl34WYpylzXwKPUDWSyThQCTV3fSkXR?=
 =?us-ascii?Q?HUgtXbBwwoE9O83Qyz0Ke5ACNJvw/nMT6S3caVnGNL+3Z98cbZBUhyV4ypS+?=
 =?us-ascii?Q?0d71kRZZ3Kv8gMSPVfCPDUnWlWi3vV2AxE44kO8118+rjABkBV3UqGfCoxFw?=
 =?us-ascii?Q?DfreWOByt0QZRklgiLGegSN1JtfZ8qXN2USzllKUOVkR4c80OMxIg3Ozzixk?=
 =?us-ascii?Q?coKtDlvxBb8/d6WKm7qqLwKL2Ubsvdf4pMlh8RIMcjDQXJAk2Lb+iK9yJkiy?=
 =?us-ascii?Q?E3s1G1uyJncUyEWZTIueBVm5wrIDv7M5iFmGkULcejeRFcosXwA8W5LpNY/y?=
 =?us-ascii?Q?3/CAyLWlLowub0E/wUdcBS6H4MVN/3MvqQYg0oKPSJYyvIBHxpGU+oCFTAka?=
 =?us-ascii?Q?Hu3KhPdjj8Q52TQR5Xp6HGTd9GMjXqK10qZKsKJbLOZt4R4WdPDigSc+RE8s?=
 =?us-ascii?Q?+yai1aGceXEiDCUucoJNGuoZ+aNPMgTfpuz3aFiI9PVaXnebm6tAwZktdJAC?=
 =?us-ascii?Q?Mnmeu0OdRuivIRnA5XKCcJTcQy+DxeXv8S+VX+lVmtysTxPvMHx5prIFNN0u?=
 =?us-ascii?Q?JFR+DQe4gjPDbSYruO7qQJ3xbxGDN8URomTqv3SlDukxPUGN/WsfYrZpn4RR?=
 =?us-ascii?Q?7705u/frzgwdzpUm1guASI7yrGopNp1qNFUllXRVzNm9MSNFEFCJry9xDOYs?=
 =?us-ascii?Q?h62jRxQ/uNVQpYdFSS/+XEvyIDCX/R29088PrrSYHuGi4Zax4XajlBidC4mf?=
 =?us-ascii?Q?6lUvTc11aNqQGPQunpSLNOzFyB8P4hjTmuiKHlBJ/RSMvRSqFC3M0+iZ+UaJ?=
 =?us-ascii?Q?VHVcZvjwauAkb8/GKVTQIbPJBWE7Da0zoXYShWtxPLn4BwReERUp5qjwJs49?=
 =?us-ascii?Q?GMRyd07AkjwQ6FdzvSlY4Xdc6X8lYq7SjqCbK8ECKVk9a16xPDpb+XYmoo7D?=
 =?us-ascii?Q?uksRgMpatTgKUW8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 21:33:39.9931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf95052-5f48-41ad-ebe1-08dd6e4034dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9606

When booting from U-Boot bootefi, there can be a high number of
neighboring RAM banks. See for example:

(XEN) RAM: 0000000000000000 - 0000000000bfffff
(XEN) RAM: 0000000000c00000 - 0000000000c00fff
(XEN) RAM: 0000000000c01000 - 0000000000dfffff
(XEN) RAM: 0000000000e00000 - 000000000279dfff
(XEN) RAM: 000000000279e000 - 00000000029fffff
(XEN) RAM: 0000000002a00000 - 0000000008379fff
(XEN) RAM: 000000000837a000 - 00000000083fffff
(XEN) RAM: 0000000008400000 - 0000000008518fff
(XEN) RAM: 0000000008519000 - 00000000085fffff
(XEN) RAM: 0000000008600000 - 0000000008613fff
(XEN) RAM: 0000000008614000 - 00000000097fffff
(XEN) RAM: 0000000009800000 - 00000000098a7fff
(XEN) RAM: 00000000098a8000 - 0000000009dfffff
(XEN) RAM: 0000000009e00000 - 0000000009ea7fff
(XEN) RAM: 0000000009ea8000 - 000000001fffffff
(XEN) RAM: 0000000020000000 - 000000002007ffff
(XEN) RAM: 0000000020080000 - 0000000077b17fff
(XEN) RAM: 0000000077b19000 - 0000000077b2bfff
(XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
(XEN) RAM: 0000000077c8e000 - 0000000077c91fff
(XEN) RAM: 0000000077ca7000 - 0000000077caafff
(XEN) RAM: 0000000077cac000 - 0000000077caefff
(XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
(XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
(XEN) RAM: 0000000077cd8000 - 000000007bd07fff
(XEN) RAM: 000000007bd09000 - 000000007fd5ffff
(XEN) RAM: 000000007fd70000 - 000000007fefffff
(XEN) RAM: 0000000800000000 - 000000087fffffff

Xen does not currently support boot modules that span multiple banks: at
least one of the regions get freed twice. The first time from
setup_mm->populate_boot_allocator, then again from
discard_initial_modules->fw_unreserved_regions. With a high number of
banks, it can be difficult to arrange the boot modules in a way that
avoids spanning across multiple banks.

This small patch merges neighboring regions, to make dealing with them
more efficient, and to make it easier to load boot modules.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- move new hunk after check_reserved_regions_overlap check

Changes in v2:
- remove unneeded check for duplicates
- unsigned int instead of int
- add parenthesis
---
 xen/arch/arm/efi/efi-boot.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a80a5a7ab3..dcad46ca72 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -163,6 +163,7 @@ static bool __init meminfo_add_bank(struct membanks *mem,
     struct membank *bank;
     paddr_t start = desc->PhysicalStart;
     paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
+    unsigned int j;
 
     if ( mem->nr_banks >= mem->max_banks )
         return false;
@@ -171,6 +172,15 @@ static bool __init meminfo_add_bank(struct membanks *mem,
         return false;
 #endif
 
+    for ( j = 0; j < mem->nr_banks; j++ )
+    {
+        if ( (mem->bank[j].start + mem->bank[j].size) == start )
+        {
+            mem->bank[j].size += size;
+            return true;
+        }
+    }
+
     bank = &mem->bank[mem->nr_banks];
     bank->start = start;
     bank->size = size;
-- 
2.25.1


