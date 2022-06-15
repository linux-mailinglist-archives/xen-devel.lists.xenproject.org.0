Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC654CB41
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350159.576408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Ty6-0005h1-5c; Wed, 15 Jun 2022 14:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350159.576408; Wed, 15 Jun 2022 14:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Ty6-0005eL-1j; Wed, 15 Jun 2022 14:26:02 +0000
Received: by outflank-mailman (input) for mailman id 350159;
 Wed, 15 Jun 2022 14:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Ty4-0005eF-9b
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:26:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13178f11-ecb7-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 16:25:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7095.eurprd04.prod.outlook.com (2603:10a6:20b:11c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 14:25:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 14:25:56 +0000
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
X-Inumbo-ID: 13178f11-ecb7-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX4VZKdl15hpjD2szd6kOJcHt92p8Axl0+lYlJhoTvk0DTDezV63YbY+84Um8oub/KgHUm0NzASw/C6+BHbsSdYiggaRS29p9y0hxRXeef6XbPn+ICcg28oU0RWHvfg5CDiUBNaXdbMIkHwXyHxo+1JyP3iUPeuT6puyj37i7RJHAKR1f9sswuOvUNOl+Yltav9kFqStoIHf6+2hJqJCHzS+yfmyaHKpwVq7TxMNpr+UphratszqMgvY2o87dKresIrRIGTPw6NyBFawMbOFkOl75fJmZ9XJ75zXhDzLpRA3QQDSqv3N7CUbk7ypttLhV5HAxWC4/HlJ7ZmS07gfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlFJaJZ4poUDzv+w4vDKt8i5i+SJXGu/Bd0vpJSYlWI=;
 b=gFnv+4QF4JPidht9XYSKfgcBKqbJfgaESG0OzOiabepv13pG1n1G2S/Ht2IIAnViNJQF8CsaCobevG4ajEsr0lKiPqdl/iUwj2FAITxug+T7lRIfpghU1vViPWpSrJL48WQV2Zs33kkTl9k9QzcV5aBXkJuH8CWA5asEiPQr9dVOW3qowXZPeGjw9rd0A4Av5XZzZQpApa1MxRJPL27TV5PIKwhUR1GEzUKOFAKTTkDEmBa2OIAf2wQlD7cmWfXINY0KRGCx0ia3um6JaTOTwy1sNr9g0Tz/4odbpolE4I4keanLwIsHJAX4TifYTUDxPE7rU0ADb5mRpbALIRlPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlFJaJZ4poUDzv+w4vDKt8i5i+SJXGu/Bd0vpJSYlWI=;
 b=BmfR388PkA7GoqxFzmEgq6VfIWR/AA6Y3COi6Jn1oRgtN5G9J9OmT43E93KmFzskY2oMRX3Y/Sz7SeEb5M3t6pQP/ABRBQoDx8NIkoYCFclcnTmFwz4bZCjX5x+bN9zGobAvmUIrtO5OSYmeq/UsRbBhpMzVpNsLzc/QCF8dpblyMwYn5wFLKhc++v1WOAeHEyctBUnkYtx4SMH54XiopDDA/32smmbrBo5ry102jk9trlA2hAEE8FmeB3uCp+E73iFVvY2vDHpQh6WpUJNkk8im4diQanVRoEuGUP5PSRMHy+ArAVsBTXN4HtGAFH/MQ6LRIwWdV4vEKkIM9Vj0Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com>
Date: Wed, 15 Jun 2022 16:25:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b354d300-cdb5-4d5d-28c9-08da4edaf60a
X-MS-TrafficTypeDiagnostic: AM7PR04MB7095:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7095F1F290DA62BD26E710EBB3AD9@AM7PR04MB7095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m9Di686abCk+cPqwlDOvSVkqsKEKR7KSSsOktk7UAyql9DjN25i0nv72ktY8D8aXGWQKy+HKP+6eJ6JsbySRTLWV5n2TxQP0wG39aDWgg8QcCixLRtm+mNX4CX9NbeZlyh6litTDlY77Ugw14dj4QVy+twPstO9PrFrWZIaZDfcD/bhHHGlCNi/kwhXcfJLRCK8IIJ0hDqL51o6owPp3xoyANQT+mHBidD+8b37Mp9Id95DV4gyOymnP81tf1+OYxNxi6TmEmxKVjvRJMJ93Unq6q30pnD/fWCh+ooLHD3onyqsnOHfGk08d3yyJW22bhlvp8Rf5bC7sKeg89+9wnVBmWfqW3jnZkio8hZl2UavtT6RR5uWosI8mibwN0Yx1hAQhJomYUCKL5R9IIwWHAyOnR8B5ADu9ejnGgLyxZJmmRZP95doRdDpx1nZBbLwT6E8zx2y7sFwB7epkS2qfPwsnXJ5Vd7ny5+g5nQTvBjox/qJZ8Uu0AZyQf4fwGoU/uMStAXyN8QPeDKMGJhSfJmYnKEtUIvFVQ8bPwC4TM8RLFbJsd4cJ41RFAfCHmIU6NVLdYPfzL04g+Y75E1iIys74CrTOfalHMa3xNaTV1xjljdZXIH7XMZIgKsQZBnV/9QCEXCKBv16Orpx22ozuElp4NLBHedgk0j85j2nCPbHZjfV4KvjXwCOlFDRyPFeEBziAYmKkZCRIAZU73jCg5I/sMUv0FXDGxobtnysELJUQEZxi0Y7uBQ+puTE+VTmrLo0hHkNCYows91AEL8f0/XFQVbpsKpAmLrSXFknVH/yQXAMuo4z9mBpkuKxLN1QDAEfxBteyRV85NuF8V1Ppag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31696002)(86362001)(2906002)(6916009)(54906003)(38100700002)(6486002)(316002)(508600001)(30864003)(4326008)(66574015)(8676002)(186003)(66476007)(5660300002)(8936002)(66556008)(83380400001)(26005)(53546011)(6512007)(66946007)(2616005)(6506007)(31686004)(36756003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHZkTi9MdzRGa29QYWR1ZExoWHFxQ1lrV0pmd0xLV1FzYnZVMTcvS3puc1JH?=
 =?utf-8?B?T3JleFk0cCtJU2NFTUdrN2t6SmN6dDR3ODNmYUlNR21teVpmd0oxb3g2QWJX?=
 =?utf-8?B?RWwrMkV6K0dFYVRDQ2pUN1gyMWMrUmZlMVM2SWlzKytVbWFjZEYxa1cvbnJl?=
 =?utf-8?B?bFowRU5VMlBiS2pjUnRTZ1hhR3ErQ1hsKzlLRlpiNnBHbFk2OTZrOTRMM3Yr?=
 =?utf-8?B?MEhBM3hqN3FyZEdtNXNvdTluclh5eXhISkxLekMxbXFoVjBVdlpHY1dSTmRW?=
 =?utf-8?B?Z1B0bkpSaWVCSk9mOFk1aDRlZVpJMWt4R2VtNmVGZ0JjRXpKVDZyT3dZYW9h?=
 =?utf-8?B?T3c5aWZPWHhxRXVDeDB2UFN6dWxsVDJERm9wRVgxeUUrbXBpdGkrbVF2RnRs?=
 =?utf-8?B?MjN3ekFJUnBSNVJVb0ZXQURPQnQxcDVxWmVVOU5YT3kraGh0czM1NTltMWZj?=
 =?utf-8?B?bSt4SldFZEZma3YvcjNVdlpaencyV2V0SEJtYXJRSXYzYVh1R2xwcmpuYkIz?=
 =?utf-8?B?c2ovdEtscTgvWm5HZUZLT1d3aGlpeUxQVzZLUHlzRXNqZHJIYTlhZ0NSU1o0?=
 =?utf-8?B?ZS9YUndKbDYxSHVxc1pkQklDZE1KNFhGanhpaGVZTEViVldXMlUzMDlzVWJM?=
 =?utf-8?B?WkMyeFlnMmV1eE1OK2poSFUxc2lPdlFleVRpcDFVaFBTa3JJdnRROG9RRWVz?=
 =?utf-8?B?SkYwYTdlNVdNSXRpV2dHRTB1ZUJhMzY2SG9uWnlzTXArRml3ZjRpZnFuT2tm?=
 =?utf-8?B?OGg4b25BMGdyNVJuc0Y0MXR2WDVSL2JvN1ZjeDJjSmZlbzA0aU5NdXdTOXV4?=
 =?utf-8?B?N2xadCtpOGxQK0tacDRSY3pNb0duWTZEanBRRFBBY0orV2E0VjdiUlN3aGlQ?=
 =?utf-8?B?Sm9HaW9wdk9jdXlPQUtINTRweE8xL2xtTGZYT0N0S3hjVk5XNndDUEZURS9i?=
 =?utf-8?B?UlBjWG1ENWExZ3U5QTNnSnVrNFBPZCtKOXhTT0tZYWp3MnZwaGxrRHNPWThM?=
 =?utf-8?B?bzFrRytUZkc2ZzE5Mmo5NjZ1MW1MOGovZUFudi9sM1FUS2h2aXloNnh1bWwz?=
 =?utf-8?B?akZSSkVJWWtlMU1TaDlkc25oemp4bGtEWlFwK3hkR2NGK1o5ZHB5NUVvMzJF?=
 =?utf-8?B?RDRZTERhN3VCUVBEZlIrdVNvZHZiOWZndnZqeTl6OENxdU84OHM3L2R6SFk4?=
 =?utf-8?B?V2xENWsxeG56ckNmWjN0R0gwSzdkQUdxRnd2T21rbzBzVmpYb3NxdGgraG9p?=
 =?utf-8?B?UHQxeWJwK05UKzNMdGdnUVJpUFBkNWQySUZVS2Y3a0NpeGZMN0cyRFFxS3Ft?=
 =?utf-8?B?T08zSGRSZmoxQVRmVUhzN09TRkJ0b0c1Vk1GN01nekFwTWcyS1Z2UnkrTlAv?=
 =?utf-8?B?UmJpRTVvS3dmbDBCa0Rpb093cmFDYlVMbXF4bjE5Rzd5NnhEWWsvSlZZbll4?=
 =?utf-8?B?N2dHcU8yUGxlTzkwZkxOdEgwNlNOT3c0Vno5RC9YRExpZmNieDFhRmwrRUhM?=
 =?utf-8?B?OGVFSmo4NFRNZEJpb3cxMXIvNnhRUk5RbjVmRjdCNjNreDlpY3FmWFpyM3NU?=
 =?utf-8?B?d3RyMWtuU2FrVEJNcHpNaEI1aGN0aG0wU0tSVXpBMFZvb2o0L1FLUEl0Nnhr?=
 =?utf-8?B?VFhCYURYY3dmc3dXMFdwTlVJUXEwU1RuT1VyaFFNRDRlc1VQZ1pFT21ZaHZN?=
 =?utf-8?B?d25WVFQxVmVaQWFGRGlYZkprNWxpeklySElMMytRQktiOERkZGZmTWhNY0x0?=
 =?utf-8?B?dmttNDE4Z0FXb3B6dDZoVTE3SVFnWTdXdXhEeTJ1K1A4NThJcGtNc09lSmJW?=
 =?utf-8?B?V1pldS9tRjlnZlZ3OExjUFA3ajZ5RVFKY3QxNkxSWXhiR2VPR2lTaksyWURl?=
 =?utf-8?B?S2g1WFhrUUI0ZUNyOWkyTVJxSWo5bE9pODliWFNVc29yeU1NVmZYdkxSRTZU?=
 =?utf-8?B?dGZ1SEp3THcvQjV1MFk5emVjSHh3dllrVWtXZG1ZaDIrSTBRVkxselpMY0hj?=
 =?utf-8?B?NWt6T05IZEJqUXVZS0RUSUNORXNGR3pqaDJoL0RZQTFLTzB0L1dZWDhGdElS?=
 =?utf-8?B?b0s1cnpEVDFuMDl3SVZ0cDJzRXJRb1IvY05NYlFqTWlBY1BLV0puclZGN25t?=
 =?utf-8?B?dTdjWjdscTVTdG42cnp4WTg4di82c3E1bWJpTFlYTGE4NDNIKzFKYjhCanpw?=
 =?utf-8?B?eTFGZDRBTHQrVFJrQmZuaUJHWHVnLzR2ODZVejFsUGU2RnN0TWtPQ2FHNDJa?=
 =?utf-8?B?Yko5cXdaV3dpMUFVbGlDY0lzem13eEcyazZyTEYxbUtQZDBKRmxOTkh4UVNm?=
 =?utf-8?B?M2RqVk80bGhlZzV1Snd6K25lZk54eTc4NzJldmRuei82RmNuM2ZvQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b354d300-cdb5-4d5d-28c9-08da4edaf60a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 14:25:56.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xCpus1HXDHoteKJSSkPadAakGgDllDT6B33eLUFBBlUXfVKXzFIx9FPFF7wT2LSkLT6K1WX0MZ9TBsi30Rzpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7095

On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
> From: Connor Davis <davisc@ainfosec.com>
> 
> [Connor]
> Xue is a cross-platform USB 3 debugger that drives the Debug
> Capability (DbC) of xHCI-compliant host controllers. This patch
> implements the operations needed for xue to initialize the host
> controller's DbC and communicate with it. It also implements a struct
> uart_driver that uses xue as a backend. Note that only target -> host
> communication is supported for now. To use Xue as a console, add
> 'console=dbgp dbgp=xue' to the command line.

Which suggests that the command line doc also wants updating here.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -74,3 +74,10 @@ config HAS_EHCI
>  	help
>  	  This selects the USB based EHCI debug port to be used as a UART. If
>  	  you have an x86 based system with USB, say Y.
> +
> +config HAS_XHCI
> +	bool
> +	depends on X86

This isn't very useful when there's no prompt, and only "select" would
enable an option. Even if HAS_EHCI has it (for whatever reason), I'd
prefer if we could avoid proliferation of the oddity.

> +	help
> +      This selects the USB based XHCI debug capability to be used as a UART. If
> +      you have an x86 based system with USB3, say Y.

Indentation looks wrong here - the HAS_EHCI one in context shows how
it's expected to be.

> --- /dev/null
> +++ b/xen/drivers/char/xue.c
> @@ -0,0 +1,957 @@
> +/*
> + * drivers/char/xue.c
> + *
> + * Xen port for the xue debugger

Since even here it's not spelled out - may I ask what "xue" actually
stands for (assumng it's an acronym)?

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright (c) 2019 Assured Information Security.
> + */
> +
> +#include <xen/delay.h>
> +#include <xen/types.h>
> +#include <asm/string.h>
> +#include <asm/system.h>
> +#include <xen/serial.h>
> +#include <xen/timer.h>
> +#include <xen/param.h>
> +#include <asm/fixmap.h>
> +#include <asm/io.h>
> +#include <xen/mm.h>
> +
> +#define XUE_POLL_INTERVAL 100 /* us */
> +
> +#define XUE_PAGE_SIZE 4096ULL
> +
> +/* Supported xHC PCI configurations */
> +#define XUE_XHC_CLASSC 0xC0330ULL

While I'm not meaning to fully review the code in this file (for lack
of knowledge on xhci), the two ULL suffixes above strike me as odd.
Is there a specific reason these can't just be U?

