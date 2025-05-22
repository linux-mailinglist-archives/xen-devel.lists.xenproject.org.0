Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93909AC087B
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 11:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993368.1376777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI26n-0007YZ-7t; Thu, 22 May 2025 09:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993368.1376777; Thu, 22 May 2025 09:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI26n-0007Wr-4y; Thu, 22 May 2025 09:21:01 +0000
Received: by outflank-mailman (input) for mailman id 993368;
 Thu, 22 May 2025 09:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI26l-0007Wl-Cj
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 09:20:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112a2d41-36ee-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 11:20:57 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Thu, 22 May
 2025 09:20:53 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:20:53 +0000
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
X-Inumbo-ID: 112a2d41-36ee-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZpqB+IEqmNuKsWHSdAbdXT5qf2ZJd0FAzXKrpX1fCrBsBkdkwbY0fGOMuTEsR45DeTIVq55RsyzJAXUaUUbSPYYOYefr23Eit/JcjpIlMp+reJZsa2KVjqVcPvhlI/Xy7cLNSJJRw3aRjftnXHPFuB8gCjdeXjsx4pqikpWIUorn7bewRT/UlSJVevf3mkOfuzxCM164ppCsj1OF+V9qhqSgaYmCfe134BA+m53Q9gOSlcd9w0WbjlkmSyz6VDcFkM5YBOujfldiJLa8E7LVsjhJM9QywynRWSWFFRmdyex1qruRR9FLVflwgj6PdBPeBHOWxCtH302vGZ+t6fkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8XG4OOXNchFg9Equ0G+30Oudv+/TFxJK7M+IMtNX5I=;
 b=bcyxpicYYuiRb5KJsijekUnMntGlgG3J9+I1cdEc6EA1zaniJhkKpEjZ5JcQxKkj6E2dJYcNIyD8x9jKhHQmP72db6Y9mbW2sTsQ2iCeM5VRs8g8O06Xvm7Jky1F1T/9lhGa9z2yiz8XVADSQnREuRMVKL/ZF7oj50bHZ2eFd4+0cVyA5yODcALF1r6jsx9wDzLgDY06rDQQM19aCRP8ouFG5lA9ggOmSxQ5DqBe0SBr/lfvJlgGy6IdzlzQKgAnGW2pgd00ck2iiG0Ax+6Wyo0APe3W0JEFbVk84Ls56tS9LZudRg0tHr4wU0EwMcX4uDa+vSd/EoaH5PavIZuy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8XG4OOXNchFg9Equ0G+30Oudv+/TFxJK7M+IMtNX5I=;
 b=jflJaMy0Cpm125m8IThqIqnYpQ0LUGyfLlckzPxgWz4UbBQ2+4Xxk9cQqiVYaXEbJBzxN/mLjHMZg0/llK3Dbwrzoxu/KUJwDVgbyw9gji5LYiwiAlz++o81ly9KWV1YvKZDNl4E7Ks+8KmGP3kBjNGA9bU1fballkCcflc2XeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dfbac65f-ed9d-4118-b6d3-238b075961ba@amd.com>
