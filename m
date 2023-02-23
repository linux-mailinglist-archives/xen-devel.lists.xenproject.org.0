Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F96A063B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500175.771422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8qm-0005VC-NJ; Thu, 23 Feb 2023 10:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500175.771422; Thu, 23 Feb 2023 10:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8qm-0005So-KV; Thu, 23 Feb 2023 10:29:20 +0000
Received: by outflank-mailman (input) for mailman id 500175;
 Thu, 23 Feb 2023 10:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8ql-0005S9-6a
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:29:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed01aafa-b364-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:29:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 10:29:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:29:16 +0000
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
X-Inumbo-ID: ed01aafa-b364-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EduRHxigKfJ3930eicl1jwzlATjZ95muFM7ORMpADa7wu9nxZSyYdtP5oMY5cjpqeTsQYwP+3nnPYbhrBU4FHYVGW1eZhhWUSbh29uz90DNL0sdQb6PR/zLY83QxeFilZmfpIl420DLfsqBtKp6AOaUKJ8Nk6gqk8v0xk+mcPL0LtPtRNckCRbAd9u4yusxEntGpoGboaNcaXhNtaSU5b3e8TF/IArMS42/IzDz6rRKfEH66VvM1NJdx9xV3/030OnuVJ/NBdu4ZlfMh89935cHpLPDHDRfTMPPzmxG0m9DIMjinvSuU4im19yUTS4tcx2HUiWVyqcDCkjrUdDMAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnkhHgXhbIc5suDHCbJSLzc4ACbBckevjobrv0aNAP0=;
 b=hBmZ6VkARxhoFe5DT8qU9dnSzhx6qfxLZzh40IKzQByYEfpOg62px0bjpDNbbweenOYRVewnEmihTjVYGarMqIS1n0sPI6fMB9TuS5TsBCnmIXM/oE6L8Q+JrHSTjWbwnGMKZxDErvpvnSL/8bBbz7WTgEOPEonXuaXhqg+jRPVKx5XRj4w3rDj578gp6TtIVztvbMdP+dwBA2hlgGz0yST2LBdUhJaQ8fBpa0OpmQNmsdCKZEm8Yck55noFe8qb3LHvXR26+XBDvLhSTKjbyl3yONQ0bz3thb0agghJBdJgA3U+dDNTa+YHUO/7NZQnvbE037zHGD6Gvz1Cm6clhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnkhHgXhbIc5suDHCbJSLzc4ACbBckevjobrv0aNAP0=;
 b=Ws/cVzd8lgUoaxHzbJqzZghdOboue1qvaqAu5K/doOhgczNJlRtJLvA+1QwiUO5bAd9iyPhdhEDVdiv1U4g9c3ISlivnWeqPULafwQ+2R0W9tyR+uaNVwG2VfDhvp8wVlY6XBKVYFZodsH7hOZKn5ZHOKRmAQL+X4/8saKlnjteoqChTCkAwvaBlL0ciQyreYIe445EUyZB8/ZIB9IYHPq8N6tlUnLuSf+8ldU8biLNp3Edt3sREannN+z2WltpHHVyUESlju0DaQvPIqQOMRh9kJHcZo9Pu7I4lqm+6nk+6LI0rXzGFSLPBtp5VXUflGxODyAjHdyF9vOeHwVGRsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63295275-fd2d-6145-6516-d2dfb95fbffd@suse.com>
