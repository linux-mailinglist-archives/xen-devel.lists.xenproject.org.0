Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2EE78D631
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592933.925785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLPy-0004xR-9x; Wed, 30 Aug 2023 13:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592933.925785; Wed, 30 Aug 2023 13:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLPy-0004uX-6i; Wed, 30 Aug 2023 13:39:34 +0000
Received: by outflank-mailman (input) for mailman id 592933;
 Wed, 30 Aug 2023 13:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLPw-0004uR-TS
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:39:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6168ae7-473a-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:39:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7616.eurprd04.prod.outlook.com (2603:10a6:102:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:39:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:39:29 +0000
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
X-Inumbo-ID: a6168ae7-473a-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBoFZQLMeX9YNHBF9QS8k+qdMSzvU1wYl8lk5hq6g7vKiTYz+prQyIoL+2dAJFTRW09imi+y/sw/DAG3v5poc1jKIBWauWTstJw9aeUootAiZahEE25jFg/X+8rcEEePTQ5G1arp90/jcsPdhu3HrU6DuXDqLyq+IhvrPmrFdA5UK4TdOGx1gVsqI8O69SMTYD0GeahxM6Le5y6QR5rkuaK6Ux/pykf48+OydIE5s6Af3ypjShCG5GTtvfy0tm2YE0lFTGauANvuBYP7h3/TePc+OY/B1FkKUACtNaACql4/tlaj2VUDjVrzqys3z9/KQAzWgwPXBIHPTvBWtX9Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxmbDvjP2IqKzShEYTaU6xJ4vnqR7msYrcR7iePKWlE=;
 b=HF6P/+KdZ6JMb6JePlFZwFWkpUb66BoNiKMOxDVuTVIlBTYq8toPO7rahW3MY7KDPqAgvsnVrOXm1ycBu9PzwWKfjMrs4mDGQo/RVp+2ZNhhiByLo0lFSJOV2gAVr0dxFYy4o6c7bpBrX0mKjZwvM/hPHELgwCsWC0SgQFmCUsDReT8mBvFsBv6DZHVi21aEOVgcrMneB8BQ0/+r+9EpzId1ZjxFElwOz+eU1CL7NdmK3AaqH1RGlkeRtKlkPKY+Rt9JADLvDuHUt3RXj9jsNLz5h7RvUrXMk1GUyrSHmumZpt9I2ebu8WFZo8T91ByTgo1LK2VBPjPf2R0QbUJb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxmbDvjP2IqKzShEYTaU6xJ4vnqR7msYrcR7iePKWlE=;
 b=mYj4Al+B7fe3SXjTRPsJOlFnYSwrHeqz90Wz+wA8z4DUpJy94jAaDlHwtcpSMphxom/81dqVp9ahrXlas9ZnrmUryHbrD20kRYRdYQq24nTSgeK5jIiw4qthOurjUp7xVnDAZ3K5+1UZyeQsnibTmyFSvSfZ1i3AbilEUJr//0aOUwMWWYvv2zNyy9O5En8nmqSlY5MGH7lvqB23v3/5oVw8j414pzHdKROjZtcUNn7XeLX3wqyZ6b6mek3qpi5yWMXyg2PanLxqK2SpBwMIDP3jkJW0na1KwRyxw91rOZnq+oVxTyLqNC7BJviuyEwwjPplNI6+XHBIROqWYGQ3sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <badc045a-c16b-659e-ab3a-37830d1cb3d4@suse.com>
Date: Wed, 30 Aug 2023 15:39:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Content-Language: en-US
To: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 406af62c-7a1e-4698-8230-08dba95e88e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iHrR08EbCPKfo4kcXRE01pPQ/f3tAv/wp4cctdGsx5ij0v91E9Y28ekrWfreBKcW/rZeawbnpFBaGX0rWuJLhotnAsu0tpXu5DMpchQ3ipj9ZTeoOTaexl1/tlkldLHowfUnAC5uy8ANaNGqUOxCgFKBoPICsOaV2sK1sMk10OroKpD+ZxYyUK75L2xsyfntMC0veeGswBa284X/1MVX4z6qZE634WjYT1E9OoYhWtG+oq6bK9AWkXssouTqlnVS5K76VJIiUTG0HL1pAim+HNp7+W2Expt4nNshc7n653F5RxwAP0UNfl4Ozj8NqILetQrHg90WcPQw5626dJMwi6qseF9XQkyk7vwubjOfj9ARY7Xr1X7cWL4EelezpKCgCJcRTdNxMmcHKaQD2B01uleNMO/tg/OLEJX3RUM0ooHTsE1lZ/FRMFEWcCpJoxLucE3KvsvAKWM/nhkgw3hpb0JIZVO8skwqNrHhiAiPqWL0g/T9ot2meDQr4HJY3OntWDcmnGWsGQHZ3iNq7TtqsLE5+CloG9rKpHWC+VbPwTlwft4GaqA/uZjmsuk2b3WncuQDg1hBD33CJVjjpG9tcm62Mhubyfur1B3MfFk5wahy4caDBXRZbtgEI03ssKejO5s0TA1N3FqIONNhyp+OlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39860400002)(1800799009)(451199024)(186009)(36756003)(31686004)(110136005)(83380400001)(26005)(86362001)(31696002)(7416002)(41300700001)(5660300002)(53546011)(4326008)(8936002)(8676002)(6666004)(6486002)(6506007)(2616005)(6512007)(478600001)(2906002)(38100700002)(54906003)(66946007)(66476007)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnUyNWlOMXFycmhJVHVITURTa2NYTHBJWmprNklUNUhuSWhqUHY5a2U1QnFh?=
 =?utf-8?B?Y001cVJVS3prb1BnMkVVT3NILzNZVGJlWGJBNk54bkpkQWRvak1ic2N2NDlQ?=
 =?utf-8?B?cXBXYzdJN0x1VGt0c2tqQXZwT0MzOVc1c3JiWEN5dkorM2hudnFsTW8wdFVr?=
 =?utf-8?B?SkswT3BRSkNubGMvMUZQZUcyNmhyMm91RHA5aE9HKy9Uc3ZJL3dJNFVuYlVq?=
 =?utf-8?B?UDBpMUx5Rlg3dXNhRWlkSGJOVCtDd1cvamdTNVhoOWRIZ2RWTDV5UW8vTWc4?=
 =?utf-8?B?alNZT1pEWWZpTGNScTROY2V6TnlIcWVJTGdNOENPcWRYOE1UTzBaeDNHRTdJ?=
 =?utf-8?B?QjJWQTFNaERPbDNKOFNyOWlrbk94elNrdXM2WTF5RldDSFZSekFNTG9TSGxO?=
 =?utf-8?B?Y0Z2N2Y2RENDNURIbTljRjJCbFoxK0FwKzljTkVnemdPMmdJVGI1SEYrUHph?=
 =?utf-8?B?bW82S1RlWEUzTmt2ZUVzeFJsU1R4VjBiYk92NGhaYjlTZitUV2d6dkd3Slk1?=
 =?utf-8?B?amozVWswcTROSWQzMmE2QW5keGdUcy95Z2F1Y2daQmJBMGthVCtrRGkreE11?=
 =?utf-8?B?RHFNdlMrTTU0VFczUUN4OTl6dVhvVk5TUVA0aGVYTWthTUhJdjI1MUI1Z1Nx?=
 =?utf-8?B?YWg3SzV4am5TM0FyWFdYNCtOZmU4dGhmWGdRYkpYZ1VPL3RMK3F0TlE1bU15?=
 =?utf-8?B?TUEzNnRJcU5xbjdMbHVxamJOUHh2blhvMVp6SWJUMkRHZWRjZXpVZ2VTbWNF?=
 =?utf-8?B?cFdtc1lRTUNGZWQyM3lwam95RjFMbEpZT25jRHNXdUp6UUhQWjFaZENQUVZW?=
 =?utf-8?B?bjhUUDZISkFzWFlwN0dIb1pObHpkZGV0akJZMW4xRFpBa0tOOWszQ3dhL1NB?=
 =?utf-8?B?Q0xXeS9LRS9vcldCQXEyNWMrdWZYWEN4dWRZYjRmMmlMdVd0eDN2QWNxRVNo?=
 =?utf-8?B?eXBSMnlZWnZPVGJadHpkSTNrRy9TOTlFRHIyVEN6cFZ0YTRobzVkU2RmT0Ro?=
 =?utf-8?B?WEhqLzZKOFBNQk9IWnc1YXNZZzJvVEplakVyWmQ4emphdUZPVlkvNDAycjBS?=
 =?utf-8?B?TGhObWpMMDhHbVY0U1pRU2RYWjUrWTc2MHFDNlZXaUl4blFXbW53bzB2YVQ0?=
 =?utf-8?B?clQweVl3OTFwZWptQkZBQzRocFhVZzRjOTVFNFd4WC9zbWFaMUhTaW9Nanhw?=
 =?utf-8?B?Y3I3K0JESDZqVnY4emNHdW9qMjg2VXlpVlRSYU95cHUveTFpaGFNRDlZV3pT?=
 =?utf-8?B?Nkc0dkd1Rm02Q21vRTF6L2ljVWY0N2N5bERDMzJ3OVJDeDM2cDZBejFOM3Zx?=
 =?utf-8?B?TnBVZmRhd3o0aHpxUUN4b0kycWZPM0pIOENSMTFxNzJyWGNySFFpSXJJc2xY?=
 =?utf-8?B?UHdpbVZzS1A2d0g3SzRSVTN5MmUxNnBRcGJIVGJIYXhCckZGWm5NSFdKc2ZF?=
 =?utf-8?B?SmsyZ2tyWEdnanIwM2RKK21kWFJjVlBXcVlzYUFTTjQrSkoyQ242ZCtwcmxo?=
 =?utf-8?B?c2M3RkdHWTVlMGwvSHF6VS9rd3lWNzBma0pGRWtyVGU0MVFwVWM3b1ZEZDF2?=
 =?utf-8?B?ODZPdWpPRTZoUGsxczZ0cHVlT2pCODd2eWszM2g0Z3Z4c2RtOVBEUlFjMzNu?=
 =?utf-8?B?Z3ZueTZhMTV4V2lkUEoycnVMQ2lxdVhEK0JDZWVRT0NOL1FMbVhyNExweXhs?=
 =?utf-8?B?RlFXbDdrKzg5SmEzKzZDM3RPRFByZWVBSHRDSVp1c2lSSEpkcHlFcTRjdlRy?=
 =?utf-8?B?MmFZeVk3Y0JRTmovSXpXeHhRWTJPMGlTZTR1QUdQYXg1Vm9kMHdvVzFQc0pW?=
 =?utf-8?B?cVRZWUFtczV2dzc4TUN3S0MxTHVXUzZOakRQUlFicGZ4bXdVcmF1aUdxU1V5?=
 =?utf-8?B?L082VXU4YlpyWmZBTHIyVjl3aVo5NDhHdHRzdk9vS001SVZNbVlRVEMzNk9W?=
 =?utf-8?B?UlMraG13a1JpRWR3S1VmQm9MN1FxYkFobTBsa2tZZk1hcnRUeUFpeTdWTzFH?=
 =?utf-8?B?L3ZZOVdRNkZiaXhBWm1YLzVjNWJzN1dXcit1bkY5UVBNLytuTXRrTmJUZjZ5?=
 =?utf-8?B?Q2VZS0pOaHVLRmFMSGloYlZBOXUyT0R6YW8zYUNaQ2pYVmxkTkprRFZ1RGFp?=
 =?utf-8?Q?wXXk6TvSyiQfMVu8ljKZWzQSf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406af62c-7a1e-4698-8230-08dba95e88e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:39:29.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arVPUYUHB1o0QtR2ibjeEkA3tQGSOwer5fDrk15W0S9GNJDjemECjM6P+uPXrkQ9cOtcZgWTflzD5KoPwuc0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7616

