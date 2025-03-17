Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544DA6481F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916491.1321572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu77p-0004R7-Nj; Mon, 17 Mar 2025 09:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916491.1321572; Mon, 17 Mar 2025 09:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu77p-0004OG-Ib; Mon, 17 Mar 2025 09:51:13 +0000
Received: by outflank-mailman (input) for mailman id 916491;
 Mon, 17 Mar 2025 09:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu77o-0004Mg-HM
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:51:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2415::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5984b6df-0315-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:51:11 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:51:06 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:51:05 +0000
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
X-Inumbo-ID: 5984b6df-0315-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkPll5JyVprj/Ci9UU11/YOKc+iDTGhAB6goNmGKl8s/uTytQfWylRoORktsWRoNvJIjW/KLl7xJ+SIhyZmcJFiEDoRSC0EMrfQIpizGLLh3BTTRX5ORbGOZgipcCqTGNpne60Q06HMl79e3ZLqLXnd1uBIMRoCeEzpC8GLh7J/HW0AytGB0fot7pYcJ0FVinPcTVLWFu6an4EU8vfuUONtfH1KwM9snlRB0SyafK/eNQHxBgCPBwTV7xfAv4oNyH9NNjjNS2XLxvewopx/do2GN/YKnF5Pvo+QGZYoP6fWdX5qj4BfoNB+2ieaHm3NNurY5J/tGCskLPyVLwsLzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd5wRmxm4lkPwmTkymPkBWIRcWq6kk8FWC//PTGNJtc=;
 b=DioOAjwUBpLgw0zQQvGAE7F7J8GRbi5clGPo9lZQ5Ry1AN3iVdAf1hI3ZPAUEyV40BILADmGkPvsPRwWv9YKifS/rrEJhhO2BIPZjSY8QODbcnypMaT1U2BukiTg4CYsMc3FR1iUwiHd2KMKDanpxADmVMQumYhYmGoWQeHjbHBB516IgMqKJOGdoe+QGsAsFwAoyM2ZHtz35itQypxb0NzbTYQu9yuANoi4mRORKf35GYBI1fGHqi9WNxeL2KzjBIx7Li5NnldA6fneo70e7SFo+BKftJ1kf0Ij+jxnyktzDQEjk352Sfx107yyrkZWU6qfcvAwHACQxEE8NgVwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd5wRmxm4lkPwmTkymPkBWIRcWq6kk8FWC//PTGNJtc=;
 b=HF4MXpt2JoW/hVmEHeANtQcPtahQu4/8t21YUl1jKyppz83Ywxcr2WRYhelvBZIHLXJqlfUNiId857dCmdhiaQEuB4vVGeTOfiOv9NpTsQkuKfR6v6Q51fw9BWULy/J1CiNQp/0UFfn/Cz1jhNkbaUfsN0bAsPD9xp7glmyW8fI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4247ad5a-dd96-4dca-aff0-abe6a2fd0aaa@amd.com>
