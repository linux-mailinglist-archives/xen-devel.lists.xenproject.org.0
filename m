Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C86CA345B
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 11:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177526.1501785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6pU-0006iA-Ct; Thu, 04 Dec 2025 10:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177526.1501785; Thu, 04 Dec 2025 10:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6pU-0006fQ-A5; Thu, 04 Dec 2025 10:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1177526;
 Thu, 04 Dec 2025 10:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vR6pT-0006fK-3r
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 10:44:55 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43255239-d0fe-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 11:44:52 +0100 (CET)
Received: from MN2PR19CA0038.namprd19.prod.outlook.com (2603:10b6:208:19b::15)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 10:44:44 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:19b:cafe::e8) by MN2PR19CA0038.outlook.office365.com
 (2603:10b6:208:19b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 10:44:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 10:44:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 04:44:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 02:44:43 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 02:44:40 -0800
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
X-Inumbo-ID: 43255239-d0fe-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUNzdIcrBWBZb06QVp3CzjOkLxvD9Z2qKS9hNZE6EqxMVSWrdIbES1o4YVj5+WOj/KNryogDxXx9XZ4uuGb9JpLv69YyFA4E489aV/Q2+3VvmeI7T+OFYck9W37eTMC3yaVJVwMPsvnpzINVA2HWB0YvDR4rG7jpYxqtOilYXO0/ecscP5mq39/AfOfuYviBYWUTZauZhkH/Gz3Q+x/7qKqm3tTCzf3lrb8jbicWUWuZQUOBmxygJivNw9rF1o714WWpp91XZuFxfeoon6s/BXLtX4ZDLTCE9/7YtU08oq7a17PxtPAznz5CPn62oNtDa/bQxF/F6Jw2KxlgH+ZfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAmSWHtRSeRRoWGuiFgmMtNkI/N0W1RABCIEAbTWxec=;
 b=Gl0vpTh597METBS0826u64rpbnMLFaWtQxZ0D4GRoZM/VZkfEBc2WyGDNzLsAo5CC2IQgmTctpO/pZ9HMyY6Ovc6o/HGqYOmF1rDKjA3pByl3mhP/CnTSATEEdO32hggOX8uqLF5MY3bJRyf688yxsT1XvpHm988ABEaWYazG4epahKmqZMvO1ow6EyVKEvPlfeMeqs+1e+hZkmpqAzQOm2FjkhNVzZQajco5lgaQ+3NF75xFZkrgjaX12vyVUnPBGSxTTdH3x8epVcXHaNsvbrYP2Pz2tZTZ96cZC3n451+/HUrA4Nbq9SF3u5HFgp2/w+p5J6wGJdHzNHtUUb2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAmSWHtRSeRRoWGuiFgmMtNkI/N0W1RABCIEAbTWxec=;
 b=M3tsCywiCmyb92MZGHFBZNfr+iWyVgYf/ZKArffwTv2NX6WwJ1M+oC5FGyvzkcFYVvCeoITdTb6NoUJoauGt6rwVcWx578zbwZljkNNfqIxFo+NzRZSEs3+PdyoayP90X4MrPMA5cbfNsClZo+DrTMOu9Af/XYE/yqyQJMLZxFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <30094c9c-3222-4347-9c83-059aa43f385d@amd.com>
Date: Thu, 4 Dec 2025 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm/mpu: Implement copy_from_paddr for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e69d79d-a5ad-42da-984e-08de332222e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm0rSnpsWFR6a2pObCtJZzl4cVdESjkyQXBZMkZidWlYQXJJdFNiNHIzNW40?=
 =?utf-8?B?dkRNMkFtT21tUjQ5dWMwazBCNVRIUmZ3NFJ6VnpqNlhBT2tIMERmSTVxQ3JB?=
 =?utf-8?B?QXhoM04waXkvc3ByVGlHNmg1Q0k3dDdLNnhwSXZ4SHdMMEpPZ3V2QXlCZm5I?=
 =?utf-8?B?SlZiaGxLUGZMT3pDcEhUSDVRQ0ZzQlJPTEkra0x2RnNtR05yemtSUHdGVXFw?=
 =?utf-8?B?bXlVMGZOcmVFbGY0dTYvMUVpcDlMcmQzUzRFK04ramRZdDdBalV4VjBad3Uw?=
 =?utf-8?B?TldzWGl0eDNONUNKSStxQjhqU1loWTNaNjJDM0lVc01oWFBROEwxa0p2eGs4?=
 =?utf-8?B?Znk2cTU5eW5jV3g1MWNVZFJXZ2NhVEQ1YTFlaGlPRHd5Q2xqS0crRzVncFh3?=
 =?utf-8?B?OFlBU00zazBKNEdtbUJGZFM4NEpoRGtPS0o1ZEE5dFNlbEdOM041bW5XT0dr?=
 =?utf-8?B?Wk11QU1SbElaWE5pYVBGMlIwRlRGR3pQZ20xclFDb2RLQXFsRVJ3M2ZBWDkv?=
 =?utf-8?B?ZUhzWEthT3NJK1Y5ejFJMDhhYXlUejBLdHV4VzV5RDJXRVNPanpsamFENkNo?=
 =?utf-8?B?NnBKNXgzNHN1RGEyZUhZSDdNeU82YmFUQ0F1N0h5blAveWpSWVFYb2M4bElK?=
 =?utf-8?B?QXUxa3JuaFlPNmwwSzZxWEhidGdmamdidXZwV1VwVjJZWkpXelVDRVBJaGsr?=
 =?utf-8?B?aWxpczBWOXZBMkVDSWxVZjFlOHA4cXlQNWY5SDJpRXZEN3B0STFOWFNGL0FE?=
 =?utf-8?B?V3kxbUNCUzJzcEdLYmFkQ2tkNktuZlpna2psY2I3Nms1Lys0WU5yRTBkMUhq?=
 =?utf-8?B?OUVVWFhRMllRVnV3azI5Vnhob1pnTW9MRm85K0Yyb2hvc0pnZUtVc3BjbGRS?=
 =?utf-8?B?Y09ySVVTOG5BMFNkbnQ0VitBMzhpNWs2dmpROStobUM0Si9sL3JHanc0bFpx?=
 =?utf-8?B?TFBOTHpjd01pd09DbVFnbHNnNCsvWHltMVlhem9lMjNRcm5CN3NtRDJ1R0Rm?=
 =?utf-8?B?QXIzTFZUUG5aTHdDSzB3d2NDTEwvczM4QXdGQ3NPTjRhSFFVb05IOEdIemJM?=
 =?utf-8?B?N0NTZGJKak9ON05kR1hsVjJlb0lxMmY1a2JodXdpYXBuam9VNURnN3k5SmF4?=
 =?utf-8?B?MzVkdUpZd1JiNHcvNHpXWmhCS283MGNZUEpLMmF2T3pNS2FQYjJRN21ncENZ?=
 =?utf-8?B?SjJCMXFSR0xZZFhKenNXeDJtSWFuNExtUVhEM3c4MEFINmJ4RUFCWGVIOUxB?=
 =?utf-8?B?RGJOY21zOFpvMEZNRTA3emRwckFISHBJbzlKR3BKUkp0UGRlMEpibnlTZ2Z2?=
 =?utf-8?B?dEJPWktTZ0hNZFhlU0hzM1FWaWp4QmdrWFVUU2QwejZWNFI4SXg2M3R1OXpj?=
 =?utf-8?B?aFQvcnliVExUUUJUbCsrdEsyRm5mTFFoQmZPYTRiQnh5RGhlTm5XOFlCYXcv?=
 =?utf-8?B?VytNOW1jdUN6QTdZUkNGQWs5czFTa1cxSjlBRTdNcU0rWXVOTGRGemM5NGpL?=
 =?utf-8?B?bSsyZTY2TzNuWlRWanRsVFdPODlZdHRYZE8rNHBiZGpaWXlybE8rcDJhckty?=
 =?utf-8?B?ck1WZjBSODdLY2E0YWZKa2dTK01LTThCNVRBblFzbkFDYWNpVnJqRVhLaEdq?=
 =?utf-8?B?b3hmNGhvRVQ0bmx2NzRtR0pnZUR2SkF1aXBZOGpOWHN2cVRXemlBbXBmZTZY?=
 =?utf-8?B?YURtemZ5K0ZiU0g3V1VvQ1FvYkxFWXR4R0xteExxRkxnQlVEMXZqUEVhVThR?=
 =?utf-8?B?WS9nczQvV3k4RDFFYTdnZ2d2TUpVZnllNmtTaWZFci9ublM2YThRUHYrMkJ0?=
 =?utf-8?B?a0M0UHRKeHNoOU5ZU1BFZkZZR2N0WUs1OVE1b2VoQzM0Ullnako1aHcwOUdB?=
 =?utf-8?B?czlxVmYyRHhLTGh4SU52MmdWUEFLcC9QcjFuK0ZLb1FXTWhiK2tESGxkeUIx?=
 =?utf-8?B?T2FmOXpWWFhra3YxUlRDTnlmZTZjdmIzNkppbGtDK0pTUUFIbzR4eW9HU0dW?=
 =?utf-8?B?TEVzWGJ4MEJpL2JKOHJTMHQ0Z3ZCeDJNdE1hSnFWeFZHVWd6QW5ESGRLZTU1?=
 =?utf-8?B?aEhCc0RRVjZLZUlrSkVhbUxFaFRBVVhiSi93WDlhZWptZElDbmQ2OWNrMlla?=
 =?utf-8?Q?0HNU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 10:44:43.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e69d79d-a5ad-42da-984e-08de332222e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the function copy_from_paddr variant for MPU systems, using
> the map_pages_to_xen/destroy_xen_mappings to temporarily map the memory
> range to be copied.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


