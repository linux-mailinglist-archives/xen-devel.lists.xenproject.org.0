Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C97771DB9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577972.905123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx6Z-0007u2-Kw; Mon, 07 Aug 2023 10:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577972.905123; Mon, 07 Aug 2023 10:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx6Z-0007rr-IG; Mon, 07 Aug 2023 10:04:51 +0000
Received: by outflank-mailman (input) for mailman id 577972;
 Mon, 07 Aug 2023 10:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSx6X-0007rl-KC
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:04:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a40692-3509-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 12:04:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9904.eurprd04.prod.outlook.com (2603:10a6:150:119::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 10:04:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 10:04:44 +0000
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
X-Inumbo-ID: d7a40692-3509-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRG7fQYESY5XBw28X194BAEB5GIMEQIC55tVb8FQezjpN0fUMJ+2FH/s9TxgMmoTnvcSx9+fjPwCtIeYubpZxO7/v8UWzvbZ2gFfFnPO2MOY/t59FDPiy+aTlDOJXiVHXwPlgmLWwaqYhVlENfNL09lRiVgryhCwEYwNlUzUGr3GtwVvQe3w6ax9KIQPq9odaxQcUno2r2J//Z4bqnKeDEj/cxn3oZLfoRlWl8PuDZIYzqIMoBbT8oMryhVjvEHHyIGaRKarzyGrdFFtlKtUTVtAeJjeOJs8wxTqnspeNUXfgY5EUs/wR0YmLpC57WH0bxW7I6TDQdy9I7vzxUscow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AImSG46M5dVWVzPvxVp4rfrueGK4YHQjTUB4hPPXSU4=;
 b=mQ4VJItZLfItvrO2eMiWKtlLGsTbfupQCy8EAqmNzovwshUGeEyDw1fJtguBHe8nYIyx+k/rVmSHXyaQQ785KrogVbHbyUWAaPKKtd2tXAgvM4EE3cvUWBVPlkFPbscOkvbKbb7842JFS2ytE4QkLZfkbgoSioOhV/mPfb5GJ9vKTp7S119uhGoSRJJhceXABfTQ/x8RLRXhlniRC8ES6ZdLm7SNE8G9DAkhGlSVmrOZnKSwVHjnF1TYq20pe3XSCWuIaT/SR+Fgk7OGyGUymZkqM1f8lwOXNtYnzx0XjI8Ld1NVYIdDHV1pZWNikffWQb/W6j2akbYNJRv5vp2jRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AImSG46M5dVWVzPvxVp4rfrueGK4YHQjTUB4hPPXSU4=;
 b=UsOOWWSAeG3kAWol0THJnWXtYLEeDWRCHoHv+f4atYU1akS1QS0Z7yASrTAoPQ0tlIGYZ80WbG/wCmfFm8dcVRH3Z/XZEd1m3r+qaZf9UA/1eXf2O0/m6bIgrM1CWUuoPOfrcd+gL39ky7UyQC5sgpL6DVaKDtiTDUzRSLJrGgOsQ4E7sFsbnyF90XGxTywW/Z0C/hZWKI9azpWWCLGzEo7mpAi7ZJ/O2oFlrKfbwmsOvHnklZGqwAk3Eo95Me+7DTz1e9rbLo5LDo8+rS6sPyYmyFvPzZ78U16CknJBz8MjxtyJVHGwA5hu2c7sgl5gcXzEXhbjdxwSHA42ThtzqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fedd7c0-862e-d7c6-431d-6478ae1960b9@suse.com>
Date: Mon, 7 Aug 2023 12:04:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
 <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
 <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: fb72bac9-0802-4d31-8e25-08db972db93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJVzL77aZ9vWv3PjvtUGjldqI9IV1zblpKQXUUI4iZylkpW4P6WPqDdhiGf9VDvPRPYKWp+nFLqo3GzLpspOBqyLeBxPJS/d/QAsXrKoHBzQf5d6qT30x028qKwfZWNQT6wyK7SXdzdpBsauOup3sEJZcBB2m7tv2NPxi0ef8LM4X3ANcN0esRv+Azj/kMnQEaB67vnj+Ur2C4wr40eQFv0UAK90aCUyO8/VaPotVOFBuAtwXzwNhOr3P3MekiYjyiUqBHzpAtu8Oj85oCXkIFf4LZi6gEztXgNbNjMeMI8vkecc1Z6OZDb7jKjCPjlDkkXKmmw3nCrC5DwY9ZWl3YizAFjwdsaqh1IzJwdgW/JwSYcQ0wSTV+2pw6uz+iGcttHeRezCCBYZqLibwh7YryjPFZOLKujClUeqb2TVaW/48VXTV9bociy5UIpubati26HWVrVcrQqYAZL6xN2x3hZ5NyQPcymsSh52HnzFCC27fmYNnRCi2H2DLj5/3CuFPj6icJUOH+0DRqS/KviVFTUFOuinC3eBfqHPQqYYQYAb4brFecq5ilZuSkbp8MfLCWvLw1LyUxflipsxfCq1mx0A32XNFee7SbFSwpAD/S/uzvJFUceMkjAHRdIGLOIflQZQ5bBmTvZV1aPIR8gBRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(6916009)(478600001)(54906003)(38100700002)(66946007)(6666004)(6486002)(66476007)(66556008)(31696002)(53546011)(6506007)(41300700001)(26005)(66574015)(8676002)(8936002)(2906002)(83380400001)(7416002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHluQ2RrUjhvcTZpVURRU1NYbEx2cDQvRi9zQ1pwK0lIR041ZzkxWjI4M2w4?=
 =?utf-8?B?ZmRMcFVrTWlneHlPemtGa25wYldUZVFWd25ndlN2UnU2MkZDQlhVSDEvQm01?=
 =?utf-8?B?MVdUUVNGclQwOVdiMDZjMnc5cEhqcFpBKzlnNTU2WG9LQ0YxVFZxOThBU0c2?=
 =?utf-8?B?akJBa1lCMXVQYUhJZmtOaEk4Y3dYaTdBYll1eVJkVXF0WXJHRmxrVWoxSXlS?=
 =?utf-8?B?TWhOcHhRamE3OHgyY1lEUjRRR2NVeGFGM0pkSDJmZmdMNmZUNHArSkcxb0tr?=
 =?utf-8?B?bnRmbnNMOGJVVU5xd09DSWxBdGdaa2RkZVVZS3Z0dk5aK2ZiUFowekpOVFpq?=
 =?utf-8?B?T0hWZ2x4c0M1S2JNZlAxdEhGZTJjUTFpcFh2L0V3S1hnM1EwMlNudWRRZWN1?=
 =?utf-8?B?Sk5JKzZFZXpjMFFRRHNVbjZxd0FxckJJak93R3J3eHpNaloyUmRldTVGendT?=
 =?utf-8?B?RHE3KzkwU1JrckRiWGV3N3RCTnBVbzRjNWR6R2lRb1hvZS9USnZ4WmdmVm9w?=
 =?utf-8?B?emFvVUxSK21ZMFVzZ2cxdUpyV0NRSThZTVZrVnlkTTF1NXhZelRjbDQzTHVl?=
 =?utf-8?B?ODV3TkJNMzZ2YnlHaVJzc01YbVVxUVdKRkxUNktYN29BbUxYOE05RnR6anNM?=
 =?utf-8?B?RkE1UUxOeTVYbFVUc2NuRDg4YmN5dFY4NWtMK2YyVnB5M1plaWtMOThHTkRB?=
 =?utf-8?B?SkwzSlpaS3JwbElZVlVIM0Q4OUl2cjRpUmZHYzBEUUhPS2RnblhSa1k4Tzly?=
 =?utf-8?B?bVpWZWIrZHBGSmJGMGZiaDlubWRZU2lBcTVKTmh3UEEwY1VUYng4amRFVit6?=
 =?utf-8?B?UXp0RDlIaXR2QktmMWprTlZlUy80QWFmUXBZNmttQWVkU0t2c1g2SGZiVnZV?=
 =?utf-8?B?ZFlWSzhKckZDNHA3dFA2czdSN0NTVEt4UGlZV1VLNFhidkw2ZmQ4dVdZTXRT?=
 =?utf-8?B?Ykl1QW1na2ZVY1BsYTFTT1FEdkUzWTBOWHZwUGV3YmNXN3Z2VWlLTEphcDBm?=
 =?utf-8?B?ZHh6MkxmMlFLWCtRQnhoYU0ySlZ2a21DWnFacjJUT2JSVUlFRC9WSFl2QjBs?=
 =?utf-8?B?NmE2bFlHeGc1OEtRRStmTGhQV21heDBheXNJV0ZwelQ4dmtzTmtoOUZOalhT?=
 =?utf-8?B?ZDFTaE5ib284eVYwMFlaM0VGandxaEpzbUthNzF4cm9mdGlXeEs2TzZvN0NE?=
 =?utf-8?B?K1lMemZXck1udHFWeHZBVEVqYUx3OGxqdTQ2OVpSWjBiSCs5NGJHUWZIWG9n?=
 =?utf-8?B?cGk4OVFuVHFwUGNrVTN5RGZZQVFlZkhHUEVkSnUvWnZMRHZEN3pxc25yM3Y1?=
 =?utf-8?B?WXV4TFcrVDUrRVp6UEpxWGFQZWJIMzV6aGdNT0EyRnQrcGFYcnpQcDZkSk1r?=
 =?utf-8?B?K2NSVW95WlBTai9QY05JMzB1NHk0SVl3QW9XK2ZMSEMvVE1BMlQ1eGJzNS9I?=
 =?utf-8?B?Y1MwdkhCOG0xdHcydExUejRzdWFGZTFZR3RPOVNOYXh0UFljTm5maEJHcHE3?=
 =?utf-8?B?OEQrRGZSM0g0ZTJoTGJzNWR4Tjc3SXN0R1c4ZnlSZk1kRnh4ZUFDbVdHT1Z1?=
 =?utf-8?B?ZndwNmxRVi9HWklQNFlkSWNrS0dOUlYrczE5MEN5YTh6cVNvUXllU3J0UDRT?=
 =?utf-8?B?NmxwNGVHbXNXWkY4NzFVRXc5MDdDUEVvUzl3MjNzdVVGcnFNcWxtY016eUo4?=
 =?utf-8?B?VjIwSnZ2Zzc5M1N5ZSt1eExJSlMzUDMrWkR6TGhPZnFRRzNxS1d2UE1tSUpx?=
 =?utf-8?B?bTlIVmlQU1FQNllJNHdMZDQ1ZFZCTkQ2REtUd0lKZHBQTlZNbE05NW5EeTlB?=
 =?utf-8?B?MmZxa2pUb0NGVTdTSWVlYUR3MytndldRMmNBaHFNN08xei93WHdObWdvd3ZE?=
 =?utf-8?B?M0NicWRFVlJhWWRjYkhLaVRjQUV5czJlL3J0aGdTQzhNYlI5S2xZczlQTjRa?=
 =?utf-8?B?UDREbkhJU3FzZmJzSWQvak9iMjJGeHl2OW5Ib1ZNQ2tObVFUMldqYjU4LzdR?=
 =?utf-8?B?V1dRMGtPYlloYkdzNUxCbzJvVWVmVEZyb2FKUWk4WmFGNHZYQVlIeHk0MVVI?=
 =?utf-8?B?emsrUGFGbFdpdzFWOUxEeDIzWmMrWG9EUGR6YmdKcThNOW1iVmNRaW43dUpT?=
 =?utf-8?Q?iip4L6xBdxWNDCZ3LXMh+Bj+K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb72bac9-0802-4d31-8e25-08db972db93d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 10:04:44.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAeNEsgZyoeGHTtBO6NBBuWvhcnSx00fZXigbMK6jsDGXBbVkNgKqwjX2ebDfI3xjjlJ3EEiVarUcXB2TRTizQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9904

On 07.08.2023 11:58, Simon Gaiser wrote:
> Jan Beulich:
>> On 07.08.2023 10:18, Simon Gaiser wrote:
>>> Anthony Liguori:
>>>> From: Jan H. Schönherr <jschoenh@amazon.de>
>>>>
>>>> Intel says for CPUID leaf 0Bh:
>>>>
>>>>   "Software must not use EBX[15:0] to enumerate processor
>>>>    topology of the system. This value in this field
>>>>    (EBX[15:0]) is only intended for display/diagnostic
>>>>    purposes. The actual number of logical processors
>>>>    available to BIOS/OS/Applications may be different from
>>>>    the value of EBX[15:0], depending on software and platform
>>>>    hardware configurations."
>>>>
>>>> And yet, we're using them to derive the number cores in a package
>>>> and the number of siblings in a core.
>>>>
>>>> Derive the number of siblings and cores from EAX instead, which is
>>>> intended for that.
>>>>
>>>> Signed-off-by: Jan H. Schönherr <jschoenh@amazon.de>
>>>> ---
>>>>  xen/arch/x86/cpu/common.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>>> index e9588b3..22f392f 100644
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>>>     initial_apicid = edx;
>>>>  
>>>>     /* Populate HT related information from sub-leaf level 0 */
>>>> -   core_level_siblings = c->x86_num_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>>>     core_plus_mask_width = ht_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>>>> +   core_level_siblings = c->x86_num_siblings = 1 << ht_mask_width;
>>>>  
>>>>     sub_index = 1;
>>>>     do {
>>>> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>>>  
>>>>             /* Check for the Core type in the implemented sub leaves */
>>>>             if ( LEAFB_SUBTYPE(ecx) == CORE_TYPE ) {
>>>> -                   core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>>>                     core_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>>>> +                   core_level_siblings = 1 << core_plus_mask_width;
>>>
>>>
>>> On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing on
>>> I noticed that this changes leads to core_level_siblings == 16 and
>>> therefore x86_max_cores == 8. If read from ebx like before this change
>>> and what Linux is still doing [1] it reads core_level_siblings == 8 (as
>>> expected?).
>>>
>>> What's the expected semantic here? If it's to derive the actual number
>>> of siblings (and therefore cores) in a package as the commit message
>>> suggest, the new code can't work even ignoring the example from my test
>>> system. It will always produce powers of 2, so can't get it right on a
>>> system with, say, 6 cores.
>>
>> The only use of the variable in question is in this statement:
>>
>>       c->x86_max_cores = (core_level_siblings / c->x86_num_siblings);
>>
>> Note the "max" in the name. This is how many _could_ be there, not how
>> many _are_ there, aiui.
> 
> I'm indeed not quite sure on the intended semantic, hence the question
> (although it's not clear to me what case that "could" would cover here).

"Could" covers for a number of reasons why APIC IDs may not be contiguous.
Consider a 6-code system: The APIC IDs need to cover for at least 8 there.

> It doesn't have to be identical but Linux says for it's version of the
> variable:
> 
>     The number of cores in a package. This information is retrieved via
>     CPUID.
> 
> And if I look at it's usage in set_nr_sockets in Xen:
> 
>     nr_sockets = last_physid(phys_cpu_present_map)
>                  / boot_cpu_data.x86_max_cores
>                  / boot_cpu_data.x86_num_siblings + 1;

This validly uses the field in the "max" sense, not in the "actual" one.

> It seems to be also be used in this meaning. At least on my test system
> I get last_physid == 7 (as I would have expected for 8 logical cpus). So
> dividing this by the 4 (number of cores) and 2 (threads per core) is
> what I think was intended here.

Would you mind providing raw data from your system: Both the raw CPUID
output for the leaf/leaves of interest here and the APIC IDs of all
threads?

Jan

