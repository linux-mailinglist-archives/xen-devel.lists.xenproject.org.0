Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09026B2E741
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 23:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087625.1445561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoq75-0005yA-Vb; Wed, 20 Aug 2025 21:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087625.1445561; Wed, 20 Aug 2025 21:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoq75-0005w4-Sh; Wed, 20 Aug 2025 21:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1087625;
 Wed, 20 Aug 2025 21:12:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awzM=3A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uoq74-0005vy-GW
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 21:12:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2415::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dca2ba4-7e0a-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 23:12:51 +0200 (CEST)
Received: from BL1PR13CA0431.namprd13.prod.outlook.com (2603:10b6:208:2c3::16)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 21:12:46 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::4c) by BL1PR13CA0431.outlook.office365.com
 (2603:10b6:208:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.6 via Frontend Transport; Wed,
 20 Aug 2025 21:12:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 21:12:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 16:12:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 20 Aug
 2025 14:12:44 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 20 Aug 2025 16:12:44 -0500
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
X-Inumbo-ID: 6dca2ba4-7e0a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=el8LAprn5QIIYsOWX6OOtThuep5t8ET8DPNwB1E4/1rFKw/GazXbHOekAgYrcpnnr8UCZFFZmdLM4CLP01GIo5d7lJDZKlbbYStHhuOkuOcOex4f4nizNfa0O8k5JG1QSM2Rd8cacVPCH2Jqfol0Z3AvfDCw4vG2P/Y/rD5F5wJ74DaCmqCoVn0WV3Na7T6tyLEl/EuH1KpOKWPXJPkwCdO58Sqiz3B/qy3kE18gMy8wMivMZs6jt8R0tLHpw7wmnqg0d8TlGAInMTd06hruEnZscLkIXC0rkZcNttn+alAYP+c1x1mujDQt607QQtGl+MrxsLcYGV0CnQP6dqt6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y8FbORDWaQ5Tt7vudtaZzZ0Fchb9UsA1yZxoBCPL8M=;
 b=g42zsHDZNXy7UVhZ6RY28oj3/uuEDOriLA/8iSwtFq7Xf80JW7gqU6AicxJGEQEAXcINV0GzFSxs4egG3DsW5n8XXlLuCqy65+mXSAJx2bb1vjjiNrLZqT8fsZz8rCRw9MPnFf69Q6yKQ1DDX/4z/OCa7UPTH6W6T65oMGKMt7wBgi5MKT3YZimYs/gJxo1Dw6ddLlmHaM8QOvoyQBZGNR7CqVMIEcpLpMRw9nmXNNpwPwtZaPjaaUMqAqEIZTKqoHCA8rYmw7AF63Lo7NLWkqXM/ewA0e1i4UJaF2rasSFIKgHHRgPbR3qKbQVfnPqJkiHEc+2L/ouSSl7j/GcRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y8FbORDWaQ5Tt7vudtaZzZ0Fchb9UsA1yZxoBCPL8M=;
 b=nbcRhdUobFqYJRtPI6UYGK75SPZag3s7pRo8KDqbV4gMENec4/QSloWHx6OeTCSIx+kuIoUYGGW+cFWCf57zt1+9Mxh1sD+D9tGE1NoEqvic7t2C9P054Q+GTSQZVVbpE7oTS+9hRvVmoYxVBdFvPair8wsWhT6XY6KA6kwwFw4=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/dom0less: Clear xenstore page
Date: Wed, 20 Aug 2025 17:12:42 -0400
Message-ID: <20250820211242.116868-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 29031629-b887-4d80-69f2-08dde02e4ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDvpgR8rOVZX5svUM/DSZ9KOSEPO1ma7zdr6dRwA+3IsK7vGN+cxF63ZHBes?=
 =?us-ascii?Q?5KmH+Vg1N+sgdDWldDBl6ZnTp6rgUqKyIArNmi+B+5zEWTI9yRvn/TYXqffY?=
 =?us-ascii?Q?XGDFrk45gvugGZcOrpG3gsB9YwklIMO401XMEh5ePIScoYsTkPFRgPkEbpmC?=
 =?us-ascii?Q?UCiPTAogXZ7OzWRVNerXhQoi8zPUaj9MocjqLqplAxw5vSuF8ybNac+pMv/P?=
 =?us-ascii?Q?gahsTXUiImp8n+NDQ1Lbs2urF/kYOZw0SjuIiJYMuyPIxkdNdLRYLSgOdFnK?=
 =?us-ascii?Q?lBix7RB4K/PTFsVacxxGQv06Uu3eSVJjDHhVq/9ZZDK3D0DufpbU164rw3OM?=
 =?us-ascii?Q?kS23W4h6WUT+tOVMp8VPM7YcKwYyvYum42/qB2PX3afny5l/S0o+CIKndcu1?=
 =?us-ascii?Q?Z0XrhY5wTWqpgGXcX7YUQqDEXXiJkBvLenRnBlidV4p4LC45jD1u8yi0rsRF?=
 =?us-ascii?Q?OvtN+RyHqv2W0kq0JM3Uh7Udo1u/LIuHmYoE9zalJ2BP5RGbTlE3pCCdb/IM?=
 =?us-ascii?Q?4C0NlPE182nW8jQnnwJ0CSEtiVRPGe3fJqO8sQPFZaVwiQBnx2tvJ+bnFRyI?=
 =?us-ascii?Q?mGiAzURuxCCozrUXc2BzEYa+y0EJ38iP+0tczKNLQLA/Fvjb0ESDEhu7Pp8E?=
 =?us-ascii?Q?/xaUr8j1mo8FzVCFmSIC0cebMopks0RbSLn8OT5zSf97WIG1aD5w0ijHX8t5?=
 =?us-ascii?Q?D1lVZ2IwqoAPgjkaeJghqpvME4feDuKYzkudAMBD+1/8I1SttOeodPFfwTe5?=
 =?us-ascii?Q?7vAsCbPqTvzkrQaZuML4VAErA811WUm4rY9X87twMqyH081idarmy4E2akfV?=
 =?us-ascii?Q?lwu3WN8iVqbG8Bwtd5evj6aDr7n2IHNGyiyoNLsJrWCSCdSn2+uCOiab28Nz?=
 =?us-ascii?Q?4ob4ZWKdvdJVqk0PgcIpNawwA7sPDD2TPckqMFrZYOqlzI16ozhqsNbIU80A?=
 =?us-ascii?Q?N6U/EcSN/seGBlISnfEld00m4q4NvqRcpAxP58KYARKNLesYgM3YMpGB6BeD?=
 =?us-ascii?Q?+5U3n7eKLATzqneK3Xn9jOeMbGJsM0O3/agKgA+DLGmMkf3yYscpZroom3xR?=
 =?us-ascii?Q?OnTHuGgACyHOHGMCeVhsA+U7AMOgDmkA45CkZ8k9FGooOkpMArPAx9ookbj3?=
 =?us-ascii?Q?qxxcmGuhcCQsGEeituQnI1cWgpR0OuMKT9no7LH90zSRQbJubvz5/O6PwzIF?=
 =?us-ascii?Q?/yvPMZYtJFCb9ofRP93zUHcW+XRwz6b6PbtsnWhuzQlNcJ5CStE/A9M4oP0R?=
 =?us-ascii?Q?r+DJZ7AqaeXUOJLqDf7vjOJImhcn8sWIow3DrftKRaufD9vMFJnhcf9AMMPS?=
 =?us-ascii?Q?iYHezz4sd0YzCkTznxMxGAjVBKDbOjgIqAbwMiJMUv35pNbmUo+hQW8UIIJj?=
 =?us-ascii?Q?rDT2VVRZ0ipK6Y1W+qe9exRY0S444Mwg9zmLogqBhYdiAvHzOlLvWlKlBtGc?=
 =?us-ascii?Q?QucRUOkZ5K7StzlXWXzw+zZNs75oLCTvsgbDVPl80hnChzWInGMytlUN4Ie3?=
 =?us-ascii?Q?I9lDZrTVT9EGdXw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 21:12:45.2826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29031629-b887-4d80-69f2-08dde02e4ee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715

C Xenstored was seen failing to map a domU's event channel.  Enhancing
Xen's error messages shows:
common/event_channel.c:427:d0v0 EVTCHNOP failure: d1, port 3267543746 error -22

Port 3267543746 is 0xc2c2c2c2 - SCRUB_PATTERN.

Xenstore expects a non-zero evtchn_port to be valid.  Explicitly zero
the page to avoid this.

Fixes: f78895ad78c9 ("tools/xenstored: Read event channel from xenstored page")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Tweaked stubdom & dom0less C xenstored pipeline success:
Test CI pipeline:
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/pipelines/1994879466

Example failure:
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/jobs/11084356847

Alternatively, a fixes could be:
Fixes: df2c03e2ebfe ("xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor")
If the page should have been zero from the start.

gitlab-ci uses oxenstored for most testings, so this isn't seen by
default.  I don't see this in local testing, so I guess I don't have
SCRUB_PATTERN writing enabled?
---
 xen/common/device-tree/dom0less-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6bb038111d..badc227031 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -600,6 +600,7 @@ static int __init alloc_xenstore_page(struct domain *d)
     d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
 #endif
     interface = map_domain_page(mfn);
+    clear_page(interface);
     interface->connection = XENSTORE_RECONNECT;
     unmap_domain_page(interface);
 
-- 
2.50.1


