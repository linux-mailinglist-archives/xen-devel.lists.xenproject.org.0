Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2499575D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813449.1226393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFUu-0000gw-4U; Tue, 08 Oct 2024 19:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813449.1226393; Tue, 08 Oct 2024 19:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFUu-0000ew-0h; Tue, 08 Oct 2024 19:03:52 +0000
Received: by outflank-mailman (input) for mailman id 813449;
 Tue, 08 Oct 2024 19:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syFUs-0000eo-FE
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:03:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2009::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c612add-85a8-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 21:03:49 +0200 (CEST)
Received: from BY3PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:39b::17)
 by PH7PR12MB8055.namprd12.prod.outlook.com (2603:10b6:510:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 19:03:43 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::28) by BY3PR05CA0042.outlook.office365.com
 (2603:10b6:a03:39b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 19:03:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 19:03:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:03:42 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 14:03:41 -0500
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
X-Inumbo-ID: 0c612add-85a8-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbZcr8PwzpeTIDi+Rdv0yqLYrB6qdElinDmFqaj9U708LMrI4w7ieoK7hQOdz0NnAQpeyZRblDh16KMtacUukR2PQK1XdUW1wEN1mb/yV9RzWLYrgiE4OvF9MdhB1lSNcnifV5huQNSMAn1yP6KmZ8KuDE43m4iKEQJwzNmRwc5jIpQn65jSy7mYoi4lJonTzOzMLQ+rzInK0yfsMTBI/G7WCp70SDLAc69tlZCAcEbMjwQwR+ZCqAc8qaR02bqwNVSyRH94DSqhI5xidJldSCdJ+JNo86mv4DnhWZkhhyfH8X5Nrsj6pEp1dCTRPfvebhWLIjniZS0LS16SkuOQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfMfNJhx6rw5b2gLt6ypI/98O0iJiT3NTu8kQSKMFFc=;
 b=jLc2ohnUN/N7euT33txa1XyEhjGNrJqW/BNmEnbb3ZclfNVq5lIdFfXR2Jb/ogds5JAmFdDPMHYO3BzvZHNiYyS79Nx42T7ZHtZzDGpvRdGs9rppzYRp6Ljb529Gdn2AOYL5qK2sX69TPxX2NO4uP17rHq/qGb0tQfxYpbg3IGAZh4PYdErCrz2r6uYrB8v2LDNExTj1f3QUEz9oUFSZ9wjjkcZQWh78vYkOjeelo2K/AlcnoKqhaOLbHxAoKE+sAQOCv94WYq1iANFOVtzC7TZg0gxrOlHNSAogEG1paV41Bt1mn1JT1bWMc65UpH3FCzYm00KF1+BMjHIk/4JnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfMfNJhx6rw5b2gLt6ypI/98O0iJiT3NTu8kQSKMFFc=;
 b=sftyZOdxmrHUs8fw1LIIh/gJjCHJfkUfFAnftK6IKpnKrBzUMiW4gspIw6hJQNlIU5gBNcyqHagCifLyAAOV0GIekJiwbcyBQUx+J4BUoVCo5w5WPC+zabZVTn3nxR0AtNlxFWf7BqcNsnKzF4FghNyPHh9fqFSYnKv5x57zWFQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f7f57f66-0d44-47b2-b222-2c154318ef6e@amd.com>
Date: Tue, 8 Oct 2024 14:03:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/44] x86/boot: convert dom0_construct_pv image param
 to struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-30-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-30-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH7PR12MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2a3f8e-fd0b-417f-dd23-08dce7cbede1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDJlcTFRekFXQzltTXJaeFNLdk8yRm11a0tWQXhnWU5DN2NlNzlWSi8yQjVB?=
 =?utf-8?B?cFptNEZvMFhveGlSOEQxaElaVmtEQWxUVVNnNkVWeVlrMnFJRFFWT25rbGJv?=
 =?utf-8?B?UG9GVjZpSFpwNVl5MjNtdVN6T0Nnc2NKZ1JFb1Q4S2l4RlVaYkdGNmQ5RVRJ?=
 =?utf-8?B?bVhpMkNvV2E3Z3FFRGEzMXF0Z0pjYUkyTFF2YytZS3AxeklMUEZodURpUUlr?=
 =?utf-8?B?T3ZtSDg1TG9PbDF3NWxZSXRVQWwxQXRmZzVxbDNySmh0MmplMmh5MDBqVTI1?=
 =?utf-8?B?OHgzUkw3YnprUzlmemtsQzYzVlEyN1Q0WWsvZE9DNEFjeFZWSGpQeFdTUWZv?=
 =?utf-8?B?WVRvR0RhbEhRTm5OQ1hUaUM5T2VzV0k2MlFKNUpXMzRIWWRCVFF6NSs3WGcy?=
 =?utf-8?B?T2FlVVcvOEpqM01BbExieisvbTRiOFM1czMzYWhESW9TMVBBMHFpL2oyOHJQ?=
 =?utf-8?B?TWNmM2lBUFpaK1FsRjZoR0FKRzE0ZDNzM0pvQkRTcGZPTVdzTXpGbTZqTXEr?=
 =?utf-8?B?OVFVMVpRRTVrTSt6S3RqS2FucHYyWDR1OWVsMkxJUDVRWG9kOVhRYXYvcWZG?=
 =?utf-8?B?WjVpc29XNEJOb044U1Y3a1NZeTVEKzU2WHZOK0ZGM3VLdThkSDhXMW5kVWpz?=
 =?utf-8?B?ZkIvbVFqRXlJc0hOaklncmdHclF4NjU5Ty9UNFpCVFh6MGhGNEEwUFgrOFE4?=
 =?utf-8?B?Ti9aTlV2UU9OS2oydkZhamdoZEM0bXNXNnY4WXRUUnVqVDlRb2xPMDlTUFA2?=
 =?utf-8?B?S291R1R3bk9YUE5qa244QUNDU05zRi8weEVsM2UySFh1YU1FZVNxbW16Zk54?=
 =?utf-8?B?MUlpRms5UjJsSHMyUkQvRjVKQ0g2R055OU5xWnpsb3AvdVk1WkNVSVVNdWpx?=
 =?utf-8?B?cE5kQ2dwbkhuTnBCWFRoOStjT3llQ1Q3aERmMTZSQVptM2x5SENvSDgyU1pV?=
 =?utf-8?B?V0d1eDcwWDN2VWxwVXVtTzhYcHA3YzRGbGpqNFZlbStVMlRkMVFJUWdRSDZ3?=
 =?utf-8?B?WDd4RDF2MkpIMEdrRU43VHg2d2ZwNXhQVEppVHArblZZZittQlo0SkdZVUww?=
 =?utf-8?B?dVhQb0ZrOWpDZTB0eGc0dnY1KytjOVQxQ3NTNE94SWtCNkZJUVlyNDNmd3Mr?=
 =?utf-8?B?Q2wzT0REblFOMFlabkRraEE5dEw4MC9UTmxscWRpNUtQTUNWeDhQeFBJS0RY?=
 =?utf-8?B?UTJ2aEFYRTRQU3hVb3FTOGdIaWdIbFRsUkJZZERtVGl2V3dHOEcrN3NqUm9X?=
 =?utf-8?B?VTF6RWlTOGl3clVNQTJ5bXYrTktHVHlCclVtcFB4TUpYRTQwMEo1dVBhNGlX?=
 =?utf-8?B?dURCYXNMd0h6dUZsLzNHMHFnZDc0Rm5SdXEwZnk3THZEUFhOTG12bHArS01w?=
 =?utf-8?B?NG53MnBLbWRTMGRKajNzcTczK09lYUYwcmJHVFVhblR0dDJNbC9OYTBaeWtL?=
 =?utf-8?B?N3hMYXdNV3lnNXlNVlZCaFpoQTU2amdUSmJhUzV2aVpLL2t5KzBQMEM0RnZq?=
 =?utf-8?B?aTRzblJ4QkJYS3FSbXlEMWR6RFdqMkd6WFIvaEI0L0lWK0Z1SjNOYTVUZHVo?=
 =?utf-8?B?QzFGOTQzNG5zOG84aEVnZ2VOcnRDNDdKaGwyTE4yVzladGpRckNSbzVHdEdo?=
 =?utf-8?B?djFDT1NOMHRLM1YwenNQRmliK0JSTnprYlhJTEFDWDRVb2FSVkVWbTE0U1Rq?=
 =?utf-8?B?MmVkSU56MkdoOUp0ZjQ0QVdQVGUvamk1TVZjdExYcTJHdnJ1MGNKWXIxTWw0?=
 =?utf-8?B?ckZLYkNoR3ZmSUU5UXcxR25CbG1ycS9jQW14R24yeGx4R1pXNnRYZnU2bUNv?=
 =?utf-8?B?T1B3amRMOUZsTVVBamxkZllGR1prR1BNSGhFV0x4VHpEQjBVZXA0YkVyZncr?=
 =?utf-8?Q?AlRHGKAmuQ3xG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:03:43.3741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2a3f8e-fd0b-417f-dd23-08dce7cbede1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8055

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This changes the type for the image parameter of dom0_construct_pv to be struct
> boot_module. Removing the usage of early_mod field for kernel module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

