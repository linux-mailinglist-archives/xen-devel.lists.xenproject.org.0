Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACEA77ED3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934568.1336232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdQl-0005P4-Pg; Tue, 01 Apr 2025 15:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934568.1336232; Tue, 01 Apr 2025 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdQl-0005Ma-M6; Tue, 01 Apr 2025 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 934568;
 Tue, 01 Apr 2025 15:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHas=WT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzdQk-0005MU-0W
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:21:34 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2405::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1b4881-0f0c-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 17:21:32 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 15:21:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 15:21:28 +0000
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
X-Inumbo-ID: fd1b4881-0f0c-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh2CwlIgwdLb12rzln0BgbLUa0ypoBl0FphTqH4p0Vd3A49sxvYgg+HPMUredrL5lG9ykPUBqDXmVGxRykGauJqmPcDz3CLXTTKJe0sxMCemKHc3kFEvdLV45U15ZcuISjZghCwoRQPXPY6cD3sY+PsjNIP36x0ERkmvtuLjvNTrCJWVgK7jIyQu8tH1DmlEJtodUWiE7jlsbyTvHmk5NOYkZJAe+40SSAjJLiRO85+TxU+9na1sEH7jl+09ars4tsxrf7sIo0Ch2XS8q8AYN9eZQ8zqbiftI3P68VGmAJ7+d2XaY07cgqUJG3JmZm/6iHGdpEsLFGC9KMP0aysECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ00bXqxDD33aBAnXIDd5yzs1A1Ol/K9FZxG70s1cl0=;
 b=qO506/V678Mn/4vKK1zE0GclFeR8W5uLbEZNoD8xrL8oUQUbmMfl1Qc+zLo/sktWFq8odsRgdRSKPM+gwSKEJd7lzUuTXrDahH6g2EppVdF6YeOnaMT8glkNlopIHGwX6mZvd/4+E3cmnOcMy07eCKiQl4ddzF0yLM0dHG8S4wkuvZ2SNa/mjD6MsaieE75DXS3AS1xUhy9e3cD8wsOGiviSQ9CXpbPxx0aaffqtUVEkF4xSA/v+7aaeSEW1lK1GH8pExjN+u588ZKVu7xGKDCGeMlNgYulO6deBao/hX9FVZL8FpTT2S9yuinrNZIluiIqLqSd6ztDtGGZsapCdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ00bXqxDD33aBAnXIDd5yzs1A1Ol/K9FZxG70s1cl0=;
 b=I7KyWPQ8mA1bBDVhzsM3XO0GUcKxKw+Z/9PBf1l2oUKbDSIlqIebU/fOWnkVQzWSyZxYrCnq3lic+4XnchO730nUDEuE1p4RnwUqLzWpg0GXx3XG9rAm4lFE00Dx5PABxRP5RJWSycfTTuptwzh6ElgzdJrTlmpeIPe9W+6xNn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
