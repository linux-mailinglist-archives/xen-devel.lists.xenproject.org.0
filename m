Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6437690E9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 10:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572827.896881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOiU-0004Hs-6q; Mon, 31 Jul 2023 08:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572827.896881; Mon, 31 Jul 2023 08:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOiU-0004Eo-3j; Mon, 31 Jul 2023 08:57:26 +0000
Received: by outflank-mailman (input) for mailman id 572827;
 Mon, 31 Jul 2023 08:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQOiR-0004Eh-QU
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 08:57:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b1367d-2f80-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 10:57:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 08:57:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 08:57:19 +0000
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
X-Inumbo-ID: 42b1367d-2f80-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9yjmfyW0ix2UI+gu3v/GCTUwzBpYPfFzWx/yFw+Tu0gQLi7dLrg/FgP/Quvjv0HUPMZUdVwzWQtc9u89cOU5F8ePc/KIG2gHWzRaBViR0/GlRC/WD2M8h8/ziKyJ/MayqcaaD4Ku8Y/2+GuY9+Xyl5k52f9WLQOe6EQ4NqgF13Qz+ucdHlH+L9Z6m6uGe8hseIA7i9620KOFcZUIM/uRoN1CHuU2kooyFNYrx9HzGAhktSqCVwFlATXZdKIhuN4l6zkZFCoekVPWoVGEnPDW6Q8oLWFbLFBhHi+UtmoPE4qQa5ZVbUyGg+DvFYsYW3gItlby4L2StWw4aqGaeUgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUqt4FGHi8o7OqgUC/GQ8HY+e25ZWNrtn4yjx++Hlp4=;
 b=EAph44z6XK61/HScTL7ZbVdg+b57U8hul9TdATDCW0bjICqYJMw8wUT6e9VQwTVRRP/DaNeMTdExYA5F9UJ0QErz93nda/qcfS9glLVh6JUJuZ87zDc0GAoHJw9GrQw+81JmvAcS97gkbjA3Gsls2MgLgR2EFguL8KIZ/fzYhtNeZVMrYOmcTexXusaBJlddO/RSc07nPSp5sLeQA/LjHHDKpANt13Dgtpjo5hiyNeMx0Y4GG89hC/0mrLnUDOmHrhMEbv1PMZOwxvxd1Fi9tx7ubNTiMxQHbToOlPrQd8Ns519VJTfhX0CY2JAtGUjgF3GoW9qzzS30fWst6bdXnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUqt4FGHi8o7OqgUC/GQ8HY+e25ZWNrtn4yjx++Hlp4=;
 b=wPY+tFbk+ib1r5HrDjHLxN8PFfSc4IWRznMQbFucsijb53GGOgZAfyLZP439Jz+vDg9DDGj0dLibdKFm1wLsmcYqoLlpemx/4xbet+PPcW2xa3K1bf9zqKGklOc9pxni3aHJ4XCWNzM0W6k/OPBY2fjoMAvvZYPsdlH8W0ix6iMFY5HG3If6vM2eVmGn8fidQk0mEgClk/yrjKD1mNRDltvQXkPJmsNnMhA6X2gVnz6IUsdGRswSl/MRpoct5L+pFe+lRKh1vd5KmstmpTNqq4fvJUNkJT56NdBHRy+2FtHjv3+MLTvoPg1m0GJkvtXIljI8q5XYyoAKSlO2x71L1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da29c270-0ba2-6ba2-fa6c-844daa65d07e@suse.com>