> +/* DbC idVendor and idProduct */
> +#define XUE_DBC_VENDOR 0x1D6B
> +#define XUE_DBC_PRODUCT 0x0010
> +#define XUE_DBC_PROTOCOL 0x0000
> +
> +/* DCCTRL fields */
> +#define XUE_CTRL_DCR 0
> +#define XUE_CTRL_HOT 2
> +#define XUE_CTRL_HIT 3
> +#define XUE_CTRL_DRC 4
> +#define XUE_CTRL_DCE 31
> +
> +/* DCPORTSC fields */
> +#define XUE_PSC_PED 1
> +#define XUE_PSC_CSC 17
> +#define XUE_PSC_PRC 21
> +#define XUE_PSC_PLC 22
> +#define XUE_PSC_CEC 23
> +
> +#define XUE_PSC_ACK_MASK                                                       \
> +    ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
> +     (1UL << XUE_PSC_CEC))
> +
> +#define xue_debug(...) printk("xue debug: " __VA_ARGS__)
> +#define xue_alert(...) printk("xue alert: " __VA_ARGS__)
> +#define xue_error(...) printk("xue error: " __VA_ARGS__)
> +
> +/******************************************************************************
> + * TRB ring (summarized from the manual):
> + *
> + * TRB rings are circular queues of TRBs shared between the xHC and the driver.
> + * Each ring has one producer and one consumer. The DbC has one event
> + * ring and two transfer rings; one IN and one OUT.
> + *
> + * The DbC hardware is the producer on the event ring, and
> + * xue is the consumer. This means that event TRBs are read-only from
> + * the xue.
> + *
> + * OTOH, xue is the producer of transfer TRBs on the two transfer
> + * rings, so xue enqueues transfers, and the hardware dequeues
> + * them. The dequeue pointer of a transfer ring is read by
> + * xue by examining the latest transfer event TRB on the event ring. The
> + * transfer event TRB contains the address of the transfer TRB that generated
> + * the event.
> + *
> + * To make each transfer ring circular, the last TRB must be a link TRB, which
> + * points to the beginning of the next queue. Note that this implementation
> + * does not support multiple segments, so each link TRB points back to the
> + * beginning of its own segment.
> + ******************************************************************************/
> +
> +/* TRB types */
> +enum {
> +    xue_trb_norm = 1,
> +    xue_trb_link = 6,
> +    xue_trb_tfre = 32,
> +    xue_trb_psce = 34
> +};
> +
> +/* TRB completion codes */
> +enum { xue_trb_cc_success = 1, xue_trb_cc_trb_err = 5 };
> +
> +/* DbC endpoint types */
> +enum { xue_ep_bulk_out = 2, xue_ep_bulk_in = 6 };
> +
> +/* DMA/MMIO structures */
> +#pragma pack(push, 1)

