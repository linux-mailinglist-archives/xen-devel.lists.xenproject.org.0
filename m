Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D91B07F7A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045789.1416097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aL-0002LM-QV; Wed, 16 Jul 2025 21:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045789.1416097; Wed, 16 Jul 2025 21:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aL-00021F-3l; Wed, 16 Jul 2025 21:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1045789;
 Wed, 16 Jul 2025 21:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aF-0007F2-VI
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2413::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac4ed30-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:31 +0200 (CEST)
Received: from BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33)
 by DS0PR12MB7899.namprd12.prod.outlook.com (2603:10b6:8:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 21:22:26 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::fb) by BL1PR13CA0328.outlook.office365.com
 (2603:10b6:208:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 21:22:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:17 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:17 -0500
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
X-Inumbo-ID: fac4ed30-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXzi0RU3GeC8oU94E6Fhh5buKidh996E4/65hK0fGYdJIJl3ReM+2reMpRS+3Moa8aPpXf3jQQFK6h6uczlm84EewrZhXoywoV+aHOgj27T4FRI4tvwtDNFulbWM6Xbn/O4OuIAN+g8xIN0z9rCG8bByL9rJcbyqS3Gof478EkJQoG1gTcIuhLJSkZHNOdvhncQJaysURAWtM+Yl0QlGKDQh5H6LuMVf+Noj41ywSuum13uk1fkqDC3+BuSLVJ2AVfsDMQ+5nxv9voX/bkzAWKV6l0/bv9wUqi9z/8SmDOKG2TTqlEuNb1CQw1LYmzzdA/loXjAp34rUjBA93v7inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SihKPN69NGNjyt8htAUPBNJrQwfMQFZ0+BHxqWgh8vk=;
 b=Ob9zSMsFK64xjgv+CHr2aQdW1EWmczVb5ALOeAHntW1pe6RSiEqYxhHhGSgkIft6H/avDlmKUouR/ylHSWX21NIeH1yp/RmQh8+3WnhSJIafA4Ux0wu1f3TBpKhti41E8cOhfWYC0/RYhYBkI3RJ1EU7brSLHmLHSHWr+2cFv7FRbnLfjz1a+nqf/lYBvgdw5gIpqt68IFrsrv3ToWr3u9nn1FDjlo3gklBTXic3Xc8jMt/IHvRtA8QFUqHNrVWz+YcsleObVBJtsR0vB9OIyNm2RHLP17uz+8VfQ9vLTlZ+usDQxwKEZDDNcW3PtE1rZSLmh2lDQ09SttvTQ9sh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SihKPN69NGNjyt8htAUPBNJrQwfMQFZ0+BHxqWgh8vk=;
 b=q5U3Hngb44SdvMy5mOtozerX3gr+eWY58SLDDeNn1HS7KnhCJR4vFJPQWIlA2kJ0L+lT8kplo7gCx9po7WGsgW6afDaOvADhEl+DK9hISBgr+uc8INIK1ETEQS0nfWbqt7mbIVOvxRffG6+Nv6dfZd3RhoSd3uUA0ufZuQvAKFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 10/17] tools/xenstored: Read event channel from xenstored page
