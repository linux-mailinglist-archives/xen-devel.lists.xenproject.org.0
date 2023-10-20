Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF07D0884
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619669.965140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj3N-0006Qn-EF; Fri, 20 Oct 2023 06:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619669.965140; Fri, 20 Oct 2023 06:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj3N-0006O7-BT; Fri, 20 Oct 2023 06:32:13 +0000
Received: by outflank-mailman (input) for mailman id 619669;
 Fri, 20 Oct 2023 06:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtj3M-0006Br-8O
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:32:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b7f003-6f12-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 08:32:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Fri, 20 Oct
 2023 06:32:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:32:07 +0000
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
X-Inumbo-ID: 65b7f003-6f12-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgdHoWuJPZxlk/lIMYi5unnLprIzg2UGN+yxauoSFp+6C/P/wL9FOsIy3Nmbj57YpWwUxCrz4T2+OJfAgdsM4yiYDcyM4yvo9htEfML8HbMeOev6oQm07FwIXhU03dzCihCuTfCS9E/21fVUuVdOvuRHVUBzi+Fw5dHPMdPoR2XBtISH8aLudIkJPf04Y6UfIMDslo3P2qjAmHFdDX66mw8Ns0lQsT3sv5LP0YnCCOZddrc5z0oULOuXvd8mlovFY6mb4rqxAEzdGoQxfx4zowL7ekcPCt2v3dKjkT5u/rh0ZAO32T2JBMHNT5Ma2xi+43gGQzGoNxbw1l+nq2UHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbhvh1GcsL6fpfYoonBPRC1IgpPQwB+6lddIbui0Lc4=;
 b=YA/7obFWBrjUINbkHdQlYmjOVdTNdMG+Hjxe63RR0gVBlN6hqGxZbxtBAI05tS86I46oJpYeYHDIDrSOhE61glOhn/0fZRs2/pk/0j/l3SfcB5NrRyZp+k9bTTzIDd4pt75acybwZUoVS+COGWwVzhtYVacWwDrvGL3iYDDojcqSMNiExMdhZOqPQXNnXPhZxaYwmdut9nxGImvv4SvJDXTEqd3lgkX6v5dgWQmxXWBY48GCviNG5xdaCE/Xa+Zov6WQAr7LiB62sSh4TD9jZN/O6kPGthnrT9tZ3mqWQoYl2q631EotFwOD2BLtH3hgOABNw7pjbrNcZ2Ilb0gTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbhvh1GcsL6fpfYoonBPRC1IgpPQwB+6lddIbui0Lc4=;
 b=yUOORizFUjREoPSHpmd7u4WLqiaxJoVhvZPPgry/fys7fLlWocmVGJ4/feVk6RjsBp10lfPTlydYzr7u4KWHR6GrlTl8bJjc3iEe10tfLJKQEfkFx2kdcmSPIfIT3yp58qLUpuTJTymeOOaFVditUb+MZQ8NbAGfAMCgxaCjRBFVrsx2DQVtvypJuirdFm+65p7HvO3vC6msTDaVFlb4WMRsZnyUzuUMBLNacNdPIBzLhmw1raRKNR2CzruLDJNxYT+/r6kOb9XG2QAOS1806he6DDmXc/LbUsSdLkTTYiDOVM1Qst6DvMwDlNExoC06PDnUH8ejrFnN2dkYhNK1xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
