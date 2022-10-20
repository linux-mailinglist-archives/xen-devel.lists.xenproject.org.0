Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E085F606194
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426784.675461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYO-00043e-0s; Thu, 20 Oct 2022 13:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426784.675461; Thu, 20 Oct 2022 13:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYN-00040c-Tr; Thu, 20 Oct 2022 13:25:43 +0000
Received: by outflank-mailman (input) for mailman id 426784;
 Thu, 20 Oct 2022 13:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPXW=2V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1olVYM-00040W-DH
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:25:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1440441-507a-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:25:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:413::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 13:25:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 13:25:40 +0000
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
X-Inumbo-ID: b1440441-507a-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0yEG32n9cRGUV7w8sAdet4lpkKWEH2SylJWjSUXGrmOeh2na359vTJdPE688QX+9J2Wue2VzBuGgdDkIcrbQNwzSci4CsVNMUMQrvxsg+4q6ZxdyMJ78Elq+GcSG+U/Z+E3Fd5SOgHn2JI1j0wLfndVQMaCQZ7jYU2mP1pxH3zbiGZRn3OyAiXGyMb7vA5zQWRD0BJQ6bi6TF4yGjRjlbub5/nsFQRqlOIrNaOVwc35iCKkakNCFTBNHbePjSp0QbOrYKVDy71bTZG1jzbzdfOPrRNijAbPTwCtkYFekLb3C8BXA0pkzfET0+37aXj5vy/MlF3KxCheu60enuqI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4huBr3a8iPd0vXhBJDxD2ZXF+mKTdG4nq3yNO8j/UU=;
 b=fLEqqUlLnQ6KNRiYCXxQN147Fg1zBs9MagdwRv9JhYWABhbJX5xxhFk21EJy8ia4KlYVouYeouY327ohgyjcyDrFXkFxyhTMmy+vYJ+31lTy5SeIdaOY+/oo2lOQmgL/aHG5jHFiSA+SAQjz+EMjsP21l7fT3XauBke6z0OID2pBVKx4npUYBnu/5H4RKOG+r9fy1fxmSVFgNr1SSdPeeK5lncwzgYS/ud4Lg+DT9S9Wlmx2Mo4NYkZzda9rKk3kt5MBkma1tx18DW0k0ET0DFeCGUe1wIJpUxRMSR9zYeok30u/6+1iiq6XmmRztEma7MmybD2Jiny6PzUYX+WFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4huBr3a8iPd0vXhBJDxD2ZXF+mKTdG4nq3yNO8j/UU=;
 b=Aw8+3kOb8aT6N7KPEkuT/ZoKDf0oivboQiPkrHi2+f1jWAocovG9f/WXrW9EiWBIsFOX2z4J/9HpRGUu7Ls4QOTHd8O906FyY3ALEgb2gIZCz85xu2up8GfulnBL5szDQxg6XrPHCJYJXf/1DZmDp+uMfJ4RN6RrL5NCwzzVJnmC8K5mQ/R54DE4ZLyjP1IXV4kiOzy8nhnENYSzvAX61zmX79PIi51HwjBIx00voZav5/lXSU4fnxpBsr3kqUDIyv/041BRjXav2kyROm6p8MMTqK/1CtMCmu79W73O/m+YfInuLUeK5iZI/9RCElCmqJhE0q8EP/e+T5Nv4XUiIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <865a2712-d694-122f-eb10-e206b350c7d6@suse.com>
