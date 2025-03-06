Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EFAA559F4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904175.1312137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtZ-0005NE-T0; Thu, 06 Mar 2025 22:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904175.1312137; Thu, 06 Mar 2025 22:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtZ-0005LZ-Pk; Thu, 06 Mar 2025 22:40:49 +0000
Received: by outflank-mailman (input) for mailman id 904175;
 Thu, 06 Mar 2025 22:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKD-0000Ss-Cd
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f04a4674-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:13 +0100 (CET)
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 22:04:10 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::1a) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:04:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:08 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:08 -0600
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
X-Inumbo-ID: f04a4674-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+B6nF9GP4kAsmdO2oe6t0L0McwVqexmty6UvxFtuWbUYqIBm/7WiHsQjU+GtBGSWFxPo+ErTUPVikihko3ku0t9JpdvmWfCQrt8KKfC/Cq0S7/UmcZW+mUuVyAkV5pGwEMHP8OuIryRAjodX1HYZjV4npyprnGG19tYwQY2OWccWhvwRpkDFV6M6zeebAM7hlJb+FH+XaSt+y651DaMlRLe5auBr/6mfM19ddP41g973x6ubqOXjhp0yW6ot/rq1vM+ny4kypUahR2P/913txPF1BsEcAPvme6pbku7Fmi5SUfwbslXnyqbvKzsDCam2GkF1dagi8wU8oborgZNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iIiBhdZ7Z/AESKlqv+uNMrJ77HKz/XFz38UqOCX6i4=;
 b=ciJ52d8y0Lvk6R96qNP/RT9BRc9XKfFe3YuuhxEXAU9sp0N0WFZj2C6jRl/PkraDZcB8bN0SYHlvvTojJHVsq4aieujoj8vjvUSxx7Bs3CaIY7WFgMMzK6DI2b2f4dJifu2tI2HnAVhCrHg9EozvKidrSUlP6cRKoWw608Mvhh1ab7f3rqTFwAzWZLMsfee/guqhFtHDuwN0W7HBUBfXxRuzUoPbYO3r4gJxgB9266vkk0HyrqTaYRJjbiCogCRe+wPsEdUf+c50w3+51was54ObRSo/qVtRCi56KLLkhUd7SncKPxW7+davVvGmEq//iKHtWLZvrFQaFLOFROUFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iIiBhdZ7Z/AESKlqv+uNMrJ77HKz/XFz38UqOCX6i4=;
 b=JIQFsIVwvjtQRurSUhYOF+dJgYh26qPLq9dGYFL84WDhTnu8JeiYarmux+eUswnQtn/OMd5MAWJKf6IGTHb15X/yVRgVK21DnOxLAmsYuA0GJLB+SyxYom2SaryVh5SedMMvwuVZvKeN0jz/IKGXkoFSLgna5fw4gK8ViOOO2YA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 17/23] xsm/dummy: Allow hwdom more - except targeting control
