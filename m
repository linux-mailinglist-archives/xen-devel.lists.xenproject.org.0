Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA0951B63
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777172.1187362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDiu-0003bj-PI; Wed, 14 Aug 2024 13:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777172.1187362; Wed, 14 Aug 2024 13:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDiu-0003a2-M4; Wed, 14 Aug 2024 13:07:32 +0000
Received: by outflank-mailman (input) for mailman id 777172;
 Wed, 14 Aug 2024 13:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seDit-0003Zw-33
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:07:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2407::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 280c4346-5a3e-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 15:07:28 +0200 (CEST)
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by SN7PR12MB8601.namprd12.prod.outlook.com (2603:10b6:806:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 13:07:24 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::b4) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17 via Frontend
 Transport; Wed, 14 Aug 2024 13:07:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 13:07:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 08:07:23 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 08:07:22 -0500
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
X-Inumbo-ID: 280c4346-5a3e-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsybrNecJ1gIVmqmm/lG1GEaI7ImQVhfrRW+0/j2quLE1F5A37PYyb4Vaja4qWz4H2C40uChMuL/qW8bT5Ou9DkG6OD6/OgpZkavYhSl8LGYNa/pmazCMnDTOOpkJF7C1NGnACQQubqDorMjDv9GWxu1iPNI8sOpytHJyYnpXx/Po4rCI8UsNsnUFPjWnyhbKZc5izM9UuIRzP5uL6rEuu2fLpqQXDIfESqbmsOzEovYTcAoNfEk8OcZtbyA4nD49eZfSgopnkzPuHrl3wcH2ShQiZkjSV6jISymcbxrejvFAUHjSKsAVfQbUIQ/5PWXPhIuNJooZuFWxpe2Eu9V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPwj/vChWsenE7tFkQiMk4xYMbIBjXb1wFHjj+tYQ/0=;
 b=sxsUOmD/c+b164+Wnl7PAzhUY6dB4pZl7OP8r6MreZNHyE/ZyvqjUas0vsZWRzMTm8T16wxOfEVndIFywL7t5wSFot/s6ZHd/kiwBpsiwzt8k1rb8+AtIXeAsmzcXTIrpKniVzgs5LCuY3c+nL7uRnu8Jk873lDzgaxpf0tAP7mJIaDP+yHdHOxryFt1+5pBLgUZdsXte1yBR8X7E5rIl8wWujVYUjB+OnG7A8U3EDmGCbGpo/AwrrRpiWekAS7Dblsr/0MNSDbUlT9fSgIADxc+itrT2W3zNOVy4LzxC9O7QY+4TrlbxuuQAdt/mfxQE+z4suf39fW5zT+LnnXTfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPwj/vChWsenE7tFkQiMk4xYMbIBjXb1wFHjj+tYQ/0=;
 b=YCyXMmntItCNHn2Er14YQvfiA7DybKWivgkGSf74tNzeQ3lDs4FmrAEHRbkHFOEFw0jpL5wafBQTDBrVHvQxcGkYzCVr5uGIeSjWWp3a3lG/jmCcOqF3OoM2HhpzP4Fkg8stdjweCJB+/I3PyyUl1chl++oQhJfqzZhs5OljAo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4582dfd9-32d8-4135-acd1-568256141af2@amd.com>
