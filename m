Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F93642692
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 11:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453365.710979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p28Xn-0008SU-N3; Mon, 05 Dec 2022 10:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453365.710979; Mon, 05 Dec 2022 10:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p28Xn-0008Pk-KC; Mon, 05 Dec 2022 10:17:51 +0000
Received: by outflank-mailman (input) for mailman id 453365;
 Mon, 05 Dec 2022 10:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WMQ7=4D=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1p28Xm-0008Pe-G2
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 10:17:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f955fb-7486-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 11:17:48 +0100 (CET)
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAVPR08MB9188.eurprd08.prod.outlook.com (2603:10a6:102:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 10:17:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b%2]) with mapi id 15.20.5880.011; Mon, 5 Dec 2022
 10:17:45 +0000
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
X-Inumbo-ID: 10f955fb-7486-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoR1qLrP8gSwl0WrkssZS4tuJZkVJIwEvEDRzRq4PW6AK3taNXdqg3iailVa1SUYNdxVEsadZVnYC32lFqNrRnETFa6KRW6BGdylJYYeY8TJU+VBDuM3DCWJNg9cYnGpfW6gtc5QD9KeXUdUuRORfJtt+udl/TSXb6T+wazknJLJHV2ywu/VAHs7PY2fNsOrpHjJHadNhc/q4SDxivgDLfZ5czbnd+TsYKD4Um8n25u7dTdyFvq6DViEN+ELD+oHxw2zpOPABKyrc+uLT5WRGAim00P+6yENRBcdnCzPMaiGXKjGhx8t5nYDCiv0tmdC7eFnv8WFV33oNv1ghk7GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sdMVvz6tMMMIMwONLQJiIX2KxDkoj9yBS4qM2Yjedo=;
 b=LU6unm5nyhHzi2m8nlDaDPOKPFkYa/UkwGGU1FsE9vGz4FYc3MX/CmrMHc5nPSehKda1oSoxrWEsvx3FFt6QgJcuDbdWcbZvy8N41hOGge5GIHjBhBxAjvNu184JynGR2uSYyMFt8/K/y2QJeIT1WTG7u3ogNLywz7UOrcF0tVo9HF1iO+9n1UM6TgnO+lQ6fOg1iUlNR1Lh5a8E5zz78cQUh2DKOoRBCIW1ZH4Mgbd2yh5yvNwYWMgec0iephp8x3wnXP0XkTrhg/Avi2iwEtVsl4E3Lox6/yk5N8lYrs+P7RPhomaZqZjkJ/kDVKf52gQ/lbK1pbp/0GrL0s00Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sdMVvz6tMMMIMwONLQJiIX2KxDkoj9yBS4qM2Yjedo=;
 b=N0oaQyL31Jdu4DTKifSUochdpy/BnuQzvtDYE7iskwLz27aPtcKWJOlxZsbjh5KLmbSTBHuJ+uUrgy5KmeEd1T12hhB/I63/yGKnPmH+LvCGKxxOcXyvTlrCBNkLFvnLrMwMKRiM9rDZXAyN42Ss/ppMwx1LPPWC1cQSY3GZBg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <b3240b30-39c7-d4b2-eb92-167a1a81c6ad@arm.com>
