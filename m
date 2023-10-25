Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD87D7164
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 18:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623114.970616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgJz-0006Ue-QR; Wed, 25 Oct 2023 16:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623114.970616; Wed, 25 Oct 2023 16:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgJz-0006RK-N3; Wed, 25 Oct 2023 16:01:27 +0000
Received: by outflank-mailman (input) for mailman id 623114;
 Wed, 25 Oct 2023 16:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvgJx-0006RE-RM
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 16:01:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3bd45f-734f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 18:01:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 25 Oct
 2023 16:01:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 16:01:17 +0000
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
X-Inumbo-ID: bd3bd45f-734f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAqpLIKk/r7DCWFlYQVeR3rZNHkkG38hEA8JA1R+MaKf5YHzY5aH5DqJm2e2oe0BLdH/ng2yqPUCuXJab73WsJBpPNEmli+KmHQIlOX+xCRoC+G9h35g0RWyxlsjxGGyyy602r438h231JOTHxDV0Nk4JzJFi3CmAc+TIqeEKR9WGEE/WsVPNtb0fVdvob1AeerLv56kzRgXtkO9WynGJfEUn7cTYKhp+AlRkZiPVirErsR0EvFbzmSZzZo2Y4dDNeUVMV1HaXq2AeqXxCiXBqDgYWJhm9Nmm5+Tauf9q9yLmmG1vLRA0QDq+nQjBwa67gda9gopEpUgoP6AUsZlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CP3WSlakdVikstFUZAG7JpmFfzK2ajP45pzYhA/Ds2A=;
 b=LXXeMpYgEm481efv7FwtChXo0+tl0n5fSMTB3JWskAH4rnImvcnqTO9SYxPR0/hu9r97FaaZN8CsBikwPyHbIujOsodyA05ItEEEgiEi7reFqwBRFjSPfrCohF8ubxUbiQl0Gw10o0N62yZ9giqKQSdky+9OycLYaeIKp/SzV/Cuhyljb1FPHZC+58wa55FtXgtbnhCSozow7fPsSoPvvsUHQVjd43m7W4ckf9u2FNHVevucQKv6ko0vEK/iVeaKHuLepPkfA6T9zwybu0jvJjzinKxNrUwH8RmCLZWsBTKzqXQFCwKILHb4TynIEk1Fo9TnmjgDV8bmrJo0Xe+VEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP3WSlakdVikstFUZAG7JpmFfzK2ajP45pzYhA/Ds2A=;
 b=kklkwHQxwjUogthi06/4/KXR9jeOIynaoB/zK8NjktGBlMp732irYgW1yPogAYALDlg501nlT+Q/k9O4jJQanM6LJpDpyTMZrjUfKaKiud7gEV5eoODXDdR9Q3UPtkVctmeMK3wWU7+M6ri6qAz4WT+ZsDEnPTL5sk3k+SzfLmWJT5tv/KglEVruFEz+9IwZBMK+yzzDIwyHL717PNFunQaMgor4YzG4xTFmYE+wBw5BY9XOM/kHFODZljkk+oTchOr3nLV8pZE11mgBAkGxLdRS1n7REdV+DIy1rlXdW9NQWB2Gb5o/oemp+t2aI9LA4/jaSKorMzSvi3B7IQ0Bow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6b207c6-4bc2-e172-428c-a2e3294cc490@suse.com>
