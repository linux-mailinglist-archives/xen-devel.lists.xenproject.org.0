Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130DAD5D7A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012050.1390599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbc-0004ce-Jk; Wed, 11 Jun 2025 17:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012050.1390599; Wed, 11 Jun 2025 17:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbc-0004b2-FP; Wed, 11 Jun 2025 17:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1012050;
 Wed, 11 Jun 2025 17:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPPba-0004au-MH
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:51:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2406::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aba2976b-46ec-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:51:16 +0200 (CEST)
Received: from CH5PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610:1f0::16)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 17:51:12 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::77) by CH5PR05CA0003.outlook.office365.com
 (2603:10b6:610:1f0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.18 via Frontend Transport; Wed,
 11 Jun 2025 17:51:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 17:51:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:51:10 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:51:09 -0500
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
X-Inumbo-ID: aba2976b-46ec-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS9+tL6o5AM6Bgm8ZOld/wkJKAa1hdLqURA3Dkdo9fZ/T0KCPIMbniMgtpNlgmEDNqNHSi7UdOkbn1W4gz/BAIi2lJN6awRo0Gj5HGzxino9GtOGaIEGNs0KfVuPrFiX7h+Rnmtl1fBAcTRUn+s+HmOvb4uai3PUCHPtLXrzKsGhss3XuYq+GFekjISLakotg7ODn9EaMzmHudpeJCNcKLXMC4wovxWne+YTBv2+eRi+xDBztB7tPcaIGJsKkoPBVWh3j9eABA37bKSNu7vLQx5VhMVVmw1PRXXAo4jFGVjx4jdmArMqunRE1rS/ryHzkiV4FZSdGxLw6sPCRbBw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwZGykq6VxPHFaXBhi0sOypRkWWF/eMi3Eh2+ERV1zI=;
 b=R4s2ATpXzrHCBBWq/x3mBiTzE6TB0Nld5lepMAzSUKTprEZ1Tt2AV4PRvoEDJHYMe/qlxNGWRV/5PEq0LNcI33Xb5sgHMkgmRpMI/JNCNRxvzmu2+m4JWg8Zaerm2zHJWdSbceTy1O/0KuZ+EQQ//Zf7df+s+YK2jSbA/QEUiBaTZs+MYRXCe9ZGDkEvtUaXbSmqaNg28mIJoycsJEw80NocNz6vw0q/bVmtxMYIIJJbEW4LaoJWjciVyp8Dc7Z8l+syE55U6xCMNMRXJ06US50IyISKJpDcvZKeoJT1qfbj7DEFVn1F/iU2+L3C5vpv4i8WBk0kpaY71KxvVQUieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwZGykq6VxPHFaXBhi0sOypRkWWF/eMi3Eh2+ERV1zI=;
 b=K2t+FwA+zqfpiUAvp93nLd3EEz+TVn8T/XUnRMEn/kpz6bCXp+f0nUFO6ij/OUBFJMaNB5VPNSQJL2kOrTsR+FECZeQWo+L0Wt4b2f6buFROwpsqYCPKX/rJxvOQFq/kO0yncoYbL+d99mSWgtGUeyW0DQkJBLRZj8oL4LnaRp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 0/2] arm: extended regions fixes
