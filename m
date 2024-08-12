Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0F94F1AB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 17:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775667.1185897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWz8-00013u-0Q; Mon, 12 Aug 2024 15:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775667.1185897; Mon, 12 Aug 2024 15:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWz7-00012L-Tw; Mon, 12 Aug 2024 15:29:25 +0000
Received: by outflank-mailman (input) for mailman id 775667;
 Mon, 12 Aug 2024 15:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zvba=PL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdWz5-00012E-UQ
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 15:29:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5997947-58bf-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 17:29:22 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 15:29:17 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 15:29:17 +0000
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
X-Inumbo-ID: a5997947-58bf-11ef-bc05-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZwEOp2MT/ZZf/lYOlXa+8U2/DTs/7/ihe6qOLPHSAbm7NJ6zzQy7sByAfCvx83S1IQTwtZO9br+6T7i7+37R7lAjB7lHOkQbSi+EDQl/Z9G3gLvgZSXK6RRFPavUzQSahebfKPQni3klNuizxZlVRiKNlkpd4UT8S7jfxLM1sfEGbYXqGEID29c/rpzniTtbhbmyeA9gSXgrS1GdYhfama5DUjLx+mYDjVRrxmtwPJ6DFH2psIlYlb/KnA1ioO7gK4SwRUBJ3MJabkZD5Rd8t/xPQ5PvcxbvnIlATUtMdm2TkHytPsuU2E//8Ow2hdvt3b0bNNo/tlu9gkZP1XPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Pyqx72+rNdyVv2ciWhmulfauCoIWBrhRr7N3Qtwww=;
 b=bjurMallLpmFaUGb0tS9HKVqHhDw0sRzdXDqlLiNwo6o3tUSrBcEsdKmndjGweVWCZz19AbdEGoRKKFHT1lZSCXO8KLzlEUgtYh5R3KARR+hgaHZ47+z/6di0Huoe2yzB5cYDmWqfZCao3Y+5Dks7ETwjMtHCLlDt4p+O1esKIG1uwBrzgwMmsQyg6tSLDz2g/dxRoCVQGVifuTuIpr1e7Kqmyr2Hvy70/YhGNdioBELi9pAkd/4jw6NZqOb7FzL3n3oqKRsmKgWCRPT8qbzqQYHFbxsvdIR9zUW6DWanqXz702omPBJ8/wCirAilpo/Bvj5qun0gGkiZOv6NX+0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/Pyqx72+rNdyVv2ciWhmulfauCoIWBrhRr7N3Qtwww=;
 b=GfZzkNF+uwmIp6Tp6l3iCBNQFszLXmQIpVijolDW4+6d0mY1IHFPhjnfXupf1H3u761sRv86FBal/5/sg0lQO0YtbDNigZqyXK4hDNyUiZsCQAz0z5L3qyr72oMGDDtnnKaNxC1gZDf71DIZsVhWoXikSjknUNgU/jQtHDqhAVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f421aac0-cd05-4203-be2f-ac6e98892c39@amd.com>