Date: Thu, 22 May 2025 11:20:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm/mpu: Provide a constructor for pr_t type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-7-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250513084532.4059388-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: cc469aff-0048-4e68-2e10-08dd9911f350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2tXYll2dnFYZlcyK2VKKzJ6UG5hdG9QbnNPNUxYcnNoTnlzMVo3NTllS1lh?=
 =?utf-8?B?RVc1bU1hck5RcU9vY0JFck5Va3JONjZFc2xzNS80NG51NDZ4VXFETW0xMFh2?=
 =?utf-8?B?bThVYk1sczRKaW1WQlVwUWRhdm0wQ0UwdDJxc3l3d2tNekRuU01lbFoxWTVL?=
 =?utf-8?B?NjFMU1hMZThDUG10TE9RYzFRSnZIeHhvNVhJeXV5c3FvNWxUakd0Q1hFNm1T?=
 =?utf-8?B?dGt1d0tYM0c3a2J3aUNuTlYrMURQUzJZVUxaRWVTQSs0aU9uY2xzenJvWkd1?=
 =?utf-8?B?dUpBYXkxNUpXT1ZyMzhKSG1vMENpMjY4NWN3SlVrVnJUVFh2bnpLTEhiY1hC?=
 =?utf-8?B?dnNKUTh2WHZ0YlFybi9NMkJTbkkvSEE0ZnIydVl5SlhtMkdZaHMxTS9NeGFh?=
 =?utf-8?B?cjBaeEVmRlFneEFnTHlpaS95bTlycHJwc0xpcVBWcVZBY1c5SjluTjFXc2sv?=
 =?utf-8?B?UkpoZmxacURMdCtwSXRDTk0xVEg2dmF2MU1sYkdENUdxaDczRVh4dlRaYlVw?=
 =?utf-8?B?bUNOekwzMmowaStBYm92OEV6STdMbm94eGEzNXZyemxEOTcwK1FZZ2JYcWNw?=
 =?utf-8?B?clNXQzg1S3l2NzhxdjZhWDltbmZYcUJVQWRlY0swcUNwRGhBMndKdWxpa3R0?=
 =?utf-8?B?K202NXZ2dEVUUUtyR2FyUHN6VUprYzVIMnZZQ09lWlpNcUVvZElQWmQyTFEz?=
 =?utf-8?B?a1J3K213RXMwWXpVbURsRHc1SFZTUHBxM0JBczRqc0JUcXFLZ250Rm1xVmxN?=
 =?utf-8?B?MW1yOVVCbmRQUW9rSUZYNDAwRTR2eGVEQjNNZGgyekQzeHJobWdiamJDeVFC?=
 =?utf-8?B?Q01NM0hBV3N3Q3lDWk9tS1JTcTVCcWtTeXZ5SUdEbWYzQXNSakgzc2J3QnpP?=
 =?utf-8?B?bFhvRVBmdnY1bjVsVU9nZ08wMnJoMVE1c2dvemNXSzAvb25mVHRnZVZrM0hP?=
 =?utf-8?B?Y1ozdnB4d0d1U3RPbmlnSjM2Ujlwd2hhL3NaR2llbi9SSGZQaG5RR25nRGpM?=
 =?utf-8?B?d0VvLzBwRGRpSHloV1Y5am50bmgzL08zRDhjZ0o0bVJpdjdkVFdyaDErdkg1?=
 =?utf-8?B?NmRoM1lqSVRtUlFyTGpJQllGNENpMEpHYVRxTWxSY0tLTEF1d3hPck5NSEVL?=
 =?utf-8?B?eU1iWXlOYW1OSXUyOS9GUDlZY1NYYVlCajVRamRXTnR3Z3IwOHYwVURJSFVX?=
 =?utf-8?B?eXZ4K2lsclB6azFnV1dYNXZJelVXSzhiYmRHZC9lKzhDdzJwTEdBZXNWVDMr?=
 =?utf-8?B?QloyWGlyLzZjOVlQcko1TUd0bW5sTkNJWEI1Qjkrc2tOcHgraUU1NjhqNGNF?=
 =?utf-8?B?bnluMzhNNUljbVNCS2lrdzQ4MXZMeXh0aUxIMjYvUDgyUTVtUXkzQktVY0RB?=
 =?utf-8?B?WlBpSmxCMGZiWExNSWdCRFFVeEZSUVluUE1ISS9hWlkyTVI5MC8wTm1STTIy?=
 =?utf-8?B?TUsrc0ZNeVp2VVY4VXFHZ0JYV1I0US9aRm5GMHE3dTdnbHpMTkcwbFE0RnBi?=
 =?utf-8?B?WWVOUDhRS291ZXNSeEtrcGxMOWduUjVmRUZha09FU1J2ejhuQkgrSEg3MnV4?=
 =?utf-8?B?Y3A0TE1lT1RmMmxaZ0lhSjVIYlM3RkJaRm42aXJpYzhYTGpPeVkya1ZFeFI3?=
 =?utf-8?B?V1hHdHB6R2psSXRIUWhWejFXNFFGQlA3bzBFdGgwZzd2bHhwU1Z6cVAxMm9i?=
 =?utf-8?B?NGM3TVZoeGVyMFlxVEpJZzc5UGVCN29xSTBsYWJoTndjVVZTQllhSVBUL0VG?=
 =?utf-8?B?NDJlOGcreUx5K0EvM3dpYnNKNzk2TkFicTJIWHpQQmtQMmdiWTA4REdLa0tt?=
 =?utf-8?B?bExZZ2RLdFkwWnhSY2UwOXRMTTVZQzd2TjhhbHVFdGNwc2FiZTRGSHVFajQw?=
 =?utf-8?B?NjZOd24rQW1ZREFMVC81bFpoQXl0T1A2RTlnTWcrSHlacVRiOUhzWFYrbDdY?=
 =?utf-8?Q?afrrkgF9kbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjNKN2I3dkN3Q25jOS96MURHMXdFRGlscGdvL0JETmYwZHBzbzBkL3NlVEo0?=
 =?utf-8?B?eTVMRDNnbkdSNXpPSzFDeXFJOTRuRmozMUdRdGc0cDRObkVWMERpQUVaSTRX?=
 =?utf-8?B?bkdTOVJqWitHa3h6YzFKVCt6ZURPQ0g1eWI0NGFpTUU3T24zTGJLS1lmTjY3?=
 =?utf-8?B?SHEvQTA2Tm9zNFBwaDc0OFB4bkdOVWxoc3kvMHh5NVVPc1ZwRUpJSUJKQity?=
 =?utf-8?B?eEZvVjd0L0NLU1RvWkV3WWNGRERyZGxWMGNRWW9XZHpTN051V0M4c3ptUW5C?=
 =?utf-8?B?LzcwYWRaaDhRSlFKSFRGL0xmV1Blckl0RGRCOEJ4TDB2NExMREdqeWtwNU5Z?=
 =?utf-8?B?NFFkcVV2TCtHTU9rdmZLZHFWaDBiNGE0eWlvUHJxNTEzcTlHU09yMFB0aXFj?=
 =?utf-8?B?d3dQQWIyeklkZE1OZnd6S3ZsamFxdWxqdXFDd29BS2IwOGs3SkV5WFFZU09v?=
 =?utf-8?B?TnpPNE5GeThCaS9UR2RYdlBZSW1uUUU2ZkEyV2RxQmR5TVl3RnovNHdRWFhO?=
 =?utf-8?B?R0Z3WXcxNTdCTDZxcElIem1YcndFMVZ4eDZQNnBiYXlBSkdKdzY5Szg1ZDFD?=
 =?utf-8?B?M1h4U2hQQ200S08xeTZkZHVkV2NpeFhXZC85cmFYRTI4WXB0VnArdUdnNWZ5?=
 =?utf-8?B?aUYzSHNndm9xMDB0REhWdExyNGIzTWd0RFVweG5kVlRXbEE3RjlFNnNQWTh2?=
 =?utf-8?B?bnJzZkRZVEFUVUFkd29mZVpldjFZOURGYWhDM3Z1VXc3RUdUakJBV3ExamIy?=
 =?utf-8?B?WEhHa3JOR3dWR1dCcERLYjBXWVBsZktZYnZRWXBwc2dPMlVwMTZhVTZHcE4v?=
 =?utf-8?B?NzZxRGRkUkdsMDdzcWFPN3VPUHNaSjVzYXpCY1orQjVuWC9VOUxEUkkvV2s5?=
 =?utf-8?B?WDY2QlNyc2JzS0lGM1JNMzVjM1pvcjh6YXF5OU1Ydk9EWEdZMGtHaXFMdmlT?=
 =?utf-8?B?Y3M3dkcxR1dSMUFXN0hGMERpY3Z1N2VHbEM2c0tEdGw1UC9nN0VRZC9nL0JM?=
 =?utf-8?B?ajVPUnExRGQ0RktLYUc5YkgyYlZTL0lYRDRLUnVIVC9VSVBYZmRreGtGS0Zm?=
 =?utf-8?B?U3kwdTNCeU4wQXY4TGd6eFA1NTRqRVJIQWZJUVBxbm9ZbXNWM0xEbmhhaVpq?=
 =?utf-8?B?WE1vdW1XMnVZcmlpSTd0cU9icmxyYkM2S0RoYmZsa2drQS84aEhKdXh3b3BC?=
 =?utf-8?B?R3BISTBCUUhPUGdtY2VuYXJYMmMraXl0MDU4TkQ2bXlab3RkK0VnL1ZCRFFp?=
 =?utf-8?B?YUd0MWlWYTdkWXZtd1dPRjR6cVZ3VW5YU3BYUDQ5QkZvVkMyRDB3cjhlM1lL?=
 =?utf-8?B?ZW1YV2orbXlmR3NnanU4R0FwbnZ5U1gvWTJpdjlxQjdLVi85ZVI5bHRVcWpp?=
 =?utf-8?B?VGNzVWowZVpldFo3TUNWdGU5Zzh4WkVMZnB2Y0dpcmJYTVlpcC9lQ3NLTkl0?=
 =?utf-8?B?aGMwajFuWE01NGtBSEdWQUl0bjRmSjIyUlFXNkVOQzE2aVpSMVM3bktNd0Nm?=
 =?utf-8?B?L1d2NFIrZzZMS0VaM21vdE9BWlpMYUUzbVBlUUZRWTFYZkxKOXNlTmJHcTFX?=
 =?utf-8?B?V2dNZFZGWkxaendhN0k5WVhFb25PcmNzWmFKcEJiNGRWMkFoSFlkVVNIMFAv?=
 =?utf-8?B?UFJXU3d5MzFlclN3R3JYOGhOdEdPd3RzbUIvNlNFdDdZNy9tR2ppdUVEY2or?=
 =?utf-8?B?eDRFNmd5d1BnbkNTeWpjV2xmVDlSU2VRTFp5TjZmamhEczlCK1B0ZnNHQkpH?=
 =?utf-8?B?NW1qZWhMbFJXNjVmUkdWVW9OUnVVb3JlZ3ZsMnU2ZS9QditEZ01YcmRHcnZo?=
 =?utf-8?B?ZzJaS1BiSEM3V3dXWjBsOWNsTHBjOXlIcW1TYTJMcSt5SjI3SmVSYUViT1Zv?=
 =?utf-8?B?RnFXUUZXK1A5Sit3NzQwODl5bHBvUlRKVHA3TklmUnJMYTQ5bUpURDJpS1g1?=
 =?utf-8?B?bkNDaFNuNkdvZEVlM0Zpd3NVeGZnQWQ2N2hMdkFpRFZMU2pLcU50U3lZVHls?=
 =?utf-8?B?eHhHSzdweWEvRzhmcEVFaFFSQTFSa2UzSVJaY2NKUFJzVGcwTC9sOHFmQXNp?=
 =?utf-8?B?SjZaNEVzNnRTUDlxcVNoUC9NUWdidHNMWjZ3VU02em0vY3V0QVViaEFNekJn?=
 =?utf-8?Q?2dDZIIQe6mnrHFrB9TCNgSUcu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc469aff-0048-4e68-2e10-08dd9911f350
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:20:53.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7JfIZTuLkQ1W+BB9iKAmLQfthu66heLPCIxA4KCl2RbkKj+UHgwwki4u4x+3bP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337



