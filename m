Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CD679EDA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483641.749919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMIO-0006l8-0Y; Tue, 24 Jan 2023 16:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483641.749919; Tue, 24 Jan 2023 16:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMIN-0006hq-Sz; Tue, 24 Jan 2023 16:37:15 +0000
Received: by outflank-mailman (input) for mailman id 483641;
 Tue, 24 Jan 2023 16:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKMIM-0006hk-Ee
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:37:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ada4bf2-9c05-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 17:37:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8854.eurprd04.prod.outlook.com (2603:10a6:10:2e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:37:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:37:10 +0000
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
X-Inumbo-ID: 5ada4bf2-9c05-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKxeIMx3YacjOs2AkE3BO1GEAB0ngYwlBsCmdpyt8UqtPcbffnCSLe5POc+uiavb8wtI09MG/ZMg1mN2pnAHj1wFMRHPCOZqHAW87hRnJkwrs6jEZSrmcKPligw0s71/aNwV3rBIizQCfCmwRUVjgfmPISLKTxI+uAGQam8lE8t9RSgwXsn8gkHwVSsi2ehl7ct8Wp8JtSoAXkdoY1m+Mfrr6cGdyMDsmL4ECnSN6j3sa28nLisXOybHrkr1SU+ajhSPCpwzlQx2GNQwEl1Z7LIQfiT88OWgm2uyZzIuXXCtv9b22+g7ojs+FvsfKt9F2ipMDCoZwN/XDxWZEndWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuMpGMMbVY6pa6U4dk2gVjIv82xVHwnmnS6Erq1FrsI=;
 b=hDUCXJNKaYglCf198fn86ild9gmFuCNJZ3I/QzPJoEo58cNdSqtrwwSXkuNMs1qgar+QT7/9W4wooSkSrAbHMFDrgD+Fi6bi4CNlsutXFaG3+LBx6FJuqVXvAERhVM9OnCn91/FqDqzqPGfZ4sPMASnkSJ1U+SJlNrh9SUGOi6ayyc0TJqXmC05B3k40lyJPGyCWsSy2KcPhbn+9/p+t2/JGPemSDcqWyWaURvLIOZm0+Yl3xITm4KWiV/J4q0QCxpGofJbWgNCNfxlB6hkSE+oNKkdRsyEjH/KJg4rI1VuIEje+21hfSXXX+l9ByrrdGzzFM+4cXtVoFc4d4J+aFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuMpGMMbVY6pa6U4dk2gVjIv82xVHwnmnS6Erq1FrsI=;
 b=r4NZdBZgu0YnSTyxWirARe+w+xGfUHxW31RQ9ii2k41RdSPU55CUKBmiI1KOHdPPnJkd0VraxW8UJdoPxaEc9XPhVPBeG3SisG3+xpqpDMtLB3JAwsytJEILjC6uHPLOYiO04q7aBBtQQm/zvtWAb5oQKWa6qRwQWv94ZBxKR/rrZ1vvg+x+2Ehq4gA/l+eHZyUPn5pIjxO4t8PDWElRTmCvcy7rNU+NLneLE5GhOjv0lEjHyY0S2ToxvECYM9Vlm9mC1LRyJt1SvzNpLIx6/1DJ5ZeIy9+FRoMPabmkOHJC4KaCzUvfojF/6r5XuzKmEhCXbJhoEXBnzNC2lWjeGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
Date: Tue, 24 Jan 2023 17:37:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c26aaee-a6c6-4dcf-f459-08dafe293d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DBJ/dMjX7V31nuuO1U4+sbt+sWdSRIGolEAKjXAXwQN8EZlOLMgijhtHIIZ5Qnufjk6WDnUflf8scU0awxuZJ5LEPsdtuevmDWDRbCmRaOA5nhK8rU1ozDI8rb51dYlKto/Arx79JclvcNybqu9bRTvl59prJligqcONBnzICrCJTZPXcFYTAu3VUxMywdB1ahvFBICWycA+7ryIaEv2+0rfyG2NV64kFKwZTIEX0QCnIJ82lrVmFltsfEPBGf9NjdAWGkPPUr+Qt6vDfYPJfO9FITHGTXvUi1WZ37sGb0ydmfR1qKalzdXFsQP/2YsgTVygMtDI257d7EiWeKd9u35dJ5zxvhMJpWTo5cmPrdhDiZaX5DnjutfamMgZ7duAPJPwfT0RYJK0wfhqUArCSLar24xNg3btbs6349txwSBNxhdYDBl41ub7S5qBxSVt+Fo406LMRvsTe3tezYQLJeS1oUTjOR1Su2koWGrldmFM8kfgcEamm1Vz+OPwN8NBNISKdXO1Y0ioUBNXz5Xaz/RdB+W+Mq22fLADxr068VbfXvd3hg3a26vFtTpBAv/RX97buO0Ewd7P5abfywL0DMjYCsc/Y7RXBfTqlRh6n/HGXn3kgX+3fhc8CObB7vmmOw2uzbOfpKRzHdUC52o7lUL32GZbVVqDMDt+8Hx0ze7ysJIkFU2et1Iws6Q5TWlVBDIjLHnyyZs62oDFyIKW9oJOimNNe0CtIqN30X3P1fA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199015)(38100700002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(316002)(6916009)(26005)(6512007)(53546011)(6506007)(8676002)(186003)(66476007)(66556008)(54906003)(2616005)(478600001)(6486002)(66946007)(31686004)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WElmZE1GcnplcVZhTnQ5YkpPcloxWTRQbkpnYXBkdVJqOEkxSEc3R0dvV2FO?=
 =?utf-8?B?MlMrTEU0UGxWMTFwUlVLQ2xpTVVjR2Z3dWRVWTRWd0RhUmUvZEp6YzViSlZU?=
 =?utf-8?B?OTFvUFZ1dUpDTWw2eWVDUXlMNHdlY2dwTkl4Q2NSRnRJWHk1QS93RkhKcWJB?=
 =?utf-8?B?UDRBNlBITmxoZXFMRzhBUVZuMytxUWorT2JEdnhjYnVDMmlHUEo5OUF6ZVJK?=
 =?utf-8?B?SS9IRVRhZUZKR2pYTkdUS0VIdEZEbTRXbzhVUWpMTnM3TjZRa09Za2dGL3lm?=
 =?utf-8?B?VHE1SkNmRTRUWGhwWXd3ZnpIT1I2L28yN0plRmFYSTUvQlpwNkNZdG42a0RQ?=
 =?utf-8?B?RVU2L0JlY0Z2TzlrNWMzcXEwYW03THlzNGFWQXBGZ05oZllqdnRJWFFTa1ph?=
 =?utf-8?B?cFB2SzhJeVNCMzJoT0RZMGNTQzlKbmwrd3BobW5lRThDak41UTVrczdtSmJD?=
 =?utf-8?B?b2FBZ0FKVVZyUFZFZTJDMS91cGNhMVhjUEFtcGdPRlo1T0FoMkh5NUFaRXRy?=
 =?utf-8?B?ZU45anVkbjVTU1hsRUVtbmNYaGdMdTZTQmFWaDRpbXI1K292WjYzQ1FKL25W?=
 =?utf-8?B?S3huS0FkQTVqVHVJNWkwN2dxU1plT21oZGtOVjFVR3ZRTHFPa3FSNFltalYx?=
 =?utf-8?B?dzR3dFJWRkw1VXdybnhaTkZUYXVlVjBqN0dPM1JVNUlreEF2V3lURG1iV2cw?=
 =?utf-8?B?UlhZS3g3NVkzN25xUXBoTGZGSGgwbmVla3dwQ2hMTGwyUVZDSnQ1NVJJcGtW?=
 =?utf-8?B?MjlWelhjcHdzWXV3UFY4M01ZNHNTamlXSmhLZXJXUmVZYnFnY0tlVkZtZlpS?=
 =?utf-8?B?dGhBalUwbEtSREw3OEowNCttZnc3L0hRMlFaNVlGMW9EWjc2SzBtTnZYSk5G?=
 =?utf-8?B?VU14YUIrU1hXZDFsWlI0WjZJb0U4NmZjMHZLdmw4TUwxeURJSHUwbm9PUEtY?=
 =?utf-8?B?aWxqd0d3bGs2T0ZVNFI3VSs4QUQ0SjNReS96ekNqaC90bmxqbzdXS0poVkR4?=
 =?utf-8?B?NitoanJvRUhtZnR3M1p0WTdMN1hmdlMrYVJyQmNFcXR2elV2WEpCNnVtNHFZ?=
 =?utf-8?B?bXBWV2pWN1VRMjlKbGFjaytMTXYxZ3JqNFBGclV6M1JrWVpCWE1rOXBuSk1F?=
 =?utf-8?B?QU5POE9Ud2NkSy9obFE4TmlOSHp6YnAzUng0Ynl2UzRDWmxMczNOV2lhVEJn?=
 =?utf-8?B?MGNHT0ppTFh4ZmlRYzA1NVdWY3Q5SVdrNVdWWDQ1NldwYU1uOVhIME0xNThl?=
 =?utf-8?B?dXpFSXQyK0dJMW9VM1pFTXltZEc3NDdjVHJoaU9US1BMZ3hGdG1SNFV2RjF3?=
 =?utf-8?B?aGt4MFhVYi9Za0tTWThTcTI3Tm1mTjZJaFVKSGZid3orMzIvTVJXN0JEd2ti?=
 =?utf-8?B?SlBoMVNQM1VIc0xIN1hVVExaY281QVFNMnp5WlZCMmJhNFUzQkgwRjFLUWR3?=
 =?utf-8?B?bEJOdDU3Um5wekNMSU40MWl2QzFydGY5WWh1UXRhNGgzSHhOWmRWbVFqT1VM?=
 =?utf-8?B?RzlBYStzR2E5anZ2allTZGFCeXIwMmljV21ZMWhEaDd1b29aU0FaMktxZGs1?=
 =?utf-8?B?djZXUnRCeTFRMlRGWXFWaHc4eXBlbnlYdEMwQWk1T3ovRUVPVWd0TXpDeEdo?=
 =?utf-8?B?VzdEbkowSjU4Y0FGYjFxQ0FvUjdXMzZyZ04vU0owMWZEUUkvYjNWZ2RyWE14?=
 =?utf-8?B?ZE1MUG5tM3pGTjBjSy82TVVDSVptbEt4a1BzNmlVQUx6ZDFDczZxOElWdDZP?=
 =?utf-8?B?Z0huN200T01pb2hCVHJ2QlpPZmI2Y2F2WGtaRVFXZFAxYnlRN1NZT2VTNkQ1?=
 =?utf-8?B?cGcrWTFaR0dITzlQdGdTWWdCRzZHOTFEeWNoNGxURks0RUJ5TkxUTlVIdXYy?=
 =?utf-8?B?UkFRZVJaWTkxejRpZXpWY2t2Njc5dDNHUWV4Um4zWXpNOElTeVpobW1EdXp1?=
 =?utf-8?B?ck9KYjZ3M0R6NGxia0xBR042S3NHa2FZSW51NmRMYXZWNWY2aC9LbUdYb3Va?=
 =?utf-8?B?c0h4NjBvNmtFUXdlYnE2dURvM3JIRFUzakdkb3BPSityT2g0MncvdG1tbGl5?=
 =?utf-8?B?RDRZd1pwSXhlR2x2WC83d1NLWlBQdnhrN3B4NVNEcUYyVmtoRjlScjA1N0cx?=
 =?utf-8?Q?upyed03tcTJ7DrBTlfgs9f2pX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c26aaee-a6c6-4dcf-f459-08dafe293d28
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:37:10.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0B2Q3EddL30p1nC3rWbXVFwnknCupNlWpLWwbEXCjp3HRa4l3q7y4rlbOfiTsrzHqX7UUQGCUBjh1CAhrKngQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8854

On 23.01.2023 16:47, Carlo Nonato wrote:
> @@ -769,6 +776,13 @@ struct domain *domain_create(domid_t domid,
>      return ERR_PTR(err);
>  }
>  
> +struct domain *domain_create(domid_t domid,
> +                             struct xen_domctl_createdomain *config,
> +                             unsigned int flags)
> +{
> +    return domain_create_llc_colored(domid, config, flags, 0, 0);

Please can you use NULL when you mean a null pointer?

> --- /dev/null
> +++ b/xen/include/xen/llc_coloring.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + *
> + * Authors:
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>
> +
> +#ifdef CONFIG_HAS_LLC_COLORING
> +
> +#include <asm/llc_coloring.h>
> +
> +extern bool llc_coloring_enabled;
> +
> +int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
> +                             unsigned int num_colors);
> +void domain_llc_coloring_free(struct domain *d);
> +void domain_dump_llc_colors(struct domain *d);
> +
> +#else
> +
> +#define llc_coloring_enabled (false)

While I agree this is needed, ...

> +static inline int domain_llc_coloring_init(struct domain *d,
> +                                           unsigned int *colors,
> +                                           unsigned int num_colors)
> +{
> +    return 0;
> +}
> +static inline void domain_llc_coloring_free(struct domain *d) {}
> +static inline void domain_dump_llc_colors(struct domain *d) {}

... I don't think you need any of these. Instead the declarations above
simply need to be visible unconditionally (to be visible to the compiler
when processing consuming code). We rely on DCE to remove such references
in many other places.

> +#endif /* CONFIG_HAS_LLC_COLORING */
> +
> +#define is_domain_llc_colored(d) (llc_coloring_enabled)
> +
> +#endif /* __COLORING_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> \ No newline at end of file

This wants taking care of.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -602,6 +602,9 @@ struct domain
>  
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +    unsigned int *llc_colors;
> +    unsigned int num_llc_colors;
>  };

Why outside of any #ifdef, and why not in struct arch_domain?

Jan

