Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E122557D079
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 18:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372888.604916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYav-0006oE-DQ; Thu, 21 Jul 2022 16:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372888.604916; Thu, 21 Jul 2022 16:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYav-0006kp-9a; Thu, 21 Jul 2022 16:00:09 +0000
Received: by outflank-mailman (input) for mailman id 372888;
 Thu, 21 Jul 2022 16:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oEYat-0006g0-Gw
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 16:00:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe24e8d-090e-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 18:00:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3240.eurprd04.prod.outlook.com (2603:10a6:6:11::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 16:00:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 16:00:03 +0000
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
X-Inumbo-ID: 2fe24e8d-090e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHFVlhi3Rjh1UahnHcT53JzO+aeZIQvlCYL7JUaeaaOfYd7O8idP/zwv4g3Hlw25krOEPjkh9Bz94PQeQaYSfc+TlhDmrgtvHiQvVhLI8Etb2vQOi0Fo2p0mZvP5TDn4Us/S0hV2iPW43Yci50vjHBbvOz5CADvXl0g2Z7vn1cEYhSeuRHJUemBsD3QP+CMPdb2JH1vGAzs/C+zWQU5tCtU5dxXHpojxxByq/O03fSMsMLSv+dQdQufjNJF6W2Lk+nX/p+Io7hNnq4KaybPy9GsrgqxWj07rKjjPISYSQs+v9lDm04D/ztZ9V2xmt4EMwNCIwTpTHcV49qBPSz5Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8W33qQcDznwUN2tLVyPbU4Juq2m810L8rzEfP7XtZQ=;
 b=ZLEQlqgwalVnb+dQ6p74pCjL0St4ZwD+U/H+o8bHk1i3vT9HLeeYQPJnYsauXnmrS44kgYDoIIkPpm8F5Q/L2xs/gekBrXJEI7lU9Rw1/76ks/cbRmrhdmayQo9N5Cyr7lox7mxOG31sI5cy8XDGQXlvsfZ8v6NV6D15ObfK5YZIL9zuIYUdeLK0rqfi8tiBaNroL+2U2Rc+0wDArte/YqfewNOmpSLP7J2TFczPCunVdtUlnLZqja5OWdp74uthW/CpxJSjUzzyhHrjif6eg2ZY8QogmYxdTLB2n2Uxs+JuLiq1T0ZKIf3GX9oVhWwezvXZ00kD7XeosgUoRHWxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8W33qQcDznwUN2tLVyPbU4Juq2m810L8rzEfP7XtZQ=;
 b=kx8snZcIXi3K1P+Bqba9rfsf1L1mbJAY3Mg5Xirf10JtfTqpYVCWZAL6lTr+A31IPD1w+JnGdzf8XEogPOmPhhkO4dbtwY6cG5SafpmcZBWK9D4z8F9BPEg+H0tUoUUhTkPCRNwbDc7LsB0S1lduPilIPa4ZLyUSHGkh/CGg2bHHX8n+YEJB05zqX+ZxaHCgRJHEGnlB+Y6YND89AKl47WByzRfggLFRrPXK049P6Cp4CUxdYVrExjXe1MSO2njQ0MxfpJ903SLvcjoftbo1hWf7XP5k4U3KXFIb+Pp/LNwpyVvu8t8Dm+FBdRF1pBJrTxa06jPwaim+MwOP0+G2FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b70ef714-a097-3039-b4d8-706bc9cf1c51@suse.com>
Date: Thu, 21 Jul 2022 18:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
 <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d017f9-359f-44ad-5b6e-08da6b3212cc
X-MS-TrafficTypeDiagnostic: DB6PR04MB3240:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D3Di22wQhMlnDiirkvZPGLgYMzPxr21tFEtuKstGfgwZ778RBJizJX3S5q3Ttp0H9t00YPMY0FqKDg4OCGv1Uz3vdNjdP24UIvZBZOGocvr3I13ms+sD4aNI6f49itNfhrNgyR00MUgqlkc0ojLx3T/BoA7aqbbA/GkPv5WsEQ9IX2zRTt/QmabDVY7jjo/YdVsaMaYDUzXzF5Zu8lGZnjsZHpKv8hTV3NocAXnREsl115usyiVN2sU/Dz5sBtCe8PZgirNkNSoeYZ7+0xokc8Y176WGZjToC6hZAGEMz2KceFwmxZ/G79iNMsaSM91wHofbYCsjzyThquUDh9quERVGIwg0lyCdmGz5/DZm81dfRq8atwXF0HKj5wVQ1b/LrXrqjzgtS8z2SSJIDikTwW0FuLYelnZLrwCQ8WsqhJDzFfINFxDduK0fcqL0bszBrCC8TWyCclb2KWy1tD/IcRPnPUjzxEuIKK3EbVoj1gyykw8bTjpMH9HZ2YB4T0ZbduDFvn4UzS4LcHW5oAIZjWx2M1H3EZFuLMDidRc3ppCVhmp4WleKmsFXW2hNpm55Ja6D5Jph3SCC0UKyVLzjJP58DiSbew//KDn9i3tcscXg2cBUep8jEm28+I29RlFAJg5hYZY5UzZYa3r7NRU9PNclVY2y0nr06BdxOnNVASysb0NoOW72mMBLqVy2TUcOyVbZ3rvFhrl8+7vx7sNYX7mpOPNiVc+/X04V7k6QBoLJRySP50A4nVy+7e/HnFOsfxr1SdIpX2lU35qB92qy2YoEGo1XNIDgfBnIO11SkbH8Yna6gzzzIVX0pt0qJZ1Z/T436WWFBOVnRNxLLrWkhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(316002)(6512007)(2906002)(5660300002)(8936002)(54906003)(186003)(7416002)(6916009)(8676002)(4326008)(66556008)(38100700002)(53546011)(31696002)(6486002)(66476007)(86362001)(6506007)(2616005)(83380400001)(41300700001)(31686004)(36756003)(66946007)(478600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZQUjRYc2l2MUt1QnVrS1hqVGVqRStpbTIxVUE0dXB2MXdzZStUdnMxRy9n?=
 =?utf-8?B?VzJHaU1tcGxWYkM2ajdPZTdRdld0UjNQZ29jVVBkS2REbE04aUpwbUZGMG43?=
 =?utf-8?B?eU5XajZ2TXVDc0QvNjk2dG5SdHpRUXhJVlRyV2diZVRhMGV2b090WWt6ZFVL?=
 =?utf-8?B?aUdTSHBzYnNsNDBWUW5xNzd4eG03SzJKVE1Lazg0ZWNYTGp6NVlubUhBUEQw?=
 =?utf-8?B?QkRTMUFnenI1Ym9lWHFPWis0aHd0NkwrWkp1bzhCdDN4aXNEMmVISjR3MGMx?=
 =?utf-8?B?QW83MWR6bVd4ZkdpMEtxL0EwOSt5ejlob0I5ejY5RE9lTUVZdEtIY1VqVzVO?=
 =?utf-8?B?bkFwa3IySVdRS1Z1Z2t1QjRPVU1CVStJTTRZK2lSMEtVM1cxdkJXZGNlN0J0?=
 =?utf-8?B?T0Y0Q21sQjZlVFBjOEFVNjJkL2xOeWRET3VuNG9TdVJ4OU13NnUzdW5uTFV6?=
 =?utf-8?B?ZjQ1WVhQUDF1cnVodndJcXhvR3dWa0paWTRmS1p1Y0dWeTcyUHFSQTNnUk1T?=
 =?utf-8?B?Y055alhIMlEvWTRTQjdpM256SDdjbWFMeEpqYlR0MjQ0ZWR4SUNIb2dBNGJm?=
 =?utf-8?B?SGpLSW9iUVFmZ04yanNSY1krM1JIQnBwMVRDTTFBUUxpdXQrSGZxQmwwQUlW?=
 =?utf-8?B?eHZpaEZrcDc3RzFWbnpESmxwSFhKcVd1OVhqRnpKKy9vNHhPT1VHMlN1U2ph?=
 =?utf-8?B?LzJ6L3dvbEM3ME9wT0dQS2pEZlFNQllRRm8yNVlnWWcveGd3V3lHdWR1dVVx?=
 =?utf-8?B?TG1UY1c0a0I0V2o1VEVEQkh5angzRk5XL0pjbzVpejIxT29sQXJlbDM4d0FC?=
 =?utf-8?B?NkplNTIvcmdvUHhTYzNidXNwUSttTXp3aG84dEljM01XMHZuZEdYbVBLS0lS?=
 =?utf-8?B?TWttRlF6ejNteDJvTlRjdUhaQm1VN29uSzFNem80TkJsYk9ZbjdyZ1p1MGlC?=
 =?utf-8?B?dWRJZzBvVXJYTFZzcHNPYVMxdGM5NmhsM1gzTUhVdjlYSUtSN0t5Z3MvTnhU?=
 =?utf-8?B?VzB1djN0UkVzaTBCcWVXMTJiOVpvQU13V25jSFhLWWM4YkEwZUVVMUxFblRm?=
 =?utf-8?B?NlZqQ2VUdklDR1ErQTNHYkNYM2pibmlzcXVsazhVN3ZZMkxDNzVPbjF0dXJG?=
 =?utf-8?B?R3ZnNkFBQlFwSEN4SlFpMmNDOUZTdVJjeEY3bUdpYlQzN1lYVEtHcUZ0WXVk?=
 =?utf-8?B?WDQ4aTBKNVpaTDZvcytGUWdWbW4yaWpXMlNBcW5pNmJsRXd3eHRjLzB0MzJj?=
 =?utf-8?B?VlAzeHhiTGVkT1B5d1lteE9XL0ttVmdZRlNnQk5RTTZETWpMZ2hpS0xhOFZr?=
 =?utf-8?B?S0xvc1VUYWxwNEdmemxlWFhVZDduUlhWbHd0Nm1WR0RZaVc3Um5rUCtWZ1pa?=
 =?utf-8?B?Sk0xVlg3NEhKYlZoSGJ0eTZnZlo4RUJxbkx2alBjZ2NYVHdQZklpdEdaaFIy?=
 =?utf-8?B?RkhGTXN3NkNoOG11ck5Xa3FmRjkrR24wdFJneitwcWJ1T1hxY3ZtcFF3NVcw?=
 =?utf-8?B?aXRXYVplUnBUUVo3dTNPMEs2YUJNMmxQK21KaFphdlZUSEg0NXgvcmxSY2hu?=
 =?utf-8?B?Qk5kVlQ2aWVLTVFXN25HZU5uaU4yMDEySUt6RDVTV2pVODF3SmFwZGJjY0Nn?=
 =?utf-8?B?S0RpakhPQkgyQVY2dnRkbm5ROXF3Q2MxRUZxdGZnU2ZTVHA2WlJ1Zm9nTXlW?=
 =?utf-8?B?NG4yTmw4ajduTHpmdW5zR2hSQ3NNZ1djWkhDWTJhdkxCK3pmbFg4YUFqV0R6?=
 =?utf-8?B?Z0tnaEp6V1RKSVdlYllwQm90TmhVQ1BJYVZFejhQbEJlTkYwOThzdUlaa3dp?=
 =?utf-8?B?eUZFdGJGaU5lN0VBS0ZaV3prSUwrNDY5Qi8zUTU1ZEFmT3FhOTFFN3o5NEJw?=
 =?utf-8?B?amF2cVQ1UGpNWk5naTBzb0hvWG9rQ295cjVYbHFxYWx5WUFGdkVrNXJQYXo3?=
 =?utf-8?B?eENlL05sRXlEaTNxdHh4em9ZL3QveUdVV2Q4c1krRXgyb09ES0JLSWRsWXBS?=
 =?utf-8?B?WlV2ZVVWQ25FTnFIN3V0R1V5MGtYdEIwdUFPN01Pa1hyZ3luZ3dPRDlNYWRU?=
 =?utf-8?B?V1dZRUtmdDBLbHB0YjJZRVVFdXZXNkxxOWUrWGN4YmRKRks4TC9PdTVpM3RO?=
 =?utf-8?Q?GQh/O6iDJ4EcTQXwTy0ENqfYR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d017f9-359f-44ad-5b6e-08da6b3212cc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 16:00:03.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heMDtYanorfkCHRum8Q4+iajItP70xmoiY/+Mn15aSXmdAcz51qnUlUkwO1Dy1Nlks83Hmfqahz9XpRmFcN8ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3240

On 21.07.2022 16:28, Daniel P. Smith wrote:
> On 7/19/22 09:11, Jan Beulich wrote:
>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>>> @@ -0,0 +1,48 @@
>>> +#ifndef __ARCH_X86_BOOTINFO_H__
>>> +#define __ARCH_X86_BOOTINFO_H__
>>> +
>>> +/* unused for x86 */
>>> +struct arch_bootstring { };
>>> +
>>> +struct __packed arch_bootmodule {
>>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
>>
>> Such macro expansions need parenthesizing.
> 
> Ack.
> 
>>> +    uint32_t flags;
>>> +    uint32_t headroom;
>>> +};
>>
>> Since you're not following any external spec, on top of what Julien
>> said about the __packed attribute I'd also like to point out that
>> in many cases here there's no need to use fixed-width types.
> 
> Oh, I forgot to mention that in the reply to Julien. Yes, the __packed
> is needed to correctly cross the 32bit to 64bit bridge from the x86
> bootstrap in patch 4.

I'm afraid I don't follow you here. I did briefly look at patch 4 (but
that really also falls in the "wants to be split" category), but I
can't see why a purely internally used struct may need packing. I'd
appreciate if you could expand on that.

>>> +struct __packed arch_boot_info {
>>> +    uint32_t flags;
>>> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
>>> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
>>> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
>>> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
>>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
>>> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
>>> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
>>> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
>>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
>>> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
>>> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
>>> +
>>> +    bool xen_guest;
>>
>> As the example of this, with just the header files being introduced
>> here it is not really possible to figure what these fields are to
>> be used for and hence whether they're legitimately represented here.
> 
> I can add a comment to clarify these are a mirror of the multiboot
> flags. These were mirrored to allow the multiboot flags to be direct
> copied and eased the replacement locations where an mb flag is checked.

Multiboot flags? The context here is the "xen_guest" field.

Jan

