Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CBA5EE16
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911481.1317894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tse0N-0007Ea-Qq; Thu, 13 Mar 2025 08:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911481.1317894; Thu, 13 Mar 2025 08:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tse0N-0007CH-Nj; Thu, 13 Mar 2025 08:33:27 +0000
Received: by outflank-mailman (input) for mailman id 911481;
 Thu, 13 Mar 2025 08:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tse0M-0007CB-06
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:33:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d387ea71-ffe5-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:33:24 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 08:33:18 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 08:33:18 +0000
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
X-Inumbo-ID: d387ea71-ffe5-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2YQgKnh6iBhlQrYwZm9hznijvFEGWCtIUpGxSz/XPR1n3YVUeRST4zktjpJO9doDyP3Ug81KzpSpmrjalaMHfF15oUePoH0/QXRxiQ0T7kkbWAykYlZ8kYh7GYii4vR63K1HeIhYVGawNtbNzPT1PVVAHm0SdJRmct5BVQOxjSS0nXtOulaZqfdbTAp/VzpSPtr0fBPJit2yxqTfEJ8ksosRYjalIFBiyjBlx8YkDS0WkOMr6Pu46ryy+nu8cYPgQobal3peEkNxkZGrxB64AfuSDA+VqdWr2HXhPt8A+p9cDzug/+GrHe/Dqt/kfTBmf5LR4K+1sq/Dh/RplBdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gBJwQYWAdp7HzEi53CS9g9yi+HW35tukfTWf58FFzc=;
 b=HOl4P7uN7mkQkmXjpPMXi2UcP2ivEyDMo/zPXNQ7XKhDDnc2NXWPSBAFqQ+6gW5XQluvMcybAibtuERdoLIEzh/Ko2eZ+sWbNmRISflfGdmKJspW1fdcJvgH3Dx41AAM/NDnAFiHbU8dVSfF5oXDrwii0SXA0iprucCRYuO/EkUr8KzWw+Scg9z722BcfmK/G77Sk2GeMKmudXhQ4ySSBlUUN9mtRZ7kRT/py7Xbn/9YifzybEZszz5x37Z+T191yuSQ4EuJDffrYOt3a08zN3IC9+JvwVQxhEeq5/voLz9DOPAeI9Ot6BjMzvaxEFOObJrNbR9MiZo4E4yUM4NsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gBJwQYWAdp7HzEi53CS9g9yi+HW35tukfTWf58FFzc=;
 b=S/s8ihNqP+gdGOICA7ZsdX1hxi1Os5xTfbQiE5Spb0WyKcUeEquQu8b4CHYiaK2bwMT46eiO1PZownI3GLHTZpgYzpBXOM3FExBRKaEMr6no5c/At8YAzhSmbSm26+pZIl64PmZwYDwUJeX3gzQ1XOHivvL9mfMmmqQFes9GJwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2778a487-ec57-4fa5-b6f7-002e97935aef@amd.com>
