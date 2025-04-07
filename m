Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A638A7E3B6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940367.1340187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oBY-0008FO-LY; Mon, 07 Apr 2025 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940367.1340187; Mon, 07 Apr 2025 15:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oBY-0008CY-IZ; Mon, 07 Apr 2025 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 940367;
 Mon, 07 Apr 2025 15:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsCM=WZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u1oBX-0008CJ-1o
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:14:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a904402-13c3-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:14:48 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 15:14:43 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 15:14:43 +0000
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
X-Inumbo-ID: 0a904402-13c3-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtvI4ZxAOeupz9xzOuGFWa6OiPKKbp/d7QuzXpgc3j1ABjWJeSbQ0yksKtxCfmnEh24I7gboAGF+eXA/sejBfm+5XEZtG3BLGNF+l1Txv2uTuSbNPxn2NYd+ONbfHpxY7V1h1Ucml6LvBvf0aJ7smVnZL0nqAdeOoo4P5pHiX4ItKIW1s4OEP77as1U8wXBQ/KltwQS3T8gVNTaPuMvlJ1GODe4FGbVi5PGBDp+GC7Ju5fvEKE1iakQHCPwSB/dICbPzMxPs5dfsoNBOpwyyCRkvKcek4JK79nXPNpZG4uG+hgZF5/hFwvoeNK69Sxt78qRzArNR2SAAHE4grI9jNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nmy7bupmu8H7pQnshs28F/818m1j+3BhXE/REpSBdrM=;
 b=LtZ1/PCY19LK6AKgzmjKJCQC2Tc6N074NAqjbhkjrmQpwCcNZ8KkID5Jl1/XfUWZQoOjabi/lJhIY2wBUeOdwJqBitCjSQkbyF+q4ZHzaIFlJsfBChkDUrjvi8cABWQ+FHy6eQHVh7guXPUXX/DJlj6LEDxrgT7hGSZgLaQrReEATUS4HPkfuj7Lk2CO/3JZM6LOwWNkrN5cLFiyRsnP3VChM5Zqa+dA0sPo8QyGFH2ftbuUrRbk3RWbeytf7fxJ9FKg/km+2rySGhoJ9yB88c73h64rVXhQGFy6O98F86pHz9osoelTVuAxRTZ66m/ReXUUmET1y2OzD6aIw5e8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmy7bupmu8H7pQnshs28F/818m1j+3BhXE/REpSBdrM=;
 b=GE2wfTnNSvehr2VhEej6AZ0gcnqqhptTfxcByUH1MSKFjV3tnYE/wGaFlDxDPMWTOoSHw2I622jDPepjmSrSBeYZD8IOXb15Gv5LhSuWv0w0n6V4N+buSbJvqCILbO9ua8kkOZn/6hghX/YimV52uyN5MZmDKT5cTFOqrJTcH7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <844fc54a-d7cb-423f-b3b7-203fcdac87b7@amd.com>
