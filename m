Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DFA5D094
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909053.1316124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5yx-0007Aw-Ur; Tue, 11 Mar 2025 20:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909053.1316124; Tue, 11 Mar 2025 20:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5yx-00078y-RW; Tue, 11 Mar 2025 20:13:43 +0000
Received: by outflank-mailman (input) for mailman id 909053;
 Tue, 11 Mar 2025 20:13:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jJT=V6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ts5yw-00077U-Sq
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:13:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52f385d6-feb5-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 21:13:42 +0100 (CET)
Received: from MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::14)
 by SA5PPF8ECEC29A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:13:36 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::82) by MW4P221CA0009.outlook.office365.com
 (2603:10b6:303:8b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Tue,
 11 Mar 2025 20:13:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 20:13:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:33 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 15:13:32 -0500
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
X-Inumbo-ID: 52f385d6-feb5-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfE2ZnPKwkoSt0uFeWVjJzYppwZ9ua/TU7o8phFlT0MjNdOjrv27kOnW8R01gSJyoc9VdjeGbdLI687VZlRh6RFNaA8q5NoizEpIZs4R6l14tzocNR2NckNmcJmgSW7612mez7CyC1rMOO+v3vFAw7JJZdIZgoe6mER6oc6bcXn0zU25rDLqTIdrHFMAqZ8WsIMEOXz8reCsz2tjUWYWto+teyFi3spMQEZdXBHKblLrlwJiescam6xXUgAHN2k3I3493IbTXq9hmN9jmcS2fQ+g00PBp9zBA3m7q06xHfCtAtDVOtn17kX2pummTSK19OHyOYYUg8rIQ6UCF1Df5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRf2RtEaVioThnBIMaRfEHbIYxxzGi+1Zqsr/DNa37w=;
 b=WecWrxtmAeEsU2rG1cmen3+oiD1qK/rhH3A954r0CkDS9u/EqGhKJnrPDb0w4vmbwx3L+l3K+DL/R8cDYDopQ+zISZZI48/+lrSSNMy4Uy3MMluE8qI0cJxS3C3uFleY6kUb5UpPkLORGEe+s3zXEzZ4Tam80nNYC5p4dojhgsjikMBf7inQUXEfCSzRndNr9szUvWRUJkm26IBDuCn/m5HMtvuMcYktWs7fRYlbay9o9ZLRYD+DmsCaElwU6/BKXdW646617pEr150M7eBZczXTrVQ3KgbgnCTFTjIZGJLZqM3SclIgcUD6im+UsGa+7EeAlGN9aNmAc8POxY8B+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRf2RtEaVioThnBIMaRfEHbIYxxzGi+1Zqsr/DNa37w=;
 b=aZtOYOSMIYcuaTH+lr6aWAd9DQWq4QW6WbfRtLqwRC4cmv+fJq++hnk+6KcZJSA/rBB30KjxiormmXQW425ADBQKZt9PSPBNNLHy8BKfSR5z4UGReOSwzdYual3DdEv97YjS9qJzEew014NGmmxNsRSGgddauryKNm+dxV9geCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v17 0/2] PCI devices passthrough on Arm, part 3
