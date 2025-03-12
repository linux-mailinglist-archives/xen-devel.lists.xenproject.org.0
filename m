Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C57A5E2E6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910604.1317276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQ4b-0005ZE-4j; Wed, 12 Mar 2025 17:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910604.1317276; Wed, 12 Mar 2025 17:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQ4b-0005X0-22; Wed, 12 Mar 2025 17:40:53 +0000
Received: by outflank-mailman (input) for mailman id 910604;
 Wed, 12 Mar 2025 17:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRiM=V7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tsQ4a-0005Wu-9d
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:40:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ec2b3a-ff69-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:40:50 +0100 (CET)
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 17:40:46 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::21) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 17:40:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 17:40:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 12:40:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 12:40:45 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Mar 2025 12:40:44 -0500
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
X-Inumbo-ID: 22ec2b3a-ff69-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvfzO+2z1iF3CjDDpDCmK1PQeeDiP0kTfj2mEDcLEYri9jun7waPT/lI3FwUMcUyp/alswtYtM/5qNxh7NNeJl2eh2OHIKzEgpBTRVOeoPWvjKP3rgS6WnxY1Jxm8NBJEcKFsHaDSGwme1mNsAxEHfp247pBG7vqIBaN9uTcNdM2+g8Sy8Akmn9SoxTKvgxRyvuQxuRPmPOVPtLHGDIsK3VD9Z9USX0Ww9WHS3p182UUSB7xz9Cra1P5Up+4BrpKnvHULMmJLKD2GUB3sc11FAHxU2gXBwLfPQ4l7//JGVuSqSWNjT8u0BdBCGFsZCjVVdnHtZ1GIXe9HfIV8uNP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23F8W1myyJryhzgepBxpSVHRgrA0RwTaHK3k3wt/1Xs=;
 b=wVzR2/oeDHB0l01bCh9W+yWj3uwuCkYSHQnsDnT1644MoW7txCFVmDcVAaUm0ssCT/DMKkQMT0sQw9ZMXQurZTiqUJTZs+jXS+X9GR8JTrNpHE6OBnoHRTnp8m/BQIMWqimMOWOZBYAqtAsmn/TWfXi3yQqJ6O+KVz3/xa3tJCxPPUUk21fxyNYQwt021Qt9Rf22N/dMqTQutS4+AOP5fsQ2drJSDFWfOftrAwKbsbkYremgUj69392hqWPuRYtHayXDEw+el9nnNeinjfo0+f9H1ujE2dm8ipdNssv9J14X272WmHla2CZsCTAS5fAbiajVb5w8ap8qHmuFwzEGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23F8W1myyJryhzgepBxpSVHRgrA0RwTaHK3k3wt/1Xs=;
 b=02VUGYX3xNfoL6Q/6Jd6Wp9VaP36na4E7b1GpPv0uonkBg04hiCB+ItyhhifBlZKLaTsHJHBoTdBqm63mSS7U/rlO5+Jz/oLTG58WicuSoLxR+LjjhCbUSSH3QdcYPKFHE/+yrtEXmo7tUKdUejnxFINIEYv797XLaDErGDWJ5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d1a8cc18-83ce-430f-9a5e-93fa0d1d655e@amd.com>