Date: Wed, 25 Oct 2023 18:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
 <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
 <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
 <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
 <50b3a500-aa7d-4d3d-8bcf-220f8ee69b0e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50b3a500-aa7d-4d3d-8bcf-220f8ee69b0e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: b56cb8d6-8eb0-4f93-3d1c-08dbd5739f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RuH281WmbinZmhf1OfOsiFpITXWvx3Q8Uo2UDl87MiHhZD3v2GDi/6fBFZVvFPuWERuCtF45cbCei/6p4/jUB4ybuWNbMgXcP6TWXwE8DxLE6jKOhMTzS942s+aEbL9vXLdmdZc1un80GV/ButA3hhtG+uC2lU915g1teRBz/hRcJaqnDiGoODFtUjr/47kZTgW5DYnO4YnyjFI0yy4zbrSb3MYQGurX5h3IoBCWbopGihhLIjKWGKt4U9xEdbd2cFuQ3m3WE2P+8EZKtliqkg7Slkufp07cAT5RVfvYr/JjQ2UMWJu/qkkkk0e60mcN1bjeie4AbpzEeEullnmlOiK1oRnorPsD+JnsPxnaB42Q4gZexg2UmUDIDU27hxgZo4I9TuHorjSMbNT+g+xV+sUkscPC8zHKbqI8iWJhhyL59EwFDxJeKaVVPZyfDHlUtvBnhkOXIIessC8J9ujPYh1zUnFWZJpdNxOX9Q3AOnrtl53XQPzhBkuUQv8t+f0mywbIyiaVidRBqlHS7ngoGTmVswKwVcYJ4HhuDaqroADQJLysnFuI2aaGbOFPsclJe3AUosKGTUeEfE+DK29WdxxWCTp/TJr+uur6exo12HmrMTu9Pbjc4ctxentao0viY+IIjridDbcYv0DZczavtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2616005)(53546011)(26005)(41300700001)(7416002)(4326008)(86362001)(31686004)(36756003)(8676002)(2906002)(31696002)(38100700002)(8936002)(66476007)(6512007)(110136005)(6486002)(6506007)(54906003)(66946007)(66556008)(5660300002)(316002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1pwVWkzdE1GTUNWK2h5SEdtTXJJTGRSU1Q0d3VqOCtKd0MyN3JKdHU0SlR5?=
 =?utf-8?B?aTJyWEJhMk1DQVJPazNTUGtZa2lBRWpwUHlSWVhwS0YzQnhiTnFwOUxjc0RE?=
 =?utf-8?B?aHN1ejNyaXI1RUtKUEczTk82Y2Zzelg3MEtSbUtiNEJzRHNvUGRVZmlEbVY3?=
 =?utf-8?B?RVVuRjR2TlBROVVIbEUxeGRoWGlxaWFVazBoRDNPTVFPbTBLSisxMFdQMndj?=
 =?utf-8?B?OGx5RFY4NzA5QUJkQjZLNmFEeWtOYW5ldmxDL3BiejEyeVRaWjNpYWdHdHJ5?=
 =?utf-8?B?dERtTDBxSFhMWHgwbTdGQlZxMXBTYlNrQXpWSGpQWENoNS8wYk1GbmgzOC9l?=
 =?utf-8?B?V1ZlYy9TWS9xaGRpbEVtdi8xeFRESllDSC9CRHhoT0Y5aGxpNVMzZG96YmRX?=
 =?utf-8?B?b09kak5IR3c1bzZsdmZmdVBTN3h2NUwvRXQ0M0pUaVpmR0k4cktFSGFmNHMz?=
 =?utf-8?B?a3BrZnN5R2MxUXBGU2xhK1FiVlRFTkZsbFd3ZEJNbkt3KzNiamx3UXY3dmVq?=
 =?utf-8?B?ajJuOXViTm4rS05DM0UyaDJSTDBueExOU0VXUWk5VDhHM2owV0ExZXMwc2ZB?=
 =?utf-8?B?aEFOMFJlK3pSY1pHOWhhS3VKeG1OeEFUU0NLdHJMY2RBSWxXUzdQY3FuMUl2?=
 =?utf-8?B?bEk4VW42Z0lxbFpGdDF3cWdSbzJZK3J4N0ozYkphQlhvM1kwcGZ1clNhOU9q?=
 =?utf-8?B?eTFXSDVEQ3U5NERRaWRIL0UwZEtCWTY3Ync3UUQySEU5Y01xMGxyT0RrUTU5?=
 =?utf-8?B?VEJCOGhYb2ZQUnU3cWIycnVMUHAxc05uZ1hxSXp3T2xxYlpFSjhONytHanFB?=
 =?utf-8?B?RThpdjFldEFnRGE1RzU5UEZJZDMzUDJEblcxVWNrOGxpU1l4Y2N5L2djSXgw?=
 =?utf-8?B?Q2k2WE5OZmcxMDZOSGFqbGJ4RkFzRStIWmxQMFlZMXJNbnpPbkcxS1hCeFhF?=
 =?utf-8?B?TThCeERyNmJUajNVT2lBaHhjRUlkSmhxRWIvUHZxVSs5YitJVzNtUXRZRk1N?=
 =?utf-8?B?bXZDUTNudVdNS3dYK28rSXR3M1kzQ1kwVGt3dkRGbEFhOW9aWExFNVNpcHRT?=
 =?utf-8?B?RFNiS1YwNVpEQXFkVmVpUUhvUnE0RENzTGZkK1hSN0daQThDSFJra21NQkdM?=
 =?utf-8?B?RlZmTVdFMmc1YURzcHpFcUs1RGwxMGRFNWxkbXVEN1hKREJaWnh5d3kzUUxQ?=
 =?utf-8?B?cFVpYzA2dER3cE9mUWhpRWt4Q0xzRWpTZUxRUXdKaG02QlhYZzQ5aHBkUFJC?=
 =?utf-8?B?NXdSUVd5NnFJcDU4MjhhNlM1dnVYLy8rOEFwYlBUNkVhYVl3dUdsd3krR3lB?=
 =?utf-8?B?RGdlOUhHTldjZll3akFvM0N0WHVKVklGVlhKcVJqQ0p0Nnd5eWlPV0s1T3ZM?=
 =?utf-8?B?QVFma2dnWENsY1NUNG1wRTFQK0Joa2xqbzJyd3BZNDF4RElGSUhURTc1WDZj?=
 =?utf-8?B?RW5OWHVYQml0aGl4dm8rWVpsd1J0ZHRvbVhuLytrb05HNWhvR1BPdXdpRVFk?=
 =?utf-8?B?Q3IwbUpLTXRLajZPclFlOWozeWdtR3lxK3M2MmRXRzlxWXAzUlNGWXNJRjNq?=
 =?utf-8?B?YzJXNTJPRERqUkI1YzJNaWk1bHJ4Ny9WcnhhaG1NMGJ4b2VZVWVCaW5kMmNB?=
 =?utf-8?B?Z2hsTTZQZEhCdzVwWVk2V2d6QlRSd245OUNTL3IzNkR1WW9UUEVUM0Q0cnFr?=
 =?utf-8?B?YlljclExM3Bha1VubVJpMzZKdGZUQzk5VHd3VHAvN2w1emd2ajdKaUl4Y1cv?=
 =?utf-8?B?QVhhcWFyMmdXZkUwNUwrU080RzFmM1IrRDFlSVlCV1gwUUNhaStLZnkvWldO?=
 =?utf-8?B?ZzNTR09BcGJsNzJET2xLdXVIaWhSa3U1S3VHVFBVdVJFOE5YWHZnM1EreC9l?=
 =?utf-8?B?cWRveFZQanJKcjl2WHVXSmpBV2I5aG01THlLUnh3RGlucnRiMmVQd3VEZmRG?=
 =?utf-8?B?WXBoYkVjczBRUnJnK2NqUDhDdU95TTlrc1R1WmJxZnM2TGJqYkY2Zm1QSG9j?=
 =?utf-8?B?eDBreVlkQlBhSHQzM2tISFEvaVVJMTRtcTR5akRoajQwdjZDczNOTDhrbGlM?=
 =?utf-8?B?Z29QVUxkNW9hZm9VQnRkT3JlSTRZN1ZMZVNxb0FreEN4Rkl4d21ZSVFENVVN?=
 =?utf-8?Q?O7hEsQs6I1TQPak46MqN3Eqly?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56cb8d6-8eb0-4f93-3d1c-08dbd5739f28
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 16:01:17.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiVBLY/a75/HW11GNOU84zlvoxPgfh0cvayVcS5zXwy1QjIjGwFkrb7BKq8sEHO1wL7LvA0E9WDDGs1OeoJRAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831

On 25.10.2023 17:58, Julien Grall wrote:
> On 25/10/2023 09:18, Jan Beulich wrote:
>> On 24.10.2023 21:59, Stefano Stabellini wrote:
>>> If I understood correctly I am fine with that. To make sure we are all
>>> on the same page, can you provide a couple of samples?
>>
>> Taking the earlier example, instead of DRIVERS_PASSTHROUGH_VTD_DMAR_H it
>> would then be VTD_DMAR_H. arch/x86/pv/mm.h would use PV_MM_H, but then
>> you can already see that a hypothetical arch/x86/mm.h would use X86_MM_H,
>> thus colliding with what your proposal would also yield for
>> arch/x86/include/asm/mm.h. So maybe private header guards should come
>> with e.g. a trailing underscore? Or double underscores as component
>> separators, where .../include/... use only single underscores? Or
>> headers in arch/*/include/asm/ use ASM_<name>_H (i.e. not making the
>> architecture explicit in the guard name, on the grounds that headers
>> from multiple architectures shouldn't be included at the same time)?
> Thanks for providing some details.  The proposal for private headers 
> make sense. For arch/.../include/asm/ headers, I would strongly prefer 
> if we use prefix them with ASM_*.
> 
> As a side note, I am guessing for asm-generic, we would want to use 
> ASM_GENERIC_* for the guard prefix. Is that correct?

That was an assumption I was working from, yes. Could also be just
GENERIC_ afaic.

Jan

