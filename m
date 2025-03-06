Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05531A55943
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904066.1312007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJx-0001S2-2K; Thu, 06 Mar 2025 22:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904066.1312007; Thu, 06 Mar 2025 22:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJw-0001PA-SJ; Thu, 06 Mar 2025 22:04:00 +0000
Received: by outflank-mailman (input) for mailman id 904066;
 Thu, 06 Mar 2025 22:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJu-0000Ss-KP
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:03:58 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2405::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6811f38-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:03:58 +0100 (CET)
Received: from IA1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::9)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:03:54 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::e3) by IA1P220CA0003.outlook.office365.com
 (2603:10b6:208:461::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Thu,
 6 Mar 2025 22:03:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:51 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:51 -0600
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
X-Inumbo-ID: e6811f38-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDdLn3x0xZvWp+BBu29v9ubuzXeNuoS7x6Ggq836IbwpRfbgj38URBKEWJb4qkcR+skGpeI/djs/6xhQnEuaP14msJ2vGJbOvE1QhphCt4UJRfFyWQ7dDZNhc1lQOzIoZJ8qCSWkF9iF/7cX8YGHuqSS3eH9UL9wKgMxAtDtQer7JMPc18mSSRHSK5D+UJwGy/KbIYb+snq546OtI1YvhTxBsJArG6Q54Tza+wxlr7CYBthZIc7fDRG9L9P57PPHMnC2atuTWF/dZAq1f6341Sw+lfJXs8u7+ESBbfSUw30EXhEROwVK0L0/is5EeGKgOWL7n0PhqVzc+UhiXw/9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obVZmGGT/+U9RfcJU0aGZukVfIOb/dDv2A9zwFbu3y8=;
 b=lx3o9g93VzlKwzQI3pmHR6yG02kBe+xqIr0xev76H2TshxW1Y/iFMGR9AyWieRqn81HRGadtZQhNKXKovBwE2ZHyBcLtMqZsWorVUdcZrmX2lncbGVtmpGXthEdem3JWAXa32NrbVY5X/zI8oixtFYnRT2omHbQ8XU7Oi7iU6Y9fE3HoB1asFSOYKj5ScI3BGaf603jgeGVlt4qPq8GrzEAVa1rVjdhs6rFMMsf/+YpVrlWvbkQ2YvaNIIBqTsCiuRjAhyGFaLBZA/QQaESdfnDFyTSUfyWD1fqisUnQKhpzsDj+PAFVMNf6Y0fZ6JjlcNTYD5BtwS2/pKknZy21RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obVZmGGT/+U9RfcJU0aGZukVfIOb/dDv2A9zwFbu3y8=;
 b=VgDOdxziE5avzH8Jr9pRgUlaS3P8Vji+++TVQmeEDf/g7WqxLztfS3etvr+5yx+DskBX/qfm/+2TpvF6JgwLtgQz3TlOU2PCi57MIrLId7FB6Npfq4mNAc+Jt1UK7Ejqi5yg04+XhyYXssmHrVNmohXB5YleHKHYupdgY5Bv0Zw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
Date: Thu, 6 Mar 2025 17:03:24 -0500
Message-ID: <20250306220343.203047-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 887ec4ab-1538-41c1-2ed5-08dd5cfac86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QozOmfS1LK8WEXSkjRxc3wsUaZp2sUZm9wzF0A+wSfRzTjKjKlBcw3CTzxyH?=
 =?us-ascii?Q?2w/tEoqK7M/dduksUsJhRrEObCfcvVZWbEXGQzULazfN5WR54REXovLu6Iy9?=
 =?us-ascii?Q?BeSwE+nVCLGBjCocO3vpiDy9kfnkVRzvpVQkBZeXqngFMm9AR7mIJdJolEgZ?=
 =?us-ascii?Q?eDVY9MJP6ppfV5U7fSXofAd1cHLr68tMrdcZ48nRXTDikZAlncxnoPnfGMOl?=
 =?us-ascii?Q?OOQZmjH8f0gIOcKhLjAhvqZ7GGmkRDaJIflzPEKbs6X80hGgwLFpr3K51MMr?=
 =?us-ascii?Q?nF9pfYFhN+sweX3whepu8jBWiRWhvegY80ifauVIwn14hTXFlayqD1YfW7tO?=
 =?us-ascii?Q?2Ua+AujVzvfEe7FakUPzW/GEmt3lfNVTVvByFCYzF1kHk+dUDhWFg9f+ukSy?=
 =?us-ascii?Q?eE6/jdrH6hlXoMcs7pShCcodl8FTneyV7nqU0Dl47Y+LKl1I6lTzLSbNZ+cX?=
 =?us-ascii?Q?jeGRt/9vaTjZSOdQEY3jEzAfIQr0Xay03f4qrl4kyqAZ/upopIEUPLTYy/wU?=
 =?us-ascii?Q?tmxjyxEyeth8aJ19dN2XcAjmh7mI9lyu3HJeZNc94xApoUMejlOZUw+D+V/k?=
 =?us-ascii?Q?Vk6J2yIjLeIjGLH/kHtIyu8T/fKwZlFKsXnDCI5rijUBg9KdQCpVy+ML2mZ9?=
 =?us-ascii?Q?GE2u7fxelgJ4zzz+Q/3wUc80i8+PZo52iPRcsonkAmaAZ283c9q+o29/x5gi?=
 =?us-ascii?Q?wT5CRk+5vdsjEuYpTcywCQ+T8vTHsXRx8zp5TIP01OlEI/m5ejP/qxE5efYP?=
 =?us-ascii?Q?oPtNHkkabA4nzUUYdU63AbzCstVK32XxGNtw2BmMyiB708E58RnvN6g/T9np?=
 =?us-ascii?Q?dcnVfRmnB/GjXoxTDuUm53hHIXr84u1ndVgMFF0Z4R4Mi+V72hBT8IvSuKf6?=
 =?us-ascii?Q?vq/+GpGH3WxnJMa1tnDIh+rKS13mHnZoXhIDU/mNxYn8VoSSbsWOpCAVwU5R?=
 =?us-ascii?Q?m92w7LiYuIk65PB5IOneYZn8pxEr072g4+9QGxi7rGzRETWqvQ4IQyyxOFly?=
 =?us-ascii?Q?mT7//8DO152ikDcldIe/dq5+Pc9asv8uw+spD31Q8dc5YSJZjDJtRo8+dR00?=
 =?us-ascii?Q?GQ+WDrxPuFT9LqkthcrV5sCko0UjAici0evlvJKYjCeDuCraggp8kCaZj67Q?=
 =?us-ascii?Q?dcS1xjJxOqfUACrOLTrfBjDxECOJOmjkQ04LcyKbVDhNrhvyhcO3ARgGbXPi?=
 =?us-ascii?Q?8hUwxXScrEd0rE/NiILfGMCmMb/tvcrWbUb2euMIf3xyGIfbsOcZKZyhgkEZ?=
 =?us-ascii?Q?oJWZJ+QhiMKsXFrazLAOU4VkRDOug88pqd0kM4eq3ncFEEtqnzyRg9nIlR1L?=
 =?us-ascii?Q?EnLC+7f1KRXDaNshfdj28lTNtaN4Rw+WehE2AAGOJv+mGDyP6EMjo20ameNT?=
 =?us-ascii?Q?0fsaR9VeC3UZAFziwJ03aBRpqA23v8Z/cSFRL2fsDoYxSzDN+9BeCxnHQ5Pf?=
 =?us-ascii?Q?1Q5kE6qNQEwIUyLc16ylnWAUIawJ8z6gHWDobcOJfGJ+itglkuCCVtWIXzOP?=
 =?us-ascii?Q?p7taeRyvhjqlUPo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:53.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887ec4ab-1538-41c1-2ed5-08dd5cfac86c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.

This fixes using the Xen console which assumes domid 0 to use the
hypercall interface.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index e539bcc762..5a7871939b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -969,6 +969,7 @@ void __init create_domUs(void)
     dt_for_each_child_node(chosen, node)
     {
         struct domain *d;
+        domid_t domid;
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
@@ -1121,7 +1122,12 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, flags);
+        if ( flags & CDF_hardware )
+            domid = 0;
+        else
+            domid = ++max_init_domid;
+
+        d = domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
-- 
2.48.1