Date: Mon, 12 Aug 2024 16:29:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: arm: Add a new helper update_boot_mapping()
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, julien@xen.org
Cc: xen-devel@lists.xenproject.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-2-ayan.kumar.halder@amd.com>
 <8d1e7fbc-1220-4e09-bd99-eb8a4a17ea06@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8d1e7fbc-1220-4e09-bd99-eb8a4a17ea06@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::31) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM6PR12MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbd2898-cfa9-4a29-4012-08dcbae38719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHg1cUNCbjhWQjVmWTNQbUs4aSt5eVVWd3gyZEpxQ0d6WitTVHBra3ZiSUJv?=
 =?utf-8?B?ZkNld2QrazdzZzRkNWNWMDJXOEpmMjB6Q0oxN1FlUlVxSlIvcVo3OWFkRjRH?=
 =?utf-8?B?UHFQeXlSbXl0Ulh3VWlOVmNweWdaK3JUUjhtM2t6UThBVTRIZ2hsdVpzQ3ZG?=
 =?utf-8?B?S1FrWXYvU3B0RjI3cGhNWVhwSnhRZDFtK3Q1K0xuak9sSUFZWFBzZmJqZEdp?=
 =?utf-8?B?NkhUakV2WVB2amVUcVA5OUZRQkZqUDY0dWoyejRJQXd3NVlnb2dEaWc3S3A5?=
 =?utf-8?B?aXk5MzFkTTJNRmpxR2h2T2ZWWGJoNUVldnZQUkJtUW9VVFVndHV2ZUFKWlJ2?=
 =?utf-8?B?alM3RjBaL1J0Y1NDKy9DbVhOUHIwNmNWYW1ZcGE3NGFaSW5rc0pnWnBEbWtE?=
 =?utf-8?B?MHdKeSs5WE9sKy9vQUlCbk9Kanl1WmJiRlVTd0EreEl1cWJKZWVKL3lKdHBP?=
 =?utf-8?B?dTJTOHpEZ3hVK2k4bmtjVHd2c29hTkNqdFVQSENpN3luSUtMUGhCam45cnFG?=
 =?utf-8?B?b1MrM1c3SnBEUE9URzA0bG9oa0hOT1JkbEp4TEF6WFZwVm0wM3dhRXZ2UUkv?=
 =?utf-8?B?bG9LNUxybWEyeFBVTDRYM2g2aGNSUTlBVUs2NHRmbDdya0l4MEpBRXh5MG82?=
 =?utf-8?B?T1BFUitxaGdSYTZXWUZRcnVpSFMwRjZiNFhEendYbXRkd3ZlM044cEZNdE5F?=
 =?utf-8?B?YnNocW5ITG5sbHRpakMxZnZpeXJRbmtHa1Z3ZEpXL0E0VXM0SXNqcHRKVWJ0?=
 =?utf-8?B?SzRjdlRMNUJ5bklTd3psc2FVM2V4SzJTbzNMMGcwTHIzajRGNkxBUmpENmdk?=
 =?utf-8?B?RFR4ZmNKb2d6ZnpxSmVvdUwrUFk0Tm5jRStDRXFhdm9aK2lmTnAyNTNhb0Zm?=
 =?utf-8?B?S3FYV01FUW16WklhaVlVNGp1eHRvNmJoV2x5MG4yeUR1MnZhSWNLT1RXT1RP?=
 =?utf-8?B?Q1llWjErdE5ZM0NSNStOVGxheW53endlaFhjQ1psV25CVFpSTFY5cVBZK3JI?=
 =?utf-8?B?cG8xRlJMbmpTUUYvNFE2aE1sQzI3NlRFd0xpOGZDVS9QRmVFWFlYdGRIYjBS?=
 =?utf-8?B?dmF5VlFUQ1ZvakFPN3FBUSs0U0pTWUl1TDlDSTRQVm8yQWRQa3FheFJVWmFs?=
 =?utf-8?B?RTdKMmpTNFpwTXo2RXFHbVJpK3Q4Q00zRFFYT2pBUGNyRTBrZHdtRmYzV3da?=
 =?utf-8?B?UXM4Zjc4SUhabzVGcUMvYTFQUllrZkZTREtMUCtNMVJVOFVRa3hXRkNxZUFZ?=
 =?utf-8?B?Mk81UU84RFNjUEd5UzFkZGt4bDBEbDgrb2VHQml1K2NjZ1lRa2wxaFUzNnFw?=
 =?utf-8?B?azFWOEh5c244RnVvdW8wQlBTQmU2cHVENEVsTjlEem1SVTlaYXk1c1hiZUVT?=
 =?utf-8?B?dmpjck1sd3FCcEdvNGFDaUE2OW1CWlJLRFpJNGtFRGJ3ckJ0YWR6cVA2bC82?=
 =?utf-8?B?dm44QlRmR2ttUGpqQ3hHUW9BMlk5RWZzMUFZajN3bWNRNTl5dnV3N0dqTVp2?=
 =?utf-8?B?L2dPZ1UzT2N4a3V1czdHSnNQd2dUMGd4S2pSMXJMWGV0YytqdFpQNmI0d2pK?=
 =?utf-8?B?LzNteEkwSnYyODJkdlpmMTZYeXFXbWVOY01lQVhhdTZYdTBDWDhXSWJKcWZO?=
 =?utf-8?B?eFUrb284Q3hvckY2eVBycGZ0UW8zaW1MT2R6UExBdSszSXk1cnN5ejBjb2tX?=
 =?utf-8?B?TzZQUXRIMjZqeUxNNE1hMGVIZ0N3c3JpK2pjRW1TRllqd3d2NTdIS2FZaWNL?=
 =?utf-8?Q?g/3hhowUYSMuvnT8/drzfguOFaXofTcWMiD7Bok?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STR4ZWpJdmZ6L2IwL3dFeHNtSFE4TGpHK2lKK1haMWcwTnVoaENhM1g5OTNm?=
 =?utf-8?B?cTk5STI5UGI1NU5vQ1p4Zno1cUV5Tkl3WG4xRGRvOU1LRGtZM2xINDE3Si9I?=
 =?utf-8?B?VmNNTzlLbldoU3FMaE1GSW5OZVpYc3FGdE5PR2hBRytESllVVVNzY3NvdWg1?=
 =?utf-8?B?aC80QXRJcGZtWTVtdGtBYWNKQUtyNUdUNU5HOW5kYzVPVm1kS2NFUng4MUlm?=
 =?utf-8?B?cDVKaExybUYxRnE2ZUVKbVYzTWk3MWZHWDFJV0lSVldBVk16RERmSUpHR1RU?=
 =?utf-8?B?aTNxSDBwVUpyeFdxSlFjUnJhS3hEWE9wWktndDFaeGlnZ0xSOXVmS0FnNUNE?=
 =?utf-8?B?Uk9hTjVablBoR2NnODY1UG9xaDB1SXZDZFI3Y0w0Y0s2REF0S1RZOXFXeWR3?=
 =?utf-8?B?YUpRQjlhQWRQSGQ3VEx3cHVNOGczRE5kMVBrdFJtN01VaUZiR25sMlhNbUxP?=
 =?utf-8?B?b3EyYTljbk9QWFpIT0V1OTI0UGFzN1NaZHdJcGVaeWNaMzI3RHJ0a3ZnVFVs?=
 =?utf-8?B?K0pFOHRZd0JOc0dQdW5tU3I5TjdIYXhwU1lqcmNqckE0R3A2alJOUW5odUNK?=
 =?utf-8?B?cHZHT0FoMFJZZHFDMCt3RFo5Z1FZenJBcGloK3JLeGxqdUlpVityNEVJUHhn?=
 =?utf-8?B?TEozcXcxc1JiVmkyd2trUTlQcEhiMG80enZqTWcyamp5d0tCQTZiczN2aEhM?=
 =?utf-8?B?dmtnNFNidnlyT1psdDBSTWJxNUJiYTB4ODdhSk1pS05MeS9vR3lvY2p2bUZh?=
 =?utf-8?B?aE1tV3pLem01RVA0YmgrRHdLdUl2cTdYR3pVa0QwdGEyOVZqeFdZS0UvWjJ6?=
 =?utf-8?B?dC9iRTVCcVBzVnlJN3FJTENmQXdCNFA0Z0ZJbkNqcncvZmJINWpoWFJNYlFs?=
 =?utf-8?B?V2lQbDFaOGJIRDBXNnlSUlIyVU8vczcxakoydlg0ckdQUUN2M1pXc0pDM0M3?=
 =?utf-8?B?eW5sd3lYc3Y1dmYxQnhaVGFhVmtUZFVvbG4vOVdJT2dIMENDYUVBU3ZHVVZZ?=
 =?utf-8?B?c1NwY24xWElydkFUUkEyajNqMk9rREFyQmRmYVU4SWhlYmVDaVhLaklpcDVs?=
 =?utf-8?B?MDh4ekllYURObE9oakcwbitSQXFPRDlIZmFIZ3VzSEY0djNtZGtqTGIzS3pi?=
 =?utf-8?B?MHpqdUxaVDRMS012dm9iWUVCSjI0WXdDMVhRSHBaSnFUckhiVUN6ZkVScFpn?=
 =?utf-8?B?b3ErLzJCRkY5VzhBQVo4UXNOalNvdk44cGs0YTBQWTRBdFA4d25UQVFKVFJo?=
 =?utf-8?B?UEw5OUdGRk0wczVIb0NsczNzQUFWbjRzVytsU3V6Q3JLRitwTlFOajVmNkRo?=
 =?utf-8?B?N1NRTC9ocjhMQWJNUmdWN1N4eUppRm9qM2c4dEdQaXMydHMrdjNNNEl0TzdY?=
 =?utf-8?B?SWtzZnU2N0dnRE1lNksrYkthd0JCRHB2WGR4Qm4rcW1QWENlRWJ1MWsrOUUw?=
 =?utf-8?B?UG16V3JObklYdk1QSG82c3RRSytqcFVUano0RFZLOTU0UlpqT0RaS2ZpUzlY?=
 =?utf-8?B?aUZNWGF0MlJtazc3b3Vod05Nc2M0M2FUMHBod21vQ081bVNQbVhnOHF6b2Q0?=
 =?utf-8?B?cjc4VnlPa09xU3k2cE9rL05aQkRUMlRmRkc0ZGJDQlV2clB5YXVLSklhU3M2?=
 =?utf-8?B?Q1IwM1dKbTZCK21vY2JHa3NHalJySEFGUVF5RGpmdVZvUys3NzhCc214cGFK?=
 =?utf-8?B?dW1MUnYxbVVGMG9pNS9XWGNzTml4ZGluajBaNW9JTVpVUmJJcjZ0MjI4azkv?=
 =?utf-8?B?b2gxanltd0pWY0ZzQWJWalRaVWdZU2E5K3lGa09lVEs0clJKSlFGRlVXT3Bh?=
 =?utf-8?B?M29yeklUb0ttMUJuVVNKQ29PcU04VlJLNFRmWmdEMEhiZTdpZkFJUVRXYWp6?=
 =?utf-8?B?OFBRUGVVcG9pOGJINXNmL2FpVlhGZHJtaTE4UkFmOUY4SHlvbnI3eDdVaXlk?=
 =?utf-8?B?YnEzVmIxaDFzT2NtenRlM3RxSTdFemtaU3NnRVlDbXVNUjR0TDBvbWZOYjJY?=
 =?utf-8?B?cit0MGRxSG1PZkVUMm5NN3NQdzI1a2pydXdUNFJndW1TMFpDNk12a3IybzQz?=
 =?utf-8?B?VC9wTEpTeUVUR1pTL0k4SkdIWjBteFE2TGVqU0pQQVlLYnArSFBqaXM2UE41?=
 =?utf-8?Q?XJm3lVbUuqmSwxQjeubhGs3wU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbd2898-cfa9-4a29-4012-08dcbae38719
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 15:29:17.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhI5lspE0rO1TDbMPWD6bV4bLwZQLiKs84jUJUjxsK0U0lM9zZ8DCVqHMcvdpIB6+2qeIhbgU3L7XDvhMN57bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433


