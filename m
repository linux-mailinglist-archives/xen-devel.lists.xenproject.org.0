Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBFA5C2EA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908170.1315317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzrh-0006sh-5a; Tue, 11 Mar 2025 13:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908170.1315317; Tue, 11 Mar 2025 13:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzrh-0006rE-28; Tue, 11 Mar 2025 13:41:49 +0000
Received: by outflank-mailman (input) for mailman id 908170;
 Tue, 11 Mar 2025 13:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDdi=V6=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1trzrf-0006qn-5i
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:41:47 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90915968-fe7e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 14:41:42 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAWPR03MB9666.eurprd03.prod.outlook.com (2603:10a6:102:2e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:41:39 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:41:37 +0000
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
X-Inumbo-ID: 90915968-fe7e-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ef2+n1+7rDnGIxX+UACgTHHuI40nMn1QKjVx5Wc6zomNfMhgPhcaM/8QXhrs+ooH003rvIK0b7gLnU0qOtkmYbvYJQvszV6cCflWl0ry4pMi2DqrMKNj5BCWHiUXpVd/qyNC3jb470EuP7m0PUaHfYJifA2VRxhkuvb4C8N1xjD/FS+TFDETZLN48GMEzIdxM65vbHmAoFhkBihgin+X7MYuutACFoCkxWH+EfIwCCuMGBQONSlvsCacJZFtGyJ/ezp+Qq18rLbiN28mHyom72BdjXEFlvN6sdadPOto7vs2nm8HeKXzFRJ+Ebg0EYEnH4Tkt2+1UCMJlgbBcrzprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YuYqFKk1rkc5lLc985EzvHyKJVMFYuAqXUlD1w9gEI=;
 b=bWsPhIHKFr+3dZ/qKbJhURwpBKK3hPlp4qQ716D7xS9+iOaYvA6y4S3OHbFOhPsePvJJx7eTYGhwqD2NmEYj4tFGXMBpx941yoTdSqojBy7Qu/kDslwkpDJQhQQRdjuuPXFeBErnLc6EjM4+UBxXkGG8xKw9t6wCR9KWbiwIL+B7/gx293qqR5M89NxqqxFwWEpGe+QI8MkYoXbWXvGniEwfCSmYU+aRaEbN9sBpz8YOVDC74pn3AgT47xP8LuPvv+Ko0Ieel23VQrixfk81PBLHGRe21evHg1ycZuUJny2WvUEy0KworI53UHNpn8VAp6a1t7UbWyJcHk01ODPulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YuYqFKk1rkc5lLc985EzvHyKJVMFYuAqXUlD1w9gEI=;
 b=koiEtOWEOXtakoHeFL8ZLsgQEWEAYx/36hdqPP0Ma3y+KYmE8xTIADaxfxGGPLqApur+PUIib3ChMvOHP53KcZuQg81+z7/MiV9QBdIENV3guP/RMi3VlU+2xVRgBQh8Skpn1vQ6/TQ3O97L0JXliX9QiHtzqx3oXgw5oY6JwXBzdBUkI9Q2/JkZ4PEG41/jPQoaPYS/9wmpb++i4H4RwUeyjEpISk//tg+gTaj53cKZMrYCGu/O3nLctPiUI3mVOSX6+IQfaM6pkaLBwtRciXs/ADh2BTpIpwfG487BBJjh9s11QWVzGb6RRT13jk1rJyqP2xFo9CSnDnZa7wSHXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8b26199e-94f6-4a72-b1ca-efd65a6265c5@epam.com>
Date: Tue, 11 Mar 2025 15:41:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
 <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
 <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAWPR03MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 21748fc3-a37d-4c6b-efdd-08dd60a27265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHMyNHhjazFLNlJOSVN3amo3eHhOdjNmanNCS09ob0RkUVd4K21kNjAzelk0?=
 =?utf-8?B?MUw0STBGMjI3NE9tR2JHd0dOd08rY0I3bkpxTlBVOVdmdXNIZG5JcFZ5dlB1?=
 =?utf-8?B?anpmODA5NXd6WjR2eHA4UWwxdnlqZ1prYXBvdGRWclNwNDVETkxNZlM2WUd4?=
 =?utf-8?B?QkN6YjMrL0Y4cWppb2FNNVNTT1dwM25TK2hySXN0emlRN21xUllwYityaG5q?=
 =?utf-8?B?a3EzYnJyTlVnbnNQdHV3NDZDeER3QWZUTjBHTEMyNG1QbXlmcDRVeEY4R0xJ?=
 =?utf-8?B?aUpQTWNacGxmSnU2WEpidzlPMlBJcm5OM3BXVG9RNEx0cStGc1IwM3c2enFa?=
 =?utf-8?B?SVZjQ1RKWm1SejJRSFRpbjV4djltQkkrYTZEM29lM2x0N0drS2Y4T3BjV3p2?=
 =?utf-8?B?ZlNLU2FURnJBK1p0NnBmRXRBTmhWOXdwSUZjamc5UjR1WFcrMXFZSGVKRGdC?=
 =?utf-8?B?Z04yajNrRUZHVkphM3VIc2JuaTRsN2ZkUTcrdFRSRWt0bWZiSngvVXlaWlY3?=
 =?utf-8?B?UGk5cmtqR2VNTmFGOElFcnlTd3Z5ZkpKU3Nydm1yUDRuc1lGL3RoUWZQd0ow?=
 =?utf-8?B?UjJUK1lCMEhqZzh5S1dSOCtVbmlGUUVrdW54QThHRjBNMnFtZ3p5OTArN3hN?=
 =?utf-8?B?OTB5S0g2ZXBVNFh1S0Q3QlJxMlFaOVpoUHQ1ejQxU3pRVE1hZ2g5d1BHeHF4?=
 =?utf-8?B?dFE5Skp4b1R5KytuLzdBbldBTWNTbUNVRmoveGlwOXFma3BLRHkrTDhXQWNn?=
 =?utf-8?B?ZXp2T0ZkdWJvaVQzZjJrdjBiQ3dFM05PQlIxNytxNDYxYmVsaE12bUdhbjlo?=
 =?utf-8?B?M3dLZjIwZHVXSTZsSW8zdHZjNmEzTk1HcDRQRmpXbTNtaGFKZmtnb1hFZDNK?=
 =?utf-8?B?MFYyM3VpWGhTb05hUENUMDlEdjlMZ29NQkhyZmVZWWVLTnpKZWV3YTVFMU9a?=
 =?utf-8?B?NzN6MW1ZUjVYOUdIUlBTclQvY0VEdmdudmR2aUZYZ3lhTGJia0FHUE16VDZj?=
 =?utf-8?B?Y1djUlh3dU12V2wxRnNDUVdubi93VUZzVXd2dmVQbkZxZzJjL1ZuNHptVjJy?=
 =?utf-8?B?TXU5bGEvMEZJUzczTVNmQXh3b2Nlb1V1S25OckwxbW5nUXY3dm8rUWp5Nis4?=
 =?utf-8?B?azdxTUVQRFVaeTlJQzYvYzF1TDlFNUlac3dGS2RtWGx2aEdKNkE1VUpxVWNx?=
 =?utf-8?B?MTZ1b2FKcEdEVzdycTg2dHFtdFJNcnNXRjI3MGJsUlZLMzFkSUxMYkNVemto?=
 =?utf-8?B?YVZzOWpBSm52RmZPTXppc05BSEZhSlprZjFodXRJQ0NhK1hUTkJrQllBMmNZ?=
 =?utf-8?B?TFZoMUYyUnk0aUQwaC9NVEN0T0IrMUEwUStqNC9wTFJ4dzI5aVFQZEtJeU44?=
 =?utf-8?B?SG1oRnZtZFdmN3k3bnNNcEhEUDFBNGVIOU1wQ1RRRGlmdXkwNkVYSTFrRzFu?=
 =?utf-8?B?bjRCbW9LTTQyK2twMy9KK242UDI4N3c3SW92OVR3aHMySm9QNU5PalVzaE5W?=
 =?utf-8?B?ZUVmMHhjaTlvR292TzJaYmFrZ0ZIV1NGeXd1V2tSdGtQaWEyTmR6U2VIYmdO?=
 =?utf-8?B?UW95R3ZMMHFKcDJVQnJvdFVBSkJiQjVkRUFBUFNPQTZhMmZwK1ZqNDB0NWNJ?=
 =?utf-8?B?OU92MXhCVHNON0dvOTh4TDUvYW53M2VzUTJQZmpQU2g2cy9td2VXVU1rUDJu?=
 =?utf-8?B?bC9PYVdyVE9nOXdaNG0vOCtyMjRHTDJiS3VLV0M1TjA2RTNWVzFBa1I4cUNH?=
 =?utf-8?B?ckZ4Zy85VmZMRFQ4bHFDNlUvNldlRFF3Q3FLUG0xcDM3VHQ0Y2lHa3VhUWFk?=
 =?utf-8?B?ZGk1UmRpa3ZNWjg1ZUdwUnlkOGx4M205SjFFYUtTSE1HT01GRVlZcHAybnl6?=
 =?utf-8?Q?CKA8vexXc7lZq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDNpRWsrbEwyTFVqSnF6M0JEa1VTVHM5bW1ZOEMxZzVlYy9rV1NMR3NLbkRE?=
 =?utf-8?B?Z2lkVEtmRVVSM21hZWtMckVvQTRHc2VQK0hUSUZnYlg0aWRVSnd1ZU92UzBW?=
 =?utf-8?B?TEowM1p1WG5iMExzaGlKQ2VQYkRPWVlNNW0zQTVTTmNmOExhUVVZa2Q5dnI0?=
 =?utf-8?B?c2REQ2phVnY2bmVYYXlFZVplVS93azErMHJsUFdoUmNXMXhLbVlCcHZEN28v?=
 =?utf-8?B?bXo4SVFSNmVFN3VxTG9zcFVBUG1HL3hKRUl6ZExHNG1BNDZqUDVodi93L0ZJ?=
 =?utf-8?B?dGNEcXZPc3pWeUFBdEE4WTlzVkIyRnJYalBZUXhPZTdHUEFxajNkVmtkbWk3?=
 =?utf-8?B?MnhJK2ZnWTBWNFJ6VHRaTENpdzRiakE1R3RrTDJBUUk1dU1DTVN5L3c1ZGMy?=
 =?utf-8?B?V3dyWU1lTjROcE11MW84b29LeFNlWmVXcGtNK21walJiYWcyempPL28zdi9F?=
 =?utf-8?B?ODFhWTFhUk0xU0RURXQwWHJHVG92eTR3U1pyWW15UXJ3WVVYbjl0bnNMN3A5?=
 =?utf-8?B?QXdRZXZhVE5xZC9URTd0WHFmci93SzdIT1lEcEYyeVFQVUZXZmlJU1hzYUpZ?=
 =?utf-8?B?WWxrSUMzbVV2UXFlaDE2WEkvcFJ2T3ZtOUpwa1REQWNsRENVb2FLbDZkaWUw?=
 =?utf-8?B?L1YzRU1KWitOb3BNc0gvWWJPUDFmNm1haDdNWXVuc2txMEZ6QWhEckRWZkpr?=
 =?utf-8?B?ZmFjTWpHTnZBWnZNOWd0VzRoOHZ4dW5zV09ER2xVNzFkMjJBc0R5ZUxHTlly?=
 =?utf-8?B?VWttcHQxSkVVYnhQWktWN1AzcVNWQms4VXRMVWI2R3BsZG1wa1FCWU1HaVpX?=
 =?utf-8?B?bzZxbXJUd0Z4UDMvZkJuUmtnc1Roc1lTR1g1N3ozakNCY3NpV1hGRHZBS3Fz?=
 =?utf-8?B?MFVmU0ZtYTRicWRXUk1jRXh1RFd6dUh5ZXpxSS96bkI0THZtVlE4ai9FaVBa?=
 =?utf-8?B?U1NMQ3Nrb1lWR2UySWVFZHBJWkduNUxaZC84U2RCN0lsYk4rNU1nTkd6SFI5?=
 =?utf-8?B?Q1duKzJpNUNZdU9BdHYrbTNjR0E4YW1OZENzUlljYXlmaFA5c0JwZTUwemVo?=
 =?utf-8?B?ZWJKUUhZZFpHcWRyWjhwdkFaVURVVCtVN2NjRFhlUTM2dktTQXNDa1hRVmht?=
 =?utf-8?B?Kzk0M2lBcVRUVEVjeXBoaDhpWVlvcjN5cTlWNDdIK3NCRjhBa050S08xMFZK?=
 =?utf-8?B?M0R5dVBZTVFKOGZuMHhXQ1FtcUNLd1lRc2kxOTZtNmxkU0VxMkZMQzFQVFEr?=
 =?utf-8?B?dHVqWVNjNFBubGtzdEU5QU9FMWRmbnFxaE9Fd3hqQTB2WElvNS9ESmxVNFRL?=
 =?utf-8?B?WHpLYm5qZUtDZCtyS24vMnR0U3lRNkc5ckU2WVF0eDYzUTJINDMydGZod0dh?=
 =?utf-8?B?ek5jVjB1cUFmNENPYWZMbkVJL1MzZDZvZklaM05nV0ZPTnRleVd5UVM1LzRQ?=
 =?utf-8?B?OXRoZUR6M3dNOXB5TmJQc2NTNGZjclFBNnFhTThqdlJpenYrWWJ1S2dyMDF6?=
 =?utf-8?B?WDhmN3IxVXQvcXhRa0NVNnRRSTc2amZLbW4yRDBwMytjRkpZNG9ncitaRG1k?=
 =?utf-8?B?UDJjdGJkMnlZWDJOWC9UNkJNbFpZRGR4a1FFdEM1UWpUbGNvbTQ2eUd1WVVn?=
 =?utf-8?B?VFRNSUFvTWtBaUl6c3Vpb2ErSDVua2NMT016MWZFZlR3blcyd3hpaHUrelNV?=
 =?utf-8?B?VWRJV0h2RzAxUzBsWEFXSGZLNlJVcWtXWmJhUWFJYWxCTnQ4ZDBFcXpSVHJw?=
 =?utf-8?B?RE5WTTFXSmwzWSt6TkFxazQwRVRlaEdIS0d5eWFHYmxGaERzbHNYbGJnUDIy?=
 =?utf-8?B?bDVxOTdNTWRpVTZiMXIzUC9OQmJXamgzSkpsSGZlK0N2dFcyTWVCMCt2WGJj?=
 =?utf-8?B?RWR3ODR3NEhvYjZNa1FmaDBKWUlkTUhWYlFIVTlRMGpMSDhMQnVKYXRLZ0hQ?=
 =?utf-8?B?NXZSVGFGaHcwNklHTzF5WnpORHQ5MVVmbnRjVFQ5d2doQzFERXhIaUNCV2dN?=
 =?utf-8?B?MFYxZHR0dDFnUTdPczdnOC92VnBWT2xHUGJRdCtoSyt5ZFpveUdzNmxZRGVs?=
 =?utf-8?B?UHJaS3VQUC93cVpWcGx4SEkwQUhKVExsMnd2N0s3YW9aTjVtanJndjZMUlh0?=
 =?utf-8?Q?Phwfh0YwmP5s42MunW02zqtlZ?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21748fc3-a37d-4c6b-efdd-08dd60a27265
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 13:41:37.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvkj7Juvs8b4cMOOGzNKVMXvJp+bpCuYcXwMtua9AGZ5jKcAyuzTYxIkrIfaEEjQI5nRl+zlL6YP8Ny18l+Z8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9666

11.03.25 14:01, Jan Beulich:
> On 11.03.2025 11:23, Sergiy Kibrik wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -92,7 +92,7 @@ config HAS_VMAP
>>   config MEM_ACCESS_ALWAYS_ON
>>   	bool
>>   
>> -config MEM_ACCESS
>> +config VM_EVENT
>>   	def_bool MEM_ACCESS_ALWAYS_ON
>>   	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>>   	depends on HVM
> 
> I still don't see why we would then stick to MEM_ACCESS_ALWAYS_ON as a name
> for the sibling option.
> 

as HVM requires mem-access to be enabled I felt like it should be kept 
as is -- to hint that it is mem-access that ties vm_event to hvm.

  -Sergiy

