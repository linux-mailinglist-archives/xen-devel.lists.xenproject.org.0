Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371076C643
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574731.900275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR66L-0002r3-S2; Wed, 02 Aug 2023 07:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574731.900275; Wed, 02 Aug 2023 07:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR66L-0002oe-PB; Wed, 02 Aug 2023 07:16:57 +0000
Received: by outflank-mailman (input) for mailman id 574731;
 Wed, 02 Aug 2023 07:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR66K-0002oY-N0
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:16:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f870f26-3104-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 09:16:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:16:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:16:53 +0000
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
X-Inumbo-ID: 8f870f26-3104-11ee-b25e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2ZfC0DcxMjs8JULLXxV/dh0fWsBzlKM5vwVQGrxq/BSGVmJkEfYZ2DYmWhl6Pkt22oDfw9J/ZmjrxEQY3K/m/P2kCp3/EfqAFtLW2U3M3Y7lbPU3ebZpIJRLo3olTiPL09gqgjsNDGvfMxAsW0d5n9ULpw/WsAObQ9CLB1kkjhRB9BjCYJdUs5uFpU6jbz2p/jkDn+y0fwJgsIsC4S9BHXkDA9m12ld6qtgfGze/hF7w4AImTB+AK4zUb4Ev6gRvkPygcOjXOztv8eQdPlZrd5piXN/vkh1GFFWE8sAfL1iNBCgwhArvCpT/0FA7M3ucrcDio9CLRO0vwGDqHDGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsbyRsYos73yyDPCpkKl5JV5OdZ2xsaCh+55LwFQFm8=;
 b=eED1apRzQnRCGnfblkw+lDKvLO8LfPMPJeMbquB23U9jlBsMP3Hl9LlDx12w4cbYPG9k7Me2J2K7tor429ralLmay/78Fbd4vA0FDPjESaBDWNMoZIeOaf+vi22LQiA9GZ8LMlcslDlYWP2THIUYvLUyvbiUTIxEVpMxnjjpDF5b1XvNTNWXag98DZjtyDsXfQAmG8/T0LaUvEKZfyIbWgElv96aMkWye/CNga+K66hyIq0yDi9caC2XCvBgn35/DxuabVTh4T2INn9ziaAZH28SfF1hBbr6wm2v0zov83VeOopPlUJx/KKkGAFGvwM1KMC9tut6RAxmj3hnS7G0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsbyRsYos73yyDPCpkKl5JV5OdZ2xsaCh+55LwFQFm8=;
 b=pbdQNfdFsma0STjtqK2P7cq5VVYLSRzgf/eb/5o40NU/LZ2ASvmNMA9NYq3mL2aJGcNyiRWa+Nm1n3rh/+B/6C8OfYE11oNUt1NWNqA37ooVrmkNAVNYxwQvPzTw39aakrT3la+ZBsoACXnvZ2E3joMaQR86NH7ZnpCf/fgVu/VrHsImaLR71Jq47ux5qH6Q4Z0eo9eP1TdTNw8rtcq4N0obV+bDrIOjz2TbVI4UXWUzcLpF9D9HPokXNPJ3Ufeok+afLWy5buvPgLdaNu+If1/jocrWnyrEnmcMgGBL0YjSvUUz6mZDuSfJZn/aSnv0hNO0lZQhD2PMWSlj1muLUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3c5e9a2-918d-5b6c-b0bd-34b61d00c769@suse.com>
