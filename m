Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CDB16D4D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065011.1430352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOTJ-0000N5-Id; Thu, 31 Jul 2025 08:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065011.1430352; Thu, 31 Jul 2025 08:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOTJ-0000L2-FC; Thu, 31 Jul 2025 08:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1065011;
 Thu, 31 Jul 2025 08:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAjF=2M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uhOTH-0000Kw-Ld
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:17:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2417::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6a9675-6de6-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 10:17:01 +0200 (CEST)
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 08:16:57 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::a3) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Thu,
 31 Jul 2025 08:16:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 08:16:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 03:16:56 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 31 Jul 2025 03:16:55 -0500
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
X-Inumbo-ID: bb6a9675-6de6-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tim8POsrX9spqchMmbY3QxK01POofYraStQHM2s29lMX1ik1GlYhZPMhedtk8A1Mk8bE9FtNIfSEVU1Ixaao7ROhUqjSzwzlmsSiK0FPMpIYNCDjbEJiab5fnyanhCBUczS7ckn4pbPcFigs5IdF3B/cTnbVV/fLkHV53R9lwekJc5gztphYBjnlQxXhPnxFT8yoSMRKzjvLCRim7cqAqvlmE0SNj8QePykegLuccSLulP9oZlBnTywMn2+sIlT3MwxIr+aZK1ixJOoq2yLF96JGVzgyjKGdzwIyKNzBvSNVTBHsat+B4xBL6MYSANDghxUbTiL6dmmbALFdaAPGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3ES5jgPU/VtrtfBF0fCDgJ47L62sAA0XKbaGgWp3rI=;
 b=INt8Hix2j+dkai8d3lsztbWZWlhHVL7RmynvoXtpE4cU6RfyNSpNf4zdZskef6tmOGSYQrSI/Wir1bPkc6Gy0EvPliUNZthjqTlL/NdzsvbZFF8sm5qkYqyTOQWT4AxuRrW1T+IKKicNXUeezIJXmcEeZXDveFpUCmyxyVKFHm9Z0spxKAQXo/ed4VsiSrAMP/YehuJ6iFJp8BnGRvlsDrFAiRPwarvrt1Fm336i43RAmkWtUqKRcwvhaTJJv/OWcEmAEgoAglYINuDCnptKUfll1FnQS3yYIzqvfquYVpJ6oAf/PJqbNlFsWU+0LaFkmw2aUDA6vO/Fm0tylmB1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3ES5jgPU/VtrtfBF0fCDgJ47L62sAA0XKbaGgWp3rI=;
 b=O01WXIe2HgyhLvjC6SZUQGUFHEyU4Y0OreEVNYGYQ1ccdLu+RBUeYIY1dTXSwDg1wdFVvF/wXPe961awWR7JMMhzjH4nyKwyDsShbroEfwZE6qBldBjPaaN9IGw0fEbTEtw24zhJsE0sC27QSk74bYiFimuZmHyXNRsjpHHojYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <87bf4b53-025c-4fee-a281-fc3480809c10@amd.com>
