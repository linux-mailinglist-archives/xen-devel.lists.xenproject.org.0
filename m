Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32676E420E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521816.810718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJsX-0002YR-A1; Mon, 17 Apr 2023 08:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521816.810718; Mon, 17 Apr 2023 08:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJsX-0002WN-76; Mon, 17 Apr 2023 08:06:25 +0000
Received: by outflank-mailman (input) for mailman id 521816;
 Mon, 17 Apr 2023 08:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poJsV-0002WH-OZ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:06:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2051.outbound.protection.outlook.com [40.107.6.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb97601-dcf6-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 10:06:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB10055.eurprd04.prod.outlook.com (2603:10a6:102:380::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 08:05:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:05:51 +0000
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
X-Inumbo-ID: bcb97601-dcf6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEvsNM3CCIiOpxaes4zA9P3dGeExGNJv2llEGfU5Dpl+vHgPnYAj1lk43SSpK4CFkswvEGT1hk7Pv/rCclCVWIbm9yPqa0IMrqHeO73a+DksxOWjRvMLkRQusSB7iSTWCPuUCBTS1h/wDEUUqxNDb6t18ib0C1WSukcB0VXzdv6Emo+XmURByJ4BFQ1JC4RDWNm4wuZH1M+qerMEaoWriGtrNiAf6IbRYNMMzWl9KXcBjg2Sg00tj6Uws1zqfo5BSwKShA4w7vSKR0gX9+exTP4zfKgL/bLRIqOnmrljymSx1JT7+dTYP1G+kfw8YA/qZbJ4+xa/YrF1H7+th6VSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/X4BUZEw9PGWHmf8kbHNWsoPJEyrQ8Kr2jYHU5jiag=;
 b=MPEVJb/OkykpnF6Rb/O4uDDBDlMcVcWCjySH2whm+zPe6U1bFWCpx+j3/NC3I0+KG1BSsT8uJDMC621rlLj2mCRnFKMbxbkw4OPPbIAHeoGwqcIAKZAF/3CGEJrA7QS4fBG2L7UuP8uXF1S7R77sshBNFkq9qxDAHyh7kPFJ569bTaqrnmpZOmt+0MLcw8MJq6nR1Od8KDB/eduaL9Rg0cQF4CwqBqzCauB/mQKVeZUp1vp4IK2I/cd2hLkOwujV9HpJLQRep9QPNr5UP0MxKs+8QzM8NERJ2r85YM3h7SpCYnUCCZEWGHXjJEvkKezGdLCxW1NRu6m0bZGvkiAfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/X4BUZEw9PGWHmf8kbHNWsoPJEyrQ8Kr2jYHU5jiag=;
 b=DW8ehCX4ZyMQCo0gdA4KUDEewvq5iHOZaDHInKdwuQ3bGT4ahVFE0g8kv8pSTD1Pkt+bvoAugVp5QsU2ClMGvkA81jnSkdt89BRZINbaeXlfQ3H8HGvbxoz0qT5aUZuPNMEoBxoo+hsjdf0ccPEnzvf/38IgEFwKHxJ1l37u03cR+91njTlYl+vF05HSFoECG+yC69+MBnh4LuqkeHgjhICTLdYzYWSX+RSHWkdOOtTB0NRxmVNLfTHs5Fu+l4EwCfByFgAwnVIIfUSsYHtqeEAJu5/8amEwG0LRE8ehCOgybMC6umb/tYoC3Wq1xTRHTmOpe6wwaYSnXDcWpZJ9XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a554475-9e74-39be-e03a-aaca2c22b857@suse.com>
Date: Mon, 17 Apr 2023 10:05:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
 <20230413150009.3145462-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230413150009.3145462-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cdeeca-f02d-426c-a7ca-08db3f1a8f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ez/+hcM5O4reCB3HsbVTdYSnTTcJnC7QbpLPaufUvHEh7H1Z57QNGagpmIHkPagS0MoggqB0qpwetqz6SGIriGw+SGkHjRDatf5zQnjoCYgHKirD3F8iJ97+Tc3vdEfo8BIgLO/Da++YcN9vVCDZ9Y4B+ViQrg1lLUs2WxiuNEPBgfO+1F2eX8GvSVT8jXZxsGTfNYoao3UChzxJzmEg5praDLoz/wTCVGk58oUDTJJDxTWF8ig6v2yylyr2kknE7+gCTGmGIYJyNIyub4pgppSKwikqVa1yhOk7ljhHTZGBj9xYXcjNVZ31/ZN9BBdsbnSr3oNRwRsRnK98Hxe/ZzyD75HGBYwUkKXZV74UDsSeHDQJtyfjFFHypMV+CRCR5sxgFGzk/rhRiD/eLyzmGK2MrGY3IPvnLmyDxqH5Fw6aFRuKJIOWkoZUoqjNzCsW5CLreZwJqrxIkb19p4ooSw8pPlLyXFAddZr0JxXTXm6k539h3brAZGCBNrDJqYeDCNwUeIP/upO141d19h6hWBqm1x7hSYJiUAG8zXEDQ6RpRLd953ocgwlMe0vP5IjdUmS/mN3Cm6YHQfpqvtgGOo05QmNV63JwSGcIpmpJ6sIHygwy9SQF3/SuUqKUM6BRdl3DZCW1oI2kGNw7NpbQzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(2906002)(31686004)(8676002)(8936002)(5660300002)(478600001)(41300700001)(316002)(66946007)(66556008)(66476007)(36756003)(54906003)(4326008)(86362001)(38100700002)(6506007)(53546011)(26005)(6512007)(31696002)(6486002)(2616005)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFljNWtpaUZqQ3AyY1R0MU5CK2MxT201R0JwYXhUT2RLNFVGd1RJVkx4eTBz?=
 =?utf-8?B?d1BvYW1uaUw2T0huSVBnZDZEZmhxRFFycEVTRlY1MWZXeFgrblpITFRZQUh0?=
 =?utf-8?B?emhMS0VwNkhrRVNJdjc5dmJBTUtBZklqVG8zcGFpeUpDbHpwaW1YQ0xReERl?=
 =?utf-8?B?Y3Jabytvak0va1pwemhKYnBFNVRpM0F2bndiZDlrRUx4Mjh2WVFVTTVBMFVB?=
 =?utf-8?B?RTByUzQwS00xaU9WWThnVGphUFM5MTdzU1pYNE5VeW1rYUtTWGFhK2pJRWlU?=
 =?utf-8?B?eG1PNTd4dzhVQVZaLzBoVy8yT0dRZ3p6aHpGQzREUmxDUnVScTFSQ1ozdnhi?=
 =?utf-8?B?TjN3VjU0Y0JVVXNDR3d6NEFGU291eDVFYTZyaWlQeEM4dkxFL082ZmRTNkMx?=
 =?utf-8?B?c0RqSVJVcHBKTisyV3R6Z1RtaEV6QzUrbDlRVVVtUUtLQ1loQTVaYXJsQzlL?=
 =?utf-8?B?aDB0UVV5c0xSVkpEcmE4dVBqU1V0S1ZOc1hDODNadERleFMvWFdtWjBHMVZH?=
 =?utf-8?B?M3g2TEpZdVJRbEpLTnlwR3l6bHFDSWswbGFEWm9aWktHckNLY2ZBRmxZM2xV?=
 =?utf-8?B?S2VoNHRReFJMQkxEdURXVTE4aFlzajk2bktkUXZTYVVCb0VZVWQwYmZsNDBD?=
 =?utf-8?B?czczblpKc0ZITklpellUcnpKc1VwdkwyeFZVRU80ZnQvZ1ZpVGx0RzVHMkVL?=
 =?utf-8?B?anRZc0FVdm8rWWtBSW5qdm14Und4bW5oVU4ralhBd1FXaytZZGFwNGNCWUcx?=
 =?utf-8?B?dEJDaXFxQXk1aHVWMDI4dERoMmgwTU82cUtERkh1TElhVXBQeFJ1UjRvbmNS?=
 =?utf-8?B?T1djbjFyYmZReDBwTkE2SUxoNnkyL2dMYUhHc1k1TzZrY2ZqeG9Hb2RaU2Y0?=
 =?utf-8?B?a2R4bnNRTy9SMkVHbGh3ekFNNEY2akpDOG9mZ2lBNUtEY1hZV1BydERNaElK?=
 =?utf-8?B?cDREb2E2U0V5RGFvMTljSXBKR2tDZGkxK1IvV2NTbjBnZXVsSVFqcU4rbEZO?=
 =?utf-8?B?K1c0QkNWWUhqWnVzZEdtUE5UVjFOc2hsMGRyZm9UTHM1NzhSWmRvQlp2K1M0?=
 =?utf-8?B?U0Ywenh1UlBTaE5zNEJNNE02bEV2ZVY2aG5lVS9ZOXJyNjJLWnBUV2RwY1g1?=
 =?utf-8?B?ZnBSODZiZnE5a1BrSmsvM0RPYndta2VyaHVuVXlSdUdlVUw2cFluUkdrOGJU?=
 =?utf-8?B?Ti8rMkJYYVkzOEVNVFl5ZXljS1NVZG5GVFJSYWNBVG9ZOUc0QnBNZ2RHdWVF?=
 =?utf-8?B?enJVVWVrZEdJL2JsczBlRlE1Q0JSaTNuS0IvRnVnZWNNL1hUaWUyeHlLcENa?=
 =?utf-8?B?OFE1TWRid0psVHlJZzBrQ0lzRTduSzFVcVlXQ3ZzeGV4MHlKNEZpUjUxUG5X?=
 =?utf-8?B?U3NuVXJ5QTFMUmFJbncxR2k2Zll0N2N2eC8vUEdjY2NVUnhTeXVTQ3QvR1Rr?=
 =?utf-8?B?UnBMeTZleEVBR253YiswZEZBRU8wbFRnSXU2UnRpNC90dUZKT3o0ZGFKVVoy?=
 =?utf-8?B?Z0NEb05YektMOUtBbGw3cmZlck50bkxyVXduN3VEUWhEVEh5Ym81WitKZ0xC?=
 =?utf-8?B?dkxJdFVhRVdXWHNhOUdZWExCaG1tL2hJRFlVZDRYdnV4bHZETW0wajRxbUtj?=
 =?utf-8?B?SjRkMjlUTWxNdEFIVlRkRG9xUzZ4VkJkWVhuOHZ1SWQ0ZTE0eGRrYnhQMk96?=
 =?utf-8?B?UmRMWnJzd2Zkd2g0L213dzVMa29wOVh4MnFHOVFsR1NRaWZ0NWVGeDN1K2RG?=
 =?utf-8?B?aG5CZHdkeXZneC9Nb1JISDJBbVhJcDZFb1l1UUEyczZNcDhkeG1sYk05QjNS?=
 =?utf-8?B?MHhnRXpTWmdaRlVDQmh5OUNEQ0FMSUg1TG5rNkY2azNZVEJTT2NYQnpyeEpy?=
 =?utf-8?B?VmVxaDNrNHhPK0lsaE5zM2JLY2ZreFJyS0p2VkRjUWEzSmFBN3IrM2xEc1p2?=
 =?utf-8?B?bDJOQlRNbERVRjk0RFhFZzgxeU1xZjRCRkpYYTNOeUR0V2JsVUwxQ2JlRklx?=
 =?utf-8?B?VUIxS01UVmJ4T1ZpcmdLM1ZsSEpRZE5Od0ZiOGk2eTQzYjFuNENjMzVsL01J?=
 =?utf-8?B?SXl5VzZwUnNXWmQwYjkxMTdhVGxJZlJsWmNpRlFTTWdkeXZZQW1nOXVlWXFv?=
 =?utf-8?Q?Vn9c9alEgRS+Usbxl7BjMIHRY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cdeeca-f02d-426c-a7ca-08db3f1a8f95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:05:51.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL8r8F+iGUegiDXpXYOZynlfSY6ML3u6O63uVHtw00k0vIT5L6a3WigwmdoUKn8HqV4SatacwekexeDD+xkYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10055

On 13.04.2023 17:00, Andrew Cooper wrote:
> The Long Mode consistency checks exist to "ensure that the processor does not
> enter an undefined mode or state that results in unpredictable behavior".  APM
> Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
> preventing the OS from trying to exit Long mode while in 64bit mode.  This
> could leave the CPU in Protected Mode with an %rip above the 4G boundary.
> 
> Experimentally, AMD CPUs really do permit this state transition.  An OS which
> tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
> to be going on behind the scenes ought to result in sane continued execution.

For my own understanding, which truncation are you referring to here?
As you're in 1:1 mapped code, %rip can't really be meant. Clearly IDT
and GDT would need to be (re)loaded to point to 32-bit-style tables, so
the only thing left would seem to be %rsp. It's not clear to me whether
after such an illegal mode switch its upper bits would be cleared or
ignored ...

Jan

