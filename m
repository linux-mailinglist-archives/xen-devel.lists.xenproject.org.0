Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F0A87FFA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950029.1346445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IZn-0005Mt-FK; Mon, 14 Apr 2025 12:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950029.1346445; Mon, 14 Apr 2025 12:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IZn-0005KU-Ce; Mon, 14 Apr 2025 12:06:11 +0000
Received: by outflank-mailman (input) for mailman id 950029;
 Mon, 14 Apr 2025 12:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4IZm-0005KO-8T
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:06:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2413::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bc44c9-1928-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 14:06:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB5678.namprd12.prod.outlook.com (2603:10b6:510:14e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 14 Apr
 2025 12:06:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:06:04 +0000
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
X-Inumbo-ID: d8bc44c9-1928-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLBdcMg+vedskUeWEqoNMr+qQhr6SV5DHM19tYxLuVAOyS+5SwrvPwZrpQ5tl+Q1YopvcK62uI/n0WI9adUCBR/J1iHLh21YEZ2ujSK2FC5KyWwEdg36+exkHjWlRLgHp5xVoz1v8Tyle24zTNvs55uvjVhnhsckDfNNMe5ZjXDJ62uL9gCxx7H2YDR9Uskj6O9hi3I1ZEEs0I3wbF+WuS/ZfLQFWQB6pse4y74tzkw2cSWrbY2AX2eJ8nsYP72CB5w6TNWmswEQu46cNdVebJmxjGib0tWcj2m4G56l6OqaxIMdxZDGMZJbj0xe+fVPMhISWCbRmQLNm7VY9hO+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkUYjbZyUBb/mXB+lZuHjunoIC3RntRvcNqu4J+48uA=;
 b=YXCrEXAbPCKZhjm3gE0ahCxYwr5UgrZ9PiluCZHkc4CPA0f6YqvaSUrdc9EVusYGvxTLtPep6S1fgALX7NcgRmKvFHccAx3hB59gyxfFVBmo7xU6i2XCW7ggKd8n9WU73HcyQJVjqFp5wSNhZvqKuDzdcAO1WZafGaq4KWLf+ZzcEWlA5IU8+4sb9X6cNJXsxHz/iK76bbWt6wl3B7ES1ecym4KUKyvc6jWiLEEBL89O3O9QOzGqMkbLBQ/OaR91j8YWBPUj787G8qtJaM9DyUGE8VJyc8LTOmWElkcAr8YDaZ3UIJkBSsolPSMQ0f9jVCBxDXm0dG83SJ6NOzGuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkUYjbZyUBb/mXB+lZuHjunoIC3RntRvcNqu4J+48uA=;
 b=wwrX/lCnVI6BlWbvi6AvOxGRY4wCuaC73YNzIGiIqPufDc/sF42CzY6SkvJLoSfMFM4f13fyjKOKWy+aiNwHyhbtIPeTAdtiWJrgjVd0WyZzXbhxyNTGcfF8tmdg/7hz/dp0J9BnT3AoJHWFrah9/CpuN06NPrz6qVeMV3KiTVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <73ff4d70-0558-4fe8-9007-f4dee673f0e8@amd.com>
Date: Mon, 14 Apr 2025 14:06:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
 <f4c43d72-b403-4829-b490-46823391f82c@amd.com>
 <0e20dc0f-ec97-4b6a-98c5-cdfcd3dfb44c@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0e20dc0f-ec97-4b6a-98c5-cdfcd3dfb44c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdcee18-0203-431a-f4f7-08dd7b4cbac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnpFdk1EZkJnYVhlaWUvVE40cjRjazFUWjBNV0FCYWF0TXpoQUhQTXg0Nzda?=
 =?utf-8?B?d21IaC9naTQ5azRGZHM3bkNMVDFiczFlWFUyeTVBSjR1dWU4N2N6UG1LdFJL?=
 =?utf-8?B?R2NuYS80RXIxVWU2bDdXUDJWbXI0OHdoZzRyci9OM3NncWUycFprMmFrUHps?=
 =?utf-8?B?dHhhbVU1T29JOTdOaGh0Y2cxTHI5VEhKU3I1Q0xOemJ5akgrbVB4UHZyWXFI?=
 =?utf-8?B?YzVQeitIUllzTG80c0l0SXdyS2JIZ0YxVWFwaVlZS0RlOXF1RjFLZDhVYVZL?=
 =?utf-8?B?QXhQbGIwa3Q0SVdoQWRIZ0R6aTBwemFhZWx0ZFJNYS9lL1RWMXNZUzNpYytC?=
 =?utf-8?B?Sk1scElkSnVJTGpsYzV5QWRtclNjbVJkR2xVc0tFOUpjRWlaL29zYlhqMTNC?=
 =?utf-8?B?MXd1S1UzV0ppZnJhUjJhd0VMZ205TzQ5MkxFMjNZSzJDUk5jTThjckt5R0lY?=
 =?utf-8?B?eE1lc0ZkU2FzVmZYSWROcEh2NXNPcURQbVVpTkdyR3l3aUZHSGJ0V2NpSlk1?=
 =?utf-8?B?cS9JSkNhdFUxTTZTdUFZb1pvQTdCUTJwbEFMOXh1bWJmMm1SSjVxMEd4aXdD?=
 =?utf-8?B?YTl5NVFwY3JJME1Jc2VhbE55TFhhaGNrdWxjYUEwRWovbnViS0RjaTZOUkpo?=
 =?utf-8?B?VS83bHdZVElnVEJRSDg1eCs2R0s1VGJjLzZ4cFpHSytHMmJkRmNFVVBzWXNa?=
 =?utf-8?B?RUtIMWtjYzJwQ200TXJsT0VTMTdMYVM2ZXlyNzNwWEU0TXUxOFNOdnQrSlA1?=
 =?utf-8?B?UWdVaTFLZFNaaUdyL0NhTjVhWVVaZ3ZHSC9rVi9lQlVCWXc5aHRYN2JKQkZO?=
 =?utf-8?B?YTFvZUlUcDUralNNZi90VmdqaGdleVBZVW1vc3ZVdmQ5Q0lPK3U3OXFHYU5o?=
 =?utf-8?B?YmhXaWJFcU43azNkYWhqNFRWUlBUdWc1eWpCZzU3Zm82bFMwM1g4QU1zNXcy?=
 =?utf-8?B?S1RpL2IyajAzQllFd1crZlA3VFNvQkNHRjc5VWhKdkdpT3FNNUhVZ2tWR1dX?=
 =?utf-8?B?NkRhVHR2YnNqdkViL1RmdWNIbUV0WHlZZE52UWdjQkV6ZzFPc3F0Q0d3UkVP?=
 =?utf-8?B?UlRaVVRpbmMwR1I5aFFsN0tJUXhuRTMzQ2VLMW9JMXg3cEpNM2h4RVZNOTBa?=
 =?utf-8?B?VVJ0OW9uSzZvTzk0VzJac2pKNWtGN05SRG1RdXRnWTgraUlBZlZ3NGVoS3Nq?=
 =?utf-8?B?N2s0TTJHbks1elBxVk0vQUZGNDdSVjBremdmenRkbXh6NUN3dEFFUUsyQjRa?=
 =?utf-8?B?RjN0Uy9BVGV2Qi9hcE5iRnpkQnp2TUR2VUxtMlV5SVErRkN0TFpLcU44bnQy?=
 =?utf-8?B?bWg0RzFia0hGcFBCbnI5WURDbUlpK3VFNDBoZFprWDhPaGRyTlJtb0llRmZx?=
 =?utf-8?B?TXFrOW9yVDVsS1VDNlFlcW1BUll0YjdzWllGcUJYVnE0akcrcHNaOHhqUTFo?=
 =?utf-8?B?cjZBZEp6SmovQ1dKcWF2cDFHbThTWmZsbmZvdHJqUXpaanFpUDBrU1ZjN3Zu?=
 =?utf-8?B?YUdZaC9lOERMUTFOVEt2YVZpVDV4MzgxaFVRZTVhYkxPZzZyeFowYVJza2Zs?=
 =?utf-8?B?ZVBNNUF1V0V5ZDlhODQzcVJab2hXUUFFMFFGUUt3VXJoMkJESThzYm52YUhR?=
 =?utf-8?B?VDliYUxoUi9VNFhtNEEzSEo2My8zNGdNWnZwQm9ScmpodkhlZ1V1NmNWdjg3?=
 =?utf-8?B?YkNjZ3RmZXN5S01ueXVFbW9DQU4zVUFaZmNUaERJb0FZQ1VHaVVkMndmdks4?=
 =?utf-8?B?MmN6MEYycHlRVGgxaHBrYzJnRHhPbHpLdE91UVRlMHp3ejNhMi9kVEUwWVY4?=
 =?utf-8?B?T3dsWHo0OXllVXBrTEZtUDJIWXpWLzhJcEppdjlabkZtWnRPUEtEUVJGem9W?=
 =?utf-8?B?QTdhK3lEdXMzVmd2WFVnakt2RVgxSlRiKzNpQjJwWlJLM3FwQnEwdGZMUGln?=
 =?utf-8?Q?FE0ESAGiLLs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNNTmJCWEU3eGYySEkvOVlIcHZGcGw0WjZRR2xBaHQzVEw1VmplekJCeUJX?=
 =?utf-8?B?UnQvT0dqaHhra1NRdlpyUXlwT0pXblVlbGNSRHMvSlMyalVDb3dJdDhPWW9w?=
 =?utf-8?B?TFdIZ3prSDhUYlU0c0Z4aTVUWTdUaEpXM2Q1SVcydytISlFodnMrcnFnMGlz?=
 =?utf-8?B?QkNDUEJmVGJXeWl4OTBqUjIySmVzTmhNL0p5bE9vcm1aN1NMRFZHYitZNnRw?=
 =?utf-8?B?bFduTTQ0bEpRc2t4Z2lFK0tBZk11bUp3UUEvT3pMWWkxR1IwcXhSR28wdG5D?=
 =?utf-8?B?M0xEc3lUdWtFNmhUbzRCb2dCaEpUUEs5QU42RHRYRnZHQUg0RTJoOTBvODdk?=
 =?utf-8?B?dDVpU1YzRllzMS8va0xBWDl2MUtPYks0d3paMmpjTkswTjhmV3RPWlZIRW4x?=
 =?utf-8?B?T25ERk9GT0xvOTY1QWprUVhCWWtlUHJyM3BLOFdCRXhDMVU2NHg2bkNUKzEx?=
 =?utf-8?B?a0FoUDlsaU1CL25lS05STFVXNGQxL3JsZGtTVENsVm9kRmhLeXE5clBsL3ho?=
 =?utf-8?B?TzFoSk9HeTl5YzYwaTJ0T2I2eWxvb1hMVFJIVHNscGxPUXlhVnlJZU1XM3Br?=
 =?utf-8?B?M2x1NytITFkyWVFhb1ljTVlpN3dpdW84cXhETFJSTkh4RDR2bkQ4blp1TFJr?=
 =?utf-8?B?UHkzcnpVTUR3YjYyZmN3OXpQalRQMlRCWS9lSGRNc2tQbDFOYkN3Z2V0L25j?=
 =?utf-8?B?Ynk3amdIRE5CUkk2WGk2OTRpaE4xeXBzVTcxSlRFYk5hSkd0V3h1VzRTSHBW?=
 =?utf-8?B?eFh3VVM1eXpWTnk1aWZ1RjJPUUJ3aG5xZUJQc3htZkxROWpUakJseFl6L1Zr?=
 =?utf-8?B?ZDRzZjlXNmdwZllXazMxb1A5bFpPSDRjQWM5YjJaeWZvM3lmcHNOWGxuOVhr?=
 =?utf-8?B?NXJlSEx5WUEyeEYwd3JtWWRnL2tFUC9HL2ZRWUpIbENadUp3ODNPMkVGR0dy?=
 =?utf-8?B?V3RWYWt6TGZLMlZCNlRTTnJSYklxUzVrTktVRWJuYmVZVzYxZWIvZFdlL3Ir?=
 =?utf-8?B?aExWcnVXT2Y3T3N6Ujdlby9hKytwbUZ4S01pVHlvcGhiUmR4aFFteFBqaVR1?=
 =?utf-8?B?QytodXZGQjl6dWJjaXBlVGN0dnJ5Wmo1TDI0RXZqN05vc3ZWUU12ZWc2WDdx?=
 =?utf-8?B?MDd5MFdIKzhRTktQeUpZdk9FQ1JrSEt2cmFNc1hGeWdKREt0ZlRyV1JWdUg1?=
 =?utf-8?B?d1poaDIzRHVnV0k0R09yRzVDME5CcFl4QWtNTWd6R3ZYbU85MWFPRUl4aHVm?=
 =?utf-8?B?bW5jM1JudXJ4MktnZWpia0RiYnlrTTFvNjFRRDBTeVpTMUx1SW41NnFDQkd4?=
 =?utf-8?B?L05uQ3lZQkwrVFI1NHByQk4rSCtxT1VxM1pHNTg4dVFxVkVJYk4zcWloS0pJ?=
 =?utf-8?B?REZMN20zVkJQM2xwdTBsRDcySk05VSsxM2pFNU1yRkpwdEZlVnRoZEJ6Qlll?=
 =?utf-8?B?Sy9uMXFrZVZjd2d1R0VZb3lKQ1VkeS9FSWM3Z2drVDR5dzhQR2JzTVIvQ1M2?=
 =?utf-8?B?VDZQY3llU1BlanVNb0loZnR0WTdsbURvZG1VczZJcDg1eEhTT3FENjJ4ZWIv?=
 =?utf-8?B?MjB6YlVaUWh1N3d0K3BiYjNsdjlQZ1gzZXRyWlhxQmN3VFNwRDl5bjFLTmd4?=
 =?utf-8?B?R05Ib255Q1NES3kranNOSXp3WTRFUGpPTHpwRlZUbS90ZE5xS2szajRtdkdx?=
 =?utf-8?B?aWR0RU5LdmxCdTNyRUlKWTQrQ25WTUJoaFR5cGtTekxNTTZUSXhHeS9WRGJm?=
 =?utf-8?B?SEUxVUJOb2YyU211UGQ2cmh2WkRzR3NUNFg1d3hwU091UlRnSm1lbHBIUk1S?=
 =?utf-8?B?Um9LK0pnVXRWOEZaL0xwazUvTkRQZkRYTEJ3TFBuMVFOdytLMmNPT1RVbFR0?=
 =?utf-8?B?UWZ3dWhpMUFrUjRoejJ1SWUyK2JvRlR4TzBBZCtTajh1WnBncnlVcnVrbFc3?=
 =?utf-8?B?d3l2UW14aXdWR251ZmsyQzFWWVhPbDgrdG85bGV5TmNNbkliM1hPL2p1RklJ?=
 =?utf-8?B?OTBZZG1Yc1I5YndXaTl1alhaV3Y1bjNqUFpieFoyTjdPaVhQKzUvTFpqTXMv?=
 =?utf-8?B?UjUzZW4rc216Vjlwemt3R1hTOFhpelVaUkZROHpRTzh5eGN3NkNnOHpqb0pL?=
 =?utf-8?Q?QOtMioM16wBDsQi4/+sQR1nAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdcee18-0203-431a-f4f7-08dd7b4cbac4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:06:03.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxn9ZOhUIOCSLWkgHPSQd4gn5WqfSUES89TWEgV5tjNAvQUJpEc5SPex7lrjVGiP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5678



On 14/04/2025 13:12, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 14/04/2025 09:38, Orzel, Michal wrote:
>>
>> On 11/04/2025 13:04, Ayan Kumar Halder wrote:
>>> Boot-time MPU protection regions (similar to Armv8-R AArch64) are created for
>>> Armv8-R AArch32.
>>> Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
>>> XN is 1-bit for arm32.
>>> Defined the system registers and macros in mpu/cpregs.h.
>>>
>>> Introduced WRITE_SYSREG_ASM() to write to system registers in assembly.
>> It really reads odd when you write what patch does in past tense.
> I will change it.
>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes from
>>>
>>> v1 -
>>>
>>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
>>> being done in enable_mmu(). All the mm related configurations happen in this
>>> function.
>>>
>>> 2. Fixed some typos.
>>>
>>> v2 -
>>> 1. Include the common prepare_xen_region.inc in head.S.
>>>
>>> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
>>>
>>> v3 -
>>> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
>>>
>>> 2. enable_boot_cpu_mm() is defined in head.S
>>>
>>> v4 -
>>> 1. *_PRBAR is moved to arm32/sysregs.h.
>>>
>>> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h.
>>>
>>> v5 -
>>> 1. WRITE_SYSREG_ASM is enclosed within #ifdef __ASSEMBLY__
>>>
>>> 2. enable_mpu() clobbers r0 only.
>>>
>>> 3. Definitions in mpu/cpregs.h in enclosed within ARM_32.
>>>
>>> 4. Removed some #ifdefs and style changes.
>>>
>>>   xen/arch/arm/arm32/Makefile              |   1 +
>>>   xen/arch/arm/arm32/mpu/Makefile          |   1 +
>>>   xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
>>>   xen/arch/arm/include/asm/arm32/sysregs.h |   9 ++
>>>   xen/arch/arm/include/asm/cpregs.h        |   2 +
>>>   xen/arch/arm/include/asm/mpu/cpregs.h    |  27 ++++++
>>>   6 files changed, 144 insertions(+)
>>>   create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>>>   create mode 100644 xen/arch/arm/arm32/mpu/head.S
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>>>
>>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>>> index 40a2b4803f..537969d753 100644
>>> --- a/xen/arch/arm/arm32/Makefile
>>> +++ b/xen/arch/arm/arm32/Makefile
>>> @@ -1,5 +1,6 @@
>>>   obj-y += lib/
>>>   obj-$(CONFIG_MMU) += mmu/
>>> +obj-$(CONFIG_MPU) += mpu/
>>>   
>>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>>   obj-y += domctl.o
>>> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
>>> new file mode 100644
>>> index 0000000000..3340058c08
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm32/mpu/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-y += head.o
>>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>>> new file mode 100644
>>> index 0000000000..b2c5245e51
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm32/mpu/head.S
>>> @@ -0,0 +1,104 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Start-of-day code for an Armv8-R-AArch32 MPU system.
>>> + */
>>> +
>>> +#include <asm/arm32/macros.h>
>>> +#include <asm/arm32/sysregs.h>
>>> +#include <asm/cpregs.h>
>>> +#include <asm/mpu.h>
>>> +#include <asm/mpu/regions.inc>
>>> +#include <asm/page.h>
>>> +
>>> +/*
>>> + * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>>> + * If the Background region is enabled, then the MPU uses the default memory
>>> + * map as the Background region for generating the memory
>>> + * attributes when MPU is disabled.
>>> + * Since the default memory map of the Armv8-R AArch32 architecture is
>>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
>>> + *
>>> + * Clobbers r0
>>> + */
>>> +FUNC_LOCAL(enable_mpu)
>>> +    /* Set up memory attribute type tables */
>>> +    mov_w r0, MAIR0VAL
>>> +    mcr   CP32(r0, HMAIR0)
>>> +    mov_w r0, MAIR1VAL
>>> +    mcr   CP32(r0, HMAIR1)
>>> +
>>> +    mrc   CP32(r0, HSCTLR)
>>> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
>>> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>> +    mcr   CP32(r0, HSCTLR)
>>> +    isb
>>> +
>>> +    ret
>>> +END(enable_mpu)
>>> +
>>> +/*
>>> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>>> + * regions.
>>> + *
>>> + * Clobbers r0 - r5
>>> + *
>>> + */
>>> +FUNC(enable_boot_cpu_mm)
>>> +    /* Get the number of regions specified in MPUIR_EL2 */
>>> +    mrc   CP32(r5, MPUIR_EL2)
>>> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
>>> +
>>> +    /* x0: region sel */
>>> +    mov   r0, #0
>>> +    /* Xen text section. */
>>> +    mov_w   r1, _stext
>>> +    mov_w   r2, _etext
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    /* Xen read-only data section. */
>>> +    mov_w   r1, _srodata
>>> +    mov_w   r2, _erodata
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
>>> +
>>> +    /* Xen read-only after init and data section. (RW data) */
>>> +    mov_w   r1, __ro_after_init_start
>>> +    mov_w   r2, __init_begin
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>>> +
>>> +    /* Xen code section. */
>>> +    mov_w   r1, __init_begin
>>> +    mov_w   r2, __init_data_begin
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    /* Xen data and BSS section. */
>>> +    mov_w   r1, __init_data_begin
>>> +    mov_w   r2, __bss_end
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>>> +
>>> +#ifdef CONFIG_EARLY_PRINTK
>>> +    /* Xen early UART section. */
>>> +    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
>>> +    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>> +#endif
>>> +
>>> +    b    enable_mpu
>>> +END(enable_boot_cpu_mm)
>>> +
>>> +/*
>>> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
>>> + * please the common code.
>>> + */
>>> +FUNC(enable_secondary_cpu_mm)
>>> +    PRINT("- SMP not enabled yet -\r\n")
>>> +1:  wfe
>>> +    b 1b
>>> +END(enable_secondary_cpu_mm)
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: ASM
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> index 22871999af..8d7b95d982 100644
>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> @@ -20,6 +20,15 @@
>>>    * uses r0 as a placeholder register. */
>>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>>   
>>> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>>> +
>>> +#ifdef __ASSEMBLY__
>> In previous patch, you had empty lines surrounding the macro.
> I will put a empty line here.
>>
>>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
>> Hmm, for arm64 you surrounded msr within "". Any reason for these style changes?
> 
> In arm64, it is
> 
> "msr " __stringify(name,) #v
> 
> One needs " " to treat this as string for concatenation. Otherwise, we 
> get an error.
> 
> In the case of arm32, we don't need __stringify().
> 
> Let me know if it makes sense.
It does. Thanks for providing the reasoning.

~Michal


