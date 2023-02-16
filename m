Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0376997F0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496596.767422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfdk-0000b6-Sq; Thu, 16 Feb 2023 14:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496596.767422; Thu, 16 Feb 2023 14:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfdk-0000Yp-OS; Thu, 16 Feb 2023 14:53:40 +0000
Received: by outflank-mailman (input) for mailman id 496596;
 Thu, 16 Feb 2023 14:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSfdj-0000YQ-FG
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:53:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12b7ef2-ae09-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 15:53:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:53:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:53:35 +0000
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
X-Inumbo-ID: b12b7ef2-ae09-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbDl79AugHjKy5Kz5RtykojN0LA7JSzRRTk/XU3Knnf3SA8CLPkb0KAozb8jd6B9otnzY+Emmuk1yZlePPZSeJD+M2vG2E9jzdQn46qjAC8/lnyfUxhKvoLD8ztaWLsbSak5ea1fsR2lLIvAQ2gvpu+3pEXBGcQu0LFA1nVysLJzjNBTdglVIVRdZ1ywB2NW+Y2NfjtPEADvaHcj4vtiV+Sh/5RoJbeCJsMKuAPy8CzleR5NYVERdOAZ4NL4ko6tWJkWnhmF7kQlw3+9XiX7CjtUaOkrQEM4LJ6FakWK8Rxghu4hT+BzCdGUhfQ9Jjj8WUpEkKptPme0b4VYvH1LMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDs2O3VVhyh85GlUhnqv5pwjP1qkQcmxOEnS2XD9Ny4=;
 b=Kz8OYpv3KlR1WPfC+WJ0+iDd/6os/wuGYb6chjzIqgjowml0cH+frLrqrE+Y597VIVRb7KoJyVvhotJFxlT8QzI6ye7OkTBD/P33H0D+v3k6PAUMjldDRqmEtrkOElQ/bMw3b/P+4ILnstCRS8QIAkPZaecrh8mNybMMJ4A1bGM5tOZk5J7Bp3F0HGqoM0tta3jiA0+0d8EHPbovwTol4P5Rma+MPdDgTHc1DNyD30IfUchnvbleSvDSDvv+a+Fyk3G/2UyS8igNQZqNdkwZI8ajTta2hYJQTchwmUncAnEgz8N+05PjMrU2jvEqnWt7afblzwKV9oq9Ib73jWEMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDs2O3VVhyh85GlUhnqv5pwjP1qkQcmxOEnS2XD9Ny4=;
 b=JLn7xrwa2tj1/YPev2TStv0BY7RqwEoj3zFtihxYV7Xy19NmZBojuhZrPFRig7rr3y6nJU43VYfHVllDXTjpnulWyv0YoQbJfH0+1OikmBFWD4hunt9mwAhBPkNrh9ciOCZuCA3EaYO23XD228qJ5AMAv82i5EX6CBpPY9bEOPbvm73dHSl0Ww9RvBDx/3SeSB+tghe/o9KXfUcIbYA+LkEicfxhk6vnuI0W4mknFOuuhDoarn001i2dRJ/8a2Jk90IQd6xOLklQ+YSPnNQf4GBszoMnHYbVwt3UFyDIAvdNUUy+D83H+7lZWRxMjpaZIxsD213ZvrfjIX9fpYAK2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b6ee39f-debf-dbdc-5f09-9fc0444070a2@suse.com>
