Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A121FB0D3C3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052074.1420590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7iE-00030h-1N; Tue, 22 Jul 2025 07:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052074.1420590; Tue, 22 Jul 2025 07:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7iD-0002xj-U3; Tue, 22 Jul 2025 07:46:57 +0000
Received: by outflank-mailman (input) for mailman id 1052074;
 Tue, 22 Jul 2025 07:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sxg5=2D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ue7iC-0002xd-IS
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:46:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2406::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0940cac3-66d0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 09:46:54 +0200 (CEST)
Received: from BN9PR03CA0722.namprd03.prod.outlook.com (2603:10b6:408:110::7)
 by CY8PR12MB7266.namprd12.prod.outlook.com (2603:10b6:930:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 07:46:50 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:110:cafe::58) by BN9PR03CA0722.outlook.office365.com
 (2603:10b6:408:110::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 22 Jul 2025 07:46:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 07:46:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 02:46:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 22 Jul 2025 02:46:48 -0500
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
X-Inumbo-ID: 0940cac3-66d0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSx3vZ5PyojecJvjsnm8lPwvYuLWaEMmoKgYtPgkmUT2aGQW61/OhImDSRVUh4taof+3/ngKWWcXWe++8XZhQRDbalKrgag+6bpUNx3DdwoEuSNbtz/7o7RsCcNoFd1ec5Nfi82TjI+ziseyVrxo8mLxQcfVBrzkk229BiYg82eGfUK9K1AYK5VlnVdyBNXBw+uElNT+0/eP6EA0sOqgEw0rQzLAm+m63IfNtgDT8ClyJaBwxEZy7JWtqnoTmgSpN5FedsSIui1SCHLY6U0AfyYhPZuSVOWqeb7lE/njir1Mk0u3/gTEHJgOF2brRxgxocW8SvYkVbo/ikbDkhCgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiBxvP0ulKFVy2knXstA/RqmX83330Ik+q0BkaDar1I=;
 b=R3vtW0Mjm7A4D8dorVu60L5om9roRgmGx/qcUmvNJjU2DhQpWDk48ruEmtHOhP0zmotUok7kQS+CJdOb5yk55m9MDZxLI+SLEWvmzEk1UdzoR7+chhusKVNwX3Kqzh6dRpgVDfIuPwIHLk7cTksZLr0AonQ9/ayp+DZR4EzvRcKXmncp09lH9/uL1jHM9chMRRw2/MvRnoXBfgLx4Bm1EaS+4RKc99pDxcgv4agYFQ1hVO3BvCb6KC7HNq9DAHCfEpV++UeFmVLr/PCYcLM0vxnSzhAZBehgveSFUrj9LWV64UM+28c2ohhFQUaTjKh+PjGC80u0QNDjzN+uolyA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiBxvP0ulKFVy2knXstA/RqmX83330Ik+q0BkaDar1I=;
 b=XHMVy45EBvYI2RC8m9RkTegEFAI0e+s+pPKq1BSrPYA7wDcH+l1EGVbPO2QkvkmA26/s18eTSXcAmdcTIxO0dim8Cp89fMYcMvwkMYvyyYDc2m1ZIvmlDdH5KKeftAEbp3pMwcWM0OYWjuxGvAwek604X2rSVSwVETjjI4Ekrac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] device-tree/kernel: Use memcpy in output_length()
