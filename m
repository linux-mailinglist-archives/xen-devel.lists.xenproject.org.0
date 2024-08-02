Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444F945DB8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771053.1181635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBZ-0002yq-Rb; Fri, 02 Aug 2024 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771053.1181635; Fri, 02 Aug 2024 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBZ-0002sI-Of; Fri, 02 Aug 2024 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 771053;
 Fri, 02 Aug 2024 12:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZrBY-0002qg-PP
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:15:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2412::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d851c910-50c8-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 14:15:03 +0200 (CEST)
Received: from SJ0PR05CA0158.namprd05.prod.outlook.com (2603:10b6:a03:339::13)
 by CY8PR12MB7490.namprd12.prod.outlook.com (2603:10b6:930:91::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 12:15:00 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::a0) by SJ0PR05CA0158.outlook.office365.com
 (2603:10b6:a03:339::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.7 via Frontend
 Transport; Fri, 2 Aug 2024 12:14:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 12:14:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:14:58 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 07:14:57 -0500
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
X-Inumbo-ID: d851c910-50c8-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdVhNL8i0aqkMGAD75hA8z8aEZGs3/ynFmkimqNcwm1EkbpjV2jRJLC/4NfR22yQuV3zn8Bw/LudSMBYGIQf1Q2boEj1PxGyEYubC41867Khlj4EHkhqYawiNfoTRC7QnxJ0mAaStCPo/WpUAvraep2QL93TbEjrvLPVucDFSbKk5wuOoB0W732gKk1L1/BovzvtbT8JiAEYiFeCdFD11esF3k5i48kf6EAwCzjO0bLNdZXwns5sIjdnUSToOQF5MPRdpQHHrLyUVMMwFRhOL+e8336SKko8J79+IOldrPPLAsTFH7NOCh6DKOD86EpzsYZZm6gAg6V1YUKSKmgzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbeaJd8GtmoVpwkrWBrV6r0T4S0kHTIYvztCQ94vIfY=;
 b=QdpPD0RkyWYSCU0ZwniiqStn0WmvqMCIkVmdLTJ707fv3smjtsJ4xS5IAhyjxRwOz8ULa/jmLJS3wIL4B3uGYGxM/NmpJJedXHd12aFidAMIPVA/SQd9caVny/bz1Frcj69KmKX92On8em4x7gBxregiwxrIPCSQtACrPyc7IqwBQGl6facvjWdnLjkrnoKQWldA9cFbNQ3VJ0scm7Vz3YTHBRWcdzaeD4OHTmU2lxjMKROmOHctQbhsZkf8gDeXN2fYKe7Qx93+Lv5ZOeayN0fVGWX8JVb0m8PqEgfiQcirmP/OfMZAA26vRaYHmSPdsxbTj4xZ8DQL8Sazuglo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbeaJd8GtmoVpwkrWBrV6r0T4S0kHTIYvztCQ94vIfY=;
 b=0Vm5//ZoB72pBBoszV4+sR8a8RIsljr87+fG5V2nZso6x/YEOYugiU1ukDYj8lYe+1bAB2QpXO+30bry9srN05WgZekhJ3r03bayIV8vrA6tPeaGWNG9CNs6M3VNtLBhlfBVCz43A/w/bd+wuT+OEW8hfMkbOCAB8fL888Ezdjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 1/4] xen: arm: Add an empty stub for update_identity_mapping()
Date: Fri, 2 Aug 2024 13:14:40 +0100
Message-ID: <20240802121443.1531693-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|CY8PR12MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7474f087-44d5-4db6-03cf-08dcb2ecbada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hEqxY7WTBg8wQv/L0BJKuMNUJQLJNZ8Y6F/1+p77RvqWs8Xt3mUOIvloYueP?=
 =?us-ascii?Q?w+V+uUWhcsSwCuCV9OAo6BuIGnOeLoNRymvMlJtzvRrM9wuV7Ng+D3376k8u?=
 =?us-ascii?Q?2FjuN7pwGkJhWYe7zpXUQ+WLz24RGs+Kcw8QC+J4Nj0p+cZPZHGQSgZHD8W1?=
 =?us-ascii?Q?JlOzh1TZDeIqySOC3TUVwacUqVZA1mpmMOwazzlApZ4H0Ggx4kjMgS6RTvHi?=
 =?us-ascii?Q?vmCS9pPHLUM57V0EHIkaS1bxx+X6KTIstoad4a2H9HFL01YoWNOqSczcPNU1?=
 =?us-ascii?Q?g+n/PgR08C2DbEzd1uYTUBdV328XNWDz01iVUHy/L9R7ZMAGpq80UDbpYlGo?=
 =?us-ascii?Q?EVmAl7+PL7lYM3G+2bju+VxBCDZ1eOsjzgnTG7yjwX49sjmq34BnfkzYuy6X?=
 =?us-ascii?Q?bbrh/BaRLfKm3dDrOFHHdQVxvbYF2T1IB0nYCNQJ7siS0Us6o6AQvI+4CciG?=
 =?us-ascii?Q?fZzlbXqPCtWMu9fFsGQJWhqr9S+b7bvL4/AEsCyC6vlKFUDRJl/zoCm7+1Kq?=
 =?us-ascii?Q?Rtdkmw3HtGc0dX11oocrZM8uZJqgYlUovtNDnne6waRur74S8YpxT8+ltY1u?=
 =?us-ascii?Q?AZBtkgZcynWxz/5ROnzxBwMFhLnikcEV/SyTA8hOD/GcdEtYD7uxujhoXvMK?=
 =?us-ascii?Q?CU6jl8ZNg8DGhxP7nKQXDpimigfhyhOCibHaAknRYnx5p7WhTj9zTtKFUybv?=
 =?us-ascii?Q?oAbCFOXki/1i7pp4RQVwBWm8nxOz/1Y9TYpxgiS7YPSJMc8Ixi+nS68ONqIF?=
 =?us-ascii?Q?fXrGRlzmpU7m+uUraavc4GDtJczrDcAK2usalR6okL/vKcOJ8z05frRU0evu?=
 =?us-ascii?Q?LzNQXkG4f32l7lIwDKXCn5dq1lo42owmZbnSls+CSRG3tVC1AcZlWWhyMxEB?=
 =?us-ascii?Q?K7G3DRNdN2h4micUuYTjgXSo89Ux196tc+HbUd9jRs1jnCTDZ56sSd4dBrKC?=
 =?us-ascii?Q?af87M72OwJ3W/YzWVFqzw4kIyhQT8L80DZhUxqpXcD0RHnr1X+89jGzoBnul?=
 =?us-ascii?Q?nHdeYjjxFtMxyrn7yT/iV9rLidi1Yt78w85Fg+SVO9tIgpPH9irTqq0KeiLc?=
 =?us-ascii?Q?M4mvtukGXOL77ShpwWiQ2cb1aIPCmhfwYAg3n6/5ICGzkAnY0WgzKpwuxX9j?=
 =?us-ascii?Q?VhcVCptoISA3pWF0LQb64N9Tbpahjv7boTD5ulJ8RaOJC1isQJU/p7mszyFt?=
 =?us-ascii?Q?+oQqchqdipayR3IuryczWiuMu2RSRzBgSvIlsz0dOEpCg/Ngv/BMwwMGThgB?=
 =?us-ascii?Q?+4xOK945gHawn+MO2UTvA+eGoX1ObxbCnOg1caVTHB+//djNXxDsh2UG9rfn?=
 =?us-ascii?Q?VOZxpQgpPEyqmyugNn+J+d6fJ3I2SjveLL+8vGkJkLlOtPihI/oHp9Vudouq?=
 =?us-ascii?Q?l1qVMo3ZNlhtkrkEl0bQqlM6CEnDJqCoKWJs893K+6oiIoNIsuJrpKSkAAUw?=
 =?us-ascii?Q?EqqIlSSuOwFfTGXio0ikvv462erBUhDq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:14:59.3987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7474f087-44d5-4db6-03cf-08dcb2ecbada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7490

This is in continuation to commit
f661a20aa880: "Extract MMU-specific MM code".

update_identity_mapping() is defined for MMU specific logic.
It is invoked from smpboot.c. Thus, we add an empty stub to avoid
if-defery.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/arm64/mm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index e0bd23a6ed..f595205fa3 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -14,6 +14,7 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 void arch_setup_page_tables(void);
 
+#ifdef CONFIG_MMU
 /*
  * Enable/disable the identity mapping in the live page-tables (i.e.
  * the one pointed by TTBR_EL2).
@@ -22,6 +23,11 @@ void arch_setup_page_tables(void);
  * supported.
  */
 void update_identity_mapping(bool enable);
+#else /* CONFIG_MMU */
+static inline void update_identity_mapping(bool enable)
+{
+}
+#endif /* CONFIG_MMU */
 
 #endif /* __ARM_ARM64_MM_H__ */
 
-- 
2.25.1