On 09/08/2024 13:01, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 08/08/2024 14:09, Ayan Kumar Halder wrote:
>> update_boot_mapping() invokes update_identity_mapping() for the MMU specific
>> code.
>> Later when the MPU code is added, update_boot_mapping() would invoke the
>> equivalent.
>>
>> The common code now invokes update_boot_mapping() instead of
>> update_identity_mapping(). So, that there is clear abstraction between the
>> common and MMU/MPU specific logic.
>>
>> This is in continuation to commit
>> f661a20aa880: "Extract MMU-specific MM code".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Introduced update_boot_mapping() which invokes
>> update_identity_mapping() in MMU specific code.
>>
>>   xen/arch/arm/arm64/mmu/mm.c   | 5 +++++
>>   xen/arch/arm/arm64/smpboot.c  | 6 +++---
>>   xen/arch/arm/include/asm/mm.h | 2 ++
>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>> index 293acb67e0..72e089a339 100644
>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -125,6 +125,11 @@ void update_identity_mapping(bool enable)
>>       BUG_ON(rc);
>>   }
>>   
>> +void update_boot_mapping(bool enable)
>> +{
>> +    update_identity_mapping(enable);
> With your approach, update_identity_mapping() would only be called from within this file,
> therefore it should be marked as static and the prototype removed.
yes, agreed.
>
>> +}
>> +
>>   extern void switch_ttbr_id(uint64_t ttbr);
>>   
>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
>> index a225fae64d..789f352ab6 100644
>> --- a/xen/arch/arm/arm64/smpboot.c
>> +++ b/xen/arch/arm/arm64/smpboot.c
>> @@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
>>       if ( !smp_enable_ops[cpu].prepare_cpu )
>>           return -ENODEV;
>>   
>> -    update_identity_mapping(true);
>> +    update_boot_mapping(true);
>>   
>>       rc = smp_enable_ops[cpu].prepare_cpu(cpu);
>>       if ( rc )
>> -        update_identity_mapping(false);
>> +        update_boot_mapping(false);
>>   
>>       return rc;
>>   }
>>   
>>   void arch_cpu_up_finish(void)
>>   {
>> -    update_identity_mapping(false);
>> +    update_boot_mapping(false);
>>   }
>>   
>>   /*
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index f6ba611f01..e769d2d3b3 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -426,6 +426,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>>   }
>>   
>> +void update_boot_mapping(bool enable);
> The definition is only present for arm64. Shouldn't the prototype be moved to arm64 header?
Yes, I have replaced the prototype

update_identity_mapping() with update_boot_mapping() in xen/arch/arm/include/asm/arm64/mm.h

- Ayan