Why? There's no mis-aligned field ...

> +struct xue_trb {
> +    uint64_t params;
> +    uint32_t status;
> +    uint32_t ctrl;
> +};
> +
> +struct xue_erst_segment {
> +    uint64_t base;
> +    uint16_t size;
> +    uint8_t rsvdz[6];
> +};
> +
> +#define XUE_CTX_SIZE 16
> +#define XUE_CTX_BYTES (XUE_CTX_SIZE * 4)
> +
> +struct xue_dbc_ctx {
> +    uint32_t info[XUE_CTX_SIZE];
> +    uint32_t ep_out[XUE_CTX_SIZE];
> +    uint32_t ep_in[XUE_CTX_SIZE];
> +};
> +
> +struct xue_dbc_reg {
> +    uint32_t id;
> +    uint32_t db;
> +    uint32_t erstsz;
> +    uint32_t rsvdz;
> +    uint64_t erstba;
> +    uint64_t erdp;
> +    uint32_t ctrl;
> +    uint32_t st;
> +    uint32_t portsc;
> +    uint32_t rsvdp;
> +    uint64_t cp;
> +    uint32_t ddi1;
> +    uint32_t ddi2;
> +};
> +#pragma pack(pop)

... anywhere in these structures, afaict.

> +static void xue_sys_pause(void)
> +{
> +    __asm volatile("pause" ::: "memory");

Nit: In Xen we don't normally use __asm, but asm.

> +static void xue_flush_range(struct xue *xue, void *ptr, uint32_t bytes)
> +{
> +    uint32_t i;
> +
> +    const uint32_t clshft = 6;
> +    const uint32_t clsize = (1UL << clshft);
> +    const uint32_t clmask = clsize - 1;
> +
> +    uint32_t lines = (bytes >> clshft);
> +    lines += (bytes & clmask) != 0;
> +
> +    for ( i = 0; i < lines; i++ )
> +        clflush((void *)((uint64_t)ptr + (i * clsize)));
> +}

Please drop this function (which doesn't even use its first parameter)
and use cache_flush() instead. (At the example of this though, please
see ./CODING_STYLE for the use of fixed-width types. I understand
there are many places where their use is appropriate in a drivers, but
none of the uses above look to fall in this class.)

> +static int xue_init_xhc(struct xue *xue)

Looks like this function returns boolean, and hence wants to have bool
return type. Also looks like this can be __init. Both remarks similarly
apply to xue_open() (the only caller of this function).

> +{
> +    uint32_t bar0;
> +    uint64_t bar1;
> +    uint64_t devfn;
> +
> +    /*
> +     * Search PCI bus 0 for the xHC. All the host controllers supported so far
> +     * are part of the chipset and are on bus 0.
> +     */
> +    for ( devfn = 0; devfn < 256; devfn++ ) {

Nit: Xen style wants the brace on its own line, like you have almost
everywhere else.

> +        uint32_t dev = (devfn & 0xF8) >> 3;
> +        uint32_t fun = devfn & 0x07;
> +        pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);

This is at best an abuse, as per

#define PCI_SBDF(s, b, d...) PCI_(SBDF, count_args(s, b, ##d))(s, b, ##d)

But really I think this generates the wrong coordinates. What you can
fold is devfn, i.e. PCI_SBDF(0, 0, devfn). (If you don't want to use
that form, then please avoid open-coding PCI_SLOT() and PCI_FUNC().)

> +        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> +
> +        if ( hdr == 0 || hdr == 0x80 )
> +        {
> +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
> +            {
> +                xue->sbdf = sbdf;
> +                break;
> +            }
> +        }
> +    }
> +
> +    if ( !xue->sbdf.sbdf )
> +    {
> +        xue_error("Compatible xHC not found on bus 0\n");
> +        return 0;
> +    }
> +
> +    /* ...we found it, so parse the BAR and map the registers */
> +    bar0 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
> +    bar1 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);

What if there are multiple?

> +    /* IO BARs not allowed; BAR must be 64-bit */
> +    if ( (bar0 & 0x1) != 0 || ((bar0 & 0x6) >> 1) != 2 )

Please don't open-code constants from xen/pci.h.

> +        return 0;
> +
> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
> +    xue->xhc_mmio_size = ~(pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0) & 0xFFFFFFF0) + 1;

