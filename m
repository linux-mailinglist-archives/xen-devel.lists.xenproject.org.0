Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B378C6F8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592289.924970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazQv-0003Nc-Ot; Tue, 29 Aug 2023 14:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592289.924970; Tue, 29 Aug 2023 14:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazQv-0003LG-LR; Tue, 29 Aug 2023 14:11:05 +0000
Received: by outflank-mailman (input) for mailman id 592289;
 Tue, 29 Aug 2023 14:11:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qazQu-0003LA-JO
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:11:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e345a837-4675-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 16:11:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:11:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:11:01 +0000
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
X-Inumbo-ID: e345a837-4675-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZM5pZWvl/o453NAe0XtaFWVs2ulmpz75m4PfvoKYzDZspl4bu1aoPc24bCRwNKywCZeL+BUGBoT+lRoRfbopuCaF8TV/Ju5Ejm0YHT7O8rAUw7swYeFhxtk5+BRlCrbpbKZ2TO61+A9XbiHYvw4mf+m0zk5vn5WLqdCLJ7n83fRKxxBNq5Y4NduGEXbUcDmUThztUy2fBdvr9hXh/ZGpcHO8u/xXRZcFHuwASYK23uIqysSo/zrZsoWnQmEK1LNVCnqCgIjTXuDaAbx/zOrZ0XxYPfDzhFOz3/nR9b403xLa4Wcl4B/eoe1lUn1BETOTGXzRcq8PVrrsckudCc/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggFts29RRNVx8UBKPrptteloWQrKbmViEBmj/ZzO1XA=;
 b=jZUwUQ8JqCmhFtZ+PFEz8uHIeA2xgHD2uJh6/JFTiOp/PYChzG5lRueeZy73qCCGSL8U5uJ7l3gzP2WN5T7VhHTWgz8vPkQgRb2156nkk5DbPwrIiiCShsWjLUwFH28JaXO7qSa2SvjxRi6pxEn3VlbrUV29L+aY1cvEPq2TicQEHxXdo3Y0KYDUb9VmuIxZerfomsVZBx3PX/dQNy9sGmOMO72WKR+6wjUimah1wa78mjdJsuuqaAi89+iOAi1OFJSE3bf/jGrV52uVKw8F0ti6QwfzgUit5rnuWeR4ppb1PE0syRSPiNhREhzEVPPf/mSptRkWKFkhknQ5aPaA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggFts29RRNVx8UBKPrptteloWQrKbmViEBmj/ZzO1XA=;
 b=4BhO0WotooWFMFY+kljnv6KiuGDyyCnq14zlEXEoLb5tY85Z7cEfJIr39055fEM4/VdCUVJfj3J2g/eRzTOJpjLfDC3c91bKtFTEoS7baV8HyAz7avohBJ8lar8PeQWLPov3x6M7f0TGJCiSjFdj4+IOeWeO872N3/XdZGAkA4u+YJxA4TABEVpjNX6b4i5RORwd319Js+wBzBYr4/2502vQoWky51IVxnwlKYl2nSrjGhh+Q8tdDASzSfXd6kV/x2d0fIC1bxbYYbdzbreIPgDz2/pRFOCXmPbk6qqzCnIj8W7tKrWVfn1qS/tnzjTzfGaGFbu4wIqMFYe59gvbsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <959d2a24-bd66-8235-8497-8b662259fa80@suse.com>
