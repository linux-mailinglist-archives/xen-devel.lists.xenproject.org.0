Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57278C8A89
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724355.1129595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812i-0005wU-BH; Fri, 17 May 2024 17:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724355.1129595; Fri, 17 May 2024 17:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s812i-0005tf-89; Fri, 17 May 2024 17:06:52 +0000
Received: by outflank-mailman (input) for mailman id 724355;
 Fri, 17 May 2024 17:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s812h-0005cV-AO
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:06:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d964181a-146f-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 19:06:50 +0200 (CEST)
Received: from CH2PR14CA0060.namprd14.prod.outlook.com (2603:10b6:610:56::40)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 17:06:44 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::27) by CH2PR14CA0060.outlook.office365.com
 (2603:10b6:610:56::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Fri, 17 May 2024 17:06:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:06:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:06:43 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:06:37 -0500
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
X-Inumbo-ID: d964181a-146f-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P01g5uxPvru8qmcnL+KhXnJeJOJPzjku6XF3xFGF+Ophw8Wh2fGi5ZsaY6wMzAv4KW6LTsgu4sqpio53l18dbuFzRDYmxgMzBRbdxdzwEb9DCy2g7A/2B10N6gbfJKvJxVN7GpiS+4PFNXNJ8KSu+1jewe4/zPSGm27Wr4Q3Qs3VOn3IEmmu714XillsA8Q1fGLNdHvTGC9+5cI5rOQjf9pDah8wpS8F+nUmRggiMLrXMspuhBUwOaOqO+VZgkvDp4WmJ4yqmF81HTAJr5k4tgvKu72C1v9tNCfEGDJGM2VUyOaKzp5cC84CklMhMoh+yjrDOhUGeWtznNFIhA/u8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8+/xJpZRZsK6+RKr2c/38/ePPkO2ljT1mguCOagC4g=;
 b=lCkUIbMsxmPmVPwA8WQfZHMciSU1fQJRq3/I+G5ti8Z77a0tbNPCFdLkwt5zi2ps31jV8yXrgrm1T0lCobVyYzGFK2cdN7xIA47UVlr/nR4cr8U1dyR5PyEHew50zlyP/0N9X3lC8cge15Q/gpPY1wV1mAAscHN7uCrBHXrmEnXuDDiWpd8hf6fuYJlov4yXI9uBOj+fk1dlQJJ1vprLO7v1q4q6wPBtH3K4Hq3B6iFBxiH8NPoq/ff0N2Q9268HWqpNUc7e59cfhkuI9iGDZnJov/JJNm+5Fs+rDneCl0iOe5kXkBUYRmR7RFc+An3UzXcPOSd+c3wXUTyPf8GHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8+/xJpZRZsK6+RKr2c/38/ePPkO2ljT1mguCOagC4g=;
 b=p9EvjbHziTFxIK4yn069lzHVP/bSaJOUT945UxW09zLG8uHMFsPz/ttdU19+wEVtZm6jw7TS6b0AiD20pEOoJD5NIs7poLq4j8IiCxmiV30Y7cl40H26OqxWLRblxFLnxy9vCxO9ufXkc3DATtGn2xTEqoSiG2874Oi45jyuV+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v15 1/5] arm/vpci: honor access size when returning an error
