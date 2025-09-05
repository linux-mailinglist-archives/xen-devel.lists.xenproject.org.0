Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF68B4533F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 11:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111542.1460207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuSqx-0002WN-V0; Fri, 05 Sep 2025 09:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111542.1460207; Fri, 05 Sep 2025 09:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuSqx-0002UW-SQ; Fri, 05 Sep 2025 09:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1111542;
 Fri, 05 Sep 2025 09:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPPU=3Q=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uuSqw-0002NE-GT
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 09:35:30 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a920ec9c-8a3b-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 11:35:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB8123.eurprd03.prod.outlook.com (2603:10a6:10:2f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 09:35:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 09:35:27 +0000
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
X-Inumbo-ID: a920ec9c-8a3b-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo+xccx5SHSwszIPHuMjAG8N6M1VkDwGXCgxoRBksTXGm0fPmCq5Zksgm9cQ9eeEoraHxQZrtgZdvfAM675lhXowFPBHM4pha0IIfKVDvhwpqeu1pJoAtOcO0I9l8yCUYNcE3fv2CrwhKjfcm49EA14lSbetHj6BxxgbnrQBbCqp2JLS9limFd/9COUINS0tlxcdmrPscK+i6+7TRVVJbskSnWyOI9mex9HV8HTkhfL7sDj2wShmmK3TpprdP6Yp3owzGtxjqspebAFELWuRQ5yWeUvrYLxBAFJ1W0vddF3gscIsILlJz27rpdAjdA93RigGxz2PeIhwsWXsIPmiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmw7ki22RAI6GES44O1JMEk0m1T8j6pS5BRQwp8PvbU=;
 b=b9MyZ3+qZyK79/2s1GlTpfr8tCu5V0AfJbB+9Dm7axOO+saTvWqiZqPhzRZ7PB0csFAJHXbciX9FXkiiDZiWKFQ7x9sM9d3oztZDzShQll/pY2yRwRQol/RxwJ/f7RNotwMPaJ7fb9iEWzYS1yEuXJMQUv34qBH8KHkzGR2UgcRixfrZeGg8cRwatnVGPrpc2Z5sEW9585wIkGOcqve71GOFszBV7ONXCwxTkZJB9h9Tg04mThBYSpN+ygbkh2kZKJvWZMIUdlehkgbCeSHG24Yhg0vzIfnjcXv68AUaI5rSMbpz/PveNJ1UqZCev5T4c0ws6pCxS/eVoKNW0ZSfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmw7ki22RAI6GES44O1JMEk0m1T8j6pS5BRQwp8PvbU=;
 b=ZSYvAypnZae4qepZqRQzL4FvaCgTiEDlxnaf37aBzQuyOLC9gMdoTQ7q03x8Ij0jEgqhihwhbyoUo0jEe5dUrThOwyV0MOGjKGuzZjPjGZ5QBr/TAK6CT9o9Ms20EpNUCgVPe0usxOIfRlRkxC3m04+YOYUVfwbJ7RDBhurBkefqgLn4WJWfPBkMJVa/Pv1C9eWowx1cnDh+cUHXH+JNqM2hFD1eK3YHjDK+2I9HB71QicqX1rrBsSt2tP3etqAk0Y8+T1NLqfsMfjh2oqF1Xd5o4g+/AVNUo/MZNkOxzb5cB1/VEiNaDDpJIGsjFnyA/zc5bVeLDopL7kpebRpU1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8d95776e-e97b-4674-94d7-9ab98be0e337@epam.com>
Date: Fri, 5 Sep 2025 12:35:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
To: Demi Marie Obenour <demiobenour@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
 <5a6bf835-6c87-4e1d-adfb-a932fa1d7581@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <5a6bf835-6c87-4e1d-adfb-a932fa1d7581@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eec6fd5-84c6-46f4-18f5-08ddec5f8bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1k1SjVsbS9RazJqaXVEcHk0Nk4rYnNXaGtjTk9qZzlmSitrUTZvdDJDWk9G?=
 =?utf-8?B?T0lTZEVwMkJHUUZzMHEvOTZyU1dQMTltWnpOMkdQcDI4LytyNSsyc092UnVo?=
 =?utf-8?B?TnBFamkyTk1GUXpEUHNTYmdZZGhXWkdHd0YrUEVuV3BNSlhHVWo3VXU3MXAx?=
 =?utf-8?B?MXNYSzgvaWNwK0hEclpsc0grNTJyakpHS3NvY0VLZ0VBOEJQVXFJSFQxaGpW?=
 =?utf-8?B?ZUJVTVhZQjlHWU1UNHJ2cTdzNDZWQ1FCRkFlTFZOQWI3NERKNXMzSnBOS1FM?=
 =?utf-8?B?bGxoWFlqV1ZoTFpNbGxpcnR4ejJNR3dvTWJkZ2JMNGNvNVg3cWhCY0pucjMz?=
 =?utf-8?B?alVJNkhoZHlzTjhKR1ZQdEUvRnBKSUxUV0VFOEY0ekpiOTgwaHhCbXB6NUN1?=
 =?utf-8?B?Uk14aENRNmREQm5ZU0JOOFpOOWFsb0xLaHN1dFhYbjJIVmltdFdnZWttVFJt?=
 =?utf-8?B?dis2N084QVU2OUl0S3hZdmJMQkJJaktPb003MDJSY0JnR2MvWm1mako1Y1Uw?=
 =?utf-8?B?cTErSVpZaURqTjIyK1Q2L1gyMVdwL3UzQTBwYVN6WTF3djdzOXl6ZEdsTHpu?=
 =?utf-8?B?bmcza0pIc0J3bHd1QkFiVXQzU0hGaDU3ZlJZdWcvZDRIRkpHVVFvd3VMbXFG?=
 =?utf-8?B?L21VS2pvOWNVckFQNldYQVVkQ3NYNjNUN0xKYjNrdFhaOTNFRUtwQ0xmZ1p5?=
 =?utf-8?B?MXVMQ0xIWnZCNWVRYzc2OWk2dG01V2dkWUtoWGt3TXdiZXp5ZVQ5K3FrMXFI?=
 =?utf-8?B?aE11TVo0TG9aZytydmJNUUxCZENLamdObmhmY3poRWxFVW92VldmdEFMOG55?=
 =?utf-8?B?eTI4R3Jka1JZclI0SGdMT3ZhMzZYdjlRZ242emwxRWo2QWsyOFFLd0Z6VUwx?=
 =?utf-8?B?SlIyUU5ibGxxSkxnYWFJeU0ybXpUcFgwZUdRaVVzR0lHOWtsUTdlZldKSG5l?=
 =?utf-8?B?RVQ0SHYyWFNRM2VlMkFYT0dBZlBkbjNrcGdPa1RyMER0alpnWnY0dE03cnE0?=
 =?utf-8?B?Ujh0a1NvY0pXTmJoOUhwYldXOWRIQTBmSEp2a01IdGdNVytLMHdXUlFHTVht?=
 =?utf-8?B?RWhRUS9CUUZ1a2ZTVzYzTGpVYmRxSkxNMGV3aDVGMmhEdG9CaUoxY2o5SGJn?=
 =?utf-8?B?bmpjYmF5cWNnZWZIT2pQa3ZaR1FlUm9tRll6U1NoVk10TnNsanl2NHRUTzB4?=
 =?utf-8?B?Q2JkTGxwdzlhVzlsejd1NUx3NmJWb1IvOVRndWFxTzluMkNDTkxPYlloNWw3?=
 =?utf-8?B?cFpKdGdvM0xnbk0rbEowcXdta0JGMGR4R01vbitzQVFqWExsN25ZRGY1Yjg5?=
 =?utf-8?B?Y0F6YVBZM0NQdzlKNVR3Y0JHVEFhMHN6aTFVNVMvQ1VFb01HWHV0K0tFZFRs?=
 =?utf-8?B?VzN0T2c4U0NtL2tUb3laVithMXU2eGthajY5ODJ3SDg1ZFB0TVR4MXh0OU9v?=
 =?utf-8?B?QU81Z2pTZ3V2cUhUUi8vZURFRTlPTzR2Y29LU3paTHNyZFlDNVBOSHVxR3lq?=
 =?utf-8?B?SWt3ZEVaaUkyZ1ZBeGJoU1pKQVZ2UHpYc21Dc3pXcEhOT2FzYWNTbXI2SVV1?=
 =?utf-8?B?UFU2T2U2N0tIYjQrTmIwTUxjcWhyT2VYb3lkaE51ODIvT0tENWxCR2JrR1N6?=
 =?utf-8?B?OFJxdUpESmN5UEJET3crL0hGYVp2RG04MVBrbEZzaEorTFQwOENBbE4zRTlt?=
 =?utf-8?B?eFFMT1VJUEpUVC8rc3VhdVBzYi9rUDBqdmlYM1ZWZUY3TWVHay9BWGxPUzU5?=
 =?utf-8?B?eVpPZGE2Z3lXMDVrSnJ2NElvM3VjZ2Z5c3ovR0xjVXo3dzU0T3RzNmRSN0Vv?=
 =?utf-8?B?SWpPZ3I4ek5pTFExWTFpOWpqdVZJSmV0VWYwV25rTlFyM0MyREVRQlQ3eC9K?=
 =?utf-8?B?Wkk5VHRaR3RxeTJGbGJDTWU2a1ZjQ3B6MC9iaEdvYXBPMGxhWG9aS2RHYkdL?=
 =?utf-8?Q?FOTj+fJMxhQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2xOdSt5V1lyQXozUzByQ1M4L05LcEtZQk9RNWhrZnpwV1R2Z0RGTmEyMlhF?=
 =?utf-8?B?dEtpb2o2SU5vRm1CNkhwc1AzREd5UExSMUFjL0NVeGFWYXVzV09vVURzczJk?=
 =?utf-8?B?UmlwNWtNQzFKMzJSazRXZUM5WnNBeVh5bzdpVndGYTFDbk9OQ3VoM1kySzZ5?=
 =?utf-8?B?SzR6eUtWeC9zRFl0L2V5ejZreDMwT0cxdjg3eUgyODYzN1BYQ09MSWNrdFdB?=
 =?utf-8?B?ZWVWQk9Xb1JYam80Y0NSK0xZcmpUTTltQU9wQkEyV2szT3NsTTJiQVA3WDBs?=
 =?utf-8?B?M0YzTlFjWTFNVUVVaWFyOUhDNWN3NmZiQldXaEM0dUNHQ0dkdTFzOWp6c1hk?=
 =?utf-8?B?MTVjOUR3b01NOSsrVVVQb2JkeW9vNkk0aHhoT1hZZGswdFJpc2ZBdGdobWF2?=
 =?utf-8?B?Y3A3Y1JqeGxkVU9Na1dWSVBJVzJUdWJNbFdNVi9mSmowNUU2dzZ6SmYxRVk1?=
 =?utf-8?B?ZU5iNWVScFd5WFlHRTVWWlRLbGtqUVRuSlJDam9OY3hBNHl6RTZGcmd6dzA0?=
 =?utf-8?B?SVE1TUlsL3hXeG5wdWF0QlVRbnlrSW51QnVRQzhmR3hPbSs5MkdaSTRqMjgy?=
 =?utf-8?B?SXZHRUtrWENFcUxWRTBaQzhxYUl1QjdsZkpEaWFxOFdFVFA5RWFtNlFGUnM5?=
 =?utf-8?B?ejFQTWxoQzNFemtPRkV6Q2dMS0JsakoxTUg1djdqbW9aTGNVVXRiZ1h6YzF5?=
 =?utf-8?B?MnJCU0l6c3lqZDF5ZTBQN2JpRG9WZCtPQTl3VHpjMkV6UTBnVFhXck5kSEVE?=
 =?utf-8?B?cFI4TFdWdnRHSDRreXVrQmp0Y1g2SW5IWkRhK1ZEYzk2WTV1OUNVYjltdzc1?=
 =?utf-8?B?ek5YUWFyb1V6ZHFiMnVlMjRCWTNTeThURWZFWjRobXowb3VaNG9YUnJvZUMx?=
 =?utf-8?B?ZEdhYTd6K3FSVUJBWjZzUi9hYTUyTjNIMnNNQS9INFZjbFpjM2xwY0tydFZi?=
 =?utf-8?B?ZVpsdXpnYjhMcFRYSVhnK1p6VXp6QkdPSUtiTEZMWkZXR05mZG41Sy96VVM2?=
 =?utf-8?B?eDhBNCtKNStxSnd3Nm9JMUtNSzhNd0dEQURqeGVydmFtbFhaazFSNTdWejVk?=
 =?utf-8?B?YVF3dFZDYzR1bGhzSU5HQVNPSTliNGFpU2NyVXBzZytUMUJiRUcyelB4Q0F3?=
 =?utf-8?B?VHAvZFdSQ0lHZ01na0o1MTdEdEdHUzBWcFhocUlKVTVHSmtjcVptRXJjY1Z2?=
 =?utf-8?B?ZDFDYkRBOTkyQkN2N1FwRHJTMllXbFZZZkdTbzgvREhvbmEwTXpDRENhaUJ2?=
 =?utf-8?B?dFNTMVQxUDY1MDZDV2lLVFhhejJ2MG1RUFJUMTRYMGVZVEJmYzBCNC8yd29l?=
 =?utf-8?B?NlZERHExRFR0VjNPRWJiL1FaTW12ejZqY21FbXluWnZUZ3JqSWQ1c04yeWR3?=
 =?utf-8?B?K0ltM2V1bmxSTHQ0Qy9qYmpqeDdmT3dlc0U5eUFNTHF2U0F1MTlIRU15SWU0?=
 =?utf-8?B?ZnhDVUh0TWc5blk4WW16Zk1INUxydTQ0eXUwTktkTlJiQTAvaDlram9BVkRl?=
 =?utf-8?B?RlZMU0dMamhyTnI0emF3UG9kRjhyN1hBeE9URFhyMWhNV3doczFIYmFvU3dw?=
 =?utf-8?B?aWlDRElSQXRZalIvM1EybkxPd3J5dVFjLzNXWENTeHcwaUdOeDdNNjFVQTRP?=
 =?utf-8?B?L2lZYlArbElGS2VxRUxpbExoVkVsZXBGSlZQZm1kREF3dCtGNDhCU2lDTjQy?=
 =?utf-8?B?dkJYMkdMZy9jZXBkMWg3blRLa1JVZW1TWjJCMG5OTEM5OWkrNnFPYTN3allM?=
 =?utf-8?B?bWs0eUk3enEwS3lzVE4vS2t6eFh5RmxPUlJlSzNEMUNadkR0dVhkZmg0cUYr?=
 =?utf-8?B?VUQxelNCaE44T0lpNmtHd2trT3NhNE5YRTYveHpuaUdwT1FUNXQvTDIxdkh5?=
 =?utf-8?B?MVJidEZUK2h5QWpCYWhHalpGbkdBRnRubjNEcE9iUHF3ZE9kV2ZYR0pZOW1j?=
 =?utf-8?B?SFJSRmJQODNONnQ1NEtTMW5EMnppekRjb3hxZWo0K21uTnFPdklMeHNjQUgy?=
 =?utf-8?B?dVRHUHZ1cytCZmx2aER6SHNtM24zZktLbTlkbU5reWNpSlIwR3RqZys4QUFo?=
 =?utf-8?B?aVBsNDZLajlBOGd6MFhYektyenRRdVY0bS91WXVobytxNVBQc1d5a1F4M2Ni?=
 =?utf-8?B?ei9jSXNZeCs0UnRlZzV4Z3Qxa250QzFReDRwUzJOekdUTkk4MVNJNDErN2Zo?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eec6fd5-84c6-46f4-18f5-08ddec5f8bdb
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:35:27.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmvIt2ORoZew1M4P6aNhACy17lW9w1mVCiEnfo2w9iQT1acmvJsBqkJoVGmen0PKRDmiq9c1yXY8E85y3iNQrjYQMcRKJlOH5HnDx0SXPa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8123

Hi Demi,

On 05.09.25 06:43, Demi Marie Obenour wrote:
> On 8/6/25 05:49, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
>> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
>> systems). More over, when focusing on safety certification, AArch32 related
>> code in Xen leaves a gap in terms of coverage that cannot really be
>> justified in words. This leaves two options: either support it (lots of
>> additional testing, requirements and documents would be needed) or compile
>> it out.
>>
>> Hence, this patch introduces basic support to allow make Arm64
>> AArch32 guest support optional. The following changes are introduced:
>>
>> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>>    Arm64 AArch32 guest support (default y)
>>
>> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
>>    and CONFIG_ARM64_AARCH32 setting
>>
>> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>>    unified way instead of open coding (d)->arch.type, and account
>>    CONFIG_ARM64_AARCH32 configuration.
>>
>> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
>>    disabled.
>>
>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>    AArch32 is disabled.
>>
>> - Set Arm64 domain type to DOMAIN_64BIT by default.
>>    - the Arm Xen boot code is handling this case properly already;
>>    - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>>      updated to forcibly configure domain type regardless of current domain
>>      type configuration, so toolstack behavior is unchanged.
>>
>> With CONFIG_ARM64_AARCH32=n the Xen will reject AArch32 guests (kernels) if
>> configured by user in the following way:
>> - Xen boot will fail with panic during dom0 or dom0less domains creation
>> - toolstack domain creation will be rejected due to xc_dom_compat_check()
>>    failure.
>>
>> Making Arm64 AArch32 guest support open further possibilities for build
>> optimizations of Arm64 AArch32 guest support code.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v2:
>> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 support
>> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with any
>>    initial domain type set (32bit or 64 bit)
>> - fix comments related to macro parameters evaluation issues
>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>    AArch32 is disabled
>>
>>   xen/arch/arm/Kconfig                    |  7 ++++
>>   xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
>>   xen/arch/arm/arm64/domctl.c             | 16 +++++----
>>   xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>>   xen/arch/arm/domain.c                   |  9 +++++
>>   xen/arch/arm/domain_build.c             | 21 +++--------
>>   xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>>   xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>>   xen/arch/arm/setup.c                    |  2 +-
>>   9 files changed, 119 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index a0c816047427..bf6dd73caf73 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>>   	help
>>   	  This option enables PCI device passthrough
>>   
>> +config ARM64_AARCH32
>> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
>> +	depends on ARM_64
>> +	default y
>> +	help
>> +	  This option enables AArch32 Guests on ARM64.
>> +
>>   endmenu
> Why UNSUPPORTED?  A safety-certified build of Xen should only be using
> security-supported features.

I'd probably introduced a confusion here due to my limited experience with
Xen upstream, sorry for that.

What I've tried to note with "UNSUPPORTED" is that it's new option, which allows to
change default Xen cfg.

After re-checking existing Kconfig files - I think correct way will be:
- change dependency to EXPERT
- remove "UNSUPPORTED"

Will it be ok?


Thank you for you comments.

-- 
Best regards,
-grygorii


