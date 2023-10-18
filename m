Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04E7CD3BB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 07:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618413.962031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qszZn-0007dR-Dy; Wed, 18 Oct 2023 05:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618413.962031; Wed, 18 Oct 2023 05:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qszZn-0007bH-Au; Wed, 18 Oct 2023 05:58:39 +0000
Received: by outflank-mailman (input) for mailman id 618413;
 Wed, 18 Oct 2023 05:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qszZl-0007bB-VC
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 05:58:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fde51cb-6d7b-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 07:58:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 05:58:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 05:58:32 +0000
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
X-Inumbo-ID: 5fde51cb-6d7b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ro+7UKfPhsDyA8zKi1Jz0aJ0C57KyvhZjqXNUIolJp5FzT7vHEdv4VMTZtZmPOMqdM6Oshm53A87c3SzSZKEiX/A6CqHp3aWy91bAY9PPhNITzR3FozNbgCmkUftOMRVs3VIT6VYJN3803DnL09d4Tj2VwWvDuj4IjdWu+ZV88cRwFpVlVBpiSMppDTJVYQBTO2x/VqrPJnrc9szjUxhInncK0J6BiD3niW7lh0P9XevUZd27XHJ7BI2ZonS41NIjTmrElMITt6Dy+lurXQG5nRColnOhgEtg5gjJuAcPudUAqIdHFq2k5CW3CZiBLmjMp3ToOZ/aGgsMpln39dC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6kLCulIez2CqVLFtlG4fGwKRZnzVFd960y7NDTJI60=;
 b=LW/URzE4IjX/rOZph1S+tULUDSiGuskqLCPuQyWA0skYf8fwuzUyIMeR0lTCuyK1h4LMXv7kdS7iGRcoPvnYWp8kzGrcA0ixD+lUzUESpdbtN0MChYLmcw3ZA/xz57sqd2f4CoONmItArgPQYMYlWnbhlK2wfy2GFVDTZGKgy/OqnK1kMzU4YvztAUGZxlXptfl4kXh9JLyIqHlOD/cf8LrPPSRYt+rUfMgcMauezllV8WmJSHTQYONnl3iHJOiW+REdsZjMecbSqPIEeQ6UkNS+WKT8//6Yh8l/FnXtoLr008fPBsHhfMMhqZ4HlFcdNtpb7zhG2510jC6ehblXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6kLCulIez2CqVLFtlG4fGwKRZnzVFd960y7NDTJI60=;
 b=t+f1jeO8AvcCsdan7kU5y5Kw5G9EpRDcY0xno28q1oj1enI+WFcYrOdBASORJY0kaHa3/S0ukOE6Mfwb4/YW0Aq6KZ388YJYnmkFv/6EZ2vR5AII3rJIgfpaSqWzIx+RPgpLNB8xRC1sdOrC2453ury5dpOH7A6fVKTvs96w+xoIUqEzxJuSF9kJia1037H7ALcSk0/BZxT5wc/Xa+/3/rRmqYYozegfAlNM8rFTFbJKSvw3OHU4koxkeqW/p7/hCoEv/c/EdbqcVdbulrkjevPPn5RD6HtluXBckioaJz+qymDRohrxOgqojUn9dRFZI49fI7QJLGuA3XfTEGwH/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
