Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567E9A668D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823370.1237354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qXY-0000IV-P6; Mon, 21 Oct 2024 11:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823370.1237354; Mon, 21 Oct 2024 11:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qXY-0000G6-MR; Mon, 21 Oct 2024 11:25:36 +0000
Received: by outflank-mailman (input) for mailman id 823370;
 Mon, 21 Oct 2024 11:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2qXX-0000G0-5f
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:25:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2412::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e9635a3-8f9f-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 13:25:33 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 11:25:27 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:25:27 +0000
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
X-Inumbo-ID: 2e9635a3-8f9f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCFz6fdjqEhMORaqA+2ZzGkUX4t5m+p4j45hpNA1eVHHl6nfisZ3BQ+/dlPNnx8C/MSiUpbN3LvAfipVMK1ylBxJ3R5B08RYI9lF/0GgFDF1oY3Be4hjMoGIdG1P6896NObyqpofTi+XSpmp8oKpKhxqHY3DGi20p8hYud29mKuXR1pLpJioCykn/1Z7CfXnaDiReos3AGIU4EN+kxa+6jcf8LyFR5yHByVE0ZqqjSbYu55tageNZLquHlXsvXXs9+67IiDTJ26P8yqPXa1aSQH6zMg/SGLEgnrWuSN+9CzTmtc2YYB6gvbzt1F14EVHxkbv4RcDd7mtUBesBaz8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3/UazAXgyQl1xJR3qrZqCMWeE1TDkb5KglTussWt1c=;
 b=hN/AjfApiiaCtIdRsXd0SeVZPOaF+hTLUniBRpDjG8SBr2Wrj6Qjk3tnZl7xJ7bIu9BqiJXs5FPSt8OmV75vMPpKFip6kUnS5FKKLY1ZCrHDxeGQVWGjxoZvn1aQbMHkAIRDph5yI03vsKsMlwtD15fvDhJ7ZkHYCk9b/2jF2886zWWdU9HGMWLRdTl++LzyGfK0Dydi9aM4R/2M8x3S7b9y75rHTMDyLKGXf+je20gLgYDkcSmxDj87gCshB3Gn2HmEWKPZUgaw/gH7zs9JNm/ux+E//EcR9PuvK3ai4whjneqlJdmo3armwKwATO87dZjaESl0AI5vxAlZrShftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3/UazAXgyQl1xJR3qrZqCMWeE1TDkb5KglTussWt1c=;
 b=szhExru7mBBN8VgpP+myX4qbZ685PJawjkTS2x8K1lArQer3aXLvpE0X8MlBUlx/Ojv+DACW9SxOew32EeWPtEN/XHWpze8LCMOdN4cOqOn5dx/60j+CE/35asEfLyNHnexE/ujIpxQIVaB1uIQ76pYPXfapaAUHr/klkLLOcNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <74dd600b-4261-46a7-916a-506a11eb2c99@amd.com>
