Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D279A2A2C9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 08:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882532.1292642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfwmJ-0002le-4R; Thu, 06 Feb 2025 07:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882532.1292642; Thu, 06 Feb 2025 07:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfwmJ-0002ip-1T; Thu, 06 Feb 2025 07:58:27 +0000
Received: by outflank-mailman (input) for mailman id 882532;
 Thu, 06 Feb 2025 07:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaX0=U5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tfwmH-0002ih-7b
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 07:58:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f97b8d-e460-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 08:58:24 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 07:58:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 07:58:20 +0000
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
X-Inumbo-ID: 22f97b8d-e460-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgePMGWjexYfSuufKDp/mnS9DpUBdfe0AikotG+0yaiEbJYEbcjNE3B9WDyrW0lApsqzGbSyeXrBt0MN0X7+yT6g5xS0lewMbrcVtGO8Gq4424Lo+tppAyfDgRHJHTtK1lpSyl3bebURELpvajx8CVewqIWQPixBPI29bncB6gFcKJk0AnrVBSDvARYduUS0GnxR9eIa6TBs2IfAWTCkNBQDeh83Sjz2TLRhL1cAMBNxIVDkVt0RVHc+f8rnR6OE4Fp3jZXi/BSaEcMEgemmX7iVSAFgamAmuA2FQhZvxe35XUtpn99Bi13OMCmuouvKg+1qroBblye3Ilqffn8UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf+xHCnnRxNHcG72jAqsmq25Wk/OA6EouE5ZL/q4NVs=;
 b=eWSbbGDhlrcNDtJtyKgYEzWNJjC0SOBvxHZcuTKTNz5lEgx57RXr0P2rOqsRbazVUfVpj9mkTSw457HewPNI/HxTnpi2CfsE8JZKIrxLWDf6war5u9xIdFcN1r2wq+eSLEYgZJKsIi9pUyVY5KvGkZ6/fRSTIlF9mu3XDAAFviAqlNfYm+3ip2ek0TBI4SvLxhZCqZnCquKLrhCeYvGiwjsa6RLL5LaAzWuh7WPEyAtMjqaXHTbSQiPHCuCnbtnrjJZARm/5UrFGRd9Bmr4CBrVlq5YJ4RHb+C0cOhI+nae6DkHgF3iZaLn65zzimB0k3UHs12kCGTw7Pd0vhVuJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf+xHCnnRxNHcG72jAqsmq25Wk/OA6EouE5ZL/q4NVs=;
 b=tEChOpZmqvTZauU894QPkpBX9Cl6cZO2Xw6wPrSNPEvbOpy2dSfX4kUpOshUsjlywm4OgAc9Z9U+EOPhGOAVlOOxXcL3t3OoatZZ25p/UKPS1QukN4heLYlDqiu0e17lw/8SJlZYf2BWNzcgKNTZJBn/aq6nI7Vj+csD4Mpb3dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <98cc8f4d-660d-4bb4-8ac0-9ae2f6f26b24@amd.com>
Date: Thu, 6 Feb 2025 08:58:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] automation: upgrade Linux kernel for arm64 tests
 to 6.6.74
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
 <20250206010843.618280-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: "Orzel, Michal" <michal.orzel@amd.com>
