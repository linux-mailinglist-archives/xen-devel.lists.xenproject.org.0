Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0858984548
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802675.1212974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st47i-0001mB-Hk; Tue, 24 Sep 2024 11:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802675.1212974; Tue, 24 Sep 2024 11:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st47i-0001jb-ES; Tue, 24 Sep 2024 11:54:30 +0000
Received: by outflank-mailman (input) for mailman id 802675;
 Tue, 24 Sep 2024 11:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Xj2=QW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1st47g-0001jV-90
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:54:28 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2409::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda23618-7a6b-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 13:54:24 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Tue, 24 Sep
 2024 11:54:20 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 11:54:20 +0000
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
X-Inumbo-ID: bda23618-7a6b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFIkf0QohFD1Eq66yiiqjHuBRtAtRtTq/omj1iw2hTFlbjMKFvXELRldzVyOtCN6Hn4vrayWDZp5L+I+hnWD/50gr/AWLaF94McOEJ3Tl/SmDPKeGzUB9bROdfmXAePB8lssk8G9obBA0Q1N9wVcKzT3gwrefl6DoZ/JGTQohDOLZ3GiWtE4vUoCQfpPf2Tlrs0oOq0p/eDGkQDkQy4MEZomhp6WvRM2B3N2BmQnDW9JJnaFNtT+otMqA7yyKehu25QlYwPL9k3WsdPLoVQfbNNDIHlDd0DEsiWv/4rO9wbAvj1a6p0ur9DA9KzbjnbS9DYFLajn9R0hE1c7Eixoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl4tMRHbIutj3UKY12jrVuBN+pLKaojPQ5tBPE6ose4=;
 b=MyOo5+07IqkcuiqcZHgVxObCqn6RP40c5iGKA4gj8HxqRRBMvh1QijN64YPGc2CkW56M76TLPwkMsm2zBqsotLkOZ2icQw5eEu44gABB66YZz2X1b/DlcfV8B20J2U8O4/SKWbmT4oWa+3bYroz4hLnWqCuRh0dWIl5VsakiiSTE+OU5MjH0MOuQ4iODIraVSB0q1JurGh/ys1FgeoO2chgzC10PP3FCGOmPWtTEgNneBHjbnVzx1VXvbLnB4uvaL0JVbgKr0oGDOz18mzE2DtMl+w4yYExGY7jZNh24iaB0DYoNc2Go/+pPT5AyNccASvubGrDceq/IT9OLRPzRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl4tMRHbIutj3UKY12jrVuBN+pLKaojPQ5tBPE6ose4=;
 b=lm8hSkDDpybjiz7OlRW9I9rbUsFYy5Gwn56zxkINrTymFg3bZzGXXUC1ZOxNrzm7MPvxUIfd/4o/VzuU8D22AFzmh6Fff4g/T+3o/Y3zVMTnmmImMnpoQzi4iZn+DtKD0fH2/iKH08QKBWdwMRLVDcOB+5XjCShCFyEZnHJjKTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c0ce0c42-6b23-4687-a444-81a617629125@amd.com>
