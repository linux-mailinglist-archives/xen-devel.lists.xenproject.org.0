Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B3B04D3C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 03:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043314.1413440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubUEP-0001AK-Mg; Tue, 15 Jul 2025 01:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043314.1413440; Tue, 15 Jul 2025 01:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubUEP-00017D-Jd; Tue, 15 Jul 2025 01:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1043314;
 Tue, 15 Jul 2025 01:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFxc=Z4=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ubUEN-000177-Fp
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 01:13:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfff4ddf-6118-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 03:13:12 +0200 (CEST)
Received: from BN7PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:20::16)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 15 Jul
 2025 01:13:06 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:20:cafe::af) by BN7PR02CA0003.outlook.office365.com
 (2603:10b6:408:20::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.30 via Frontend Transport; Tue,
 15 Jul 2025 01:13:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 01:13:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 20:13:04 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Jul 2025 20:13:03 -0500
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
X-Inumbo-ID: dfff4ddf-6118-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJnUq711r5k5gQzRia6JlPYaTRthoEihzuGSEtCEX4iwS8DcV0rwrUpAFm5gwkOOFa9muQmojgegGMGaI8WX99/Uh5hGcH68MgjEfKjPa7IAcUKvLVovkI3cBP9QK4Qmc1n+XVuIjREwtIGviWhzUUw4QSwgORzXuRiLh5q3v84t53xQSsh5i8Z42RZilXc4wxMTbCLOSWYQzXoop0FTduemAGfCV9INrWLI7WU+9KAaUtr30SKGLGb/GjqQVpoENhuTVjj2TSoaNBn8NVaFV0qInqmLsak0QboSnc12+jGiKtG2DuWqV8XIhbmBniZ8emP87v2C61L9XojEE4RZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ+lptSqUrbtp+5wW2ny2AN0PGzda3o5syg6RrYmcRg=;
 b=GarpTBcWXi5TQmg1oCxU4hAk9NaEnjbLJ7CxqfnCV56dB8Vu6zc/xRdRkVlHn5kf7/RtebrVuxgiFxOiIeThVN7wBvPS5NJc0+E4ThigPM2t1Qsegku+oqKmKqr1Tfv0LeVCLaLdx5RJLJsKmtphiM0wjORTIlzKSHg9qfo89N9e77259n8gfMevUEQ/12g2uB2FId73kyyz0hCauz14uMDr1GlLuOIKKMlnYGmGd3nqSxItcoVsndEmahje3O/ehnVHoGA65zqxvQciG5sta86B4ekk2TjG6l1nLi4mZ/FLRmAvrH5KZdWfWbthhs4E9OJvgJQ9jpv0UzQome2FNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ+lptSqUrbtp+5wW2ny2AN0PGzda3o5syg6RrYmcRg=;
 b=Dfid1woFkpm19SApBOp7SGSrBBI3cAd9+LvfLOuqy4BHeO9i9uEB2k9k+S3zsXPHEQIjnWyFxG5/ODm00ZFpICzwD6aDhgqZ2fKDWwXSCEHaEJXHdehTe2UKblFv5urBT2UeEXxXAHvCqlSCNuKDF5e1qjMBNYFmLUV8H2gsaLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Mon, 14 Jul 2025 18:12:57 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, <victorm.lira@amd.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Federico
 Serafini" <federico.serafini@bugseng.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
In-Reply-To: <38e8c1ac-a61f-4890-a7fd-9c5b2d6e610b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507141808250.605088@ubuntu-linux-20-04-desktop>
References: <20250624002018.4121819-1-victorm.lira@amd.com> <20250624002018.4121819-2-victorm.lira@amd.com> <b31da849-283e-4f84-854a-50da2d0878d7@suse.com> <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop> <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
 <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop> <27ca400b-ceac-40c4-a6ed-f26c1129ae2a@suse.com> <alpine.DEB.2.22.394.2507091723470.605088@ubuntu-linux-20-04-desktop> <38e8c1ac-a61f-4890-a7fd-9c5b2d6e610b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f90d88-0f54-4905-08ca-08ddc33cc15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0NpVNFy2CR/9FpQbsyHobnsSmjnG1wWK+7v4WXhZiz+Bqx7Ulr+9NMbUcffz?=
 =?us-ascii?Q?Jw0fC3IQeUCb1O94u4bMDe2w+2JxOC5f6NvTmXLn8O58Rd5xNJpXmuKWsx3a?=
 =?us-ascii?Q?0OC+MMtd34utUZ4FTGBn9zQgNxtCIDBhLWfCdOPI1T36MtFaIlNHcFA7Pk7W?=
 =?us-ascii?Q?fl9ETRZcu8Iux41qrPut8lwU35TbZyGO3cuM9pLj2P85I+IX0z2lVFRUKBB5?=
 =?us-ascii?Q?4cQuJU7rZ7nXw3oexIve+I+xfsYFJWpvj4EA5dUXtmmp3F8LA6h67lWfU7EF?=
 =?us-ascii?Q?jEsr0WqFkKqEl0tlTquVOj9hHc9I37YTI6GO3UfG5QlDuJrzve0zRRzR6/Wk?=
 =?us-ascii?Q?5lddnqsWfhUpS6wqbj+K5EpBSPxiVB7Lh90N95GGu5jcps46+u+dBPUyvGEk?=
 =?us-ascii?Q?oRCIUvclwIyNznoZt2TRy3jrFfCl7e67KtzhCvhzsqKK00t8GTZ+rEGaLxxz?=
 =?us-ascii?Q?4jb5ajFGPh5OLhmyQHuD60fTGS52FApowZfIxDs0uYcQWynmsKF7wwd7ukfY?=
 =?us-ascii?Q?LtPhAkQ925tiRMLH+6c/UxZQ5j+h0jRxSJTB3NxPNRKJpIgSNyVj0IVSjnp4?=
 =?us-ascii?Q?qixR4G3pWHXG41J6QjVeiLZMwTQ7VUIcwDQ7qollYjuhNKba/NCa38OzrCye?=
 =?us-ascii?Q?w7yLpPUqMGzLs0ygf/7iHJqCMN/AMcsqkWDB7g8cXvTF5Li6QtyxLIM+BwoM?=
 =?us-ascii?Q?ic13LhVXZelfIaQEEMvgkIxnKY8j39dpEP7eUYqApujpPpZDwzeLERIJagAh?=
 =?us-ascii?Q?DASe4z8DssWeIsTnJWIu/LoK2yH2QDq+0fiZal2+4V/KGygo4+DYzrRefEvG?=
 =?us-ascii?Q?pAtNvNo//rbo1ewslvFD0QaKPn6CQk43CvC1+UJ4P9hb3b/cKRRYwqDY30vu?=
 =?us-ascii?Q?teqWmTYwG1/8cwaSTuiu46ylVMrKuIt/9EApkOMz2t7PFBIYe5GjEh60v61U?=
 =?us-ascii?Q?jqBzdpv69nhoE1uhGzjydnraN1JyvPjeId0lZWiVW208PMUCS2FW3KXwgNnW?=
 =?us-ascii?Q?ts5wP6bF0DJUWN08o/Qd8PZ4Lw6Cd8azw/QvzPB70Bn+vQm/m31Sy6mhXNyH?=
 =?us-ascii?Q?JY8AB5DVCX0bKGt8lnv9SP+OrD1mgjyGDsDFRAgPT/220lqD0TpFLE5vuYt0?=
 =?us-ascii?Q?+bBTvvpIJuhvdfwh0z+jTaF7xsI5hMdYcROVTZs5x1yTZ3l0/2F7LLAWY029?=
 =?us-ascii?Q?n9X1t3qb+AGMmmvnjzKD9meW3+3yJnGp5MqOCCIX/fwrDLF05KbbkkhMVrIf?=
 =?us-ascii?Q?iQ/0gI526tJFKRXVHztSRmRV9CESKdp0D7zeG776wmdjGaqQragvpvu+UNeT?=
 =?us-ascii?Q?pjjb5mbGQ26n6VOm+6x5JwHdBQ/IODeMMo51RPPIx7ElkGoNf5mrIOs8L1Sj?=
 =?us-ascii?Q?cqF3gg2JwzJdu5lDrv4dHaGm3KKA3CnYYWMs/Wrvap01lU1bYtpIJqeD8vdZ?=
 =?us-ascii?Q?rpUrq4yMSfj+T6jC5pa45RDL6p28Q3AA1L7xEETkUYh+8yYUm0Dkyi7ZAzGW?=
 =?us-ascii?Q?eg6x8RQm5rhSz9A/2/Mpzw+KKpwADUCi5S/m0NsuVnfHoSZXE7iL5Om7Jw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 01:13:06.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f90d88-0f54-4905-08ca-08ddc33cc15f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889

Hi Jan,

I apologize for the confusion. I initially believed this patch would
reduce the outstanding violations to zero on x86, but in reality, there
are still 1,415 remaining.

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/10660702979

Given this, I believe we should consider globally deviating the rule on
x86, or at least apply it opportunistically, as we have done with other
rules. In such cases, the rule is accepted but not actively scanned with
ECLAIR, and we provide alternatives, such as using GCC ASAN, along with an
explanation that misaligned access typically does not lead to crashes on
x86.



On Thu, 10 Jul 2025, Jan Beulich wrote:
> On 10.07.2025 02:35, Stefano Stabellini wrote:
> > On Wed, 9 Jul 2025, Jan Beulich wrote:
> >>> What fine grained deviation do you have in mind?
> >>
> >> Ones for almost(?) everything that is having actual code changes right now
> >> in this series.
> > 
> > We could easily deviate alternative.c based on the file name alone. But
> > for the rest:
> > 
> > emulate.c: casts from unsigned char* (byte aligned) to uint64_t* (8 bytes
> > aligned)
> 
> This one may indeed be fine to patch.
> 
> > vlapic.h: casts from uint8_t* (byte aligned) to uint32_t* (4 bytes aligned)
> 
> These only give the impression of increasing alignment. struct hvm_hw_lapic_regs
> is containing solely an uint8_t[1024] array, and all instances (created from
> vlapic_init()) actually end up at page boundaries. What I don't know is whether
> adding __aligned(PAGE_SIZE) to the struct vlapic field declaration would
> convince Eclair of there being no issue here. Probably not, as the array index
> used in both of the accesses isn't known (to it) to be 16-byte aligned.
> 
> > setup.c: games with symbols
> 
> The change here may again be acceptable; better may be to use memchr_inv()
> there, as being less obfuscating _and_ eliminating the cast there altogether.
> 
> > iommu_init.c: cast from uint32_t* (4 bytes aligned) to uint64_t* (8 bytes
> > aligned)
> 
> This imo would better be done by reconstructing the 64-bit value from the
> two involved 32-bit array elements.
> 
> > How would you deviate these in general terms? Or are you suggesting to
> > use SAF tags for each of them?
> 
> If no other solution can be found for the vlapic.h issue, "yes" there. For
> all others I suggested alternative approaches. Subject to other x86 folks
> possibly objecting, though.
> 
> Jan
> 

