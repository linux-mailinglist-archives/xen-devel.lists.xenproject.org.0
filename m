Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48BA339F9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887201.1296741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUbk-0004AS-O0; Thu, 13 Feb 2025 08:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887201.1296741; Thu, 13 Feb 2025 08:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUbk-00046h-Kx; Thu, 13 Feb 2025 08:30:04 +0000
Received: by outflank-mailman (input) for mailman id 887201;
 Thu, 13 Feb 2025 08:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeDP=VE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tiUbj-0003qU-AR
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:30:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2413::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b682cede-e9e4-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 09:30:00 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 08:29:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 08:29:57 +0000
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
X-Inumbo-ID: b682cede-e9e4-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs5pOjkEDb22UfsW0Gq5K5+kdv134OVZ0fi4+L5Naq80iftufc607NbS45b38iRwOQudFnM052BcEZI2cl14qcColsXepStanqM1uOqBYDnCqNeKOx9AJ7YjQslszCkIY7D9Q1x2G6CdQ2XemYt4uKZQ94GKLdegamU9kVm4ZEKvWUSgtJVsY8/9P0EDmeAPLgKGUuicu2pBU+zJxpMZLhX7ifMRWlct1ZFj8Z4MHoJN9IoJceewf2vkaPJD444sGemMJyFa4Tv0hH2FplhgUtKwKLyAq3xEQ6R9JXYz0441P5VIHnOMeWYd5oO03nPMQ5PFRH+oC9moYDSuzSNJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRKpY864gjYFL/AXMKeWq2T4EwqlPfhHtxFA6kUTHoU=;
 b=rNbjH92vLaEOAtv3uhEULK/pQHv4iEelmxdd1ZwnhF9VIueNN9hoyjs1hsE50vxjUh6/m37FnK6OEGauinaqz/DcagmFatFQ/4jjiU/rhwGeW6fI3e5LMZFkDZUPkvXavWuisbKO9j3qFIbifXDXphVXIFTw2xFjY7Vhk0EH+/Lb6JabESGOdkzf4aCieI5jEYcJNYRWWHEIpyAiJmm7Y5Ck8bSpDQe4y2zS1UZEnkz6D5Vuw5/piAyevqDtxC9LgrlczbVRq9QFBTjNIa9yZgoIKP63tQWr7iK1GgGZ8h/t5jgvCQLWcYdYcc6JLu6io3xhfHNsOUbIpQamhVeIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRKpY864gjYFL/AXMKeWq2T4EwqlPfhHtxFA6kUTHoU=;
 b=HWtv804AVX8RTr1k37JqLL1WVtlQaQNKRlDSVp/c+Xe7t0k7fsiAFxXs2esUjTOCUS5wMP98DAyCf63zg2IMy2aBWzhe4zy6sN4thJw3NayO36n6cmRDSi6Bnu+9kS3fY/0bADu3/u4eT2Z4mbioNkslO60qBRW+x58dGMgdoxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8abc5358-d0e4-4589-b0d1-1fb5fa6aa86d@amd.com>