Date: Tue, 1 Apr 2025 17:21:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
 <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dda1b4-a722-43a0-ac40-08dd7130dfb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3RqVTE1NDk3UlV4MERBU1lVN3Z6MkxGbVo3YlpSc0FyUWZDRnZBdnVFSnA2?=
 =?utf-8?B?YTRJOEZobGRlTkZPVGUvN0JUVFdZbjQ5MVdXYkJKQnFLYnk2QmxDbnVXTHpU?=
 =?utf-8?B?VlN6U3RyVzJKTmRqWVJLOEczeFVSM1pVZkJVWWZUSk9nOTFOZ3U5SEJzYzg4?=
 =?utf-8?B?M3RoNFV4cGVUcDhqMlBHRVVFTGxQUXFJTVdNZGtuajhJNzRNVHNZVzltQXN2?=
 =?utf-8?B?aEQrUGpZVDZTMklMZDlVamhkV25kZzcvVkluNWZOQWVGYmI1YjRDcE9iL1N3?=
 =?utf-8?B?NGg5Z2RtdFpDL2ZqUWwvdHVCNlBKeTVQQzE3U3p6M3FBUllJYzNrTHEzVmQ5?=
 =?utf-8?B?eWY3WW80SEQwOXF5Q0F0dFlNbGx1RjRtOWxSVGVkMFNOVm4yOUpSdHBGb1pu?=
 =?utf-8?B?Wkd3TzlwM01NWWJsYjJsSlMyYktsaHVYKzVMbStUY0JWNjl3VnBBclJlMVFJ?=
 =?utf-8?B?SnB3dHJuVUtZelVOZ0VVeURHcFIzQTR6Y3VYNWJzRFFIM1BDVVl3N2Zadjh5?=
 =?utf-8?B?UDU0QUNQak93QkgzQ0RRUWlrTi9KcEE0YTJYOXVta3BhQnk1YTJBS1d1TFNx?=
 =?utf-8?B?cVdiNnFDQThSaHNpemREZzJqaFU0Vk5YaE51YVFyRFF5M1VoZmZubDliR3NX?=
 =?utf-8?B?WjZwa2cwUVhXWDRiR245eXdTSmFhTDJ3a3FjYlBSQ0hGb1NLcmc3elVCK3ZB?=
 =?utf-8?B?MVNJRE9IeEk3ZFhVMnJzcXZPUFBxWWlHSjRNbTRVY1JjeklPQnNtS2VaZHFh?=
 =?utf-8?B?NDdTVll0djZ1R04wMStlVUpzSm5tL0dUZTBSTHJYbkU1dDlDY3pNSU0rbU9O?=
 =?utf-8?B?UGV6VU15RzhJLzNPQlVNSVQvNlRuWjJ2YWsyODRva3VkdG10T3lBNnZydTNu?=
 =?utf-8?B?MnNva05uQllScHVvMDU0TVEwK0ZFaFRLeFRpbFhHeVZBdXVxK3Ntc2xrU0lB?=
 =?utf-8?B?eG9PWVpoQkRVT1IydElWODVneDQ5TEN5cmF6REw0a2NtYlFSQU52VU5sbUlz?=
 =?utf-8?B?dk9GVFpBZGxhWlIrZXBhNG8ydjMyejQ1WU1HTTNaK0hSclltdTZrRHlhaU96?=
 =?utf-8?B?aTBpNkdWdE12TmJPQ0xHMmlHN3JtYkZ0R1ViU0pwTEwrcEVxbUMyUGIvMUZY?=
 =?utf-8?B?VHVrYnNIREhMUVJIZVpLbjdBVEYxL2Jud3dHR2NNRzdGT1dZQUlaMzQyNWY5?=
 =?utf-8?B?ZW1PRnhCbzJPV3pMMjBjbjVyQnF1Q01ZeHQ0TXhZK3BZVWMzMzQrMFZOMDFS?=
 =?utf-8?B?cklhTXFoSFViT2ovMzF2WU0ySnFaQnJjbmhjMnVjOWM1TmF1NGthNkRyNFVl?=
 =?utf-8?B?YjRtMjBScWlTTW9LdWFtYTRZbUZmZ1NHMTMyRVUxSm8zSndTVjdsRUpCaTA0?=
 =?utf-8?B?QmN3QThaM3EwNW1lQ09lVW5lS2plYlMyQ2lzVXRJMHAwT3RrdlNWM1o3enJl?=
 =?utf-8?B?dVhFQ3FjSXQ4V29yek1LR3M1RnVRR2dBZHBYYXdVU01udGpEelUwbTBtUDZF?=
 =?utf-8?B?OEFEYXVrWHZPQ0Zkd0NwRlUxN2gwbTNLblpXbHc3QlZ2TXA1NmppaTVCMkZj?=
 =?utf-8?B?a05uSDhLSWNLYjlQTDZBTlVnWENISThPd1Vhd1dtaXZFcFZxRHQ3TFFSSmZB?=
 =?utf-8?B?citNam5nUE5TQ3htdkxXdzl1WERDTHBXV0Q3NEsveDVlRVBQRnR3YVRGaHpk?=
 =?utf-8?B?Qld1YlRSMzF4aXBmR0kvNVcrV2kxNTU3R092WTIxemhxOHlQR3oxQmVZNjVG?=
 =?utf-8?B?RkovYzhVL0RJajBnYmF6T3ZTK255b2JjRjEva1UzaDJtRy9UUExkcTNqazBH?=
 =?utf-8?B?NDl6MnRsZUJrbkVobFF2dG41SXB5Qytrc29zQmEyN0ozc3VubVVCSlVGNHox?=
 =?utf-8?Q?r0bVy3mSH8HhL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUp3a01UNDByOVQzckNmTkRtYzM0L1dXdVYvenJXSjNGczV5OHR1R0d0NzFn?=
 =?utf-8?B?SkRISVpkR1N6bVFtWEVXVzEzaGhaQWZuc0V1ZjZKNXBIczFZUkpoaFFlVC9G?=
 =?utf-8?B?OE9wNzhiYUcvSmpMc1NaU2p2aUpWMDBZOEVJOEpEUzQyU2dIbnRlbVNRWFAx?=
 =?utf-8?B?OGxIVFB3OEZ3dlZnV3JnQzJQOVBETnRZTm13bVZ3ZEtOS09CWm02VnJaaEhR?=
 =?utf-8?B?ZHlSWVJNNUtMOVBiNHhjZTBESHpkb3FkeHhzYk5QNG8wRXRyeC9LU0tXNHlN?=
 =?utf-8?B?eFl3V0NWMk82Q1FxYUlrK2dORVRGZVljMUs0dnlZMTBxYU5SK3B4Z1NsMHVY?=
 =?utf-8?B?eStkSUJMeUZiVnhnZi80T3JQc0NxaVlvMUY1ZUk1UlAzL1RBTnFMZ1MzNnhu?=
 =?utf-8?B?VnUwTnUxanBqTUhaMHViY2h2R1haUklaTlBGOVdaQjN3UDBwbWYxcWs0NUlh?=
 =?utf-8?B?RFpTZVloNEdOeGFTdkhwdlhhYS9SSjZERlZRMWYyK0RYTERnR1hOMWRzT0dE?=
 =?utf-8?B?VUMrTVByZlFCVHNVNW5aMGN6aUdOSnovc25rbDBzZVI2N01zTkZvSm5VOUFn?=
 =?utf-8?B?T1FxOS9acEh4TlRSdGVkVXZBR09EWWZYS2hpK3NDRnNqZ0lYNW9tTXJjdkZS?=
 =?utf-8?B?Q3E0TmNxOEhOOWlrUGF1SFMySnBZa2JYRGREdm1FOXBoV0pvRkVhdjVWWGYr?=
 =?utf-8?B?OWg2SnFvNUx2SUpQNyt0bzFFMGo5NzRVaHZpNC82dDJDL3RaaFZwV1MyeDVy?=
 =?utf-8?B?dHNYVzZwazBDQXZTRlJidzJ2UU5NVHV5N3FBRmx0Qlk3OSs4YXVoWGpERTUw?=
 =?utf-8?B?UmJ1WlJkU2QyYU5aQ1ZIODVDMXRsMmRDTE44NE80cFprWDlRRUNyNmNUWGJG?=
 =?utf-8?B?TGRjYTVoekdTNnpvaDN6UEpiSXFYc0RaaWNEcW1XVUJKcUlNTGZWMk1TZWdJ?=
 =?utf-8?B?VnZUWSt4MUpDa3BkZDRZWlEzK1hsYkNCQlVaamtuQW1lcXNIWEFyQ0F2dGFR?=
 =?utf-8?B?THhmTkxoM3NCdnZ6amptbFFrZUE3aUtaSjNFbnRsc0o3bkY2UFRFUk1hOHhI?=
 =?utf-8?B?aDdWODBXVVRDNHdnaUVUYkNybXZGaUpvYWhmZitDdjl3cHJIbWpEdkNjWkEw?=
 =?utf-8?B?bHFEK3daWGRtTzVyeXlKVURsNW84dnZObFVTbXRJaVVJREhyekFYRDllMFdL?=
 =?utf-8?B?ZmxmT3UzRU1sZE9ZQjc5cHNhQmI1Wmg3V2h1MGozU0VHQUpvQ3VKRktjU0pP?=
 =?utf-8?B?VTY2a3VHbnVYMk9mWGlxUHZ1ZkZBUGpxUktGbW10Y2dUalBidVJrVnlGU0xi?=
 =?utf-8?B?c0hkWE9qUlpJRWNubFJ2SjlRL3NxMDJoUWpud0hCQk5IUi9VQXZDZmMxemwz?=
 =?utf-8?B?Y0dkb3dYN292QVlSQVFaNVRFN1h5dkEvNEF6SEFoNG1HeFY4K0JMaGNkQVBT?=
 =?utf-8?B?Y21YNFJKeFpETy9HRDBDMmY1cVZZdkR6SFIzc1MyMjVwcm9SaER0a3RzSUJW?=
 =?utf-8?B?eDZGQ1JickRPbTJJTGFEZCs4M0FZNjdHaTY5c0xCZVR0aEZYM2Y0YkxKVTFm?=
 =?utf-8?B?RSt6K2diRWgvNFo3ZU1XMmJNbi9JeWkwY1R3M1M2TlpVVmdpcGpIdG8raG02?=
 =?utf-8?B?MVlIWmU1ajRSMnlGc21ZNU4yTmJza0tRKy84ajdMbHM1RHhhdjZJYkdEVHhY?=
 =?utf-8?B?OUJHdjJvekNZRHBKY0pQM3Ewa3FhbGNERUx5TXYzcEQ5RndxN2pybjE2NlhI?=
 =?utf-8?B?aGtRcy9tK0NoQUM4OTRXQnN1eWg5OEcwUktPZXIzS3NySWRhVG1rOHhzVGJz?=
 =?utf-8?B?NjNCcHpxWWRFVk1vR3pCVGN2WGZTTUxSL3R6M21jZS9JQ29Rd2NWV2pRVk1i?=
 =?utf-8?B?ZkwrbDNKN05WVW4rV2d6MjA5RkVnR2pSSjJNbFBnZ2QwUVU2RzNhKzRFMFNh?=
 =?utf-8?B?U3VpdURnY21mZlgwYVB6d05zQ1ZvU2hoVlBlZXFMVmRXSHlyUGlZUGNPR0Yz?=
 =?utf-8?B?RGhDQ1Y3OGY2SkFRN3FVemU4UDYreEZNMUw4ZnJ4OWJZZUE5c3cxL0wxWVdy?=
 =?utf-8?B?a0d2Mkp2TDFldlptSWFyWVRwZy9PVFhuV3BmeGFhL3p0YlJOOWpGUnlyMEY3?=
 =?utf-8?Q?XOBViIvWtPP0I2+ZzLjiNKK2n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dda1b4-a722-43a0-ac40-08dd7130dfb0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:21:28.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vQk2GOH8D9k+SGsnDpnrwJiknUDvsupV0+B87IB7Q3y1uq4S8Zm0YZEwyxA36up
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898



