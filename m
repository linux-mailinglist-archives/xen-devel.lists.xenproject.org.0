Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A947A56B08
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 16:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905123.1312960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZCH-00082i-Uv; Fri, 07 Mar 2025 15:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905123.1312960; Fri, 07 Mar 2025 15:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZCH-00080V-RZ; Fri, 07 Mar 2025 15:01:09 +0000
Received: by outflank-mailman (input) for mailman id 905123;
 Fri, 07 Mar 2025 15:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqZCG-00080P-GE
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 15:01:08 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2405::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd208e3-fb64-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 16:01:05 +0100 (CET)
Received: from BL1PR13CA0023.namprd13.prod.outlook.com (2603:10b6:208:256::28)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 15:00:56 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::e) by BL1PR13CA0023.outlook.office365.com
 (2603:10b6:208:256::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.14 via Frontend Transport; Fri,
 7 Mar 2025 15:00:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 15:00:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 09:00:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 09:00:55 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 09:00:54 -0600
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
X-Inumbo-ID: fdd208e3-fb64-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=minqys+RgUgkrcrN9FWydUyRxEtuRDEc6vH/Kdui/CpSXNKkwLShg6KwVNdiUQExwGfgKf5CMPl8WdFhESCUHTiW7X9ASWv+6w2RWB2nVS93chSb3FGaNd6XO21VCyyn8QbXPelFmW1pjLrBiZGmv0PwxRKIX1DFEQy8RkDLGhfJZ7teUmrA7C/nPheByNLwC3/KeQWj6grRhtJnMwLADeKCBihdnRZ/QYZEgO5Lw8ItoPyLzUHndEgCQdZTSEOlKGThD9QwlsRE+M0ShYOUooiqVIU8Tfd+RIGFBjDivt9NeKHqHr/m7IXC9ir+KXJ1tj750Ny2AZn5Ok0g9oYFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot0tqWos9JReoTWC0254x4nLr0cDwCaE0AsCcoINB8k=;
 b=EfaGn8UjaSknnHHv1RrDqeIK4bgEtEOQeGMJNc6qnvPxxKAJSPQAUix2t/yZqhjR07j+Iauviaw6elJx+d1YzFUjZlbLrR711x3kptDSiqOmwxpARIe/CU0NFllnGwfbR5ZTFLjmPyuFA0s9Efa3cioJa9vr4lQRLXWeF17dqzOzQVdaXSkuj0iRuXNaxmXjtFnNZfLZdag+Xsh9+6qHPQfiEssax5JFZJmcMoToiHVoM+c5M5BlE6aAH+1BLSNDozvBmu8h5XGhAFHdTl4UzShsCvNeeR6AeSc4uyjIJEphibCagcbqUCC1uCJwtccEnOvAwF7weYZxH9BoKgAUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot0tqWos9JReoTWC0254x4nLr0cDwCaE0AsCcoINB8k=;
 b=iQFjZ6CE23lnSntvdAz7OcNqJInOC6ZE2YbRscywDzE5eLTbbw30xaGtOGGmnvm78P0D/imCt5e/YxQEZ46+pA8qUZFnCWQNBPo2agbg0fGcjR2jhvtcNm3vgD5yNwLKY/Eo9O5vi7WO217b6+kLx6IJciHQIZNLbYM/PrUX+d0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b67cfe20-78b5-4855-83fb-d5721699ea71@amd.com>
Date: Fri, 7 Mar 2025 10:00:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2503061731511.2600338@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2503061731511.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e14afb-0d7b-439c-0636-08dd5d88dcf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzVTdUo5R1VXb1p5R1RMaGcwQi93ZmFpcTFEL3ZINk9CVWExaWNjQjlXTXpG?=
 =?utf-8?B?QnJXd2Z1MnFaTU9iQ1NDU3RkNy9uTDJFV3R1UWhmcnNJVUFyUTFkZ2FmL1Y0?=
 =?utf-8?B?dFU5cjZwSkJzSWFNYS9rQ1JZT0RpZVI0M0hvRUE5S2drQ0VKeDQrTUxvNjV2?=
 =?utf-8?B?SiszaXVlZU91Qm42U21BaWtnVzlpOWFma2ZPVzkvemplakt4RWd5NEREdEdJ?=
 =?utf-8?B?N3cwMDRjdTRwamhEcjJPbXB1VXBmTy9oUitSS01TSndhekN1WEVRZG5BMUk1?=
 =?utf-8?B?cHUyZFNnNFpwQkhybUJvMjhSOWdYZC81UUpKUUcrTUVzV29QeEU3VVZRTi9T?=
 =?utf-8?B?SFlCRThsdXBoR0U5Vk1Mbnc1MzUvMmVETGh2eDlta1M5WU1KQUpQeEZ6aFRx?=
 =?utf-8?B?THVMeU1qc2N4TEJFeFlUSk1PZEVTK0Y1VjRBUXh5MjRpemp2MkozOGV1d1dM?=
 =?utf-8?B?VjRMODFxRDB6ZytsZkpFZGNuK3J2Y1IvLzZPUkJ6UDlhNVFwM3NKTzNBeExZ?=
 =?utf-8?B?K3JuQThJcUt2YlZmYWR4ajJmR2R4bExoUm1uT1o2VytZd2xjMlZ6aVZKTzhL?=
 =?utf-8?B?dklDRmlQNi9zb01MdzA1Vkx1TFRua1U1N2xZaWZIcXhtaXVMV0JFK2RXRTNU?=
 =?utf-8?B?ejBnSmZWOUNwWm1uNmhkRm5TOUhYT3hjUHpDTGkzRVZoSktyL3dMNGU5UUph?=
 =?utf-8?B?MkZrOWRtZ2JCOTF2bkdVSDVOaG5hYUdiOTB5U0NUdUFTaUFSbWt3eldtUW85?=
 =?utf-8?B?S1Z0UmFVNkJWSDMyMm4wUmU2K003ZCtOUUx0ZTA1MTR0QU05bTc4emFHbEtl?=
 =?utf-8?B?SjBNbGt6L0FJUTlLeDROdS9tNHdTYXBTT2x4VXpMaktHWU13ejI3ZHRMM21y?=
 =?utf-8?B?WEN0Z1BsNTh0UStWc0JGeHdFcW1MQlZZL0dsVXJCNDVEMlhpM3c4K3Jqek1m?=
 =?utf-8?B?bFBZRXd5RDZoK1JHT1NGc25uaEt3WWFsOWRublgzTXd1SElxcHRVZW9tSDZs?=
 =?utf-8?B?QWtIU0VxWCtBOVJkb2tET2dxVkgzTUlFZkc3VldjZHRMZXl3WEJnVHc3RXVN?=
 =?utf-8?B?VkRUamZudElqQ1ZYaitnTWlYQnExV2c5dWxSNUxLWmJIUTYwRlRsMm1Xd1dI?=
 =?utf-8?B?ZHdZNERBMHpPVE1WQXJ3d25OYXNydWZvcTlCVzdKTm1aayswWXRIdXhCRnBR?=
 =?utf-8?B?RG9SeHBYd2lrWWNRSUtHVkwvU3NRM2pZSUllUzFWNk91Y2k2Yzd2aWgrbUsw?=
 =?utf-8?B?V01rRlByNnJocjhTR05Bb2pqWnFkakF1bkR1UjFRU3JkQ080NXRlSGNveTBB?=
 =?utf-8?B?OXNOU1prZ2VFMnZQSWFLRStpMjRPT1c5YTI1SWZaNWVxNEFuMnlFWEM0Z0h6?=
 =?utf-8?B?S3p1Mk1FSEYrWnVmRHZ5L3NGa3F3ZVRXRDkvd1Y1MFljNmpsaUJIaXl2SjVP?=
 =?utf-8?B?b2MzQkdlZVRnNVdkc281YlBTUDRqb2kxdG5BbHQxUC9ZdnUzRHp5aDBDSjJH?=
 =?utf-8?B?Nlg3WlJIOTBNUURYVnRKS2E3QjJyUFprSE1RMHkxTmlPYW1FOEcwYjhxcFFN?=
 =?utf-8?B?WjN3aDg4MzREV0NUaEFsQkc3eGtrTkhITjVCTGdESkQrV2xYajBhVGMxdHdP?=
 =?utf-8?B?aUc5YlQ0NzVGWTRVb0V6SGZkMVZJL3lBL1F2L2NSY3RUODF1MmdRNHNvNGJs?=
 =?utf-8?B?eEsra2F1ZFg4Ri9YM2dLUks3UmdacURpd3ZnRjVpUTVIMzRpT2w5K1IxeHR3?=
 =?utf-8?B?UGlWSW5wcTRuakxJdlEzcG40bFZjVERiMVZXbER2bkNPUEJlK0xKY3hWMjg3?=
 =?utf-8?B?bUpIZlBKRVg4RHkxQ0EvcUg2emdLeHY2MERuSmlicFd1eEpRandTamVOUVF1?=
 =?utf-8?B?Z3VBMTFhYXdVZ3JLRnFCOERYOFo3WkZ4Z0VwbGNNUjZOM0ZpQXNob0ZZOThx?=
 =?utf-8?B?SklYNUEzK1A3M0U3UlZ6MW42MEtxYWhJNCtSeUt4YmFzUXVwTHFSNFB0eTRC?=
 =?utf-8?Q?/wCZWHBEFQ3X9Ms9GFFdbQYHRVHlaI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:00:55.9859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e14afb-0d7b-439c-0636-08dd5d88dcf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035

On 2025-03-06 20:32, Stefano Stabellini wrote:
> On Thu, 6 Mar 2025, Jason Andryuk wrote:
>> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
>>
>> This fixes using the Xen console which assumes domid 0 to use the
>> hypercall interface.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I hope there is a check already in the code somewhere that triggers an
> error if multiple domains are created with domid 0 ?

Hmm, no, the existence check is in the domctl code and not in 
domain_create().  The next patch in the series, "xen/arm: Add 
capabilities to dom0less", adds a panic when trying to create a second 
hardware_domain.  That check could be moved here to keep it all together.

Regards,
Jason