Date: Thu, 13 Feb 2025 09:29:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch: arm64: always set EL=1 when injecting undefined
 exception
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250212144950.2818089-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2502121403410.619090@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2502121403410.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: 14762293-0ec3-4d43-aefa-08dd4c089874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mi8vTGVibjE2VTltaGsxR045NjF1b1hxekJGNHdWZ2ttRkdrbVpseGo4bU5j?=
 =?utf-8?B?dXZxTHRTeVdOckdscHI2KzJjMTcxM3d0eVQrZHlKWTdnRUtaVzErU1Q1YVdz?=
 =?utf-8?B?RUpvcjV3Nm1TZ3d6QU9RTndvYWhBOU84OVZ0NmdTaWxaa2hEVmxkVU1LeXlM?=
 =?utf-8?B?TjlNUTltZGVsUUdtSUR0RzQyWHBjeG15UTd3Q0V1bGpUN1JROEJqQXVZZXVs?=
 =?utf-8?B?dmtsbkRTRHdLbWI0ZGtKYUt2clpyWU5abGFxMCtRVG9aUW5xQlRYSDZEckdu?=
 =?utf-8?B?WGVGTHE0SDlycWlCaW1WdWl3Q2s4aWFQOVljT0pqOGpDN2ZJZlhSaE11bzhO?=
 =?utf-8?B?Tjd0MUpIQm1Wc2J0NzJXY0RRVTI2UG95cDNaNEhSVXNIMHM0RXlnZW5HV29Y?=
 =?utf-8?B?SVlWcUg1eWNiWUZQQlY2ajhNbFZQdDNuNHlreXZseHo3cGs1dlBqZDVHZ0Js?=
 =?utf-8?B?a1BWM3F4T0c0RzVOWDdEZlVTK21CSm9zbVJHYnhhMjVjaGxPYlVPWWRaWHZq?=
 =?utf-8?B?QTJHaDVtdHMzeWR5WGFCUzFvVlJmb3l1WXZXSVdQb3p3bXJxaDdiK3pqYVFs?=
 =?utf-8?B?QktlSXJLNzFUdTNybWxWVkN6eWpyeVN1TzVpUTJJQnN3OFZEMGdnVWkvSEYz?=
 =?utf-8?B?QkZuaXNyS3FMV3FhSkRnclFwdlFHd2lhdG0ycHBhUzdMdkE0OW5HdDhwLzNk?=
 =?utf-8?B?Ri9xdTljZ2JUTEl3a2k3eHY2c2I2dEdoaHpVS0RDSzBNSC9CL1orYzRWbW5N?=
 =?utf-8?B?dHQ5a0ZFNk5GSW44VGozNWpzcnlKRHZ1aWExS0tVV1FjQTZqYTdzTURZSVpq?=
 =?utf-8?B?c093dUJ2N0RHLzhsRU4zTkFBYWhDSkdRNjFrTDFFUjE3Y3U3U3c2bUZCaHl4?=
 =?utf-8?B?ZElJcXhrZk1vNlhpdzhFblFINVBYdzhQZXRmSkN4cVZseDJOQ0hxNnZka04z?=
 =?utf-8?B?WitOUS9lUGVBU1hkRmloWEZvRFlNTzF3R1M3elZFdEdnUkFkSmgzSjUxN09F?=
 =?utf-8?B?aHF5VExCYkpnSE5GeGZDZnFLNEg0RFkwM2lYMWp2bDFTbWFiUXRNWnI3NytR?=
 =?utf-8?B?R2s0REJXcm1UZjRLbFFWc3U1M0w2Umh6TmlQWXM4ZmU0WWY2Vnh6czhtVmo4?=
 =?utf-8?B?SXpURlRFbzNVRlk0Uy9rVHlQeFc3dnMvOTFIblpIaWtXLzY1WFRMYVgrK2Yw?=
 =?utf-8?B?UkJ4QU5UWnMxNGd0ODJ3TVh4S1IvemlvN0U0bU4wRFFaeTQrMkdFcnlJWVY5?=
 =?utf-8?B?b2MweUhkd2d0N3VVeUV2c2UyTkJ0NjlwMXV0TkdLaExudGozeU5BZnQvT0JW?=
 =?utf-8?B?NldSY1FPYWR2N2RINVphR1I5czhTL3ZNUzFmaDI4NTRtcVJ0WWh6SERTRmtD?=
 =?utf-8?B?WURldXkrM0hkU2dZdHk4cFRYeHJoQUYyajVWVmtPVEVOMXRCNG16UldhZVJZ?=
 =?utf-8?B?V3NRc1VSREtWSWV4WWR5RlZjSHZHWDRVSWZ4MEwvTytZVmlBd0N3V3FmVzhR?=
 =?utf-8?B?MUV0Y3JvMldabGRDeDJMSjBFbUwwM3JPSjlLVlQxOXY5a3JzVmJnUEFVUzYx?=
 =?utf-8?B?LzlyaGkrSDZNRk1XMmttejB0anJZaWdmdUNWbStNZCt0aWtOOHdVRk82NSsz?=
 =?utf-8?B?T09YUndRUmRJTHhVSFNsOWNtb3o1WnNHYWdrU004aUJFRGVGVXFjSDRoVGdO?=
 =?utf-8?B?V1lFb1NuUldVMDF6anJrNjFGUGZGTEhITHMyYk1SM0txcGRzenY3clJISG8x?=
 =?utf-8?B?ellmZ2U5YjA0MUlvczJsaWk1NE5TZDFsbjNKVW1wVjVMOHBGMERPa29HaUhC?=
 =?utf-8?B?dHRkRzFGZDhjekNGSUxYVmUrZFE0U0VNRkpHK1lKVXpES1ZEbS9iMXNUUG50?=
 =?utf-8?Q?srxB0ogZ19LvJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVUrdU1vYlRBem52NklYeEUwWjVkMS9HNjlSZjRiTGYzZWJETytBdng5Ukt6?=
 =?utf-8?B?WkxMNFVqWTA4cHQ5ZTd4czNhN1hoc0cyS01mbHhVVGFIcUN0RlVTOEFTOGtC?=
 =?utf-8?B?R0xmbEdYZE16OUt6aU92Q3VZRWRQcG1Lb29NTUdtZi9iN2VKbW1MZDE3bGVq?=
 =?utf-8?B?cEFxNVh4MytLNHBURjF6NHFGR1dxRFpYaUlGQnlGR3RsN0JsMXhIZkwwSDhM?=
 =?utf-8?B?aVVZM3U0dlZ1ZUcwaU0xVnJYbERWQVN5VExNaDREZ3JtYWwrNWx5cWJJdDBs?=
 =?utf-8?B?OXcxMGU0akZna1lubi9VbVRHNWV6L1Y2SGlBYjAvTHhoSGJtbUtFb1NrSWNj?=
 =?utf-8?B?NEo3eWk2RmwwUVFIK3BjVW9nM01taUsyUmF1bkFrVG96TEFlUkZnWXhzdUlh?=
 =?utf-8?B?VlZ2VDh0ZitlU0wrMTdyWEJyZ1ZyU2lWdVp0QTEwSGIwTEFpVGtmQ0tCNkFC?=
 =?utf-8?B?SWpXR1Bxc29kcHZGUDl2VXdydWE2Zm0wV3JOQ3ZMZ0w1WDVheHlzMFBvTGVx?=
 =?utf-8?B?cTg4UEVid0F3MHVaTGwxcDJZelYwV3ZDYWZZYWgzMHJzdTd4VHRNMnEvRmlR?=
 =?utf-8?B?anZ3S004bVVqZ3huWVlQT011cE9LVzAramxKS3liSkF2YnB5dEdkYWd3TU9P?=
 =?utf-8?B?NVAyNmlYTVFBZ2pCREZvcEdLVkpmenhHeGxCeFY5QWxuVU5JZnFJTWVyeU9q?=
 =?utf-8?B?MUJlVHM1dDUxdXdwbWI4QlZkWDNxVU0wTEVlR2o0TnRBUThwNUY2WjlmWmJp?=
 =?utf-8?B?YWc1TWV5U3ZrdDhxNXhscmxBMXdyTjlobVpkOTREZU9NbTV5YkRQQmZScFNt?=
 =?utf-8?B?RkpTeWMxcmdVMDVDWVY2R3JHa2dmQ2NMSHJJLyt4b0I2QW1sdyszdmRsOWtl?=
 =?utf-8?B?MzJwa2hNQUw4bjFpaW5IUDRBNVk0b2E5bHkvUG5BalZSUUJ3Yk5Dd2lHb2wr?=
 =?utf-8?B?czFhZWQ4eVhIeHZ4cVJLM2c3QlVncjM5UWFoOUF3OVcxMWJjZDdMUTVjVDZr?=
 =?utf-8?B?ZHlFOUxuR0dTbko1UldUUERNVmk0ZEdnWUlyNWR2T0hscEFCOTl4OVB4ZmE4?=
 =?utf-8?B?UU0zZHdVa1h0MStjZEdKWDlyaVhLZXFDQUpGaTU0Y3hEeGJpQStTaDY1Sk1G?=
 =?utf-8?B?UUdqTXFKS0tlZUltc0pJay9VRFhHRHVISWNsOFFzTG90SVd0SEEyQXlWbUVH?=
 =?utf-8?B?ZWtlWjZ1TWoyTEQvdGhvZ3JpUkpmaEVaZXhWaVA5Q2xZNnlRSE53RVZ2SXRY?=
 =?utf-8?B?ZkhRc0FEcndXeWFlblR5a3hhR0haVERoOUlSYmlGbHRIeXJOcWVNRDBQektP?=
 =?utf-8?B?aXZTb3IxMmdwUUZodkxhM0xhQk5HY1JtQnNlWXFKWVF4QUR2MTdqWmhyQUZR?=
 =?utf-8?B?QUlhcEU3S29xMlJKcXVhRlFxUjBFL2gwZEJOWWxtbzltWjBUWElFYkMyZEp0?=
 =?utf-8?B?NWpNYnlmdGZSQ01GQ0dBRmJmUUZDZ1JDMit5c3pjellvYmtBNFo1dHBUWGIr?=
 =?utf-8?B?NDNkeXgxY3J1TkJyV3ZsRSs2YnFrSXhCMlBrcTUyUm5HK0l0ZlRaS0M5aC9I?=
 =?utf-8?B?RWZNUHpiait0a2oyOWZuZVlnRTRzNS9leDdFNkdTTkViaUF6SnJYZmRaNG1s?=
 =?utf-8?B?LzhPckJuTC9CL1RNc1loMmtiZWZ0d25rTDRCVjdGR29TTEJiM1dySS9xNTM2?=
 =?utf-8?B?RHkwdlpYKzBRMlF0NXJuaFRxNjdpdXoyeXlvdFB3VHV0Y3pjbitNeklCeldu?=
 =?utf-8?B?Tk04MDNybnZZcHpRQ2t5WjgwL2g5UTE4L1E2d2VwSFdiZUFBdms5UlN0ZFpa?=
 =?utf-8?B?T3d5ald2NnZCYU12SFIrQTk4YjZ3NXdCNDNnSVJHdmErRTRQVTVKM2pjS2tp?=
 =?utf-8?B?Kytsb2loVmJrbFZYbWNJMnA0WUFtUldxNXMybDRuRlVVOWRGbndlb08yOTQ2?=
 =?utf-8?B?Y1dSbDFoZWxpQ3dmdU5VbE9ad3ZDbmU0ZjFQM0xTSFI5L3NaR3NXRlhQeGVk?=
 =?utf-8?B?NkozcHJuakZtRThOd01pMTl3QlA1TVhjMFFCczBNKzlraXA1ejFrL0YvRVY2?=
 =?utf-8?B?aktBeThDSnY2ODF0bWQxQkpaK3NYejF0S3lKYXFXSGc3aTFNSGE5ejB1bEZQ?=
 =?utf-8?Q?AQzQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14762293-0ec3-4d43-aefa-08dd4c089874
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 08:29:56.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPZ0/UwQyU0hp8OqggseBYHnhKLJxeVLhBuX0pm8aS7lvjtiudQRjwF7cTC5bQrr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

