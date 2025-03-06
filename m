Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E4A559F6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904185.1312157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJth-0006F4-Jx; Thu, 06 Mar 2025 22:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904185.1312157; Thu, 06 Mar 2025 22:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJth-0006Bq-GZ; Thu, 06 Mar 2025 22:40:57 +0000
Received: by outflank-mailman (input) for mailman id 904185;
 Thu, 06 Mar 2025 22:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKB-0000Ss-C6
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea46da0-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:11 +0100 (CET)
Received: from BN9PR03CA0068.namprd03.prod.outlook.com (2603:10b6:408:fc::13)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:04:03 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::92) by BN9PR03CA0068.outlook.office365.com
 (2603:10b6:408:fc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:00 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:00 -0600
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
X-Inumbo-ID: eea46da0-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcsW3wdzI+XDR2piqXad7ZdUfq3ZY/rcJLCahasoTxYKJHp1K6gjAqUOEMzngL0XFhS7ytPF9GZXkR9palzqw/hJA7bxfW6shsjCvQBi/qDn/kdV/8onqwR342EMtU7tkU7BWFjVRdFwqaDCbTx5C5hh9cGTI1l5hKW2D6xvx/zLI3FYk7kW/lGc/oGPeh33xmcga2f0T09EEg/OuA+zOldAnmjlf2niMsK5pB+p842A7IFNjii6qeI5NqLZoA2cet2wWfZUZXvQiCNfOaN9PuUXIsH/dzY+ixS8XpktxGM8zJHy8eEGL8A2wVjCtbg4MZAIwhxVd7wuYS61gb2SGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIFP0yUwDgWt/wxdaqwbVpnFqSs0Z5n/kZ01lqaZPKE=;
 b=uPg281JgquqpLDpTLIHKCBxpFFVjr4C2jzLjtIF04srQc7ghytxiLoKkKI+xb1YH9W+bIBuqQe77VqxiHgrAumJ3kqASiOPZwz/bk/qhLFEtGb1XT9Lds+J9V9ssPamCqPOZ6q5dG9K+z1sTfUMEe1faBQNKqQdQnhrq/S9Le5Y8ft30Yyxw9fRvkIy1KqObT10uKtthn3o3EiWl3R3rbaFzjLWVQmZWMNxgs5Y+2njbhUazb0yC7NJ+G4KpPbyROBasMQh0b4RJqmf9PQHZJ5fwtozpnb/XaEddQ0nIh+YbGtO1/Wi0wu8cZGAVK1oleD1HifohFkul4uj/ElYodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIFP0yUwDgWt/wxdaqwbVpnFqSs0Z5n/kZ01lqaZPKE=;
 b=092s0rQ6L64f+pe+2pm9VHlkpd/nQx10oMS1rB6NXFEnOm8DuDKkIFEDoJTxHB2a/wpMZ2gNR2nkPBoKlPMWSv+MOlDzAGaGS2h/kBLElYEjTzeZtZvX2A/WYIjK3tFb5eTQnmESlHWo1KS7wJdh6PxM0ZlUnDHBugz+33gwEuI=
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
Subject: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and priv_domid
Date: Thu, 6 Mar 2025 17:03:31 -0500
Message-ID: <20250306220343.203047-12-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ee64c7-4221-4b6c-ebb8-08dd5cface3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9CrEb4EI1H7/V5m3sLXdI/wcPkcSf+U6WukhW0Bgzr/J4zRTRfpn47FGDYF0?=
 =?us-ascii?Q?xv+X7HwWNDG9yXZIWyBGc3gNy/RI4szzANb5x6dJvLfJ2nkj947tZwFnh80q?=
 =?us-ascii?Q?CL46oHCjU9W7Aa3qgW1y+WkIUbyyjQV6TSvfCyKEd0SOW3B8MpO0lt8S6n0u?=
 =?us-ascii?Q?2E6ZmCFHCwSRoDRqArYq7jA0oyOmiSEteJFi5vMAqlTUDrLJ8dsQXaMZOXs4?=
 =?us-ascii?Q?OjKALRse9CzC2YiSCEvLQCIJRAy0HXAkW7R45L9azEZZWpFPKpuneXqW6blA?=
 =?us-ascii?Q?H2h9stg4z7JJQZuh4jH31ms5+ThL0FZCGOZPGk5bH7W+Zi0BUlsdj39QhWIt?=
 =?us-ascii?Q?/CUrJivRRetz3jWL87txSFXnpJBfYMT/c3oohzncJBSqXtosruwIUve8OoOm?=
 =?us-ascii?Q?KLcHoX2vSPA398fR0CCVNgF8EZWHN+wg7RLwDdUw9ch9odjQcrXIQec2/av1?=
 =?us-ascii?Q?8stATymskr1UwxEvzx/AQcLW69NqctnVY2TAiYz3sWaQgwk6KtrpW3gzGiQa?=
 =?us-ascii?Q?g/FeddnprpvhOawm+8kldM+AUuHBH7t6nPcCMqsU1oLPl9EW5PQG2YTtcvE8?=
 =?us-ascii?Q?ZjdKoaymGxw9jes47jBfQcg23yvyX+v80K3cTDHqCd1fOGIku2t59AucXtfl?=
 =?us-ascii?Q?mfRHpPLtVACDPJKDiIdoZnLsRUZ5x7haXvg7jNB6b6wExiHhqw/OIvpMDcZY?=
 =?us-ascii?Q?rZPkvhsO517JW1pl8lZ5LWU+lV4+gH3i0FcAbz7quheCIlUXKhNAEiMvBhTJ?=
 =?us-ascii?Q?GFKu6IrgX36uThZiV/aiYfZLajgYYthWArlJ8TsdFTedIGXmfeO7sUHQ8k2Z?=
 =?us-ascii?Q?Pg/AA7G2GHQUoCJPKHqmiRR2DBF2SMdvXnuZ5j7mN4UDdJ5cLQ07QJwvn9lU?=
 =?us-ascii?Q?y10aZimJxcZRDpCnyyARJNA7NNyKVR+TSj5vLA7Ab7MLIuxxmUDr/Eksc/1A?=
 =?us-ascii?Q?iWTDrW7GTOqTJ23RmvwpjqtVCAzhnzc6+aDNsjwaEa0Qn4A2Jr7BkGy002re?=
 =?us-ascii?Q?gU93ORTGoAWJK4T9Y5enRo4EQ0mWUhLJMn0Zef9SXnnJ3VfCudp87H5PZFee?=
 =?us-ascii?Q?LZwVBdP6fDPPSAidsFlwiRz0bFMnMIMSsUlIFLCXdbOseYYQez1sapuxXgCX?=
 =?us-ascii?Q?exBoMkx41+/pMugph1+Pwj43EGkSto9lCxqyo7NLi1bzyxUZqRRgD4LPdW8+?=
 =?us-ascii?Q?OE7yiqVzZnYnItRcPc9ce+whgxlEZsRGd5oEfFGW3cMW4nMGLlwrnqlvXjbs?=
 =?us-ascii?Q?QSMoY1Y4EnpjDvt748OCSL/hXnkcc0o292Vt5szjUt/CNJD4zpY21AZVVYc4?=
 =?us-ascii?Q?9+ExYjXgg9PhRtA0jRYLoSqou7QW5K7PEuGqH7/dhXOamWwFOhgB3PtD0tJA?=
 =?us-ascii?Q?l9aDDRhTRxgaG3B235Q8HJnaO5WCThhY/z/XszcK7vFNKvz5ZGOOvvdui0lk?=
 =?us-ascii?Q?MBFx4cXrXqgRu7AR5v2/c1PZ9HI87+847j/Eyj4C/fvWcbQCcYhhK0jy3lSV?=
 =?us-ascii?Q?YgQqKhogCdX6RwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:02.7884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ee64c7-4221-4b6c-ebb8-08dd5cface3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194

With split hardware and control domains, each domain should be
privileged with respect to xenstore.  When adding domains to xenstore,
look at their privilege and add them to xenstored as appropriate.
dom0_domid is used for the hardware domain, and priv_domid is used for a
control domain.

Only one of each is allowed for now.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 64c8fd0cc3..f2394cd6e9 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -795,6 +795,20 @@ static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 	return domain;
 }
 
+static void domain_set_privileged(struct domain *domain)
+{
+	xc_domaininfo_t dominfo;
+
+	if ( !get_domain_info(domain->domid, &dominfo) )
+		return;
+
+	if ( dominfo.flags & XEN_DOMINF_priv )
+		priv_domid = domain->domid;
+
+	if ( dominfo.flags & XEN_DOMINF_hardware )
+		dom0_domid = domain->domid;
+}
+
 static int new_domain(struct domain *domain, int port, bool restore)
 {
 	int rc;
@@ -831,6 +845,8 @@ static int new_domain(struct domain *domain, int port, bool restore)
 	domain->conn->domain = domain;
 	domain->conn->id = domain->domid;
 
+	domain_set_privileged(domain);
+
 	return 0;
 }
 
-- 
2.48.1