Date: Wed, 2 Aug 2023 09:16:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/4] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <c72c242988295b665a8bd235a351806dc112ad01.1690934409.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c72c242988295b665a8bd235a351806dc112ad01.1690934409.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9f6479-1253-44de-00f1-08db93287275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OGaAGDlfQDZNjo+CPhs2fa2AGm6qoWf4d0PpGxVBSkxl1aZ2W7iBeih/PFrFCUOnJD4WYUYfQMDLG/5MwkDZc+iWBBzFu8rC3bDSS9uALcPgJtPmJ8Uxy+mxkwy+OfZuDJqxeRLI61AD5+fu1+xmC/Eu91cyO0JlPefy51s68wqIBjal/E9z65Oe0UpLiSQkD++6lMVpQCml4QILamgN4c9nQA+U6Ryo9BSAGWnm+Z8w7yNZrVBJNQdrWO7dAnkiJ8+nkwGIxRmUNHUH/3ubJPJDgYhR67rJmMAvd5tUafwo8DlylTn4MrmmfAtAo5fVsEnCHsZCXN+6fb/JSFf9Ra/090bqy19+6/K7a13dNobQucXAFOiLqptqwd8w/GIv82oOacq8DiMF3IYJ3F1aaC/g3NgCEeo6Lb0GEwg4Qm/zwMMv8LV57cxU8r9ydkWvPh5cnCpkfOg70U/M282jsJ9J4vN0kGMTeJSSzmXWhknAmRsWGTdpamba48I4wCsDwPd1tmVSd9AjTWJhA4fkkIP92dxWnANUuNXtVW6NdFX35Teee3yNzYdKWgSnl8M9Nmjvbiijy5GNbwUT9toMSPRur/PoLzjt8BntRhLbWEc88DMsMtI+g1bILTbdSCmLRMa/frtJtTVNHTQzibOv0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39850400004)(346002)(396003)(376002)(451199021)(2616005)(5660300002)(53546011)(8936002)(6506007)(186003)(8676002)(478600001)(26005)(4326008)(54906003)(6916009)(66946007)(66476007)(66556008)(316002)(41300700001)(6486002)(6512007)(31696002)(86362001)(36756003)(2906002)(4744005)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNab3FiMDNZYzlNSDExSUFhSUtQcms5UGJUcWV5UWxoZjV4ekVqTU5QVGUz?=
 =?utf-8?B?cnVFNHFOTjMwY0QvekliZU1RYTdoeTFVWmJ5UjdKZER1YzB4U0V6UVV6VHNE?=
 =?utf-8?B?anRYdjV2OUQ2Vk5WTnRNa1VjMkYvMkRGV1UwNWFvMG5OaWg2TWNtMm56Q0ZH?=
 =?utf-8?B?RjhLYWpWdytQY0p4bmF5djNUZ0JnWmU3dU1JTE1lTndNcHQxUERFY2hvV1lN?=
 =?utf-8?B?c1NwdTlHV1JwdjZFbzJ0MlZrZXk0SjlIQjB5TnZ3WmxNdzZOaS9sZU9qTVlU?=
 =?utf-8?B?UE81a0VudnlHNnM5Zk9hcXNKUHllQnkzQ1BrZyswR1ovTXFJbUFpcER5REtv?=
 =?utf-8?B?SEZnN3B1S2k1OHFjdU1DalNuTEZwLytiM3ExT3FBS2NJa1EwSmdBTythNHE5?=
 =?utf-8?B?M1ArTEtuaDFaVnd5T0creGdYVVhSa2ZIWUNlaTlDRjNpNWQwVTVFdlRtYzR2?=
 =?utf-8?B?c1lUazJ0YVU2LzlFOFhYVlZmQUVSOHM5UCtVbjNjRU1TZUM0eXhoQlpGWVNM?=
 =?utf-8?B?dElqL3JSWC94Nk1ha21EM05mdXFraDVTb1NaMGMxaUViakdsNlAyOVI3NGdM?=
 =?utf-8?B?c1BTTWlpczF2blNHaDlDK2NTV0FTRzRINm1Cc28xdWFBSGtwNmtTclhUbGxz?=
 =?utf-8?B?cE9oeTZJdktGdHBsOExOTUNkZnhxVkFSdzRGRERCMzcwSTFROU5QMkVRejlC?=
 =?utf-8?B?azZhMWJVNjJLOXZxd2E5NGc4UVpGV1dmUHNaTmRjMkk0a3FjZGd3dm03MDhP?=
 =?utf-8?B?Q0ZVVFFvcmhBcXNmVlg4b0tSVEJJSjBrb0VWRzF3V0xvYWJiRlZLU0ZMaDZ2?=
 =?utf-8?B?cHBKQk9RdTdNZDNpOHppcEdyeWNUQzRUeXpCdWt2b2NBNEFTZy9zeUo0Q2Nj?=
 =?utf-8?B?NGNXbEVNdjZPeE92SXN4T0orODdQbDBJOW15NVNGMVpXNEIvb1hWWGs5citr?=
 =?utf-8?B?b1JqQmFtaUNraUI0SVFuNW5jMGVwM3ZBWDQ5Z2lzNXlHYlJQak51RlYvSGp1?=
 =?utf-8?B?SittcTMxRlZNcEk4T2NUMU13bWs5SUhLV1AwcW5wV0h1Q3VVZ1RIb012UWN4?=
 =?utf-8?B?aElqNlhETGRmNmc4SDAzYXN4STFONUtCU1dOSHZFQWxzZER3QmlqVmhiS2Fn?=
 =?utf-8?B?MXhERERlc3lrdVRxTEV4QjRFYUhRMk1wc0RTQ24zSTA5WmFTSnFtS3g1Z1Bx?=
 =?utf-8?B?czBXWlJrbE85bWVYbTNqdXhsQmNQSU9wZlZuVUNXcVB0Rzk5YTdRWTRnMVhK?=
 =?utf-8?B?YU1PNnpxRU1kSUx4QXEwK213QVlHdzFRZUltQ25XWjB2UC85cnUreUw5RVFJ?=
 =?utf-8?B?UC9jcXI0Y0ZrQUpmcXFVTzROS0t6UkdWTmg4MFF3czR0SFk1aUdaRFgxbisy?=
 =?utf-8?B?VkhQMzMyNzlpWlo1OWxSYnlDcDNtd1hwcXBHUFVLczF2a3A5MEc5czB0NmFC?=
 =?utf-8?B?aTJwYWZqRnIwWjRnVmdXR2R0NndsbWp3b25lTjJScGpRWjZiMTkyMEF4Ujla?=
 =?utf-8?B?UHBMd2pyNjFpckRLNDRJOUtZdEVONFBNeCtRSkZUTTRlRVd0djFyQVM4WmNF?=
 =?utf-8?B?YjE0RGloejZyZE84WGNhREpwVHg4REIvQms5SHV5clNlQUdaZEs4MnYxdkF6?=
 =?utf-8?B?YTNTYTBXd2tvSjZmdUFTUHA5OFYwZ1BIWEdNcVlHbUZBRml6eHp2ZjJ4cnMv?=
 =?utf-8?B?NUdYN254cSt1SWh0OENJeldMdTNuOEFqekdyTSswK3lRaFhTbUR6Z2kyWVRC?=
 =?utf-8?B?Q3lmSDhhd3VKVk5wNnNyRkNTc0pEMGNKVUdOVHpDUU01UFhJT1E2RytwT0NB?=
 =?utf-8?B?M1ZwWGJNTTVQaXNxdWMzdEhUM3UyQXFqeHozdGxDVjduL0pzUGYxcjdXNUZx?=
 =?utf-8?B?dnNnc2s3My9FUnZ1Ymhqa1VJVlpSc09sSkRscVRIZ2dPTHVHRFpFQVZndU9O?=
 =?utf-8?B?VU5iSlR3ejVGRUJ6bEk1eURyV2hlbmRLMitqSHFmYU5wK3hDMTNzbjFHalox?=
 =?utf-8?B?Vk5pTXN5cllpWGdLdnZZbUxsOU83cnBaaHRISnpUVERXbEdNY3NTVDJXN3J4?=
 =?utf-8?B?YTM0Y3NwcjBGbjBkUG9UZmo3Y0cvTWRTRmdqTG1oY2cvK3ZRRzdyS2UvWHlX?=
 =?utf-8?Q?v3NQBvE/R1DGS56uU4uSyF2PC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9f6479-1253-44de-00f1-08db93287275
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:16:53.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aIwMBP9bxMtRd7ALWMl5DuGqXeZd0D+G0SNgzuFFOHCLxOMQkMZuJKhl/PEUOaWthRSKw+E6xPGkURVkhCBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998

On 02.08.2023 02:11, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/include/asm/asm-defns.h
> +++ b/xen/arch/ppc/include/asm/asm-defns.h
> @@ -16,6 +16,13 @@
>      lis reg, (val) @h;                                                       \
>      ori reg, reg, (val) @l;                                                  \
> 
> +/*
> + * Load the address of a symbol from the TOC into the specified GPR.
> + */
> +#define LOAD_REG_ADDR(reg,name)                                              \
> +    addis reg,%r2,name@toc@ha;                                               \
> +    addi  reg,reg,name@toc@l

Didn't you indicate you'd add blanks after the commas (also) here?

> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> 
>  #include <asm/asm-defns.h>
> +#include <asm/asm-offsets.h>
> 
>      .section .text.header, "ax", %progbits
> 
> @@ -11,16 +12,19 @@ ENTRY(start)
>      FIXUP_ENDIAN
> 
>      /* set up the TOC pointer */
> -    LOAD_IMM32(%r2, .TOC.)
> +    bcl	    20, 31, 1f

Hard tab slipped in.

I'm happy to take care of both while committing; then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