Date: Thu, 20 Oct 2022 15:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Intended behavior/usage of SSBD setting
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <2f5ec31e-2ac5-2b22-8801-9ebdc4946962@suse.com>
 <Y1FBGTx5cSrkdVbZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1FBGTx5cSrkdVbZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2690b4-b898-4a7c-c03f-08dab29e94e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mcC3RimA7zwgFnwkNmJSxr/pwUzV6cSJR4qAPdMfyMgqvArMy516qrFNXiQ2jFSk6G9N9afvIZ7QSNf15JbHRAV+Wj4j1F+zPrqpfXCflnzkPQc89/BHbyq3aF0AW6SRVTwtiUdrJcd8urcoAx874xJbvodkzNHPm0n2nh6OufV5zrh8BGh3yCE0AntvXTkqpQICyg+7JvAKXSPX5YkN05GV7N+b4nEJ+DJXv2JmGqaNNh84OAi4wxmg+XxLMGqr++tfJ/JyYS+RpOW1oYUTRMfahbmtOISm8BtS6XHD+LF3kFOe33j4aFVJHhh7k68B5q093Ej6EDrKjvnpRXq0XCYitqlzOTJlzpccX48MAB9NDWk/JqtTGBxUG5xYAdNhCbybjkkMbf7q+/88cifKYi4b12csRqGKZ3HRPqtyhtUkGmEHz98Q57TorXOL51K+NxkT0vY/pyv+avxOqvd8GA9OzpdKtAcqVB8yQ7kqLMkhCKEBB00YTshkh9ItT7SaObYKOYkp7wsLtJEwWP3wZj1ssHmIXRtN0DLLahG2LqdtRJPsx37brFi1BPWlm/UgXh1fjab6aoQt5yu6QSQFn66VSxaCobFDyF6vDM7xfJIZwd1E5cm5Livg0j4u/7ivJoIsCmVqIoWyn9vhyXasciQg4YAVrfuTXt7+VZKDmEuGam9f3ef44GAE4wP1jn184asKpJ+Uz34AVVFmWyiQx0G9WS6sdxySYyjtuzY/pjV6nz77WZrjCzVmjgPKh9G5UpIDFeTkJC3RfjVj2QEXSd0s3oL77WrDlAI9W3qbkvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199015)(186003)(2616005)(31686004)(66899015)(2906002)(36756003)(31696002)(86362001)(38100700002)(83380400001)(6506007)(53546011)(6512007)(26005)(41300700001)(66556008)(66476007)(8676002)(4326008)(66946007)(478600001)(6486002)(316002)(6916009)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVgySy95QmhUY2J5L29jSitReWVRTlN3MUp4R2xhUmxOdStBWUNDNVdoSVpI?=
 =?utf-8?B?THUzWGNreTY4dlhCVmN5cy95R1MrbFk0S0lPQ00wbEpIUW9zR0lGVFI5S2Rn?=
 =?utf-8?B?UnB0Yk5yNktlWWNoemFGL2RsMnp6S0tiNUQ3OW1PVzNFRHE0MHhrNFowc0or?=
 =?utf-8?B?QUJEbXBKYTJ4WTJlbGJRL3RISzIzVldZZHdEYy9SQ0Q2TjF0SHF0VFZlS0U3?=
 =?utf-8?B?RFpXcGpGb1N4emxFaVk2U2tlS2IybDVPdnZaVnkyR3g3R3JQZkJSZm5oNjFk?=
 =?utf-8?B?YTBnZGFRZUppeGVFQTRLRGZnTHkxYzlPaDZlREFzV0NoZldTbkRzQ3dlUFFZ?=
 =?utf-8?B?Qm52cUptSlE5emE1M3B3Z1NMaTErcmxVQ281SjRHM1hxenhqVFJGUUNnZVBL?=
 =?utf-8?B?V0JBSGMyS1l3UG85S0l5WkJSZnFvRVJJb3kzTWlYZXZ6MnVUbldkOGFXbFN3?=
 =?utf-8?B?MXRsa3g2VjVSSzZodzRLQ29NMWs3NjhzS0cvOVdaZU9EOHZPbG85MFpCamR1?=
 =?utf-8?B?cmF2NzBiajV2bTRpTEdZdTM2R2xZakgrSDlTdU1nZHphSGd1KzI5UXNUOXp1?=
 =?utf-8?B?WSt1TWVieE9mNmhHalFKSWFibTNRYWNlVm12Rmh0Yy9DU2Y5Ymp0Y3hzcDFQ?=
 =?utf-8?B?VkYwZUQrQm1WeE5CbU9JeC9veVBXMzdrNFZpV2lhclB1Ly9mRERoS0pKK3ZL?=
 =?utf-8?B?WjhKaUMzTGpVV1NaT1ZXcGNQL3IwTGt5NXBlek5va1NTOXhzYUdlNTlLbExL?=
 =?utf-8?B?WnpMKzdZT29sREEyTXFzbEdneVFPWmNDbmwyQ3NxZHR3S0FNK2VmMEJ1MFJk?=
 =?utf-8?B?WTk2bmRzblkyaHhsTTFMbGxxanpsTG9vM2xycXZ4VEtCNkdxc3VnYkcxeEZ0?=
 =?utf-8?B?ZW9saTZpREU1L2QySXpjUGJ3OTl5TkxOWUp1eTNlWUZ4TUdJRU5XQzhXdmZU?=
 =?utf-8?B?WkhYZHRxSTIrN3Q4ZzdaUGowbEdwVEo5c1FnMGhHNGJsZXpxcE1SVmhHK1pT?=
 =?utf-8?B?ZWptdldKWmhpWmlFUnNJT01MSmcrMUcweXhTN0Qxb0xBcEh1NFhKd0pUcnAx?=
 =?utf-8?B?RHk4ZHZaQTJrQ0ZWNGxobFBiY0NKOGlxbENYVEJEb1NYWVROZ094dXd5dU5H?=
 =?utf-8?B?WDZZSjU0b1ZMQi9NOVp6ZTk0bStFcjI2R2ZWUlVwMkU1OW0vSnRCamtBMG5l?=
 =?utf-8?B?L1BHZWJJRDdablJCeTdVOThFZXpSdGFqTGhqK0NjdFFFWTlOSnlkMFFIQ0dv?=
 =?utf-8?B?b0dKYWZrQUlkVkhyanR4ei85UG1ScGxodEg2YXlXY3Q3d0lFMEttUWJyZzhr?=
 =?utf-8?B?LzlEZGR3NXdxbWRIMTN1djUzZXBoWnl2VFVuem8xZjVMZk90TVIydjYzbG9D?=
 =?utf-8?B?cW5WbmVZbFE3c0NudEEzNVoxeTBZLzlTZVJYWGUycFI4ZUZvN3E0cGVkamRJ?=
 =?utf-8?B?SnRXK0ZmT0ZyNW02ek04dDI1UU51cS8vanNDN0NaS0tvdi9IcFYwRk5SWjRq?=
 =?utf-8?B?eGFpdGl6N3Q4M1BUMS9mSkRDaStxVy8zQlFPa285Mk1PTU9ONVh1UFNYaFlT?=
 =?utf-8?B?cGREbHVrR3ViTkEzK2JDVmQ5WFF5SlRTREVJUytzSGFUTWRnc0ZpbDdBMElj?=
 =?utf-8?B?dFNGdnk3TG1XRHNCOGFCaFI2OXhqNHFXTDJmSXRnamtDWnkzaUpwZ3Q1dHBC?=
 =?utf-8?B?U3diWnhSU3o5VjhjWjRncGdYZTJSOVU2SGtmdjlvRGFkL1BOUUsxR0JRT1N1?=
 =?utf-8?B?NzZZTDlGdFA2RTdMV2V1aW1talhtVGxLRnhiQy82dHRtMVNqcnM5MW0wRFJ3?=
 =?utf-8?B?U283UEpvcldrN0RSZlNUUlFFTkFsTjBzcm5PVGRjT0pkcDQyNkZ5eXVJRXhx?=
 =?utf-8?B?bHREUzNwQnBydno5RjRIM1Zkb2krRzRxalJzZExZalFrT0VhYk1DaHJjQ3ZS?=
 =?utf-8?B?MTR4enB2N2FqaHhUQVZXTk5naWc0Vk9Td05iZUdvYjhNOEpNY1NTQzFxbU15?=
 =?utf-8?B?TjRTc0V6VytVQnBYK2oxSkhFK0lzc2dXR2l3QTJkWHd2eWtQNS9lcERvS3Np?=
 =?utf-8?B?N25YZVAwamlEeTNkTUhCZFJ0TWFKY3IvRHNuTmFYUWZRZzlKdWhMV0hrdGNG?=
 =?utf-8?Q?fwqJl4kwkNzjp+yHChxlMgYn6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2690b4-b898-4a7c-c03f-08dab29e94e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 13:25:39.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DarZIgFr+P+YA74EWdIacaAretrfnuPWyUkBcZBYXlx5J0VRcNlmU+OIpDIz40PjAUPRNitA9LjmQ3Qt3TyOjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440

