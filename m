Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5495D4CF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 20:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782563.1192068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shYaB-0002Sm-0d; Fri, 23 Aug 2024 18:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782563.1192068; Fri, 23 Aug 2024 18:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shYaA-0002Q8-T6; Fri, 23 Aug 2024 18:00:18 +0000
Received: by outflank-mailman (input) for mailman id 782563;
 Fri, 23 Aug 2024 18:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDtM=PW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1shYa9-0002Q2-KK
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 18:00:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2412::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b62ddb2-6179-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 20:00:14 +0200 (CEST)
Received: from BYAPR07CA0068.namprd07.prod.outlook.com (2603:10b6:a03:60::45)
 by IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 18:00:06 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::3) by BYAPR07CA0068.outlook.office365.com
 (2603:10b6:a03:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 18:00:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 18:00:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 13:00:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 13:00:04 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 13:00:04 -0500
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
X-Inumbo-ID: 8b62ddb2-6179-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH35kBiOVZxCIDTlH5xgk54p+DlmnQdVZLoWvnn0bP3rv7bHD7kOxhqdRgA0+i1MUROZ1kQUd7dEHh4v6HxmiOpixqKk+PREqSPWD0DcFCgWencD3+UbJXRFsSrosTuqvmOjEMTRVOcYcQxuKk6qnqEdN6A1ASugGHxHpDhJ4gk+cSUhNtKINbvbVxy9YMhqGLHCwx6eZL3ZbZAtwpc13ZNiFAJJvUtK6R9g0weYpgGrLzfcCfOW7NJMYA8cYbkahfgJYr3abbJwKnMxWe8YZifS+evV2/nQqFJi173F4qArPNMcmvfZc/8vIhdPZfD2EFUP+wceVwIBJlMEu9K7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfzpGZMDmtdl4dSoE7N6VP/grakgFOJct3JY2bcYMtg=;
 b=FyFtnH0yvH/kcEqvSQAtzt8XwbFQElfdHqYKRdVI6l+zo2AfxMs/O6E2qwKa1cJlKP46JGiRZEElw7FI93lZ5OVZrMm78B+BxMZ8NlbCe1f6VUQtOlZKkdbQkwg/d+aCCUF82H5CQGkrxqkn63ABUWViljd3vtmyvjYBSPVi48GXXRMg3IEzydBKWhRsimN+VS4L0MMMvUzsse7frjhLNzeEKcF0FpjWbX7nyHfHqkTK3Ml8HzkRvjiCAarWl1xDdcT76hM7mXBJ8YWnHRbt78hEUBqDVqXGmyYN8fBHP6VDYiY+e1TJwC6BHjMJUqe9hNiqLN0wBXJYN+n5Qn4ZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfzpGZMDmtdl4dSoE7N6VP/grakgFOJct3JY2bcYMtg=;
 b=RMRgoZTkgj1lcvnK4fVRM31Udke1i6Us5jvRK3Xg1r8o2o2RoKA1n0aoZCPL7XAgD3T6rjX0KLeudPyWI2zlnAnPusR9kwUIHBFTBPb2ly1QuG6cVEwAQ7tUrqdqq8Ba3DZ3giUwTgYvJkCqs71A2SseZvDdvwK+Ica9mrr77o4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 23 Aug 2024 11:00:04 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
In-Reply-To: <d5e97cae-fc6d-4913-88ca-47ecb157752c@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408231035220.3871186@ubuntu-linux-20-04-desktop>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com> <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com> <101a7105-5638-4c69-a5b0-29c252284aea@amd.com> <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com> <alpine.DEB.2.22.394.2408221327400.3871186@ubuntu-linux-20-04-desktop>
 <9DA45539-F136-40D8-BF46-E63EA1B8ADA6@arm.com> <d5e97cae-fc6d-4913-88ca-47ecb157752c@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|IA1PR12MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4dc1ab-2b7e-4a20-b7f6-08dcc39d6b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0mYCkGuiEZQCsUD/bJKE3jxX7uNCr+TCV02eK6q7yrE2lsn1kdKmm7tVWmW?=
 =?us-ascii?Q?ISXfYqH3JIx0I55zAZvM7lAM8BcSBL8FBEy3fpihC4v+CGWmMVFVsFuNgTVp?=
 =?us-ascii?Q?T4SDqFvFp6IsuVGcfmoN1dfminN/AOfMYBZkLTUYAEO20l7jDXy3kvc3JvWt?=
 =?us-ascii?Q?J9Csf2tUj1DMa8YsHQ94OMu4becOgOU7WeJ8BZqKoTgLi4maf6TJKn/64h31?=
 =?us-ascii?Q?43TRHItls5QSN8YMLsWYBIHXYlx8MVH63NXAz40fGREFuQLdufoOKZdqIcBW?=
 =?us-ascii?Q?ngUMTiSvcyqcXZXIqdFZzHpq2IWuuYFwngz+WTsJw4QD8msE7boprCuh9+7c?=
 =?us-ascii?Q?sRmSG9Ognkq2/P7+jq9OID2m1NbLsWVm1OgARK4xC21K54qO7Hy+rKZ6GOgN?=
 =?us-ascii?Q?P+nl0O+i+p6ucMAunsUX2CRiWRwvCIGPBfxGwjZBPcoxs3A2FkyPGmw7gQrq?=
 =?us-ascii?Q?i0ywCEpsXTPYwDbL/bNaCQNDkuV4bLD2dz4zWjZjJIHQOy28fTSoKsglod0H?=
 =?us-ascii?Q?+TIwMfhW3aZOwfza/9HHOWfP0qJ/6sq9GAkXwwbJuLVI9dPV8pUYSlo8fQPA?=
 =?us-ascii?Q?lO7dQEaieBYRU8vetkYJe652Yr5zUIEasFMeAZF0ucKTWI85EJR+IS49vhdw?=
 =?us-ascii?Q?fK1WAxjrdYqS7ZqQywP9hrldbqElJz93vYGLmf4Qrgd87y9L8dTlNOb8SNoh?=
 =?us-ascii?Q?Zz12qrw6wz5IVlEploeCz27SrNJZmn6Q09vdVNh0uPC3+j2dblDPA3ixDR+E?=
 =?us-ascii?Q?p8z2VFK8BtwUWUVZt21mFPmpOUYc0GYCl/JNri5Fqluyen2kJ+H37Njv0nUe?=
 =?us-ascii?Q?4C3RO0a6n0a41ikBQX8ynIbsoUk1onm+NeBADkFuFp5CYsOJGqv5PaJyUFES?=
 =?us-ascii?Q?B16+lISu0dGk5/lnJPx7MIecm3XmnMf/kwh07LPOpHvmRMYOMCzdFL3gp4nT?=
 =?us-ascii?Q?SzbaETWDya9uB5L2vssi1Bjiw3LOypFxrWuMHfqKp5gGG4kajHWmaum8ARzL?=
 =?us-ascii?Q?wufBceaNAeqLXPhsbkkYXvbtH/aN1PxS3/U3D052uKda4j2tXGMp+xmhPXKC?=
 =?us-ascii?Q?2Umq9fc4GYTB416urJKVHqalq4DpaNnKkHe2MtMotsWCsCpx6a1rSdrypj+i?=
 =?us-ascii?Q?ONFPJJiKwn+65UPGciiopuRsumcjm94fhkg/Lz086+Mo0I0Yd5vPdaiPL+cm?=
 =?us-ascii?Q?Y793UvzfwBVemuKCag3XZLBm5y3FRxoBIXqAvOEKSifN+hWJ4X5CFHxX1/a3?=
 =?us-ascii?Q?V+OxI25DIG1VwcXkF12xtvKV1oxAi2R7Hol8pKBQpAsDeEWFIWM0Nxij4CGs?=
 =?us-ascii?Q?AtPaM530WEZvjE929R8xrikAcAEUPrxtFyroioKRi+QGjDXacbHdyCnbNqDu?=
 =?us-ascii?Q?EkQjOCIYv6Z0U8NQGXNeHaKGljoxRrqzXklsNE+B919CrxyQHBnncb6ip4La?=
 =?us-ascii?Q?P0o4PLMiEHRDpwTak2HthLgvw/7gpMJW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 18:00:05.8454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4dc1ab-2b7e-4a20-b7f6-08dcc39d6b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8285

On Fri, 23 Aug 2024, Ayan Kumar Halder wrote:
> Hi Bertrand/Stefano/Michal,
> 
> On 23/08/2024 08:22, Bertrand Marquis wrote:
> > Hi Stefano,
> > 
> > > On 22 Aug 2024, at 22:29, Stefano Stabellini <sstabellini@kernel.org>
> > > wrote:
> > > 
> > > On Thu, 21 Aug 2024, Bertrand Marquis wrote:
> > > > > On 22 Aug 2024, at 11:00, Michal Orzel <michal.orzel@amd.com> wrote:
> > > > > 
> > > > > Hi Bertrand,
> > > > > 
> > > > > I agree with all your comments with a few exceptions, as stated below.
> > > > > 
> > > > > On 21/08/2024 17:06, Bertrand Marquis wrote:
> > > > > > 
> > > > > > Hi Ayan,
> > > > > > 
> > > > > > > On 20 Aug 2024, at 12:38, Ayan Kumar Halder
> > > > > > > <ayan.kumar.halder@amd.com> wrote:
> > > > > > > 
> > > > > > > From: Michal Orzel <michal.orzel@amd.com>
> > > > > > > 
> > > > > > > Add the requirements for the use of generic timer by a domain
> > > > > > > 
> > > > > > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > > > > > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > > > > > > ---
> > > > > > > .../reqs/design-reqs/arm64/generic-timer.rst  | 139
> > > > > > > ++++++++++++++++++
> > > > > > > docs/fusa/reqs/index.rst                      |   3 +
> > > > > > > docs/fusa/reqs/intro.rst                      |   3 +-
> > > > > > > docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
> > > > > > > docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
> > > > > > > 5 files changed, 202 insertions(+), 1 deletion(-)
> > > > > > > create mode 100644
> > > > > > > docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> > > > > > > create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
> > > > > > > create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
> > > > > > > 
> > > > > > > diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> > > > > > > b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..bdd4fbf696
> > > > > > > --- /dev/null
> > > > > > > +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> > > > > > > @@ -0,0 +1,139 @@
> > > > > > > +.. SPDX-License-Identifier: CC-BY-4.0
> > > > > > > +
> > > > > > > +Generic Timer
> > > > > > > +=============
> > > > > > > +
> > > > > > > +The following are the requirements related to ARM Generic Timer
> > > > > > > [1] interface
> > > > > > > +exposed by Xen to Arm64 domains.
> > > > > > > +
> > > > > > > +Probe the Generic Timer device tree node from a domain
> > > > > > > +------------------------------------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_probe_dt~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall generate a device tree node for the Generic Timer (in
> > > > > > > accordance to
> > > > > > > +ARM architected timer device tree binding [2]).
> > > > > > You might want to say where here. The domain device tree ?
> > > > > > 
> > > > > > > +
> > > > > > > +Rationale:
> > > > > > > +
> > > > > > > +Comments:
> > > > > > > +Domains shall probe the Generic Timer device tree node.
> > > > > > Please prevent the use of "shall" here. I would use "can".
> > > > > > Also detect the presence of might be better than probe.
> > > > > > 
> > > > > > > +
> > > > > > > +Covers:
> > > > > > > + - `XenProd~emulated_timer~1`
> > > > > > > +
> > > > > > > +Read system counter frequency
> > > > > > > +-----------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_read_freq~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall expose the frequency of the system counter to the
> > > > > > > domains.
> > > > > > The requirement would need to say in CNTFRQ_EL0 and in the domain
> > > > > > device tree xxx entry.
> > > > > > 
> > > > > > > +
> > > > > > > +Rationale:
> > > > > > > +
> > > > > > > +Comments:
> > > > > > > +Domains shall read it via CNTFRQ_EL0 register or
> > > > > > > "clock-frequency" device tree
> > > > > > > +property.
> > > > > > I do not think this comment is needed.
> > > > > > 
> > > > > > > +
> > > > > > > +Covers:
> > > > > > > + - `XenProd~emulated_timer~1`
> > > > > > > +
> > > > > > > +Access CNTKCTL_EL1 system register from a domain
> > > > > > > +------------------------------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall expose counter-timer kernel control register to the
> > > > > > > domains.
> > > > > > "counter-timer kernel" is a bit odd here, is it the name from arm
> > > > > > arm ?
> > > > > > Generic Timer control registers ? or directly the register name.
> > > > > This is the name from Arm ARM. See e.g.:
> > > > > https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registers/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=en
> > > > Right then i would use the same upper cases: Counter-timer Kernel
> > > > Control
> > > > register and still mention CNTKCTL_EL1 as it would be clearer.
> > > > 
> > > > > > > +
> > > > > > > +Rationale:
> > > > > > > +
> > > > > > > +Comments:
> > > > > > > +Domains shall access the counter-timer kernel control register to
> > > > > > > allow
> > > > > > > +controlling the access to the timer from userspace (EL0).
> > > > > > This is documented in the arm arm, this comment is not needed.
> > > > > > 
> > > > > > > +
> > > > > > > +Covers:
> > > > > > > + - `XenProd~emulated_timer~1`
> > > > > > > +
> > > > > > > +Access virtual timer from a domain
> > > > > > > +----------------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall expose the virtual timer registers to the domains.
> > > > > > > +
> > > > > > > +Rationale:
> > > > > > > +
> > > > > > > +Comments:
> > > > > > > +Domains shall access and make use of the virtual timer by
> > > > > > > accessing the
> > > > > > > +following system registers:
> > > > > > > +CNTVCT_EL0,
> > > > > > > +CNTV_CTL_EL0,
> > > > > > > +CNTV_CVAL_EL0,
> > > > > > > +CNTV_TVAL_EL0.
> > > > > > The requirement to be complete should give this list, not the
> > > > > > comment.
> > > > > > 
> > > > > > > +
> > > > > > > +Covers:
> > > > > > > + - `XenProd~emulated_timer~1`
> > > > > > > +
> > > > > > > +Access physical timer from a domain
> > > > > > > +-----------------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall expose physical timer registers to the domains.
> > > > > > > +
> > > > > > > +Rationale:
> > > > > > > +
> > > > > > > +Comments:
> > > > > > > +Domains shall access and make use of the physical timer by
> > > > > > > accessing the
> > > > > > > +following system registers:
> > > > > > > +CNTPCT_EL0,
> > > > > > > +CNTP_CTL_EL0,
> > > > > > > +CNTP_CVAL_EL0,
> > > > > > > +CNTP_TVAL_EL0.
> > > > > > same as upper
> > > > > > 
> > > > > > > +
> > > > > > > +Covers:
> > > > > > > + - `XenProd~emulated_timer~1`
> > > > > > > +
> > > > > > > +Trigger the virtual timer interrupt from a domain
> > > > > > > +-------------------------------------------------
> > > > > > > +
> > > > > > > +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
> > > > > > > +
> > > > > > > +Description:
> > > > > > > +Xen shall enable the domains to program the virtual timer to
> > > > > > > generate the
> > > > > > > +interrupt.
> > > > > > I am not sure this is right here.
> > > > > > You gave access to the registers upper so Xen responsibility is not
> > > > > > really to
> > > > > > enable anything but rather make sure that it generates an interrupt
> > > > > > according to
> > > > > > how the registers have been programmed.
> > > > > I'm in two minds about it. On one hand you're right and the IRQ
> > > > > trigger is a side-effect
> > > > > of programming the registers correctly. On the other, these are design
> > > > > requirements which
> > > > > according to "fusa/reqs/intro.rst" describe what SW implementation is
> > > > > doing. Our way of injecting
> > > > > timer IRQs into guests is a bit different (phys timer is fully
> > > > > emulated and we use internal timers
> > > > > and for virt timer we first route IRQ to Xen, mask the IRQ and inject
> > > > > to guest). If I were to write
> > > > > tests to cover Generic Timer requirements I'd expect to cover whether
> > > > > r.g. masking/unmasking IRQ works,
> > > > > whether IRQ was received, etc.
> > > > This is true but i think it would be more logic in non design
> > > > requirements to
> > > > phrase things to explain the domain point of view rather than how it is
> > > > implemented.
> > > > 
> > > > Here the point is to have a timer fully functional from guest point of
> > > > view, including
> > > > getting interrupts when the timer should generate one.
> > > > 
> > > > Maybe something like: Xen shall generate timer interrupts to domains
> > > > when the timer condition asserts.
> > > Both statements are correct.
> > > 
> > > Michal's original statement "Xen shall enable the domains to program the
> > > virtual timer to generate the interrupt" is correct. The timer interrupt
> > > will be generated by the hardware to Xen, if the guest programs the
> > > registers correctly. If Xen does nothing, the interrupt is still
> > > generated and received by Xen.
> > > 
> > > Bertrand's statement is also correct. Xen needs to generate a virtual
> > > timer interrupt equivalent to the physical timer interrupt, after
> > > receiving the physical interrupt.
> > > 
> > > I think the best statement would be a mix of the two, something like:
> > > 
> > > Xen shall enable the domain to program the virtual timer to generate
> > > the interrupt, which Xen shall inject as virtual interrupt into the
> > > domain.
> > This should be split into 2 reqs (2 shall) and the second one might in
> > fact be a generic one for interrupt injections into guests.
> 
> I agree with you that the second statement shall be a requirement for vGIC (as
> it has nothing to do with the timer).
> 
> So, do we agree that the requirements should be
> 
> 1. Xen shall generate physical timer interrupts to domains when the physical
> timer condition is met.
> 
> 2. Xen shall generate virtual timer interrupts to domains when the virtual
> timer condition is met.
> 
> The important thing here is that Xen can generate both physical timer and
> virtual timer IRQs. It is left to the guests to use one or both.
> 
> We can drop the comments here if it is causing confusion.
> 
> Let me know your thoughts.

I'm happy to give my approval to any and all versions discussed in this
thread:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


I could suggest further improvements or point out minor issues with any
of the wordings (including my wording), but I don't think it would be
useful. Any of these statements is good. I don't believe we need to
refine the English text any further.

Unlike code, the potential for text revisions in English is limitless.
It's always possible to find things not quite clear enough, or rephrase
in a way that is clearer and more comprehensive. Also because "clear" is
subjective.

I think it is important that we do not put too much effort into this
because the reward is not proportional.