Date: Wed, 18 Oct 2023 07:58:30 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8354bec3-f3ec-48db-7a06-08dbcf9f4237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3lQMYoHxwsrrh4rHYQsBwaQorHwmUlaHHRVaZAQ2r0/FVrAged2Kk/ssAJJ3qPd2LT04TQ+Vyb4TcJRGoM2y7sNz8LCwRcO4tqC9WRd3FASB8sjjF0ABQrvNtjm2Jzs7UW99dpzccj6YrwQEJFiOlmi03ll9ImgyXXC5EoZ0B4NKwWFDSWCff+Q1/G5Qdrk6zR3agziCmZ/mM1I6ty1pUbCgU61nszfwpgC1kKTeO9OB5Uzf3cKpnGxN306AZ2yywBic3tig9SALepnn7QZM3jC6CL2hmKRYkElIywL3Cq88GEQoAKsITG/epWGqju7nXfLuk19btrdWebagWYSP4D7zVU31PDcEsOqmUOTMdN48xSMVg8dQDGuLEPzU8jgcw3JMDVocNhIXnUNVHIXh4ltw8y+vyo7oaL9Aouh1JAPBwdvNbHTsDayniAd+qDFjrb/b5UySKj4Lj7fXstIcMxsBOv6ED67O46gKDENYHTzdZQtHnUGue9/fgEKbABJYAPwZ8aNfZl8B6OYAyF7Eo7cM4ibBZdIFTijfyH4prh6qeHiSlUWea8UTjMPdi8xTjxCs24ctiNvSidso1PaBasdPTNYsh1h8kIVYOftubo4wTEqj3OIocdAFjvrvPWm7zWl4BiIx0svWYXFvDAACpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(86362001)(31696002)(36756003)(66899024)(41300700001)(5660300002)(6486002)(66946007)(316002)(54906003)(66476007)(66556008)(6916009)(38100700002)(31686004)(6512007)(53546011)(2616005)(26005)(6506007)(83380400001)(8936002)(4326008)(7416002)(2906002)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHVFekNsT1VxbDZOZXljWTAwb2J6dVBBK0FKNnZQczVETUNsUlAyVk5XM0hZ?=
 =?utf-8?B?cXlVRFpuRXNRTjFsWE1wMnRFTEliVWRGdHBLUGJyZUhaQlNhTDkySENVYmpa?=
 =?utf-8?B?YUdIS3ovdVBZODFNZ3ArOUM5dHp4OEFMSUthQ1oxNTJQdjBBb04rZ1JKRG4w?=
 =?utf-8?B?ZGVKbjZocVI4YWZ5a1Nhc2szRjR2V0J1dENFZEQ0MmlPdEVLVXFZVTVLcVgx?=
 =?utf-8?B?NmxxM2VOTXF4azg2U3R5YmwxcnVrcCtKV2tkTVplVEh2OTFqbGRLR3NyQ1Fu?=
 =?utf-8?B?b2UxMlBlTjIxOVAxSlJuQkRoMVhCSmtiMytjR2FhMUc4RU4yTUhtNGk1L2NK?=
 =?utf-8?B?eXQyY1dsNWxDamNUL2E2VkJDMlR6WGdMZFc0Vyt6elRjQ1RvZnErbDdKQmFz?=
 =?utf-8?B?a2kwMzh0UktzQ0QvNHNsV1hId0x4NENmYTk2WUpCU3U3b3lEOWhrRldoRjRL?=
 =?utf-8?B?M0ZQaWlqUmR5S0hRVS90aEZZSnFCdFl4ckVGQno2cWRHRG43YUdCSE9qRzNP?=
 =?utf-8?B?MHI4NGFHc0owemxmV2VEaE5wcXl0KytFSytKSWVyREhFQitKZmUrdVU5aHZQ?=
 =?utf-8?B?b3RFZGpjcGRDcjJaZENKclp0QVY0cktoZzQxV2hpYTJzYnZQMDR6RVZzSjVj?=
 =?utf-8?B?ajhYaldrZE1wcWVFUDROam1Bd2gyM0hkUGdiNGtzODhPTnV4eVl0V2xzakFN?=
 =?utf-8?B?dENWYXVOaWw5cjNLeHVIWWZmM01hUkdXTGtCdTVEVWZtVHMwWjgwUnVHdGQw?=
 =?utf-8?B?V2t4MjVjS2szYmszSUxERXAxbm5tRVZaYWsxU2txUjAzNHhQTmlWZFJlWlRw?=
 =?utf-8?B?UElUaTFES3V6amZzNlpaK3ZEMUtMaGhLYUIzVlloQUhFZ3Uwd0Jqem1aeFlo?=
 =?utf-8?B?bkZpNUlNWHlXSlBDaFFPWXJkNFdWd3hzRkNHNU9PTUtCSitpRVFDcnc3bWls?=
 =?utf-8?B?dXBrdmo2QlVxeGdVSlhtUjEyYXdZRG10VE9pVVZWd1I3dHUwNkVXNUhrUER2?=
 =?utf-8?B?cnRmeVdBM1Y1TDhXNjFyWmlCWmxHTFMxY2t5MWVaekpyelZ6WGNnU1pPVHhN?=
 =?utf-8?B?SUpLY3Q1cnd2VnFpZVQvT1kyYnY0VWlsR3RRSlVkdmQ2WnMxQVkvYURHQXZV?=
 =?utf-8?B?aEZzbDRsTVBsNG9nVUR0Wm1JSmM5UWlHTnd6V00zYkcyTW5xeWJNT21BM0Q1?=
 =?utf-8?B?bUdhNWZBTGdxSW5YZkkwV05oVXduSDVCN2ZnZnk1SFRYYjJvUHFtQW5ibUJw?=
 =?utf-8?B?cEt0bHJBaVE2UVM2L2VHOVkwV29XTjBmSG5oeFU1LzVJeHdBbEFwQkxSYTlR?=
 =?utf-8?B?cXA2bHkxU21kU1ZFMEI4Y1IxUDRmOVhNd1EwblIvUndzQmN6MHlnK2VJQnNC?=
 =?utf-8?B?SnhReHZRektrVmY4OHdQQXNqWWJyb1ppNHlrMmltSVBSOTdaVXZiMXplK2dm?=
 =?utf-8?B?YmJNRytOV1NrbVpISktOb0dHREM3KzNQckdoeS8wTEhtMER0cnhUSjBEREkz?=
 =?utf-8?B?QldqQ1hPaFRNMm4rY21XNy9TZzZlM0NBK1B6b1FHSWIrbnE5d3hjUzJQODZX?=
 =?utf-8?B?OFFDRU9VY2puYjlDZDlUZzA2bHBYTjF3eHk4THhNZGRUTmV4TEFtRm1EK2Nh?=
 =?utf-8?B?bjVyRFdjazB2Z2U0c0EweU5DdjlUVWowQnRiVE9La3M2eGJHeXl0OXhzTXIw?=
 =?utf-8?B?c2RHeGFUNDNBU1AybXNybzVySlZJR2RsN3NNQjZtT1JTYmpsaCtiUDViUy9S?=
 =?utf-8?B?ZVJtR2MxOUd2OVZHSTFvSEU2bW82RFFWK2Zyd0M0dFRtR2FnQ0FzWUt1VjNR?=
 =?utf-8?B?Y0hmclhrdDlDQStxZnczRDNQamJOTHFUNWVZbU41NkdraHRzMUdSSjFWK3V1?=
 =?utf-8?B?UXk0Ylk2Vzh0RlpjSjlkVkowQkJOZysrUmRvZlhQV3p6ejBUVWZsRTFjWkM5?=
 =?utf-8?B?ZFhHUjRmbEFubDdoZ2FSYUpIeHYycnZUK3BEMVh5c0R0czg3TVlXcFl0R2xm?=
 =?utf-8?B?ZlpmUCtmOXFkNFFsWjkyM0RPNTZVNHVYcHVoQm1YRGVwQ3dYeWhuanZQRlBw?=
 =?utf-8?B?OEFlaE5BT09ZdWQySGlocmlsUjZWelBSb0R6OVhVc0tWMTY5YUU0b3ZHQ1c0?=
 =?utf-8?Q?JZD/Z5P1f2nYNodPad8nAlQX+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8354bec3-f3ec-48db-7a06-08dbcf9f4237
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 05:58:32.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxmhbnKWqoIKAVjuSzjSynZn7keK5IzP1DKd4PDAoBBKSfmIIzM01TFWGgz1ayW3kH0HZvamZeTWLcC1hvs/gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On 18.10.2023 02:48, Stefano Stabellini wrote:
> On Mon, 16 Oct 2023, Jan Beulich wrote:
>> On 29.09.2023 00:24, Stefano Stabellini wrote:
>>> If it is not a MISRA requirement, then I think we should go for the path
>>> of least resistance and try to make the smallest amount of changes
>>> overall, which seems to be:
>>
>> ... "least resistance" won't gain us much, as hardly any guards don't
>> start with an underscore.
>>
>>> - for xen/include/blah.h, __BLAH_H__
>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
>>
>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
>> we could go with just ARM_BLAH_H and X86_BLAH_H?
>>
>> The primary question though is (imo) how to deal with private headers,
>> such that the risk of name collisions is as small as possible.
> 
> Looking at concrete examples under xen/include/xen:
> xen/include/xen/mm.h __XEN_MM_H__
> xen/include/xen/dm.h __XEN_DM_H__
> xen/include/xen/hypfs.h __XEN_HYPFS_H__
> 
> So I think we should do for consistency:
> xen/include/xen/blah.h __XEN_BLAH_H__
> 
> Even if we know the leading underscore are undesirable, in this case I
> would prefer consistency.

I'm kind of okay with that. FTAOD - here and below you mean to make this
one explicit first exception from the "no new leading underscores" goal,
for newly added headers?

> On the other hand looking at ARM examples:
> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
> xen/arch/arm/include/asm/io.h _ASM_IO_H
> 
> And also looking at x86 examples:
> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
> xen/arch/x86/include/asm/io.h _ASM_IO_H
> 
> Thet are very inconsistent.
> 
> 
> So for ARM and X86 headers I think we are free to pick anything we want,
> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
> me.

To be honest, I'd prefer a global underlying pattern, i.e. if common
headers are "fine" to use leading underscores for guards, arch header
should, too.

> For private headers such as:
> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
> 
> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
> ARCH_X86_BLAH_H for new headers.

I'm afraid I don't like this, as deeper paths would lead to unwieldy
guard names. If we continue to use double-underscore prefixed names
in common and arch headers, why don't we demand no leading underscores
and no path-derived prefixes in private headers? That'll avoid any
collisions between the two groups.

Jan