Date: Mon, 7 Apr 2025 17:14:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Drop .fixup section from non-x86 architectures
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 495f046c-7fc0-4419-47f2-08dd75e6ecd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUp5ajlMTW5JN2d1cjVoT0V0NUlNTWdVMG1GYzRKbVR2TDB1emxuTUlJWi9V?=
 =?utf-8?B?YUdNUW9Sdld0ejJFQ21NTmhmY2JoTWNDZkZHdERucnU0aVdRYzFqT0lNOXMr?=
 =?utf-8?B?czVNeFZsV2JLZ1NOQ1pwNzNVYzNrZmtIbDliWVhMd0FxSEVld0k2aklkM3B0?=
 =?utf-8?B?ZVhtYmE0WE40ZHJ6TzhPZFRLa0tjT25LNURmQ092b0hNRlNZanNaSTQ5WGxB?=
 =?utf-8?B?ci9VbWVpZ3lobjh2ZkNpbEE5aWh4MWRsL2U4dFlqTFB4Rjh5NXNmeDNTL0RL?=
 =?utf-8?B?TmxhUTlDZVgreHZ5N0xtaFRuYUszdW5WV1Y5Ny9EUE4rcXNvUnRaMTJsVHFk?=
 =?utf-8?B?YldydDFqdXlMQVhrTWU4bStlQnhOSTR2SnI2U1FFdlY5MHp2S2RSamg0Sllu?=
 =?utf-8?B?K0NWb0ZVaE5rS0t6SzVodGlUSml0TlgxTTBoblFxU3hVYWFrL1VJZHZJSVRX?=
 =?utf-8?B?eE5lS3lNUjVVempRSmdSVHpBNFRtR1lZOFlIWXpNd3ZyREtqL0J0QVF1U0gv?=
 =?utf-8?B?UE1IVUFXSGNieDJ5TmUycGN5dk1NZ1lGWFJLNmI2VVFnb1AvVWRIcHBsbHBR?=
 =?utf-8?B?cjY4VGMyK21kR3VGMFdtNGc3KyttbG1zSTMrb0pYSVVFdUdHR1BZcTZ3RW5k?=
 =?utf-8?B?U2NEWFV3aUgxSzkyVWlPb2RRS2hJUUluVEpOWFp3bHMvelUvNlRhYkh5V0pR?=
 =?utf-8?B?YitHcWFOczZpMFlaOEwwd0p4VGVUcCtyOHQ1TlUvN0JVMUk1VURrZURzNndj?=
 =?utf-8?B?b2dzcHdUT1lUanhHQUlkOG5YL1BVVlQzNkU3enhDTVNqZ0pEbkRLbk8wQmZ2?=
 =?utf-8?B?bVNKUEFpR0VyR1Y2aUZOOWllOGJnbGc2WTN5R2JXa2RkT2hCVG41R3FtY1NQ?=
 =?utf-8?B?R1l2YllMU0E1NGdZdENFM2U3UExJSU1PMVh3aGRHOGNIUFB0TElvRk9JM3Vi?=
 =?utf-8?B?djE5M2pZT0J4alVsb3hqZ0wxVjV1NmMxTndFek4rM2VDeEpQOGRtK2RiOUp2?=
 =?utf-8?B?b1Irc0ttNmNEWE1XcHBsOHhmOThmeXZ5RWQvaWdLNDVVbmFCN094STdwb2xw?=
 =?utf-8?B?T3dyYlY3Si9tcVBaelBrSStSYVgxRkROem91V0tOL1pmeXpuQTU3QXBHVmJm?=
 =?utf-8?B?cDVMV3R6TFBvbUVtYkNaZWJxbWI3Y3pwRklXQk5UMC92bGN4dUViUlA5U0ZZ?=
 =?utf-8?B?Zmd4ZlN2THM2b0RVYUEyUTA1MXVjakZSQTF2dHdvdzVCWWo1UGp2UG1oc1hT?=
 =?utf-8?B?bzRSYlJBYWsrRkp4TWVodFMxQmx4MU9vY3RJczVvVjZiOEMxOEFGd1EzZTJP?=
 =?utf-8?B?Wmt6Wmo3R3BrNUJ6SzdWeWxVWmd6NWhhaEtPQlRpTlI2NWZYcW9OZ1gyZ1d3?=
 =?utf-8?B?d0ZTUTY2SVdOZUxRdXVVOWtZL2VEQ2Q1M0RnUlFpWUQzK2JmNE53azh4L0JG?=
 =?utf-8?B?SmNLb0UxUDV3SjNscElsOE9NYy9lRVVEVEZzVlNLK2hCSDVRSXNJbUV1TWVp?=
 =?utf-8?B?aFdJdXh3b2xoMGlLWkptV1dGTmFOUEord3BZMUpqTS8xMUFyOVZyU2JLM1R3?=
 =?utf-8?B?ek1DRlhUS3l5a3dHV2I2cjk5Smd4NEJ0V2czT1N4VkRScEZaeUxPSFFpaWpU?=
 =?utf-8?B?c0tNK0pvb1JTVmJySGk1ZWpSbGxFUWM0a1dVYWR0RHRoalNUd3VHS2VPWnRh?=
 =?utf-8?B?YTBRR1FmQmhvd3NxajJHdzFiRWhzOHpOOTN3WVhyNC9wWUhFcUFockVVdU8y?=
 =?utf-8?B?aXhxelhRVDJEUStOOUpiNmNxZXZxUTBGbDB3L0R0VTVNNUdkOU5TZlNFRDd2?=
 =?utf-8?B?ditwY1ppdElGU0k3NnpxY2ZROTJXeEFJeU1mV2lBeXZ6L0wyWllZTkpQbU81?=
 =?utf-8?Q?YkNm8x7xNMQ7B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVQMnlCQzZFTitGbjJBY0xHZFUxUXdncXF6cFo3a0RVRTYrT25vRDc2RC9L?=
 =?utf-8?B?c2RzSHV5b1RpMlM3NkZzNzhvZXJwU0xkT2pXdHE1Tm50RFZ5OFVzZG5aQXZh?=
 =?utf-8?B?aElOTTZqYVYxNnNjNUJGNjNxN295VUZNa3UwWmFQUkRqeE5LNDV1czhHOUts?=
 =?utf-8?B?M2wrUmdsOTZUemJya2RXc3pOVnJMMEFWb0UvYmxqdldzN240UGQ0d3VoRWU5?=
 =?utf-8?B?REJwQjZBVTRieXVmUnc1OFZoQ3hwc3pLK0hldlZ6YVhyZS9xaGdhNStYL0Jn?=
 =?utf-8?B?WWVac0hxMnJzY3E3YndqdzZrakdXbXBMU2FjRldvZnVNWW9BQmwxaFRaVlRq?=
 =?utf-8?B?M1dNRWliay9QZEUxMlNUa1RoUVFLcmd5TzVOS1VnVlBGVlZyZTFLdTlaR2dP?=
 =?utf-8?B?R1RlTG0yRTN1RHhKOFUzNnR0WkhaWGw2bU5WYkxPTzhvQnNpN2ZqTmdzZkhy?=
 =?utf-8?B?VmVjTDF4Mzk2TGhMTTFEWVZHdWgxa1N1ZFdsZFoweHpYelVqUlNyekpQVitY?=
 =?utf-8?B?a2dNOGVxNEVPeXlQT0ozbUpyVHlYdGQzbmRHSm9qUVZQbjZhODRVRkdYWDF0?=
 =?utf-8?B?OUJYRldLVDZNcnpPOE9NUFhRZmdMdDZGcmRCUlA0TkRyTndSRlgrV21VdnE1?=
 =?utf-8?B?SVIyVjdhczhvVUdMOElGYTJjOVY1cDVSMHBwZmNUcTcyU2dQMnpPVkJhV1d2?=
 =?utf-8?B?TDVvQnNhQWxCT2ZWUjJxakF2SnJaWUo1cGo0WmR3QmlpMlo3UFVzZVlXVDM1?=
 =?utf-8?B?Um1FbnZEbnpzejlveHcvSmMvVlJwbUUvZE10S0FWSHV6SUpuLzdDaThMN09W?=
 =?utf-8?B?MEUwR0kxQVcrZXkxdHc3eFZuTkJKVGVtQytlS0U2WlpnTXI4akoxazJLTE9j?=
 =?utf-8?B?eHFrTHJNcDBVMjJaSUJzQ0FvV0J6a0lMSmxFSENzS0dTdkdmTEUvN3gvWWVw?=
 =?utf-8?B?RXc3VEhNbDR6WlFybWh3QVFkblRCVmxOcnl4RUpLeFVtUS9JaXd4VHRqZEdZ?=
 =?utf-8?B?WG16NDNrWGk5QUZGTlBnN3RURFBvMWFNUHpLZjl2VUlNVzJBclRCL0c0Vmpu?=
 =?utf-8?B?Y0dqc1BaRXB5NkJEbXRja2JNdjA4WmhvckpYem9EYjFXMC9xRDM5Yjh1ZCtO?=
 =?utf-8?B?TndaMmdidUJDb010blVoeWZWZzZsT2xPbVhxVFhwWHlWZDRBdU9WTjF3c0Y0?=
 =?utf-8?B?ODFQZk9lcW8wdi9PTEZ3aEdHSTh4S0tWS1cxcHhrdWJsSVc0NDdFQ3V3ejZU?=
 =?utf-8?B?MkxvZmJ5RW1DOGJHa29kWmFHNExyTnhOVFp1YS8rdVduM01tNVNHUklJM0F1?=
 =?utf-8?B?YTJGMmZ0VG5EZDEyc3VRWjBqakZxVTVFcFV6L2p5UlNna3lyaHNFb0I1ZVdh?=
 =?utf-8?B?b2Z1L1FuQ1Fpa2FJUEtkRlZuTDJMVkc1c1pnNE9Gb2QxNVNOUTJXb29obDNv?=
 =?utf-8?B?eUpqSTZQSjkyU0FoMzFwRE5TQlpFOTB6RmtVUVVQK1RuMTRaZ1dXUDZpNE9x?=
 =?utf-8?B?ZFI0NGtHbnAvaC80Lzh2ME0wNUVNOFJCMXJEQ2lYRHRnNTljSGlzSzQ2WmUz?=
 =?utf-8?B?OCtrU1haOU03NlhIMUtNTHJmSmt2R0J1NWhsbGNTREc4WVJqSzlCcHorQmNa?=
 =?utf-8?B?TGd1SDVoMGpPUW9rQlBuTVQwbDhTbUZPdlhKS0I4bk9BMElyZ1NrWkdVK2VW?=
 =?utf-8?B?T2Fvd1A3Zkp3bW1mOFlMM2NkTDFNOE5pTjMyNGhNNXNDelhUSTNsRGNPK3Fz?=
 =?utf-8?B?TVpFaHFPWVNqNnJWSnE3SGRGZVVISVQ1NFpWZlRPZkdOdk5tZXJjY2QvcGtr?=
 =?utf-8?B?ZmVENHdiR24vTEZmNk1pd2puZW82U28xNlhZK1hSTGJVR1l4MDRYR3RsT3RB?=
 =?utf-8?B?bTFRbHpjM0dqeTZiaXV5K2ZlS3h1UnJiQ1VPZk1ldFZZQzlsNVNRZ2dTRkYv?=
 =?utf-8?B?aGlSb3BQQ1JLTWVDaE9qSjJqZEdTb1lNZm1HM1VUSjhyaUE5MXZwTEJwQ2sx?=
 =?utf-8?B?ZmZKeTIrYndqUUNnVlQ5SG9rd1BleVpPcDhLRm5CNXVSeUYra1ViOXRReEh3?=
 =?utf-8?B?S0hSZXRhQUNYYlpMV0laUHFwcnFSbnpveGw4am84UWw5Z0E0RGhIQm9rZ0JN?=
 =?utf-8?Q?7lC+VyGrEQJCXtZQGkg3RfatF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495f046c-7fc0-4419-47f2-08dd75e6ecd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:14:43.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOb5JT7CvrCi9cIIFK2HTgBqHzEwu6YHqH2aUaaJ6fSeqKNoztvxhk8zu6xnH59v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437



On 03/04/2025 13:00, Andrew Cooper wrote:
> 
> 
> The fixup section is only used by x86, and we're working to remove it there
> too.  Logic in the fixup section is unconnected to it's origin site, and
> interferes with backtraces/etc.
> 
> Remove the section from the architectures which don't use it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com> #Arm

~Michal


