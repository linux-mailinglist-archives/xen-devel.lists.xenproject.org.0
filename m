Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2977A2B87B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883267.1293312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDYx-00038n-M9; Fri, 07 Feb 2025 01:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883267.1293312; Fri, 07 Feb 2025 01:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDYx-00037c-Iy; Fri, 07 Feb 2025 01:53:47 +0000
Received: by outflank-mailman (input) for mailman id 883267;
 Fri, 07 Feb 2025 01:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDYw-00037W-80
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:46 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20618.outbound.protection.outlook.com
 [2a01:111:f403:2408::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ceeae7e-e4f6-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:53:44 +0100 (CET)
Received: from CH0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:610:74::32)
 by SA1PR12MB7176.namprd12.prod.outlook.com (2603:10b6:806:2bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:53:40 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::c5) by CH0PR04CA0087.outlook.office365.com
 (2603:10b6:610:74::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 01:53:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:32 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Feb 2025 19:53:31 -0600
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
X-Inumbo-ID: 5ceeae7e-e4f6-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0bZcbobJ8ldNg4dBZsZJcVi8LuJgsdgftjDMLb4KzEQsVmUXugnZ16vUgaMeBFyK6LghLmqAVbYbje6psdO95B8LVPfD0x7RKPOiLIkHfN2rtqXU7LQd0rMOD9ySWwlGjl6cJhyz0SuWh4JLyKOUDZZpfBdEo9pPoiNVS9Gmus28ZAzkOjBUFlXnZ5OnDB1dZapZECHpYoYomQ4PT9MRqg9eWPymY7BEKIyXycfsH/w4Rj2G+1vwtbqqxax0C6hJDQvzZW+zFsp8FJmoPGWRec6lR4gqE7TXn1YGKSvAJJh9XCKcPrkVyXAjqSmhFTxJW7yPlDkMIWyAf4izVyt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1bdcCObsj+QwOyEYoKjnJjMaaXFnGMIovS47GQxg+c=;
 b=PrPd6L6OMFAkABRVWEE2KRv4I4FTHckXKGny88jPaHLLrLeG+nRq8vcAfUh6RqhclqRsStc7j3wnMSnt9cCIouPWg5690y7DtvcNNLBoeBNiO/PPriZW9FiwROaFTXyTrafi41jdD1NZ7sd3iBOa97G0OpD0h2XBJX/OgvbqEGO/NYLVk6V77x0Gzw54e9+e0JxszMhoZVonXsMHXKAOdB3RqcSQO3dcL7tcTw5EEZKRxjJIV3/3wUulBPxLcFxDW080MXRcRwOe8/d4XRs51y2JeCcziuJ+DAvhaFBLhSx9aEuwnhRKDIKakALWmaM+pfyBQgGFzeBpJvo7fkdeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1bdcCObsj+QwOyEYoKjnJjMaaXFnGMIovS47GQxg+c=;
 b=oxunCBjY6kDzkBXfGL/qa84QRhL5Yp42Zn8ZMNN3iobs4VDyAlgJN7lpoKgMnbeE/fViEVBEEJUTJwSy0j//ABOCFQJN4bgVwOKx3BsgVUBaGTI7TIQ4O2FvAMeTFsmLeMfXSCjJRhaOuDDYfIlRr2VAlLpg7P+j2NnGOy+iDdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 6 Feb 2025 17:53:30 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 0/7] Guest XenStore page allocation for 11 Dom0less
 domUs
Message-ID: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SA1PR12MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 0302b503-0e23-4e88-d58a-08dd471a3e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jo8cozFSLRTckD2eOrfE/qiQmcABrJChmULdbqe4s2r9o3MI+xXWebgjQutO?=
 =?us-ascii?Q?FvNbrlKJoKeSh3uDlVkY1UGMKQwEpUd0stXTTmZ8lASBxywX2EaVdBekQROn?=
 =?us-ascii?Q?/te2nyXPAk3jb1PmLXyuchzlxPYmNXIB9B76cwxbGbt6d0MLwm2x45HtxpwF?=
 =?us-ascii?Q?077OUHZpRdPu5J6L8A5Xz1l0wYCUSFKwor2NymhizxVfd9jd4uYJA8fUIilR?=
 =?us-ascii?Q?OEuibcKHUTGAkJz+OPCU4cqwWY3b3+UbOw5i0bkyBZudRQ/jdns+fTOZ/Pir?=
 =?us-ascii?Q?PMWQE/0IIUAkM1B8z90vXwE0lSfWfc70w2+vo9kKXnMRAfB0fP4aSJaVQgnH?=
 =?us-ascii?Q?NdxMuksK6NhZRq2PJOlPGpBtNRzlDzbHngAFHGbuRKRozOnMjU0UiKvG+j+d?=
 =?us-ascii?Q?CTnqX1QhO0x7vXuWN2cYIYCVZAVHaTj31XWX2j6dqiO+yJ30AWxTEr8DzIJD?=
 =?us-ascii?Q?XLuiwGE9N5fCJPARWnbV6xp9Z+Brz4TeAJJzyfYtnGO/Lvj1BnMJUUb8e4qf?=
 =?us-ascii?Q?rTAs2131EpaEZJ/IgFVfJL/e9bD/wgqxoGAof0gutbi7iZbd/ZH+oMGdEaoj?=
 =?us-ascii?Q?GLXgTPG/Xk2nEfGB9bK2HXE9IS9pC/rYLvVgjfyqEuWPymlgKslKglDQ7SB3?=
 =?us-ascii?Q?7UdlywT0CqqczbtcdvEIpuQoTRUzQnsms+nVDBWqTk27U7E2XGI32KDnAb0t?=
 =?us-ascii?Q?Cn4qcLSPvjaL6FoAaQ4q9zMW/Mk910wrixrUMBd/KWe/vLT4kcs1GjijVaVW?=
 =?us-ascii?Q?/Q3xyC3djQLO/YzK4DiiahGJL+OPfMwPhZkrU46H8c9pcyFisbqjryV/RGwv?=
 =?us-ascii?Q?Ku1f+DiSRNHj8HgEhnhNDZ6FJ9AUU7K3DgvEo78DvMvhJ949Ztmj+BtL0Bwx?=
 =?us-ascii?Q?x3A2Vh/coubkuiqvmDR+/osRcL9+L/caEeq6bQ7v0LnIdE4wJovx6hO4p2R3?=
 =?us-ascii?Q?cA96NuBIT29kqwLg34W2sXdmOG6EK8gD0XOKVZAyEfxbL9W3aATuKLeND1hx?=
 =?us-ascii?Q?QGv85sX/JOO1aIT1mNtB+bkNFyyAIkp2YJgs3uFOGish4t2DXcpOKIIzKv76?=
 =?us-ascii?Q?F4I0gsxwKSTcJsrxnMR02bN8JztNrPCD1QS5vEuL9iade2MSWsLnmffNbj7e?=
 =?us-ascii?Q?qc99Hb+tOpKBylyC7oZtidNANR7HVQAoRAH7xTg8HJLBB4RDRJfgA+mvXRQ8?=
 =?us-ascii?Q?sb7Tr23d0Vpu6h+uoc0tq6Rwvb22G7EPQ1MW6V0E+xABSzo15DhmXVp20dwS?=
 =?us-ascii?Q?0Wifpzt2bDR/XSMYexg22/Ei980Kqc1gnEK5ujGgZOUuHsayHDq0O6KL2MzD?=
 =?us-ascii?Q?C1LtnKxXl7ua48TJ6sziP3uqbLZzIVrS2EnOUaIhqxQaQcV3n8c+DdlDH3Nw?=
 =?us-ascii?Q?c7hW1zFEPqNitlagGeJws5WLIeSN+fq1x27o/xH1rgbu7RhcvwELMqKAMihc?=
 =?us-ascii?Q?RJGFJf1p0SU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:39.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0302b503-0e23-4e88-d58a-08dd471a3e71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7176

Hi all,

The version 4 of this patch series [1] was fully acked and committed.
However, we later discovered that it caused regressions with older Linux
kernels without a fix [2], so we reverted the patch series from Xen.

In the meantime, Linux backported the fix [2] to all kernels, so at
present there are no regressions any longer.

This update on the patch series contains the original v4 patches
unmodified. It also updates our automation testing infrastructure to use
a newer kernel. It adds a test to validate the feature introduced by
this patch series (PV drivers together with 11 mapped guests).

Finally, this patch series introduces a new dom0less option to retain
the old behavior in case users want to run older unpatched Linux kernel
versions.

To verify that the legacy option works and retains compatibility with
older unpatched kernels, I added a test at the end of the series using
the older unpatched Linux kernel and the newly introduced "legacy"
dom0less option. I don't suggest we commit this last test but if you
think otherwise, please let me know and I can clean it up and also add
the ImageBuilder part of it (a way to set the legacy option in the
ImageBuilder config file).

Cheers,

Stefano


[1] https://marc.info/?l=xen-devel&m=171659112108921
[2] a3607581cd49 "drivers/xen: Improve the late XenStore init protocol"
[3] https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1656094397