Date: Wed, 11 Jun 2025 13:51:02 -0400
Message-ID: <20250611175106.269829-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ffa8dc-3b45-4d20-7827-08dda9108d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3U4al701o4hms/Ks1TGe5ddnMWvtFBAzsSNkXoLrYHmAjgZt5cdA4SHCx3WH?=
 =?us-ascii?Q?4OTpO2xEIJQP3GZpAeAh9xiDbW92sM4fD2K/oJ8QnjhApa8yzJ6EXo9XupSb?=
 =?us-ascii?Q?v1GUhgXf8w8RazouX3IORNjJAqYUakPzZBrJ85sznKrfFw8kR3K4E07qOGxa?=
 =?us-ascii?Q?SoVXbjeKict3Py9gZjmoNrqvnemfS1D6Dg/qX4RZAjLob4g6L+t+a7dDO6lt?=
 =?us-ascii?Q?urmTOvy+VQ6ACV0oJS+gxJGZ7qFkhw9QDG4oZZB8FD1ylIewVkWluG10VbpX?=
 =?us-ascii?Q?yU43KC1cHbQNYSUMroEZkK4uVOiQNW0DMONFDkPkG5XcsFG+xudvknUy1D5N?=
 =?us-ascii?Q?XECenL9liJvBMEFL2uU5LW4mfYz8zewPGcit3NGgIZHWA8v9kyiFGnj8NZbU?=
 =?us-ascii?Q?2SBLIEuCXI4TBVhxqu+W9NDvndle6oqCqkuPnGcUWpPdGH37SY/Rv2fjtAgU?=
 =?us-ascii?Q?2mW73JuJf678S8TVAnR6tfC7ExpKTPiWlksoScsUYaggOvPb5xnepwgnjYTO?=
 =?us-ascii?Q?PAbkd/sxXpBD472ffxzqnLEYf/xHQHB3RlZZC3/ufMxuQGCS5mOGQYCEot26?=
 =?us-ascii?Q?VXySaDT2PxzyDPHiupDS85F3hgLhWjE4CUPLXhS+JiZ2ifYj3gco2TlIe3HJ?=
 =?us-ascii?Q?wqPDFyaLP725LXPJPKllVRF75WlqB9hMXdECggU81eGcOBInfXIUmIwNicUD?=
 =?us-ascii?Q?M8nu34KM/jsxlO1LXjsK6BykZEtyvJZldyOG0IRFVzablujxN+pjNXSMWZ09?=
 =?us-ascii?Q?IJ0dJx+vN3sgkAoVrPi7ZtgVbAvdKRabuvqMIfKTk15TpDP2+aRX+WT64VgU?=
 =?us-ascii?Q?WRKopXePmj/6Jfwtip5huwsfTBG8cTEUZGORmx8JIwcApt2wqZ9Ju05v7vXS?=
 =?us-ascii?Q?bXM6U0xNj/4deQqIY1MtqkAuZ2XXS8calWbU/24+YqNacEThU9mu/3qpSJtp?=
 =?us-ascii?Q?o+h4SMQyNM4iRawpdml8Y2rZSr+zUO+QAM8JtGPlm1JE0A+5Z1ccbaBhDZSK?=
 =?us-ascii?Q?b08DARL1dn+UPE9i599VTHwNXsrhLVomIRBFth4DFGv6ntf6vL5wf2y7On/r?=
 =?us-ascii?Q?cokRbY4VnFXBWKtryrfJ5/D4AkNwmSqWkFZ0Ph0bnPthQjAMf03L8J1PY2Oh?=
 =?us-ascii?Q?Lsa/I9VolDJ08IPToXGiFU+p3NfB5qla6WJHA4tMBz6OIReYzoDollbUP7Ev?=
 =?us-ascii?Q?uuoRZQuBxokiZ0TQJKlvfaMeJgEjn91DnbNKssFN32DDEj/73w/Z8OYNgZM1?=
 =?us-ascii?Q?njDgo5jaiqUknjVVm4M8jVnQ1GjfQ0UbDjU9EHxVDjV6ELDIA30Xu1gaIVGP?=
 =?us-ascii?Q?/vPr4ilsvc3V37VISMsEv+LuKDIFqLW6QNPEd4xvW1MNKK7Xfgw4opessjOP?=
 =?us-ascii?Q?wJrUBw9dwQ21OoEvr/GaaXSIYoSGS9JyumGA1AXSaaNsM/lbYAXBRlCiqGht?=
 =?us-ascii?Q?OTfTBoDSE94ij7aQwaqNDpxxtlE7uAL5G9+wj41EW6gra14+N1CoI7bv3Rje?=
 =?us-ascii?Q?zQDNoojX2YwxvL+6Rt2ysJ5ohVAZBQLlDqDE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:51:11.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ffa8dc-3b45-4d20-7827-08dda9108d4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

v4->v5:
* see individual patches

v3->v4:
* see individual patches

v2->v3:
* drop committed patches
* add ("xen/arm: exclude xen,reg from direct-map domU extended regions")

v1->v2:
* rebase
* address feedback

Stewart Hildebrand (2):
  xen/arm: exclude xen,reg from direct-map domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c          | 110 +++++++++++++++++++++-----
 xen/arch/arm/domain_build.c           |  80 +++++++++++++++++--
 xen/common/device-tree/domain-build.c |   5 ++
 3 files changed, 171 insertions(+), 24 deletions(-)


base-commit: 657a95a2baed48dc2ed6f2fc7ef6161ad7ba010b
-- 
2.49.0