Date: Mon, 5 Dec 2022 18:17:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
 <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB7420:EE_|PAVPR08MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 532ff27e-3be0-4623-e83e-08dad6a9f3ae
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xB46p/plzQY8ZMRu//e0taIFhJBKreTLVGoK/VRNevyDDxj0uEosSa371F1flIcE/48jmd61Pu1y/UxAZE6ilLpRdEKmgQpaMOTENxugXv9WFKHoSQETewtxzmXlJYGS79QQwRYl1UWwoU6DPQy0wGe5f6XsnaInZSho3+sz0rfSmsUdkbrfBwnW8Ug2wkCI5bTs6r9F6x3HPSu6miHGLo2WAHVoUTohw3CE/YZdgCLTmsqXqpERkxqWUp4i6CFGV+7CKDBLESl+GGtAoTK8CKuG4Vw9t1UA3m2sxAuehQkeh3ClUC4maq+Yp3KckjJ7lThvWC1c3oYORMHetP8bJ+GLNVg+aAtOwvc9o3HQYYcvSSEv8e34O6HGg49XAlDRPnIS/Y0dhCKW7yl6wYAe2sEUMbQDkhWF3lJcAz5mi1gWGyNPi74ns5UMPaWpDzrUzZyGcaKM7rvfP+s+V4wsTLaA/IgXq2yUXA9T52T3yNPOvwnMo7mbdstqEru9lT2txieCyKVjsSErJkzt0inylcpayrUWGLlo3n45ensSKJGmWBj3k+ItUmpMW6vJz7niCCc1Dn/1r9tUvEHThTyjik3FEKDU5tTXSZbvIM7O3sZHhP/XcLOrJNOn8yx2KCGbGPBovHjQ1etk0ETSSsTW7qtpJvYOE74GE3eH35qUr19MgXVJ5CatlwVIVE39U70Jm//v16C9pUYtUA3uXOgXK1xU1iD4zKr2dQTEa+E8pYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199015)(2906002)(86362001)(31696002)(316002)(6506007)(83380400001)(186003)(110136005)(6666004)(6512007)(26005)(54906003)(6486002)(53546011)(478600001)(2616005)(8676002)(5660300002)(8936002)(41300700001)(66946007)(4326008)(66556008)(31686004)(66476007)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpPZHB1cUhGcU51V3JlNENQYmdVQ1E4MW0vcXY2QnRreFhJQVdTc1R0SkVz?=
 =?utf-8?B?eDg0cjBjS1VvMTB0YlZQVVF3NjhkdEx4eXduU3dVRnRBMFZrY3M2VU1OSG9Z?=
 =?utf-8?B?ejQzRGVqdDdOQXJ3bUxxU2NKL0pmSWdQazNrcmVTNGNNQWVvNWZUaGJlOWUx?=
 =?utf-8?B?VDB1K1pVMjdpRVhRNTQ3MEhuaHpYQnF5aVNzUzhnNlBhWHdudmZibDlLMW5L?=
 =?utf-8?B?UXM5bm82aGptaWF6TkNBQXdEZVI5NTJYQ0tsVE1QQk5MY2x3empoS2tWV0NO?=
 =?utf-8?B?R0FUUHJUMHY2ZVNQTHd3ZnBWMVhjS2hONTIxOFg5NjMxdnVYeTg3YTBrYkVG?=
 =?utf-8?B?RUtaMUNLWk1lbVRqaVJMdUhqOFYrQ3F3dlFCSkZrQUFDeks2cnNHbVFKVTlU?=
 =?utf-8?B?VXdQY2JMZFJwcTFPd05IRTRDcTUvVEkzd2JWbW41SW50TTFtbnlBVnhJbEYv?=
 =?utf-8?B?STN2WHljTWg0U2RERDVYSnpPS3c0ZENEaDRiYTNFZjlVWnlIWExNYnFla1Zo?=
 =?utf-8?B?b3ZUT1B3alR3YWIyZmsreC90R1ZBQjhIM2pWendzbXlqdFAxTmZCNjdtL0lF?=
 =?utf-8?B?c3pNeng1NWlXKzI2K2ZrZFFuUEZwN3JEcXY2b0srTjRleitEYlBraVVqeU1M?=
 =?utf-8?B?d2hxM3o0SnpSMEd2N0IzNG5QOUJiQVdseHphNEtYODZKRGFNcUJ5a3hSb3VO?=
 =?utf-8?B?djFhN0h3NVNZVnJmNUY5YUJJcGF6dmEzOG9WNUdqL2ZMajF5QWs1YU5pb1pE?=
 =?utf-8?B?Y2ZheEpjTGdQVnlkSm5PZmNtSVFMTjA0aHA0Vy92ek0rdkhkNHlFK1dMV1N0?=
 =?utf-8?B?T0NjaTliZkVxb1JTbGJwNDBOZzJBbVF0R2cvZWpQREN0Z2ZHa2MzaU9YOVNM?=
 =?utf-8?B?THA3emdUQW45dEFkNjJPdmpVeEdwVVVOZndBeE1RcWM0Q3lNVDg0eE85R2Zj?=
 =?utf-8?B?eUNjS2theFlKUHFNdGFISXU3Y0VoVFhWTCtzQ0lvK25RdGVjS2NYa0NXSjZ0?=
 =?utf-8?B?VWVFaWRKQ1d2NHUzV2lVNXA4VEZDb0dTVWgzQmNRZDZub2dFYStwMFovZU9R?=
 =?utf-8?B?QlFhbzQ1RHhVTGZlOEZBTGJjNjBhUGVGdkxnVUFvaVhHSHhCbUNPWkJhNVZY?=
 =?utf-8?B?SmtleUJhaFJHQ0VSd1dIUlBMRHBBTTdMS2RraEZ1SVU1UzhmcXdCUXR5YjVM?=
 =?utf-8?B?Wlk4bGFCNi9lSWRkaEJMZXNlQXY2NHBmOTVkWEc3aC84aXZKQ0xHS2R3dVpC?=
 =?utf-8?B?VDk1UzkwQWJWK3Z4MmFNSWRLaVM4WHo0YkdoUU1nbWJlUDNuSDMxRkY0ZWdR?=
 =?utf-8?B?Y3R0OWlweFZ6d2ZtVUNuaG5lWTc2bXJBWWp3b0NaNU55OW9CSzNuMGpXbld0?=
 =?utf-8?B?MGQ5cm5NcjR3WTMrMCtsYnB1cFpOL3hZZXVLYmNFTVR4VGptV0l0N3ZBTEF4?=
 =?utf-8?B?bWxzSC90N0s3d3hxeUlyWllsaWYyTmpKUmE5NWlVQTdSNS9nZE5ucDhDOE1u?=
 =?utf-8?B?OVJid0tVcDVWR2hrSkNBUGwyYlhrSkVERzYySjB4cXZHcG5uMUZoaHZPb0ZL?=
 =?utf-8?B?cXFOYWoxWnhEellCUEFqbmRnWEs4OTVxcGxQREdVbzFEU3N4eWlOMkNGZ25s?=
 =?utf-8?B?SEk0S3dvQ3Ira0ZXdjJxUGpDQkdKNGRCZUc0ejgvdE81TWgzVmpsK3dtMGdy?=
 =?utf-8?B?dnJxM1hJVXJucTRiazdRUStvRjZXM2xYUENPaXBvMC95ckJsWms1Z2tJTkVi?=
 =?utf-8?B?S0R1a2ozUXpReGFvWDJtMW1aa21WUGpuZnZJMHZEOWU2MDVlczFXK2JRK0Y3?=
 =?utf-8?B?Q3hKSFFYb0IyQjQrK2J5ZWpyejd4eStSS1N3OEdwTHVlWCswaC96eGJTY21G?=
 =?utf-8?B?MFZuT3BSZTZQRzhYVFEyNmkraVNrRi81QWhTUGJHaWZiQmYxNGdiK29ITFBJ?=
 =?utf-8?B?b29nSkFVSWMyc0NYZDk0ZFpxR1hWUmxiSEI4L0NDeEJrUTZLcEJHWWVMSVgr?=
 =?utf-8?B?ZzNEVnVXSmREU3JRVGtXSGI5VGVTZk5sNiticnU1TDBNcHpZa3hXOFJGVXNp?=
 =?utf-8?B?SFBEN0VaV3FuN0NXcWU3ZlByY0haWTB0eC9jaTdqSjhmbnRnalhMSGxhVmRz?=
 =?utf-8?Q?pwQgTaa+FKg5YcOdB8xczgQo8?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ff27e-3be0-4623-e83e-08dad6a9f3ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB7420.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 10:17:45.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMjRqI2Bm+pWtPGA+TuEuGdyOaPlBsV5PLMeAysMSS0+ZMGr6Gw4FVb1v0nvrEGRH/FQNcOTKDGh14NcPj+U8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9188