In-Reply-To: <20250206010843.618280-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a798c0e-a15d-4ccf-dd8c-08dd468405cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkwwU3Fla3FZbTY1cHpCNUFDV1JaUytrM3k3TlZULzhIRUFzSUtuR0RlZ3N6?=
 =?utf-8?B?VDFqWXJ1eEJOUFVtQi9lQVgwd3ZFTUM0QmM3L0E0R29DUXN6U0o2NEF5ZmY3?=
 =?utf-8?B?eWVjWUVEVHhvSkw1NFZZYi9aS08yMW9KdWI1bGpQeG9HeXJ2WGtYRUFtb21h?=
 =?utf-8?B?Uy80YUNUNGJVRjR4elNaZVJhN0pjb2RhZytyRmZ4OEZabzBLbklOOHFvY2J6?=
 =?utf-8?B?VmxlVENEa21pT1JQVEg2QlF0d3JqUFZ6RkJkM085L3U3SXZkL0VTYkJVTVQ3?=
 =?utf-8?B?dHU3dDdzenFJbnVZRWtXU2h2S25ySXdwaDVYbnlKV0xrN29zVnBlSElsYjZy?=
 =?utf-8?B?cFFpQ0R6dHZFbFdjcTFRTE1CTkpWQi9pMWw5elZ2aGFoNmt5b01leXV2MGJq?=
 =?utf-8?B?QWFNb3VTbUdOTmUzM2ZwRzhNQnlhdC90eUVvTXhmT1pVZko4RERIc0pJUWR5?=
 =?utf-8?B?VlNKN01QKytPZXRKT3dSWkN3bTlRdU1kUWZDS0Q2QWkxQnVlajZ4ZjVuZlV6?=
 =?utf-8?B?UGdJaTk0dzBCV1dyYi9oVTExczdYS0xBWmd1L1lxUmRhcWRQbkJHU3BiWmtP?=
 =?utf-8?B?KzJTYitwM3ZlMHNMU1F3ais0NitRbFJxSEFYcUNwK3l2T0J4UjVFd0pHQ2pk?=
 =?utf-8?B?anlnUUNhRHI3RnduTDVMUS9aVmo4eWs2eHJ6c2FreEJYdG9aakpNRXgyekJG?=
 =?utf-8?B?Nk1IaVBFc3Vjc3djbzZpbXY4TU44aFNETkFhVmNRMGllc1UvdVUzR21lbllt?=
 =?utf-8?B?ai9WVTUwRWpQUnJ3dlpjMnZ0UUIrS1lZaVoxWHh0WDJ3cmNXNnA0QnBmSVgy?=
 =?utf-8?B?Z004MW9oVWtmbE5ybmhtS2IxNnRGQi9Od3FLUldVdXd6b0wrN2hldU84Q3Na?=
 =?utf-8?B?UDdjVFNhOXdTQXZIZ3pLZjdscmp3UkhsNllqQnQ3QWdzYUZMUXlkQnlYUUdh?=
 =?utf-8?B?cWdtcWxaQ1RtVnB0TDVKWk81a1RrSk42NEh3V2JaYzdOTDdSQlZLYU9kT1hu?=
 =?utf-8?B?NWNBVkFJM01WUGduMllFL0JreUgrT2hWcmFEVVJHSkRDYUxFYUxPTVZZM090?=
 =?utf-8?B?dTA0RkZUeWpjNlgyYlljVjVMZkRoYisyN3hFTE5SSmpYZWh5L1JyWDNsdG15?=
 =?utf-8?B?eXU3NFh3ZldpMk90QXQwbk9mVVlaL0JJNTI2NUI2WWRienViay9xSnBsSThn?=
 =?utf-8?B?RFdwcEFNR2RhMVpYTHRnSlZMYlhjaU9BL1JhMkY3WGxpM044T3ZNdWlWSzNB?=
 =?utf-8?B?d1F6YzNOM2ZDaXNsaUNFajRCbWU5ZzlUZGZEVWd5c2UyYkc0NHNxYjZwYlRF?=
 =?utf-8?B?ZGRqaVo4TE9KSjZaazNaOUM4cXBYVzQyY3RYYjdCU0pmd3ZvUWgzUWU2Z1N5?=
 =?utf-8?B?UGU3YmpjWW1ROUVDSDE0V0NnYVJVcG0zenFDK3kzdUJFUHdxK2pYZ3UwUDd3?=
 =?utf-8?B?UEZaS3JXV2xqaHVwdisxWlNVMFJIQmJ2N3QyNzlvVXkwS0dKcStXRDUyQzR4?=
 =?utf-8?B?S1BWbEZQcldmd25nazJWU2tWemhmQ25xMHBOV1J1MDQ1eUdvNUt1dGFMT2M2?=
 =?utf-8?B?bDVMT1ZmNHM3NzFBM3JjWDIzYUhNT3N0dVdIUTZ1bjI3ajNKSXNoTHU2bEIw?=
 =?utf-8?B?VmVCNW9yRVJDQlFISVZwNVB4S3BEZzE0V2JHeUx4RHJOUTliRkdqRWJxVGor?=
 =?utf-8?B?SnBBek1CQjAyMVRxYnIyZmtkZTZuVXNmYXg1TkVVaVp3dllJSTFlSFc3bXZv?=
 =?utf-8?B?SklCTlNCQWwrOEg5cGQ3MmdTTUpKWHVMYTdycS9kTlpTN0RodFAvSjRzR3lr?=
 =?utf-8?B?VHBmdEZNVUdvSGczVTNDWGRDRUJlN2RYaTI5Q3dXMWtwQjZJdUZjMG9kT2tG?=
 =?utf-8?Q?K3wC6XvPcVm9u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9EZTl4R3JMc0ZlQzBCS1grL1c4TGJFQlBLOTZ1OStNYWV0NWlmb1ptQkd3?=
 =?utf-8?B?Tno5WjlXNlU1bzBKZ29yaG9CUUp6b3FoTU1pQ2dFU2duc3FOdmtRcUZBREIw?=
 =?utf-8?B?dVkraWZ1OUpVUXplWXB4czVOQzRDVjZGaTBSYTRVUUNOTUFFcHVUdFFCNTQx?=
 =?utf-8?B?ZGFubkdEUlRjMjJ6bnQzbjBiK3F4NmgxNkE5Q1ZHTFpubnRYQ2x5RGJ2dzB4?=
 =?utf-8?B?aUtINFRKMDV5MUZBSUxZZVFIM0lQZ2tERWY3Nml6YVNIYmNkUG1VallFdlpI?=
 =?utf-8?B?aXVyNEpsMXRjTDJLZTJ4M3JDMW9pL0UwTUh6L3R5bHBNTkNZd2NBalZZNGVq?=
 =?utf-8?B?UnZxWFUwWWJTSEFaMnQ5NE55aFpTMXMyUFluYlRFYkN1WmRVRGhjTy85dWFQ?=
 =?utf-8?B?dTUwb1R5TkZqSGNYUmhMcW9ubkoyZ1VEVzVKTG91ZDRveHZqRFIyckFnQnhw?=
 =?utf-8?B?cXZqNnZqMmpSNk9kU3BqamtDUXBsV0ltazVJUUhIRGZYVmNCbHg3YjRFQjY0?=
 =?utf-8?B?WkVHdmZ3YWZQeHN4MTNVTXhrVFNxY1BIcUVhY284bnlNdFhCSnJpMUluemtj?=
 =?utf-8?B?K3pxREhiUEd1SkkvV1kyRVlHQjczK1dCTk5CQWNabkV2R3h3eHpiMFh4b2do?=
 =?utf-8?B?a0hKQ1kwdGtTemV5UkE2L25qMnovMDh0QTdxbEZJbU80d21FRTFxVEN6YVlH?=
 =?utf-8?B?U0d3VVF0Z1BvcEwzWlNybHR1b0lGM2lBSVRKTzI3dmpRQUF4T3pBak95WVBs?=
 =?utf-8?B?QlJmc1gwTDk1WlFuczVraktWNThaN0xKT2NZZS8raG00cFN2S3pxbm5mdWFt?=
 =?utf-8?B?OTJtTFVpa0E0b2EwcEZIVVlnZ1FsOWNXeEJGY3lUMmEzcFpLREQ3V0xDSUs3?=
 =?utf-8?B?eSt3b2ZIVERyVDk2R0F0T1NnTjNuQk9ZYVZmcTFjbjJDckhNak5oZEY3RVpK?=
 =?utf-8?B?OFByTUxUbXFsM21kVjBKcGMvYnN3QVhLY0lGSW0xTno0SjhsQmxRYjRvbUlE?=
 =?utf-8?B?UDd1QTN1OEJLOE1xdDMyUHRqazc2eWl3dU4rWC9DVkFIcTVLTVl1dGphRXNL?=
 =?utf-8?B?ZUpQcHpVWCtyZjlTejFSbVBWQk1hZlBzbnNQL0VHRXBqSUMveW9mYm44VE4z?=
 =?utf-8?B?NWZ0UG1xMEFWZ3VVazBqcG9yQjF5dnRXMHo1WDBiaTRFYzlVOXlLRkRvL1pk?=
 =?utf-8?B?dkVWQnVSK3ZuR3N1RWRtSFAyRlBWOGJEM2xOMmJNdk9vWmg2b2ZnK21YT0l4?=
 =?utf-8?B?V1RMbHo0QnhBY3ZtNG45K3FjanI3V2k4bUJkVXpHRXUvQXlnc2dlZzJsTDhh?=
 =?utf-8?B?VzM3UTJpdkM0MFBqWlRUenpUVXNHVmF3S2Y1VDM5enkxbzcvUlJsTVB3dndM?=
 =?utf-8?B?dGl0ZEQxa3VwWTdMVW9MdnQzNjB0Y0NlSmZDSUVnRmJDREJTVlAzLytlS251?=
 =?utf-8?B?KzlsVXJVVzc2c2RxQkp4RlFxNmN0Tm1FWi9TQWxibUhDS0JLd2dPSkhUS1Bo?=
 =?utf-8?B?WGJseG1INHZUc0tWeCtWMzI5RTVWYWhkakpsOHhiM0RiYlpMV1EyNVNFUG5u?=
 =?utf-8?B?NzF4dE8zb0h1Q0RrOSt0SkFRZG5HV2pHL2RuUUNKRU1rQVNwYzVaOEFIeU5I?=
 =?utf-8?B?aXlCOGMvVzgwTkZYcStFN0JTZll3RWt0T3FwL2I4Qm9aRDFkMkRrNmlXektt?=
 =?utf-8?B?NTlHbHJVZ0MxY2JOVlFTbFZzdmkxNUpDLzJxRitnQWxMVHI4ZUVuY3NjTU04?=
 =?utf-8?B?RjRhNEU3blVNdDZ3aXUwUlRJUjNhdXJiZkwrR0VwSjduMWR3RFpRVjRJcUlt?=
 =?utf-8?B?ZVA1ME5ZQmFFbG9BdDBoL2Nnb3JlSFIzek5Fd0FCTFdhWWJ1YzA3NHpjZ21q?=
 =?utf-8?B?QVNOd3RVdjRlL1pQN0hhdVZCTnRpNGx3UndNNnoxU0pSQThEWTBNVER2T1FJ?=
 =?utf-8?B?aHpuQ1c3TzA3VS82YWdIMlQ0WVZjeFE3b0ROZFRDS3k5RWxIdncvQ3JsTzhQ?=
 =?utf-8?B?Z3YzSnZybDNPSVlwL20zYSt4Q3MzV055akpIWnI5dzRGUEo2Q2UvaitJZlF5?=
 =?utf-8?B?anZHdFNRdVhHRzI4MHUwMTV4VUVBTStFUVZMdDNOOHBLQjNFZ2MySUEzNWhm?=
 =?utf-8?Q?kyxM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a798c0e-a15d-4ccf-dd8c-08dd468405cb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 07:58:20.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyepbo68dUTP/kfPFJysJtn8JvjxUPV2g2fI3Rx0bAiJ6dLlYQB6+6tfssuTPFhB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7293



On 06/02/2025 02:08, Stefano Stabellini wrote:
> 
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Any particular reason behind choosing 6.6.74 and not the latest longterm 6.6.75?

In any case:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


