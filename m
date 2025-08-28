Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40001B3908D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097294.1451690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR5g-0007y4-Kk; Thu, 28 Aug 2025 01:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097294.1451690; Thu, 28 Aug 2025 01:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR5g-0007vE-Hi; Thu, 28 Aug 2025 01:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1097294;
 Thu, 28 Aug 2025 01:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urR5e-0007uM-Fd
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:06:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dd2d6d6-83ab-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:06:08 +0200 (CEST)
Received: from MW4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:303:8f::26)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 01:06:01 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::4f) by MW4PR03CA0021.outlook.office365.com
 (2603:10b6:303:8f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Thu,
 28 Aug 2025 01:06:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:06:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:06:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 18:06:00 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:05:59 -0500
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
X-Inumbo-ID: 2dd2d6d6-83ab-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKzDbvd/cBnc/qcwWxulJgI325zFOLK6TcuDNd8AR97C7iNXcZs6JxNC5X4qO8GeiLCwhPJUIeFDQflPjRmePXak63wBRh22CBMKiTBpvVf0YucPWYOfiDgCwOjXiHL9taVX7MycDjtTSyN2IQ9lb3pMG4s6GJgJsTXbH4vl4IM5Oe6Ca6ZxY4V2K5tdAAjSHDOYQn/mDmKgS3XR5MyebzPldmyqoQC3bvGWWCtJoCMFCn7uaZAPz2ykCeWvF/Eg/cm5/WZAZFTZyV87M5zq4Le0tiUx3DE1HP+X7SUjeZpj7hd6kRHGAwGxk9UjLnAb2BcQDF7wDX+xHIQ758/NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZpEeOdQG9IlTs1NOLGnpUnHq5k0oW4WzALCizS45KI=;
 b=JZMFkQeskGOzMWl9nWHvKCou1ieKGjNpBVCV39g1sN7q/tYp2BCT2FPGFXC0RQIWZomWgLIzYPhysp9E+HFUFKeyus3QxfjE2pjdz5OnqEEbIACgAuaiAQ4ItCR3JYAj/hR+3n2Qeqkii2KWxhFN7imch3/ZzbkqzRUqYKiZjkJ4U9zzUmpxtPCek21ORVzB+qbvYQFH1LQi5E95Vbn9kg61BgOveRs4jy7qihEBwVE1PLmRh+UZzxLhQFeZk0uaXSfdh9uIpAYmfZ1aYdXMfVaEhMTNQUqzYw7yUX1aqinAttkcmax3GUGzKdr95kl6FctwRjhIhHSQlRBmcjmpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZpEeOdQG9IlTs1NOLGnpUnHq5k0oW4WzALCizS45KI=;
 b=L3x23RJA8Fkyw88sETbsC+yCb7q/rkZ3GgxmFNMJDwzhBfi2ashU/YvY9CtM0/UoDv1HFilHrnbVLY4b9/ddNTyAwoItXVhPtvrnSZivtDGgexy0bSBfA1H4lTfpO6Gn3lKxM1ZQvcg+T6aH9UHZ7YGBvHHpldmLZoG7zcQpw9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f44709be-62a9-4932-b550-cf5446d4bf1c@amd.com>
Date: Wed, 27 Aug 2025 21:05:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] symbols: centralize and re-arrange $(all_symbols)
 calculation
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <5a77bb51-22d1-4956-8e45-c2412c413766@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5a77bb51-22d1-4956-8e45-c2412c413766@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0a2ce7-fabf-4a9a-2746-08dde5cf0de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2hTcDNTaXpGVXh0cjVsUXdIRnlnS0Y5VktLUUd3R2JzUTNCenpXSys5REto?=
 =?utf-8?B?UUxibXF1YXRBWExmYlB4UDc0ZkpzaFlwVTd4WU9DYm5SWDlicG03WWhTVGFt?=
 =?utf-8?B?cndVQVJOSUxOWUxSNW9zY3BDZFZtdjN0cXFVNEJrZmtZT1Nab1BhcEJCZi9R?=
 =?utf-8?B?WFY3dmNieVVYUDJmYy95SFhRaDlkU3grRmozTlcrOVU4ZnVsLzVQZDRWeXhV?=
 =?utf-8?B?OVRDMFZ2VzVFemVvY2RqanNNd1FIMG5vZkNRSzVhZGdwWlhhQzIxTnNody9L?=
 =?utf-8?B?OG1lckc1aG5JUVpSSzV4WTBGQTVSV2hXciticFV0MHlRZnBpaktpYlJrd0dV?=
 =?utf-8?B?eFFOVTlSV2ZaVkd4WE5hdm50UEU1VnpVNk9nQTdjUkJtSVlTUFdCR2JtSGxh?=
 =?utf-8?B?OExUc1cwZnQwVnlXK3kyYzlERjY4MWZZKzBFK1dXdlN5YStCb0VvcVdJeTVL?=
 =?utf-8?B?dnpUbWl2NFM2ZjM2UlJSejYybUNaYkVoT0ZBdHJ1d3Voa21ac0RPeW5DdEx5?=
 =?utf-8?B?NWN6ZWxxa0twWEhRZkhZUDVBTEJVMlR3TGxZQWZRZUlxOVFyU21mcFhJQ1VY?=
 =?utf-8?B?RCs1ZGJaamROY0VqWW9zZm9VdnZXS1RCaDUzQXA1ajkzNXNiUjRoQlBkOEY0?=
 =?utf-8?B?c0F3N0x3YUdUc1djS0NkclkxVjk1NDVWSndaR0VFNE1ERktaK1B5T09LZlBl?=
 =?utf-8?B?SlpDUmNDZlBiK0Fid0RKd2QzVVNJZVF3bHMvSHJnTkNxaUdBeXZMdW45OVd1?=
 =?utf-8?B?OENTL0htR0lhdXY0WVdVMUpzT1NDNWxRdFBZYTVMaFJyUG53ZGNVUlloMnFq?=
 =?utf-8?B?OUhqQW9nZUhyUGRySzRYOERJa041eisxN0FuREtyWEsxMzZ0VmpPdWpaK2VE?=
 =?utf-8?B?OWszU3lWZzlvK3Q0RDBSejlwczdUODR2TnlndzExRENIU2lZcnN0TU9jNnRJ?=
 =?utf-8?B?V2lSM3hIY0t5S2F2S0NBRlBUaGNHSE9JN0d4UDRiRGdOQWRBMUdleHNKRkxR?=
 =?utf-8?B?bGFueU1yS3FMblpBQ0lhNGNxcUFwdlBYalVkVEZQM2trQjhXL3hiOU5aeTBK?=
 =?utf-8?B?aExpTWVFQUdtSnRFZnE0cmxrSE1tbjYzRDZwUTdHaXlyUzhreCtSaVhhenl1?=
 =?utf-8?B?MHl3SE5lWHhub2djNDFoWmdLUkYwejZoVWxNYnBaMmVRU2lxNnRJeG5wR2lN?=
 =?utf-8?B?c0xzdi9CajNCbEFRbUZ5Nys2dVNuRmNJUU5Nc1REeFQ3UWcyWDd6Y0w3elJo?=
 =?utf-8?B?ZjQyZkFnODhaZHNtdzQvRko3Vko5cDRxV210eTlGZ2xFd3Q4K2NDL0lPS1Ux?=
 =?utf-8?B?UDdUOWNtT3BjMXl6ajd4SDladytKNVlaZTAyME16blZHdWQ1R0tRdEphcVhS?=
 =?utf-8?B?dTdmMm5CZVF4eHphTW4rR29KSHNzL0lDdVoyZm05cXc1N1JPcXBjNWxtelhZ?=
 =?utf-8?B?N2FxZG9nL0dveTdRRi9KMEFDQll0TWpmSktubUZDRUhsMmUvY3Ira0ZrMFVW?=
 =?utf-8?B?Vm4ybnJTOUFyL2F0V0M5dUhxRVd5R256L3U5eGpWZm13TEtTOSsxYjM3NnpZ?=
 =?utf-8?B?K3NrRXRTa1RVWG9DazVDV004S2x1UWNIQnc0cWNFWm5RMGd6ekk1czhHV1pC?=
 =?utf-8?B?ZU9wTnplRW9QQ0U5aDMxcENRY1R1TnlucXlqaEVoRm9KSVk2aWppL2dBWFlp?=
 =?utf-8?B?VW5mUkNXdmhBcy9BUVBhR3U5YzBzallsUjh3YmhPWWtoUEpaOSthZVlISGFm?=
 =?utf-8?B?SmNKdGk0ZjR6amR4N2RJL3ZOMW1FY0I0ZG5Td211VXNCUlNTN0VSVzllV2tW?=
 =?utf-8?B?SXVqL2xpZTFEMkVvNWpCWHpyQ20vQ1F0OTJxN1RoZVFDbnJaWHEybFhaNW5G?=
 =?utf-8?B?MUZFaVFOeEFSRTdvNUFPdEhES0ovYURNampSL3c2d095TGZRdE5yZHZhbG5k?=
 =?utf-8?B?ZnRtSEtld2Z3N3hFM1MwQXI5N25DU3JuQ3NZOFZRZStLZmRxOTAxMHd5cFJU?=
 =?utf-8?B?UUI5N3BaUVVjMnJmNk1XMDRYemZJZ09td2g3Ylh6LzkvQ3F0eERXNDJyRlJi?=
 =?utf-8?Q?IdEFJ3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:06:00.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0a2ce7-fabf-4a9a-2746-08dde5cf0de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

On 2025-04-02 09:59, Jan Beulich wrote:
> For one there's no need for each architecture to have the same logic.
> Move to the root Makefile, also to calculate just once.
> 
> And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
> LIVEPATCH, which may be useful in (at least) debugging.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