Date: Thu, 23 Feb 2023 11:29:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/9] x86/vmx: remove unused included headers from vmx.h
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c751ef2-3a15-4229-d1ea-08db1588d07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3SW8PE5vMSfBT0Bzmtv46LhWFKXqK59Q6aC0FgswyKcrb+bvnbmOnBDfgixoQkn3/gOWsY5pjTELbmXaJJm5vwVGib8PcQYHS/KrWNBTJbwxyiS1k6GvC9KlUCnmH9hZSX7T0tCCmYXgUV5nOPsXBcBv+ZYhnAuO948YcJHjaR1Yo4i6d7Nom/SjkHNSjeUB3E8gE1cdOVafC8EUrc8XlBIqkHsPx0lCwh/1lXmSG6S4PN70GVXZFHAKbheocsbhAMilSgjGmL1czqxlk7Wb23MvJFki3TU97RVi8s+cSkc04rFDAqqKMPVAxig3h8oG/+/CtLVDyTZXIyafY3bEwFwLwsDRovP+hK5ZAxCyFn+OWyQD/q9eapKY8Sjpvf7T7vRhZ6fRSbDsyWQi4JESoyPOIFwmcWTHANRueL1dDxfMcIHoOG4uYU3J+QnQtk3p4MX8+9wrGEXhtBsQ3eIdQwSjLcQ50gQhJbWmL0Jvoh7YDIJyypArt2LvNHnBZ7mxGbc+RJyfepITTTjB8l7NP37O+U0LctBVrDBbdVIHHx8qXEbgjo6l4mHucM9unNrbq01RIunhlR/Cp5pyiTJg+OFDWRebYOu8GQPBhP2Xf/mx23JjT+xij8R2jx0V+4Bp3jBgVv0oUVenfaRad+Q9yeo0YugdM9f1m2BJEFrgVw/u1xCqUAi8qTZ6UUEktfAcKDzN+WNl0Csx8VC2pjvBxV0LRnFT6EUxsjcRC1CDEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199018)(8936002)(5660300002)(83380400001)(31686004)(2906002)(41300700001)(66476007)(54906003)(38100700002)(36756003)(66556008)(2616005)(6486002)(66946007)(4326008)(6916009)(8676002)(26005)(6506007)(186003)(478600001)(31696002)(316002)(53546011)(86362001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDVZNkJvR0tGYnFJNWxOb3ZURnZncXlkWE81UXVnL0c1bmFFb1VObHB4QnRt?=
 =?utf-8?B?OURkYXNnbTljN1g4K1h3MUpienozVGRDNTRqdm9XTHhKZ2dWNTdZSGJnNGlB?=
 =?utf-8?B?ZmF3T01lQjVhU0cyeVk0ZHlndG9LRGtWbk1QSnhRVER6Umx0UXk3SFhWVmZu?=
 =?utf-8?B?U3IyM3lDeDNUeDY2SVkvcWNwNTNmMGJRNEM5R3hyRzRyT2kxa3VacExqK21S?=
 =?utf-8?B?VU0vbFh6aG1sRnZWUkdvekRHbHMxbXNMY2FtSmxHT2dCa25xMkdLdjUyenJy?=
 =?utf-8?B?VW8vTDZEOEU5YTRneEdrY2dQRjBFR0xKZktxNVQrcjBGTXlzTWhPR21sQTBj?=
 =?utf-8?B?aStrSko4SjUralhqNU1UZHBGZ3NtN2dVSGh5SkJIekNvZGRHUFY0c2JFOHE1?=
 =?utf-8?B?VXJSNnV6VGg0d0lCN0dWcUlUUUtTQnI2bTNLVDYxUWx4UTVGRlp5Z01sSTYr?=
 =?utf-8?B?d2N4QjA1UUxjWHFJMGxZUldvR0xUSTdjR2VNT0Rqdll0d01ITngwcEx4a2RY?=
 =?utf-8?B?MzlPL2xxWjVRQ3N2b0wyUXV5Qm95bitpeTl6eWJNVTlSK3M5aDBWMzFycGVJ?=
 =?utf-8?B?bjl2RHc1Tkt4NHVoRGxpdlRhWHZYT3RYUlFCOEJLQ2YvZmVueWI0SnYySzZw?=
 =?utf-8?B?cHh5VjFFUzEyRXMxWDh3S2t5SWlzZi9pVWdMaWM1Nm1qZVd5Z3QrL3hHRXRp?=
 =?utf-8?B?MVAyaTVjaWR2L0J3UTBSemYzVThiVXhGK3F5bUthT25iaFFlVVVPbThPTUdy?=
 =?utf-8?B?OThUNXkycjBtVHV3Yi85aEl6eGxaWnJFQVVhWHRwanVyeXRyZ1c0K3JIZmJi?=
 =?utf-8?B?UGdOMkFRaFNxUll5eForUWJzbFFDZjJMbUc4dkdiMEQ2OE1tZ29LbkVoM05O?=
 =?utf-8?B?eUxhZEVvMVpvV05XWDhNY3RmMlFFYi9GaG5qT2RvZFphMllYcEVGOFZZcWZw?=
 =?utf-8?B?WlBrYmxHU1EvYTBmdURGdmhmSUhtUGhkcTZiYU85NFVFRHRhQkdoUi9vVFBo?=
 =?utf-8?B?YnRsOUtLdFJyWm5yOUpWcTVSWGR1VkFuc3dQclpwRFNOTVlMbWZaL0RNaUs2?=
 =?utf-8?B?amxQNFZuTXFPb053c0k2K0h1Yi8vSVM1dkNUcXZKcUM3RWtiVGNYWHhacUZP?=
 =?utf-8?B?b2hWS0JMZmxkS0ZQbFdGQkpXdjgvWWlnb1RCdE9ZdkNCaGsxU294d3R2NWkv?=
 =?utf-8?B?Q2l2QnMxYng5QlRlYzhWZUROMFc5Sm1hUzBuS1hucmM0TEtDTUZnQzZKcWlZ?=
 =?utf-8?B?RitsY2ZTVWVkRE1WVDB0TTVLYU1PbHFKclo1UHlsMzZHanp3SXV1ajlwSnpk?=
 =?utf-8?B?R0Y3UUJLRUxEY3M2VEpvcE55RzRzcGVtQ3JYcTFYTHU0bi9ZUGk5N2o5SnFz?=
 =?utf-8?B?WFZDR0lOcnlidnNib09wSVZTSEFGK0FQR3ZjczllWWZRYjIzRnF6ZFptRHdt?=
 =?utf-8?B?NWJNRlJoWS9jMTZraklBVUloNlBKZVpHVnZiMVFqbzRYQnNTOUcwUi9oendG?=
 =?utf-8?B?SVJMQno5bjJ3cWFzYzhMZ09qS2paWFgzSzZaOFlpT0k2VUx6ZmU5N1ViR3hs?=
 =?utf-8?B?ekFjRzdKYUdkM2k5cEVsc3RYQk5mMm1iaEw5NVpXUjhmckVXZkNYUEsvUEtM?=
 =?utf-8?B?WmZnNC92M2V4Q3NteExuWEZONHg1MVZIcFJYSU9HMW5yVU9xdFQzRGJ1bkpY?=
 =?utf-8?B?a3lqUWdCT3VvUXZxWmk0OHVIR3NlSkRhZlFpUzFRY0Y1MXBNb1JXU1E2ZmQv?=
 =?utf-8?B?L1U2ZmVvVFF3RHF3SU1waTA4SGxWMjFTU1diL1FxOWR0SlZzd3E4dnVjN202?=
 =?utf-8?B?WjBOZk5yK05CQzc1aGQxVmtEamNWRldJb2VvdXFwZ09idkQ3d3N5WFlkZ3gz?=
 =?utf-8?B?cGNDVHVDSHZOWFRCY0JvRnpHSjQyc1NMZWRheHNoWVJscHpTU1hEV3lZZWRW?=
 =?utf-8?B?WS83Ty9ENFJibFcydEpaTnlWelVHWXZ3QTlVK05xb2ZqYk1tNkVCU3BieURG?=
 =?utf-8?B?dnZwMkxzR0M2L0xLYkJObXBpM2hSOGIzajNURE1sUmpzTmxPT3pabWVlTFVB?=
 =?utf-8?B?aUo0NWdXdHFxV2FRT3N5SXgvRVNIdTRLeDN5Y3JrNXZqMFc0VjJxMU4rRm1X?=
 =?utf-8?Q?+Bf6o22vH1dk4LXh8IDXn5gEc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c751ef2-3a15-4229-d1ea-08db1588d07c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:29:16.1727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpuxOsx4k8z3Npxf/dveBMkpaEYPbQSwL666tgeJ7wAP73biQDFxJRoZY1XoDh60I/k+iIqNkS9qK0eNkn5zmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Do not include the headers:
>   asm/i387.h
>   asm/hvm/trace.h
>   asm/processor.h
>   asm/regs.h
> because none of the declarations and macro definitions in them is used in
> this file. Sort the rest of the headers alphabetically.
> Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().

Nit: You don't really "fix" the build, you keep it working.

> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but ...

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -19,14 +19,11 @@
>  #define __ASM_X86_HVM_VMX_VMX_H__
>  
>  #include <xen/sched.h>
> -#include <asm/types.h>
> -#include <asm/regs.h>
> +
>  #include <asm/asm_defns.h>
> -#include <asm/processor.h>
> -#include <asm/p2m.h>
> -#include <asm/i387.h>
> -#include <asm/hvm/trace.h>
>  #include <asm/hvm/vmx/vmcs.h>
> +#include <asm/p2m.h>
> +#include <asm/types.h>

... can this please become xen/types.h (and move up accordingly), so
things won't break here when my further work in that area lands?

Jan