Date: Thu, 13 Mar 2025 09:33:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm/mpu: Add HYPERVISOR_VIRT_START and avoid a
 check in xen.lds.S
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de7abd6-b57a-4658-9914-08dd6209b4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzNMakVod09aai82VmxXUnQwbEF6Qm1TOEpURlBXaDhmSHBxZ0tEK1ZnMWdh?=
 =?utf-8?B?S3ZQWnNTcURLS2M3N0Q2a2VFSVpHR0Y1ZllKS2dMeVp6elIrcjlRK1hOUDJV?=
 =?utf-8?B?b0RZSEpwYmlXMnE4OXJEZUlpN25tMkVEdERDK1ZsSFFUcW5NeFJBS3ZBb1p2?=
 =?utf-8?B?QW9RU09SSWl2SlgvbEtGV29xRmxHaG14aTNxc3JpeXljUHlVTi8zZGo1a3FS?=
 =?utf-8?B?QXVBKzloRlMrWVBSbUNHZTF6TU01SGZIdG9zR1FzUkF4MXF2eWdYd2tqK0Fp?=
 =?utf-8?B?alFlalFEaU1hcHR3MnF4VGpMMDZhVmRSTHJQeXQrU0FYZW1vbGMvbTdXRjBw?=
 =?utf-8?B?L2N0RXdHMm1wZDZxKzJRNU15YXdyZnl4K2QvOWJERjd0ZVdDSjFBUE1nRmNT?=
 =?utf-8?B?TE44a1Fkck1ONU5WeDQ2d1lpM1pXRXVBOXlSUGd3L1p2czJrZk1qKzFsV2dE?=
 =?utf-8?B?QUh4bk1wV1hCb2ZuOHdBNGNwWFpZNS9CZjBTczJRa0VBR0FMN0RuRXpiM3ZB?=
 =?utf-8?B?U25ObXFsVjgycVRMYUplbGlvdTg2N2d6RzNiajJRQ3NYbStCZm4vNEprT0V3?=
 =?utf-8?B?aE9JUWg0eDQ3M0QyRHUxaTZwMzhjTEdWVG9PVnN2TnlGVWdNTXFEb3VGOGlZ?=
 =?utf-8?B?UE9tMEw1S1B0ZmIwZWxld3J3aDhQOVJmdTR0Qkd1TU9PdFBQY1NIQ042UXNw?=
 =?utf-8?B?R1ZOb0orNmxFQ3NKZGRhMzVMcWJkcU92TGpGcWtXVDBIREs5RXNGYmdkOEZw?=
 =?utf-8?B?NkFUbHpiL2tYelUvSFQwb1hqaURqbTJtUTJlMjh1bEtlanBMcDZJNGhHWXpJ?=
 =?utf-8?B?YzA2WnpRZFZ1Z3F0Zkp6VlN3NEtXeFBwSnhaRGJoVWgxbElsZC9jQ0ExVzFZ?=
 =?utf-8?B?UjYzd0FnaHFBa0ZZckRvUkVNVWJWV3V2L1I3Vm9sN2lMajQ4TVc1ZzdWYkRn?=
 =?utf-8?B?UmExYzdnWG1kQmwwY3hwQkpaRmxtdmc3OXlkWVZSUmphakRZSVc0ZG1OSEc3?=
 =?utf-8?B?TDV4UDZuQW1BdlQrMzBsakkyWE5jV0VDQWlJRGFoZEpyUEhQaDg5SDlmOFVW?=
 =?utf-8?B?QldYYVlzQ0tvK0h2eHhBSEpxL3dzUGV3NW1XQjZDeHVNdWZnS3NuT0Z4eTJY?=
 =?utf-8?B?QkhLekFFbFVSYXQ3cGY2bnhvczdOTFRxTFg1ZkwzQWJ5RUE5L3d1a29qM2JK?=
 =?utf-8?B?cXhSU2JkQVV0bnBkUVFlNVdUNi9aVGx6cGgrV0UxVS9Xa0hxckdRZVRFOXVp?=
 =?utf-8?B?a283VDErMlFySmZuMkZEc05xWkUxNjA0TGRkZExSN0JSZHhPamVWMktsaHNi?=
 =?utf-8?B?bGI2YVBTM3FiWnJNUVVuSXVYRkwvTjd2ckMvcUZ2SW04R3JERjlNK00xUXN1?=
 =?utf-8?B?YnE0eWJDekNBZTkxSGhoN2dMVWJMa2RIeVoralZGejJNQytIV3BMMFBhUlFF?=
 =?utf-8?B?Wk9neUdPSGRRZVptQ1Uzd25IbktFanNEUTNqZno4VVZ6dS95cStOQllVY25S?=
 =?utf-8?B?TGkvUTBXeHNFUUpOSlhzM3VOc2kvbGljVGE4NVNwNlRLQU9ZQXRDZGlhbXF6?=
 =?utf-8?B?Mm9HRFpJcy9JN1BZVUpCY2Q5RXZRQ2UzOWZSYmZlK1N6WVEramhXcXV2blZI?=
 =?utf-8?B?YnFiUDcwOGdpRWZGRFZWVFhnWHNHaW5vL3dyZUtSK3dyNVJPSm55QTRSRGF0?=
 =?utf-8?B?RXVBcit2YlhtUkN2SkVEZjR2cDBFL3pNM1ZPaW80NWFEelJLeHFvRDZKcHJl?=
 =?utf-8?B?M2puSC9MWkI0dm9Ibk0zYitnU0JteFdNLzZMQVYveHJBZktZVVp3aWxBejhC?=
 =?utf-8?B?UmxzT2xOMWVrYVBEZzZOMk16TFVDaVhFWWJ6cmJXd0ppeE1QMndoYXFLajFN?=
 =?utf-8?Q?O8Fu/GkR4HbmH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmtVMVE2NWltQjgzOU4rekpvRkRtNlg4dlNjMTR6OEdjTUN3cHlmWUhpU1Vw?=
 =?utf-8?B?NXY4bmRNaGpTK3I4YnlOTTJYaHNSRktIakRnQk1CRHhneU5MWUx4bjhNSjZX?=
 =?utf-8?B?UXFMWUZhSitIdlQ4SjIrN3pJOWJsR0xPemYreUdCOFhScGlTVVZDWGFjKysr?=
 =?utf-8?B?RWMzZEtzcGNMcjREUEN0eHdob1BkZ3M0VVRJRG4wQitoT0FrZlZIeVB2dnNT?=
 =?utf-8?B?RFhwL3p4eVBmWU1vQkRUb21yMm0rdEJrQjMxejBVL0NsdWlzRGk1dlAvTVZp?=
 =?utf-8?B?MEhjbnJSRjBBTTl5dDBDZy9pVGxNYmNXSzNRUm5RQm5YYXY5Y3BxTVluRHlL?=
 =?utf-8?B?U2dVOUFwVFdYY0lRY0gydDdyR3FRbSs4eXVESWZiaUhXQ29iZWgvZTNkbTJx?=
 =?utf-8?B?WmNMV2J0U0hOakZod1N5NkxTTm0xTlNUa29kN3F5RmNOYmxxY0JaeXpMbThp?=
 =?utf-8?B?akM1dDU2ajhMUEdnb1FQbVJ6dFl0R2Jvb2M0WFVGVkUzNm5jeU5MY1poeVQ0?=
 =?utf-8?B?a1VJM1NvTkx2bEhwQlk5eDZjT0ZLT0ZFZWtpbm9tZGlOUFgxZlFyK2lkcDcv?=
 =?utf-8?B?Q3RrODllRVNsMktrLzdsMG1FUnd5MnN1VVFVS0dVRXNTeFMzelRGNHQ3Vngw?=
 =?utf-8?B?aElZM2xhQXNqWHVIa2g5bU1ZT2tMWmJnS0JoeUUzaFVXWFpUNTdkVGxENlVD?=
 =?utf-8?B?ajZtRDFYSGdZeDZ0Q3VBVVFZZ0QvekExODFjeWFqcUNqVFZaeENHZDZGNU5C?=
 =?utf-8?B?V2NUV0V1cGg4ZHBPTHR5bXVTaXB3WkE0YlJMVEtsYTYzcXlhOEg1S05vRE1H?=
 =?utf-8?B?UUZZMEdVWldraHY1TjlaVGFJNUNBS01nQk5NSnduVlp3NWRhMm9NRDBmcVRM?=
 =?utf-8?B?Wjk5LzMvS2ZELzhUMGxSWnFoRlZIWHZGNDdEOU52bHV6ajBPNWJKUkxBeVZN?=
 =?utf-8?B?WE9FRlhOMktGK29EY3dVQ2V2U0cyZ2lrUEZFMnRmaWFvbXROU3RxSDlFTnBD?=
 =?utf-8?B?eVZVSk56OXV2bnJTajE5bnpZclUrUlNRVndJVVlyR0ROY29Gb0I1TlIrY1c0?=
 =?utf-8?B?R014d2tZS0ttNXRPWTlqSWY2SWRaQVdnTjlLN0c2OHB3SXJJd1dXRmhoVmVH?=
 =?utf-8?B?bktMNzdOby9MQ3c5amFlU3lpcjBiUzl1M0FlYUwxNFJ3cnF2ZURzWXdsTm55?=
 =?utf-8?B?TVg5RWt3dTEvSmNxY0VFc1dNRy9yMGQ0SG5MMGdaNVM2S3FnSFdEeDNLZzVo?=
 =?utf-8?B?cUFDeFNZOGltLzJOcG1RcjNFMXdSRHpyTWNWcEVNazk0L1BQNTJPRkdUWG1Y?=
 =?utf-8?B?SjVKRWFtVGlxK2ZoL1BYbzcwNlBKSjM5eU1RZExqcTc0UFVDZ3FGeHkxeDRF?=
 =?utf-8?B?VlRFem9EMW1jNXB3UTRmK3dYeHVsV2lPZm1nODJBclRiQzJTZjAwWWRZZ0Uy?=
 =?utf-8?B?OG96QWtsWnBVMURUOEJmOUx2bTd2cGQvbHBENDJTYXRPQUpNeGtNS2w1RDZS?=
 =?utf-8?B?aTVLQndNTEdqR1pOMjQzbUhQdkRBbUhJbXFsb3hmdDZKN0ZJV0toaTNENHAr?=
 =?utf-8?B?VExzTmFDN05EQkNpSDlMQkVlRDE4RThvRHRKaGZGWVZ2SjZDRnl3UUhERXVi?=
 =?utf-8?B?S2FxakNhZENOdkFFeUNqcTBJRkRCbmdidWpKdEJKbWRZWHVEVVpxMnFITVRp?=
 =?utf-8?B?YmtzVld1RjBJZ1NGYnFYZTFSL0g1TnYvSWJ5bkF5ZGQxaGpLaDdvcHR3UWJl?=
 =?utf-8?B?cWYvNGN5b0JRbCtZcDIxY2VHR1dVSEVxem9ZNCtFWW1UVnVRQ0d3a29yTXNk?=
 =?utf-8?B?ZlI3OGFIREJ4VjMrVEFzYkdhOXhHLzZwb1p3aE5PK1NxN2djK0xQVmRoNzRj?=
 =?utf-8?B?akwzY0tkS0NUOVYzNmVGYytMTnUxeWdlc0RVSmJPdTRZUWFwUGZodmVZYzVn?=
 =?utf-8?B?MjRwQlBCODcrb1dVcCtjdjJWTVVMbFlXTkZyL1hiaEdWUWhHRFVNVjdIaWlW?=
 =?utf-8?B?TFNQS3hoS3g0M3JwSTVDdmhhRzZiMmlnMDRJRFFEaVh0VXkweTF0ZTZwakIv?=
 =?utf-8?B?bmhQSnc5WnBtSWRMZDVldUtuUmR1ZlNPNHhqcFdtYjIwblkveEFKc044RGht?=
 =?utf-8?Q?DjQE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de7abd6-b57a-4658-9914-08dd6209b4de
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:33:18.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY33otNJqRgFcNJ6YgN8GigR1gF955JgwnG/xfdYJXnCtasoUGnEuxJ+cKMRRvmo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> The define HYPERVISOR_VIRT_START is required by the common code,
> even if MPU system doesn't use virtual memory, define it in
> mpu/layout.h in order to reuse existing code.
> 
> Disable a check in the linker script for arm for !MMU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


