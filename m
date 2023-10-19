Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FF7CF3FA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619044.963560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPHC-00071Y-D0; Thu, 19 Oct 2023 09:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619044.963560; Thu, 19 Oct 2023 09:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPHC-0006za-A1; Thu, 19 Oct 2023 09:25:10 +0000
Received: by outflank-mailman (input) for mailman id 619044;
 Thu, 19 Oct 2023 09:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPHB-0006y9-1V
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:25:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f2d2d2-6e61-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:25:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 09:25:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:25:05 +0000
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
X-Inumbo-ID: 64f2d2d2-6e61-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1npiKlL94fttQJAc4HV9ugrDb0pIvxyRTMbohoj7fQhmd90GpeEdcw+HnLAJnpH2zLKQPUb3/OtGzOeL7MbhQOSEXfasXAEFaxxyIZZwGsW/BkIsOimMt6OdXEtEhoNaQn60wOcNCRwsU+64pWpGdJP6KCdCndzpy1yOvNfYEZ+AJa5IKJjVyCOTRXDmUvBLN1tiCdleGdanBIu93LI6ncI7xqhrU6UU2qa3/Vz1i/tS/im/+lMfdgtZnjRJ7SfT3czr3O0d6rNbGsehXdpwInDNM0crnWNAyrpt0ZZnQXF6HiuQRH/JC4AZ8mfTE0GIsTvrnDfp3SVzdQHXssTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5DRb+w9UNyV0SEeMBDrQ1nJFbtoS48VriyVBuPcZPM=;
 b=BEnpayKg09Ofp2XHa1hEkRhxNKuhU9nvLBloophDXYUa35ZXNS1qaRCt8VRRZDo+WMXai+KzJN4MfaIfmMVOaueOW4TGFDf325Iu5YfIqQKFIID5Mz8bRXSp+Zp7+utqo9yCLpcYjkBRPKk7V5uVX/CeLq5a1h2iChi+2C2yqH4o0jBuCGQjujwWGqlbt1+ekXW5I44iRyVqep+92UFRTrIT90yOa7aPilyXggqluowoQIgIns7Rd5sTx1MZdxa1nMlGIIKQX4XQFa6wJgjPaFb71NzCG5tng6ksjZOgmRByFkOIyVJDSnw5w4TmUTQpCntg/QIx2E5Barg4fipknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5DRb+w9UNyV0SEeMBDrQ1nJFbtoS48VriyVBuPcZPM=;
 b=BEdgcg7uRARCU4wqudUTEdKoX47fO2BCnwlXP7Z8upWOKQGh3MSL2bus/zYJIJl8YxOYQBqQYVlwA7SZ99GT9rdjNKpPAEQjcDJ9lPyljlGya5SsBZofqUaE0urltzKWJXLm597RjCX8mzUXOpR1FiPDWznOBRoyNMN+Vf0ziyT1WxYBX76lIqt2b36sbQkgdsDkuVvz38/m3k+R/MDHiRkP0I8uYZXCK8qv/lgAQpYg6y64TqNSCfcyM5L6//Y2Efr6jD+qYoRQhj2E2675PePNAn8OiJNTR1JPo1gsNWb+yP0wSGl/x+JQY/6h71BLGc4oFm1dNKAUyEfBxiaZ5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57e16e1b-e306-fc8b-37fb-c770d8ea5fed@suse.com>
