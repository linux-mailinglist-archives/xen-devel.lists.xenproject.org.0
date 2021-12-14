Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F5474004
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 11:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246552.425198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4cs-0008GG-Ik; Tue, 14 Dec 2021 10:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246552.425198; Tue, 14 Dec 2021 10:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4cs-0008ED-FE; Tue, 14 Dec 2021 10:01:38 +0000
Received: by outflank-mailman (input) for mailman id 246552;
 Tue, 14 Dec 2021 10:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx4cq-0008E7-LL
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 10:01:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6c389a1-5cc3-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:55:27 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32--86aFwJ0MJ-UuC8gi394Yg-1; Tue, 14 Dec 2021 11:01:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 10:01:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 10:01:29 +0000
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
X-Inumbo-ID: f6c389a1-5cc3-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639476093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxWvJWZC27nj53U0HHM1Py0nt5gs2ohPCNrqwzrooNM=;
	b=EAxgUQzRqMALisHvVWZKnc9OsCSzMriDffKIFTjlazkfLMcA2MTtmeEess+dKrvgixtfag
	vYijyoURZGRzBnbILsggr8CTzNPI2OATREDx2qbrSvun134l+dnOGvaOHu0QYiIZhZVGU8
	IkdhlmrAoyFPly94m7AwZKbrnHuBvZM=
X-MC-Unique: -86aFwJ0MJ-UuC8gi394Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIe9mqoDJQ7yJD+fjm7Gf1MUVNywI9FB26MWOCjX1uB0bBgjTPobsbsjjlLcoXbc3fcl4Blf1JdLNM7rnqnn3Zcn2spP+OV7wBYIIKizKNP4ZJ2UNhmErEqyBhg7M/Ck7K4LpdrzTIq/jC3TU3eGJev+OBT98rCngovWeqjPvXlyzjQ+UzBXjXSl8mI2Q/OJ63YTzMqfeAhMRcMZw0dtn+U6AMAWYLfW358wpZdFD8ygU2DkKSAetIN7nCV4foYyO60lfZhIuUptKMQlIzgZKwwU50DCLcVHWts02DRICzmuijg/xCMFYs8JweNHD5AY96x0tIrRye8hVRmL54Mjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxWvJWZC27nj53U0HHM1Py0nt5gs2ohPCNrqwzrooNM=;
 b=CUZAn++2Fe1zqqnlz5npkSzpMCONmaJ0oQ6XDcXlF33X2uQhyGdm/lt8voTgltihleX2NMsLWeaf6Kh57frzuufIU2UXQPUUyIT/piWWp3n3B032D5chr8kyI/qWifPU7UfntFoYwKyT1a0TTqZtN6+30TJABgRIEG0xGu5jRyymvBaQnpFIFSNzhrNmdUUUUFcufjy++wJreiwjdVFm8Z/hezP0KdGeN3mzodJaD9ojJJLpCxbuH/GeKqKGppOwngVonsuPWEGJznXlx3n0PejdUTgxDqew09k77CtrbeIrNAeoGYmO3kfU9RRywTebxpGkB+JY7ZGY1K2S/vRY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
