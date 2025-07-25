Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFAB11F71
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057873.1425564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIdL-0005bd-67; Fri, 25 Jul 2025 13:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057873.1425564; Fri, 25 Jul 2025 13:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufIdL-0005ZK-3I; Fri, 25 Jul 2025 13:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1057873;
 Fri, 25 Jul 2025 13:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufIdJ-0005ZE-Bn
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:38:45 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2405::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad895ccf-695c-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:38:42 +0200 (CEST)
Received: from DM6PR13CA0011.namprd13.prod.outlook.com (2603:10b6:5:bc::24) by
 MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.39; Fri, 25 Jul 2025 13:38:39 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::b2) by DM6PR13CA0011.outlook.office365.com
 (2603:10b6:5:bc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 13:38:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 13:38:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 08:38:38 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 08:38:38 -0500
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
X-Inumbo-ID: ad895ccf-695c-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/CHtatqE5K0dvep7wHHSM7yDdp9WgUBmoUWRFRiRPwgfSyhChD+9xBgd2wWlFgwstlynTGUOhi+iHSozQ4GP4dHkqpYqwc5/ssz4iBbdRpjWwFywXkE7qOEg8huFhPtKZBuSg1vEGmyX2gXURLBjWOEsVmWwAV5qM9XkJJPBCU1UqfhNCwfvSUaHci59UnwdrS5nUW/n4i5G9IVK4zr0i0Jd6c3q2k0gS6pGiZTTDnbzfcAqsEXWc6epLGMVvxkf8d2+mTPRRWG9RXf/U4t4ACYw9p0Z7nYZII/pjITRloAXOUCzqkGaVYHTi5JmN9fpC7Mntt3YvtYTZxPV7vmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2BbfKojyFSkV8jNgO2SsInAnn2BMki0DrBE9flrsmQ=;
 b=Rqt9R4/HNIA3waB7iJhRdw4goetro/WcVKAleODo7Zl/Ad8OhR/vng3/xz+bNtMiTgb6OBTuo4bE3e2WqB0yDNTEk70lZbqQL/qIf2Jyn1pLtuP+oG0fSzWdsNCui4k/AxeSjxvQYjUESRTCCGfA3gUPzlYsMtIKnPWHGnglmZpCqVrMVXe+vfJ2mnzH5Fxvti8Rv+Uj/jvnuqujv373x7f74wZ69dIZkhPhEYhoQQFYT1sUE75CDMenMGrGexUxkRBJhEa0qFh1c44F5N3e1B1oaGdmLLqsIUUDiO2+Ph4duMhclp8WJ0sqCfHyxlKJAoNqCFtGjZ1Qv75zMpD1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2BbfKojyFSkV8jNgO2SsInAnn2BMki0DrBE9flrsmQ=;
 b=iFGQNPQkCNXR33+luB5kHcwUgE7idnOhNh4iOJNXrSglv/l2shO9R2oJC5+4tB040OJltsaKMnTzRtFQIfkyjRC0xgCO0lbf0FJ2VANrPKkAOavTUPuhIueSr5egCAGchXqjHd+dTJSpqqSqIOnTrJzt85sQAZeVVTUHFw4AKho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <16edfb92-aec0-41c1-afdc-54c77dd31c5f@amd.com>
Date: Fri, 25 Jul 2025 09:38:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] tools/xenstored: add server feature support
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725131928.19286-1-jgross@suse.com>
 <20250725131928.19286-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250725131928.19286-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a8dd6b-814e-4562-97a9-08ddcb80906b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFdLWDJxcDJUWkJoQWRCTDFucEtXaW9XQmlMS0ttUmw1NTlET2R1UUFDRkFI?=
 =?utf-8?B?WkJQaGw4WTdzZG94SHczcHF4NE04aG8xMG9XcHpvdHhNTVN2Z2VQbFU0QUxP?=
 =?utf-8?B?OEEvcWJpOUVOUGprTUgxZlNQWW1DQU8zWjV3RVRMSVJkaFNVSjVSRDB1Y2Fw?=
 =?utf-8?B?bnhwN3dXSDh5UGlJRkFRYkRBR0gxcHpwdFppY3VCc2VDT3I1MXBwRE16L1Zo?=
 =?utf-8?B?M2pLWk9FTTM3UXBsMmUvTklhc3QwMi80WWJOZjBYWkliNkdabGZ2a0V5ckk3?=
 =?utf-8?B?dU5mWkUrVmpLQnRidUhZaElPM3BkYnIvVW91TkkyMDVZUTFrZDJ3QnBKaStY?=
 =?utf-8?B?eFVpTUhZWDJHcmVUMUgxRnAvSXVoUk1Eajd0Si9oeVFGZEJ0TnNSMGNXalc0?=
 =?utf-8?B?MEY5cWJZWG9SNjRKZG5HLzJEK2hZa1FBQ3BEZ1ppYUIzQWZIZndFT3lXNHVl?=
 =?utf-8?B?eUdqeWtXd0ZaQkpnTFF1OE1pRnpXb2Q2QXlodnluckFUQzFHcGthMEFobDcx?=
 =?utf-8?B?MmUvdXVqR1lnWm1TK3ZNSUVsa3R3VmJ3aDJhbXNLd1JRVFlFc0FBajVJZ2Ja?=
 =?utf-8?B?MUU4OE5jWWZ2OSt1U1JhY2F1Q3FQQm5hSW5IMTdpQ0hRdFNjOUxPQ1B4cmFq?=
 =?utf-8?B?dFZqZHJ1T0c5Q0VzT0Zwc04wdmlTSkc5MEZpN3dDVXlKd2dDTW9FMjNhVkph?=
 =?utf-8?B?Snk3azR3bU04NWNXZGVObGxLWU4rQU50RVFaMTJRZEtjUDRDbXoxZ2RmSEkw?=
 =?utf-8?B?RFdPQ1RJM1hhVkRPQ3ZPY2ttcHpRTHI0K0JNV2lNYko1RVBuaGF3dVE2SmVJ?=
 =?utf-8?B?NDlTcExqNUhua2oyeDJrd3pMUmRQaU9Vc1ZjUEt4TlZONHFHeUM4TXEzVStT?=
 =?utf-8?B?NzljZjRGUVJTSHBjWER6cTcvWFhkdTB4SDllcW5lc1gybE54cjBXOEl1SW9P?=
 =?utf-8?B?ODBnbUdLRWUyTUNiN2FGeTNFRzc0QnZxOXJpdnRkMG5yNW5RTlhLaTdTSnZS?=
 =?utf-8?B?eVpYeHRVaTJmOFd5QTNCaW5rdmtMYU1razFNS2RXWTllMlR3MkYwbm1oOVRp?=
 =?utf-8?B?S3hpZmRDT0FrUElXbDlzdU9NWE5udldxMWpuQkpyUHBEaWZ6TW9RQmkwc0Yv?=
 =?utf-8?B?UmJGRmRJQysvUmdrNnR1TndMVENpQTNrM1ZxRm1rZzN2OTVOU2haZDhKNnpj?=
 =?utf-8?B?WVFGRVpmYXFacnpVMTZqM24yRy9UQXg1R3Z0bEhXYjJrK3loYlZaMzNvVUlZ?=
 =?utf-8?B?eEdNa2Q4TkNxSTE0ZlBucTFLVFhRbE1qSkJ2bXlHWk9qMXBjK1drTkNiS2ZD?=
 =?utf-8?B?R1lJZkoweDBVejBXUzdpZTFWbDZYR2tSYW1MQWFTMDR5dGQxZG10Wm4zQnBo?=
 =?utf-8?B?cDJxb1dKeGp4bVY4QXpRaFRJbHdvbWorNmp1R05IV3EvdTYrN05TODlDSkIw?=
 =?utf-8?B?UkdPdktyYmc3TDd2bHB5cWxUVU1JYWQxYUdEZEdEeklGVTNXVnJ3RG5aM0ZS?=
 =?utf-8?B?UXRWWmlaRm1pYW9RTUtZRi9pY2VORDZDa0E5dFBaSUZXSG5HdXBzUWRpMmsr?=
 =?utf-8?B?QmxZdmh2SGZlcjQ1SnU3YkxYVjhDRFZ4eVZROEV1UXBQTEZ2RDRjMlBzYlJP?=
 =?utf-8?B?ejlOQ1JUUmc5eXRLMVlaRzhGSGh2d2c3V1UyTktna253SWlZbFRMYlFFdURn?=
 =?utf-8?B?VzlhTjNMTWI1S3pvWkFWVS90Z2lwQlFyOEFTRFZDVUd0Vm5HcHpjM1A2TmZu?=
 =?utf-8?B?OEZwSmcrZExJUDFMNTA2S0RXOXczQ3dES1N6N3JtTWd4SEtGQmZXTmZpN0Fo?=
 =?utf-8?B?YXB6ME9VMzBsa2k3d2ZrYXdMYTY0dXlSMUFHUlU5UVBkZDJOZ0ZreWlVWHVK?=
 =?utf-8?B?cHFFTFl0MXBJV2M4VWNNMEZQK0ZrSE8rejdlZzAxQmhNeVB5WURMVDJWbXBk?=
 =?utf-8?B?WDh0VldraExkTElGM2lmMzE0MS80d3lWQnhCV3BacDRTa0g5Z0EwY2tYMHFT?=
 =?utf-8?B?YzBUUHowWUhrSHdmYzJoM0taQ2o3eCt4OTNiai9oa25lWTNFaUgyVWVxNUFt?=
 =?utf-8?Q?eJ1dzc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:38:39.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a8dd6b-814e-4562-97a9-08ddcb80906b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543

On 2025-07-25 09:19, Juergen Gross wrote:
> Add per domain server features, which are initialized by the supported
> features at domain introduction, or by live update from the migration
> stream. This requires to add the DOMAIN_DATA record to the migration
> stream, but for now it will only contain the feature word.
> 
> Advertise the Xenstore features to guests by setting the appropriate
> bits in the ring page.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