Date: Wed, 14 Aug 2024 15:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen: arm: Enclose access to EL2 MMU specific
 registers under CONFIG_MMU
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>,
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-5-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240813171356.46760-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SN7PR12MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2890cdbe-a7f9-41d4-495d-08dcbc6209fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SW1aanNmaVhuTS9mZkpkSnNDUUp4OXRuc0luVStGb09Bdldid3ZSempJQnpp?=
 =?utf-8?B?aTBFSEVQY1N1ZU40Z0ZXVDI1bGxuZjF2cTJzd0RNMDh3RlhFcHRUSlhHUHpw?=
 =?utf-8?B?dlhkbjM1bHpBOE56dExYYTNobGFJUk1GWFlkMWtobDlKekVpcUt4d1lWZUEz?=
 =?utf-8?B?bStEakhKNk40Z1NKMjdMczZEcklXUDB6dXc4RlZhaTh0VGdXVDY2Rjl3b3hu?=
 =?utf-8?B?WEpoTE1uVnNGMVZ1aWFYU2VGcHlPS2N4Z2tQdVJXK0dPZ0VFbnBJNkNtZ1A5?=
 =?utf-8?B?MmpZQTVEMktyQkdXUit3ZlBlR2drcnp2K0ZlRXUxUGJNaWFWZUM5MVAxR3dO?=
 =?utf-8?B?a3JqYm80eW5NZDBxN2grVWlsanQzSlIvMW5tbFhuQnI2dURBY0xPSTNZL0RK?=
 =?utf-8?B?cFp4VU9pS1VwaXBwekkvdzI2TnNPakdGZlZ4Ukt5NG1Vc0p5NFNOUHl4QzNm?=
 =?utf-8?B?SmVEc281cy94eExBK0YyQjh6THNKaWw0dXFzZ25HWDQyYVFKRU9SR3BpYVpS?=
 =?utf-8?B?MUZqMFNZTXpHdU9zTFppd3NhOWtyMmp4dGJla3BCckR6VTRWOGRranpjMUdO?=
 =?utf-8?B?bW1NTWZMV0lHaUZVbTdudmgyVjZUY1RkcWtkOHNuMFZiV3BxOGhYUXVNZGVK?=
 =?utf-8?B?dEJzemZDTHUxMERndXo3UzJlQVB4d0owYzVVZEprTkpvZTFtYmRuZlB1ZEFj?=
 =?utf-8?B?MmZ0NDVEZHMxTGFiTnZaSDRQNDBoMHBuYzZGK1BiK2YySmFUQWZ4UGwxRk9h?=
 =?utf-8?B?dGlOU2lrN2JlcGgxaERDbUZhOHpqZVMycGNVS3FKRG04L3c3YjVHODN2N0ZI?=
 =?utf-8?B?dzNhT1ZSaWd2WFRlaDZkME5NNE5Xc3dqQU9VeWxkT3I2TVlCcTBaMU9OMzJw?=
 =?utf-8?B?TDdNTk1yeVh1QWF1bXZPYkdYb1J5UjNsNVYzTnZpWnZtTHpUdWZFdnB4V2xK?=
 =?utf-8?B?dEZPU25VRkMvaklBd1hxQVZDcVdaQXFkWjY2NFJXdzJzdFlDcDByNUxPNWdC?=
 =?utf-8?B?WmlMUWI1TmpFcnltR1Q3UndFM0NsQzlSUFcrdk1VVmwzL2ZFR3hVam1xYjlG?=
 =?utf-8?B?RW9BbnVDUDc4VEVoUDRBNkllckMrMVFtTnJWdUFQNFhmRStPem1oMlhNU3NX?=
 =?utf-8?B?UUE1WDRhY3JjVG1BL0l5cWVNZUlEdjFQUEFLdDdsNndqNGNuUm1ucE0xcVRt?=
 =?utf-8?B?d1lSbU9IbC9jcHcrdVpwS1FoWVdsbXhOVEtOTXNxaFNrci95OEtpM2NVR2tF?=
 =?utf-8?B?UmFoTStnL3FldlR6amNzWm54VG1mSjhpMjBneDhlUjk0YVA3TStWY2hINjZF?=
 =?utf-8?B?Qit1WVJlSlptSTZvS0pCVEowVWdVZWpqWXUyYkpZaWZOSEQ0UDNOdEdlRUJr?=
 =?utf-8?B?WEF1NGt0bG1iMXNyR2xLY3VnSWVjNGtYWjhyMWwxODYzZkRUV01SenVpb1Fw?=
 =?utf-8?B?WTBQR3VFM0RyWk5RSS9oYzBPeGhkQXRvcHREazlHcXgzZ1FQRm54cEsxbC9w?=
 =?utf-8?B?Ym9RaUVRUm5tVnVtTS9ad1J3QkFpZ0FTbUdDN0tkbDlTRjk3bHpWSktoQ1dV?=
 =?utf-8?B?SEZGQ1daSmU1WG1yQ0llQ1NBUndQa0hFV3gxcSt6disxdm1wMXF5UDU3cExl?=
 =?utf-8?B?NG8rK0ZjUlhHRDJuTHVCemJEMVNJUmlDdHkrVDZSNG9naUJkaUpuMTFJM3o4?=
 =?utf-8?B?TEQyR2JhUTZVemMyUFBiNStwMkRJc2M4em1jZERoaUkyRWQyYi9lWU1rUUlq?=
 =?utf-8?B?ZEg0U29qd2xKT1pBQVpBZnEvbC9HWFk1RElRSnpNTWlwTTFvR2JkMG4wV1RH?=
 =?utf-8?B?bnFoZG5RRkdpb2NvTm1wSTE5U3c3WnkwbUFJdFNuN3J0Z25VOVhmVE8rQVFH?=
 =?utf-8?B?S08xTE42ckFhbmt1aEhsY3FNU0pVcEcwNXprVks5eDE2WTRVeFFZWkdZamYy?=
 =?utf-8?Q?vuZxscFc1L8Tc2DL+xSVR+ITK3yIhdP3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 13:07:23.9463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2890cdbe-a7f9-41d4-495d-08dcbc6209fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8601

Hi Ayan,

On 13/08/2024 19:13, Ayan Kumar Halder wrote:
> All the EL2 MMU specific registers are enclosed within CONFIG_MMU.
"Also, protect vttbr_el2 field of struct reg_ctxt and accesses to it."

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

