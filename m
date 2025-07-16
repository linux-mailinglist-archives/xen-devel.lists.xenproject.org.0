Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38582B07F7D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045783.1416054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aG-0000ye-5E; Wed, 16 Jul 2025 21:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045783.1416054; Wed, 16 Jul 2025 21:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aF-0000rn-GE; Wed, 16 Jul 2025 21:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1045783;
 Wed, 16 Jul 2025 21:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aC-0007F7-Tm
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2418::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7333d3-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:30 +0200 (CEST)
Received: from BN9PR03CA0804.namprd03.prod.outlook.com (2603:10b6:408:13f::29)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::10) by BN9PR03CA0804.outlook.office365.com
 (2603:10b6:408:13f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:13 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:13 -0500
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
X-Inumbo-ID: fa7333d3-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oApQOS1w7G4m1Xk9M4e5iaxjCX1S5w/0u5ss/FcjCq7PriDs+GE8XXdd1XvWWJKqlWxa6ZTr/0S0b/LZEr2CDSax8Wv8ZlwJBcqTuIIEr1DbYFG7/EboXToGm+rDpyounPjTm0utO9YrcyndNWI5yQrjrK2fGSMmWzOe81D4YgZ9tMA7DmqzwlkZlw4DUZ5qks090IMXMyRITTKcQ2H1aXXixxDchNqxIIWeUjJZALd+ePlYqTDH2kLwGXlRwXFvUlmWUclxl8H46Bkk7H99hjhmLXCBwKIfi3BbrTF6/eZxneBVWP1CRkxM6lleqpoR0N1GINK+H2VMVBF71aE+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXR0t+pBKl3PsI0yc4pZiF7K0QaYfE7hIDcuE/EBq/M=;
 b=bExf+k2UNxAoX9bA4d+EI3ezksy8ur1QfJcsCceu5fHLutHj2VnxKQRvzUbEtFE0i83ELsp7Q8NWSHtsGsv2J/wLuMXFtvT5wHpL7JkQAI30a/wtNoLv5hxM8Te/GIIOmn1sOtySvmAU7GN1b/e+7nbgTTaVKVBh9vG0Arl57OaZMukRkWZHGtMYOWWnsTw0EOjMKgMjgh67VD64+PVwb2dLkxy6BoBU23JH7msQ60tw4JIiK36G3wMm9jIAnUqfoOma6wzozGsQlwq6Fr6m5RProfX88S7mDBHEp/pOVsUmxvX5WLxToKRWB1YYelIqZreTS1fG47ODBGMAUKzZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXR0t+pBKl3PsI0yc4pZiF7K0QaYfE7hIDcuE/EBq/M=;
 b=HHkAAdFR0xH/mSjH9jJdHr1nyQ56AzAgPUyc5sl1K41dCR0GHBvzffPIK9/k/jxwPvLWJyb+nZpSReizgmLiw1pZZNPZcB5NCoZYEyTQuzlbpLoVE6CeIB5n3HC5RsqeNxg/mIjVXPwvegrDOUVQ+EpqbS8Psj725fwfi4d9pow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 07/17] xsm/dummy: Allow HVMOP_get_param for control domain