Date: Thu, 16 Feb 2023 15:53:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
 <068340c3-2a2f-4bd0-20e9-f1dd6fe4bc2b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <068340c3-2a2f-4bd0-20e9-f1dd6fe4bc2b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 9743e613-f741-47a0-fb27-08db102d94a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zz+Ump6nbHVP38DTwGfX1lmjekqDZM9qgPS2sg6RjfMANQyTZ2Ds4uahuecDuI3EguOssPfhj9rH6TydwCFH+XjNsjsP4e5MGK9HP9ny3x5PwJ2K1HYK2PVSReFKdlmk5us9iP6H7xCq03htOzRQBnDJZFcxeXQSjsBtCNOMz8Le9DsoMLgql//8WrIlBa2nhK0GvJ6BLLs6Deg1F4KPAGl+aSmcTammqy8f67Vr9nDLTx1YjyAN7MCBFuXWi98XCldrm8Pi2+4pBboiaQyJjJpWYhSdgVyyEL11XyKantRlzBsUmTs/Yfn3uRJ2+YV87Pt2sL1XQnmmYTthVcSWAfJQT6USBu+ro9B+hYo6U/nBz8Jb8vvSNF3KfAFBvRHq4/04c+jth1oBy6QWRLpqGfnhCAVhtrL8sSRryQ6VT7M0DfC2aWxMcFNo2FqrpjahSqDAO4nH743VtGm2+dAvestS0/9BSkHRiAWl1/rcwHthGuxp9ZHtpvoV9kvB0fD0P66vBwkRvttXBakB+ftjbJ2h4P7js9Uz56kK/yRj3AhBYaBmgxRXoY+I/iqQgY5SNLuRltlZOPvQFLyxIY4AYCej9zdtrzO8r6n3W4w6NY5pYh1P003kE+p1pl/moQ5r3k9Xtr0LF/8CSMmZ2bgZAFNsEX7KQDcSwAK8z9Sq8FTbe0sLGT9WJcYnvEeFydv1VjL3ltKI7kWJU27biz+jHB9PA7VziPor6RrwGJTgnLNwIO7ND4XEf4uOlhdkaAfu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199018)(66946007)(316002)(53546011)(66556008)(41300700001)(26005)(186003)(6506007)(6512007)(66476007)(54906003)(8936002)(5660300002)(6916009)(4326008)(8676002)(31686004)(6486002)(478600001)(36756003)(2616005)(31696002)(2906002)(86362001)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGtDNlBkMFhiV1JMenB5YXZJc1RtOVVIWWtJbjRNTkYzYnF4clNlTEZsc0FM?=
 =?utf-8?B?TTZVT0xJYmxzVlZrYW9vTisyQUU3R2pXcERqNzRPSWdFTFRuOW9mSGNBWEFz?=
 =?utf-8?B?MFNaYnZOeGtUeUs4QUh6dFBnVXRBbGMyeERIdU5VcEUzQUJuOTNScnJsb0oy?=
 =?utf-8?B?WjllWVloWGdGdGcxOFRlbFFYZWRCTy9ENnpuOU1oLzdqcXBMcDBvNTFvc3Qy?=
 =?utf-8?B?WGcySnpRSlZ5aTRGQW5VUSt5cWtUL1hhdUFJMnJPeHVCdFFCUGdxdFJoQkVL?=
 =?utf-8?B?MTg4eDRzTWMvcXdoR1I5ZGNZcG5iNHczdnBSOUFhbUFlUE9rdmplbWtPMkhi?=
 =?utf-8?B?M042MVh0Z011L3FIWkY2Vm00NU5EYVczQytjWnVGTmJBanRYMWhsMXB3S3RI?=
 =?utf-8?B?bExtMVF1S09jSVhwWFI1QktmWDY1MWJvc3lYL01oVmRiMyttNzEwblQ1T1BB?=
 =?utf-8?B?UXA0MnpqTndzcVJicDd0MDcwNU1HWjBjUGVUQldrZXRUVUZsZ2R5SWIzTUVP?=
 =?utf-8?B?c0JYN0ZxSC90dUNYT1NlYkQreTJHcU81RXpLQXJMZ1hwTjhrcjBwZ3BQTmh4?=
 =?utf-8?B?OHZYeExGOG1HZjI2d2R5RTZsUk9oZi9YUklkOEFOVzFXazNvWUZDc1haaVFD?=
 =?utf-8?B?MGxmVTFEcjJEZkZGT0pkQy9iQ29DQjVJcVpnYjlBc3ZiRUJ2a2VPVURwcGdv?=
 =?utf-8?B?MEtUQ2xGTFRKNlp2UVhHSzdMSGgvbGc4cFA0MnhPWXhsZjRqN21yUU1FS1dS?=
 =?utf-8?B?bFVHd0VmVlQvK2g5eVRERE8xanFrNTdqczdWZHNsZ0UyYWMwZXRHRUNKTTJ4?=
 =?utf-8?B?anJWbmswODFFZ1dOZ1VxUHRVbmhKY0pFemk3bVdCV2kvUjF3c0VtQVdRR0M4?=
 =?utf-8?B?TmZEa1FLbzF3UjlKMmFpSTNINmhoOGQ4VS9OV0hHK0w5dHQ4cElDV1dldDRC?=
 =?utf-8?B?YmNIdXRUSGlVSlBWbWJ6bGNHcW56ZmQ5M2hHVGt1Rk0xeGRPL0JYUWFJSGZr?=
 =?utf-8?B?Q2l4THFMZzhwa1p6eDdVMmpNeFFjempNdlkxa0ZSYUZBdDNFaWtqcWxaS3Ni?=
 =?utf-8?B?Y0NUV0RYUjJ4L0hXL3JBdlYvN1I5UG5kTTRXNjdSeThVVFJoTm00VkZvcnFC?=
 =?utf-8?B?RmZ6NGp6djRZbFJQcStBZzdTbTJIbFdPODRzRkRyWTBxTUlBdDkzajZsa2t5?=
 =?utf-8?B?Mkp2cGNlRWllUzNjQU9kRGZGb0VVZUhaWjZmeVBuWmt0UFJ5dzg5RFhRZFRa?=
 =?utf-8?B?Nlc3bFEyMW9KQmZhNThSV252RUdkL0JHUnMzd3NWU21YNUh2Y3dRNEM0ZnlS?=
 =?utf-8?B?Ui9lSlFqS0lNTTROakxualJOOU9UbDJZbGF0RllZL0xQdFZNdkVOUENuMDFi?=
 =?utf-8?B?bnpHL1g1S2oxUk9IUEFvSCtoYzRqYUhXWi9hZUxXcEVZNy9lbmFpaForS2pj?=
 =?utf-8?B?M3o4UGpyaUdVNHQ3TktJeTBOZDV0Z3BMUDI3SWNlT0daQ1hBbnBaNEVCRkJN?=
 =?utf-8?B?OHUrcEpTVmNwVnNVMmx1UlVDRnhGckp1NEI4aHEvMGtlZXBhaHh0RlkrdjJV?=
 =?utf-8?B?VTBFa0lnd2VmeVFuSGtMNUR6aUJaUktQMjZUQnpNZTkrZTVKeVZHdW50djNG?=
 =?utf-8?B?ZldudndYMnRReWx4REVCZ1c3MGdLdlRhK2ZlcEZzUUEyWXB4eEI1UkdpaGk4?=
 =?utf-8?B?SlN2c3VMOUtwRDh1VlRVbVc5MkVRVXNkN1M2RWxvakY3MEk0K2V4NThoL290?=
 =?utf-8?B?NEZ5WDlzbTFiQ1VMaWR1Q1V0M01SSjg3TnRSUnNUcVlYbVFTbEo1a3ZvU1RI?=
 =?utf-8?B?VDU2dlNINUNFbGZlWXJGc1pRbC9vT2VNSTNKUFRxY1huZ1J6aDY3U2ttcysy?=
 =?utf-8?B?V1MrUjgvZk5vYlpqSlhNZklLZWtVdlpvYStnY09OYzJnK0w2U1NydXd1Szl0?=
 =?utf-8?B?SUFDU1V6NkNMbzdGaEozVlg5OFd2NGZrdGVhMGlVQTA5TEhsaHZHbitkWnhk?=
 =?utf-8?B?VUxJMDY2Q1NIemRQdWMxNmFReTNKTGd2Y09xUnE0RWQrTlUvOERBUFhXcnow?=
 =?utf-8?B?NGZoSzVFZCt1d0JoNTlDUjM4M2creW4zcWFGdXFPaGFGWFBvUFFJbVR4Z2Fz?=
 =?utf-8?Q?zxxOQRcSopd6OUKzyqEp7b2Bg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9743e613-f741-47a0-fb27-08db102d94a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:53:35.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi0eEZdNFMAhfIQGcxZ2wnOIye4gbTqxmUMv4O9Ga5Vjc9ht2VTAgzjwWF9OBGCQh+ISWHtwt5ShV1DHB+Otsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

