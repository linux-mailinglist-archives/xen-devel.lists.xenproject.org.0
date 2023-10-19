Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020C7CF06F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618907.963203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMsM-0000Vm-LO; Thu, 19 Oct 2023 06:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618907.963203; Thu, 19 Oct 2023 06:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMsM-0000SZ-Hk; Thu, 19 Oct 2023 06:51:22 +0000
Received: by outflank-mailman (input) for mailman id 618907;
 Thu, 19 Oct 2023 06:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMsK-0008HG-5c
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:51:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8084c36-6e4b-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 08:51:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:51:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:51:16 +0000
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
X-Inumbo-ID: e8084c36-6e4b-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWmKUR/sm9I1z2zOOmO279E1vIJdDGA0ooLifOldxsZqPyNjoEP//4cs0ZAGf5YKogZeQQmaXQzzG9hwipub/pId+H3UFXrYqt0ynCc7Sm4nwNLwxBBsA5Lx2jggDSjoe3EUFQ6AHjiQQ698hQdeWczTin5VZWa+JtA2P1f5sA9z/iABh5hhRZydxSzBVC5O0l8YjE4IL0WlsIy5h8PLqHR2wX0/HdVLnt+kVH/LcbNs2XUwCG4muhlkmKIeO3LXNUx0RtHRzEhrIdIJkZKUw8DwWqUIZnCaqm92IOzJUHIEccmQH9rpD2yOCE9s3eEk7G95RcWFSGUuN/fphzMjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M77kAykSluPJeB0j8DujzaPjPARTR3AtbcxL54JzOds=;
 b=AX++vIoQqt2vFpinBr+VVpLERf9wiB5pmEmK+Hl24bQfMKYd2chzFKGeit3w33zyuoamuRdxLSJsajO9PUmtc3FgR+d/Dkwq9AjmIEdMmuQVsEEIzsiLRCTFiNZDSoAq3UbaSVgdKLzh8jAE4h7C3lCEMLgAD8PeCulEZMZWHT2XIIN7i6Ke4eSMnYGiP8i3nCPSWnDU6qAyygVkXB0ZMCTswEEBPGm0oxczJ2Vkig3RgS21f8GMBs/w/tiKgq+TGyNJ4P0+NoXAXhBUVjFe2Fz8dj/RjHXXQR31jdRYfKhspPbuW5WXoeCFWQYpAGHaA2qf3ma4D89SeCkDqACriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M77kAykSluPJeB0j8DujzaPjPARTR3AtbcxL54JzOds=;
 b=PFJnmFZiIEfMIAkPWQdCcz+NQncfHCh6mk4c0TgZYH5OpW8AbSTctcW/L+FHruiDAzpOq0rpzCzDBjukUvSUBGueYGDBkL8kbVEzWuXjR5Q+WSUgG99aB+ZN5fKGqyO3szJFmSYg+GSYs/mSAHtpgxQOMD4XbH7BTKUQqekZUGXRxhohWZaDI2qwItL++DPjn77ck5x3jSwM80ZY7dFU1XD94Am0dtMpOndXarXxSE/JdmndJBWrfkerQztDqBtPWVP31Up0VwmTBQ8r3hCZ8jz4r/cU4IIv0keIJgv9ounW77xLyKKUpt1pmd4Hg/RDosz5Op0AwHX9tM0lrEERdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