Date: Mon, 31 Jul 2023 10:57:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/3] x86/entry: Rename the exception entrypoints
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
 <20230728194320.3082120-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728194320.3082120-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0857fd87-ac54-41cf-3013-08db91a425b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C7ehq6LbCc+y4qM8LhJ5gEMHLt2m/8VbGo8LR9KuA3DUqDiCIF+BsdiWe0Zs9d6IC3K1u8sd2L0cK9QN56fKwfA3BABadrolXvruasXMNdJMHZp4y8SMJA3yVo9AKUB4sLD8EuPGjJ904T5KYX+htlLS36bQaIFh/pjPj7mG04lvNMPcrNaLT7j0y5fe4LchAh5mSPQgUst2wC8zLK1z/8Mn5JVbxewBPDA2jG46TInVpX25b+96WdCb+E6MCNfpRZARC4laW3DdgMGDOw/SuMcrUfbt8RyvO2jV9L4EDfyvS8jpbxFbr2F94n5G7NAzU6UFgIdDrscxwRksoahyyMdDhy5eLBQ93D4wJYeuNsNrVjSzFQZlvs1ZXuiXlIbR+nzPTAVnM12o8Osr6A62QFFZMx9OXkXFQswdzNiop7ZeqTH1WSJjMHdUdqBxyRUOFomW0Jdkln2b6GBS3/IA8r2KbeLILirPu/5EVb5PcHsMxYLQS1Dv4Ra3GaEHdKG4QTBbNcguyG/+bCf/hO78enXJMU5qQ6T7qfw5k4MuvJQcgGQYOlQ3/IV4xDGwG4ehcyO+FaSp8pB6pyqqWeMsuYan6FfBSKQyeGFDAHts/51voN9gH1amv7T5bYgi4b4Y3fqYRP3AQgtqab+jEnLreA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(38100700002)(31696002)(86362001)(36756003)(6512007)(478600001)(6486002)(2616005)(53546011)(186003)(26005)(6506007)(8676002)(8936002)(5660300002)(4326008)(66946007)(66556008)(66476007)(2906002)(54906003)(31686004)(110136005)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTJneW9FYndhOTBmSW9ZT3RNNGo0ZnM2bEdGRlFieDZ3ZFNOK2NEZlZFT1Uw?=
 =?utf-8?B?dGNjbStFQ2cxdXUwNnVJUCsrL2d2eGdrbjlLeTNxWlJESW5tTmxrMXdsaG02?=
 =?utf-8?B?eVRObjJsczA0YVFnT1lZeENwWkMrOVRzVnMxM2lTaEptWmMxMWQ1Y25IQmxm?=
 =?utf-8?B?V3hPTTNoanlGU3NsT25WV0lJUklvZUh2WnNBR2YyL0NEM3h2dlVPc1FiVGZo?=
 =?utf-8?B?NC8xOWxsU2g0MTFsbTBJTnNtcVR3SitLaVVNL2piVVJOQndYRmdBSGxldW1R?=
 =?utf-8?B?NjQ1Tk0yU2lVcG5SazFFNGhxSldia0VJYjRoT0k0UEJrdHAxcHNzcGs4WXNG?=
 =?utf-8?B?ZDh0TzA4Rko4U2Zkck1sbnExVEo0eFp6UldaY1libGdhMXhncEppY21USWhi?=
 =?utf-8?B?Rkk1cFFJeUl1bVo2akJieTUydmpsV1NwalRRb0wwS2k3VlA1TWdBRUVrUFlz?=
 =?utf-8?B?WWw4Q011bFBoN0h6b0l2MmwwTGE5WnFjMENiazRYYU1aTDZZRk03VjQ4a0V1?=
 =?utf-8?B?Q3ZQNVRUUUowYVhXdXJYcHducStDMDcvY2pTVmYra21CWUIreGJHS3prOXZQ?=
 =?utf-8?B?b1ZEVkxxdnFTUHMwMGh6UlV4cUxwb2VNYWdRb0ZCVXdVdXFUN1JPZStTeHBs?=
 =?utf-8?B?L0FVQkZxTDRGU0F4c0tWTUlBK3BzcElMNGxiUDN4dGg1ZCtkQVpSUlpvM3Jx?=
 =?utf-8?B?Y2NBYzNXb2gxZUpkdTdDYUJlY1lTdVY5VVZRR0g5dGZEQ3l3enorcUJmaitS?=
 =?utf-8?B?bzAzR1Y5ZURjTTNrQW9WaHNDSGhYcGZvdXRQYVRYOVRjR1hibVI1SnZteHY1?=
 =?utf-8?B?NXg0RHJaVlB2bFFhcWRYVUJmQmtFMEw2MG5kZlV0MEJGSGFvUXg5cEFTaVNs?=
 =?utf-8?B?YzBtZ1lwMHRVVllEQnV6a3p4aWpJU3poVzJpNTlNTFljZFZWcjl1ejYzUWli?=
 =?utf-8?B?eldwQVNtS3dvUkF0VkhZVWdOVUJWUXEvT0svQTNFNXByVlV5WWF0ZWdnQTVt?=
 =?utf-8?B?bEs1b2ZvSERsdkYrWmFEQWo4S2RNNXFzSnc3VEtzNWFwa0tOcjBLSTBkZVFx?=
 =?utf-8?B?dlMvaGZuUFVGZUswaDBVc2dHUDRtZHRJN3p3OVdsbWFONmoyekNzODhTV25Q?=
 =?utf-8?B?eXY2Vnl0Z0dsWEVvWUVZWEtVM3kxQVF5dkQ2VlRVelNzbzd4VEgvTE1kRTR3?=
 =?utf-8?B?eUVVODdiRXpzemlCSllmK3JJL0tSMGlKUmJwdzlSSnY1VmpSODBJY3NCVER2?=
 =?utf-8?B?czBoTVp2aGxwRFdka2VaYXdGVWFBNllheGptS3B5WENOdEpmZW5Kcitjd3JC?=
 =?utf-8?B?Q1JHTUdqSHg4ai9ES0ZicmpQVmVmbmZWdTQ4NDA0TEJuMzJWTmJlZzJ2UkFO?=
 =?utf-8?B?c0NHV1ArMm1wSExyV0dhcUhYaHZ6SFZoenVhdFdUNGFFS2VSZFdzTkhtZ0x3?=
 =?utf-8?B?Z2tndUd6OVpQWXRST1YwYU9aMDIzZkc3WHhOTzF6andlM3VYanc2NkVTeFQ2?=
 =?utf-8?B?ZmMyRzlGenN0YTltZjN6cDNTVHdkY2tCL2RYYUE0aDFZYUU5NWFWV0J5N25z?=
 =?utf-8?B?YlVPSklpVFA3Q2dZUDhXdmh4aXFISkU5VzJ3T25mTVZjNjlBeitxUHhVTVV2?=
 =?utf-8?B?ZzRLcGx0R0dGS1VNc25NZFhGQ25jRWVuWXhvTFV2Z28yQUxpMlJQOXR1RWxB?=
 =?utf-8?B?WWMxTlNFa0Z6NlpxME01bUwyMXBjbzNPSUIzekR2Y3czUmpVMkF4cHVhT01o?=
 =?utf-8?B?UjJxMTBPMzE5ekZnajFUZ1VRbHlrV2h5a2RyMzZxZEhySnhPTVJsUWVtbGFL?=
 =?utf-8?B?NlBQblh5VHViMU9CU3NRNEhwaENudERFT0gvb2h4WlNQSHBMVEp0VXFRMm14?=
 =?utf-8?B?N0RLM1dDampzb3pjZ2J2ZlkxdEtSSFJRWVNQc0REMzVkcWVySklmd29nVHp1?=
 =?utf-8?B?b3V1MXRVQ3pTZ1VtcFJEQ3JoaTVFU1laNVJURDBIamUyQ2JlZWxWbThvSjVn?=
 =?utf-8?B?dzNUQ2hLUG94UjlFTXdZZHZXelkvaS82MFJ5dnZJTVQySjk4VU4rZjJuTVJP?=
 =?utf-8?B?aG96VDlRdW5ldnNDZ0xmL2xRYml3MDQ4Q0sxTUVDcHMrRWJacEt4cHVCN2l1?=
 =?utf-8?Q?KOSEEJB5cUGcDtepexGg+KXQ+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0857fd87-ac54-41cf-3013-08db91a425b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 08:57:19.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vMfPUxcb1p40UzpvAoeLtFNLeapoBCWHBWTMOy4uiv5BdPKGAY+2ZxVQ1pxOYC1poYBkh9pPD52UP0AYUWSOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