On 01/04/2025 16:49, Bertrand Marquis wrote:
> 
> 
> Hi,
> 
>> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> There's no benefit in having process_shm_chosen() next to process_shm().
>>>> The former is just a helper to pass "/chosen" node to the latter for
>>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>>> passing NULL as node parameter, which will result in searching for and
>>>> using /chosen to find shm node (the DT full path search is done in
>>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>>>> will simplify future handling of hw/control domain separation.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> xen/arch/arm/domain_build.c             |  2 +-
>>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>>>>    else
>>>>        allocate_memory(d, kinfo);
>>>>
>>>> -    rc = process_shm_chosen(d, kinfo);
>>>> +    rc = process_shm(d, kinfo, NULL);
>>>>    if ( rc < 0 )
>>>>        return rc;
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
>>>> index fd0867c4f26b..94eaa9d500f9 100644
>>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>                const struct dt_device_node *node);
>>>>
>>>> -static inline int process_shm_chosen(struct domain *d,
>>>> -                                     struct kernel_info *kinfo)
>>>> -{
>>>> -    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
>>>> -
>>>> -    return process_shm(d, kinfo, node);
>>>> -}
>>>> -
>>>> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>>>                     uint32_t size_cells);
>>>>
>>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>    return 0;
>>>> }
>>>>
>>>> -static inline int process_shm_chosen(struct domain *d,
>>>> -                                     struct kernel_info *kinfo)
>>>> -{
>>>> -    return 0;
>>>> -}
>>>> -
>>>> static inline void init_sharedmem_pages(void) {};
>>>>
>>>> static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>>> index c74fa13d4847..cda90105923d 100644
>>>> --- a/xen/arch/arm/static-shmem.c
>>>> +++ b/xen/arch/arm/static-shmem.c
>>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>> {
>>>>    struct dt_device_node *shm_node;
>>>>
>>>> +    /* Hwdom case - shm node under /chosen */
>>>> +    if ( !node )
>>>> +        node = dt_find_node_by_path("/chosen");
>>>> +
>>>
>>> I would have 2 questions here:
>>> - what if a NULL pointer is passed, wouldn't you wrongly look in the main device tree ?
>> Do you mean from hwdom or domU path? In the former it is expected. In the latter
>> it would be a bug given that there are several dozens of things that operate on
>> this node being a /chosen/domU@X node before we pass node to process_shm().
>>
>>> - isn't there a NULL case to be handled if dt_find_node_by_path does not find a result ?
>> It wasn't validated before this change. It would be catched in early boot code
>> so no worries.
> 
> Then an ASSERT on NULL would be good.
See below.

> 
>>
>>>
>>> Couldn't the condition also check for the domain to be the hwdom ?
>> I could although we have so many /chosen and hwdom asserts in the tree in the
>> dom0 creation that I find it not necessary.
> 
> There are never to many asserts but ok :-)
> 
> With an ASSERT added for the NULL case you can add my R-b.
:(
So you still want to put ASSERT for a case where host DT does not have /chosen
node. I'd like to talk you to drop this idea. Normally I'm in favor of using
ASSERTs but not for so obvious violations like missing /chosen.

/chosen node is so crucial for Xen on Arm functioning that a lot of things would
simply fail a lot  earlier than a point where we call process_shm() at the end
(almost) of hwdom creation. There would be no modules, so the first example that
comes to my head is panic due to no kernel which happens way before process_shm().

~Michal


