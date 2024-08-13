Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E9950193
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 11:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776092.1186245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdoAe-0002lW-6P; Tue, 13 Aug 2024 09:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776092.1186245; Tue, 13 Aug 2024 09:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdoAe-0002jy-38; Tue, 13 Aug 2024 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 776092;
 Tue, 13 Aug 2024 09:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDAI=PM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdoAc-0002js-4M
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 09:50:26 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2416::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7576c8ec-5959-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 11:50:24 +0200 (CEST)
Received: from LV3P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::7)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:50:19 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::e1) by LV3P220CA0020.outlook.office365.com
 (2603:10b6:408:234::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 09:50:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Tue, 13 Aug 2024 09:50:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 04:50:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 04:50:18 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 Aug 2024 04:50:16 -0500
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
X-Inumbo-ID: 7576c8ec-5959-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPRpTPuiTvvJAKaye5HBwiSJBirSYR+gAqtkNsS76qEL+tVAwq8lS8wv4qSeri91Qxog0NEPoxM3XnvHL4Ohb7jjl2pJjPIUwUTO1ID6yhNSxhGxU+EzsThyfm/5VdgiXlIUpHuCW1wHNZYhtpX8uY21FryLoqad1O+yuoP3U8z5NdWZBKUH+jgMFtCRbifkxkC1yfNBvxQxH96oGI4PRpSdxxFK69WsY9N0Qk1kXnlTAOq3e4FF2uUntmtkwY7rzw0q6X8W1kLR5pHUYP5TUgwze1ZTcitMsKZ9R+rtA0GeJg4OIdIY7taIkKtWzGgU0t/QnrUNOFxBtSZSTp3aKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ/LvH3zV8PEFWrbfGmZ8AE8YfMQ1Ai3D24Nvr6WKhM=;
 b=CjrFxTd+sMrV4FHtplolOBKWw2bEQ8QQ8t8pr7vTNo4nkfa4OGgkfLLiqgj/gmMFGwGqskKx9gzQdUNFpho3HEK/KcEhdlkjTcjcrv/FhsVJRzoJTn9TbXrkjCSaFWgBypm+cUl4zHNgaF4tK7vAPvznN15rvN4luxPERoPPvKJ+gaLO4tZiSadUofnvgj5BKSs/LpIo+bKwxZPA8aRc/TR2uDlhURyJ40h/KDYtyx2WhMYKA9XhUBR0lvD8FDIIs4JDXsl+mPxThXYdng/Ap9Esq0XWJ6NNlIEsbeDzwWEaAH/bZcIxRndBmM8LC0qUeRVja8/LnBB9dYBQou2b+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ/LvH3zV8PEFWrbfGmZ8AE8YfMQ1Ai3D24Nvr6WKhM=;
 b=qugBoLUBNvLj7/kpgiL98l7soPnnsR+Z2VsG1Gjd4NyhhYhCes6azRCenwKKD9jFoqsjmFW59zmxxUC+IzCaoC1mEgPJy38SLjDlSgdMM+MHvr15lR6NHqi/iY+NpKmSzZUarQcWkgFvjZPxSj/zg6aPuQwwb/0jBpNrgkA3VjQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ed6f6b1b-cab3-4369-901f-80907af8e7c2@amd.com>
Date: Tue, 13 Aug 2024 11:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: correct FIX_LAST
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <ad60ded1-5feb-4fd9-8cf8-6dee2e153d11@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ad60ded1-5feb-4fd9-8cf8-6dee2e153d11@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f5310a-0945-4647-e773-08dcbb7d5731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emI3TTRKOTIwb3RKQmd2d05BckpLbEV3amlJbEFzQWR2TWpEMmtHaU9VRC9U?=
 =?utf-8?B?MC8yZ0NHWFhvK1ByU3VzdFMrNFBLTUhQNW4vbEppZ3M4VkFXRFloMTZSS250?=
 =?utf-8?B?QVA1dmJsU3FBOHN1SmM1YUhGcyttZlVmcElFVnlGL3daM0RGMVcyaFd1V3Fi?=
 =?utf-8?B?WmgxOWdLd3RlQktXaE4va0JXZTdsRHFEdGV0KzVxMDlyYWpZbFVQQnRIQU1r?=
 =?utf-8?B?Tkw5UW0vU0RaWm5yTmZObnNpV2Q2VkY3eWNxOTR5a0x1bW40Zjl3dnBZOERS?=
 =?utf-8?B?dlIrYTh1emYxeUh0WWh4aGdGRTJtT3dydko4R1BBOE1LVERGYUNwK1BZRVRC?=
 =?utf-8?B?T05KdXNnRXUxRlhOWWIxcmhlYWFMZysweVJrQVNVM0tNUDd2TEtKNkdkK0N2?=
 =?utf-8?B?d2tzTmVhK3BZNzNwREZVaTI1a0FNSHpPRUNZNWdJWXp1eVg1SkJhcjh0aW1Y?=
 =?utf-8?B?YUJkMWE1Z0JsSkhkVGxJbFRXTW1DaW1tN1NKZThMczZ1T2FIcElySE9TNm5D?=
 =?utf-8?B?U285Q0FzMTJmbTZNSjFnUlRWWFdsWTlZMzVxbmVwMFFwaSsxWmk0QVZHVy9Y?=
 =?utf-8?B?K1YrQWp4MkZDOFp6cWxINFVvWUJzbEIyKzBUZUNaeXlWL041YzNuR3dRY0pt?=
 =?utf-8?B?WnFSdllpZ0w0WHp5MjN6QkdyRWRFektjTHlGQkI4MTI3cTJPd29nSzBBSGlx?=
 =?utf-8?B?cWlMZno5RUhKZWhzZFkwL09TN0plRkZuUmxsbUxTZTdwVjV2WkRybkp0VEJt?=
 =?utf-8?B?aVYxSTVNZXhUSjFTYng2RG9DWmFBLy9kU3pCSFpOMTVubXJTSnZIdkJwMUJT?=
 =?utf-8?B?Mk5YSVBoWDZTNmlRbjMzandoOFBCdTk3YXdJZ3VtYXJPMmhLTlJaRU9ZK01a?=
 =?utf-8?B?dEd0eVpWZzArVWY3UWt5Qy9XUFhiYmZkWXV6NFBCNzZwaXRVRGQreDcwWU40?=
 =?utf-8?B?cGRMMzUxSUtGVFVoYmhRMC9kZHgvaHZWcktycVdhZWFncXlXdnBIbTdoQ0I4?=
 =?utf-8?B?enpqNjY3QmhpamxMT1FBNi96VzZKdksvdWo1V2ZJVWthL3RVeWplWUI4NUxi?=
 =?utf-8?B?VlllVkhtbjFnODNCZW1xNVdqRWhKTXhySC9jbzM5bUljTDdaQm1NM1FGbW9w?=
 =?utf-8?B?QmVaUjdrK2tHdzB3dzM2WkN6bkVPNjc4SnRadWo2djI0OVZ3VGQrSVVwek5h?=
 =?utf-8?B?WElRQjJCb1BtV21DNWVvS21pOGpEUnQzUC9JL3VTS0lMTXVLeXZNdFU1YVJL?=
 =?utf-8?B?dmkyOGUxK3FySjlKVVprVmpCM292ZkVkQitaNlc4OVFIL1M0b0ZWcmVCUHgz?=
 =?utf-8?B?ampTNFNBUjYxM2hQSWxJTDEwRDhpbEJpK2RRRS94NzJDOGxDcDhjNE5FMGJD?=
 =?utf-8?B?bExGdjFQSnpwVnAzVXU0WVprb1JLTEp6RTNma1lVZW1zb1lJVXl1QU16MWts?=
 =?utf-8?B?bGlDVjkrR0JGMkdKbVFEQjN6SGFRazFqcnNmdXJpcjg2bTdtL0pGYWNNbVBl?=
 =?utf-8?B?K01KTzNsbFFLOGRVamt4R2grcjB4T2Y1eDVuSGhERjVFZGN1aHYvUzVucTdI?=
 =?utf-8?B?OEVsWFpib2xBQ0xVREFOMTd3Z3A5Z1hEMFQwN01kTFR6K2h3RnByZ1VBT0xj?=
 =?utf-8?B?cS9wbkt2QmxWNnJkT2ZsYUx2UXJKcjB1NCtFMnpEMlFjVzEreHJKUXVvU0dl?=
 =?utf-8?B?TDVHSEw4TUYvNDhXWWd5MCtjZHIwR3BhdlZKSjIxYkhuSkk0MmRJN2dOVTFM?=
 =?utf-8?B?TTZ5dm9IeXVyeVJFbUp3T0ZrQ3FTemZwZXRlR0x0bVNOZ0Z5QWQzcC9ub2h5?=
 =?utf-8?B?aXN1NVRNQlg2YXRYQ2FyZUx1bC8zSUNCbjRqQS85WGlGZGRBOFJOR2ZnNitL?=
 =?utf-8?B?Tm5nenJNK3pvTmc4Lys0ZnBEMEhmdGtMWitkcmlBT1B5SHE3azBkS3lyL01m?=
 =?utf-8?Q?nwjfNRV6rh4UWWN2ej8fZMGsjQqTwipT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:50:18.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f5310a-0945-4647-e773-08dcbb7d5731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224



On 13/08/2024 10:36, Jan Beulich wrote:
> 
> 
> While reviewing a RISC-V patch cloning the Arm code, I noticed an
> off-by-1 here: FIX_PMAP_{BEGIN,END} being an inclusive range, FIX_LAST
> cannot be the same as FIX_PMAP_END, or else the BUG_ON() in
> virt_to_fix() would trigger if FIX_PMAP_END ended up being used.
> 
> Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alternatively the definition of FIXADDR_TOP could be changed, if "last"
> should retain its strict meaning. Possibly a guard page also wants
> having at the end of the fixmap range, which could be effected by
> changing both #define-s at the same time.
I understand FIX_LAST as the last slot used, so in this regard it should retain its definition.
That said, I realized that we don't even check that the highest slot is still within the max number
of fixmap slots (today we have 512 slots). IMO we should gain a BUILD_BUG_ON to catch it.

With:
#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
and sth like:
BUILD_BUG_ON(FIXADDR_TOP >= BOOT_FDT_VIRT_START);
possibly in build_assertions() in setup.c, we would:
 - fix off-by-1 issue
 - catch out-of-slot issue
 - gain a guard page

~Michal

