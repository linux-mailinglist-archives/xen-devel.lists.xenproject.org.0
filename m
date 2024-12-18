Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921C9F6801
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860421.1272440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuk2-0006sF-V9; Wed, 18 Dec 2024 14:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860421.1272440; Wed, 18 Dec 2024 14:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuk2-0006p7-SE; Wed, 18 Dec 2024 14:09:34 +0000
Received: by outflank-mailman (input) for mailman id 860421;
 Wed, 18 Dec 2024 14:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxzo=TL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tNuk1-0006p1-9l
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:09:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1d91847-bd49-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:09:30 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6906.namprd12.prod.outlook.com (2603:10b6:510:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 14:09:26 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 14:09:26 +0000
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
X-Inumbo-ID: b1d91847-bd49-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ny1MiLY3iPyHXqux/cQt8iRztfrdWXrOp6g12iQ7nGqR0/QkjxO34ufyJHNAZM/jAVhQfEcyYTcSNRMIXe4HOzelJ57aDYKXu5D+t7BluhdsQwt3Vsuh0HzCdAr58jiPaxZtWNS/0BXEQUq0N+TFGRFnyVcZFByB5zdexDSGvFanyQzAioXZmBbMbljWldem/Ph4ft6qCKwsFlsoPoLa+QB9TyANK2chY9eRWTQudy10hOZufyR6XYW2xp6gX+Re8EhbuUHEz/WVMcyJEYbYQn71iHlauZYEGGQS1SMlaAnVcPa1aAeN1BKpYPg5xFzIWigQpIRBW44+6YBsM4782g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKNc5NkdTPQqWW7vUw2NbgVJoYbq4pEsTWQNDHUwrZM=;
 b=MWAmbIEXBncIqnk8bGJxC9OXBu2hSnfqptN9yBX2+nFaB6rXp+W4j78hpkL907ZZ6S9zEwyyas3FBmGYYpuFrYpMjtuQ7Pgs9DHff6qgjEsQVw81NtrCOUx67wzT4nBUpfJXC5VX/NSW7aU2vOu1Oby3Mcg5lg1/E94FVHdcYBz5naIaxyTAIxADb0VN3WgQ3o7VuU2cf48YVEM1R1CoVymgswy0dwk8BSXuBTbJ+bz2T+jP5ShKW12M0pIEcd6h+NH77vVui6onkl280XNm4fOBpvz58i9RNUa6j/II0+ZQ4FMMAronzv1V4+ANmzLGgqRkKbN4PmLoYFlw192Ffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKNc5NkdTPQqWW7vUw2NbgVJoYbq4pEsTWQNDHUwrZM=;
 b=3DbHnSJ6lCoeXblwt3rXCbaTdYurVc6VCB1Bjhg5EMl9KilhVWflkQ6tZxuNkDBKUZu8uwJ6CeMEWsM4d4Ppd0qWuNRTH5SZj6voccBhQF06Tg08wWYsc6fmkpoGaTRiOTOww6esv9WIVsd7y9nncRRpd4+J+mhyKMBRbIVjQ2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <702f8ee6-e53d-4bde-b773-745a2aa5b4b4@amd.com>
Date: Wed, 18 Dec 2024 14:09:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
 <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
 <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
 <3984b69d-e15f-4863-8af9-53b6cc0f6bd1@amd.com>
 <E4F0C26E-9FD2-4C48-A3F1-4CC599B4EC04@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <E4F0C26E-9FD2-4C48-A3F1-4CC599B4EC04@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb9f7ba-fd5e-4742-b785-08dd1f6d944e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFQxRE9RTnhPSWg0cWpXMGVtb2JaWGd3bGkyMnVtWExUR29GQlp0V3J1SU9n?=
 =?utf-8?B?eVEwNmxZdWxxTnlKSGNTWmdYMzI4Vm9qYkh2NVZ2SG1NempKSTZKZ2RFMDZh?=
 =?utf-8?B?dkRvSDZKcHhPYUh3T2Y4VVlRbFdoV2tPZ3lqYnJBOFlKQ2xhMVpJaVJ2QzFT?=
 =?utf-8?B?eVdsZzRVNndZN2lvdStaQVh2Z1ZhMGhVOXl5NUxtUGZpRTU0N2NESG1Nb2JO?=
 =?utf-8?B?ZGZkY2ttVEdVR2hnanRBdnNEYnFOM3QxNjd0RjUzYTJQOU91bVYybDVjMzlF?=
 =?utf-8?B?Zi9Zd0tGNkNEcW9PaDdCK2sxSW5OU3kvbitLY3E1M1BNNVhFaUxVb1VOOE9h?=
 =?utf-8?B?NWtYR1MwRUJTWmhpa0ZsSnBPWURHMC9wQnFFUU93T21BZmRSL3RyMHpIeVY5?=
 =?utf-8?B?SXBxRWM4elkwYjEvYTlFR1l0UDVJcGtFR3pMcnlXdWIrRmlFM2piSURONmU1?=
 =?utf-8?B?ak9BS1cvRFFjMlNBMG9xYy9xbG1VMWVIdHEzY3FzZGFZQVMrWHFOZnROWmYr?=
 =?utf-8?B?dmkxLzhIQ2lCL2NMeFRIeWtHZW4zdE5aSUNuTkpsdmRSVG1FVEVNWnl3K1RR?=
 =?utf-8?B?TURhcnhBK1lpeDQvQkQvNDV6RUNOODZDWWJrNkpLT2UzcGlKdXBEUVkwMWM3?=
 =?utf-8?B?dVdiRUxoTGgwMTRxb2xaWTJZakM5S1grZ3JILzlOR1FHWUtUZk4rdFJJTmZj?=
 =?utf-8?B?M05HYk1UQXhUMFhncGFCNVNNWDdIWXFGeXM0SEJhSjQraXhDdkh0TVJudjF6?=
 =?utf-8?B?VHRpaWRzcXNQK293MThzREIrekcwZ3N1b2tTZHJDMFd4WjVMcHB5U1hoM2hL?=
 =?utf-8?B?ZmZ1ZW9ZYThpejV4WjVNVFN5NU42V1Z0WTNwV2ttMW02emg1dDk3RmtyMDRM?=
 =?utf-8?B?R3B1Yis4c0lqSUFDeVlWTStkSFpKVHM1YTNNOTJHV0RuWXpXalU4ai9mTmdp?=
 =?utf-8?B?OEphM2VWN1Q0cEZpbEdpK0d4RUpOY0pXUlVPK3EvZ1kvYUkraUpoazBGQ3RS?=
 =?utf-8?B?a3ZZVVZWcVAwaS9qTzRMZFN1cWZHalErQXJJVUM0cnhCSm9iYTM4eGVWazdZ?=
 =?utf-8?B?TGlzeHhzaS9LeDc1L1A3Rmg0bzlZUTNRdHVOcEFWU3VEY1YwZHBzU0I1RXRJ?=
 =?utf-8?B?UURBdkg5TE1GWE14dGliSDFYZTc0RXYrSGtzeVJibkFabjlxVm1TTDE1UmlB?=
 =?utf-8?B?UFlOUnFVa1p5a21HVEk0TFZjVmFiT29DUHhkck1aRGNUQmFBR1J3NnBtb0hI?=
 =?utf-8?B?bmpPWHdEZUNKRWRQUGZxMUFxTTE1VXNMby9rN1R1eThlWCtVcGQ2YU5qMDBS?=
 =?utf-8?B?N25lVDBSbC9Da3pHYTJRNmpZRmZIOWViMTR2WUNzQ1p0NGZ2NEJqL3V3QzJG?=
 =?utf-8?B?b3ZkMUlGK2x1UDBDc2NuU0ZoelhyZHA3RzF0ekFuRU5RTmVlUzNZWFlzc1NK?=
 =?utf-8?B?NmVSaE5XdER2QU0wSytzcnY0Snh3amJrWkoyNFVsY3JHTlQvM3Blc2dSaXJk?=
 =?utf-8?B?M0tndHJILzNVYkt1NlNrNkVKbW1PYWFWTGJ1Q1I3cVFZczZoSkl6OExVaS8w?=
 =?utf-8?B?N1JXOE5yREl2dkRYQUxFWU43TjZLbEJqckRYZFNsNDhldzl6RGRsb3JIaGRu?=
 =?utf-8?B?N0ZLZG4zK2JZdjlOSUhlcU9Ea1M0NmJzSVBRaWVuWU41Vi8zU0VnMjg5bHBD?=
 =?utf-8?B?VmtUcmRFYTJIVDVjbGVBOFNTWXZWM0tXMldjTmU0dGJVVmxiNzhkNE1JUTdV?=
 =?utf-8?B?eHRYT29uZitPUW0vdkNLK0dhakZRR3ozMW1acndrMTBCZEJGTnNRUjU1bk1H?=
 =?utf-8?B?SkNBT3ZtVlRId29VZDFHZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDAzdk9EY1pFWW9NUHVoY010aWdnZGtEbGZJUEprMzRURm56VDhpUjZKVGYv?=
 =?utf-8?B?ZHNMM1J0OFUzOS9xWEl5aWM3QzFzUzJUOGUxL09NemFYWmZLRTlaM2U2Q3BP?=
 =?utf-8?B?RzBra2Y2MlFMZkQ5RXQ2ZG1OS2VqOThBMFgyeCtPQTZreU10UkgxZjN3aHRX?=
 =?utf-8?B?a0xNMkNKTUlRWllnZUdNbDl6WVdWb2cwNVB4OVhhUnhKV0NsNENEVStXMUN6?=
 =?utf-8?B?NWZFcXorTXVVY01qOGxTckhHQVR5TkQwYUthZUhWWllEQWdIVU5oYW5yajRr?=
 =?utf-8?B?bTd1T0NkbmdtcWtvUER0SzNsWkRtQy94ZzRUNGtad2hVdEs4VWdJc3J3NVJm?=
 =?utf-8?B?OUY5L052SE13WEl3L0xrRTMzVmRaVlc5QytOSVNhc2h4NWhpMDRiUW1nYkVi?=
 =?utf-8?B?cHNBUmJGODVpYXpIemlYOWVheFFTTnJDU3lvN1pFN2gybURiQnpYelJidE5F?=
 =?utf-8?B?TUh1TW5kaE92c0NYSTdTMzlNVDF4c0JmTVRlbTRudEVqSmw1c09zMm5QWVVM?=
 =?utf-8?B?Y0lGc3lEa2VIbHpGQSs2R2cwS0ZxU1d2bmdGWWRKRGxRQjI4bHUyZzByUnhI?=
 =?utf-8?B?Q1FWazY0YWs0RGNqUTJvaTFlS3ZBaWt2bnhDaC9Pa0dMdURUenhWSnJuS3hU?=
 =?utf-8?B?NXkwcTU4UDdDcCtlTUU3NmFzcnpYcXNIbVAvMHcvQkNKSUFsUEt3ak1tdVVw?=
 =?utf-8?B?d1o5Wm5CU3hJSml1bWhNdUdPSmxBRGxKbVJyb2VJM1JkR0Z3QkpZLys4dUl1?=
 =?utf-8?B?OVgzaXJET3BGYStWSjYzY1JIcFNVRlA0Mm05T292WndKK3NleW1KUFpiNUJ6?=
 =?utf-8?B?WjNYMmZkM05SWSsxdkpPQjBQRFNqcnh4L2hiZmdYWkliWHVSeklnTUQ5dWtI?=
 =?utf-8?B?aXdXd1lkMG9acEQxaW1RMGpDdUNYYlArQlNwdnc4TTdYZForVVVRNE96RkR4?=
 =?utf-8?B?RFVQUVl6S0pVNjBPVDB0b2dDS0JpQUxNQ2tobnY4SytJTjBLRGlOSDJjUzlm?=
 =?utf-8?B?N1lIQkJubzI4dlo1ZjhRdzNpSnlhUlFCZVBZSUVmSWZLUFp5bzZCQlVUL2pw?=
 =?utf-8?B?R3JIOW9GV01abFdVYTlraXVDS3p1d1hMYjhzRFRkQ2NjZ3VwNW9IZzVpZGp1?=
 =?utf-8?B?UG9IWDVaZUZ6Mit2MW9MZUl1YmJqaVZEdEJDbVl6Vnd4M01zbFQ0Z293Z0tR?=
 =?utf-8?B?Z2VDQU5zQWtBa3BXQ2ZwL29iUDF3Nlp4RWlhcW1TdTBnQjlhNjFtVFA4MERK?=
 =?utf-8?B?bDM4SFl2NjB5TUVUTG43bGw1Y013bDVhZTBJa09qRDVHR1BFWW04b3FBN2pG?=
 =?utf-8?B?cXBIdVo3SktWR2psV3l1YWRFdTk3TzBJVW5UOUhqUFlkSkUzWitROGVTQmZF?=
 =?utf-8?B?ZW16MXJFTW4rbVIwalkxek5PU0hCSXBydkg4VXFGTklnd3ZOcWhVNzNTZ1cw?=
 =?utf-8?B?cjhCdlg4WHJwU3BhVUlhVzRwNVhRa1B1T2JIRWZZK1R3MHJuV0lseFZnaStN?=
 =?utf-8?B?VHJCS3BMenY5UTNFUGNnZy90NEh3ZUtGakJTSnFGMVA4cnczaDdjdGJuWExC?=
 =?utf-8?B?YjkrL1RmRmhXZnpLTDlvT29pYWY5OHRjcFYzbW9MTHpGems1dm1NS3JWYVRh?=
 =?utf-8?B?VVI2dGM0bHVFOGtMdnlDbkVsd3hNZ2d5MkZyWUM5bXBIc044aGd0ZFFQT0Yr?=
 =?utf-8?B?eU8wQXBtQ2RZazVwTExURVMybzZnbDVNYXYvRWQ2MzAvK2dWS2ZPQXJkMDB2?=
 =?utf-8?B?ank4aW4zN0dwUnllLzNlUXdidzRJU0Q2M1g4SmFkQ21qa0Q5NlMza2tzU1Fr?=
 =?utf-8?B?QnhKN1UrNTh6YXlmRFQwNG5RQml0clBqcTJNK0Rja3JSems1L3BzZ25hOVBt?=
 =?utf-8?B?Q2xuRDdBdENJdGl2akdZNHZyUEVzUGpRS1hwb2JQdGhiWVV4ZWhHZTVzR1Yv?=
 =?utf-8?B?N21WVEdDT0YyalpQZExvY1ZuOU1wTkhTbjdnOHU5U2pMZVRxMjkyTVZyOTFt?=
 =?utf-8?B?cDdLV01CQVV1M1JLK2tXai80YnQ2NHJDdGVmaHMrRmxJaXoycDRla1EvbmxB?=
 =?utf-8?B?ODRzYUYxd1RnR3dTNFN4UE9BTHVGTTNMdUYyQnZGYnVaWUM5aVpXMDBiUGEy?=
 =?utf-8?Q?GJ9VU0fjKxeyZf2bub9jsc5j3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb9f7ba-fd5e-4742-b785-08dd1f6d944e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:09:25.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC5NOfEFyO6Bu5CLmQTV/5QHaHOl+OpqWEHdStrdpCBMlmyVESd9uyJvr7snfkSPQ2n81V1AdUHnG/cYHE9HoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6906

Hi Bertrand/Michal,

On 18/12/2024 14:00, Bertrand Marquis wrote:
> Hi Michal,
>
>> On 18 Dec 2024, at 14:56, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 18/12/2024 14:08, Bertrand Marquis wrote:
>>>
>>> Hi Ayan,
>>>
>>>> On 18 Dec 2024, at 12:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>>
>>>>
>>>> On 18/12/2024 08:27, Bertrand Marquis wrote:
>>>>> Hi Ayan,
>>>> Hi Bertrand,
>>>>>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>>>>
>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>
>>>>>> Add requirements for dom0less domain creation.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> ---
>> [...]
>>
>>>>>> +SPIs
>>>>>> +----
>>>>>> +
>>>>>> +`XenSwdgn~spis~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall allocate a specified number of shared peripheral interrupts for a
>>>>>> +domain.
>>>>> This is very ambiguous. What do you mean here ?
>>>> Xen shall provide a way to specify the number of shared peripheral interrupts for a domain via the device tree .
>>> I am lost in how you achieve such a thing in the configuration.
>>> All you can do is assigned an interrupt to a domain, but the sharing part I do not see what Xen has to do with it.
>> This req is about Arm's SPIs (Shared Peripheral Interrupts) and the max number you can allocate to a domU.
>> You can see more here:
>> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;hb=HEAD#l172
> Oh right, no idea how i came to shared interrupts instead of Arm SPIs.
>
> Then this is Arm specific and we need to have a bit more context/clear up here (as comment or introduction).
> And also this should have arm64 somewhere.

ok, I can add Arm specific bits in the comments. Also, will put arm64 in 
the tag.

Thinking again, this should be a product requirement as it explains the 
interface to Xen (in this case a dt property), Is this correct 
understanding ?

Also, to your other comment :-

>>I start to wonder if we should create interface requirements from the guest PoV:

>>A domain shall have a configurable number of vCPUs (1 to XX).

This should be a product requirement as well. Correct ?

- Ayan


