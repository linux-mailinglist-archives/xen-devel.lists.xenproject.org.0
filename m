Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9021B39009
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097182.1451619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQbF-0000ij-If; Thu, 28 Aug 2025 00:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097182.1451619; Thu, 28 Aug 2025 00:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQbF-0000h8-EF; Thu, 28 Aug 2025 00:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1097182;
 Thu, 28 Aug 2025 00:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQbD-0000Ol-S2
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:34:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c915afd8-83a6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 02:34:42 +0200 (CEST)
Received: from CH3P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::13)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 00:34:37 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::b) by CH3P221CA0028.outlook.office365.com
 (2603:10b6:610:1e7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 00:34:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 00:34:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:34:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 17:34:35 -0700
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 27 Aug 2025 19:34:34 -0500
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
X-Inumbo-ID: c915afd8-83a6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejjLK+XOc9zPI16yhics1oosPpPXO2tsfHszLyZ7IYEXvhPTl5iScXN2x5gynfiTivSEOiP71i+jy8kgyyRliC8TALHRBDXGRkQZYNEG1hpfsLFkz8DWrRA4x/t8vZ0OeyKTB0UMPIEGxQUUuOAtd08HDUV2sJvS1jEsCP/0DSs9RWLzQBi9iXeuV9UrfChd7MJCLcuuHGu2yWlbTgG4Mzm4oWO9rwqwbgf6aBEHLR/UqIXoSj9icvs91MUdfWWXTkbp1hnBYFLqf4n9Czm8EHnbhPEvq7+IC7gpryqO88v2U5z7ETCZTcOYxXYccSMp9IPYknvNiLXxAux4cXPyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oACrg1+uNF45UlAHavD66G1T9UliU9PiWyBkteY+IDo=;
 b=LZvsYNNEC4rLVQ2TMCM5ueoAfiTe56E8w9hiNrV6/vHbY5Cx3E1LUeWurjcAn/9iCTcd6YSfrSCMTd2PasZRVK7AG0j1JoMLrvQa2kASoYePsxTpOUnco1Ai1jI0DHA7xNdjaMxo5AhXwMlqNraVzJT2dgvlZ3CfUvREmN71k89vunwYywh8fXby7AZ5cYJ3eEe25ap7/R1cyT2SMtOs6KEYWR/HvuoRK5/qDMp+BfwQQpHH2CfxzbLO4cPLSD7vJPOYu4GKKMwu6dihk9cfhG+inFP2VkE2tfypdoQ2pk862PHnN1iyvbdguwWkAA4AcrXlz0sedlireKOY4o95XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oACrg1+uNF45UlAHavD66G1T9UliU9PiWyBkteY+IDo=;
 b=hJG+4HT1w+ZS6YG28mU5lYfd3Xm7psAbvM42wYiWkyBxHEbqnh+83YKiQuQmAH8ZL9kRHW3JcheBrsLZPq3SUe6lOwuuMqcrLUyUmfmcYoGMuRfkYqZrzyLNL/iKbK/7zEbuKQY8CU7iQT+kEmChYQEcDwvJBeZWAbf9fIgbFKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] xen/events: Return -EEXIST for bound VIRQs
