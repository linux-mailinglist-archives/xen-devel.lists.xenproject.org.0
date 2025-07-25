Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42BB11671
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056832.1424874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ao-0001wF-7i; Fri, 25 Jul 2025 02:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056832.1424874; Fri, 25 Jul 2025 02:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ao-0001tr-2j; Fri, 25 Jul 2025 02:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1056832;
 Fri, 25 Jul 2025 02:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Al-0000gR-T9
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f9535fd-68ff-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 04:28:34 +0200 (CEST)
Received: from BL1P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::12)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 02:28:30 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::d6) by BL1P223CA0007.outlook.office365.com
 (2603:10b6:208:2c4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 02:28:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:28 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:28 -0500
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
X-Inumbo-ID: 0f9535fd-68ff-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1Tw+DarVDWINqQDZpvie1Ve+DhLw2uBVGOvNmXaBbC6j4P7EIo0+bGWhhZa+m7LxhrnuC7Xe/irm0wxGNWYGJwifuOt+YZKPQsiR0j9UVcmBKVYJQB/6xMmWqGg7M3iKZMxxrNHLsaQGNnkgfF6zJ2Xa9Xrk78bi/rsW7SfIKd28eBn/YeVUShaVwjPZm2TthXgpS+U6abegvvpqL8Uczu2LtIV0wx/UpjwiUPT41+YnFHPjTRj05pDy2qas8nyE/cRal75y8XKW47ukpCjAZarIqc/PhhI4OoWjWgKfS1RL8TMGd/RS9HbGnE6b3oSzx6WRRE160pnPph5SbydkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvm7hSgNOA3RlYxZdittdf56SFkDqdFCtu34s3PU7g0=;
 b=vEgKyOA46hVP1spoXdu+TKg7Lu9zNdNs1XVToWaYID8YF1A3yXYIDLybQ2ZbwU5yRJKdY5qD1yV+4ferzfmlmxUBkbPkbX/GW0eXw8EdCMgA829tKwnNuveR+dM6ESI3iEcqheh4Hvkq9aDCcUtEvDLQj1hEWG/7Adr4NU0eg8YLLSaNcZCuv1FM/lMS2Y2qiNwnnCCRSlIrTZDKzc8qzZHkmFxKq4YsHa4Z/+655sUgBQSkmdyRfT1NDRogsZ7hmslF1ux1sgi+KWr59F3vnV7gmg1zLVfToE3afUlbbbYb6857Hu4dxe0bwAQbvflO1UAdFgj2prNqt1wGukk94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvm7hSgNOA3RlYxZdittdf56SFkDqdFCtu34s3PU7g0=;
 b=YHxo3HIeAxyaHemY0z//bwI9e0MQp2X1phk5oBtm43Jai1Zqa35AhXuCVoGzqvF2tQ7IbMBzj7rvS3WZJERWawP4MSE/boeBPtHHvl55Y14psmuFUOo2osZZXhAhA+GaDckFKBF7aUM5206Rlf1smdsjhR9KTA9y0C4l4ofDzNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 05/12] tools/xenstored: Read event channel from xenstored page
Date: Thu, 24 Jul 2025 22:28:05 -0400
Message-ID: <20250725022812.466897-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 21219bde-2800-4bf6-d591-08ddcb22f118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kl1mLGnSN3k5CmXz7Sp2d6tdJUMkbY9Zl+sHf3X5VmgHxGS4eQxX+2QZ4Xqq?=
 =?us-ascii?Q?R7/fQa5axAb8m5QV5zaIOv338mzmV25tlOeGWMTqRMs7ic+wlgnoA/ptOJd+?=
 =?us-ascii?Q?LoCVNmfMrfNwdqOWMewM/2qY7vfUjCEveDHqnzLq+ECq2FhyDNrIG+u/AKtm?=
 =?us-ascii?Q?GE9iRnqnSygxL7169ICSYxGZCp1kMUnBDc0Q5ljFi7Y1hfkM7yoVDJZvbRWp?=
 =?us-ascii?Q?NbizrbGj519eea1tcm+MebkiwjCMsOkZgVNbNs/2N72JpqjnOjYrwMrjZxiQ?=
 =?us-ascii?Q?uPymXVDUjSUBBBAXWiBh8g0XfzdB7s0CKlve7vN4Is3rTH3tw/TRJ5X412Xd?=
 =?us-ascii?Q?R6w+1ljs6wUiBD+UC4G3YbiGdD5CMzaEjvSmDJeZLuNM33qphI5UllVXyxWf?=
 =?us-ascii?Q?acAEKErYJ8i/UaaEDXBIDhxdAhSmzG3RKIM3lAfZQyRONRsyLwy1WlvuRyFd?=
 =?us-ascii?Q?c1ywF4JP85ZiRelnonshoCzp4aoQOK/8/08BwHE3BdGAtawQVwcOoAC1x8n5?=
 =?us-ascii?Q?YMD6ss07LYwfYSwW7EjfHuJrZvKVK1H3gB91+9jtEqKv1Tw6vAJrhnOmCIpN?=
 =?us-ascii?Q?cdKftLyEGD34LWpJeLXRobUzMadzEcMAbeBW+uKuG/upjaKorV+mGK00melq?=
 =?us-ascii?Q?0I06zitTbAv+tVzZ6psAqgnDK41skgN2C7ISOdw4F2YsSPuc/9pr09r8iHr2?=
 =?us-ascii?Q?3GoIn4+aQgD0AeREZNiuVHYLMjdMCmMA668id7yt8zEXE13KLsuQ5qGZmr2W?=
 =?us-ascii?Q?gSZytHXKtRYkB/OVBMRaGkHx+clIsXetsu0fIxpC6J14fGbCYSnNbNiNQZOJ?=
 =?us-ascii?Q?EKgDDQxCdFliV0+Lg0H2/cS1pnOM/ntAMXP+JSVZZsVMDl15diKiJtJ6QVSE?=
 =?us-ascii?Q?Xe1/lcvEoLxU+fyH7ytNgWXp2IV7DvGtv8R/9O7fakz/2z55w+0YvtF3zpgA?=
 =?us-ascii?Q?SHgsp8UgXzdMGulQRBCjeYLHSi6IAhQERO6LUtsl7NwbsSQX916LzilMGJQo?=
 =?us-ascii?Q?7TVOucZdp43ku2lzHKOwmKK4VYW4AZmr86ihU+f+SNfckpAHocg2RtfbYUsn?=
 =?us-ascii?Q?lUoFA/BxKomNT/InD4oFZf1SxBV6qsWrVtr/ZZ7c6N+VRMDqZgB+PbiqsA3Q?=
 =?us-ascii?Q?DravCryoEJ83Os4P6IdyFBqRQ+q+aSQAJY2ody0ueipXDf2lS36PSMrbvULO?=
 =?us-ascii?Q?OdR6+u2OdVhhdg8/tK0//O9T+BPEJoF5HsBNWVaIjpbkEYnNJPQpXY/7b+CD?=
 =?us-ascii?Q?xFdy08wUPiN5IKidMqPDvJC4HE9VyK0JbPgaOUwLJktCxQ4QyDB5+M7XbthB?=
 =?us-ascii?Q?I+ickl6lNV5B+7qsOpfCoaATFgQRaGBViQ+K9q8wsFZBFf6F5idaClFdmAJm?=
 =?us-ascii?Q?EzSJYR1EDQvssTRir3hPNh/VGiPwFEO4ExIOsXuCi0ttWtx4n4VVXSacT0GS?=
 =?us-ascii?Q?stIoqinH/X/Vk4iOBCA7jpdP6k88e6ynIpKxU2ID86cPWV2lQZ35nOn/2CmP?=
 =?us-ascii?Q?7/ofHO5hhDzhUs6qPn4SqJbIIdXrR37wGnG1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:29.0317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21219bde-2800-4bf6-d591-08ddcb22f118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

Make introduce_domain() use an event channel from the the xenstore page.
It is only used if non-zero.  Otherwise the passed in event channel port
is used.

The is useful for a xenstored stubdom to configure domains autonomously.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Remove iface_port variable.
---
 tools/xenstored/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index f119d714ac..1241f8c73e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1024,6 +1024,10 @@ static struct domain *introduce_domain(const void *ctx,
 		interface = map_interface(domid);
 		if (!interface && !restore)
 			return NULL;
+
+		if (interface->evtchn_port)
+			port = interface->evtchn_port;
+
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (interface)
-- 
2.50.1