Date: Fri, 20 Oct 2023 08:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb3554a-8b54-41fa-7930-08dbd1364829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+AXgkQ3OK2x9m2zModMetkBRmlyX35tSY89GRFOCQIdxhun8pXg6egXbkPO5Ub4qfmt1RQVLaEX4UMaJZM+ELwIUwGH/1hnsgHmzQRJDlpifZPUu9OqPdMHRsmeqAz7fkUwrP9eC1gHl1JpKWYUoQ2jWtfQSlDfvZKmxvXE4hQLY/5QH3EQ2w+qK95PDmun7km+sxwMnNmY13qmOvSiHWaWeQsNmhxaxjF+68bl6MdqqfKz5A5h8FvBgiKvMCpK2wI1tmHxbRNU28AMrZbaIrMDj73JVAm3e6yLJ9AVydV6iMLmPPBk5xnn+dEXxyHXOTsqbMtryY9Xt/oTR3hVBun6SwReqg1/Hwj+mQU6DFDz9+iB2AybAtpbPgkSQSpjKZXOXW7EE0vtcZvW2UP+hO6VxnupEFmPfEOl120608UipYKQkPnDylph1A/8oGg5WpkphL3EC0ieHYakjwBi2KpuYFeO22oYVoS38gWtlGMmk1z4Lt+FgK8eqXTz50CQgywC1Tm+kN5f/MIw6HFeUprxoQYRmQFTwOuL3BsGW39uvEH0F2aMJZp6N/vIS4Qk5h46z00w/vu17uujm1r6ulC7qtDdmZBDcvhExR1uaVzqpJDH/vA/Uz/J35MJkDo5b/1/mLAevciFBdpRHPbDGyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(36756003)(2906002)(66899024)(4326008)(6916009)(316002)(66946007)(8936002)(54906003)(66476007)(66556008)(478600001)(6486002)(8676002)(5660300002)(31696002)(86362001)(38100700002)(7416002)(41300700001)(26005)(2616005)(6506007)(53546011)(83380400001)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckhpZmFNOStjeDJVTXE3dGVzSVlWem9WSWRVUjFUTTBUY3Q1TVFvVkppTFNE?=
 =?utf-8?B?YUlmbXJCZXQ0ejZOYmdMK09qdkdjeUJCd24zNTA4NG91OVFSaEhEa05SWW9a?=
 =?utf-8?B?WnhERjFBcXBXZngraDNSWHpZWGlMNWxPUk1vSDF0TDZSaUNFYnVjNmk4SEFv?=
 =?utf-8?B?ZTE4MFRtMGh0b2xoczdmQUt1Wno5cHJ6SXRmZUxQU0VFWTd3MFRWb1NGM0ln?=
 =?utf-8?B?QlJQTkVGSmFIU1RQYVhNeFRpaXlZV1kzR090ZmJldzVmVlY3TDBvNnd0SVVK?=
 =?utf-8?B?VE9GaUZxZTlaZ2hiUmdBMU1HTFBhZjNQMFhGOUE1V25neXBvTWpXLzBVSmFv?=
 =?utf-8?B?YlFoTjBmRFMwVnQveUdHN21IN1dSV1NMT1QyVmFVTHpWTnhJeXlTNUtWVThj?=
 =?utf-8?B?Y1lmWE9FWUttQTRGMEE2TnJrNzlzR093d2R4L09PQU1aSW9xbWVxcVJ1UGhk?=
 =?utf-8?B?L2hmOER1Vk5HOXBQQUVtR2JNUER0aHZac0pvMlJCVUMxa2Ivb0k5bGZ5c0Mx?=
 =?utf-8?B?U1NDd2psRnZDVG52b3llVFA1dU54TXJMVHdtd24wV0JMVmY2d3FMV0hzaGN1?=
 =?utf-8?B?WE9tTlhHbCtYK0JBZVY2d3Q4UkR4T0NaR0hLQkdmcnVoN0R5RmZLMG5iMy9Z?=
 =?utf-8?B?UnRrVmRkV01WZ2J2cGNpWkxrMWtKUGNRVW1va1FCRGl0ek9NY1Z1dFN5akVH?=
 =?utf-8?B?T3h5M2pUR0hiWFA0TC9CUHI3cnpxRnFwVEJmTlFXRUEvVG11WTlLbno4U1lD?=
 =?utf-8?B?SmtsM1Y5OWNZNUg2MzROUmxuUExPbldQM0licXBMdm9NVmtXdmN3Q1FqL3FJ?=
 =?utf-8?B?Z00vKzFmUTQzN2RlYzN0c2I2L0dKLzJ3UHMrOEltOGdpREgxNXNoSlZTelk5?=
 =?utf-8?B?QVJqM0hDNU5vbk1QaVd1TEgzTThWMmQ0eXk0d3YyQzZkTy9PaVZoZm5VQUx1?=
 =?utf-8?B?RzYwS3JLZXZNNklFcldlQW9iN2s3WFdoSzJ5UVp6WWkxdStoVGxiVDVYcDM0?=
 =?utf-8?B?Y24rcGt4Z3VuVjhRZU9VeFgyNmlHTjFDekNQbUIreFR1bU9HT05PQjhsSHlB?=
 =?utf-8?B?Y3hqYzJsS2QwYjRuZGE3NEVMb3h5YzJwcS9UUmhuaEpVRTlRd21lanhXb3g2?=
 =?utf-8?B?WCtOQVRsbVRpTFcxQzh4cUgzQWxCU2ZuR3hvQnZvY0JRSWZpOTBlUng3VkIy?=
 =?utf-8?B?eUFaT2ptUlM0MVBaaXJRMm9aQitkaE1TYkhzZE9XekVsSnFmRnFBM0NOTVB6?=
 =?utf-8?B?VkZ6a3cvd3hFclBxaUZxNlFOUlUwQW53R1NxWWZJYXRsczBUNURsL1RRdTlL?=
 =?utf-8?B?cFBHb1JxV1Vsa3kvbWVCVVVmV0ltZk5OL1U3T2RkMXNBdEFWMHRQS1pEOExB?=
 =?utf-8?B?UnpvcmYrU1JpQURHUW1LUGN1SWdIeS92VW5vK3R4NGFKd1h6dFgyRmI0ZTVG?=
 =?utf-8?B?Mkp3Y2xobTdNYk1EQVRVUEl4S2tjZ0FMYzU5Z2lMWHBVMVoyWjdNcVNyenRj?=
 =?utf-8?B?S0JQM1kxUHBqTWozSWFLOStUdG9zazVnbkZidk9ZaGs3ZC91eDQvUE1BbU9T?=
 =?utf-8?B?THNOcSttMlluS0lDRFJTd2hlUjYzUVh0TkRvaFBwbk1FUGlXbFJiODRaMkda?=
 =?utf-8?B?bTQ3cm4wWlJiY0ZxQUZIUnA1YnozbGhWQ2lJbzFuYk8ranhZN29nS1lFaEVk?=
 =?utf-8?B?ZEV4dHVFejhjTmpKTmpOcFpOcTE4S1p6WEVOdzVtbUlvc3BzTVJtazZoQzQ2?=
 =?utf-8?B?VjM2YVlybVpZQTRlR1dsZ0pVdTJMSlpFaVFpdVVyS0JuMHZKNTZzOGdPY3Bs?=
 =?utf-8?B?MDFjNGszWXZCN3pjMVcwVXdaUWJMSFo4eitwRkNkN2MrWXlCSmtod2V0bE1N?=
 =?utf-8?B?encrdmVrbTd5d3VzN3VxVU9Zczh3VnBJZlpUVWxqYzJGaVlOSEEwamxReEZG?=
 =?utf-8?B?dGpibThNNGwvNGhrbzM3R3M0aEVpWDVEU2R3QUFsS2tSZDgvczNHNjl3N05J?=
 =?utf-8?B?UVRTNEQ3dGtIRURtOGh2Zk9ldHpzK1MvQkRNYUpoSEtzTWdHVllQOVBpN0J3?=
 =?utf-8?B?c2h5VDNtdlpuUndReHhWWG1NVVpFUWhqME14czZhVXdqKzBQMGwzY1NVdFhH?=
 =?utf-8?Q?fz1pIuWy0vLKrvPFnjCB7BD4H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb3554a-8b54-41fa-7930-08dbd1364829
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:32:07.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg4fhZUPjq6yp9mx4pDfi3K7WufkF35+2n+YdZ1aH9ePrxQ9B9z7ovgSfDDqzvRxef8jzQ7nbXcuolmpkOy96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9416

