Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2EFB07EC9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045720.1415908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8dy-0004DQ-5h; Wed, 16 Jul 2025 20:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045720.1415908; Wed, 16 Jul 2025 20:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8dy-0004B9-2f; Wed, 16 Jul 2025 20:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1045720;
 Wed, 16 Jul 2025 20:22:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8dw-0004AQ-6Y
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:22:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920e23c4-6282-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:22:19 +0200 (CEST)
Received: from SA0PR11CA0128.namprd11.prod.outlook.com (2603:10b6:806:131::13)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 20:22:15 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::15) by SA0PR11CA0128.outlook.office365.com
 (2603:10b6:806:131::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:22:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:22:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:22:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:22:13 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:22:13 -0500
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
X-Inumbo-ID: 920e23c4-6282-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg2HsCIBSWAvLOGaiF2qWqa0jiDCymHjaME5vOU/G130DKtphSSwPq6FR1hzm+bg9Tez3Hgo9gxVJWAk0W19e6Swte0guC8DQKmBcZFUnm+Gb6qyrMdRhiXd86ebMgzVTdU4G0wbBMaRv0NA9aFnTWfCaoOQDKFsvfLD5QTN7OUQ0eB9H5rcDWqCduMf/CZly4YeYDWIbfAtpTN8B61p2q+DM4ZUfwbm2XT2JZNv8uXgrJbnlsq4z3rsyuVo2GI2kPv+Rc/XdwUJrkrIwpgsUZVXiM2a39OjvfJAT0yAtRmTha+HE6Z6fW8W5L5YUR/aZ29iDOHAaFbub0WpcZErEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnd1Zb/5kD6FeuLGFb6ICasWFc9Z+jY0fMCZMV66V5c=;
 b=Ukdi8yAFfctgOcOtD42V1e+n/Ju/pW3gJ4n3Ln9xQXeryiMyVxh/272aYi5HjlVXIrS5MWG+MLsJBfcw8TVZDgl8bGGWHyNb//6I2B3LXeprlmrrGdpmV0G6nm6MSqOoyLmjFUE+U7mYOGDZxT878nSJ3ddijEwjy2LE0kJ4fbGaXLO7UHLGFwUvZFT73b5fU9xb7ybghgW1/+sNPvp0d4bX4WEtNU7CfoGJLoQLpu2R3jsoj/gX626oBV9OrIbpPFQekl+8/4p+raBiObrQG9NmjdhOJ0A0wXrj3EhJ4tOuDhD7eHFFjonUms0JmImLQGTV8BAwIIPNvY1Ab8uThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnd1Zb/5kD6FeuLGFb6ICasWFc9Z+jY0fMCZMV66V5c=;
 b=ijXSSmd1tc4XVgN5U1fbROit1/bPCFaq1Phv5gSjZr4j0Xt3quYqGWIUcVIj9JyPhqOxHtwAl8Vyf9CeidADByNCzNJcwOi0iwKg4JPo+fsQopJQkwt6H6b7sig5T2UlhN84A4DRsOc6nB3FIQLIx9jZ87j2ai1A/63hOl1oc6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5a151c4c-1ea4-488c-8021-eb8188eee8db@amd.com>
Date: Wed, 16 Jul 2025 16:15:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] libxengnttab: set the cloexec flag on Mini-OS
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e82a9c-4acb-487d-8b4d-08ddc4a673d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmIyaFN2U2RRY2VWYXA1akZ1Y1lRYko2N0VzRVM5TEVrdXVmTng2OVhlYTV3?=
 =?utf-8?B?Y3BrdHp0L2hFK290cTBkY0IvdWRvL3FNalVtNHIxa3hVWWloR3R1dlF6aWJs?=
 =?utf-8?B?bkJnbmhSWXJhcnh6NE5Mck5wZmJtUEtyeExOU1FOVnRMTEd5S01KU1RzR29Q?=
 =?utf-8?B?YTVpZE1YZXRiSzNkNTF3QTBhSDdabWZCYXdEZERoNnhwZkFmWVlGOE1WSWJY?=
 =?utf-8?B?SFRiQUd3dnVMcCthZGNiVk5nbkFRbmdHOTZ0aWhMUlNKUkFLWmN0QXpGRFZV?=
 =?utf-8?B?a09Td0NNbUxxUHYwTVRZTThnTmI1aUdaWEwxdlpTUkVlbHBObjdrNitWNkNu?=
 =?utf-8?B?TnpoNmJWa0ZSdU5VR2JINFdpRFhUbS82N0plNnZrUWZ5dSs2WTV1K1pBTmNB?=
 =?utf-8?B?WnNkTDZvQWlDbjZlNHVwVGtnTDNXcE9VTWFEMHdydTQ4V0YxMlc1R2Y5OEhQ?=
 =?utf-8?B?Zmczd2R2QjR6WlBncmZtWk16VUwrMGxubCt5MmNBTk4xRXQzUWFrZE5mUmRH?=
 =?utf-8?B?UWdZVWx6TkM3ZTlFbnZud0pqNTRVR0Q5VTRYKzllQnUxRkZsWXY0UzQ3TkhD?=
 =?utf-8?B?RDgrQmhqQnpOWEYzVHF5UGVTMWU5TDd2S3M5ZUF6QzZ4cWMyQVVYVEVpSjRw?=
 =?utf-8?B?ckUrZ3p2cm5mVkNVY0g4em83K1YzQThSYTdRdnBGbWtJVkZpUlpHamFrVmkr?=
 =?utf-8?B?Nmk0U3ZkTHBGcUlNcEhjU1JDUjljZXRJaG50SUdhb09wN21QY0RLNHBMaHdF?=
 =?utf-8?B?bi9TNG9acFpGZzVSemZ3TXRYYjhDZmxINVFYWUJiSXQ1aVFlVUZiMTF1TEpv?=
 =?utf-8?B?WGJjTTUvSjB2NUViUmIwOWJxTDUwUEhhTW8vWDhDTEJoYi96MEcwcGR5MDBK?=
 =?utf-8?B?ajI3QjdESGI0T3l6QmhKbWN5QmpJWWFBWHQ5MDM0Y1h6NSszYWFOdENUTXFa?=
 =?utf-8?B?NXBnMkNZT3dZb2FXTUVWZjFGU0dtVTVKQmdQdlJXUmExOFhCVHlhQ0ZHRE0r?=
 =?utf-8?B?aHcrdWRWb0xhSGJ0d29LQUpVWCtjS0I4SDNSTW9KRHZHQ3gvT3QxUWs1RlVY?=
 =?utf-8?B?NUVkSS9uY0NGaW5EaUdoZjVzemlCWm9kOEFBY1g3M3JQbE4vSVJMMXI2a1RP?=
 =?utf-8?B?ZCtOc0Q1NXUrZDFucnVHdmpwcGJ5SmVsT1MzMVhUQWtWK0E0NFEyS2VrZ2wv?=
 =?utf-8?B?dUpCWlp2QlVzNTR4SUd4aEF3SEV1bjMvQktZaXNZT2lzQWVtQVM4dXBuZ3NG?=
 =?utf-8?B?dFk2WFdyZHR1NkxyNm9tL1dTQVNwbjd2SWdoekM4VXlsWXVjc2xJZytwNDZs?=
 =?utf-8?B?VGxZT1lqNUgxbnpXMTJBOGg1Y1dXU3FBYjl0WUQreEkzVi84VURsTzNvOGdP?=
 =?utf-8?B?djdJcVhoTDdqTktaYkdPZHN2UGJrSVYvS0E1UTdDZjNZcXNBZ0xDZENIbURr?=
 =?utf-8?B?b1pDc3VMNXM5T1ZNMEZaWkJiZVFsaFlmU3psbllKQi83WTVMeDRucEtMNGh1?=
 =?utf-8?B?UlN4NVg1Ly9iM2RXK3Roc29FNFJZNU1NeFlJQ2NPdDJ4NDlZV3F1TDNXbXFv?=
 =?utf-8?B?ajF4bjRGUDVhdkovb3BPWXRZUm12Y1dzeXAyWlk0ZTh1NWlGK2tYcFpSSCtD?=
 =?utf-8?B?czFMVGsxK29saUVFZlR0UEJySmVSUGZSUnJYMW9JdzhON3RJZFRvVno3RzZz?=
 =?utf-8?B?dUNTYW5pclAwWDBtSG53M2JjSFdzZmgwNVBvZ1plem9OSHNDNGZYS0E0bzA2?=
 =?utf-8?B?RjlMM1BKRFdVVFNETElreGlBU2h5MG5JN0dEczhqelhyd05udmlnUjBRbjNC?=
 =?utf-8?B?Qk9vTTdpbFVHVFNnam9kY2x4RkliMlExQWFDL1djNkl3MDVmcmNOT3RwQ25C?=
 =?utf-8?B?ZEkwbmFEb21ZbWlxMzFYRWFwNElIN21hWW9rRjBwSndIamI4RE9meGtCL1Zz?=
 =?utf-8?B?LzdOcUVWTm5qblBRcUZpYWJKRUJwK084UHBhcGxoNkEwdUFVeVJSekxHTGc0?=
 =?utf-8?B?UVdpK0dFZ1BOMFlkTkpiWE1HNTBPTGhkRkYvM2lKbUJJL3kvb2REcVVBbTh0?=
 =?utf-8?Q?Q0UYu+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:22:14.2949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e82a9c-4acb-487d-8b4d-08ddc4a673d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268

On 2025-07-02 04:13, Juergen Gross wrote:
> With Mini-OS now supporting the O_CLOEXEC flag for the kexec case,
> set the related cloexec flag in minios.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

