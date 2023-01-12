Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A94666DE1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475895.737784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtff-0004J0-R8; Thu, 12 Jan 2023 09:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475895.737784; Thu, 12 Jan 2023 09:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtff-0004HA-ON; Thu, 12 Jan 2023 09:14:51 +0000
Received: by outflank-mailman (input) for mailman id 475895;
 Thu, 12 Jan 2023 09:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFtfe-0004H4-6w
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:14:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e39a3dc-9259-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 10:14:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7382.eurprd04.prod.outlook.com (2603:10a6:10:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 09:14:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 09:14:44 +0000
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
X-Inumbo-ID: 8e39a3dc-9259-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRsLghl/IFzYgH2nEzacVx6KLftGuSR1OxRR7td4dwmZf6aPqiMHn6iGcC9d/ls6yqjCzt8jy/K9RUqeClUS8CgtfLDVq6e1DHDbiJ8vmbbqbLxKD9ASDnMVNpe9EI8vrQFzZjMJ5qHj6iTFNrnW150/UzHT+tlJM6lsdE0XT1I1A9DRqn4PTBn13RP9OVQlpE4s0l5Aw9UXbTKw8o+4uZyVHCzx24MLmxK+L7xxA1PnJonsIt0hI4nq3ENSKNig4DyNJw7WmRbfKnlohDtaqQV5BTTVeU2XEl3dEyo3ntqls1CCgsG+f6lMuU9tpJJs0WzIqJ1NV6RDiotseuBDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrXq9sANmJGnfgim5bzEJCucEceEnyBbmFCH112mVlw=;
 b=KAgJ7K5nkN+HnnNbITGHrr+uR+Y+mbyVrnNGi/C2/B1OD/gda7th4c5YMDLDB6WKVkaNoEJNHWPrbiADv3Ord034MS8+3IHvSUctfAkOLsmKi4pZt8m6fKZT5H6ReRme5TjdW3fnRXw8hB42xVeCk+7a2aTzotyqHooccGNZhKqY4isxAhaCrnwyC0KCeRUT6dYR0m2c47AtZ11RnbR1gaXQ/TXmgDdhDOd1wKY1lLzsLvo1uP2f5pjfeB1p1DCUPTcTquGfqXnWW8d7s1NtXkbrsmCnXpL8BPsS+NUYVKWQJz47ODrsbp7RloK1l7oE2GKqI3RE52amhdKVHpCUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrXq9sANmJGnfgim5bzEJCucEceEnyBbmFCH112mVlw=;
 b=ryLa0WHYESd5FZ50y9A/EtXrXImIaL3jDhIAXGoxJxEjYb0VIUjPzGgulsCkSZttZWftcr9PZYsdMgOAp/yKspoVOw5JwKEbgjtrfPQHs2SYeNJpLLAGFznJpBeMCrjhAftsCdNiLaKAtXxZwpwmld/kc4EVkLhE0KjB1st1tZhSY0NQXZB3tlo28EXd7FdEx+P2zwfbFJ7kzFR/cVomVXyeMHCn7SvU3+61E1gVMwy6kdv3861+KtflHHbbOhhYFhTXfbGY130xmo9EBCq+iry5/DABuhuikPIW2SKS+pENwNWqmc4GOhjrlN7K6C+pd0TIcejdYdqkNuumE/PnRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee06d3ff-c73f-baa7-479c-7c9995156526@suse.com>
Date: Thu, 12 Jan 2023 10:14:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
 <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
In-Reply-To: <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f904e25-e11a-4909-6bc1-08daf47d7144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Waj5xBUZWvfirsEQF7pvdNrFtDu+opzeZ6Ikrr9EIklgUubgBpvOlOQP6aAK5vEwnJjEg3Pn0p69pjZK2fvXFP+abeVBDkYyk8OsZcvqAQrLpiVIarb6/e6L71Dudl5C8ff3Sc8tUpkNpOWdspUZPQd/wi9hZjAhLDQptToSnzE+n39CTAf3kCOdI2nRfzZH2jTrpXVC6eiiRKrTI/skDB7DdJxSkiymSLhA5VhdRlDqf3g3Z1V4qNq2CfgZxRbApiR7Hk+H5oFxGNyoGIzkb6UBaPro6NE8xIIKCQOW2wZPylYdGM/76fLXpjgRet3eN2GOfJVjqb9RxI5w7bL09ZGJG6WaVdjiGrYjKV68t2f4Xpeo0BYKQ8DH7lSzngzAR9Qkc43RLy46zR02EwcWmhzI//bbaoIXn6w1tmf2EdVG0Q2VJrM9vnbXPcCub5In0Fil6c0dVXLsBbcM9Zvxr/1E2z1lU6SzBgPYo+Aba1Q6hOJ0JeX1V3WK+JTCarmPEWM4Szzaow5tH0KcWfZPDsKeAHpVpXuN5QG90Qtex0u2HjKT4EiiVWXXntCrg8bxZETxHELcyrA2kmyRxilsvio60gmjmBBsK32nmbB+eoPZsQWQCZv30+6H3W6Vgiiq4KDaiSR0uxcgzWkDlJOHUfVr7aoNDmI0Y7Pnwz+/iKGA1Fjto0tR3cDq3KRA5b7LKqs1T4xW2rVjjP/awXhTpFR0sWYYdbAEqzrcrryNNfmYuL5HgWGjWhpQVMlvEohutKnJlHHqL/Jc6x6LV4mbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(53546011)(6486002)(478600001)(6506007)(6666004)(186003)(6512007)(26005)(66476007)(316002)(31686004)(966005)(6916009)(4326008)(66946007)(54906003)(8676002)(2616005)(66556008)(38100700002)(83380400001)(41300700001)(5660300002)(8936002)(31696002)(86362001)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHdhYXlkd21JNFEwdVlRaHl5YVV3ZURwUzF6b3FnNG5kSlNRVFJQUjF1VE1X?=
 =?utf-8?B?SzQ1b0ZOeXF4eEtFOFc0K3ZqbkFWcUIremFmZEM1THFuZng3S2RJOUR3Y3or?=
 =?utf-8?B?U29CTWNoUmZzemRWa0xKa2pQak9mZ3EzNEJhNzZXSXZMQndEUVBSOFl0NXNk?=
 =?utf-8?B?NG4xZXFDVE14dThpS0puRld4Q0hyYm12NUFaZEd5dGFwQTN5emtNbks4RFBj?=
 =?utf-8?B?Yis0bm5aSnNldnE5RjRqZ2dJdDVPY0pUcThySUNSSU1TdVFKbG44RnNIN1hC?=
 =?utf-8?B?enlVSkR3ZXlsZWRqZnBYZEdoN1RQV3RpZ3loR3labkoxUHJQdHZ3SVFTNHJQ?=
 =?utf-8?B?ZkZjRHk0aVNSUnBmUEtmeElYTXlTMFUrajhkd1JqQzdPSG9lVHdoUzlaU2k3?=
 =?utf-8?B?dGJlQ3RRMWhYSVp3cU9ud2ErajdOUGIwTENtazlTc21YRnB1bTMwemdveHlH?=
 =?utf-8?B?WGxqQWlLaHRuQjNaZzlzTGlHSTMrdU1hbjR3OFdUZXlxcTQycERIdy9IN0dF?=
 =?utf-8?B?QUxYMDN6TzBrc1lZbjRibjd6MlF0M21JQ1ppdnJHMXhoRnhLQWpBZTZ1d1Va?=
 =?utf-8?B?YmxQUEFXZytTcGxMNlVqQWM5NFM0UEE5aXdPQWZiTEtDOVZuNllzcVBIUDVE?=
 =?utf-8?B?dDVJMm1WQTlpUGRHUXBrQnhEQnRNVks2UFhlQ05QNGovNW9lbG1EL1hJLzlB?=
 =?utf-8?B?ejlJN3JXYnZLZTdFNlRacnBGRFI0dUxqckdzMzlWbUJib3cvQmEwTWFaVjdz?=
 =?utf-8?B?clVXMkpYVStpM0E1cSt2TEo2TjFVZFZiZ1dFbnE4UjJrM0lZNUtUeStxUnBM?=
 =?utf-8?B?amsvRDNrR1RFU0ozWHdKNHFEV1hOcEhOQkhEcVZhb0ZyNXVFKzlaRHE5aytk?=
 =?utf-8?B?WXR3a0hHSW4rb0NqQjRhM1RhMlVsdjY0dVBzd2EyNmRkbnI5cnZxNFlEWHZU?=
 =?utf-8?B?QVR5V256Szl5Z2N2TS9FTHhteWlzT2NGOURJU0R1bGNmVCtGQjdORGtYL3NV?=
 =?utf-8?B?YjZuV2RVVkdmZG12aDJ2Q0JUamp4WFAvNC9YNVh3dGFCN0lCejd5K0xKeElO?=
 =?utf-8?B?d056c2ZFT0VpR2RCUkJ2eUdTSFk4akRmSzRoMnFmeTdZbEkwL2tPZTlYUTk4?=
 =?utf-8?B?Z3VXQUVDWjFkSTVLeXRDdDFzMFlBak1FS1VMWklhRHlSOVEvSGdmcVgvYWx5?=
 =?utf-8?B?Y1RYbFdXdjB3bVVEb3BmMFBMUFJEWFR4THdVZThjZnQvTkhXczNic3BXS2RW?=
 =?utf-8?B?THNEb1pHOFQ0Y3hBUE1YU1Z4bHhBSzdrZjBacVZwUkxjQ0RmVVE2NStJb2I3?=
 =?utf-8?B?QkhqMHlwZFNYTFpiZ2dGeWk3SHlGblFsMmhMOXkvR3JwbzBaSjZyblZ1KzZI?=
 =?utf-8?B?S1VLWUZsa0VjaFlJSnpNSDlhVmMzSENKTUpaR0QrN0dxeTVzZElTdi9vY011?=
 =?utf-8?B?NDJTdXU3NDFYSmpzNW51SXNYNzZLT0Q3azB4aENKZG52cHNPUHo2b2hUN241?=
 =?utf-8?B?ckc2dU1qS1IyeERjbSs0bXVLdDJEUXJpNTJNbmQ3VTcrakdhUTEvcjZDSlF4?=
 =?utf-8?B?NkV6Vk5uTUpiS1gvTUNlSTVXa0hVQ0k2MEZON3ZuU0RVbnBQdWtKVlkyU01m?=
 =?utf-8?B?azBJYlJVUEUwdVgvdGRLempyNkt4REIxY0padVBqTkV3WVNTcFp2cWI0L0FJ?=
 =?utf-8?B?VjBHLzV1b2F5RVhMeVZmMmJPUnFoMFdJY29TK0ZnOTZyTUdrMVkyNjhucE5x?=
 =?utf-8?B?eFJ0MXUveWxKc2Zvc3lsZEtuQ05KcWNmTncrL05HVFJLYTZpbGFTNGpNYWcy?=
 =?utf-8?B?d3pLWFd0R3hWZVZGNlBMUDhYMVlTSGJXYmZ1OHQ4bklnRzh6aTBydEpOeSty?=
 =?utf-8?B?NjkxbHJwNXNqV3V4YUkvYmN1dlhPVDNBaEs5dXBDcjJQSEtoVTAzVW0rcVk0?=
 =?utf-8?B?bENmbnlUME9LMUthYzFuajYveGd2a0tUdmZOa3oxbk5tdmt1SGxiYXpzOWN4?=
 =?utf-8?B?TGNpRzJuNFNWaTdNZ29oc1FFaDdVbXZBTHpGR2hCdEh3aDVMdUV4cUIwN3p4?=
 =?utf-8?B?RjJ0a0ZIVGxaUEgraEhxZm1sVlZPUjFKcUNFZzRPU1BPOGkyQVpJTXlNbktR?=
 =?utf-8?Q?vP5Ew4SkaDw8qP2ctv5hO+64J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f904e25-e11a-4909-6bc1-08daf47d7144
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:14:43.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzuHKY2TJ7VSHLQINA6QOgZbuNKmc4Jml9UP7OhxsAIdpzxQFbxx2lOAD26gZKk24PgGI+arMNCY4q41zEFuRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7382

On 12.01.2023 08:46, Jan Beulich wrote:
> On 11.01.2023 23:29, Andrew Cooper wrote:
>> For posterity,
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3585379553 is
>> the issue in question.
>>
>> In file included from arch/x86/hvm/hvm.c:82:
>> ./include/compat/hvm/hvm_op.h:6:10: fatal error: ../trace.h: No such
>> file or directory
>>     6 | #include "../trace.h"
>>       |          ^~~~~~~~~~~~
>> compilation terminated.
>> make[4]: *** [Rules.mk:246: arch/x86/hvm/hvm.o] Error 1
>> make[3]: *** [Rules.mk:320: arch/x86/hvm] Error 2
>> make[3]: *** Waiting for unfinished jobs....
>>
>>
>> All public headers use "../" relative includes for traversing the
>> public/ hierarchy.  This cannot feasibly change given our "copy this
>> into your project" stance, but it means the compat headers have the same
>> structure under compat/.
>>
>> This include is supposed to be including compat/trace.h but it was
>> actually picking up x86's asm/trace.h, hence the build failure now that
>> I've deleted the file.
>>
>> This demonstrates that trying to be clever with -iquote is a mistake. 
>> Nothing good can possibly come of having the <> and "" include paths
>> being different.  Therefore we must revert all uses of -iquote.
> 
> I'm afraid I can't see the connection between use of -iquote and the bug
> here.

In fact I think the issue was caused by

CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default

which allowed the compiler when seeing "../trace.h" to pick up
arch/x86/include/asm/trace.h. No -iquote in sight here; all that
happens is that #include "..." fall back to using -I specified
paths when the file could not be found by using ""-only paths.

Jan

