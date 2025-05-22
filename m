Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A7AC1030
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994309.1377370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI863-00011C-DS; Thu, 22 May 2025 15:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994309.1377370; Thu, 22 May 2025 15:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI863-0000zY-99; Thu, 22 May 2025 15:44:39 +0000
Received: by outflank-mailman (input) for mailman id 994309;
 Thu, 22 May 2025 15:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wx/D=YG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uI862-0000b3-8q
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:44:38 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:240a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8c96a08-3723-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:44:36 +0200 (CEST)
Received: from SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::12)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 15:44:31 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::39) by SJ0P220CA0005.outlook.office365.com
 (2603:10b6:a03:41b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 15:44:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 15:44:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 10:44:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 10:44:28 -0500
Received: from [172.26.39.227] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 May 2025 10:44:27 -0500
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
X-Inumbo-ID: a8c96a08-3723-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oI5G+pclb17yxaM7baF4BXrqsKu8kG54J+GaR8NnGWw4wVggHDmWVyuH2avKv1NMN9F9XbE5TJPOewhKztskCuuNemnSiNEe1BIE4xMjJHVQAQioYdl+juxeKrHj+aXOL3zOi1BQVkHUtVqpDBrpvTkJl1HjwpHTo9/EjjmV7ViUE7s54VCFYRZ4XC3KFyblGgSudcEITilhmQUh4aIgUaBOT34e/0UDhLiaKFAG3utLbddRnw/2Zxh1bNqIZUJL9dpOlUHrD9oppj9uWvu0MS2LbaQJm/D8Xat2HtEVpteSo3Z9xd/DJWQxQoiI31wKuy4DE4FLISTbOS7JhM0A5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHwft3HEcPANxL9VLsIeuPPFsrYsAWz/qnq5FcH6Eko=;
 b=RnXONPhKj3EaEA1DTn/ToQrN82dr4UrU10BP80mgdz+seI0sx2tCBEk22Bg+da8/mJXaehwanUIMoPZu/SjCm9mHQKsLE/S5MZgk3TVuyeC5LmQen6EDPk8kVyD8LN3srRJKbSz0XLM1xSD+vBCp4GeCkXLk3aBppDvJndd7zLwuODZFIMz6zg78S1Q4tAPvTDMaZkHsme1DTgM5083ZO/CaZQmm8TAxjoZrQs6M+Ig/6Xj84oVy4GLRCE7sqMLbtXUW+n4Yg+GXtSukHLRAaQ2VOSwRHl2hJFofIzSu4hi75l+ThoPAvgpsLAyGGeWm56sqIPmrUaWTpd/he7RwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHwft3HEcPANxL9VLsIeuPPFsrYsAWz/qnq5FcH6Eko=;
 b=mcjkgi4Sv6tV/xFO54SpRflqq0dCgHW7XA+tErMwwUKkTW4TAsDxsMOQY7tZkYmogRwTVlTDWnYF/Zur4VcHu8/TTDbG1lgcXb6KtHazE30jg1gIthkkqmuN55rfTK23W7m8uw/Ad7vvJeePfnJ3yn/XYOH8SZYbaM4kUhH9Rug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <aa1105d7-758d-416e-84e7-c7492f4bd177@amd.com>
Date: Thu, 22 May 2025 11:44:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
 <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: df10256d-ac82-49f2-fc1b-08dd99478a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzBsOVV0RXRLcEtSR1ZmSGMzRjkxOEREL1plUHpsZXhMUDBYSXM1ZWVtL1di?=
 =?utf-8?B?T2V1OStFeW01SzNtdlhDRnRvUW0vMHRiSGp4VmZzenJmdkxVU3h4TVFCUDlr?=
 =?utf-8?B?OVNUUXp3Tzh6eHR1S0pWUTZxMDhvZUhpbWlYT0xGMU5kOGJsUVh0VU5zRUg1?=
 =?utf-8?B?NjJINStjeEpyakVsL0F2MlAranlGWTNYRFpkeCtwWHVpSTFGZzRFekdQUW56?=
 =?utf-8?B?NDRIK0QzcSszQ0svV1VoQzZTS0ROMytZUE1uUCtRbUJ4a2hlNFMzMkdTbnUz?=
 =?utf-8?B?SGxSbHNBbEg5OTJ6MHh4d3ZKeFo4N1pkeE9SL25rSUw2QmhQQ2ZmQWlseVln?=
 =?utf-8?B?eERlQlpyZTVHT2ZzZU1VUG55L0hyTktiMlJlMWNnTTFrWFpKN3ZhTXRiM2RH?=
 =?utf-8?B?U2tQOEY2cEg0M240OGRTUG9kRzQzRTVGTGkwc0pZMHcrN0w1b2JYRzYySG9M?=
 =?utf-8?B?MUw5TFJIangyMjh6aGpYaGhOQ2x4czN1SnNCeWQ4U21Ja2N4V3pkSm9BSnQ5?=
 =?utf-8?B?RjNUNEw3ZllFS28renlsK1FKUE1VWXo1T1Z6MGhRWEw4N2F4V2NVdGlvWFVv?=
 =?utf-8?B?VzgzN0llTEtscytsWlBXZ1lPU0xldFBIYlVEWVFRWDAySm1ZcDlHVnN1M3pj?=
 =?utf-8?B?eVNlVUdSSnZMQ256cUpZVU5FTXVnTUV4VGYwZmpid2hqVHN6Z0VMYUVUM2VR?=
 =?utf-8?B?T2pxR1J3akNZQTlLcUxvS25jUWRBSlc4eHR1Q3hHN1MxUlY4MVV1VVpra1Fv?=
 =?utf-8?B?R1g3WHNZemNUQlhRVmRENVY5STJJMzM0bmxoK09LK3F6OVJTL3RQWEIxeEFI?=
 =?utf-8?B?RU1XU3lySGRvSzNxZ3ZPUHZlQXZjU2szV2VueWRiVlozaCttRnVRa1VXeE9p?=
 =?utf-8?B?dm9LU2JZR3puSHRuc0lNVC9ndVJqYnU4OTlvYlRaM2NoeVp6c25uakp6M0xr?=
 =?utf-8?B?MXRta1M5S3p5Z0plZnV2KzJOclBqRDZqOFpaSUROaEpSSlhyaE1NNVJzdVhV?=
 =?utf-8?B?SGVYQmxoU3h1UFpDZjRCUUdIZnh4S3VHN2JRa3V3elBHYlRHY3Jxd25CVFV4?=
 =?utf-8?B?MmpobEtuZ0YrWk5XdERLVVZyMHA3MUYxWk1hVkJLRXpEOFg5di8yUUxMbGtx?=
 =?utf-8?B?cWdkSk94U0xHdk5neVdiMWhjUHV4cE4xNkR3dXhJcnZBTy9RMGo0QW52djc0?=
 =?utf-8?B?Wm1zK2VpbUZhemUrUisyMVRDS0FMSXJzM29oT0lacUR5aGl4anp2V3d1Qmhj?=
 =?utf-8?B?VWwzTWhOZlVxM2J2bVZYSkp3eTB4WllFMC9ncnQxZzJtTDhvejFYczVsZ0c4?=
 =?utf-8?B?emtiL2VZb3pGbFMzT0p0UjB1SG1JcjBGZjRCWkJ3cENDMVc0WnZHQlZzbC9J?=
 =?utf-8?B?bXFQaExZMGwrZFZBUWlqdm9HWmU2OVV4eVMzMFpjKzVPTEh4YTlHUm1Nd1c1?=
 =?utf-8?B?eEpaQ3Q3L0dQWExNbkxRMVdxS2tTMmttb0pScW5RS3Avb1pqMjJqcVZTdlBx?=
 =?utf-8?B?V0x1YlFmbVJVU3NWQyt6UWZycjlta3Jta3U4dzhjUjFFRzdMMnV6dnVjRHZJ?=
 =?utf-8?B?S0J6TEY0USs0MjErTWRnNEU5bFBkb3VpU1FJTW4vd2VBcGRxeWpkRWQwVmQ4?=
 =?utf-8?B?a2FxYy8zRDlRSFB5eEVHTVM3Rmd2Z1JVWTQyN2VXT3h6eHRVQ004QkpXcjFL?=
 =?utf-8?B?ZWEwdHV1THR2bVZEOFdGQ2MxOG5MZHo4V2xGU1FwRVRJdUpRZUI4OFdic0VV?=
 =?utf-8?B?SERhZjUxVUs5U05FQ2hBQmZPU3JnUjFrYU12L05YTzJLKzhnam1hc1JvUXJy?=
 =?utf-8?B?L2J5aG1VNWc1N052SUVRU2lJbWpta1hYamNZR0VreXRKUW1la2ZNL3FSSjBW?=
 =?utf-8?B?aWp6VGtvV0o5ekdqSnRMcFdkUms2UlRaUW5vSkk0ZDZSTWVJZy9GbTN5TGlH?=
 =?utf-8?B?dHNsY0hramwvMzlkYUtqNDF0K2xLWWxCalF6cWNaZ0xTMjJkMllERHBMRU5H?=
 =?utf-8?B?QThZckMwZ1VmbWtzSjdwSHd5cWpLQm54UFc5K3dJVU5ENHhpSXFhRllIc3V2?=
 =?utf-8?Q?4tok99?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:44:29.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df10256d-ac82-49f2-fc1b-08dd99478a3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335

On 5/22/25 10:59, Jan Beulich wrote:
> On 22.05.2025 16:03, Roger Pau Monne wrote:
>> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
>> index 26bb7f6a3c3a..39fd5a16a4aa 100644
>> --- a/xen/arch/x86/pci.c
>> +++ b/xen/arch/x86/pci.c
>> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>>  
>>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>>  {
>> +    /*
>> +     * Refuse to map BARs at position 0, those are not initialized.  This might
>> +     * be required by Linux, that can reposition BARs with memory decoding
>> +     * enabled.  By returning false here bar->enabled will be set to false, and
>> +     * bar_write() will work as expected.
>> +     */
>> +    if ( mfn_eq(start, _mfn(0)) )
>> +        return false;
> 
> Is this really x86-specific?

No, I think Arm would benefit from this check too. I'm in favor of
moving the check to common.