Hi Julien,

I thought I had replied to your email, but when I am checking to see if 
I have addressed all your comments, I didn't find my reply on the 
mailing list. Maybe there is something wrong with my mail system, I 
didn't find it sooner. Sorry about it. Hope my reply is not too late.


On 2022/11/10 2:24, Julien Grall wrote:
> 
> 
> On 09/11/2022 04:55, Wei Chen wrote:
>> Hi Julien,
> 
> Hi Wei,
> 
>>>
>>
>> We had considered to use Kconfig to define the start addresses of v8R64
>> platforms (prompt users to input the address). But we also want to 
>> provide
>> a default start address for each platform (Discussed in [1], header for
>> default value, Kconfig option for customized address).
> Why do you want to provide a default value? And how it is guaranteed 
> that it will work for most of the users?
> 
>>
>> We also had thought to use Kconfig to define a default start address
>> for each platform like what we had done for early printk in RFC[2].
>> But this method has been deprecated.
> 
> Most of the current Xen is board agnostic except the UART. We push back 
> the addition of new one because the address can be found in the firmware 
> table and I wanted to avoid increase the number of option (there are 
> dozens of platform out...).
> 
>>
>> So if we don’t use header files, just use the Kconfig, we can't
>> provide a default start address for platforms, and have to force users
>> to enter the start address.
> 
> I am not sure I see the problem to force the user to enter the start 
> address. My worry with per-platform default value is we end up to force 
> each vendor to provide an header in order to boot Xen.
> 
> I think it would be better to provide a config tailored for that 
> platform (whether it is part of Xen can be debatable). This would allow 
> a user to try a release Xen on their platform with zero changes in the 
> code.
> 

Above comments have been answered in my reply to you and Stefano.

>>>> diff --git a/xen/arch/arm/platforms/Kconfig
>>> b/xen/arch/arm/platforms/Kconfig
>>>> index c93a6b2756..0904793a0b 100644
>>>> --- a/xen/arch/arm/platforms/Kconfig
>>>> +++ b/xen/arch/arm/platforms/Kconfig
>>>> @@ -1,6 +1,7 @@
>>>>    choice
>>>>        prompt "Platform Support"
>>>>        default ALL_PLAT
>>>> +    default FVP_BASER if ARM_V8R
>>>
>>> Is there any reason to create a new Kconfig rather than using MPU?
>>>
>>
>> Did you mean FVP_BASER? If yes, we want to give each board a MACRO
>> to indicate its specific configurations. In current series, this MACRO
>> only be used for board specific start address.
> 
> See above for this.
> 

If we move board specific information to tailored config file, I think
we don't need FVP_BASER.

>>
>> If you meant Armv8R, that's because Armv8R does not equal to MPU.
> 
> I am not entirely sure to understand. Are you saying that an existing 
> Xen can boot on Armv8R?
> 

No, I didn't mean that. I just think we can't use only one MPU or one
ARM_V8R to cover all our changes in this series. For example, some
changes like new system registers are brought by Armv8R not the MPU.

Cheers,
Wei Chen




> Cheers,
> 