Date: Wed, 12 Mar 2025 13:40:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] tools/xenstored: use unique_id to identify new
 domain with same domid
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-9-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250204113407.16839-9-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb608eb-a425-4ba3-e528-08dd618d0567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTVWMit1anhDKzVwa01zRzZMbllQS1NSSldtS2xUc3ZENHRjc08vQnd2RW1Y?=
 =?utf-8?B?NlhRMjUvR2VGVHV2bkJSc3pZbmFvVXBNd3RUSFZWTkNDS0U4em9rTVU1c1Yz?=
 =?utf-8?B?ZWxTMFZlVm84T3Rac2N3WkNIZGVmc3lUVjd4MEo0dzRCOW1HWVZ6bHFnSlVK?=
 =?utf-8?B?eENRRU0vWnFidHJxd0pWeFpYMXJxcFA3V2gwY0JlbXFabWJDQlk5YjVQSjFv?=
 =?utf-8?B?R1FqZFZoQkNSRzh0SkRlb0hRZStwdk5KWDhBa2ZVY0JqekNBMGs4SitaSzZo?=
 =?utf-8?B?L212dnJmOGw4U0d3QjhNejNiSFZtWHRpdkVib2VmUmVyUTNPdTFTTSsxTFlD?=
 =?utf-8?B?TWV4WGE4Uk9BcXN4RmM4ZEtaZjlPMlJLbVJrZ2wrRW9DQXpGODNYUVkvbng0?=
 =?utf-8?B?ZHlGbFFZNkl4TXBtc0RCYXR4VWN0eDQzWXJNK1VmTWJFV3haalIzT0lwN1JI?=
 =?utf-8?B?ZDhVWVQ5ZG14b1g3bTloTlIxVHlkblRXVEFBdHZqZG16U0podExRMVVNRXlB?=
 =?utf-8?B?WXlrVXlGUnFaTXVWRlhGT0VPaTNVZHZrT2FKQ09yR1hWMmZhQTZXMngyK3JC?=
 =?utf-8?B?TGdNc21ucTZvdCtlUXQwc05DeWpTcW5ubENQQkhOSmFGRHl4YXd1dkpvdUN6?=
 =?utf-8?B?aE5pbGx4SWdGOC93OW1TYnRkeDNiWFl3M3JpUSt0bkRpMGh2V1h2V0E4a1c2?=
 =?utf-8?B?Tzd1MlNOcTNCUE9hdWQvSHpEV3phc1JNSCtZc1M3TXJQUFBrODQwN0RqSjhJ?=
 =?utf-8?B?VCsyajdhNlRhYzNXNVUweVp2b1hlRHJBYytLdGNKS0Nwa3RMMEsxQy9nSDcr?=
 =?utf-8?B?RWNvMHZIbUF1dDIzbU5jV0k3NS9EWDVUbjYzeVRUL0lqYjBkZHRJMmx5Mzdu?=
 =?utf-8?B?OEl3U1hYU3k3SlJMSjZvOHN0alRzMnh4cWJucUpDU2s3WEJ5c0pUb3ZyWjEv?=
 =?utf-8?B?SG1oRU5QZzdqQ00rSjFGUFhGOStaUUNWMk8zWmx5aWNyNUpjaUhoenl0dmp2?=
 =?utf-8?B?aU1ZRUtQVjJIWlk0d1l2VGVHNm9WM0lDU2Y2VWRQT0l1S3NaR3NhQmpXN0xa?=
 =?utf-8?B?ZE02M1ZOdVpaenhCMFpNM1NqSmcrQTAwRjEwaUJwZTM0cThhandYUDc5RGdX?=
 =?utf-8?B?UnBPNnhEeTlNc1FYYzQrNUhDUG5uL2RGcmpLVzB5VEJBMzIzM0V2TUo5NkRn?=
 =?utf-8?B?SEUrRHVYdFZzbmFxa1RWeTFSYk1TTjJLVkpDaXJwL29wZllnWWI3VUdSc0RB?=
 =?utf-8?B?RnRnSnNEQnNJMzRFUmh5d1V4S0xYeDZCSFlwZ1FCVXBZTFVLUitZMno5Qjhw?=
 =?utf-8?B?OFdTc2h6THBHQ1VWcGgrLy9jQ25hRDVVUVZyZG93aEJBanJ0SWV6cVdNMnJZ?=
 =?utf-8?B?SjNyRDIvOU40Vlo3Q09KNjZ3Tjh5RVFKZDlkTmgwa09RVnB2bFl2S05QT3RO?=
 =?utf-8?B?OUx4ejlRS0VNK09EZXVlS2Rrb2F2TDZMejBpQmVHWWttV1F4WSt3V3R0MkNh?=
 =?utf-8?B?dTFrRkpNdDRPcFQ4ZFc1bEpuVnF3cnRJRHlEZTNIbGZlam1hRFY2RE5IOXZs?=
 =?utf-8?B?b0JBYjZPTURGZVNwOGZmREZhKzRNenYvVXNSdUk1MjYxckNRVWU3VlhkTnJ2?=
 =?utf-8?B?djkrN0x3UjZzMFJ4VjZFdXdpZ2ZydGNNMThtanBveURVQmx2a0JRdDFzM3Qr?=
 =?utf-8?B?UlBEOVBJRXVNWjNWbENrVmtqUy9tNEJNS3MzQ3YwQS9Mck9pTlhkYVYzZGUz?=
 =?utf-8?B?cDlmWWh1M1dXSTMrT3pEbDdNOFhZckFOYXRYZkZTdVpvYmJOc0pNQlZkMWFv?=
 =?utf-8?B?NkxURVM2REN1VTh4emZxVWo1QzBFN2VKcXFYbHYyRVE0bGJ5dFc3eUdaaWJ0?=
 =?utf-8?B?OHJaRmV0YUtnK0xUT3RjQThsS1V4L1VFc0wvc0NNb3dSb0JkeCtOdTBpeE9M?=
 =?utf-8?B?NU55RXVBQmdvdEp3WkwzLzNXU1c5cUR2SVFMc09TNUhIR21ZUUsrSjIyM1lr?=
 =?utf-8?Q?SQsSIO5a/xJiE0fdSozm0CSeXRu5Pk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 17:40:46.4518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb608eb-a425-4ba3-e528-08dd618d0567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034

On 2025-02-04 06:34, Juergen Gross wrote:
> Use the new unique_id of a domain in order to detect that a domain
> has been replaced with another one reusing the doamin-id of the old

s/doamin/domain/

> domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index a6506a5bb2..63df24030e 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c

> @@ -627,9 +628,17 @@ static int check_domain(const void *k, void *v, void *arg)
>   	int dom_invalid;
>   	struct domain *domain = v;
>   	bool *notify = arg;
> +	uint64_t unique_id;
>   
>   	dom_invalid = xenmanage_get_domain_info(xm_handle, domain->domid,
> -						&state, NULL);
> +						&state, &unique_id);
> +	if (!dom_invalid) {

What do you think about  `if (dom_valid)` to avoid the double negative?

If you don't want to change it, the code here and elsewhere looks fine 
to me as-is.

You'll re-spin with updated dump code, correct?

Regards,
Jason