Date: Thu, 19 Oct 2023 11:25:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 09/29] xen/asm-generic: introduce stub header iocap.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <df3a94a5670b900ddc1a2b7e8142555a09571b52.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df3a94a5670b900ddc1a2b7e8142555a09571b52.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 984abc25-d85d-45c1-80bd-08dbd08547da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4KpSCPnYHX3xs246NWpa5fblS4fNmzemrElGkwstftubV6WAEHfCAYpTg6YC6UjpShDkhapdb1wZIU40zQAGx8+lpe1EUnUgmBc6HszcfmHACLWNnP12qYMtx4E7QtCWc9vwrZzy2ndgdBr9IdYQPkIzw6yhxd6oGJ2iAJb7rW/Li64cQCZET/mxRPh56Fo/tqQO7cVWFmX/hKvMcnvqExtW7y+xmt14HvhDXo3pMI8r6Z+OFWuC7patrWodyDdI/+lQpOGJscrrTpVdjYtI8e7Q9rty0CuJBez6cuZCsCMcteDR+LD5EW77cgRJsqBFNkI7aBlEnmb3e1vku6MqNmRZ4n3XjPFsFW9L+2Ca5mvqUk9JVMSPIfysPWKwZLTzGhUQIlHi/wgXOI2xc1gt0nMGuIE94OKl6EpUo/yidmSBPpwHnCq51rR7EOAi/nX+LjvuTkmdv2esQAIdduxmr+0pUJvb8ucJtRdVFLG/fDH6O/0uJyuMuMxHP+9S9WFoe9dvrgeM1SjE9J+nWiuWkCyAf9SfhowcZw+NbkAq+tp9cy+gSAVFnXasRt/TWirU4jars8j5YyHxNOq2IiKMUJ+tcGH5aGRZfBYDSO0uBSQTQWR3ByBXMM2BUocL0tc/3ksrgRwil/maqu8vgsuKcpufBbMSgSAkh71Ckn2THSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66476007)(478600001)(26005)(6506007)(53546011)(2616005)(38100700002)(6486002)(31686004)(6512007)(66556008)(66946007)(54906003)(6916009)(8936002)(4326008)(8676002)(86362001)(4744005)(31696002)(2906002)(316002)(36756003)(41300700001)(5660300002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3h3NDFyQmMvajlwVXp2OUNtbElLcHNGMWVJZy9ON0ozZHQ1eTdNcmpqMHBV?=
 =?utf-8?B?c1dKQk5LeHdzWWVOd1pxZGJ3Rkt3dW1ndUZPSDErUFowcEtNcElEQ0xobGdq?=
 =?utf-8?B?dkZiTWdJMERna3RUenpkNmZ3NlZCQk5hZXpVdmk0cU84L1k5NWdPR3IvV25R?=
 =?utf-8?B?Um5iZTROaGNRa1pRWVFHbEg3azIrSzc5K0Z3NmhaM2NzQkt3NjhKWjVuNDNL?=
 =?utf-8?B?Y3ZIS0NYaUN2SDdsdEg4OGxCeS9ueTVWdjMzY1VjSkVoQTE3RTFHdU53LzZ5?=
 =?utf-8?B?aWphTTJmZXV3TUdmY2dkMFdYaFRFY0VHK2IybU1uUDBUYW1NSFhsWk1oN2Rk?=
 =?utf-8?B?bXI4UzFPOWswR2RUOGQ4NFo3M044RWVVRkx0b25yZ054QmF3ejNERG1Zbnh1?=
 =?utf-8?B?ZjhCUE1vUm44dzNTbngvOWNHMUNBRnUzQjRIZDFTelZIMnJjeHk3cTVBQ2g0?=
 =?utf-8?B?SjNDSEtNcytkUG4rb3FuZ2tKeHg0QUUraXNDRUYvRk9KZGMvNDUzS0RjbEZY?=
 =?utf-8?B?NDBiVWMyQlN4UTZOckl3eWFUV1BoZVkxYkFmTThlRWR5Z1F0MDdxMDFZd1A1?=
 =?utf-8?B?L00zdjZKaEJ2TEp0RW9QU1ZyQlM4Y1dmMHhYMW5GanJzdUhocTh1U0hlV1lx?=
 =?utf-8?B?ZVIvdVYrV215dWpBODJlanU3bUJ6ZUk1UEMrTGcvNTFlS2ZFZk85VjNvR3pS?=
 =?utf-8?B?Vmd0dUN5R0hocEZCRW1hbW9ZSDRVTlpTYnVTaUc4SVljQVVZUzVCZnFRdXls?=
 =?utf-8?B?WVdrbFlOM3FKZzBpRjdPT2o1U01CUjRJc1Jod0NBQnZrK0xYZnQ0NlZyS0tJ?=
 =?utf-8?B?RWVDSHRPa1IxdWZ2MVlLdkMvempWNXh2am9sTTFROVFodStSb1AydklIVTdy?=
 =?utf-8?B?RUhBVVZaMm9EMGYvOCt6bHNQZnN4elZCOHhLb3BwaHhlM2VMT2trUUROVHZv?=
 =?utf-8?B?N3VlQzdNNUtoRktPZHRXMzhwWWFHZzhkOFRrMmJoOE9FWXlkVktEMll1SUF0?=
 =?utf-8?B?TXlpbmF1V1Jtc0VpV1RqcGJOclJUZHFIVDVnZWdiOVBDdDdEbDgwT1hjWnZV?=
 =?utf-8?B?c3V0cEwvZVVYQVNraG9lZ1J0TnhiaEZBUHdNbUlYR002eEY2RDJtNXhJNkI1?=
 =?utf-8?B?dE9nZ3RyTmpwemVLSCtlV21zS1BRalQ1WGkvK3B1dS81M3EycWpuaW9rRHZX?=
 =?utf-8?B?UnhmWVg3ektTeVdWdHpXcHFOOWpVMmw3Z2Q1Z1g0KzVuTURzU05INk11dStR?=
 =?utf-8?B?NTIrWWFBNi9RaXFORzJZOUVyejlpemZJTHAraWxPZ3hTUWF3emtyQ29wdVRw?=
 =?utf-8?B?YkxmZWlwaVhXMVNJVm1DNzJRN1pHTFBxT2lqTnZ3MlBqTExERE5kNFhJbUIy?=
 =?utf-8?B?SVRlQm9MRE1ocjIxRU02TG84NDAydGpTc05sV2ZqOW1zQTcwTjhJRldHYSt1?=
 =?utf-8?B?Q1dPRnVkbUlMdGFSZ0IvRCtwQy9tMC9NV2E0N1RpNGVHYVcrRnB0d3hNWG4x?=
 =?utf-8?B?WFVnQndLQUlDN1JFTDBOUGF5N1RkcGlEcGZVUU1nanhkVjlFVXJMejRRUDlE?=
 =?utf-8?B?ekhTeTZuQUsrV1N3cG90VEVlZE1SdCtCOFBGdFpnZi9TYnJWeUJQZ0h5WTdr?=
 =?utf-8?B?ZmlkZjh1cTJBR3JIdGlwSFJOQXZTWUlZQTJUK0xYZkNRZ0E1MVhpUHdDZnA1?=
 =?utf-8?B?dFVMM2d3MVMyM0JQMlFialVjcU9lK3VJeUpRRHFtS2xwZ2k5MjJ1VFhmelJp?=
 =?utf-8?B?aElabEVGSXppUzBBNCtFcVgwd2xRd1RPWi9pSURGNnkyeGwyMGIwWVB5b2ht?=
 =?utf-8?B?WlVjVUw2Um9MYk5pMWFoV3YvbHZ4c3VKMU53MmhxaW12YXdza2htNjZXQStX?=
 =?utf-8?B?Z0cyUUZubnZRVjZXQjByaXF5bjR6OHk3RkMvUGk1OFFnbzNNYmZrak9qYTVG?=
 =?utf-8?B?TE5zU00ySHJDcEl1YS8wN3plM0QxOC82WTVZN2hTdStWbUdWSFdFcFIzN2Rk?=
 =?utf-8?B?M0dLa0h1T2tKQ05QS0ZVYmh4SUQvSlJhUnpNTzJuQUpLUzJMbHp3NzBvek1D?=
 =?utf-8?B?OTFCNHoxb2ZhVnV1QURxNU16Q051VXNZNXFza3VoaG9nM2xmR2VqdE9wYjEy?=
 =?utf-8?Q?wgJ/QW+4TouTyFzCcEOARubz5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984abc25-d85d-45c1-80bd-08dbd08547da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:25:05.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igde8e8KW+H3zpjTJUNxTutrGNV+HyjQ1uBQqHL9qJo2gZudhm9z3rENmYlOHmlU76uUTUVxqu3rFjif8OvHVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/iocap.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_IOCAP_H__
> +#define __ASM_GENERIC_IOCAP_H__
> +
> +#define cache_flush_permitted(d)                        \
> +    (!rangeset_is_empty((d)->iomem_caps))
> +
> +#endif /* __ASM_GENERIC_IOCAP_H__ */

This again wants to eliminate Arm's header in exchange.

Jan