On 28.07.2023 21:43, Andrew Cooper wrote:
> This makes the names match the architectural short names that we use
> elsewhere.  This avoids 'debug' in particular from being a global symbol
> shadowed by many local parameter names.
> 
> Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only NMI/#MC are
> referenced externally (and NMI will cease to be soon, as part of adding FRED
> support).  Move the entrypoint declarations into the respective traps.c where
> they're used, rather than keeping them visible across ~all of Xen.

Coming back to my Misra concern here: There's no way we can avoid violating
rule 8.7 (and maybe also 8.6) when it comes to symbols defined in assembly
code. Rule 8.5 otoh is a little more relaxed than I recalled when commenting
on the earlier version of the patch, but it still talks of exclusively
"header files". Roberto, could you please clarify whether putting such
declarations in .c files is indeed not a violation of 8.5?

In any event I see you've added "nocall" - I guess that's an easy
identification for (some of) the symbols defined in assembly code, and
hence needing special casing in scans.

> Drop the long-stale comment at the top of init_idt_traps().  It's mostly
> discussing a 32bit Xen, and bogus otherwise as it's impossible to use trap
> gates correctly for these purposes.

I don't think I follow the "impossible", but I'm also not going to make my
(eventual) ack dependent upon you further adjusting this part of the
description.

Jan