On 13/05/2025 10:45, Luca Fancellu wrote:
> Provide a function that creates a pr_t object from a memory
> range and some attributes.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v5 changes:
>  - removed AP_RW_EL2 used only by pr_of_xenaddr(), fixed
>    comments and typos
>  - Given some comments to the page.h flags and modifications
>    to the prbar_t fields ap, xn, the constructor now takes
>    flags instead of attr_idx, which I believe it's better,
>    deleted PRBAR_EL2_XN_ENABLED since now the PAGE_XN_MASK()
>    is used instead.
>  - renamed to pr_of_addr since it will be used also in p2m
> v4 changes:
>  - update helper comments
>  - rename XN_EL2_ENABLED to PRBAR_EL2_XN_ENABLED
>  - protected pr_of_xenaddr() with #ifdef Arm64 until Arm32
>    can build with it
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 10 +++++
>  xen/arch/arm/mpu/mm.c             | 66 +++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 2ee908801665..f0facee51692 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -75,6 +75,16 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
>   */
>  void write_protection_region(const pr_t *pr_write, uint8_t sel);
>  
> +/*
> + * Creates a pr_t structure describing a protection region.
> + *
> + * @base: base address as base of the protection region.
> + * @limit: exclusive address as limit of the protection region.
> + * @flags: memory flags for the mapping.
> + * @return: pr_t structure describing a protection region.
> + */
> +pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 46883cbd4af9..ac83227e607e 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -9,6 +9,7 @@
>  #include <xen/types.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
> +#include <asm/page.h>
>  #include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
> @@ -153,6 +154,71 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>          BUG(); /* Can't happen */
>      }
>  }
> +
> +pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    unsigned int attr_idx = PAGE_AI_MASK(flags);
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    /* Build up value for PRBAR_EL2. */
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .ro = PAGE_RO_MASK(flags),
> +            .xn = PAGE_XN_MASK(flags),
Shouldn't you also initialize .xn_0 and .ap_0 or you rely on compound literal
implicit zero initialization of unspecified fields? But then you do initialize
.ns to 0 fror prlar...