On 24.08.2023 17:26, Jinoh Kang wrote:
> @@ -62,9 +63,16 @@ void pv_inject_event(const struct x86_event *event)
>              error_code |= PFEC_user_mode;
>  
>          trace_pv_page_fault(event->cr2, error_code);
> -    }
> -    else
> +        break;
> +
> +    case X86_EXC_DB:
> +        curr->arch.dr6 |= event->pending_dbg;
> +        /* Fallthrough */

I guess I have another question here, perhaps more to Andrew: How come
this is just an OR? Not only with some of the bits having inverted sense
and earlier logic being ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1989,17 +1989,17 @@ void do_debug(struct cpu_user_regs *regs)
>          return;
>      }
>  
> -    /* Save debug status register where guest OS can peek at it */
> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);

... an OR and an AND, but also with ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -78,7 +78,10 @@ struct x86_event {
>      uint8_t       type;         /* X86_EVENTTYPE_* */
>      uint8_t       insn_len;     /* Instruction length */
>      int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
> -    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
> +    union {
> +        unsigned long cr2;         /* #PF */
> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */

... the comment here saying "positive polarity", which I understand
to mean that inverted bits need inverting by the consumer of this
field. If this is solely because none of the inverted bits are
supported for PV, then I guess this wants a comment at the use site
(not the least because it would need adjusting as soon as one such
would become supported).

Jan

