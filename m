Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14932C07CBA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 20:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150792.1481794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMj4-00019M-DZ; Fri, 24 Oct 2025 18:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150792.1481794; Fri, 24 Oct 2025 18:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMj4-00017G-A3; Fri, 24 Oct 2025 18:41:22 +0000
Received: by outflank-mailman (input) for mailman id 1150792;
 Fri, 24 Oct 2025 18:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOOD=5B=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vCMj2-000178-S0
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 18:41:20 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc78398f-b108-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 20:41:01 +0200 (CEST)
Received: from SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::34)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:40:57 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::9b) by SJ0P220CA0003.outlook.office365.com
 (2603:10b6:a03:41b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 18:40:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 18:40:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 24 Oct
 2025 11:40:54 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Oct
 2025 13:40:54 -0500
Received: from [172.21.152.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 11:40:53 -0700
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
X-Inumbo-ID: fc78398f-b108-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn2TbGIWvGnAh5Sgp3nQQGNjV6+XIZ9Yosby4kWYSikGvOazt1w2FAoDC1RHiqmMllMYQpv4JDmmDisLUwxbL58craIRItrjl9vz715UV/Z2VrlV5sXi4SYGryqprHisNTRdx9P+TPIZR8KkO1USJZZ/XWDa2fvVlB6bK3J/0xw/Z+RBCrlBW0n5wl9mQi1R0SZEbNisHDGxxqwzjnOIaQimAtq13ELuzD8t99D8J5/d1YlQDGxS3jThm/BuTHoZeWBZGG3GoCowyIdMPj2VzCJiA2A3Ns8ZBgcReUXouNgPFvRQU+MqAIQXDkCYNupSE3hF4XWY7vJpw1WSLip4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azMy5Xm2ACUGY/+rJ9kbJ2jgnTVd7ULOB2HUNSftaik=;
 b=GBjcEiNcdLDtRhDU7tLg1BRmt/NqAGEqZQnMEfCB9CQpiFqtN6wAPn5nNpOCTHLgvQaXMggbMR4UEP3n/LVv7/MAmQdh8Q5EEqYFfGYkaMubnIcivZYgY8DthYg2qfrYvmH7Ra4GEyNlzPIn66V7KimBjh/50cYifjDAY+ybzSveu0VpySkpnxKxKIAPpTWHvdcf1a45nUGRHGDrvZJvEKIczxtfnjRMR54VYGmAm4xWyFQmXYYK4utEO0dxptHYLLGKCsRFXCT1dUrxko3fOKkwgcwuaicRF0qLKjMkteR3WeFujYP0PyW2+X9P/WMmXkKJZo36A9RyV4I9O4I7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azMy5Xm2ACUGY/+rJ9kbJ2jgnTVd7ULOB2HUNSftaik=;
 b=hy66ijzc0MxV/v70nZmKTBFD6c+tNvFpdUyeGIzuBAoJwDM/MKrcysA0VC8WdiEM6yRcJtsJxYEjmEvzKS2l2FrxzZlO7slq+nsdloGE6th9k+oAiYiFxDtjVzqQDhmMomlh5ujio2a0fv0u/ad73s8GeGGk/BSLCm2Jag+QHgQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <94ab0a1b-63ce-41e5-9cf8-54fda5f3b6c9@amd.com>
Date: Fri, 24 Oct 2025 14:40:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vpt: make hvm_set_guest_time() static
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20251023150541.556368-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251023150541.556368-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: c553a3b3-e4fc-41c0-9918-08de132cde90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjJ2dDVablJHWmg3MWFQYUEybElNbFlrQTN5TWVhNWtJeVQ0YmlUSFpVaHdv?=
 =?utf-8?B?RHhBakh1OFVrU01Mc1pWdkVHNE9FeEdHdVA5MFVPaytxMWppR3laRzZBR1lN?=
 =?utf-8?B?RXZoQ1JIcE4yczc4LzVKMEpHRHMwQkVGN3h2RVZWY2psejlHNmFRYVNseXhC?=
 =?utf-8?B?Q3pEckE1bHRwZkxSbG5NMER6ZTRTak1lMGxqTFIvK0U0ck9EelduZzVPaDFw?=
 =?utf-8?B?SjRiZnFQV0RsTWJCZXd3ZkFTckhIOUVQUU92dUdNeVB3T0ZjNml5WFYwbmdE?=
 =?utf-8?B?RW9ieUg2TTlIN1BBQU1KODJMakI4dTBEaFVwK1FReUwxR1JOUHRtYXhiOTZI?=
 =?utf-8?B?aktWTmVxenlqbk9YdXZFK09mZk82Z3pENE5xSTg5Si8yREpOWUMvT3RpdHZr?=
 =?utf-8?B?WjFLVG55TmJORStkenIxTGpRTGxMRVczZ3RFQzMyMk96aGtoNnVnZzZ0VTVy?=
 =?utf-8?B?QmY0LzZ5bUFRTzJneEdTazBoQm1wL2tQM3NPbXkrL2U3cDJYQWNDbGh2UVBn?=
 =?utf-8?B?ZEdNdXRRZ1Jrb21kR05qbm52a1JyOWVwT2w5Yng3Z3MyQmYwb3dJRzVZeXd0?=
 =?utf-8?B?amNZbVVHN0Jrb0E4UzZDWlhXTVlRaWU0SFAxZEY2UlNCTlYxa1k3dlk0MzRi?=
 =?utf-8?B?WlBGTC9ycEZBR2k4bkFiLzF6bVk0Mjlrak9xM3dNa05KNXZ3U0hkUmh6am1S?=
 =?utf-8?B?MEV3SjY2TnNIZUlZUldxbVRMZFlMZURGK3I3TVhkd1dQUzYyQXlLRFlXQk1s?=
 =?utf-8?B?VlRNL0JzYWtCSW5WcEJkTzllMDJWaENoaUdUR1JWamtsM2F1bksvY1NZVFhw?=
 =?utf-8?B?ZWtTeUZsQzlpYUNwL0pNb2E4VXFPdm9IeWRjL1FzemE3YWMyTjI0czUrTzYx?=
 =?utf-8?B?ZWxOM2pycUJhaVpXaHBNdmFhWGE1clRLNU5KZG5kaGY0OVFyVWxraWFCWk9h?=
 =?utf-8?B?NGN3Y0xUUzZnSU56OG9BVFFyeVJtTnJESU1oQ3o2NkFJN0FTN2t5NE5LTWdF?=
 =?utf-8?B?UGdhV0NRaXFnbTVjZFdTckkvUkFkaHAra2VVNjFtSHJkM201TUEyM241RGpa?=
 =?utf-8?B?bHRwTlk3QlNaZE1QdE5UWmduc0hYR3ZvKy9ld0ZYUHAzbERLSGh1WERmYW1n?=
 =?utf-8?B?Y2dhWXE4TDhVQkVxWmRSbjI3b3c1clQxRHdseDUvZ0lHblpOS3dZdXh6eGpz?=
 =?utf-8?B?bHB6MTFHTUx0RHdOelVyaEh2QW9xZ2s1dlR5bkJZcko3Z2RoYU9Ncm1IZkJ5?=
 =?utf-8?B?Vnl0T2VORGsveFlkczI0dVJEUHRIY0E3NGVXc1RFYXJWSlNKNjg0VndvckNp?=
 =?utf-8?B?RWxWaDEweXpRczlIMm01cUlCQWI0dVZzWE5EK3hCUitMbWhIeWsvN2FLaGVn?=
 =?utf-8?B?MURyVVFiSVVCZ2ZrZGNpM2FhZENqV1JLY2pNdXh0Y3I0K0dHYWNMdGdzOWRo?=
 =?utf-8?B?Q1NJOHltUGlmYTRlYmNvSnhPWXRBZFlFZVFBdEg3MXpwWWhwVExsdnRteHdZ?=
 =?utf-8?B?UFZ0SUxISWpJeW5EVXNYbTRXTEl3c0pwcTdlQnBzOU50eFNBRTJnSVJqclFt?=
 =?utf-8?B?VFcvV3laYm9qOXE4RklsWGczLzFWbDFTSVRwaFlGVWJEU3pEOGkxdnJRdFdh?=
 =?utf-8?B?RzRKRXJJNGxHZ0NjQU1GNjVISDJLVHVWNDR5TlBvUDZKUGY3NlRPSUsvdjVx?=
 =?utf-8?B?ODcrSlFEWGNGL3Vaa1lFMFB3dis2ZG0rd3lqajNIdy9zOEhXZHVrb0JSUUZH?=
 =?utf-8?B?N0xKU0U0TjF0OTRCYUg1QTVlUzdGdWNiZ1FJTG1hdmVLYjVlbjlkN2xYeWY2?=
 =?utf-8?B?ME93ZUlkVUYwZCt6bUF1bXNnaVI5TVNFR25MSER3YTBBNzNKQTlJKzduaHR4?=
 =?utf-8?B?cTdqUFpPdFkyTlNJejlkRG4wZE16NHIreVpmczBJQUk0QjAyMmp4NjhranNu?=
 =?utf-8?B?em1zN3RNdFBUMnhoRHhXVkFvTkdoSVE4MFQ2UEx0K1FPTm1pS3QyZFBMdWVn?=
 =?utf-8?B?M0xidzdaeFVlc1JuU3BlczVOVVBienFINTlSTnFqS0c4T2E3Z2s5R1RIL0oz?=
 =?utf-8?B?SHZaZ3M5Z1ZlMEhHV3lmd1ErVjk3eHJnS0ZZZkpLc2RZd3BaZW5xT2VaNENL?=
 =?utf-8?Q?dZdg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:40:56.5337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c553a3b3-e4fc-41c0-9918-08de132cde90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551

On 2025-10-23 11:05, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The hvm_set_guest_time() is used only inside vpt.c, so make it static.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