Date: Thu, 6 Mar 2025 17:03:37 -0500
Message-ID: <20250306220343.203047-18-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ad279d-1b6d-4b2b-76a5-08dd5cfad227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4OYvYd2/TP4nCQdPC/q8UmtX3D/EOV8EFeLek1nnUKibkl0GyID+lk0UEVg?=
 =?us-ascii?Q?nnBExhUPld9nIz7eE5bu1uY4Xs9wQnIoSCdf6tqgbcir8WnnMsCD24XSd/mT?=
 =?us-ascii?Q?+FQO69DhTXZenA+dujI5RwhlyEoJ3sjuFYo7YntxVYyVbfcw4VUQpj0+89zM?=
 =?us-ascii?Q?Scwt63jHW4KE7r1kEvhdAbahJ1HU0Exe0tt7WMcZSwTEWqy2g9AxMKVkyOfh?=
 =?us-ascii?Q?8zxXely/mi0o+jue8EsXgSi8qmBJ+R9jZdgd/23oj8vm1A5ScBiBJvXdvwb1?=
 =?us-ascii?Q?4ZZW9vTVXfkaDI5F5RRxG/bS3haDByVeHKOwxJJvu/QmdOykh5Iz9uyWxUIO?=
 =?us-ascii?Q?1E4IvE6lbI+yB8QSQRbw8YgIWWFdi2M0ehWZ01u9m7PzVUv+wEfHnIqNiSkC?=
 =?us-ascii?Q?D6vOZ/auCs/9HsN3LRzQsCEUtL6t744Jp1Jhasalr4IXmRJAc/9yjm7ro2kr?=
 =?us-ascii?Q?q/mDatK9/swr9lrwgqJlf2YM/9ukWoIfxCidz2NppVnKBTtzggUUv6UPCipp?=
 =?us-ascii?Q?SsCNgNNb4U3f0HzGgxDhgg9KR9DLkiXjCz/81BHyrtFfmFaXD8o5ksj+euY4?=
 =?us-ascii?Q?wLbNO5jtdb423idCXzDYuMf5zpdl7ZsxRNx+c+FM/ykd+rvdWHPbCSY6kERO?=
 =?us-ascii?Q?IEtlqH2VbRwunAiC4hYgqk8XijNk3veY1WH9NVg1bukNh+KZlsikcgk2PEZo?=
 =?us-ascii?Q?5uno4Vh7mFJNknPZ3eq49oSO6Mirih1e8rrL2qphv9AolP8zgGl/abGVvOl0?=
 =?us-ascii?Q?OIwUerllyIzaHHMNzwkgWg/nTtyaYFrJ02jPB95TLb93yJexnE4wZb3G5Bqd?=
 =?us-ascii?Q?tsdN9+MXl7+vUFiOceZSLlrb1/tzsqBRyWV8mYglxQiX3tWLZj0+a5oR9nJD?=
 =?us-ascii?Q?FSb9tvmcfNQxFci55UVI7l/lRGh+JhRFijx9BmtenqFT3i5x3L8O/Chbnolp?=
 =?us-ascii?Q?D/wqmqIjigcf/b7MCDEucoJkFVYV68VnjnRJAsyQQg8XHQ4eKaZ1UPIAIka/?=
 =?us-ascii?Q?HJFXXvtkV8OTPwhof5bqxW4520jPs4AQIvNkmx51CtBNfzLt0oJg6wJbBQNU?=
 =?us-ascii?Q?+ztDrl/ReXATUc5R5tJlzD0I2HrkgmU5BoSeQ4uvnKMeNSdDcA+GQpglSatN?=
 =?us-ascii?Q?UXKHxVDkIy2XoHz0CJFcZ7SHbvbJUiHWpdcvM+AZbpAZyBmAxIaUReTbyqB1?=
 =?us-ascii?Q?NDmdz2CcxB3QNxMwI5D1BwE3qC1bbAJD+J6Cd4tAmhvDYkIK21t71kHWWbP9?=
 =?us-ascii?Q?7133rz16Xo6YPnKvb3OcXhIp//s7B9INUVt2rmCZ0/epWpI/C8uvbzAPVoRS?=
 =?us-ascii?Q?9NHcW0jcFctr1U89r5h1vPTqKM7lgSkkmw+qtCCLE9eK15MeSX63wqnXKeFI?=
 =?us-ascii?Q?E1i0z6GcPgIJcbN8PtqKSfUo4/BeqOIHVFi2Q7114AJSTy91GkG12AJKiatv?=
 =?us-ascii?Q?N5l6pisnor7C1qRYA9oIW4J2/5Lo8VnoepjrCbZXBVHQXwN19UdgcaOySqZS?=
 =?us-ascii?Q?dTyaHTgFWyRCPXs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:09.3234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ad279d-1b6d-4b2b-76a5-08dd5cfad227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433

Allow hwdom all perms, except XSM_PRIV, and except commands where the
target is the control domain.  This protects the control domain from
hwdom while allowing the hardware domain to serve as the backend and
device model for other domUs.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/xsm/dummy.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 9e6bc0ed12..294777e904 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -98,9 +98,12 @@ static always_inline int xsm_default_action(
     case XSM_HW_PRIV:
         if ( is_control_domain(src) && action != XSM_HW_PRIV )
             return 0;
-        if ( is_hardware_domain(src) &&
-             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
+        if ( is_hardware_domain(src) && action != XSM_PRIV )
+        {
+            if ( target && is_control_domain(target) )
+                return -EPERM;
             return 0;
+        }
         return -EPERM;
     default:
         LINKER_BUG_ON(1);
-- 
2.48.1