Date: Wed, 16 Jul 2025 17:14:54 -0400
Message-ID: <20250716211504.291104-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 97697a27-6c58-4bd3-a77e-08ddc4aedbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Mn5H3JVgQPmvmh9vVWgvJNJGEzmBm8XXHB/qnlZ5lTl+W7jGtwNfMpK1WEd?=
 =?us-ascii?Q?5RlK4kha2gXYB+fQwiC1mP9U/F1VqU1GROs+uli0XBr43dBiBRh51PwvedvN?=
 =?us-ascii?Q?I4ZvdKcwUrL3Jfy4clnDhPoQtXGMmEt8OJbCEKA9e5Pu01c6HHhszd+OkHMP?=
 =?us-ascii?Q?6aqAvCWK9NDVc6sybK/+DiaFQegnUhpbaI18PWKU01Qfrkm828AD1TIzhx6G?=
 =?us-ascii?Q?NUi/f7E0sRRYy1391gCeyLwvwI+6ZMUWdWH3UyCgbXOQAKK4eMZDVuZaWG3c?=
 =?us-ascii?Q?802OxtWnLsY58qEShZxSlIgZBV59eLUfwH0xisjc6UMB/SyDWkPbdi3VkSD5?=
 =?us-ascii?Q?R9JX+xy66mnL4bp+jcSV9HxCvHL6uDymhSIqcrzq1gqveEC0Up4lvnKNsaXc?=
 =?us-ascii?Q?CmfjoNZOBh/BPUPE316DDpfgypfxWxqAA5QwA+biAY2P7LDNUXT+1PxQ1XVz?=
 =?us-ascii?Q?BaLQXPuICBoLr3JGI6UFKE8oFDEjrUlSwa6ToFE9GQnVgH6Fl0Ic6eL+hjLm?=
 =?us-ascii?Q?vm5S7Bhv0BpQRVzEGEKbGTIBBozujM7dOBDFax297eCUKgKaLto+7haX4JzO?=
 =?us-ascii?Q?S8XxvceQbPITW3rEJRx3VjV01Vo+OQPMxdVPcPjTku25ImgUo2ib40wbIV/T?=
 =?us-ascii?Q?wuLPzoNOIYTKuuGpAeLaue+1dnTc/u1okYfGRehLW6473HifutI0BiCLJ7g+?=
 =?us-ascii?Q?t6xjdIWikKQXaWLuRIZ0j3Q+612H7NNG1LVmfa6jA4r2+fLnl4TTEZpvKuzn?=
 =?us-ascii?Q?4U5Gr/Mfqzn8Zs2X7dVxM7g2EoZuEi19c09eb/6/RfidcnFyxU4hqFVs7bKy?=
 =?us-ascii?Q?eoZ47GUnD86Z0Bl8XejaV3dS9XwZmU0X+OxUsPBB5rUfZAcEWD2UQtC4vTat?=
 =?us-ascii?Q?SaHVAcQlbgdcZR5hM4UjKFTsDskPaXWbanw1FYjI+saVoLrCFzgfh68oTWP5?=
 =?us-ascii?Q?JYzy6FmXssD5IXs9CEiZF0VglN5twtTkHWrVDLx2rJc3Hl5K5cwajyCURfbH?=
 =?us-ascii?Q?EwmjmgW8DrbvAQIzWT0M/+j85uZPxt5ksniEVg1MdTBQxSG4HzAEJS755G5v?=
 =?us-ascii?Q?hrmmiwGWTDpaH7Ds07MxxnXvZmvQ9oDNjUuPB6tUJy6o8Vbte17ErV+wrzpy?=
 =?us-ascii?Q?Cs5kfWQ3uJs3oj1wnPXJD0QM0/uLxNb5Gp1OLV2uccDfVW6RAB45NtndkeJr?=
 =?us-ascii?Q?PE9esYlp8+uI7kawiXK0Gcs4J0auyTVZdISO5ZJgBKWIaaiX3zlf+dSFriAY?=
 =?us-ascii?Q?TQwqjGsQLCq5OqrYTLHRzEuwhzoMWDz8tQzGwqY7AhyFZZa4xnIeSkAxdmOK?=
 =?us-ascii?Q?KLSj4kecLqN5LcTDbVBOyAnDvYhtPreJZPUsUA1XbOou2z/iGzum0TucRVRY?=
 =?us-ascii?Q?Rrs2DDzJfX3qkp0KMzLEiTlClNPKngKwYaC3MIfJJJxduQAOIMrM4oq930d3?=
 =?us-ascii?Q?vhL9cY/zN4RssRZzvv7P/BBC7qU6HmY4ct8IIQ17XubZuXIFHgEAsuNJAoyL?=
 =?us-ascii?Q?Z3wSRymbVJn9cSGoJXUPohUx+WY8cTF2cTfW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.0167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97697a27-6c58-4bd3-a77e-08ddc4aedbfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

The Control domain is denied access to an untargetable domain.  However
init-dom0less wants to read the xenstore event channel HVM param to
determine if xenstore should be set up.

This is a read operation, so it is not modifying the domain.  Special
case the HVMOP_get_param operation for is_control_domain().  It is done
in xsm_hvm_param() because xsm_default_action() is too complicated.
HVMOP_get_param should be allowed for a domain itself (XSM_TARGET) and
its device model - src->target or is_dm_domain().  It should otherwise
be denied for untargetable domains.  xsm_default_action() doesn't have
sufficient information to identify the particular operation, so put it
in xsm_hvm_param().

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
It's messy, but I couldn't think of a better way.
---
 xen/include/xsm/dummy.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 4d7b1d61eb..896ebee631 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -621,7 +621,10 @@ static XSM_INLINE int cf_check xsm_hvm_param(
     XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    /* Special case to allow init-dom0less to read HVM params. */
+    if ( op == HVMOP_get_param && is_control_domain(current->domain) )
+        return 0;
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
-- 
2.50.0


