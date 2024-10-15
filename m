Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703BB99F241
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 18:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819246.1232528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0k05-000798-6r; Tue, 15 Oct 2024 16:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819246.1232528; Tue, 15 Oct 2024 16:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0k05-000781-3B; Tue, 15 Oct 2024 16:02:21 +0000
Received: by outflank-mailman (input) for mailman id 819246;
 Tue, 15 Oct 2024 16:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOwl=RL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t0k04-00077v-Aw
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 16:02:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20628.outbound.protection.outlook.com
 [2a01:111:f403:2409::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dadea780-8b0e-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 18:02:19 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 16:02:13 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:02:13 +0000
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
X-Inumbo-ID: dadea780-8b0e-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai/ikcrOd0jcAKlBXgJ7Tz9AQDmAC326sit/QZmwJMn78iE0hGjoVSDlpXNSxO1VRFIdpQgcJSG899YLj2bZV9YsPywB+2qIbd1eMaq7zxbBuD+aY4x7qKXphKVehQXzD2v1R9smiPDwSPQfqfc0+vzr9GZ2nCyp5hviq8hKKyxrWMd37XUV1K7jCkpm7ZpJ248L3sCok64FskxSmtAobw91l9EACtFDkOceXgGmLRQZ2VdY/Gu4mbx3HZKSqjElWT/rasDExU6IUqc7NSxE+cqqTbSfNNqXyFGBLevWDA+vtquyyV5nsp4Y2QlhtsFcxNJC+QmdzQixjMq0l0EoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3STdeFXG/dPSbZJRVZQhBxxW1fuCYH3wF6eTLPrbX0=;
 b=S5IzuMaxNtdVtTE6yp0D5dLy1cb1TvS3WTyanjtnIhn9vsKDqioCZUzrceQpzdKWwslyKEIVSHQhv5YfiNAP45OAgnvWfTpcSapg1S4MxQhDkHw9sLvimZeFs7wtOxhg3uut92Y5gqSDJlPGuQd3AWzoBD2v8GAnEPglBpLILwDjYG22n/eGN0RVmgmIx0oQZrEPNPfVHcZfFwFwP41037Z0W9yPrr99AYPPTjymsiBiBNAn5YjOjxq8/+I0vJPxZWePt4ZPamXiFbeJV/U6eqxXii4UU6ZPxhhRp4UaHJlC+N5tW3DdYe9eYQjReGx+sd0OV/99/Huyc/4fORBaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3STdeFXG/dPSbZJRVZQhBxxW1fuCYH3wF6eTLPrbX0=;
 b=4RbpuzbNEYLDpSTF1BIb/NlkKADMMabNVnaRVYNOSdFJwiZhK9I/CzmbAZSouF5AOefulVq80FNMQQZtRGf3Y//OljGLpt4W9r8E/mRpxEPQ380kAASjiSAg5/xijJ0SVCFfmOOOrIcBVTcJSC8u/QuzTJ0fpmkbq1oCpke+has=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9d0131ae-83f7-4f7f-bf11-78251fed5739@amd.com>
Date: Tue, 15 Oct 2024 17:02:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <6B1407DF-6FCD-4823-959A-F516CAEAA309@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6B1407DF-6FCD-4823-959A-F516CAEAA309@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f74bed2-f720-4c6e-3a43-08dced32bbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUdickIzK2lTeHgxUWU0QjgzREpKSGlFZDFDNHNVMlRLRFpnbFVURm10OVJa?=
 =?utf-8?B?QXI3UXFLeGQ1N0w0RnlKcUNOSmh0VjZCWHZjaHFsTHB3RGxPbnJwSkZGWHhK?=
 =?utf-8?B?VmxFSmZtRmlPNnFnVk1FNG9zN2dGOUhkcnZLVjBOQitSY0JCY3E0ZWVSZ1hV?=
 =?utf-8?B?MTlpS1R4bmdvY1dBSjdVQjZ6dmlnZmFRV3ZSOThVc2grVGVuOXVsTHhtc0xr?=
 =?utf-8?B?bWRKS2h1aW4rL09HR3pLWE9XS3N6bGQzMkdWOVhpalNwNXlYYmp6bFYwbHgz?=
 =?utf-8?B?WW1WQ0w1U0UyZytrRVhBb3lCTFQ3MTl2MzFBQ3JxMk94V05SUFV6NkRIZGdN?=
 =?utf-8?B?SnBOS2wzd0VaYmJvczJ0OWx6UDhpRlZjdGd6c05hU280eHlvV1NQcDk2cGZM?=
 =?utf-8?B?ZGhjQmUvWHB0YmZ1cVQvT3E4MDdicUowZXlXbWZmYmU5K3NDaXpZUnU4N3lO?=
 =?utf-8?B?eW5JYU82ZGd1V2dZMTdnWkxSbWhRVWN1Tjl1MUtuL2huYjJzVmdXT0NxQkRQ?=
 =?utf-8?B?d0hvZFVwd3N1OFpXcFBaOThvTTdTU1k5Y0ZIY3R4cmxJeGtNbGQ5eVJsK05Q?=
 =?utf-8?B?TnowZkdDdXp2K2hnb2R5d1dVcXIwVW85OWJ1VmRmVnRqRzZBOWJXR01Qakkv?=
 =?utf-8?B?OXJtSU1ma1RFbWxZMmQvZmZPM1dWWTBkTmdlZHpzZGJMOFE1NTM2OXRva2ww?=
 =?utf-8?B?N0ZoSVZkSC9VdStiK1NvZjJORkdSN0IxUW1JdkR2cXQxWE1IRXI0bzlZUUFE?=
 =?utf-8?B?WGdWb0NPS2ptL3hXYTNwZnh0K0ZkVUhIdFlzUHh2VEdYbXpRVjBMSGZLVWo3?=
 =?utf-8?B?bFdhdnBzZ0lqS241VHRPSmk3VVg4TEZwc3FnSUlNR1JJai9Ga2JZZnFJSVJR?=
 =?utf-8?B?VmxvQ0dGVXJtSUJEc0twMHREQ01MQkR4UTdUTnliTWR6ZmhyOE1TZDZjdjh6?=
 =?utf-8?B?dEVmY1BQb2tSR1ZpRzVuUXpsZGl0UXIvaXVzanJhMXdXK1preVlvQ1hmMmNl?=
 =?utf-8?B?QnlLSlc0eUl6elF2T1NWU3NNLzhkUmFkdEZIelNsN09hRThiekRWTWk5azZp?=
 =?utf-8?B?ck53Z0dLQllSMlh4UWVBQkI5NjNYK3NIVWozR21HRWl3QWdpR3dSZlRHRzdw?=
 =?utf-8?B?VFd5c2Iyb01od0ZuVlpqcW5NVmk4RmNoRm01ODJXbzZLUzlFcmpxRTRVMXo5?=
 =?utf-8?B?UUJWVGx3VWNlSmlmV0tXSXBmQm1qU0hLZVdMcExhMFJ0aVNNTitlR2NwMml4?=
 =?utf-8?B?N3ZnTUtjRnVGL0pnMlJDclhkR2tsWHZCdlBuSkRsYVNPWVFUbWZZc3BKK2R5?=
 =?utf-8?B?U3drSUwxU3U4a0RjY0FVWm1JZkI1ZFNIek8vcEh5NGJBa0lmMmR5UTl2YUN3?=
 =?utf-8?B?OU9DWXlwZHUweE1NTmxNZHhaWGw5d0d1UHhhQ3NraUZ4VkNEc21FSTlTRktN?=
 =?utf-8?B?NFZJdUZiVVdId3d4ejRlQWFmZTJzYkhKbW5wTk9HcGZpOG1mUGFjM2hFd1hx?=
 =?utf-8?B?TUUwMkQ5SDNGN2pEeitiUzIzYjVTaWMzNysvTEg0L0hwQTlac3pLM01YVmE3?=
 =?utf-8?B?aVYzM1dXRCtpUXh3TzhOM0Q3K0ozbmYwVVBneklMbVJzUjdaL0tUZkM2bHNT?=
 =?utf-8?B?TFNxVS80R2p4Vzh6OGRSNCtqdnVycVdnQkdaeEFlUDZSRFNWQ3owQTh3QkdY?=
 =?utf-8?B?OFQrdUt1NzRLeC93S1dob1RNd2Q1ME8weGg4eVJCRWJ5MnBYbEcrTzV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhreWlKQnNDbVY1MGU0Q3JZYXFaZFpHMjdrUk5xR1U1N2t5cE80VUpSeGpK?=
 =?utf-8?B?RHVzQVZqR3Z1NEVNMDN2VEM3eExxNFM4TE1LaXpXN0ZvZm11Z3FZN0ZDN0V0?=
 =?utf-8?B?b0M0KzU3dlMrbnhkT2kzamQzZ2YxZWI1UjdJQ055azl1c2J4NnpjQlF5YXVJ?=
 =?utf-8?B?M2VUR1ZXd1RKSU1vRElhVlNpOVVqQUhVQkZwUzJZLzVldDVyTW5Ra1N4WUVN?=
 =?utf-8?B?UlZuYjhzSTcwcS9FRm9pOTFqUTkrU1ErWjVWdFM3Q2hQVEt4TFl6OSt2aVF5?=
 =?utf-8?B?SW5NZGc4T3A3eCtGV3U0TWFORUlVczZFUGFwemY4VWRic1gvbTBGa0hYT0Zn?=
 =?utf-8?B?bFNBUWFjODE2M2ptK0tIcWNoazBDdjA4dG9pK2I5K1VrVUhOQWl0NFF4MXpm?=
 =?utf-8?B?dDBhYWNXR3Z5TmVLTlFjbzBjZzd6ZElEa3ZzN2ZwZjhsRk5TY1Z1TmpoL0xq?=
 =?utf-8?B?NUo1MUtHQitkaXZjN3ptMWNvbW5UVmh6VWNHQXUxMWVTZkdTZGtSa1d3QVJw?=
 =?utf-8?B?M2Z0Z1dwYXVCWE83SWJDME1VbHFGUHF1N2x2c1RDNERJNzA3UThjTmN0RTVo?=
 =?utf-8?B?UE9TRldCUkxzd2NpM2tLZUEvaG0yOURzcE9yaFRIblVLU09PQUFmTElYK3lC?=
 =?utf-8?B?czIxUTBJUU9aK3VDR1FWenVWYmQ4RmNYSS9iOGxTaFgrM3BaRFloM1FUOW0x?=
 =?utf-8?B?UFUrNkFXamEwb2xwcjBYNVdsMngxQ29zNk1JMEpRN0M4NjZXMVVZNFpXYkNG?=
 =?utf-8?B?TGhZc3FQNmRaUHB5RHFxWmFKaUpobmI2a1diUWlTQXJNNFVzME9qc2g5eHcr?=
 =?utf-8?B?alBEWjUya2lBdjFwaDhmanN5b3NGM09FMlJscEg3ZHpIcVlnYk5MNlI4aVdH?=
 =?utf-8?B?YVpLNVc4ODZSc3NRTCtQKy80ZVJ4dms1SXlSQ2dIdXNwdjh0djRtNnRDb0N4?=
 =?utf-8?B?UlNpMzR1aStYOGFZTHB0d3lCdDJaSEV0cTRmOUw3WkxpMGFOMUo2d0kvWW44?=
 =?utf-8?B?MngvcFhINFp5OGtNRit0bFY2QXp4ZmRKMkV0L1V6SHdsZFlCdzVkVTZTKzhj?=
 =?utf-8?B?S3RyUEJaQy9xaGh2Njl4SnlWZ1kwTlpoaDhicks5aUNoMklrT1k5NmNkVmJK?=
 =?utf-8?B?TDBWN1ZWaTBybkZNMHFtZzd3dnEraDE5eVQ3aHh0b0hmcWNzOHpvNmZFWk84?=
 =?utf-8?B?SHRmQWdESDNxSURUU1BZZndzTk52ZytMM1A4Ly8yN0FqZ1hwaUVRclg4SGJV?=
 =?utf-8?B?USszTkZQb0xXZG5mQUtrWW1CVWt3Y0tCZVRSUjNpakdNWmlKNWVUTzZqTE53?=
 =?utf-8?B?RGU1UldBWXVHdjhzNzNFempLZ1pVK1lTb2phNE56UjNabllQZDVSTUZ3cld4?=
 =?utf-8?B?YmV1Z3I3b1YwZ1lzZVAvNmxLU2o3bkJkMi94d0xNbWlObU9tQTc1amFkMDMz?=
 =?utf-8?B?cnA1WEs0L2NzWWJQeHNrcVdXUEg1S3JUMXZidWFDcnBvUXRlK2U1aUVwdW5D?=
 =?utf-8?B?QWhUYWErd0VvVnhLK0VqYnFJTkJhbWVJWnNJRjRtRVptanBTakQ2eEwvTFpK?=
 =?utf-8?B?Y2hUaGpvcUc5ZjRuOGx6M1hZbzdWejBTM1FyZ0RsOUNPVSs4a0d1am44b2E3?=
 =?utf-8?B?dzBRN0NsS3k4dFo4Qm5nV3hPUGFCbVowZ2h3SmtuMVJpbVZoOHJXMlBRWnND?=
 =?utf-8?B?OXo1cGJGZVRYbTd0NFlkclBHbDFoaHE5YzhTdEZmN2JhWXl0Z2RQUTZyTmtj?=
 =?utf-8?B?K09VUjNzVHNRa3NETTJTc2Z1VE5SYUdGYWtIWkFzWkhyNzRUeDFqSHZ0MWk1?=
 =?utf-8?B?UUw3WEpuL3d0Tm9XL2lOK0w0RFdqamdMUjZBTXI3cVB4OUdPTG9sMzduRk5W?=
 =?utf-8?B?d25TQ0xOSXdRL0tsRjJVVlFqMXlTZHFkWlJNRk85SmtjOHBCbmVJb1RBMitp?=
 =?utf-8?B?RWdnSkhuWTN3NFlPcjlJcmRBY1QzS3RaM0RORUlHVkJtak5zSHpQYTJIU0xF?=
 =?utf-8?B?QW1teGptZHZZckZCbExweGVNY1l6OWcycHJwZllIUWlTSjFydjA3a3NrdStQ?=
 =?utf-8?B?Ym0yc25qK1dHdFFvTjdCc2R3MnhIdk1TTlFUU3hKSUhVcGxOZnpoZ3FycDJB?=
 =?utf-8?Q?Qn1YedC2AaWvD02OqBFHDQeMP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f74bed2-f720-4c6e-3a43-08dced32bbd6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:02:13.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bcf52rjOzwbN8TThlVX113DX+XAvYV3/HI8Tpru519cWKmruv3xYj2xxy7Cih71iSFlkaMj3ebPAQDrVOlZDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075


On 14/10/2024 20:11, Luca Fancellu wrote:
> Hi Ayan,

Hi Luca,

Sorry I missed something.

>
>> /*
>>   * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>>   * regions.
>> @@ -68,10 +92,11 @@
>>   * Inputs:
>>   *   lr : Address to return to.
>>   *
>> - * Clobbers x0 - x5
>> + * Clobbers x0 - x6
>>   *
>>   */
>> FUNC(enable_boot_cpu_mm)
>> +    mov   x6, lr
>>
>>      /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>>      mrs   x5, MPUIR_EL2
>> @@ -113,7 +138,7 @@ FUNC(enable_boot_cpu_mm)
>>      beq 5f
>>      prepare_xen_region x0, x1, x2, x3, x4, x5
bl    enable_mpu
>> -5:
>> +5:  mov   lr, x6
> Shall these changes to enable_boot_cpu_mm be part of the previous commit?

This is why I had to save and restore the LR.

- Ayan