Date: Thu, 19 Oct 2023 08:51:13 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c44723-e2d6-4c85-49fc-08dbd06fcaac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8K5bi+SOFp2XSh/74+nIDaF5T7xs7kFSJZyGzVp8rD7zJQbC/CZKeA7vRzkmHmw9mbs2Imq5MeLJAD5ulJzLEbhG/E4ToSiS552IBHzFsknmys/epcHSMukqfAqky6bqsDovjXTQ7zj3TYygWo8gQxhRfAZweXN7iUo7rTyDZpTmiMOWt7QVeJYAFRQtLUh2qFjNHrMFvSlgo18WXe+K01fjDqNfxiRolPW0c6cVDZZKxugfC34aNdHirnToXvaDL4yD+V1pV2+20AERc9InzO6eWRQ3bf8qqmYOHXdBbkvjnUd5hLTkm04QG3Co53kp9bOTiYElt+SaxnXgUbhIA2okD359tGNqRSvYD3gINOJgul1S2lRI1EX8hhDjtBPFB68mONfUS3TZmhXMaqvakWIvGoiPdVDDzKa53FQ2YoxUYEMWG/mEM20J3LpYGkN8jmQbALDkjyEKlL38GexEU5PewDuY0ssHbBtWBdyyHpsPWxXWuVXb/iF9pJKDdvmwEnR088qxkpIlIgAnWE27dglSQt3nS+/82/DwkTg7jGyJBZwu3fTsQ6+PneQT1hhKb6Qa+z5AkERrQba624uR5PZ9OE/s/YowpwOmShnYkQhxqK52qABu4tWml/9/SfxjK5ToIVHbzQFy8wOJlfir7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(86362001)(31696002)(478600001)(26005)(6486002)(53546011)(2616005)(6512007)(8676002)(8936002)(4326008)(5660300002)(2906002)(7416002)(6666004)(6916009)(66476007)(316002)(66899024)(41300700001)(36756003)(54906003)(83380400001)(66556008)(66946007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkVZUE9HdnFGR3BLR3Ewa29IN3UxbXIrZ04vNG56d0Q5YmtJRkRGZDEvZDR4?=
 =?utf-8?B?STkva0tsdUtpem4zVHhuU1ZaWkdXOVEwRmFWZGFwWk9vN1o1S013OUhTZmhw?=
 =?utf-8?B?Y1RuQ2lVUmJqcmRFZ05Ia1lWbnlnWmIzaEd4c2FWYTdzcHhOQVBIYXJ5K1pR?=
 =?utf-8?B?T2l2KzMvcGlTVGJGUEVtU2NBUjFNUnVwVFhqc2Qyang4RFJ3T3FVMXd1M0li?=
 =?utf-8?B?RUdNK1ppd2FvT1hHeFdkSjBwQUhmcURWVE5JYTZJbTEyMk5KYzJ6SWdITFl2?=
 =?utf-8?B?SFRROHU2V210eEJZTm16dVQvdm05b0F6dEI5QkE0MHdiNkIzVGc2VDJTRTV3?=
 =?utf-8?B?MllZcUQxOStlOTMzM0NIQnlQNHdwUEt5bDZUK0NWTWFYMGl2Vllxdnlsamtu?=
 =?utf-8?B?Zi92NlpZd0xkVDRmNDZBUDdSaWpTUmh3NlJaVnljVWE2ZkRNZ0YzWHBEci9w?=
 =?utf-8?B?QUY2Q29Fd3I4dE1IYW9nSVFMK1N6ZTdnYWMvaHZHdGpnT2ltS0pEdXUyaU9i?=
 =?utf-8?B?MGpzbjVGSktpdENIM1h0Q3c5Z0E0L0NUblJqUjkreHc0V3FPRlV2dGRxTkh6?=
 =?utf-8?B?L0pYRTU4WFNGRll3NkhwK0VrbVlzQnplRDZZcmFudm5ST1VWMlZTTDh5UCtW?=
 =?utf-8?B?NVpVbkRuYThFN0lXNnRNS3c3U2dHMkdSbXozYnFhUjZPTE5TQmZKZzBpTTJy?=
 =?utf-8?B?cWd3bHRCK1FGRDVSemdDMmY5OGRSUi82Uis5aFhYSmZPcVZlWkl6VmRXZmgz?=
 =?utf-8?B?TjV3dkV5Mzc4TmhCSEVTbnNWalpxMXVOUml5QnY1eTNOVzR5VHNQYkNBd2Y3?=
 =?utf-8?B?aitDQWtvMmRlbmFyamJnU0RadWE4bHZIRUlZMno0TWhNNnQ1aG1YM1R0ajI4?=
 =?utf-8?B?cFk0NWkzaFlpbWdMOG95d2ZCTTVyV1lZY0p3NUZGVnU1N1B1OHQ5SG1LY3BS?=
 =?utf-8?B?bzllRVl4NnA2bFhFd2E0VnRaM3JPTEVibFl5OXdQU01LSy9DV0R6YkgydUZP?=
 =?utf-8?B?VXVNSlEzQUFzay9HNDRGdXlpQkVMUjVXa21BcUJjcmVDMCtVZUdrcnVUVURH?=
 =?utf-8?B?bjU0YjY1Mk1xU0JHekkxWUsveG5SMkhpeFFjWlJMOEpVNHFjLzVQT1J0cGFq?=
 =?utf-8?B?K0JHenJZVExDREJNd3RQZ2tPRUVCbHpDQitUTTNONVJhNUZJYnFkdjRlVkR2?=
 =?utf-8?B?K3drL0ZMbHdCbzU3eFhRUm40M3VlR2lZcXpIdmJaQmRFM1FoT01mN0RFSmdE?=
 =?utf-8?B?cmRaenhFQXljZ0IrUjBVdEZnOVlLQ29KQjdXM0dWelhJWmRrOUcwN3djN2h1?=
 =?utf-8?B?OU93NG1xMEY2eXNkWDBtMmY5ZHM0NDFPRXNuUlhOb3dXVEpmSFVjN0NPc3FL?=
 =?utf-8?B?RFl5UUFvNEtSeVNjWkJpMTZCSndyTVM2cDNpTFEzVVBKMjIyeDF1S2ZuYWRt?=
 =?utf-8?B?QXZFd1FoaGM3VVdJcEk0ZXhHY080VjVRVmRaeDZTaFB6S2R4VXJaNmUwRk5t?=
 =?utf-8?B?SDA4RlpxWGxWK3FsS2V2YlI5VnV4M1FzWGk2a2llU3B6WHNrL1M4QWtVRVBX?=
 =?utf-8?B?ekdSS0Q5YzhCUndnTEJoUlcyb3pwN0hveTdZSzhodmpNTTBXR2hTZGlvTkI5?=
 =?utf-8?B?UU10ZDBXYTd2bkZYc3A5SzZseEtTOVJQaHFIWHpNeUFBakVZaEFxWDVRUmw1?=
 =?utf-8?B?M3V0MG81WWxseE9MMXo3RlVOeWtkc2JyT0txRlNjLzNJSk5iRmtSb0RST0hG?=
 =?utf-8?B?bDU4MkF2d1ZuVTRKNUxYMHltbWdLckNMVEN2UktXWmhieXorTWxvRy9KcXl4?=
 =?utf-8?B?NHlKcWlSWE1Tb2RXME1IdlVhRXh2M1NESmdiOGF0blhNbWN6aDBMc2wzaTh3?=
 =?utf-8?B?WGNWeGswNzh3SHk2NHpuelhOQzk3WVczVVEyUUJzTnRuTDJHUG9rYXRSUG9y?=
 =?utf-8?B?TmZoT0hTdml2LzYyWEcvc0c1eHBTWlJMMWh5bFpPdHdqblAwT01HUkIrYzVG?=
 =?utf-8?B?cTJ2VjY1OHRmeVUwNkVkVTk1YkloSlJsWGM4QTBGN0trc1NIU1BXTll3VURN?=
 =?utf-8?B?eEtSN1ZwNlUwVXVxdFZNSDRyZ201Z0lKdXYvQ3MvckZCazBxRVlreWwwcDRk?=
 =?utf-8?Q?e9lFYiEIi++7wdInUjJ3ukL2C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c44723-e2d6-4c85-49fc-08dbd06fcaac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:51:16.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYXVae416RizMerhGdWyvvmP8uGp/RXtambyjjtUWfPQoHE6fN4uNmif+IXBTewCu9EKx3bckyliTdSVoYqCaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 19.10.2023 02:44, Stefano Stabellini wrote:
> On Wed, 18 Oct 2023, Jan Beulich wrote:
>> On 18.10.2023 02:48, Stefano Stabellini wrote:
>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
>>>>> If it is not a MISRA requirement, then I think we should go for the path
>>>>> of least resistance and try to make the smallest amount of changes
>>>>> overall, which seems to be:
>>>>
>>>> ... "least resistance" won't gain us much, as hardly any guards don't
>>>> start with an underscore.
>>>>
>>>>> - for xen/include/blah.h, __BLAH_H__
>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
>>>>
>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
>>>>
>>>> The primary question though is (imo) how to deal with private headers,
>>>> such that the risk of name collisions is as small as possible.
>>>
>>> Looking at concrete examples under xen/include/xen:
>>> xen/include/xen/mm.h __XEN_MM_H__
>>> xen/include/xen/dm.h __XEN_DM_H__
>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
>>>
>>> So I think we should do for consistency:
>>> xen/include/xen/blah.h __XEN_BLAH_H__
>>>
>>> Even if we know the leading underscore are undesirable, in this case I
>>> would prefer consistency.
>>
>> I'm kind of okay with that. FTAOD - here and below you mean to make this
>> one explicit first exception from the "no new leading underscores" goal,
>> for newly added headers?
> 
> Yes. The reason is for consistency with the existing header files.
> 
> 
>>> On the other hand looking at ARM examples:
>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
>>>
>>> And also looking at x86 examples:
>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
>>>
>>> Thet are very inconsistent.
>>>
>>>
>>> So for ARM and X86 headers I think we are free to pick anything we want,
>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
>>> me.
>>
>> To be honest, I'd prefer a global underlying pattern, i.e. if common
>> headers are "fine" to use leading underscores for guards, arch header
>> should, too.
> 
> I am OK with that too. We could go with:
> __ASM_ARM_BLAH_H__
> __ASM_X86_BLAH_H__
> 
> I used "ASM" to make it easier to differentiate with the private headers
> below. Also the version without "ASM" would work but it would only
> differ with the private headers in terms of leading underscores. I
> thought that also having "ASM" would help readability and help avoid
> confusion.
> 
> 
>>> For private headers such as:
>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
>>>
>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
>>> ARCH_X86_BLAH_H for new headers.
>>
>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
>> guard names. If we continue to use double-underscore prefixed names
>> in common and arch headers, why don't we demand no leading underscores
>> and no path-derived prefixes in private headers? That'll avoid any
>> collisions between the two groups.
> 
> OK, so for private headers:
> 
> ARM_BLAH_H
> X86_BLAH_H
> 
> What that work for you?

What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
differently, how would you see e.g. common/decompress.h's guard named?

Jan