Date: Tue, 14 Dec 2021 11:01:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ad3685-ce31-47b3-c526-08d9bee8b301
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37743B955426EDD6A015CB89B3759@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RMBUY5uruLzvUjj0sYzr0uNNqXdVkluSobwB+UqB7c+16PEneEZxL6Ei6w7+drp4YnPZLf7Vx1OWMd7HkOX8ZMi2MfqJPbpohwGy4fo2cvtcwdCzeJTVmc6yAh0JWjmqNb7+0oYDsxCiUkc0qjHwG9CD7l4UMupAAjols1kTIOqyJmg1YY3h4HxTfKBHEVDngFETgUcZUFSgGrt1bvzmFN2XYgk4K3vYJQJ7z2f3vdg/Dt/Dh6bbKqpoU7zhyG7DnwWvdSFb7+CeAIVv2wIDBP35M8Ae8Dk6VoTX2hztTEYBhh3NW69aShnvtqiwhDEv7tFagLBm22eQ4pZ4eOUhlhkK41E+KCBFSxjxFLUzRSmabFW32fx8laJfqsiHtiYa3fSjj3rIyn6glG0CcX+d8uvg/9TYnAjPMJgfPke1oab+TfEXmBX5mATC+tGvfwYP4ZBHR2S3nMkZNWO6PzewNbvEb+eZJFLub+HSie5aSGdhNcfWqz+rsOIhfLEBBzHTNlW1xexPlfvyzOIkF8tdKZhLPfVRt6zPVktrUMamMA0jAazyAbGTdUIqDYeL1pVrD7+dUepUZjm6PkV1uIwcku7h8xM9UOzUDUZRZGJ8SUBU7rfta6wolLuPHHLYSQcOow3ZU+qLRgX/m8R0U4Fz2YB5j1mHmDdopTK4XIH2A7u4xyxt5NGN1TPAlTs+whLjzgZ+gswAxXSgFwWucQsQPTdbG/1BYgw9fNnhHkHBt0trVWTWOkbjbxmMdQO1m+J5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66556008)(6506007)(53546011)(26005)(66476007)(6512007)(36756003)(38100700002)(66946007)(6486002)(508600001)(31686004)(83380400001)(31696002)(8936002)(5660300002)(2616005)(4326008)(2906002)(8676002)(316002)(110136005)(54906003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRDMlp6STJoRDBNWEI2QlNuUWRqY3JKTUliVllLbi9wOTU4ZklNZFd1TXYx?=
 =?utf-8?B?bjZPNTVMK1RLZFhTdUtuREVwSkozbU91b3VISmpYME1jWVpDZnFvZ0h4VkFa?=
 =?utf-8?B?TUxkcHp5QTd3NlBqQXN5bXp2VkFncnQ0ZDRnc3ZLKzRCdDU3MDN3NEVicUhs?=
 =?utf-8?B?RXZlWHdlOWxUVjR4cUlQVDFLOFh5TSs0M2dyN2Jobld3SnJuNnMralNZc1Ba?=
 =?utf-8?B?WTJjOFhqd2xFYjF6T1pOYlo3eHhTK2NaZWdpVTNmWG1MTkFubTF0dEtwdS9Z?=
 =?utf-8?B?N3VObDF5VktzeS9JNStDSmlaRVArdzQ3NGFJNmN6NTBJVDRQcFNZQVg4cTZN?=
 =?utf-8?B?MnhMOVJIalEwcm5aWjFUNGZIUCtyS0tUQnVGTmZlN1lqTzBZMllDU0dpUGdn?=
 =?utf-8?B?M2h2aStnZ0pYS3ZNT01xN243a2QydTZxTUFrVzczQXVEK0l1VnJ3K1JCUThx?=
 =?utf-8?B?ZEI2eUkralFhcEwrVCtGZU1hQzlSR2MyZ3pLd2JraE1WQUMwTThMTmhET2I1?=
 =?utf-8?B?d1BBbDAwMW1CL0RoL0NWV2dtZWhqdzBQeUg3a25NeG9sa0xyaE42VVJPckov?=
 =?utf-8?B?ZG9LcFhPS1ZtVDh2ajR2Q1phSzdndGlxVGR3emI5L2drajJxYnpBcXNoeWRY?=
 =?utf-8?B?dkxXcTQyRW1nQlphNmNJNTZja2VXTzcya2pyc3B1dlpVYzFuV3JUMWF3dnN2?=
 =?utf-8?B?OFBSOXB1c0pKamhOeUZrc0RGcUFSa0l1MHBRKzRHViswM2RSdm1DYTNQanMw?=
 =?utf-8?B?TU8zamJwbE5PaFBpS1RCUFNWT1JUZ2xWZkJaNVVhRTI1cnBKS2RrQnNVRmZq?=
 =?utf-8?B?eWEyemEwdE1NOHczMHM4NjAvaVduU0Q0UWdPc2UzQ3FWRTJucmtEemxvc2t2?=
 =?utf-8?B?NUFqQmlpdW9CQS9kcTBhOFhVS2Z2SHR5enVNM1dYYmpHcUhBMjhOMkxpd2w1?=
 =?utf-8?B?WGpPYzdUQjdqSWFFQjFEMFFTV2xtcS85SlcyanRoVktEWmV5S0lnNjZPZW9Q?=
 =?utf-8?B?TCtvQXBlMUpKNnZRbFFzUVhVTHcwUjVSdDl5c2hYMVprM1VCSkFJVmxYK3BD?=
 =?utf-8?B?R1VHL01HYy9sS1c5R2V1RWtvbEM5SG4ydk1jRDUyWHJ4Wm55T3BSM3hLbzhn?=
 =?utf-8?B?U29ueG42azdPb2VsZEFHTVdLb3Q3M3lqUzc3bnFabHBFVVZkYUtzZFdnNVBR?=
 =?utf-8?B?emxXUktXMVozMWVybVV5VlozYnlJVkIxWVFBVnJoWGdBZnRqMC9TVk5lc1RE?=
 =?utf-8?B?am9NM3dTR2hjeUFGZHh3N3hETUJmTTExTyt6WmZBY1JzUXp6ZW5DRlBvUE5M?=
 =?utf-8?B?SUJtL2NqeTB0dU03L3pSMm51bHcySWN6ckdzN3FuOWpKZzBzRU4zTExheitY?=
 =?utf-8?B?dXdjajRhdWp2UHBKTUQ0aWZydEdsRkNDZEEvb3BacVZwLzlXZUZFMkM3WWxO?=
 =?utf-8?B?MXlvY3NsRUx4V2pZamorZFZHcjEvbG5IK2ZyazErUnlONW1kR2tZL2RsYWV6?=
 =?utf-8?B?Rm1zQWJrR3l3MWh1THdwcFM4MkE1U2NIV3dJVmRuUFBrVGZITFdpamYwZm9u?=
 =?utf-8?B?ejhJdFBUcnB5ekZFOTc3RWdaVk1HS2FEZ2o4UnIzbldxQVhiSXlUZkJ6bFJP?=
 =?utf-8?B?bU9acTlQVDkyME9vN2ExdUZqb2FKakFRY0hCaGUzd1pHL3NMb1ZIeXdGRjNM?=
 =?utf-8?B?UXJ5cHJhRTA1MndtSksrMXdkSXZjS3JxVkEyNEI1UzcxSnB1QXhaT053RnBJ?=
 =?utf-8?B?OXlybHNvN0lGeTRNTHNqQjkxM3ptZUY4YmdGMFdoam45dDRWaWdQNExTRTFl?=
 =?utf-8?B?NWo5UmJNRlFGMytEeEl5YlZ2eFZzMzV5eThUYmtWM0RWNk02dVFQQzBHNytV?=
 =?utf-8?B?ZWFRK1BTMjhRWjU0YXloUWlSbFpZSTloNkRJQ2NhZVpKK3ZxNVVJUWlNR09E?=
 =?utf-8?B?RjMzb05kdlFkNm5iZGZvMks4eUJKUXJlTDR0UEJVYzZ2NmliK3NZdmlvZklP?=
 =?utf-8?B?L0hqOTVoNTZUdXRyNzYrbkx5dEZDQVRqQ2ZkQU1ISW9zN2FGMlE4ZFNsdzcr?=
 =?utf-8?B?Y3E4SUkwZ0l0UThtbk1SYlp2bUNMUFUzZ3IyS0RuZGsrcEdpRzEzZU9Ubm1O?=
 =?utf-8?B?SC9Ud2dLWUF0UXRjVDNhS3BzSjJkS1NOSnN3REd5ZGFWQmkrRXFsYXBscVR5?=
 =?utf-8?Q?kh+Kho8IQDvuS3qfLwdh4hg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ad3685-ce31-47b3-c526-08d9bee8b301
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 10:01:29.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzCi5SGDo3/xYtBCARgquxupGK7CN2ndbuMc6ZubleWSgXc0eqi0gkb2KgzHgn7zNhBgIbpJDz7dG95BRO4psQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 14.12.2021 10:51, Michal Orzel wrote:
> Hi Julien,
> 
> On 14.12.2021 10:33, Julien Grall wrote:
>>
>>
>> On 14/12/2021 09:17, Michal Orzel wrote:
>>> Hi Julien, Jan
>>
>> Hi,
>>
>>> On 08.12.2021 10:55, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 08/12/2021 07:20, Jan Beulich wrote:
>>>>> On 07.12.2021 20:11, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 07/12/2021 08:37, Michal Orzel wrote:
>>>>>>> Hi Julien,
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>>>>>> to hypervisor when switching to AArch32 state.
>>>>>>>>>
>>>>>>> I will change to "from AArch32 state".
>>>>>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>>>>>> "If the general-purpose register was accessible from AArch32 state the
>>>>>>>>> upper 32 bits either become zero, or hold the value that the same
>>>>>>>>> architectural register held before any AArch32 execution.
>>>>>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>>>>>
>>>>>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>>>>>
>>>>>>> Ok.
>>>>>>>>>
>>>>>>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>>>>>>> needs to be fixed.
>>>>>>>>
>>>>>>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>>>>>>
>>>>>>> I would say:
>>>>>>> "
>>>>>>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>>>>>>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>>>>>>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>>>>>>> if the command passed as the first argument was clobbered,
>>>>>>> "
>>>>>>>>>
>>>>>>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>>>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>>>>>
>>>>>>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>>>>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>>>>>>> when not passed.
>>>>>>>>
>>>>>>>> Which error do you see otherwise? Is it a compilation error?
>>>>>>>>
>>>>>>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>>>>>>> So basically in all the places where entry is called with hyp=1.
>>>>>>> When taking the current patch and removing default value for compat you will get:
>>>>>>> ```
>>>>>>> entry.S:254: Error: ".endif" without ".if"
>>>>>>> entry.S:258: Error: symbol `.if' is already defined
>>>>>>> entry.S:258: Error: ".endif" without ".if"
>>>>>>> entry.S:262: Error: symbol `.if' is already defined
>>>>>>> entry.S:262: Error: ".endif" without ".if"
>>>>>>> entry.S:266: Error: symbol `.if' is already defined
>>>>>>> entry.S:266: Error: ".endif" without ".if"
>>>>>>> entry.S:278: Error: symbol `.if' is already defined
>>>>>>> entry.S:278: Error: ".endif" without ".if"
>>>>>>> entry.S:292: Error: symbol `.if' is already defined
>>>>>>> entry.S:292: Error: ".endif" without ".if"
>>>>>>> entry.S:317: Error: symbol `.if' is already defined
>>>>>>> entry.S:317: Error: ".endif" without ".if"
>>>>>>> ```
>>>>>>
>>>>>> Thanks for input. I am concerned with your suggested approach (or using
>>>>>> .if 0\compat as suggested by Jan) because they allow the caller to not
>>>>>> properly specify compat when hyp=0. The risk here is we may generate the
>>>>>> wrong entry.
>>>>>>
>>>>>> compat should need to be specified when hyp=1 as we will always run in
>>>>>> aarch64 mode. So could we protect this code with hyp=0?
>>>>>
>>>>> Since my suggestion was only to avoid the need for specifying a default
>>>>> for the parameter (which you didn't seem to be happy about), it would
>>>>> then merely extend to
>>>>>
>>>>> .if !0\hyp && 0\compat
>>>> Isn't it effectively the same as setting a default value?
>>>>
>>>> The reason we seem to get away is because other part of the macro (e.g. entry_guest) will need compat to be valid.
>>>>
>>>> But that seems pretty fragile to me. So I would prefer if the new code it added within a macro that is only called when hyp==0.
>>>>
>>> So you would like to have a macro that is called if hyp=0 (which means compat had to be passed) and inside this macro additional check if compat is 1?
>>
>> Yes. This is the only way I could think to avoid making 'compat'optional.
>>
>>>> Cheers,
>>>>
>>>>>
>>>>> or something along those lines.
>>>>>
>>>>> Jan
>>>>>
>>>>
>>> So when it comes to zeroing the top 32bits by pushing zero to higher halves of stack slots I would do in a loop:
>>> stp wzr, wzr, [sp #8 * 0]
>>> stp wzr, wzr, [sp #8 * 1]
>>> ...
>>
>> I don't think you can use stp here because this would store two 32-bit values consecutively. Instead, you would need to use ldr to store one 32-bit value at the time.
>>
> I hope you meant str and not ldr.
> So a loop would look like that:
> str wzr, [sp, #8 * 1]
> str wzr, [sp, #8 * 3]
> ...

Why "a loop" and why #8 (I'd have expected #4)?

There's another oddity which I'm noticing only now, but which also
may look odd to me only because I lack sufficient Arm details: On
x86, it would not be advisable to store anything below the stack
pointer (like is done here when storing x0 and x1 early), unless
it's absolutely certain that no further interruptions could clobber
that part of the stack.

Jan