Date: Mon, 17 Mar 2025 10:51:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-4-luca.fancellu@arm.com>
 <799e2b1a-aea8-43d4-99bb-eab4fd4f6b93@amd.com>
 <5CDD6327-BCC1-4383-ACDE-19B75C085631@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5CDD6327-BCC1-4383-ACDE-19B75C085631@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a8ef78-c76c-4bf8-3184-08dd65393be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S25kdUJBbE1aVldNMk83L1Jjb0pJQzNMS2YycC9hdGFRUGNWSnRPYlVqelNW?=
 =?utf-8?B?Y3Y0c1g3YlFOMVJqVVNidGFNaHJ5Vm5BczRJN3oyRzR5NllPRWhyUHNyZVF5?=
 =?utf-8?B?Y1paaE9TNnl5aVYrNnBkY04xZzE2RVk0TmVrcWx1OUZTQnp6WUU4QkVCdzB6?=
 =?utf-8?B?cWtsKzUweHJjTTFoWGRlVjVFMDNkcmhXcEVkV3lvQzJia1FKWW93YzNySjd6?=
 =?utf-8?B?TWcwVEVSL0k1amRmZlg0aG13L3ZpbHFjbEFNR1BCYnhaQXhhT3UxYm5Hb3BM?=
 =?utf-8?B?ZGtWbDdWcTJTRWNlNWtvR3d5aFkvNkxuZnVrSVF6QWhWNUgyT2pzbDdMeGIz?=
 =?utf-8?B?bk9sZDQweFRieUhGZzBCbWo0aURlcEpxYXk1b0xRQlFrMzVreHZBVFBJWklX?=
 =?utf-8?B?b0lCTEFhSGZVTmZ2Y3NqSGt1UlBQbUNNanUvTUFuQzBNL0hGdWd0OVkrTVhS?=
 =?utf-8?B?eFdTaDNXcGdwaG9iUnpReDRKdVpVRTVvVXFZOWJwSnZFYUxKMjJFNmN0Y0I0?=
 =?utf-8?B?bHFsUldNVU5JSWdRcVl2T0FTYXA2ZGNKK21sVWhNbjZwUkk4Nzd0cGFBejRj?=
 =?utf-8?B?M0RWVWZMQjZDbmZ0OExNTHBHRGNYUU1adWttZWFhVEo2MTBYdXlDYUgwdXQx?=
 =?utf-8?B?Mjl4dWdCZDk4MkFKUExsMTErZTExTU92VlMrWEVOeTQwaFVSeEhFeGpZZy9y?=
 =?utf-8?B?ekdzQ3dYZWN5ajRwWE5td2R4RGhnZGc3RTRwYzZsSlVjUzFvWE5UZGpJaEY3?=
 =?utf-8?B?ZjZNVGxSL2ZqRHpkZTZuMmZVUHo2K0ROcWl4Q04wN2cva1l1aFdMZmFTZzZz?=
 =?utf-8?B?NWoweE9SK0Y4bWhXMktCakU3NlNYOGJCL1hKWUsxNjlhYTNtcUZhS2ZHM0pq?=
 =?utf-8?B?NFovRUJaVDREaUlsOUZDOUxjQ29FOTNyZXlBOFFvbEJEVzluSDR6UUxmYWlI?=
 =?utf-8?B?YWptK2N1SHhUMC9lbFZOaFA0dzNuNy8zVFlCaEViL3Z3MkpobnRWRDAxbWZs?=
 =?utf-8?B?amN1UlVDbHlkc2RBM0NVSWMwNzBZSXlxWXVYWnRHTFV3eHJPUEI4Uy9lTm50?=
 =?utf-8?B?MDdaSnQxR2Z4TUdqaW1VRHRrZ0NvaExjR2tlS0lxdjk5aTRiSEEwdG91WnFM?=
 =?utf-8?B?UUxvRmpRUEVvQ29SVHNXZDFaNlE1dFpJSEVqc1VGV3FjL0J4SzRRd2pFc1pQ?=
 =?utf-8?B?WEpqT3hPdnhkV3RWblk4bWwyTEI3VW1SUTBKcWRZOFZiaWdxU1VQWU00bkJm?=
 =?utf-8?B?Tkl3OWlHbVFQYWhJSEhpUkYyaG9laGk0cUVrOGV2T2FzMGc1dm1OVVdvWGpE?=
 =?utf-8?B?UzlxOFo0SktnMmVyR3hCREdtcmNOZUNCNEozUFlnUDVnM09PV01wT0QzN2tS?=
 =?utf-8?B?TW85N3hIM3NZcHR3MTVBdmtzQnVvN1V1UjZTbStCREptUXlwVjhVNzJXQmJF?=
 =?utf-8?B?dEczUjNDYVI2NVdFM0s0WDdySU9lV3pLSHVsMHd6N2VlQmNpbEpYa1FMZE1r?=
 =?utf-8?B?NjhrWUFjQTU5SUVya2JyZDA2VkVRMEsyNkpNb1NBTG5JS2haOVhnb0Q0Smg4?=
 =?utf-8?B?MDJvLzNSa29SaVh1QnVGUEZZYmlUd0NmUUk0Y2ZML3F6a1I1YStvTnE2VWhw?=
 =?utf-8?B?MkZiWldCOHg4aHovZEh5dGx4Qng4c2lqYlJURHNSRWJXYWFiTng5STNlYkln?=
 =?utf-8?B?SHhSaDVWQmNPMFZGdnArTjVEbUFFZHAxVGlWUmdNTFp4S3FZVE1pUVNFRG5l?=
 =?utf-8?B?a3IxeEFHYjJHYUF1WUczMkNxcGRpbm9TS0FLUUFUR3JiNkNsWHZLWFlzQ0hq?=
 =?utf-8?B?L1U2Ujd5aitpa1BKdEVSM2xrRHU3VmhHbC82dHM1dHI4bnFyNCs2UkdzcUpU?=
 =?utf-8?Q?m1IkvUPjgCqQ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0xvMGFWMEZ2aENlV0ZDMGg2Sk4rTnRyTGV1eWdnMVJIUzU2by9SMDd0R1FE?=
 =?utf-8?B?dUsxWXE1SFl3VGRjQy96ZEVjY0ZMSXRkUHM5OGVJM2E4R0FhalpQS2pTd0tK?=
 =?utf-8?B?V3F1NUthS3NtWFRUU09QaW93Z0RRN2ZoQ2R6b0VqVWtLT2Faam5pNXhLWkt0?=
 =?utf-8?B?U1dDeDF1c01YdHNBcWxINkJKbVU5YzZVRFM4ZldpQzZjVGRpaE1WR1VNRUJ1?=
 =?utf-8?B?QUJybHArM2ZSUDJIV3VBaE1vTUp2R2E1ajFoMXFZc0FCcklpRm40bTRvdm5L?=
 =?utf-8?B?Zm5HNWIwNDZzSlRkejVySm16aHRLSnk5eWJJaXV5YU1FYnM5YmhOZFlNcmtH?=
 =?utf-8?B?T1J2N05DQVVZM2Z6V1NKaHJEMHZmemhxM01FWGtGd3YweDJrTFl4eEVvZndH?=
 =?utf-8?B?aU8zcERGZWdhYVBCdWhVSU56MUVKdVdOSE50RUpJVHFpc0tmSjRUcVRhRlFW?=
 =?utf-8?B?R2FzTDlsN1g0bUc1MzE1VnQ1NlpuUGIxY1hLV0kzbkhVRzc5THpNRDBMbGxv?=
 =?utf-8?B?aUJsVU9VWU9JWUdwQWFkcVlvVWdMVDdUbXpjTk5tczhmM3g2Yjc0MmVSSkU5?=
 =?utf-8?B?WGk1SkZPbXdoWjlxa3dYNU5CWkNoRzJxV0ZyTTA3RXVNaklyYm1RMzZDOVI5?=
 =?utf-8?B?MytnTi9EMGM2OXhwMDdRTW14WG9zQ0JaV3YwZXNJY2s0MDQwYTZtU1pqUjNO?=
 =?utf-8?B?TFJ3Q2FxMjlkRktKYkZvN3Z6aUZYbGRpV21BbXVJMldqZkthTFpZSzU5Vld3?=
 =?utf-8?B?dFNoeHMrMnBlcndaT1VOQkt1UzFwa0pPTDZnbkRubC9BeU5uNkM3VFFPNVd4?=
 =?utf-8?B?N0hMS3E4RUUxamo5NE45a3hGZzU1Z2hNeHAxUFlCenRrUU14YkRmRTNRc2hQ?=
 =?utf-8?B?MnM2UEVwWitqWnViWXVNMHVZUWU5bEpMWjdUb3NuVjJ0Wm9yMW1PVGEyMDk2?=
 =?utf-8?B?OEFnV2t1R0ltT05ja3J2MVB6RU1EZUwvZTMrUWwzRVphdnpCNkVYRS9aZ1I0?=
 =?utf-8?B?UVNDb1d5NnlGd1VGbERRWXBuWXlGRzdNajhYaDdKaUpkNUFIOUMzcU5mTzJy?=
 =?utf-8?B?OTA1ZytaNDRUMExJVENnQkNOdDJHMlZ0U2JCODkyd3ZFQnRDdzVsam9LM1Vk?=
 =?utf-8?B?MGZoZ3ZvY2xOZW5IV2dldVhuMldIV3VyRm96cUMwVDIrcXQ5NHM2enIrQll5?=
 =?utf-8?B?eU1mRGlVVWZRM0VyblhPVlpsT3I1Ukk3Z2FQUVVlWUZTNWtRa0wvZWZoWjVK?=
 =?utf-8?B?WmtIR200Ync3OWcyL1lhZm10YnlUSXFLN0t0TUlzZ2lWUmdQMWg3NXpFVEo1?=
 =?utf-8?B?ZDg4a2EySzl5WTNHNk9DTUQzZ0Z0VXh0Y0J6bXQ2enhWNFpaQTkvSU1CMXRu?=
 =?utf-8?B?TWxlZnVzMHlHTHFXNkRaUWx4VGUwM09jU29mR0J5ejBjVERNdThJOG5sTkdq?=
 =?utf-8?B?UDdKWk1GOEp2czdpZVoveDQ4Z28zaGx3Q3Y1MVU4QkdpU1hPWWFpTjhLNmRR?=
 =?utf-8?B?RGVReUFybFVZNmZRcGYwMUhCRlo2K3NZUDI1VGlUQ2lZN2RJWUpNUXE1ZVZJ?=
 =?utf-8?B?UmNiaUdONi9wME85VkZYdEtrcnk3SWtRWE9aUVdSNGZqbHhoNHNqN3ZRemtM?=
 =?utf-8?B?akxENitycWFRSUcvUjd6VjF0STFDNWh3aSt3TjVVOUVGRkl4ZzU1MENEbzBN?=
 =?utf-8?B?UHZJQUY0OHhrbGh6Y3pKakNlUXpVZ3hNN2hTa21Vb0c5NGxwc29DYUdjRmlP?=
 =?utf-8?B?Wlk5WUxxQ1NUR3FTdDRsc3BTVldBWjhiLy9saFZsRjlucHk5ZFNsa2YyK0pq?=
 =?utf-8?B?aFU4bUo2cFJsMWkvaDR3WnRRZXAvMXpZQXlZVFdLVThwcUtzYWszM2hGUmZI?=
 =?utf-8?B?a2k4MzNrNDc4N0RVVFJUd1BqT01yZWZudzBVODlaTnp6cWl4MEYzSGlUYmNT?=
 =?utf-8?B?empSc2pTeTFkbHI4Y3J5ZVJ0a253SGp0K05zYzZOaGpYcjVjLytHNHBQMysx?=
 =?utf-8?B?RWdKWnV0SDdwUkx2eGU5Skp1bTArN0xTd0IyWFRnckp1S01DTGwzcGVCdDEz?=
 =?utf-8?B?c0lKSVRDVDc1bVpQeEZaZXBoRmNtS2oxbDRyNHgyVlVHSVZxS2svL3d2UXlF?=
 =?utf-8?Q?K4Ac=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a8ef78-c76c-4bf8-3184-08dd65393be7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:51:05.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yM0z1pt224lAm9zNbc14GNsLaPe0CKevQwI1B4g7kzOD/mIDlXU5FO6+m6laOA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755



On 17/03/2025 10:33, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 17 Mar 2025, at 09:29, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 16/03/2025 20:24, Luca Fancellu wrote:
>>>
>>>
>>> Introduce frame_table in order to provide the implementation of
>>> virt_to_page for MPU system, move the MMU variant in mmu/mm.h.
>>>
>>> Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
>>> pdx.c, but leave the initialisation of the frame table to a later
>>> stage.
>>> Define FRAMETABLE_SIZE for MPU to support up to 1TB of ram, as the
>>> only current implementation of armv8-r aarch64, which is cortex R82,
>>> can address up to that memory.
>> When mentioning support statements like this one, it'd be beneficial to provide
>> a reference to a doc of some sort.
> 
> So the only reference I have is this: https://developer.arm.com/Processors/Cortex-R82
> 
> but I would not be confident to use the link in the commit message as it could go stale
> very quickly. So I’m not sure about what I can do more.
Well, not really. Max physical memory is advertised via ID_AA64MMFR0_EL1. I
found some old R82 technical manual (you can surely find the latest one and
provide reference to it - not the web page) and indeed it mentions PARange as
0b0010 which is 40bit which is 1TB. With the R82 being the only CPU model
implementing ARMv8R-AArch64, that's solid information.

~Michal