Date: Tue, 24 Sep 2024 12:54:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
 <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5af600-827a-46fb-612f-08dcdc8f9ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzBhdnpad3RwOEI1bk1zYkRmQk9NUFpLUi9nV29YNnVrWFF6TkNYVW9jUFF1?=
 =?utf-8?B?WFJwWndmRVdBNjZjVFdKNGIrWHRVa01pMGVKcG9scDM4bS9pSTJWUEMrN0ts?=
 =?utf-8?B?UzhkRWZOUlBTaE42Ly9lMWowdGh3ODluOGVqa2VvTVpOVEJwWlJUQWJCR3FW?=
 =?utf-8?B?aFVucWRqNzFaUU8wbVlSeC9jNkxvYkdCeWVHbE04WStTNjlaSkllU0lGeW9z?=
 =?utf-8?B?eDc3M1d6SWwxeXlTS1pRVUVMTmtlRDRBS29iTldNRFB3MGlSRkgvNnhqSHJL?=
 =?utf-8?B?UlAxa2pZcThZZXZEcUFqSmV1dEQ4cnV2K2VzZ0dDdlJHdE9LVGtsRTErNm55?=
 =?utf-8?B?ZHlpWVhQdS85OElNZk12aDhLaGxTSGIxZVhrM205YjZjRmxubndSWVUyalpX?=
 =?utf-8?B?K2UrUzh5YVJpRWdrd0xxWDViQk1UN0VkZTZiektQcEdJWjZON3FnZ0xaY2lB?=
 =?utf-8?B?WS91UlNReFhaaERZSVRkMk1MaEJmdlNIRzlaUW9tWlh0d0pJNW0rbEFacDht?=
 =?utf-8?B?eWdGTWdMYXdkWWNmZlRTY2VBQlEyRExmQmI3alQ3bG9rZ29GRGtwaGpDOWVH?=
 =?utf-8?B?OFhkNjZ5WVl1YnEyR2Q3bmhOdnZmTHBpU2NjNnVoVUdObytzeUo5M1hObUsy?=
 =?utf-8?B?ZUJqdExFS0g5amo5QldtOHE2V3FpWjIySHNaSUJSS1htYnlrZVlqL2g4SWIr?=
 =?utf-8?B?V0tUY3drR3orK29BbXBUNStuQnFzamo4Z3VEeXBDMlVlRG9xNjl5WmlFUnRs?=
 =?utf-8?B?UlR6SkNmcGVVbTlTdC9KUnhveDR5SzV0bXd4Qy9vWVNmSXFMd1NUK1JJZkhy?=
 =?utf-8?B?eVBhVnZHc3FmU0RXazhSMTg3TWdqZDUyYzVyNDZJSyszWlVXSDJJR21QN0M1?=
 =?utf-8?B?VDV6V3JjbnpIbVpDWkJRZTdkMHNMMGptTTJQTGRIamVOM1RQcnQ2a0NCUWRo?=
 =?utf-8?B?RCtmdVJnZGdsMW9DcGxWQTRLWnR5cUlsN3VsbDBPbThEa1VGUDB3VGh4QzVU?=
 =?utf-8?B?akJqMlEwWTYwN21xbXNFQzZOZGtmTzZDZHBqZjF5Y0VuQWJrcDBXankrVDhq?=
 =?utf-8?B?cmtLazhIckJnU1IvSmo2SlRSYi9ONVVXOUFtSGZWeVZ2dm1ka2Z0elVoTnlD?=
 =?utf-8?B?RW1WSVNVZWcvaVMxRDk1a1NnQWZOWnd5WTQwM1JmU0Q4UVBuM3BQeWN5aSs0?=
 =?utf-8?B?NGlJU0RONW90d2dUdEc4TzMvQ2R3VjlHSHBEdUFlUHlCaUpGQXFqUnZHMmhS?=
 =?utf-8?B?cjlpRVV4MU5oUzJOS1VoNzhZR1FmUi8wWEROY2RBMzloRFBuYXBaVHRrRjBy?=
 =?utf-8?B?K1FYYWFST3pkSWdST09QdmVra0lSaE1zY2J5TnFqMWdzSitHc3ZSUEZTMCtM?=
 =?utf-8?B?N2xYQkYvZGhZdUlYckl5d3lISXd1NUNMQU42QlhQUk1JTjFaNHgvMm56KzZJ?=
 =?utf-8?B?Z1BieFZPdTJTUkFvN0ZQVTBJVUlEb29VUzh3Uk0rUXRwUFU3SDVraGxNTFA2?=
 =?utf-8?B?SGpYc0dubjVjTWtEVFlhL2liVXJ3ZlJUTHhGS3JJSFJPS21oZ255elh3Myt3?=
 =?utf-8?B?bU8weDNjK2dlL3ZxUk9yQVgyV3NwcnR3aUtNcWViRXdnQXRUamNGdGhlSXFI?=
 =?utf-8?B?bGtpd2xDc3hJR0kwZEhGWjJ1VVJGK0pQM0UreHBiU2hzR2dUSTFIdzNqMkNY?=
 =?utf-8?B?eFpiclBHbUR3NmRuYnhkNnZ1bzRrRW9HK2RaUm8yUDdyamt2Yld5cWxoRDR2?=
 =?utf-8?B?Z2NSQ2RjWC85VC9oWk9nK3c4S1VnMXFxWjVQd0dXQkFwUUVRcklnOHJIeUJ3?=
 =?utf-8?B?WlA5MzFQbzR3L1dHdDF1dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZndSSmFidnYxaUt0dGZhRDl5TVJZUVBBM2JIdGVSendTZEtKU1lyTjZHSmQx?=
 =?utf-8?B?bmE3RFhDb1hLRXZqbFdjRmJ3elRHUjN6MWdvVXFxendYYXlWbDF4MVFDZG9i?=
 =?utf-8?B?dUVGaHJKSndETnJvcWJlTnFTUFppcDVvckRRSkZtbFBXdHBYcTliRFVIWFZM?=
 =?utf-8?B?NGpXc01PWWVnOEVESk5UclRxeHJPRDloUnM3Z1VoM0JvN3B1S3hNNCtYeHAz?=
 =?utf-8?B?d25WeU5QNkZaQjlmSERYQXh5aWVkTmU5TS83Wk1lVkZtYmUyeEtzTjF0S010?=
 =?utf-8?B?dkRhN0NBVWR4Vm14Z3JRODVKekU2VGIyYzZuRmk2TE42UVVkNDFMVDl6RmRT?=
 =?utf-8?B?a3YyaWY4ZnllUDIzL1VySHJqSGhReExaaGw2enBnR3djU05HSXBBeE5wRGRH?=
 =?utf-8?B?R0svKzZiZ3lwL0J2cjJKUFIrdkdkZ3haUnpNeE5nRmxJZWtxZ2p0WmRWZ2dV?=
 =?utf-8?B?NUhRVGw4cmVpY0ZSN0JvK2ZSS203bW1pWDBTNXJHVU9TcWpYbUYzOXE0UVFh?=
 =?utf-8?B?QWRtOFBEak1oKzJuTlRVTDRjT3U0OVVqcURWRFhvdXJJVjBVUERISWNZcHdI?=
 =?utf-8?B?ODZGZzFxd0hLbkJqa21LalZheURSYUxrclFGWWhXaW1xS0RBZEluNityTDRR?=
 =?utf-8?B?dkFMR0I1WE5HRjZwcnU0Qnl0WndpRHBEb1dXVWRabm9wYmF4T3I2YWxEWmky?=
 =?utf-8?B?RndMS1I4Tm5nK1dNaHBDSDJTR29aS2NVSDVRcUUwQVJBTi9tdng5OUdJYjB3?=
 =?utf-8?B?OUVadlQzSVkzbFpmdHNqOURwaWxFK1Q1clY1Q1htYmZUbGxnVWVyemhIRlVk?=
 =?utf-8?B?WHJ4bXFSRmoxRC9DRGl1RjhVUFdiNFJKRWdxVEtlL1RKUEVrdGhaMGVXRlo4?=
 =?utf-8?B?L3ExT2tIeWhJUUxLVHhZckpPVzQwL2FyeGVka0MvdlFySnlYMVphOVZzMGtJ?=
 =?utf-8?B?eG9GNjRadzc3VHJwd0NpK0NXb21iNnI5eFNzUHFiSWY3MDJOZDlqZGdZdndY?=
 =?utf-8?B?VkZDMlNPMHdWbkllQzlkdm1PbTM4OXBCUGZOYzlXQWN5VGhUL01PWElEWDFk?=
 =?utf-8?B?ckN3RmRnZG5jUnJZcmR1dUdLRmdaM3A1QVlKTG1qNzZrMExqYTZVYnFMTkVH?=
 =?utf-8?B?QWpmRjBuMlN3Wm1tUis3WlBoRG9rN0plSmxETkF2d1ZkRTdzdUs1Y3ZmdVRR?=
 =?utf-8?B?VVVSZ2NMUStld0FRL1NnMTd4RUF3S3JOelozY1ZodGQ0dXVwVWQyZzdrOW85?=
 =?utf-8?B?eGI4V0ZkRVNlK2tMdlIyTmtUY3Q4NEx4R1ExcVJ3V0RMYi9RRVdoRzNCSURh?=
 =?utf-8?B?b2NLZEJTSFZ0d0QxOUIzUGZUV0ZhMzdISmIrRVY2amNUYXRZR3ZBSVA4K0lC?=
 =?utf-8?B?REVMeTMvQWVMM0drQVJQOElhQ3R5amlSbDRIUGM0cVN0U3d1VnBsV05vc3Ix?=
 =?utf-8?B?VDlOalg5WWlVbDdTK1NUUjlreVhBV2Zxa095c0JENE9ReFR4aTk0QUFnbVRr?=
 =?utf-8?B?eTVQck5vcUI5OXRkeUViU0xJVGF5aDZaOHU1TzdacGRQSHhvdlhIMlRMVnhy?=
 =?utf-8?B?dlJ2am9lWmJNbUh3L2xFUVZYeGt6N21UZW1qZ2FMMTFuL0VicTYrOTFEMEk1?=
 =?utf-8?B?TE04VWloMkZneTQ3WlJSSkY4YldFRU9kZDlvYWtmZUVsRWV4TkNDSGdIdWQy?=
 =?utf-8?B?dGUwWmNvbU9uSGZTaUZOTkM1clZmY1JESldNakR1cnZLSUQwZE9TM3EzWVl6?=
 =?utf-8?B?U29ONXlsMjlCL3BGbkhJQk9xR083aEY1ZWx1RlJabkV3UWgxbUtqTzdDOWJs?=
 =?utf-8?B?b3RUaXZoU1JmaFF6WjR4R3BTajlES1RBZzBPaEczcFpaT2IxbVFQSGI4S2FE?=
 =?utf-8?B?UWE4Y242WTJ3dUU3QlhXa2J0eGZMQ05LSlNiK2VPWkRpUlRZd2tQWTRzaHM4?=
 =?utf-8?B?MGRFeUlvZjRBOStEcEw0a3VDdVROQWxndEUzWlVZL3cyYkMrbFFacWU4cTBy?=
 =?utf-8?B?U1pTT2pDYityb2J2ZXY1bFdWdi8zN093d0FxMGJpQ1ZXaWRkZDV4bVgvL0E1?=
 =?utf-8?B?NldqOXpnbEowYzZMQjkrWWhEdStWaUFRMXdZRGl6ODc0d0JKVURoVmdGMkpC?=
 =?utf-8?Q?zS8R2MrVnTJ2hpDFXTGBbFtFK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5af600-827a-46fb-612f-08dcdc8f9ff9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:54:20.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04mMT7+0UWRWAgMJ0rmT+Du/dAHcRcOotbwBHiVOTfB8aOtxYwnSBrEXGGEC+lPNIIGrEEl28m5X+lvFb3bvLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7937