> +        }};
> +
> +    switch ( attr_idx )
> +    {
> +    /*
> +     * ARM ARM: Shareable, Inner Shareable, and Outer Shareable Normal memory
> +     * (DDI 0487L.a B2.10.1.1.1 Note section):
> +     *
> +     * Because all data accesses to Non-cacheable locations are data coherent
> +     * to all observers, Non-cacheable locations are always treated as Outer
> +     * Shareable
> +     *
> +     * ARM ARM: Device memory (DDI 0487L.a B2.10.2)
> +     *
> +     * All of these memory types have the following properties:
> +     * [...]
> +     *  - Data accesses to memory locations are coherent for all observers in
> +     *    the system, and correspondingly are treated as being Outer Shareable
> +     */
> +    case MT_NORMAL_NC:
> +        /* Fall through */
> +    case MT_DEVICE_nGnRnE:
> +        /* Fall through */
> +    case MT_DEVICE_nGnRE:
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    default:
> +        /* Xen mappings are SMP coherent */
> +        prbar.reg.sh = LPAE_SH_INNER;
> +        break;
> +    }
> +
> +    /* Build up value for PRLAR_EL2. */
> +    prlar = (prlar_t) {
> +        .reg = {
> +            .ns = 0,        /* Hyp mode is in secure world */
> +            .ai = attr_idx,
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    /* Build up MPU memory region. */
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /* Set base address and limit address. */
> +    pr_set_base(&region, base);
> +    pr_set_limit(&region, limit);
> +
> +    return region;
> +}
>  #endif
>  
>  void __init setup_mm(void)

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