Date: Tue, 11 Mar 2025 16:13:26 -0400
Message-ID: <20250311201330.365499-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA5PPF8ECEC29A9:EE_
X-MS-Office365-Filtering-Correlation-Id: c3332fb0-b731-4853-fa13-08dd60d9339a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVY5VkdJVVMyUXhzekhrd1hjZ1ArR3hneXp1ZFV3eVVNbzk0bXVFeUZlRkho?=
 =?utf-8?B?OElFSDR4TlNTRm5SbElpTWVIcUJZYXI2dWR0YTNvZmZvcm1Ob05rRDR4aHVB?=
 =?utf-8?B?Sk9CSnRTTGlWVFJkSmRkdElyRDNnOUZEcVM1REVTUnhadWx1ZDMzYzNVTnJH?=
 =?utf-8?B?Um52QWJxVExyWTRMTkIybHVia3NVS0ptK1B2cGpPbXcxQndlWFJYTWpVbjlR?=
 =?utf-8?B?TVBSdFV5TGZ2S3FweU43MGNoUms5Q0F2UjJKOWVRMDdWdjZhM2F6UktkQ0Nu?=
 =?utf-8?B?RS8vckhBQWREZDlOMlFIRjZuUmVvakRtNmhqVGdRWjhBNVpPVlpadWEyTWlO?=
 =?utf-8?B?RGkxWi9DQ2FQdHg0S2NTMkxYMlZ6NFFLMDFjT0lFSUNPczVOZVN3UFlyNTFh?=
 =?utf-8?B?aGw5Wk1udENWdTk1T2xXa2NCQ3ViZDNBbHFET1UwSzJ2dzFrUmVqR1QyZURv?=
 =?utf-8?B?UUg4QUtOb2Nack5JTnNWWTNNOUswV2swMFN4bHdvUmg2N1dHb041VTY1bEht?=
 =?utf-8?B?aEp1VllYS3pwZWNXMFVhdGErTzI4S1d4ZFVvZnNqRHZYQUhYenRtRWN3VjJR?=
 =?utf-8?B?Wkl2UXpWZW9qNXJvZTNvaFArV0ZhM0hTSCszaVhEU2JPKzZkOEdUUWZBWVFS?=
 =?utf-8?B?eC9pRkZXeHhTWWovTjZoelFUK2owMnNLU3h3dGxIUk1iUFJrRFk4STA5MTEv?=
 =?utf-8?B?WHB4Q2k3UjYzYisyQXIyc0hOanB3OXEvbjFpdUJjZHE5ZzZCaEh1b0F3cG9t?=
 =?utf-8?B?UzFteGtFdElyWVI5empOZEVjZ3c1VjEyWmN1cmpNR2ZnUk14STd5QTZsZkFz?=
 =?utf-8?B?MDhJZW1KVHJwKytQWU4xa2x4UURPeGxLdmk1d0hIVEY4YWtQdTVLSFJsekMx?=
 =?utf-8?B?WGFkRVM4eU1Wd0lteldFYmlLT2sxQ3dINWE4eVo0bEw3aU9TSGZJdlEzNHVs?=
 =?utf-8?B?ekNTMUIyT0o4dXMwbEIwTGdWYVNMTGo0TWZZZHg5U2dnV2JaRWhNYmpFM3dl?=
 =?utf-8?B?SXJ3MDh0UmFjN0N6R2VURmxrUDVKZEVkVkFkL1ZpUHZ1UlV4aDhKU21qSS9S?=
 =?utf-8?B?UGNXUWZxUEhyVFlUMVNqdElCV1RyaWlnRmtZcEJobXcyaUppKzV2a293UWRh?=
 =?utf-8?B?VjlablRTOUF5NkVqS0pNMjlRcGk4bGhiTkFKTFFoWmxmS1JxTkIzekF4R0xM?=
 =?utf-8?B?YkwzNm1MaStzUlRXalRRMUtHUjc2ZXJ6V2QwbVlCZjNGYmFnUXF4ZnM2STk5?=
 =?utf-8?B?L05pOXZITnpBZkpUZ1NYbHhjcGZsR01mb2x1Y0l5a2VJVFRuNkwvV1lLd3Yw?=
 =?utf-8?B?MXBmL2R6eGttNnkwVVVFSk5NY1JSaE90T0FNRitEbjRDOXhuSlV0Uk91a3Uz?=
 =?utf-8?B?THpRZHdpbmtRR0dzUUNvdHJUbC95dXRmZUZkTG1iZ0xUN3NMcjlpWDBkYzdD?=
 =?utf-8?B?V0g0bjdadTdieEh3NXg4Z1B0RFFtN3RYV3FhbmFBUVR3ZWN5anBtR2pOdHk5?=
 =?utf-8?B?d2NuWXpLeGc2d2J3Vlk1emVLQkhwVzdtWDIreHUvK0plL1U3K1ZUeCtpd01u?=
 =?utf-8?B?TEVQUGlsVnYySlR4a0xyME51bndqcmhheVI3S0t1Q1ZUd1FpVHByOW1PbkFF?=
 =?utf-8?B?SFVzU0k3M3hTSkJuamcrZExMVlY5VTRtczExbXh2ajF1NzNWRWM1QmJabHlq?=
 =?utf-8?B?M0lkQUlrclp1OFhBTEwvVzhDYW5HN09Sc2U1ZkRpNVFONWt5TXJqTVZ2SkZR?=
 =?utf-8?B?WGwrYXBRbjFnZWNSMEZWNnZUelVPc0RGQ011Sk9iclMvWWxUemtscDlzdWN0?=
 =?utf-8?B?VVU4MDhFNG1vckoyZCtuckMreXNGS2p3Sk9teHgvbUg0cGV3Z2g5VXVBVjda?=
 =?utf-8?B?OVVMSVdWdWZZVThCWnVaMTVxcXl3RngxSndubTlLYzVWTitHNmZzRElrU0ZI?=
 =?utf-8?B?VzkyWmVTUDcwYkV6ZS9Lc3c3eld0dW5wQVYwUG9IZUlCT1JRVHdHejlOUkNx?=
 =?utf-8?Q?b51dET9Bc9VCPqq37WEcG541/Ic/eY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:13:34.4879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3332fb0-b731-4853-fa13-08dd60d9339a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8ECEC29A9

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