Date: Fri, 17 May 2024 13:06:11 -0400
Message-ID: <20240517170619.45088-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517170619.45088-1-stewart.hildebrand@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2952d8-bd52-48b8-ce1b-08dc7693ba57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nvzXThYk1gFpvov+RcY0hREqCRWQgPhOFrmAsPWXl3o0uLtyFP6GJmIlbtjZ?=
 =?us-ascii?Q?tukrzbVEA0eIF8OYcSp6L9hi6KaDNl4RsbxXe8sH780ZXmbKod6qrdhJHaWh?=
 =?us-ascii?Q?sobOYwAl6yWaNoKNMJFjMHR2LINJmmd8JeDhw7lY4hSGjw+LUHW0N2so6gw+?=
 =?us-ascii?Q?wHniDCEUniD+5obrGSpOB7Vk+42Mc0F/mqZy1PdDPr7r+slQrcKpYNtLON4Q?=
 =?us-ascii?Q?DLS2SBQ5t+ih2T4PCalCpGUzeg/tqnk2q2IkOwYtCVMwJimHzU0OgR2944/c?=
 =?us-ascii?Q?3E2q3zTgK0OnzFNIheBHD3Ely3V0umsG7kfIMViDp9wM4DtEunLQwhDIPjaU?=
 =?us-ascii?Q?1uf71Vb0kxd5531IjP4yFXh2/OTUQ7tCTeNzuME2QzI/gv67CPYIbq6A2FWI?=
 =?us-ascii?Q?oR8UkaAGo+UYXdCHgDoDm9z7DJU+dME76TapgQq6wvfzjyBTH8OWQexMGT5X?=
 =?us-ascii?Q?ZXNMQxhJIfAsPoH+kawSiQCefQZ0KCEyvc1YuGINDdiEzDy/Q/+YpG/c2gee?=
 =?us-ascii?Q?MsNExf+oqvcDWlNezAkR4s21L9jqg8ntohH/vhVrX5CIuGDkJh4zp6e/Ey4Y?=
 =?us-ascii?Q?rV4jBgzxku1WE5m0DCxNIXQCltt8mtConmJJXcNZm7q6OMAH+mihPoeO1gCR?=
 =?us-ascii?Q?K781H9tyAzw9PrsXvepZWdrZKyvnXHH2FXNHI3OB0QIyRpZ8hFulstgKtAVh?=
 =?us-ascii?Q?UhIgiY5VjxfVkHkbpWCg1Nty9t4tD8HfEF/+AeEOoBuSV6gkDxdp853LH2qN?=
 =?us-ascii?Q?h9vsAwv12xpc71TXHOAYKvWyJj8yW6xvhm+8PEjisFZeY/qdek6lTimAZq5x?=
 =?us-ascii?Q?qefJ99Oyz+fXybUrGOew1y3E9JnpHFZn2lsoy6O/3XB42RxlaszuvH0wiHE5?=
 =?us-ascii?Q?U1ll9O8jpcPRUo4Txw3w26wX1lnRos4H6b6FKiDVFaqiNzOhsVAKHyQcLiqt?=
 =?us-ascii?Q?6PhpXQ1bGiozPZYNzAj5py42S1SUOyPDCcLgqUtIQX4AarOHKcYV62AHdy8N?=
 =?us-ascii?Q?UiEeJzbmlENAdYSUlK/lhOaqmVi+1VcwMxFP7pyF0wn6HG6fIJBJ7Cz8svlz?=
 =?us-ascii?Q?ALoJMJ7sWDXlUh0RsLb6BeeWw1d3K0516X4jaAWDnqCmB3aInJ9mCrOZTvl8?=
 =?us-ascii?Q?Iqgf1y7H5W/jCxAmATpA86ye0nwhc+Kt9Nbo+ppS+z7MOWbdz6m9PQyFPtox?=
 =?us-ascii?Q?L3E9wa23v01USnvK7BdULkl5lO6Y3qfF4sgxkzPByDwqJ+qr/wTDoBUcqj2w?=
 =?us-ascii?Q?FLQuTaZBevCqw+GpIgjS9QXUK8HvYwufGR2T+K8uzTOrZb+crAwXSMz73sjG?=
 =?us-ascii?Q?RWSTfg6m+bksv82Y600H+D/XL2XtXsJFrt3A5igXSwAJ0APGH0cDmMHtzPOs?=
 =?us-ascii?Q?yIaQQ4FSAkw7GB/GGbFTpzVjhthX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:06:43.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2952d8-bd52-48b8-ce1b-08dc7693ba57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v14->v15:
* re-order so this patch comes before ("xen/arm: translate virtual PCI
  bus topology for guests")
* s/access_mask/invalid/
* add U suffix to 1
* s/uint8_t/unsigned int/
* s/uint64_t/register_t/
* although Julien gave an Acked-by on v14, I omitted it due to the
  changes made in v15

v9->10:
* New patch in v10.
---
 xen/arch/arm/vpci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..b63a356bb4a8 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    const unsigned int access_size = (1U << info->dabt.size) * 8;
+    const register_t invalid = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0ul;
+    *r = invalid;
 
     return 0;
 }
-- 
2.45.1


