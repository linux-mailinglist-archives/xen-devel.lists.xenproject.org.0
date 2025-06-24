Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00774AE712F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 23:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024102.1400141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAli-000423-5x; Tue, 24 Jun 2025 21:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024102.1400141; Tue, 24 Jun 2025 21:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAli-0003zw-2i; Tue, 24 Jun 2025 21:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1024102;
 Tue, 24 Jun 2025 21:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnmP=ZH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUAlg-0003zm-BQ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 21:01:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2418::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6191eef7-513e-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 23:01:22 +0200 (CEST)
Received: from CH0PR03CA0077.namprd03.prod.outlook.com (2603:10b6:610:cc::22)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 21:01:17 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::71) by CH0PR03CA0077.outlook.office365.com
 (2603:10b6:610:cc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 21:01:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 21:01:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 16:01:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 16:01:16 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 16:01:15 -0500
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
X-Inumbo-ID: 6191eef7-513e-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMggrWFMB/6yZ54zXbfVAP4EbVE9bFMK7P6dNtWuOT2Fp11hcA7uesmSO1pBWv1Ap3LrX7plCwizTd+IBZYdE4CAE3r1kNG+VTynL9fcnM3mchVSJr4KAHbGUwJO7VVkozuq9egqOdmBeD63e2PRLNKAZ6ICmtR/QGbFOlSCwVievIZ6UzmQ9n3qHM3yX21HxVnXQTddqK1MKhYYC3+WAbWanB+niTv52Q38tq7hFVHgJ4XKD2uATATzEAakFbfyfEarpMXRbBQNNZkFHlZLVui7FQ/dPe+9XhrfMcQ2uAM6WpbnxQZ+xSABnkTeSiJW3xpnbuxJJ/XZi0nsFhikKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO8bfoNMbPfdf3VI464ZG31w3hQoectP0oDqSm6OO2I=;
 b=B+C2G4pzZz5cd/mf4nXYPC3HFKmX8XxxZTFRlGjsq4eZJxsObHbTFLhDjdlZS1pizju8KY9fkIbdk6+8dP0ffdmzzZkuFDymtCth0O6Z8nzPGO6IPUNnMP+YQSrnmg1uBXE2L6w2tCSBxSEjbrh7feb1sh0lt4/rcnm/vZyCgNTCGktHfNUCs39BOZ7YdB1iLqVyqsr0PEnr2P551ujXoU/RWr9KNmzTVa729+4sGCt3IiOLTLbNel6Lsfefdc8h+1mIMxYb+9pXGfQSFBixjyJuibYG7RRAcMXsnB2e02toJcGj3DYyhv0RG9vfEYblnxv+J30R8reIHHaA0NM6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO8bfoNMbPfdf3VI464ZG31w3hQoectP0oDqSm6OO2I=;
 b=47z4I58ipGiUT3g7yVkYvSMXHK7xwu5awiSekaDK994AhWF2ATkWPOMcfps6fly8hmkaWMRyIQZ0Pto9UbzipKa6IumgE3/6W87IdQGSN/UtgYcJ1eH+paHxASnZen6pKcvoA/9It7U5eSmRRPTyACxLmXV5J7n7GUftwYGv7Ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cfb109b1-9ddb-4943-83d1-0b5c542d6964@amd.com>
Date: Tue, 24 Jun 2025 17:01:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] x86: introduce "hot" and "cold" page clearing
 functions
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <da50f208-74a4-41dc-ad6a-978c42e6b28b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <da50f208-74a4-41dc-ad6a-978c42e6b28b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e208b29-a9a7-438f-3d76-08ddb36242e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmVQbHFyelBnTWtHdGJaajVWbjFaU094aFQyY0ppQ25rZm9GZzhDN1VPaWRF?=
 =?utf-8?B?ZkVBY1V3Snp2ZmJxMno0SG51akN4aE9tMkZaVHd3WFpKTHpXRGp1QmtMb2xm?=
 =?utf-8?B?bDBCVStwMERpTDAvdHMzdEM5MGNVM2dxQjR1OFAzY2Zmb0ZlSk9KZXVDTWt1?=
 =?utf-8?B?dGhQeTBmOG5SYVRheENJM0FhRlFFbFZDRmVqb0dLWHlFVjQxcU9uN2JiODg3?=
 =?utf-8?B?alVQTEY3UUQvVnNQcGNXTXFNaHRWT0VKTjFDdUZIZTBadTVER0NidU1xa2pY?=
 =?utf-8?B?QkdLQkJSSUZLZXR1eGhaemFTQ0hzU1RJYVlXeTc3aERUWGt1N1NtQmZTOUJD?=
 =?utf-8?B?eTRrMElDajVuWTRyalBmZWRkeFFXeHZLdmFjUmVEYktoRkEyQzFRc3pqY0NB?=
 =?utf-8?B?QjBqQkFYbVFHNXhyVy91cnovbUVWSHN1ZlNPQTgrNHlZc0FDRmYvWWpTaXRX?=
 =?utf-8?B?QTB1dmpQbHdsejB2M0lCakdQeVh1S0NyOWltc01nZTFXRHJMSENCbCtMTXBC?=
 =?utf-8?B?U0JLMzg0R3R0RXB6YU1JSFZscllXb3I0cU1qTzVPQjdZdDV2VlFTelA0V0lI?=
 =?utf-8?B?NUdGK0puUkgzTGNDZnhWMkR0L0tIRHJBblFvZmJUZjJ1TEVXMmZiQlpDanBM?=
 =?utf-8?B?WXUrc0FEWkF6ZW5xcDNVd3ZQNHRsa3lndnVuSGhKYnhKL3JDeVUyckF4Q29P?=
 =?utf-8?B?K0pCalpnWU5hM0ZPaUF1cHIrSSs1S3M0K0hNUExxL3crelBkZXZGR1hRdjVK?=
 =?utf-8?B?bUVzbWRlb0k4OStkdVBEMUxqYW9ZR2RVeUNPWjFwTUxFOUtrVEZZTFV1ZDBq?=
 =?utf-8?B?KzhyS1pveXdMWStoNXM0ckZicDUxWmllQTV0OFlGbW1Rb1dvcnVJWGFQSFdV?=
 =?utf-8?B?U3kzUjFxSGlZMkJlOFY3NWNTU3FkeEkyVlZMaEdnVk5hNThRQnNFeU90WVQ2?=
 =?utf-8?B?c1dMUVI5R3Z5VmJ5bThwRkNSVmIwR1N5amx2WTJKa1JNRUZmTERQb1F6TzBz?=
 =?utf-8?B?ZlRoRC9hOTg1SnlRNkk2c0VvSzJ4VG5jdFROUHNTb2Vkb29veTkwMVBJcUVC?=
 =?utf-8?B?TnF0MkFPc1JZQWhOYUJHM25mTmFlZ2Q2UmdYeWJWUmMra2ZRKzFObHZqOGRH?=
 =?utf-8?B?dWVxM29pRDJVM2Ztcm1mQXluTExRUEg2MUJidXFlYm9mVVNMcDEzdXk1ZkV0?=
 =?utf-8?B?Sm80czErTS9HdTVidjR4TFpGSW1GZENIRG02NHkyYzJTN0V4VlRDT3ppZUVv?=
 =?utf-8?B?TlhWQ3lNbWU1K0t0TExjVlNNY08yU3BkU1YxVytXZXpkM2FkcG94YlRTUEVY?=
 =?utf-8?B?OHBBVWNkN0dxeHFHU2QwamtLZkRZSWlzWUxXWWlYaW1hTE1NOFNva0V5R1dy?=
 =?utf-8?B?a1Ywb2I4d1NBV2JYL0Qyb0dWZzhoZ1RoaWlpb1IyU0tiZ3plQ3cxVXJQeHY3?=
 =?utf-8?B?VGlOSHB6Y08rQktaL1NyQlRuMk9mcHFCTVpHS1oxVFoyaXlKTlBBRHpKbVo3?=
 =?utf-8?B?b0liM0JPTmdSbDI0cjJjRys3d0ZBL1F2Qm9qbGExeG0xekh5K1M5VTlGZWdN?=
 =?utf-8?B?c3FFZldIU2Y4OHlRNlZsSnl0UUdZWFhXRk10SzZqT00wYzRWbmFCTDlMenA4?=
 =?utf-8?B?WXNCRk1UU1lMZUcxYkFFc3JZbTZZU21SVTZ2dHNGNC80bVlUV1psZjVnb2lU?=
 =?utf-8?B?QktGZnhNN1VSb3lKSGMxSkFYcEJxeCt0OU16bXg2RHBUS1BkUU1YaHIxMGMy?=
 =?utf-8?B?ZXBzZkluYUJySHpwL3V1MUYzanlXL3ZPWkNob3lucUZkdXY4eWl3MkFpb1E1?=
 =?utf-8?B?eUZyV0E1NmI0UXlkV2pkN0c4SW5mcmYxQlJlTDRzUFFoWXJOUkJWWE5id2p4?=
 =?utf-8?B?Q1pHVzlHY2RKM2tYUWZvNmxFZko5S3VzQXRHb2pBNldiLzZCMXVRVmFNcjZR?=
 =?utf-8?B?bHRsTFFMK0o5dkVSVzMvdnlwcjVhaGF3ZGNHTVlDZXVpVlJhNjhiOElIazFy?=
 =?utf-8?B?b0RjdHY3bjZQQlRaZDFrUjYxWmR2UW0ra2Vqd0VPVnIwOVBSeFIyYTFJc2xq?=
 =?utf-8?Q?tM5jnu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:01:16.6350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e208b29-a9a7-438f-3d76-08ddb36242e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928

On 2025-06-16 09:01, Jan Beulich wrote:
> The present clear_page_sse2() is useful in case a page isn't going to
> get touched again soon, or if we want to limit churn on the caches.
> Amend it by alternatively using CLZERO, which has been found to be quite
> a bit faster on Zen2 hardware at least. Note that to use CLZERO, we need
> to know the cache line size, and hence a feature dependency on CLFLUSH
> gets introduced.
> 
> For cases where latency is the most important aspect, or when it is
> expected that sufficiently large parts of a page will get accessed again
> soon after the clearing, introduce a "hot" alternative. Again use
> alternatives patching to select between a "legacy" and an ERMS variant.
> 
> Don't switch any callers just yet - this will be the subject of
> subsequent changes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