Date: Tue, 22 Jul 2025 09:46:45 +0200
Message-ID: <20250722074645.19029-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|CY8PR12MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6135bc-08ec-423d-c36f-08ddc8f3eadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I4rNtx6GGj3N0ywfHVMn8c9hPhWvlm78JGUg1UpFyPa7YyYWDrmhaD6MDFfG?=
 =?us-ascii?Q?0MYktLOmLfFusuiduX/Ftyb+jBpnI+aPVIUCuQjOC3v61Khip6QbMuwx1RW4?=
 =?us-ascii?Q?hbUsEiDfngwtlxdNSbE+o7cDEQpbdK0MQgiKfgi6xtNPJ2p7NRvCOd3qrk/m?=
 =?us-ascii?Q?tZF40CDn/wruv5Tr5pIX1uJIsIRhVKoZbfeUgAUTVo+64WoLP1kODPT6zN23?=
 =?us-ascii?Q?NAJNDq6DkeoheLyvU3muCVNh759fejh5G4FgdJCTpExbMPNcE2iHV3emhUt6?=
 =?us-ascii?Q?/vTi0nA1998+A4cp2tL32+YfFbt6kCHcdAVqUvyhJnEbJLV6OWTqPxDwr9Sm?=
 =?us-ascii?Q?2xPre5N3Bnx06wUeYeL5ho0uCUGRVTbuORpdbKzkdKSSwStHrL/4d8B95zCH?=
 =?us-ascii?Q?POE/11FPLLg/h6oU7gU8D0ON8quPRbQ+wfK8LWeXlWNq6osyc30xfU6heuag?=
 =?us-ascii?Q?TmR1+4P0HOiM5gdkC7h82OIC6K7XJqKx7J00A2+NU3qYThymIAiaCiCYMh13?=
 =?us-ascii?Q?UG/v8RNeXO9k9MJA0Gz4bf8lyDNnHa0PjXS7u3g6eoQ/LnKmi9aIdZbCfhsX?=
 =?us-ascii?Q?W+zBIBLQDfS5QiPVmM85+kbkp+6xzmlaw4/vmz/V0M8crbVXrRXsclkElmEX?=
 =?us-ascii?Q?4b29gYomUpvc9Ib7k/gB9r6wHgd+D9hilBgvNYQilVwxUx+NpOG8bI7BwsBk?=
 =?us-ascii?Q?iytpu62k7PZGTz2X0StyBficppnvjdpmevmYWQRQP+7RJhiMIDfslCeV/dSz?=
 =?us-ascii?Q?Z2sBo1WPHTnReJm3BFJ6+5TxtU6hXNCaoMZ7B5egfXdwzbMTCKTWemEt2T8K?=
 =?us-ascii?Q?lDvTAjeewmb6D5iwH5wkE5B0F0djw1acOhibLSpxwS5TOYo1EnT4cF5n5W63?=
 =?us-ascii?Q?HqkeeXUAtEzB0saW8Jh7im6JYMyr3DGTAoYk/3zPuVA4XzIVc977fAoRwXSB?=
 =?us-ascii?Q?XOo/BdzAspJt9Zij+MJ5LbaUoNew9jYhvYOA9Zl4bDoka2pqNcNUU5jarojq?=
 =?us-ascii?Q?CuCTYCGRLzpVqLy/nYH/rtRnVgN+AeQtPpn684AIgJXOL03vrpAcU6mVbrX9?=
 =?us-ascii?Q?gdtOvqpsejkiXl+Eh3Z8qHpZkuyc019lfMMLE3jRS2OzdTscqbFQWU8N/rua?=
 =?us-ascii?Q?gpASU5vH0uszRGH9WAPqZOKxHgqKDB3k66QcAyWbj2jwF3AM1oVhIODbnI1t?=
 =?us-ascii?Q?kar1Vyb5ULgV9SjzNlQu87lBXsXzl1l1z9/SzW7+DmefdzGVbM/1vqPTbi2/?=
 =?us-ascii?Q?hotGQTdu2Bc+M/IKuk5gru0JgzQs6vw+i8jut1io3i/6wCAth+gOmEN9LG3v?=
 =?us-ascii?Q?PIJzYLETWz8ugxatD5J61/6SK2HZ1WkIHIVgHXxN9e+PbqZeq5YmzCdrmwhI?=
 =?us-ascii?Q?7qRwp7CwImq2Sh5c/+fZUbrGOCK8O/7YvyGUJvErqUgyW3t9uKWPbQG1MRAw?=
 =?us-ascii?Q?RAZjB9anQ86xZI0R7GxVDQklR5Dpl9L8UIRHOhI8yA333Qw090cKtb/cQuVd?=
 =?us-ascii?Q?ibFafjmBXDobMH+1j8kBowLmFwONmJLc6tBd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:46:49.9189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6135bc-08ec-423d-c36f-08ddc8f3eadf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7266

Trying to boot a compressed kernel with UBSAN enabled, results in the
following warning:
(XEN) UBSAN: Undefined behaviour in common/device-tree/kernel.c:21:12
(XEN) load of misaligned address 00000a0040f89867 for type 'uint32_t'
(XEN) which requires 4 byte alignment
...
(XEN)    [<00000a0000529964>] kernel_decompress+0x2bc/0x5bc
(XEN)    [<00000a000052a354>] kernel_probe+0x6f0/0x734
(XEN)    [<00000a0000528714>] dom0less-build.c#construct_domU+0x188/0x9d8

If &image[image_len - 4] is not aligned to 4B boundary it causes
unaligned access which is undefined behavior on Arm. Use memcpy instead
to be safe.

Fixes: c1be0b102e0e ("xen/arm: support gzip compressed kernels")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/kernel.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index ef393182b691..28096121a52d 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -18,7 +18,11 @@
 
 static uint32_t __init output_length(char *image, unsigned long image_len)
 {
-    return *(uint32_t *)&image[image_len - 4];
+    uint32_t val;
+
+    memcpy(&val, &image[image_len - 4], sizeof(val));
+
+    return val;
 }
 
 int __init kernel_decompress(struct boot_module *mod, uint32_t offset)
-- 
2.43.0


