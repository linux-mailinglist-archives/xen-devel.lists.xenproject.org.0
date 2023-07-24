Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3FF75F1E9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568686.888435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsP0-0003oQ-PB; Mon, 24 Jul 2023 10:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568686.888435; Mon, 24 Jul 2023 10:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsP0-0003lt-MR; Mon, 24 Jul 2023 10:02:54 +0000
Received: by outflank-mailman (input) for mailman id 568686;
 Mon, 24 Jul 2023 10:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNsOz-0003ln-5n
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:02:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fcd6661-2a09-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 12:02:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7525.eurprd04.prod.outlook.com (2603:10a6:20b:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:02:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:02:49 +0000
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
X-Inumbo-ID: 3fcd6661-2a09-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST8f9vpP+WGzat3oJKxrDN9y4oV54JTT19ObnqbJF41lM9mOgVpGumHNvuacaTkC9K/UHxxkHxOE1upChMrGsbqJLt98yaaim/6mLQmTtyRcyNAHB+AJ9HZ4NC7uOAbCW0HO52+dabK3eEHowdxvhh2hd7i2JAvx1rp92TfBW3DQPomgfnhR1VvApn+BIeCJPMgnV4VxYv1rsecmxmfxrc8rDUxCCmVD5TnG50/P5rOw82ZLJH9LuapG00mGPkgoo2rcNdkVGPXSmkAIKsdnwt/dflNtdNgeBRdbi03rXTwNWDLhyHkM82oKSxkvGo4MqYeSmb4Kx7Ay08pdVdMvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soERpOsRLbV3brjvLdmLqvEhIhDtCg7lQaV+SgJ1pEg=;
 b=ZMfaZpMMrwE164lwaIlnGpc1AlcfCv2Hm0FR99/ISRYPLHrfB+jLtuj3h7cWCKCCLrB3Yvf1VE+ccqUL1il2w9FqEfKrlZ7TgPqa2RVHfXmm5cZoLoE+tDdZxPftEuzYf2o2txP/UGKguJzsHPZoU7ofpEQUkc587yCcQS1dWiDwp4Nju3vKG4lpxhBAC0yFeElvNd6AP9YOYKqUy/c5aB1qS553X7fCuV8HSpsJqzAY+TLwBHPhRTcqowOULhJtPpmJJhI1AKNgyu+Wh83OASMQBkJO9EVJtr/S6ZVnDiJRXbC2c3OHh11ntCEzKyoq1oX4gOoG4yChC7aRxvNRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soERpOsRLbV3brjvLdmLqvEhIhDtCg7lQaV+SgJ1pEg=;
 b=l7RHfuLJXHNs2FEbRV97eFNWkkqZBCceMB6TbTRPQjQSRPh26PhgMti41mB5ZP4022Cvdchql+GNoz7R5WB0TXrUvfYVdmNUUw0HbeB8FllsCrqcmdHFAMCsW1oxnQ6Mh5q0rjR4src6ZIkmvaNn0I6yRgd1RtB41UxF1AoYdAtpUuSJSsMIgdLPDL5+RSZB6PSJfNjYboSfk5ZMIXAt9HN0iZg4KuEal5GJnoe19oz7PCDa+YekrrZflmPUxe5E6uw0/l961BBrIT49GXH5LvYMlngoXThvF26njspQzSt0WYq+Gxq9LaoPIxd2qW1xhWUFf32FDeddgJnU7bidiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44da9133-ac6a-4f69-8478-0f7cea464d08@suse.com>
Date: Mon, 24 Jul 2023 12:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
 <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
 <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>
 <2b4075e5-0b17-fe14-72db-12c63ab30f86@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2b4075e5-0b17-fe14-72db-12c63ab30f86@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a96847c-9fb2-4855-85c6-08db8c2d2314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q5rXxVy/G6pMIxz+XHjjJ3EzgiyRNxc8WAamyjH8CjXa9vlpYyzoxTg9jMZkDi45rd0Qs7SbLtK6hUIXbcvnkHZNbv7jxxETF6MC5zQa4UMSDG5g2MPoAcTdk8ZIbJlcZw6I5zFsEYQ+WRbPNpZvxEoFW70VTuOeXaIbQpVTGSEIErH+cvuwDYvmOHss1U0gFZogeTVo5FY0lAayYUXCVLKUAHiU2/w/2SscZ2KrrBHbDVJEVJoSXUhXwq15G7VabODNaHBck+JBjePMT8GRE8R9863VM9f82ofBYXrpGNqEg/97rvJWhwd4FbzNGPrAGQ4kLW4s1fSwwPcTT6xB9c6x3gxgyF+PjtfFThiqAha7V4SZ9g5QECQpxQKm7ldgN9QgH5VEhuTVU8FGyS6zdm5KicEUD3vgUEQMYURchJzqrJrKpy/VHrsMdEg0x2AFWTWnFojOVSYG0zv2Fx44mCpvUBZlF69nedqfeCWfDUzYhlfpfKwDL+oArn1KVTMYFQA8qPxj1TV2VJ4jiO0CMPsaIh7tmsVI7h48PK3OPKLjFsbes1slLlpNGqmxCdH2vwZTeL49QtE9PXSDz/nbhYJUd4WirGI0NIxOSegXHeSESgk4+kpbhIt0A4MxNRdstq9ncwYjX63O8+D2VvRjDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(38100700002)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(5660300002)(478600001)(54906003)(66556008)(316002)(6916009)(4326008)(66946007)(41300700001)(26005)(186003)(6506007)(6486002)(6512007)(66476007)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjNHT3dScDQ5djdRdnlwcDFpZFp0bjdGbkd3cTdCNHF5TExJZytuV05JRVla?=
 =?utf-8?B?bDVlYytFQVQrVGJtL3o3RXFteWtRcnMxUDVxRXFybkkvaVgxVkE2VVJPblR0?=
 =?utf-8?B?MzZ4TVcyeHZUZmhWVldKa1MrcnFsQ1o4OEFMK0xUcExqNzM1RDUrbnpXV0Jw?=
 =?utf-8?B?WkcwR3ZrMWlacHVOck9DVGZNbzc0bGJsNG01Zm4xelZ5OE9WcSswU08vRWhJ?=
 =?utf-8?B?Njd5MnJyWk1oOEhkWHQxczdWczVkR3o2OVZIZnNtRFVZS3VvNzdPNEtWaVh6?=
 =?utf-8?B?SmkyckxFcnhqUEd4VFQvZVBkUTkwcjRzbEE2NFdGWnNnMkpjN2NnS0lPaEJq?=
 =?utf-8?B?TElSZTBjQVJ1cEdYTzVtdDBEbmczNnoyN1pDM3crOFUwUUJVeS9obkpNMS8x?=
 =?utf-8?B?UWZlbkdCcTBqR21SS0kyei91Y2NPNE5ybGRzZGMvU1JGS2pya1ladWNPbFgy?=
 =?utf-8?B?SCtDMURWOWNUQzM5MzlOMVpJVld6TFgwTGNsemxMcHJmVzg5S1V3OFZicFB3?=
 =?utf-8?B?TktCY2FtcXltUlkxUTluU1V6cVNKQXFiZ3cvd1FyYWFXaERzRG1Za1Fsd1pB?=
 =?utf-8?B?ZnhLMFZFWHk4TFMvTEFLMWVTY3pENXZHYU0yZTQ3TTBIVVJjekp2TEVUL2Y4?=
 =?utf-8?B?UWhQOWV1UzJSY01vU0swNWQxR0s5N0lyblU3RzlTOXFFTFlWUUlXcDVpZnZr?=
 =?utf-8?B?NTJZZWo4Q0FxM3F5enZyUjYwVU5tcjc5Mk1ibG9CRkJuUEZySkUvRm9uUUw2?=
 =?utf-8?B?MktUaEo0QTNIdkZPcmd4ejdUM2JldmtpL0Q5c2VhOE11cjBicUgxL1cxeXB6?=
 =?utf-8?B?REo3a1lLYVljSTk1TlFJbENiU3pnREZhUFlXemsvQ1AxZTBUTmpVbEF6NkFG?=
 =?utf-8?B?MjBkaG1EdC9sa0FOMG9UU3U0dVZIelJ2bGNpU0pVWXlKYnlKaFJzTGRZMjBi?=
 =?utf-8?B?NmVtYnJ4MzdaSm5Sb2dJRTZKbmFkNlFHVDJYekRRN1dyTXNEWENwdHZwaVlj?=
 =?utf-8?B?czNQSm1GSVhwTlQxZnVIMDh4cEtHK2R5TGZ4Z3lRQ3o0Y3hNVjV4VnNmdlhi?=
 =?utf-8?B?VWdMNXYrRjQrOFoycnRkN09uYVI3WGpvNmRnQTFMNHZ2d1ZGT1JhczZtekls?=
 =?utf-8?B?UlZlb1NEUUJLUHlsSkVOTnBIeGRFNmVwSEpOdkdsY0VLV3I5c0dVOGc0Zzhj?=
 =?utf-8?B?bTd1cGw0VEY0bzlFM0tZWVhpV1VqQkU4N25tZVZ4OThROUlqQktXUnBaNTBu?=
 =?utf-8?B?M1BrdFkwNXlRVGhRTUd3NUtKSGlTaXI1QmNFVGRZQlJ6a2NDOXFWSEpZZDNq?=
 =?utf-8?B?VW93UmtUQ3YzM2Z6V1BMQklOdHRGTTJtcVl5YzRiMm9DelVCVnd0bFhySzdR?=
 =?utf-8?B?ODg1bGVIelhhbmRsQXFHS01CMEorekZrQlV0SzlxWXEvcHhMZWprZU1yUjVl?=
 =?utf-8?B?SytnWklHVGxSalhBaDNobHB2MEZaM2hMY2p0cFBZN0hZdnpON2JZUlJsL0lk?=
 =?utf-8?B?Vjg4dGhORVdBeU9Wcm5XdDM2SlZZaTNJTnRWMS9TWnF3UHVSeFh6YmxYYWpq?=
 =?utf-8?B?bEl6Sm1RRWw3aXJmVGU0d2tTOXRRbXFOWUdlOHNsR1VqcldiZGFuNWhha0I2?=
 =?utf-8?B?UktNWG8zcEpvMk9uUUh6VnhOS3pDbFMwL2VLeE1yNWFNRTdlMTJkZnRHaVZX?=
 =?utf-8?B?a2EvMjVDQm81R3l2SzlYZ0FWcDlydFRQVy9EVC9FSVZ5VGNEV05sV1pIbjFn?=
 =?utf-8?B?WEhrRUhZREgxdzgrem5CYUlOMU1RbmZNUWJTY2FLRjJwZjRBemZISHh6QzE4?=
 =?utf-8?B?cDVRamNQK0xXU2hpTkFWMkJQVDJmVVZhY0xSYUhxWXhENXF3aWdZemRTdGxr?=
 =?utf-8?B?OHh0ei9DNUxKSFlaMEk1T3ZtQ0FqeWhCL0MvOTNmZmp4VjY0SHI1Y3M4aFNk?=
 =?utf-8?B?dWs1YzRXd1k2US9WZnBQMXh3U2RLL0t2d0pWdzdGUG9NZmEzSU9iSURCVHho?=
 =?utf-8?B?aVBCaU92UEZjUXBWcENPTUJaZk1qMTNYcWluSTY4TWRFamtpamtZQUlWdnov?=
 =?utf-8?B?VEZaSk5sVUhjenlOYVd3a3IreXlNSm9mTUpoTkUrZlluSUJVaHFBaWNzZ0p3?=
 =?utf-8?Q?nyAiQByKh9dDetpeHn+o3NZQ4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a96847c-9fb2-4855-85c6-08db8c2d2314
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:02:49.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvGyjnSqKvOqji8529WwLEuXTKnvKUPcuCPLHNYSmi754fZlzKLJcxiXmGUAOped+51uEJxyw/IEGmgwvVI8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7525

On 24.07.2023 11:48, Simon Gaiser wrote:
> Jan Beulich:
>> On 18.07.2023 23:51, Simon Gaiser wrote:
>>> Roger Pau Monné:
>>>> On Tue, Jul 18, 2023 at 02:26:03PM +0200, Simon Gaiser wrote:
>>>>> As far as I understand the HPET legacy mode is not required on systems
>>>>> with ARAT after the timer IRQ test.
>>>>
>>>> What's the relation with ARAT here?
>>>>
>>>> It would seem to me that keeping legacy replacement enabled should
>>>> only be done when opt_hpet_legacy_replacement > 0, and the currently
>>>> modified block is already in a opt_hpet_legacy_replacement < 0 gated
>>>> chunk.
>>>
>>> I was concerned that on systems without ARAT cpuidle might rely on HPET
>>> legacy mode being available. See _disable_pit_irq and lapic_timer_init.
>>> But now that I stared at this again, I think that condition isn't
>>> actually needed. If we reach that code we know that we have no working
>>> PIT, but HPET is working. So _disable_pit_irq which is run after
>>> check_timer (__start_xen first calls check_timer via smp_prepare_cpus
>>> and only later disable_pit_irq via do_initcalls) will setup HPET
>>> broadcast, which should succeed since HPET worked previously.
>>>
>>> So I guess we can just drop the condition (please double check, that
>>> code is quite tangled and I'm not familiar with it).
>>
>> What you want to respect instead though is opt_hpet_legacy_replacement.
> 
> Can you please explain what behavior you expect? As Roger pointed out
> this code only runs with opt_hpet_legacy_replacement < 0 so the user
> didn't make an explicit choice.

Oh, I'm sorry. Please disregard my comment then.

Jan