Date: Tue, 29 Aug 2023 16:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] x86: Introduce new debug.c for debug register
 infrastructure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829134333.3551243-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: c959d55f-cd64-4a2d-c1c5-08dba899c657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zD7p/xBNaYoJGE8NFK6LWN8Jy3dGgKcOjUILHm/NVjr6A9X+z39YwWsCnJ5F6zDf5wsVhs1hAC7GOqlnATkOdFGfyuxAMxHDloxyR0Zl6/I/4Et9MKrQE8kG+StJkJvuR5PdvNOSPotmeBDvEGlyR3IgkN2IP8IS+PA+BuKXmDt2mlXAtvpucrz4QYyQ6lonn1d4VpwmZrbKL4vhq3KgjgleGX2VtZlvc3YOOYY5SArY0I5/CHB2B6fqkuCPkO7RdwrE4h5Aqsadb+t22oFNYQ0ZXF0ONLWpf9cIYEEeOQyrKWOpDHrH1iu3h2Txj6wQZQcdOSwUhIJb+0/TnKk4aHu0plnK5oMy0B92dOUKZpiYeh+7YOLuFjtaJtGjUkpHg7ixur+xJXg+WVNQYpyL8xVZHjb+fCszhMMJR06Ch8He2lzROTK4EHg1EdwYEGunJcUbxSdL1ozfhMIKrOppfLTIENUpM04ZLNkna0pfhi+blNNiSXla6m9atj8ZlvfCA7XuGD/tAgQiUHZaYfDmKVAU9c7s6sKNk7Px3lWYhk60EgNryptkTPwZenYDzjOY8qdU9TbSCJW8K+RC3gPHL6QFO2wPlbrz0WmARa1+n6aAvNeG2lQrZM0pNywT0363pqIBouZ78XffRR0tHPd1sQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39850400004)(186009)(451199024)(1800799009)(6666004)(6512007)(6486002)(6506007)(53546011)(83380400001)(478600001)(26005)(2906002)(4744005)(316002)(2616005)(54906003)(6916009)(66556008)(66476007)(66946007)(8936002)(41300700001)(5660300002)(8676002)(4326008)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHMzM2llVTJUWGFFUmN0SElKTkFIUm1ORGRXUHNjMk5lMEV3SGJNOUlLajhR?=
 =?utf-8?B?b2QrNmFIcjdCL1pvaE9GY0VqOVlOQTZZWHVqdTVyWlMvaHJ3WjNnd2E1YjV5?=
 =?utf-8?B?TkNVNUlRemFnalEzVVQrRDloWlY1K1RiUmFFcG9jQmkxbmNFeG00WVpRRlBM?=
 =?utf-8?B?dEtMOS9zQ3VncDZ0cm9SbEJnVGJzaDBaRGdabGU1QTBVUkc2UkI1TnBtTDNt?=
 =?utf-8?B?Q0lJWktIeStWSUFOSUN4ZDNrZWpRWENpTFE5MFhqTTVzVFFMTkE4b3N4OFNG?=
 =?utf-8?B?UTRySitVSlFSdFBhZmw2a0Y4TjNDa25WWTFkUDRuTWgzQkU5QmtZUVFHS0Rh?=
 =?utf-8?B?emErdUFTdnlaaS9ia1N3VDBNbWpPZmZadXVLbmZmNHcyWWNUWUczUHVZbkF0?=
 =?utf-8?B?Y0VkTStjVVY0SWdDZ2RNT0ZVMXVORmlEUDUwLzdMSmZET1NORXBJRU9YT3cz?=
 =?utf-8?B?MkZrNHFQS0VmZjV6dFk2dCtNNm1oL2dMak1aSXJaOVoxVjNMWUxNVXRubEpr?=
 =?utf-8?B?SWZHNXRrUGtPOGd0dENGQ0F3ejdreEthM0xLMEdvb1ZaNEN1SDJiOXBINEs3?=
 =?utf-8?B?dXErVmV2b0YrVEI4SXpqanZNem9GckRMeG1LT1FFR1E1Y2c0cXVkeW8vYzdI?=
 =?utf-8?B?ZWRBalp2d3Fxd1VrbTR4RDczbzgwdFpVay8xcXpabTArVVpsU0QzZjdoUlVC?=
 =?utf-8?B?NEJNajl0S2IwK1dPL0xyYUhYT2VmLzZuRkpSaGFDMER5NW5MSTF5cU1NVXlO?=
 =?utf-8?B?Z25yYm1EZmNSUnBqbEdTdlFESml4dzdYcVl0aURhdnQ5K2sxeWR5ZDB2bHFH?=
 =?utf-8?B?QVJTS1RpRFhyVGFrbjZNRGdvditSVHRQQmFwMEhxTWtjRHVraTlreXRxbFVv?=
 =?utf-8?B?N1BFeU4yTjVSVGswZm9KciszMTVvTXRPaEJzWFhNdHE4c21ZMFdmSUJTNGNM?=
 =?utf-8?B?ck1NbmZKSkFOMHFoM0pJOEM4Vkd5SEhiOS8vU0hxVmJGVVJWOWpYUyszUXJC?=
 =?utf-8?B?Zk9RbHFXaUR0cllDTlZSaEVOYVJvdFlTT05BUTVNRmFPa0NQWjVBTVBNMlBa?=
 =?utf-8?B?eEl4aXdOWWlEVUhsVE8rZ3hGYlJEck9xRWc4QkNVOEQ4NC9tbnl3eEIrV0JB?=
 =?utf-8?B?SmpNNTNidFFYOEpoSlJLTmFMZTJNdDNycHB2SjRRdngyc0FBS3JkdjdNTHM5?=
 =?utf-8?B?clZQbjdlS2pPaGRIR3Z4NEV1a3oyNDRLR3ZKVzFuVzB2YTU4dDJWbEJwZmtk?=
 =?utf-8?B?UkFrV3phWVFVSmphMWYzWEI3MlVYNUU4Qy9ZNnRUN0k3bGxZZ1pTQjBSUm5w?=
 =?utf-8?B?UUVGOW9uc2JiN09iR2pGUTMzcURXaHorVlU3cmdqL1JoMlVJZTNDZ0JPaDVS?=
 =?utf-8?B?MjJubnVldi9FOU5lZVY1cVBjTGk4WkkyQTVwdTlMaG9DY3ArRURwWGZtVjN1?=
 =?utf-8?B?TWh1dTVZOGdkd0w4bGxxdU1ha24xQTd6NmpBdkF6Tk55dWxQOUVQM1NXMzBW?=
 =?utf-8?B?U2xRYzlvbGYwSng0RTdzd3cvQVlDNHUwS0t6QzZpek83elF5eTE3Mk50U1lM?=
 =?utf-8?B?bU9xYklTSlBoQVNuNi9hTCtqU2xXR3ZlbFFvUFN4Zi9kUkt2S1V5VndZZFF5?=
 =?utf-8?B?Q0kyQlhrNmtUdzJUZ0lTMGlBL0NJYWQwekN4Q2dsZFBycWxKa2hjL1B4VU9y?=
 =?utf-8?B?NURqUVlKSUZITkNYVWNiQVJNME4zcUZ6QWNpcGIvcDFKUGFXdEwwenZKMEp3?=
 =?utf-8?B?NDVPdGJ6eEd2eXpTUzg2VTdnSnAvRHp0WGhKL1hHaEcrL0Y3OFdPV3QxbHZz?=
 =?utf-8?B?UFBteE1pYkpuUEZLNklndFJzQmdzaEpXeGpjTDgxOFRaNDhrMkF5b1J6ZEor?=
 =?utf-8?B?VlZDc0dFVktKL3dkM1R5QnhYTVkxeWMrVDl4MmhYa2doTVNXb1prLzI4YWZv?=
 =?utf-8?B?ckpJU05tQTFKcDBwdmJ1Q1NON0kvbTJNWjR1OUU0NUs0V09pcE5ZZ2tQMDVR?=
 =?utf-8?B?YWZuUlVkaldoOGZ3T2Q5UGJRdXZ6eEc1SEVxRk1VN2YzS3lCK283UHZVcGh6?=
 =?utf-8?B?dk9GUzFtUkpaWWFMdDEvWU5FbjJ5MnUxNW8xTlVDeWVjdnpvdXVBa1ovc3pw?=
 =?utf-8?Q?CFplb/M/Uuz7le296DOtcnaAK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c959d55f-cd64-4a2d-c1c5-08dba899c657
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:11:01.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDkWlsRkd1AeeT2VPwww2TLI/buPYxou/xpxSfISV/olWQbG97EvMhKRrLBl6+cpLMJ6WbABy3t+oLxOAHLw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713

On 29.08.2023 15:43, Andrew Cooper wrote:
> Broken out of the subsequent patch for clarity.
> 
> Add stub x86_adj_dr{6,7}_rsvd() functions which will be extended in the
> following patch to fix bugs, and adjust debugreg.h to compile with a more
> minimal set of includes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with (nit) ...

> --- a/xen/arch/x86/include/asm/debugreg.h
> +++ b/xen/arch/x86/include/asm/debugreg.h
> @@ -77,7 +77,18 @@
>      asm volatile ( "mov %%db" #reg ",%0" : "=r" (__val) );  \
>      __val;                                                  \
>  })
> +
> +struct vcpu;
>  long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
>  void activate_debugregs(const struct vcpu *);
>  
> +struct cpu_policy;
> +
> +/*
> + * Architecturally dr6/7 are full GPR-width, but only the bottom 32 bits may
> + * legally be non-zero.  We avoid avoid storing the upper bits when possible.

... one "avoid" dropped here.

Jan