Hi Jan,

On 23/09/2024 11:23, Jan Beulich wrote:
> On 18.09.2024 19:51, Ayan Kumar Halder wrote:
>> Secondary cpus initialization is not yet supported. Thus, we print an
>> appropriate message and put the secondary cpus in WFE state.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. NR_CPUS is defined as 1 for MPU
> Not quite, what you do is ...
>
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -11,6 +11,7 @@ config NR_CPUS
>>   	default "8" if ARM && RCAR3
>>   	default "4" if ARM && QEMU
>>   	default "4" if ARM && MPSOC
>> +	default "1" if ARM && MPU
>>   	default "128" if ARM
>>   	help
>>   	  Controls the build-time size of various arrays and bitmaps
> ... merely set the default. I wonder how useful that is, the more that
> - as per the description - this is temporary only anyway.

Yes, I can enforce a build time check like this.

--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -295,6 +295,12 @@ void asmlinkage __init start_xen(unsigned long 
fdt_paddr)
      struct domain *d;
      int rc, i;

+    /*
+     * Currently MPU does not support SMP.
+     */
+#ifdef CONFIG_MPU
+    BUILD_BUG_ON(NR_CPUS > 1);
+#endif
      dcache_line_bytes = read_dcache_line_bytes();

Does this look ok ?

- Ayan