Same here and ...

> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, bar0);
> +
> +    xue->xhc_mmio_phys = (bar0 & 0xFFFFFFF0) | (bar1 << 32);

... here.

> +static struct uart_driver xue_uart_driver = {
> +    .init_preirq = xue_uart_init_preirq,
> +    .init_postirq = xue_uart_init_postirq,
> +    .endboot = NULL,
> +    .suspend = NULL,
> +    .resume = NULL,
> +    .tx_ready = xue_uart_tx_ready,
> +    .putc = xue_uart_putc,
> +    .flush = xue_uart_flush,
> +    .getc = NULL
> +};

Please omit the NULL initializers.

> +static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_erst_segment erst __aligned(64);
> +static struct xue_dbc_ctx ctx __aligned(64);
> +static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static char str_buf[XUE_PAGE_SIZE] __aligned(64);
> +static char __initdata opt_dbgp[30];
> +
> +string_param("dbgp", opt_dbgp);
> +
> +void __init xue_uart_init(void)
> +{
> +    struct xue_uart *uart = &xue_uart;
> +    struct xue *xue = &uart->xue;
> +
> +    if ( strncmp(opt_dbgp, "xue", 3) )
> +        return;
> +
> +    memset(xue, 0, sizeof(*xue));
> +
> +    xue->dbc_ctx = &ctx;
> +    xue->dbc_erst = &erst;
> +    xue->dbc_ering.trb = evt_trb;
> +    xue->dbc_oring.trb = out_trb;
> +    xue->dbc_iring.trb = in_trb;
> +    xue->dbc_owork.buf = wrk_buf;
> +    xue->dbc_str = str_buf;

Especially the page-sized entities want allocating dynamically here, as
they won't be needed without the command line option requesting the use
of this driver.

> +    xue_open(xue);

No check of return value?

> +    serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
> +}
> +
> +void xue_uart_dump(void)
> +{
> +    struct xue_uart *uart = &xue_uart;
> +    struct xue *xue = &uart->xue;
> +
> +    xue_dump(xue);
> +}

This function looks to be unused (and lacks a declaration).

Jan