On 16.02.2023 11:48, Andrew Cooper wrote:
> On 16/02/2023 7:31 am, Jan Beulich wrote:
>> On 15.02.2023 18:59, Oleksii wrote:
>>> Hello Jan and community,
>>>
>>> I experimented and switched RISC-V to x86 implementation. All that I
>>> changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT. Other
>>> things are the same as for x86.
>>>
>>> For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT will
>>> look like:
>>>
>>> #define _ASM_BUGFRAME_TEXT(second_frame) \
>>>     ".Lbug%=: ebreak\n"   
>>>     ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
>>>     ".p2align 2\n"
>>>     ".Lfrm%=:\n"
>>>     ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"
>>>     ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"
>>>     ".if " #second_frame "\n"
>>>     ".long 0, %[bf_msg] - .Lfrm%=\n"
>>>     ".endif\n"
>>>     ".popsection\n"
>> I expect this could be further abstracted such that only the actual
>> instruction is arch-specific.
>>
>>> The only thing I am worried about is:
>>>
>>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>>>   [bf_type] "i" (type), ...
>>> because as I understand it can be an issue with 'i' modifier in case of
>>> PIE. I am not sure that Xen enables PIE somewhere but still...
>>> If it is not an issue then we can use x86 implementation as a generic
>>> one.
>> "i" is not generally an issue with PIE, it only is when the value is the
>> address of a symbol. Here "type" is a constant in all cases. (Or else
>> how would you express an immediate operand of an instruction in an
>> asm()?)
> 
> At a guess, the problem isn't type.  It's the line number, which ends up
> in a relocation.

Why would that be a problem? If there's a relocation in the first place
(not because of the line number, but because of the other part of the
expression), then it would only alter the addend of that relocation.

Jan