Hi Volodymyr,

NIT: s/EL/IL/ in commit title

One remark below.

On 12/02/2025 23:03, Stefano Stabellini wrote:
> 
> 
> On Wed, 12 Feb 2025, Volodymyr Babchuk wrote:
>> ARM Architecture Reference Manual states that EL field of ESR_EL1
>> register should be 1 when EC is 0b000000 aka HSR_EC_UNKNOWN.
>>
>> Section D24.2.40, page D24-7337 of ARM DDI 0487L:
>>
>>   IL, bit [25]
>>   Instruction Length for synchronous exceptions. Possible values of this bit are:
>>
>>   [...]
>>
>>   0b1 - 32-bit instruction trapped.
>>   This value is also used when the exception is one of the following:
>>   [...]
>>    - An exception reported using EC value 0b000000.
>>
>> To align code with the specification, set .len field to 1 in
>> inject_undef64_exception() and remove unneeded second parameter.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>  xen/arch/arm/arm64/vsysreg.c           |  8 ++++----
>>  xen/arch/arm/include/asm/arm64/traps.h |  2 +-
>>  xen/arch/arm/include/asm/traps.h       |  2 +-
>>  xen/arch/arm/p2m.c                     |  2 +-
>>  xen/arch/arm/traps.c                   | 24 ++++++++++++------------
>>  xen/arch/arm/vcpreg.c                  | 24 ++++++++++++------------
>>  xen/arch/arm/vsmc.c                    |  6 ++----
>>  7 files changed, 33 insertions(+), 35 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index c73b2c95ce..29622a8593 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -95,7 +95,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>       */
>>      case HSR_SYSREG_ACTLR_EL1:
>>          if ( regs_mode_is_user(regs) )
>> -            return inject_undef_exception(regs, hsr);
>> +            return inject_undef_exception(regs);
>>          if ( hsr.sysreg.read )
>>              set_user_reg(regs, regidx, v->arch.actlr);
>>          break;
>> @@ -267,7 +267,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>      case HSR_SYSREG_CNTP_TVAL_EL0:
>>      case HSR_SYSREG_CNTP_CVAL_EL0:
>>          if ( !vtimer_emulate(regs, hsr) )
>> -            return inject_undef_exception(regs, hsr);
>> +            return inject_undef_exception(regs);
>>          break;
>>
>>      /*
>> @@ -280,7 +280,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>      case HSR_SYSREG_ICC_SGI0R_EL1:
>>
>>          if ( !vgic_emulate(regs, hsr) )
>> -            return inject_undef64_exception(regs, hsr.len);
>> +            return inject_undef64_exception(regs);
>>          break;
>>
>>      /*
>> @@ -440,7 +440,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>      gdprintk(XENLOG_ERR,
>>               "unhandled 64-bit sysreg access %#"PRIregister"\n",
>>               hsr.bits & HSR_SYSREG_REGS_MASK);
>> -    inject_undef_exception(regs, hsr);
>> +    inject_undef_exception(regs);
>>  }
>>
>>  /*
>> diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
>> index a347cb13d6..3be2fa69ee 100644
>> --- a/xen/arch/arm/include/asm/arm64/traps.h
>> +++ b/xen/arch/arm/include/asm/arm64/traps.h
>> @@ -1,7 +1,7 @@
>>  #ifndef __ASM_ARM64_TRAPS__
>>  #define __ASM_ARM64_TRAPS__
>>
>> -void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
>> +void inject_undef64_exception(struct cpu_user_regs *regs);
>>
>>  void do_sysreg(struct cpu_user_regs *regs,
>>                 const union hsr hsr);
>> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
>> index 9a60dbf70e..3b40afe262 100644
>> --- a/xen/arch/arm/include/asm/traps.h
>> +++ b/xen/arch/arm/include/asm/traps.h
>> @@ -44,7 +44,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr);
>>
>>  void advance_pc(struct cpu_user_regs *regs, const union hsr hsr);
>>
>> -void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hsr);
>> +void inject_undef_exception(struct cpu_user_regs *regs);
>>
>>  /* read as zero and write ignore */
>>  void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 65b70955e3..6196cad0d4 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -438,7 +438,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
>>      {
>>          gprintk(XENLOG_ERR,
>>                  "The cache should be flushed by VA rather than by set/way.\n");
>> -        inject_undef_exception(regs, hsr);
>> +        inject_undef_exception(regs);
There's nothing using hsr anymore, so you should drop hsr parameter from
p2m_set_way_flush()

BTW. Are you going to also look at simplifying e.g. inject_iabt_exception() for
which IL is also 1?

~Michal