Date: Mon, 21 Oct 2024 12:25:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
 <a2ba4e14-cede-4b30-a67a-790f4a55f3a6@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a2ba4e14-cede-4b30-a67a-790f4a55f3a6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dbb0fa-fe4e-4054-3fe6-08dcf1c31017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVlIcVZuQWNWUmF4TjBFOXpJaFhxN045OXU5U0NPSkRHT3l2bjZHaVBjYTRw?=
 =?utf-8?B?TXZuc2RTVHhCcUtwNS92U1JBdS90aTk0ajhzRUswZEJhSTU2K0oySllwcUxw?=
 =?utf-8?B?dmdna2RENVoxeE5teWE4aHQzTjIyQ2FtbjJldlB3WEdlcDVmT25IeExJcmNv?=
 =?utf-8?B?VkFmcXQ0VEg0VVgwbWZhNnUvWDBBYlE2N00weWRwQy9ocFJhc3ZHTlVqdDBn?=
 =?utf-8?B?anprL3ZSNGg3ajVXT1lhZmtqazAxTno5N2RrNVI1aVNQM3gwNkIrQlFzdHZV?=
 =?utf-8?B?cTk1QTBaeW52U1EyUEF2OGR6Znp2TFNqS211RDFIMFk5Skd1Q1RjM3lHWGdV?=
 =?utf-8?B?TUNwSE9CRkIvMURBWUVEVnpCRThORHBhczBYbEpBQ2VMZXdFTFJwekFVazlH?=
 =?utf-8?B?RUhZNkVRQTZIU2czWjA1c3ZoNlRVa3Mvb3hZMHJHM0lsdVFuaWwvaE4vcXJS?=
 =?utf-8?B?SzBneTZmRXZ3U09jYTJhZCtuTllBb2xicEVBNVNNaXU1SlB1aFEzYmNFeEtE?=
 =?utf-8?B?ZmNHSUY2WlFma0Fkb1M5bElpM1BKaUlmMHpmbml1R25LS1Y4STNuN05BQ2dq?=
 =?utf-8?B?NlRKZTlRbzl2MmFSUDhjV0pwS25tU0pUcDhqaFJXaS8yNURyeTJMeFNpdnRU?=
 =?utf-8?B?YUtQVjRoSTNKZUp3eTRFUUZZZ2lNWFBISjBNbE1UM0ZmR2xXRlhNTjlJTnd0?=
 =?utf-8?B?T25HOEZEV0RxVUFmekFFeGQ0bDkrNTVNTldNOHNJR3hYcDlWNk5VTDZ5Vmh0?=
 =?utf-8?B?Qm8yWW5Cemgyazc3MXBPWTNXUXMrRVF4ZjEzdmw4azRLVHM1UTZtMnArY2lv?=
 =?utf-8?B?VEd1eFNxVnNGQml6a0lnZ2xuTiswL1Frc2R3V3ZXaTlRWjg3c3FmWE9HSmw2?=
 =?utf-8?B?ZkxKalJVTHNxckw0QWxuQlZUbU5FOWpDMWFkb0xzcmFydGpQRDl3dEpienZk?=
 =?utf-8?B?K3FtVjR4amowSnJ3Wnl6ZTF5VkVIR3ZTY29Pdkg1bFdNanREcGVvcklWNVZP?=
 =?utf-8?B?cnVYelVNMncrL3hJeE9OWU1MWC91dDk3UmQ1N3JwTUFCVWVMd3dlc0QvTEZt?=
 =?utf-8?B?MDFjK3hsSHNSL1VVY0dxb2QxWDNMUmlrMmNaMlpBZWVuYlRWcXNjNWFiYllK?=
 =?utf-8?B?akQ3WDlYcXFCUVgzem9XZHNKWUhzTTkzZm9nVnVJVzV1MEY1bXh0V2lTK1FB?=
 =?utf-8?B?UGVtRlNBWDVXTytmMFBpQWUrVndCV1dzcTY4UFNGRFE0RmEveWNsWTFhODNM?=
 =?utf-8?B?QnczZnRoVUw3TlZadmVFUGRwUDlOTDNVRmMxSDVYSWN3MXVrVWljK1RuQ21J?=
 =?utf-8?B?Rys3U1V2QWw3bDJlYWRoa29OcWFnb2wrbDVpOWJUZHZSYlhIU1JOSytGZGRo?=
 =?utf-8?B?MzRDVlhJazV3MkRrUlhXa1E0OGpPSjhBV0R0SFV4VVROVjRtSUNCLzBSeDN0?=
 =?utf-8?B?SkFZdkQ3SDc3T0xPOEhOODJsZkZNOHNNekQ3cGRMVUxoSWQ1SWlPQWViSTRn?=
 =?utf-8?B?SW9lck4wSGp1Sm5URis3L3VYR0xiV29ndEtLRWlTQXVFSWN6QUIzVW1tWmc1?=
 =?utf-8?B?SnJrY3lOd1EyL0thSy9DYmozZFhGQm8xczZkbUI0VXlqVk02Z01BdmNHaTFq?=
 =?utf-8?B?dEdTSm5CYjZ6TG14UlZ0SWZWeW5DYTJvazU5aEFOVU4zQklGN2RER3pMOGZz?=
 =?utf-8?B?WWNtbFhMOE9Lc1ZlVjRrU3lFZVNJRlFLNUN1bU45bVRUN25JWFBiV24rZy9K?=
 =?utf-8?Q?HINDDOmrPp3SdnZkGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlNGLzVPbGhMUnJaaDRDOVJFRnNlRnQ2bDU5ZzN6bml6a0M3TXVxMW52Si9R?=
 =?utf-8?B?L0pudVJVemhpZFFMMmdpWG1jUHoyN1d0SVo0N2ZIcTRtcjNuM1VTOGlqYjA1?=
 =?utf-8?B?ZTNEK2Z0YUJZUThTb2h0UjExYUNwbURacmMzc3FiQzI1SjV6KzFpbDhmUnl3?=
 =?utf-8?B?YytlYWpSblVFMnIvcE03cEZlSFNPd1dMQm13KzlvTnZsTWxTck84UnBNbERE?=
 =?utf-8?B?Z0Q4V21RdnZnaHZCb2tKVzVvdWxQbmpWZ3JXUy9SbkdOZXE2SXFlT0Fmckta?=
 =?utf-8?B?TWIydmJMbmtRS1ZpN3BqanFDWXY3UGIyUStoVXhwS2hqZmpXY2xPQUM5c3E1?=
 =?utf-8?B?aVFzS01OUHBBT2hyQ05IV09sT3V1WmRkaGxXSlphdkNLMDVBSHFzMXRIalB3?=
 =?utf-8?B?a0dlUHRZV3Vua04zQW00YUp4anl6R3MzSE0xM3FNQkl5dzcrL0laL2dBbEFm?=
 =?utf-8?B?QkoxYVlud2Y3eVRadWk2SUFIN2RiU25QUVh2dlZiaUFwNUhYN2pISGNQdWZo?=
 =?utf-8?B?aURrTzRxb1grcENKMG4za2NVRWdFNHlnOThtbEJnWnZhQXdNQWNjTnJBSURt?=
 =?utf-8?B?NStKNDlyVHUvdTIxSC9ndmZnMU9aMWZTUWNZZFZvNmRhNW9oYTJPOHFCb1BH?=
 =?utf-8?B?c1dXSVhIdWNVMXJZVzYvNkJ4QXVUMHNUNFAvcll1MVpxdlBsdVNLdzdUd3hZ?=
 =?utf-8?B?SnRwSm9uNUMvNmp0V1RId2JtWndwR3BPWFJTNEVmcExRRjF3elRyMGpGc0xU?=
 =?utf-8?B?MytMVkZSdFpJMjdVSUlBVjlnb1lLb3FhNjYyZnlsSHUyczB5TjVncGRmQldp?=
 =?utf-8?B?MWpGVytzTi9xWGd6NE9RQ3Q4WnNkSmZQQlRPTTEvTEh0SVRIS0NldkVkZ3Yz?=
 =?utf-8?B?OWsvbkZIdmJvQkdTVjF1aTJLUDgyM2srNUNlTEhQcm1TbHRKbXBzZStjdHN3?=
 =?utf-8?B?bkVoenhLTTVpOWZCVEthOTE3d2NVeUx4Z1RqYk5uU0ttTTB1cjRHTEQrRUVs?=
 =?utf-8?B?YTZaZk5LVkRUTjNLaUh5R29zL0lkVXlZQkpGaWRpN28rRC9GNzVmaE53c3lS?=
 =?utf-8?B?Q3JBWXBTaHQ0L1NMQTlTS3ZTSnZKZU1nOElDSHFJOW14a2FZaTk4Q01JMGtJ?=
 =?utf-8?B?M3F3dXZLSE5mYXNkVWVsT2dsZUdDcmNuWlV1eG54TStIcWIxQkgxVmlkUG16?=
 =?utf-8?B?MldPZG1lZmhjMVVETTBWZW5Ib0dqZVVLTjRWRVQrdU1JTGlUY0pkbGtORjF1?=
 =?utf-8?B?KzB1YWt6WEVXR2EwZnlhRGZlYncxYnlSZERPbENPTnpOZTRKNUptczV6VGM4?=
 =?utf-8?B?YkpsOCtwcDhrckxrTE1aTHBpODFjdTkrZFk4KzVYV1RZVWNsSEM4TzlnbEpj?=
 =?utf-8?B?anhRVjRYbGt5MVhaS2dPbnU4bCtmYXVWbXEwWDAyczA4d2IwbDBHVU1JeDdH?=
 =?utf-8?B?NjhHbzl1ZzBxUWViU3hqY2dEYlNDVmptTnBiNGlqcGY4akNJMmc3VG1yUmFS?=
 =?utf-8?B?V3R2SzV6amVnb1dRUGFVZ1FjMEx4aTZFV1lEb29PVXRnU0tQSW96Rk00alpK?=
 =?utf-8?B?SzFKcXVxUjNPeWZGVEY1MTc3U1NQQ2lsWVhmRWxFbndZTXUzMlZVN3ZXWnhp?=
 =?utf-8?B?TTZ6RENHK0VNZVMvSEdsZUxMT0NnSDNYa0I4MkYzZEx0WVVJbys5Um1NeHo3?=
 =?utf-8?B?dUQreVRkNnN2NUFUcU5ySkw1WjhCZ1JQWUxtMWY4aFVzazBnODdndXhmRlJq?=
 =?utf-8?B?UFY1OVZjK3FRR1VlVE9pK3FxRDlrM1ZQYUV6eTI3ekhsaVVHKzdyNjNrallu?=
 =?utf-8?B?NEFGdnE4M20vdHNtbmRmOUNydGZBYVdzbXY4NFhNWlNaNmF1TVlTWHNzNVlw?=
 =?utf-8?B?c2RyelNiTVBnYUtTbnZxS2RMWTFESHVSSlBNNVhhRVZuaytRQWlQVFJiNU41?=
 =?utf-8?B?YTV5VHRxcWltWVo1eTI5ZXZUWEJOelV0TzRuM0NBd2xIcDMvcml6U2FycGto?=
 =?utf-8?B?MHVUd3l6a3dKM1dQQTgwdWZmQXhrbEYrQUFCa0p4OVpERTFhR3h0UmpvQ2wy?=
 =?utf-8?B?d3RxcUs5UmRBSmtldU1oMnE5b0dvUzRyNVByUzhYYlcyRTZEa0x3SGZIWXZj?=
 =?utf-8?Q?iJdgh/TzjI8JTlHXqjKGj8b7U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dbb0fa-fe4e-4054-3fe6-08dcf1c31017
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:25:27.3931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37dlIGIuvqc7jNcPcj5YBq/NFTMiJH3u8jHD02A7h+TO8aa9kLSy146xWedjmjYD7KKosG/Y//j+eVNeQo/wwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976


On 18/10/2024 15:08, Julien Grall wrote:
> Hi,
Hi,
>
> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>>
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> MPU is now gated by UNSUPPORTED.
>>
>> Update SUPPORT.md to state that the support for MPU is experimental.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> With one remark below:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks.
>
>> ---
>> Changes from :-
>>
>> v1 - 1. Reworded the help messages.
>> 2. Updated Support.md.
>>
>> v2 - 1. Reworded the help message.
>>
>>   SUPPORT.md                     |  1 +
>>   xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>   3 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 23dd7e6424..3f6d788a43 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -40,6 +40,7 @@ supported in this document.
>>         Status, Xen in AArch64 mode: Supported
>>       Status, Xen in AArch32 mode: Tech Preview
>> +    Status, Xen with MPU: Experimental
>
> Maybe mention Armv8-R?

Yes.

I propose this change be done on commit as well.

And then I can respin the next 4 patches.

- Ayan


