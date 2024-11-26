Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99E9D9024
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843268.1258907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFke7-00039H-Kj; Tue, 26 Nov 2024 01:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843268.1258907; Tue, 26 Nov 2024 01:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFke7-00036v-ID; Tue, 26 Nov 2024 01:45:43 +0000
Received: by outflank-mailman (input) for mailman id 843268;
 Tue, 26 Nov 2024 01:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFke6-00036p-0l
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:45:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:240a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed12ed1-ab98-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 02:45:33 +0100 (CET)
Received: from CH5P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::21)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 01:45:28 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::d2) by CH5P222CA0017.outlook.office365.com
 (2603:10b6:610:1ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.17 via Frontend Transport; Tue,
 26 Nov 2024 01:45:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:45:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:45:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:45:18 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:45:17 -0600
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
X-Inumbo-ID: 1ed12ed1-ab98-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwYTo6NjI2IiwiaGVsbyI6Ik5BTTA0LU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFlZDEyZWQxLWFiOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTg1NTMzLjAwOTk5LCJzZW5kZXIiOiJqYXNvbi5hbmRyeXVrQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRWoFvxg8dk8WeMN0SoZjKwM7FUHjYjob++XpdrOCP0rlHpci8DSAnHSD0lY5jPZSmdUVj28c7fS0n2YvYZrAN1r+Bw4fCHcDkquGNwUQMhLn4nuozTTn0RHCrF3H0LhQqBE/0wyEEI+SBkGbZAL3JqJ+EQAWZ43JZjos8GxYKYehp1lHrCM80VRqmvNAoP4QMu7L9tHqoem0JWUIAzDokT3ekNrMmNq4vx5jcOn1udGDQmYDFizJesrfsP1cc8CWZI3+6EAE5xA8gN+7480sLOoqodN58L4778M0lDtvujC+gBV70JFMaiK1/VY20G0V6v3bn91/g6bVnygu8TYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj8GRGoNPlvKgmlv/8K9gQzsnT7rvHE3xiVnJPqYCuM=;
 b=GwrSV0iFQfF9iEMZ7/ZnOepbnSPlw9d3WsR+MT3EiNgt8P1YqC6Qqz6KhWN+auSNWyzCF1C3yxD4FdgSvzG2n8hL+D1c3iSumNZXjc8D+gXd8f/Vj0aVjH9guRAjZU04lt70Nraeo5EMJwueTdxKhip6VTrCixbhH2QzeG4uhuF1Y2ryIouROD8HuIpfRM6d78rCsnWoePGJjASeo9m1CNuthCsyLg8r8IV79Ht0JMRhIPcRpo5HLwc6WcMRtN3ej5Vz2Zh2kUdFsk6uckoTTfczALOB7LXzp3CfXJsRsvHcOTtLcOVqnA14Ucbj3Y0NSKOZX4E2cawlma3fdHMQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj8GRGoNPlvKgmlv/8K9gQzsnT7rvHE3xiVnJPqYCuM=;
 b=dhvNFbdrxUI4SpGOt82uZfSWIG+lpCi4rCEd9DArNLweo4HbW0VVIVyTjmMZ8TIJ0LlZdYlCUXsLG+lCDxB280I9UeLBRML6KdDAGrlphs13Q0PmO3FOPpRqRnDGKdPeyjGARg3xXBXvCeBRg5OPfjrSGSqtlpDPS7N3wVW8T98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4c4d8cf0-cc31-4042-8efb-892f56047d11@amd.com>
Date: Mon, 25 Nov 2024 19:03:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: bec65db1-2137-4747-acc4-08dd0dbc0103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czZHTVVTQ09lQnU3VnlPQThZUmVodmI3MGxYOGg3R1ZvTlFZMXg4czYrbWFv?=
 =?utf-8?B?RmFqWTNZOWkrREJlYThNdVg2ZytsSXlCRUtYY2hQSklqQkQ1dGtsZnNPUlM5?=
 =?utf-8?B?aEtNQlNSekVTSFV4cnIwWXA4cExMZTZ2cTRDUkw5UFBsVDAwN3cvVmdCZWo0?=
 =?utf-8?B?cENyWnppajI3UXpVc3ZxeE4ySDFkWUZYcjF1SDhjMzY2YzJNbS9ZYk1TRUlq?=
 =?utf-8?B?b3BYbkQreUVVa3QxLy9uOUpxZ0FXeUFCOFNXWE5sbTZTaXZLUVhRZE0wVWlo?=
 =?utf-8?B?VE5ubTJUMkFBYncwSGxoZDJwakZVeE50b3pMTmhDK21pSnlFVFJ4VDN5aXgw?=
 =?utf-8?B?N2hPeWNMTTZlRFBxaU5nWkVxdTI5S0p4VjBraTJUUktNWUNIeUh0c2JsYStW?=
 =?utf-8?B?ZXIzV2NSbmxMYW5KU1FLcHBCVDhubFoyMldjak8yODU4SmZ0R255Rm40MXoy?=
 =?utf-8?B?Rk1ucVFmZ2ZOcVRRRE5hNTdwL1JlZ3RRYnhDUUNuL1RuYXNDNGVUY3E0c3Fr?=
 =?utf-8?B?K0hpbTRGU21iOUp2SUpxWjcrbm5iLzBzSUE5YUtjZWlPNTFOY08wSHBpNXkv?=
 =?utf-8?B?RHNZS2ROR2FvRFd0MEpaeThQVmxnS1ZaMDkzOTV0enJacC84dDdjM1NrS2d2?=
 =?utf-8?B?ZVRkU2doQmNPei9CNi90T3lJZWR5WVBkR2s5bnRIRkh6SDJmQlBEYzlIMDFD?=
 =?utf-8?B?b2wzMk5UK1BkeG94Tm1MczlBOXhFbEFPd0dlZ2NrSndiclV0eC9lREpKUDVC?=
 =?utf-8?B?VVdZVWJybGRkLzBqYTQvaUoxSHFPaTBSYzVZTTl1eDBKNW9vd2M1eXZiTHlQ?=
 =?utf-8?B?NnBmSWUzMkt3c0F5NGE2TmhZaU5KWWVzREoyNTAwaWV2Q1pvNVJMcUlkbDdB?=
 =?utf-8?B?QnMvcjFyS1NwVHh5OWE3Q1Q2Tm45Zi9JSnhBcStYdFAzUTRLcyswMzlXL1ZO?=
 =?utf-8?B?dDMrSHRReHFxRFBPQitPQTZBRytPN1M5YldQdENzSU1QaUdNa0F0SE1DTjlq?=
 =?utf-8?B?bjNwbS8rOUltVnZveE1mQnZ2SmhrclRTanVscm1ueW5WZDVFRmZ1WFA1Nkll?=
 =?utf-8?B?a2p2NmY5WG1aeklYM3cvOW9MZkpkRFpRSHZETEozL0VOa2poNEVTQVpZWFk3?=
 =?utf-8?B?YSs5VnhVL1YxTGYzbW5hRGNjT05ZR1lTYk0vU0dKYVVVekJIVWJCNzBJSGJF?=
 =?utf-8?B?OXp6WW5tbVpHUGVscEdTVWVGN0ZsZXVrd3BwRDY1R1pDTmgrL2xmcnBwbmdX?=
 =?utf-8?B?MlZ5QmEyekJqTGd6K3l4cnRUa1V6WVNiTVI4YXBpQjdkYm1XL0d0eXprNmE3?=
 =?utf-8?B?UEpiUFpPaDVDTElncW1BSG52K3pUVlUzZWlUeEkvcUl1STdyajRLS0VuVFgw?=
 =?utf-8?B?VU9UdE81cW11YUxXVXpnaWhqWWJXNDlQeUMzalBSVWZ1Uy9FanRoOER3VTM1?=
 =?utf-8?B?alNXSjZnbis2RDJVdTV4TU5seUpCNVRmbitwUStZR3VldXZwcEo4UXUvbjhu?=
 =?utf-8?B?Nm9KUTBkdlJkMlFodElYbXJOczF5d1B6U0tUUHF3RHVFRXpxeG90dklkK0Fz?=
 =?utf-8?B?S205RFU2bVlKNVdua29PaGY5SDZxSmlFakh6QXAwYUtoSjdHQXRKSnhxL0lQ?=
 =?utf-8?B?dnlrSHIzaEtZa2JFOHZzdXhnY1Y1WkEzZEYyZlFVSWZQcmgwZGtNVmtHNXY0?=
 =?utf-8?B?UlZXQWxpL2Y3ZFBTV1RPNHVCdkF6UDZtQ2I5eS9KVHlmQWVveVJncng1ODNY?=
 =?utf-8?B?QkRxMi9pbjRQN1BlR1N6a0hIWFB6d2x3ODZaYTdUOEhWemVmY3VXTEIwQWx4?=
 =?utf-8?B?QnU1QUsrLzRMOFVqYlM0R2wrRmZXWmRtNmxRcE5WRndMNC9TeHlyTmlZbVZI?=
 =?utf-8?B?emRNQlNSejdxNEVzdE5CamlrUkE2RkVkR3VQdHdwODNMMndvV2dHR0RxK3RO?=
 =?utf-8?Q?k3m7rqxeH5UBDH8leEi3YL3fYN6jW6VL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:45:27.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec65db1-2137-4747-acc4-08dd0dbc0103
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Add three properties, memory, mem-min, and mem-max, to the domain node device
> tree parsing to define the memory allocation for a domain. All three fields are
> expressed in kb and written as a u64 in the device tree entries.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index c231191faec7..1c3b7ff0e658 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -609,6 +609,14 @@ int __init construct_dom0(struct boot_domain *bd)
>   
>       process_pending_softirqs();
>   
> +    /* If param dom0_size was not set and HL config provided memory size */
> +    if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
> +        dom0_size.nr_pages = bd->mem_pages;
> +    if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
> +        dom0_size.nr_pages = bd->min_pages;
> +    if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
> +        dom0_size.nr_pages = bd->max_pages;
> +

This placement seems a little random.  Can this move into 
dom0_compute_nr_pages()?

>       if ( is_hvm_domain(d) )
>           rc = dom0_construct_pvh(bd);
>       else if ( is_pv_domain(d) )