in v17:
 - add ("xen/arm: check read handler behavior")
 - drop ("xen/arm: account IO handlers for emulated PCI MSI-X") as it
   should wait for future work
 - drop committed patches

in v16:
 - minor updates - see individual patches

in v15:
 - reorder so ("arm/vpci: honor access size when returning an error")
   comes first

in v14:
 - drop first 9 patches as they were committed
 - updated ("vpci/header: emulate PCI_COMMAND register for guests")

in v13:
 - drop ("xen/arm: vpci: permit access to guest vpci space") as it was
   unnecessary

in v12:
 - I (Stewart) coordinated with Volodomyr to send this whole series. So,
   add my (Stewart) Signed-off-by to all patches.
 - The biggest change is to re-work the PCI_COMMAND register patch.
   Additional feedback has also been addressed - see individual patches.
 - Drop ("pci: msi: pass pdev to pci_enable_msi() function") and
   ("pci: introduce per-domain PCI rwlock") as they were committed
 - Rename ("rangeset: add rangeset_empty() function")
       to ("rangeset: add rangeset_purge() function")
 - Rename ("vpci/header: rework exit path in init_bars")
       to ("vpci/header: rework exit path in init_header()")

in v11:
 - Added my (Volodymyr) Signed-off-by tag to all patches
 - Patch "vpci/header: emulate PCI_COMMAND register for guests" is in
   intermediate state, because it was agreed to rework it once Stewart's
   series on register handling are in.
 - Addressed comments, please see patch descriptions for details.

in v10:

 - Removed patch ("xen/arm: vpci: check guest range"), proper fix
   for the issue is part of ("vpci/header: emulate PCI_COMMAND
   register for guests")
 - Removed patch ("pci/header: reset the command register when adding
   devices")
 - Added patch ("rangeset: add rangeset_empty() function") because
   this function is needed in ("vpci/header: handle p2m range sets
   per BAR")
 - Added ("vpci/header: handle p2m range sets per BAR") which addressed
   an issue discovered by Andrii Chepurnyi during virtio integration
 - Added ("pci: msi: pass pdev to pci_enable_msi() function"), which is
   prereq for ("pci: introduce per-domain PCI rwlock")
 - Fixed "Since v9/v8/... " comments in changelogs to reduce confusion.
   I left "Since" entries for older versions, because they were added
   by original author of the patches.

in v9:

v9 includes addressed commentes from a previous one. Also it
introduces a couple patches from Stewart. This patches are related to
vPCI use on ARM. Patch "vpci/header: rework exit path in init_bars"
was factored-out from "vpci/header: handle p2m range sets per BAR".

in v8:

The biggest change from previous, mistakenly named, v7 series is how
locking is implemented. Instead of d->vpci_rwlock we introduce
d->pci_lock which has broader scope, as it protects not only domain's
vpci state, but domain's list of PCI devices as well.

As we discussed in IRC with Roger, it is not feasible to rework all
the existing code to use the new lock right away. It was agreed that
any write access to d->pdev_list will be protected by **both**
d->pci_lock in write mode and pcidevs_lock(). Read access on other
hand should be protected by either d->pci_lock in read mode or
pcidevs_lock(). It is expected that existing code will use
pcidevs_lock() and new users will use new rw lock. Of course, this
does not mean that new users shall not use pcidevs_lock() when it is
appropriate.

Changes from previous versions are described in each separate patch.

Oleksandr Andrushchenko (1):
  xen/arm: translate virtual PCI bus topology for guests

Stewart Hildebrand (1):
  xen/arm: check read handler behavior

 xen/arch/arm/io.c       |  2 ++
 xen/arch/arm/vpci.c     | 43 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 26 +++++++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 ++++++++++++
 4 files changed, 73 insertions(+), 10 deletions(-)


base-commit: be59cceb2dbbea3815f35f6982aac6d2ab1b10b7
-- 
2.48.1