Date: Thu, 31 Jul 2025 10:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Fix HAS_PASSTHROUGH selection
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20250731080522.810468-1-michal.orzel@amd.com>
 <20250731080522.810468-2-michal.orzel@amd.com>
 <06d79f28-9710-4def-9a87-1dc478f7902d@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <06d79f28-9710-4def-9a87-1dc478f7902d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fda5449-d7d6-4ad6-80c8-08ddd00a9da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZCRlc4Tm40MTlEcE9oWURpTnJwQXNpanhybktQVHQxanJyN3ZxVGg1aXlq?=
 =?utf-8?B?S0tWYktJZkhidDJCUy9nOEVPN3FMbmNiN2tRUnZXQWllem02UXBvU3RoNmJK?=
 =?utf-8?B?RU1nQlJpVmRaOGJvaTV4NmNkT2xMRTRpaGJ2L0VZOUdHZUgrWC91WFUwYnJo?=
 =?utf-8?B?ckNvZFBHSURnb0kzOWFObkFlQnZXTkFwM1I3dUJ6cmxFMVdTRjNCK3lhd1Vq?=
 =?utf-8?B?RlZRdGxUYk5xLzNpVGRxMzFQOC9hL25FMVhBRlJKaFp3c0kvSTgvRDI3R1VG?=
 =?utf-8?B?WTZtR1Rha3FpQmNnZ2J4U2QzQWRQdXpidU9PRzN3L3FtWnhRSGw4SklZYnpD?=
 =?utf-8?B?S2djWXJZbFJDQTY0Y2Y4MFB0SDRwWlg4L1RORHlrbytEeVZXUUhvbTl3RTRu?=
 =?utf-8?B?UFdqemJLTUVFOEw0STh0QXlkd2VEeVFmaDFQdTZ5c3RjUi9qSTMvLzR3blRS?=
 =?utf-8?B?STl3MktQZ3BxL2ZRYVpYei9pT0lpK2NaN0NOaS9iNXBsdzBNV3dEcjNiZzRs?=
 =?utf-8?B?NXY2Sm96Vm5PMzhqRUJwbDRUeXBJK0pXT05vUzVLNUptbkg0MW1LdUdlVWt3?=
 =?utf-8?B?dmtwZXhhUEdPSHR0aWhlNGpCR2FiV0o3SWxvYllOdmtSM0QzS1k4MXgrWnBN?=
 =?utf-8?B?MmpqY1FDTXRWTzNHR3gyVUc3MGZWelNhaWpSaWhnMUtVai91dHhyaHJOT05y?=
 =?utf-8?B?L3AvRStEYTBTWmVGempuYVc0WmV6WWtrUDRBS2lPdys4T1M5N3N2K01TRnpC?=
 =?utf-8?B?YnpLVUhNK3ZQR0NDYU5tTTEyZHlpV2lYUW1XemRSQUZrRDZrNUNESkdDMkhl?=
 =?utf-8?B?NVo0aVc0Q2lCc0ZzNUpodkV1anhYM1VvNFdGZ1BRcHFYSnpaRGtyK0JQSGhJ?=
 =?utf-8?B?cjE0RFVZMC9BTlBSNE93MUgzbDBnYkpmUFRCOXNNRjFhQXE3bXJROWp2a3pr?=
 =?utf-8?B?UlFCcjl5elR0akZhVk52M1YxNFlkRmZYODhGRndFMFlya2h1dVp0QXI2Y0hZ?=
 =?utf-8?B?SDRmVGRVeEdQS3hUbjRUWUFSaTVTVkZaS0U3aEpoK0dzclBzVWd3bko2NmNY?=
 =?utf-8?B?bDlRdGJnYldaaXkvdHdhRGFFRTdHWFdJa3o0RDUvNjFuRVJvNDlRekFpMjhD?=
 =?utf-8?B?TVZ2eFp1c21McTByLzhkMy9VbEdMUXdaK0FKQWExQnhRU2wzTTRJbmxiZEtl?=
 =?utf-8?B?QUd0dzBoM2pXMVB5TmowZDZHbWt2cElFSXIvT3h3QUdMZ3pSZ040YTV1ankx?=
 =?utf-8?B?Zjl1QkxuLzBneXYyRk9ERy81UkpkVWNYS1FYWkRpQ1FwMDBDZ2tzM0hWWmVY?=
 =?utf-8?B?aHgwTm5wbHJYa3I2azJhbjVtcFNGeFQxTXcvQmtyc2ZvbjVSREI0R3FlNHVT?=
 =?utf-8?B?THRhMnVLbXNHbTNCak1nSkN4RDNweHpvUzAvMStGZ0J2bVJlQ2NRYW1RRTNT?=
 =?utf-8?B?WTlac2xGZXJRc0l1R0w5TXcvVkpNSnlyK1B3ZVpqRHVpSnpTSGFvQzdvMEpk?=
 =?utf-8?B?TlhGd3ZkaE40RUM0SU5TdXR5QS9CajcwaEtJOUZ1WU00b05odSttL1RoVGlT?=
 =?utf-8?B?SDRaNTRUS3NSY21hNmw4UlVHTCsvZ3l5U29IbFdYMkl0K0xLR3RZSUxCQTVi?=
 =?utf-8?B?ekZ3TGs3NHlnMk1tWU9oNWpCcllkNlo1TVRzVXZzZjNiaCtPQ2w3M2kwTEls?=
 =?utf-8?B?SjB4Skw2Z0l4SmJaN1VOSTZZSm53SWt4dDhrWGN5N0VkUWxyTGdzYTA0eXRY?=
 =?utf-8?B?NkVQeXVvbmdNRyt2dmVFNVJXSkFjY0J2ZXNRVFI5anNrdDJSKzZ2OG93V0RG?=
 =?utf-8?B?N2N4OHEybUZGdVRQVDB5ZG1KQWFzdzdWZElDLytJOGhtbVpUNm5vbU14Ukl5?=
 =?utf-8?B?VXg2M2xweTFjZS9OaDB0bkg0bmg1NUwyb2h3WWxxbU9lR29EazhpZmpiQlU2?=
 =?utf-8?B?ejdMWDZFSmQ3Q3FOcHdZR1hucWtqSmZGcDdSVmRBSzByemRvU0dxdHJmTXFV?=
 =?utf-8?B?YmNHcGR2ZTdDYmRNUG5HZUpPY01kUjJ1Tjl1MlVOWEkzdWhjUEtzcG9BMEwy?=
 =?utf-8?Q?TvieZE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 08:16:56.8858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fda5449-d7d6-4ad6-80c8-08ddd00a9da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526



On 31/07/2025 10:13, Jan Beulich wrote:
> On 31.07.2025 10:05, Michal Orzel wrote:
>> HAS_PASSTHROUGH should only be selected on MMU systems. It's been like
>> that until commit 163c6b589879 added possibility to select HAS_PASSTHROUGH
>> if PCI_PASSTHROUGH is enabled on Arm64. This is incorrect as it may result
>> in enabling passthrough/ build on MPU systems. PCI_PASSTHROUGH should
>> depend on HAS_PASSTHROUGH instead.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> May want a Fixes: tag, based on the description?
Fixes: 163c6b589879 ("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option")

~Michal


