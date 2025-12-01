Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A753C97774
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 14:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175726.1500343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ3Zk-00016g-8j; Mon, 01 Dec 2025 13:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175726.1500343; Mon, 01 Dec 2025 13:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ3Zk-00013f-4r; Mon, 01 Dec 2025 13:04:20 +0000
Received: by outflank-mailman (input) for mailman id 1175726;
 Mon, 01 Dec 2025 13:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBcI=6H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vQ3Zi-00013X-GV
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 13:04:18 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d3de646-ceb6-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 14:04:15 +0100 (CET)
Received: from MN2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:208:1a0::11)
 by CYYPR12MB8991.namprd12.prod.outlook.com (2603:10b6:930:b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:04:12 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::e5) by MN2PR07CA0001.outlook.office365.com
 (2603:10b6:208:1a0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:04:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 13:04:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 07:04:11 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 05:04:10 -0800
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
X-Inumbo-ID: 3d3de646-ceb6-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgjXdI2MNMxyxyjV6J4VzM2vtzGtTSt+FDU5I7s6MxyCXzxJJu4a9TkwTbI43sTFyved/DfbN3iv7jhbFh9wNDO89HJSxgACaW8CHfjjU7kGmAPWsJRBF/RjK47Kt4hNFoKbbWo/2eWaJkYunHLbY9vIRnxhf1N/FwMSsdq537O6OG9KpiA0Q8vD8kMz7yOdbFSs1G/Lwf5FcDHWy68zOhOvTTrbv4FkFGmLC9YqVbXjNjOLpXD7ljp38WW2im2T+LbZ29EIn1C0LzO6mFKgpQu3lVclu+FXlb1FKmrBmLC/CKiZizzhZ0pzGMPn+Owz+p9zASrnsyDnvWssh8CRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whmVOzoWSekLtCBYL5R0EfBSnJ9cxpcTdcjA7bB6Nq0=;
 b=ODIUMBwG2roZY9p/Ti/W4rn7Jh9PvUEuhnJtQ06A5wnf4zstCejDGy8pOFRI2dxWj+KLLZ1s3KWNM3pzY1a0S3fYAl6Vy8wqNa6t1DnsPpfVPGDlRG1pP6fml2sU/lCiQfc+1oWv7zuZJT8huObTBXW58VNmG7soxvhS3xrgbfFnRkwNvdC60ta+VoYKDfvytIt8LXUJ7Ic8uCOMOx44o/pKuayBB2VAUlIJVqoW+iFTBhVLHObagEp0o/9zj6CQnm7BrvI04CnyjPKH0QYFbF9k8KwCr7O37hQyos/ETtgvRgwytiYL+mek7+jdHN8g4lPeaEkOouYrRUe91KTNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whmVOzoWSekLtCBYL5R0EfBSnJ9cxpcTdcjA7bB6Nq0=;
 b=XKYeLhJIuYRaTSic01YD4cGdOurJq+896erFHIddzBerLL1Qruxv07dEAKq7/qyNBpveDUgUXsFCAJhKmBAyi/PslqfiuXWXQxdqLlNuvOUFG6/8enfpB5QMyUC2asf0UKn9Q2JNrw6jmbTGy2IbnNwts/O+nqw0e4RzupyiD+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6203c8a3-9239-4476-945b-b3d563fd5685@amd.com>
Date: Mon, 1 Dec 2025 14:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 "passthrough" property
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20251201113403.2898396-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251201113403.2898396-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CYYPR12MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: d6148385-fee6-4bcf-6419-08de30da1f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REVnMC94dkR0aWMvNmNBQUJLdGlVSG9LN2xaRlN2WGdLMnM3dG94S2hURjQy?=
 =?utf-8?B?N2FablVqbENVaXJuZFFtUjJvRHdNQkdOWHRQTEV0T3ZRSThidkVtbW5nSitD?=
 =?utf-8?B?MUQxMnJzcDhkNnMvSmc5V1d3MDVxRlVueUNidVRHOXdpVEJSc3dFZzJkTklI?=
 =?utf-8?B?RElWdkNkUkowRGtja2w1TTlXNm1pSFY3TldjY01SdndWL2hZakJLQm94NFZH?=
 =?utf-8?B?cld1NS82N2Mzb25HVTY4U0c5K1lrMFlTK3dmTDQvN015blhMYWtqT3NDeXc4?=
 =?utf-8?B?YUZSR0psZjZTQWQ2KzV3Q2VHd2RZckJ6bHlsK0JTMmJ0THQ3V1FDRzMzLzhL?=
 =?utf-8?B?UUs1ZkZjcHBTcDBZVXd0WTRXWWx4cVFWVlgyYmMyWktERHZPdDd6K2pkRmhu?=
 =?utf-8?B?dVQ3N0s0OGtyb0lwbTJEZ3JiS05XbGpBcGVVU3BCa3dKSGxmdlRVakFnUVp3?=
 =?utf-8?B?K1RuYU1Ud0QyUlAzcWxFWmNZa0pPMkE5ZEp6M1hNMHJuMjNjdk8vRmZGOUhE?=
 =?utf-8?B?bndNYit1RDQxVkRhTFpyY0crSlY4UTdValR6TVhWZlFqRHZGSVcvbjhCYTNG?=
 =?utf-8?B?QjdhbjV6bGVrZWhEZFdvR2JjRmplZEFhV1pWV1g5VjNPVFVZb21OZDloMHU5?=
 =?utf-8?B?RlpmTHhRMFpWNzhyWVpUZzhvSDJYOWpqbXpWRExsMEs5aFZFNmczN2NmQW16?=
 =?utf-8?B?UmR5WTFQR1dVV1h6MUJBNGMvcTl3a0llSko0bDdPaUdUT3lrSWtLNFZ5RGMw?=
 =?utf-8?B?M1RySHFpZzY0NE5zUGQ1Z3dBUHRyNm9xcXVuZngwdzRjOUFkY2d5NmpBbm5L?=
 =?utf-8?B?MzRTbnZNaXZ0VWRtRlFEZEF6SFhnZmcxdDNvcmlNMmI0OUpSOXVYRk0yYXBU?=
 =?utf-8?B?Z2lEbTFqMkdQdUltUnFPblFsTEJpekpKQjIrVnZqRWFzVUl6TXlXbjhmRExy?=
 =?utf-8?B?RkJSNXFDRWlDQ0MrNGY0WmQrdXZsV3RLNG0xUjdyQ2Jib2RVY0RUNFZ1bDVI?=
 =?utf-8?B?NnhWZ1pSM3AxY3N0amptU05TZFJmZVVDcmU1eU1tMlBFaVp4eldubG9rUEw1?=
 =?utf-8?B?UnJBVCs2RjI0d2toa0JyLzUxaUZXbmN0K0N4bWxVcGlpRk5YbmtrRUNRYmJJ?=
 =?utf-8?B?cVUzUHc1L2wyY3NtUVRiak9yTVBIbkFtbjdRQ1AxMEhKeFQyUlJtT0E3Q2VM?=
 =?utf-8?B?ajZoTzdRU3B0VjRvU2xMZVNoMjA0cmgvOTFZM1RSQ2F3NXliVEdBSUQvNXNR?=
 =?utf-8?B?c0NSUzBHT09nblRMbVU3Qk42NURMMnRZNitVSW9KeUdyUnR1L1lYUjluNmM3?=
 =?utf-8?B?Y2E1MlFlY2I5QWE3NmFRUXRaQkFJNndvVWgwNGRZYkNpS2hhS0t4VGFna0s5?=
 =?utf-8?B?RXNJdG12Y0RaQWJwZDZKalNMQ3hIelBLRjlneVkzbHMzdlhpRlo4YTN4c1p3?=
 =?utf-8?B?dFJzZllVR1FQNlQ2eW1KZmg1dm0zdVlQOHkxNE1xMVhVVnk1YnArWUhnY25v?=
 =?utf-8?B?Rkhwd3h1ZjArSEZsMHltYlZpaGhneGhsbm0wRU12Z3ZuRlczWEJicmhRRkFx?=
 =?utf-8?B?QWZLempUTFpOcSs1ODhXdEUvTUNYMnE1MDEyYUZQSVdpRmFYekxHS1YwRmFv?=
 =?utf-8?B?WkorMk4yVGFBdTJTakRqL2R1bWdMZVFOSE4xZ1RJanMxNnpIa3QyOFdOREpU?=
 =?utf-8?B?U05HNDd2L0hCdTBnOFlSeEJqcjZNeE1vTFV6YjJwREs0YjZJNmdzc0QyL3pp?=
 =?utf-8?B?ZDZWMnk2bDUzVXFVWms4dHZwM3BUR1RmdWd1N0xnRFM3STBJQ251c0VrR0c2?=
 =?utf-8?B?YWJ3UnZ6empNNEJ3UDhsTTlOa1Yxa1loa2NxQ2xjY3B6UFB5YWIwdUpSUGZ4?=
 =?utf-8?B?ei94S1RQbGVDcjNXNmFYTnJ3aEZqeERwTXZVaDEvblhVWE1adWNaUEdVTFoy?=
 =?utf-8?B?OWplSTlPT2M3dSs3ejdGQlo3SmlteWRBWGNjdEMvQUV3RnpyZnlXbjhDN0t6?=
 =?utf-8?B?amVvaVNkMzdabXFiUm9wTzNDeG1oRGFKZG1Ca0Jaa0p6V01id1orMTZkVDRw?=
 =?utf-8?B?TEhkK0VqaXljaUUzcWpxNHFVTkltRXpEbEZRTGJXRTlJdi9kNkxZL0JMWUQw?=
 =?utf-8?Q?6e88=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:04:12.1983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6148385-fee6-4bcf-6419-08de30da1f7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8991



On 01/12/2025 12:34, Oleksandr Tyshchenko wrote:
> This property is used to grant a non-hardware domain
> permission to use the IOMMU, which is a prerequisite
> for device passthrough.
NIT: you could mention that this is not needed when using passthrough dtb.

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