On 19.10.2023 18:19, Stefano Stabellini wrote:
> On Thu, 19 Oct 2023, Jan Beulich wrote:
>> On 19.10.2023 02:44, Stefano Stabellini wrote:
>>> On Wed, 18 Oct 2023, Jan Beulich wrote:
>>>> On 18.10.2023 02:48, Stefano Stabellini wrote:
>>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
>>>>>>> If it is not a MISRA requirement, then I think we should go for the path
>>>>>>> of least resistance and try to make the smallest amount of changes
>>>>>>> overall, which seems to be:
>>>>>>
>>>>>> ... "least resistance" won't gain us much, as hardly any guards don't
>>>>>> start with an underscore.
>>>>>>
>>>>>>> - for xen/include/blah.h, __BLAH_H__
>>>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
>>>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
>>>>>>
>>>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
>>>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
>>>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
>>>>>>
>>>>>> The primary question though is (imo) how to deal with private headers,
>>>>>> such that the risk of name collisions is as small as possible.
>>>>>
>>>>> Looking at concrete examples under xen/include/xen:
>>>>> xen/include/xen/mm.h __XEN_MM_H__
>>>>> xen/include/xen/dm.h __XEN_DM_H__
>>>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
>>>>>
>>>>> So I think we should do for consistency:
>>>>> xen/include/xen/blah.h __XEN_BLAH_H__
>>>>>
>>>>> Even if we know the leading underscore are undesirable, in this case I
>>>>> would prefer consistency.
>>>>
>>>> I'm kind of okay with that. FTAOD - here and below you mean to make this
>>>> one explicit first exception from the "no new leading underscores" goal,
>>>> for newly added headers?
>>>
>>> Yes. The reason is for consistency with the existing header files.
>>>
>>>
>>>>> On the other hand looking at ARM examples:
>>>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
>>>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
>>>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
>>>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
>>>>>
>>>>> And also looking at x86 examples:
>>>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
>>>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
>>>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
>>>>>
>>>>> Thet are very inconsistent.
>>>>>
>>>>>
>>>>> So for ARM and X86 headers I think we are free to pick anything we want,
>>>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
>>>>> me.
>>>>
>>>> To be honest, I'd prefer a global underlying pattern, i.e. if common
>>>> headers are "fine" to use leading underscores for guards, arch header
>>>> should, too.
>>>
>>> I am OK with that too. We could go with:
>>> __ASM_ARM_BLAH_H__
>>> __ASM_X86_BLAH_H__
>>>
>>> I used "ASM" to make it easier to differentiate with the private headers
>>> below. Also the version without "ASM" would work but it would only
>>> differ with the private headers in terms of leading underscores. I
>>> thought that also having "ASM" would help readability and help avoid
>>> confusion.
>>>
>>>
>>>>> For private headers such as:
>>>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
>>>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
>>>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
>>>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
>>>>>
>>>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
>>>>> ARCH_X86_BLAH_H for new headers.
>>>>
>>>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
>>>> guard names. If we continue to use double-underscore prefixed names
>>>> in common and arch headers, why don't we demand no leading underscores
>>>> and no path-derived prefixes in private headers? That'll avoid any
>>>> collisions between the two groups.
>>>
>>> OK, so for private headers:
>>>
>>> ARM_BLAH_H
>>> X86_BLAH_H
>>>
>>> What that work for you?
>>
>> What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
>> differently, how would you see e.g. common/decompress.h's guard named?
> 
> I meant that:
> 
> xen/arch/arm/blah.h would use ARM_BLAH_H
> xen/arch/x86/blah.h would use X86_BLAH_H
> 
> You have a good question on something like xen/common/decompress.h and
> xen/common/event_channel.h.  What do you think about:
> 
> COMMON_BLAH_H, so specifically COMMON_DECOMPRESS_H
> 
> otherwise:
> 
> XEN_BLAH_H, so specifically XEN_DECOMPRESS_H
> 
> I prefer COMMON_BLAH_H but I think both versions are OK.

IOW you disagree with my earlier "... and no path-derived prefixes",
and you prefer e.g. DRIVERS_PASSTHROUGH_VTD_DMAR_H as a consequence?
FTAOD my earlier suggestion was simply based on the observation that
the deeper the location of a header in the tree, the more unwieldy
its guard name would end up being if path prefixes were to be used.

Jan

