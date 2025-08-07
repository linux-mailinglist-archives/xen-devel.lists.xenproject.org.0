Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DAB1DF16
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 23:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073822.1436645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8cz-0002SO-0V; Thu, 07 Aug 2025 21:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073822.1436645; Thu, 07 Aug 2025 21:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8cy-0002Q5-U2; Thu, 07 Aug 2025 21:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1073822;
 Thu, 07 Aug 2025 21:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7F5=2T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uk8cx-0001s8-C3
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 21:58:23 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2409::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a139d550-73d9-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 23:58:22 +0200 (CEST)
Received: from BN1PR14CA0024.namprd14.prod.outlook.com (2603:10b6:408:e3::29)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 21:58:16 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::64) by BN1PR14CA0024.outlook.office365.com
 (2603:10b6:408:e3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Thu,
 7 Aug 2025 21:58:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.0 via Frontend Transport; Thu, 7 Aug 2025 21:58:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 16:58:14 -0500
Received: from [172.29.241.50] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Aug 2025 16:58:14 -0500
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
X-Inumbo-ID: a139d550-73d9-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlyiORexYDgSRd38Oygbwxn1WRI0MkNKlvfszzqb7ga39hGeqeTdMS4olrb1XPj1pNtDYjB3g1C0BuuBwFoHFUxybSiA5ECmKKa5ig6lFONZpW70FyiiUoCmS4b71ak5XecrCSt8TU9jbu+UNaIwF1DcP/waJK9VCUsWQtqFfPFrkeH8xOr3BxwGRPmTV4Ux6nBWw0D+hq7dxFpEv+YU4HCxWjfcjPPt5frn/UQJ/8WgbQMBg9BjVJ1cHqqy1y5R05uvmsI5dZVgzmA8KUq6yh/Kh9YslyvJHbPNrSP0mu49MWKRWXEeIz92EnHXdFMDim6nZwdhd2B4WHd69qAd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY54khLp+kjz5rHvyNQ6+xUysKQi2R8LFJ3RRKANeeA=;
 b=a5s51g5XIJqL4hNEDeRmOK11iQfIGDMCEJBq1clQzRCyw3CQatpphQ1dBXuLF+rmmtshBV9v7e7FJ47Lgd/+Ydy5R/LaveEgqhRkA6OrhE7Rj8YhhM3/AxHLw56Fv/FLekQ4EKamWJDVzV32zxXzSbPu8rS/3l3opQJ747X7+eEMEL3rbkHLoswU4PUi2ksndmo/3gNT+D9ZnNtNpkQxpjERNp1vQ1ftsYzgEqBcgdr3SL3zwmm0nAnfMlC82GvxxsVOYya4bgtxUujOUnYg0rBpvHAAha52lTrgu2mwpnZpbq5Py7QMSpJhN1eneDoneZhll9oNV1lsORVmQcRgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY54khLp+kjz5rHvyNQ6+xUysKQi2R8LFJ3RRKANeeA=;
 b=HRiDfDSpI2SkDOR7Z58MnM29JR1LRnPajNGfW3iBJZ2rvahwnhmYQk4oEG3DbVIJmqhrp0xI2/pdf0bIJn4d1YICzbtye8p+VOmdK8sbHoZX8U9wqRbdvQuKMMIcLRlU7gsTD1KWKOcpEv7yKN03MrUhsdfhL+wN4NvlcUBwvlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ba4e582e-6647-4e3e-9c0e-2b5b5ac3f911@amd.com>
Date: Thu, 7 Aug 2025 17:58:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20250807015606.4427-1-jason.andryuk@amd.com>
 <49691142-a9eb-4d39-a43a-07c5062dd2fe@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <49691142-a9eb-4d39-a43a-07c5062dd2fe@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0cdc91-5910-4924-0247-08ddd5fd82d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2F1KzdIaTRLZ21DS0NpSnlxQkpBQ1B3NzYya0VLMXhrMldlTnpQc0tYcWF3?=
 =?utf-8?B?VnpaSU8xS2RnMGhldll3YjlmU21JSjNnQ3c1RjBHOE8rWkFrMjA1N3JPWW5u?=
 =?utf-8?B?NDVzaHhEM0ZRZkQ5UXhCUGpiYkdscldoS1ExZytRSG9BbmFic1BSQnVkK0Jw?=
 =?utf-8?B?ZDZSQlNQdWxwT2J5K0lBdWQ5OXU1eFZsMFBFNEJMN094bTRNa1ovdE5xa2RM?=
 =?utf-8?B?dlZLR1Q3cUF4a3VXcFVoMlFaQUswZG1raS9ISW1JL2dmRFMwQkFnR0VuNDZT?=
 =?utf-8?B?blFUelplYVdFVFltcGN4YkRTVFFSUWhVcDBpQTFHNmdHVGF6S2JUV1laQ0pP?=
 =?utf-8?B?Y2FzVExsYTBTZmJsa0JJZERWWi9rSjZEYzlJV2hib2ViWE9WZXdaVXV1Q3ZR?=
 =?utf-8?B?NWZlZm9Gc1Uwelh3NktnbDQxM2pCZCtRMVFIV0NyNGNPT3M0YkMwOG04d3FB?=
 =?utf-8?B?eWtBeFRNZXNyRnNKZWpKMlZNMWUwN3pwcDdKWTcyUzRqOEFtQ3R4RVdMK1Nu?=
 =?utf-8?B?RWxIQk8yVVliYkRuYktCTmlHMWJVczc2TGpNVGJWMm5IM3VpOFRSQmxZWElW?=
 =?utf-8?B?WHgxYUN5cVZRZHQzd2h0eGViYTVNVXNKSS91RkFYREV2bkIwNzRjekRHVlEx?=
 =?utf-8?B?bWZxdjlVcXhVTWwzbVRpYk9GK0FHMlpTd0llbXhleGEzVlZtT2c0d0RFS2Nk?=
 =?utf-8?B?V3ZYejh4MW5HR3pTODdoWFp3bHY0RnZrUTNZSzJCWGlhT0ZlaHVqRHBTWm1w?=
 =?utf-8?B?YjVTY0xQb1hDSHNtVnFRRklIekxnVXRZZVZVWnRjcnZrelNmOEFoTlZlMmF4?=
 =?utf-8?B?R1orOHZsNTNlNHIzQWQxK1F1YU1oT2JZc3VnblE0bjJhMU5KYnVDczRvRzVG?=
 =?utf-8?B?aCsrS0dYODdmYy9MUnZ2Q3hxKzJRaUZaSG5GUlF2QVNDTHJRazhTbmJwRnZ6?=
 =?utf-8?B?RURvSDNScFhzVERiaFFYWFNaaCszK2NCazBpTDhWMVRISGNZeHhnbGlPOEN6?=
 =?utf-8?B?SVRvL09IcHpyN3gyaXZPeC9VeGdvcUQ4bkxJUlJJSXdwdU5sSzJwN0hVcEZM?=
 =?utf-8?B?NnlINlIxSUUyOWtNWWtHUVBORzJBQllhMEVhSWREWm9BK0NiSHlrdDJVcGg2?=
 =?utf-8?B?N1cxYjBlTFFXTEpkVVVUTVVYNG9GM3U2ZzNOZGFzTStXUVJxNDBSVHNTczlP?=
 =?utf-8?B?WFU4bHR3aWw1ekRIUitveEM2c1MzMkJPREZwZWx2QmJuV0RPWGxwNXRUNUps?=
 =?utf-8?B?b1o1UUpMaDEvUnlscHJmU0ZSdGpxcE42eGRmdFkzMHdJSHN5d0FWeVJsYlZV?=
 =?utf-8?B?UDIvUTRianNNVTRnT0hBeVBRWjJVVzFGenpUVUFWWHZPeUNTblYvRFU4RUdQ?=
 =?utf-8?B?S3Jya2djUE5vbDJNaUptM3Zib2tKcHNySnM4S25ldnFtKzIrVnR0VW02Q09I?=
 =?utf-8?B?aE9hWmh2SER3NUZ3OHpzME4vWC9RdGdZK1V1ZlBCa3grS2VYUWRqQUpwVjU3?=
 =?utf-8?B?YUgrMFdYVzhYWmpKZXlCa1pocnpLcUw2Zk5RWXVrRk5xUWFDSkVCRjVwOG0v?=
 =?utf-8?B?ZklpQ3k0S002VTg1aVpkUzVYNEpsMUpPeDgyTFRRN0JXT0QzWW5udFJvMTZ2?=
 =?utf-8?B?MmE2SVNubVlqMGhHY1dSRkpjUHAwbnlPTzc0N2xkUXNPMW5XblplVEJCS2ww?=
 =?utf-8?B?UkxVc041aCtza3YybmNsVWtpeDljNy9XZzM2R1g1bXB5UXVTS0RpakUrYjZY?=
 =?utf-8?B?ODJoNll5dXc4bWkzaGNXVWxtRW1Nb3ZUSkZydk9aL3VZQmVPcGtoVGp0TEw0?=
 =?utf-8?B?ck5BL0JNYk0yRENXWUtoZ0NBd1FCMU9GYVBMMzdzNERiVFlFUnFBUktMTW1P?=
 =?utf-8?B?RFhwNG83anVkcjRUSGorQi9ZTmFSY3MvRDlHMUtTdGNPN2VCdjdzZTdMQkQv?=
 =?utf-8?B?NmpZZUIzME1vVWNIRlBNakY4VnZoMHNNN2ZvV1kzckRvQXd6WkJRSWtWQUFu?=
 =?utf-8?B?NDRkK0U0eVJmVjk2ZU5mWTdLSmxubjkzWFdFMzBNdGdRNzNLOXVPSHFmU1hv?=
 =?utf-8?Q?xMV15X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 21:58:15.4757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0cdc91-5910-4924-0247-08ddd5fd82d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082

On 2025-08-07 05:19, Jan Beulich wrote:
> On 07.08.2025 03:56, Jason Andryuk wrote:
>> --- a/xen/include/public/io/console.h
>> +++ b/xen/include/public/io/console.h
>> @@ -19,6 +19,19 @@ struct xencons_interface {
>>       char out[2048];
>>       XENCONS_RING_IDX in_cons, in_prod;
>>       XENCONS_RING_IDX out_cons, out_prod;
>> +/*
>> + * Flag values signaling from backend to frontend whether the console is
>> + * connected.  i.e. Whether it will be serviced and emptied.
>> + *
>> + * The flag starts as disconnected.
>> + */
>> +#define XENCONSOLE_DISCONNECTED 1
>> +/*
>> + * The flag is set to connected when the backend connects and the console
>> + * will be serviced.
>> + */
>> +#define XENCONSOLE_CONNECTED    0
>> +    uint32_t flag;
>>   };
> 
> Even if the field name is singular, there's the possible reading of everything
> together as the connected state merely taking one bit, with other bits available
> for future use. IOW I think the field wants giving a less generic name, and
> perhaps also shrinking to unsigned char (or uint8_t, but char is being used in
> the structure already anyway).

It could become a bit in a multi-flag field, dut the structure has a 
good bit of space to the end of the page,  A named field, "connection", 
sounds good.

Thanks,
Jason