Date: Wed, 16 Jul 2025 17:14:57 -0400
Message-ID: <20250716211504.291104-11-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR12MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c78432-57a8-4ba9-4f50-08ddc4aedc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NUlKRk43zns5X9i6WlDXDZJojlBHmBeewlm5TInmv654shVyOHBSE3/iio4E?=
 =?us-ascii?Q?0owD9IUcxwQ3cILfJuA639C4itHej5a59Ju+rqrDlKWwXVcJbcXuYDASQaZZ?=
 =?us-ascii?Q?q0uGaCuF3sQ1fm+801wpUte4oJ3jxObynf+HYY79v8JyzN+PehVgjkWCD7GM?=
 =?us-ascii?Q?hfTTfolwwlrHmvTK+1+dau/p7HLMYy9mBeQw4OTwQag13dvU/wQoCQ4vraW4?=
 =?us-ascii?Q?/ObyaXWobXBLxdlObCLCPnde+Ma/GprQc7PK4bjwEV+UQVJIsRESO4CFnjO0?=
 =?us-ascii?Q?nNHm+yJDnTWjznJNfRs7UduJtZDEpe5VckY1Ch3MDUOZX48fHy8oHIgd1gij?=
 =?us-ascii?Q?WDWl5GAsbics45whwCb1Gl+8bhBafaDMpHKpXYRwdFNSgGJQAc3//NsKdepS?=
 =?us-ascii?Q?EhObek1Gb8LnSh+5+dhcZ7szbU0QQq5RuUHsgbJ4WvBXELy/3NNtTgPFquWK?=
 =?us-ascii?Q?N9N2j5DEpbrwOxasB+gOxkgIZyW94eRqQfJVFiWcWd8E0LkplleKoBvOyZUN?=
 =?us-ascii?Q?drDDRrAc2XJyiTiokyFcnOawWxV+8pKffBEvj350VNO2bqizJnTOhH6/pvj/?=
 =?us-ascii?Q?FPhFd42Xmrkyl4I9piURnls+38emnQyatAslik7i5orW7cHvk8rQYBzq+VOa?=
 =?us-ascii?Q?efdHn8Zt8ykeXQ9nC2nhbCVpK6KWRwLoSPbGB0fQnf0Llsx2JznVT8U0yf9q?=
 =?us-ascii?Q?BtwwridD6bsnHA2uCQNqEsUInwylx4fWjGAuKSGUMWFL451Bh5GoYaZJoXJT?=
 =?us-ascii?Q?ZVyltQ5eSSc0dLlz7Y0q3uxm4rX4Fp+6dWqCULmXZ37Zp+1xWRx31787orab?=
 =?us-ascii?Q?5gyS62l7SBkA5IaXMKZugXy8mERltkUAKCYCjFh6cV8B4tfSdKO54gUHeojR?=
 =?us-ascii?Q?1fntXE72aPjR8oqdGSjw2F/gVpHpG73H/6dpFP9dZXUSHHC2ZRDKhiB7gshS?=
 =?us-ascii?Q?sx+DpaWQIw+tb/6FtU/HFJmT7n9PnAUyWoQEx3il13/aUapJsh4lvCElPPFV?=
 =?us-ascii?Q?B5Pw9fstNq9JztAqPeIt4Y/cX3dVxhyABX+NyNI1ZdyU9Nv4smoclJdnaZSQ?=
 =?us-ascii?Q?mkEQAwLv1AUa877O6x5vabu74Mg45iPdzpWrtknrJvFTrHHv7LmEcQzVXLvr?=
 =?us-ascii?Q?NmH2hy5z5bJbhO1iootGZ3wb2W5uOznJ39LOVuRdMTShzr1S8Sl7g2e94mfp?=
 =?us-ascii?Q?v4AE1I032xN8za++anSOfKPLyYRp6PPH8zAGhkOcAfHuSZ0VKPjKc1tZJC3N?=
 =?us-ascii?Q?2+MPkGxk39QnC2lWY8enx5evf4h3IfRLIswh8EQM29IFrZLHWRn8kywNUWWe?=
 =?us-ascii?Q?2lZuKAIJAQaneSLtRLoNe6tytpQvEaUJF5JsrRva0Oyf+0u3a/zSKHYCNKSX?=
 =?us-ascii?Q?yYDgWMYOdh6AZziO18LUTcVxM+0P9TA+mLksh1AKnchO2CXHMO5+9AhyCdN0?=
 =?us-ascii?Q?YYLXAGI9dXd+wZ7mpZ5LrnDg57XBedc40/HpJ0yvh6RSg60/TG3/XNUNBnS6?=
 =?us-ascii?Q?6DOEWrdJHSP+XWUaL4MgmK1IzPGal3fbbyk7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.6757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c78432-57a8-4ba9-4f50-08ddc4aedc61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7899

Make introduce_domain() use an event channel from the the xenstore page.
It is only used if non-zero.  Otherwise the passed in event channel port
is used.

The is useful for a xenstored stubdom to configure domains autonomously.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e1d5e8d614..94b2a1eaa7 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1021,9 +1021,15 @@ static struct domain *introduce_domain(const void *ctx,
 		return NULL;
 
 	if (!domain->introduced) {
+		evtchn_port_t iface_port;
 		interface = map_interface(domid);
 		if (!interface && !restore)
 			return NULL;
+
+		iface_port = interface->evtchn_port;
+		if (iface_port)
+			port = iface_port;
+
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (interface)
-- 
2.50.0