On 20.10.2022 14:37, Roger Pau Monné wrote:
> On Thu, Oct 20, 2022 at 01:22:20PM +0200, Jan Beulich wrote:
>> On 20.10.2022 13:01, Roger Pau Monné wrote:
>>> Hello,
>>>
>>> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
>>> have been discussing what the usage of SSBD should be for the
>>> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
>>> that has an out of date description, as now SSBD is always offered to
>>> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
>>>
>>> It has been pointed out by Andrew that toggling SSBD on AMD using
>>> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
>>> have a high impact on performance, and hence switching it on every
>>> guest <-> hypervisor context switch is likely a very high
>>> performance penalty.
>>>
>>> It's been suggested that it could be more appropriate to run Xen with
>>> the guest SSBD selection on those systems, however that clashes with
>>> the current intent of the `spec-ctrl=ssbd` option.
>>>
>>> I hope I have captured the expressed opinions correctly in the text
>>> above.
>>>
>>> I see two ways to solve this:
>>>
>>>  * Keep the current logic for switching SSBD on guest <-> hypervisor
>>>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
>>>    command line.
>>>
>>>  * Remove the logic for switching SSBD on guest <-> hypervisor context
>>>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
>>>    hypervisor code with the guest selection of SSBD.
>>
>> * Give the guest the illusion of controlling the behavior, but run with
>>   SSBD always enabled when "spec-ctrl=ssbd" is in effect.
> 
> Right, I've also thought about this option but forgot to add it to the
> list. That would limit to only allowing enabling ssbd for the
> hypervisor code, but not explicitly disabling it, ie:
> `spec-ctrl=no-ssbd` won't be a valid option.

Well, it would be valid to use to override an earlier "spec-ctrl=ssbd",
to revert back to whatever the behavior is when no option is specified
at all. It wouldn't strictly mean "no SSBD at all".

>> * Give the guest the illusion of controlling the behavior when
>>   "spec-ctrl=ssbd" is in effect, running with the OR of guest and host
>>   settings (switched, if necessary, as vCPU-s are context-switched).
> 
> Right, this could somehow reduce the number of toggling, but would
> still require having code to handle guest <-> hypervisor context
> switches.

Why? When we're running with the OR of both values, there's no need to
switch when exiting or entering guest context. The only time an
adjustment would be needed is when the guest setting changes (because
of the guest altering the setting, or when switching vCPU-s); obviously
never when the host setting is "on".

Actually I now think that the two points I added actually describe the
same mode, just by somewhat different wording.

Jan