Date: Wed, 27 Aug 2025 20:36:02 -0400
Message-ID: <20250828003604.8949-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828003604.8949-1-jason.andryuk@amd.com>
References: <20250828003604.8949-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdf9d8d-4b16-48ca-146c-08dde5caaae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cbEPd84mKzjJ/jk29l9LG8pCbg3fjcmzLe2K3kg/wEJVjJf9xhlyVsOKeINn?=
 =?us-ascii?Q?qiEGmT+Ma7fHe55o6oDxpHcCz1wPlP4JumvzbSzSgNxPHyM/zDkWSynsiaXe?=
 =?us-ascii?Q?tiK4yAw17Ue/Si8BdyC5hoAV0DgmHmSQ4hBxmCJpubw9+1Su9wQ/7O7nBWb7?=
 =?us-ascii?Q?4Is+l9yzHCjCTPzXufZUT2Y2SLgOyllIq1563k0n7R/tVE3To7et39FiHh8u?=
 =?us-ascii?Q?v1ArTPiAhcm/ob40/Uj3/mXmJsBoB8/qosFYStvb7qAlYwlqUNSy5d/HmzYN?=
 =?us-ascii?Q?uxS1fyarpeX/7ByiPrw8Ofg2bqsWuEkQK+BboQwpS6DHVcICSFqlcx/C+U5U?=
 =?us-ascii?Q?/p4htfg2jVbD4jReYE39z+ErSJAkj5vCiSvcYNuVYDFVc8ssguPSz5jnjGEp?=
 =?us-ascii?Q?2nA0oPPCIQTAx6Xotsm1MiFDg+iMvtanajOD8ECatf2eRJrV2QMz++VohtMR?=
 =?us-ascii?Q?xpnhz1zLuL3Zrf5Va99xfEXRjUj/RUJdgUfPcvezJYcjZTRWN3ce+x2KkHDY?=
 =?us-ascii?Q?dn153RJV5JyYT0qve7DmHdtOU11+SUzAF22Bj5pakhVUpMTNASu+ZeKX732L?=
 =?us-ascii?Q?HrYzYsuPVPmi7iaPmXhcnqls4h4fYjkLi0VtHRGymboGzhZsQacM3rQZFY/C?=
 =?us-ascii?Q?MriGXJatbYffXiAIGO9aJZWvH+ihP1YgZP7DRPHySxatVu5xRETpb/hhrAiL?=
 =?us-ascii?Q?NEDSiPpPWlm3ktAr7U2FGdkKf429Ell1j1GYuR2kBNlPxKfA5QrDph5fAmBI?=
 =?us-ascii?Q?d104hahHXlyveMHsIrKAuobJSoVZMBgoQvF+T+BsofcwrGZtajlPuOJGo87f?=
 =?us-ascii?Q?xk8i8+wLemuRmH4pBHVj2s7lHbGDcVUWt+oKvcegiJ+K/yswr+ficFB+aXgc?=
 =?us-ascii?Q?VbNxt2EFwDOu5Nrou+5LJQMFT7Qxm9nSeGBukxX+3tZcaPN5tcsZqMtLEazJ?=
 =?us-ascii?Q?zMQtaA6XZ3UwA5lsCVb/I/eun+1LGA+H4FIVkXC6GcuZUlySsqHDWw8QruUf?=
 =?us-ascii?Q?4p75TaS37TTZJbBKohzZ+bYFPv5fEQhkVX3V009D74qppVFFWbUGBKhJaiKg?=
 =?us-ascii?Q?carcSfEzCDMtz4p6ShRhJAVlffGsUb4aJY61OQd/RFNYC1yTwqCa//+8P5Ph?=
 =?us-ascii?Q?ee4pUNnMVQOl+uUusmQsOr3xCj+9saS7hLCqLsj1G26iA6baa4lrwLkgnW+g?=
 =?us-ascii?Q?BV1n12pGz5lMuhoq4fYB+0xxkmS45ACE5E3N4UI8TXrxWGlBPaj3ro4tiKl3?=
 =?us-ascii?Q?T4NPe0V2m722UvWPpP2jcgL+P9F/P5cc8FWOpDdISvUjxqfgQR2Ei4gFXMik?=
 =?us-ascii?Q?Xsk/XdcXZ7+fiKD2/Dy1pkrTbH4sOK2eGwPf2ehR1sfzE8iBozCh4I6xObsy?=
 =?us-ascii?Q?tkBsfxNOhOVJ2d67Dvwne8Tmc9lM06W25npqsHdBWGzJNiuSesSNt+EiSlCc?=
 =?us-ascii?Q?R1bdFsl0xmXb6noIA5nyVVk4lZRNeYIDwJnAz786ZlSM9ne1ZbfZPvioZxIw?=
 =?us-ascii?Q?D4bKjFgmUgtSgEs9BEPyJwsOVJBmXOM83gC+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:34:36.8896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdf9d8d-4b16-48ca-146c-08dde5caaae0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

Change find_virq() to return -EEXIST when a VIRQ is bound to a
different CPU than the one passed in.  With that, remove the BUG_ON()
from bind_virq_to_irq() to propogate the error upwards.

Some VIRQs are per-cpu, but others are per-domain or global.  Those must
be bound to CPU0 and can then migrate elsewhere.  The lookup for
per-domain and global will probably fail when migrated off CPU 0,
especially when the current CPU is tracked.  This now returns -EEXIST
instead of BUG_ON().

A second call to bind a per-domain or global VIRQ is not expected, but
make it non-fatal to avoid trying to look up the irq, since we don't
know which per_cpu(virq_to_irq) it will be in.

Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Cc: stable as a pre-req for the subsequent virg tracking change
Call __unbind_from_irq() on error ro avoid leaking info

v2:
New
---
 drivers/xen/events/events_base.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 374231d84e4f..b060b5a95f45 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1314,10 +1314,12 @@ int bind_interdomain_evtchn_to_irq_lateeoi(struct xenbus_device *dev,
 }
 EXPORT_SYMBOL_GPL(bind_interdomain_evtchn_to_irq_lateeoi);
 
-static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
+static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn,
+		     bool percpu)
 {
 	struct evtchn_status status;
 	evtchn_port_t port;
+	bool exists = false;
 
 	memset(&status, 0, sizeof(status));
 	for (port = 0; port < xen_evtchn_max_channels(); port++) {
@@ -1330,12 +1332,16 @@ static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
 			continue;
 		if (status.status != EVTCHNSTAT_virq)
 			continue;
-		if (status.u.virq == virq && status.vcpu == xen_vcpu_nr(cpu)) {
+		if (status.u.virq != virq)
+			continue;
+		if (status.vcpu == xen_vcpu_nr(cpu)) {
 			*evtchn = port;
 			return 0;
+		} else if (!percpu) {
+			exists = true;
 		}
 	}
-	return -ENOENT;
+	return exists ? -EEXIST : -ENOENT;
 }
 
 /**
@@ -1382,8 +1388,11 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 			evtchn = bind_virq.port;
 		else {
 			if (ret == -EEXIST)
-				ret = find_virq(virq, cpu, &evtchn);
-			BUG_ON(ret < 0);
+				ret = find_virq(virq, cpu, &evtchn, percpu);
+			if (ret) {
+				__unbind_from_irq(info, info->irq);
+				goto out;
+			}
 		}
 
 		ret = xen_irq_info_virq_setup(info, cpu, evtchn, virq);
-- 
2.34.1


