Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BA76B5A7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574176.899395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpHC-0000ro-MC; Tue, 01 Aug 2023 13:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574176.899395; Tue, 01 Aug 2023 13:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpHC-0000q8-IG; Tue, 01 Aug 2023 13:19:02 +0000
Received: by outflank-mailman (input) for mailman id 574176;
 Tue, 01 Aug 2023 13:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpHB-0000q2-2y
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:19:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c2d523-306d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:18:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7422.eurprd04.prod.outlook.com (2603:10a6:800:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 13:18:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:18:55 +0000
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
X-Inumbo-ID: f8c2d523-306d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKn/AfZmnsrEoQtM6IrgY6bYG/BeNaSA2gMBkx/uYbPKfW1CKGlNGswoU3ro1b+bOD2gQXxCqGjpqJM+ovUwmETeiHqA+DCOSx7wIZigtcwObjg2Fk7spNVnlbRbDhoEL2DLyjaOjxQcd0ZedSTzgjGMJWKTo4jymEz60p+Jx4vTgTYfwzJMO5416RymnJF1A4F9LMlbEh1ec5mOdDwiFE7WRXQtt3Syyi3wOnDfF8pHabstMfc86OnrHM0+s2G2OESpgn8ubYXYR7BeXKqQ4Kok0UPixojv+Sn+LlmdGfE3rDIaJKyYkXPzgh5b2ad8qJ4F82D1uxyqJHmXHy6QMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAxuY/+Juw7eCN2o8a+hTQFX/OTGahEDYva8rf7rjck=;
 b=eWNmFadFhVjHBatpD1NUQAjcTrXP3vCekoKu0avIGh1Dq4BW17PxS4ZHymU0PrGK6FyM23VJRaj1XFDgSdkP+BmW0/shw+wkPkQkdet5m56rvy/KvNbw2qvXYN7GV1HlDNv/rvGy5wXOs7degJBVTqH4yy4L1pO5YPCYzKenj8mXvRYNyro2GoH8KwxDNdmjdg+44BJGIfHwz3AtCEBNvp/WGOnX0srh/ondrLSPzn3aMkRpnLx4Ose2Kwm7ardyMdpm7Sm6Jy1w8SQvabYMekQ7sG9+xZTm1j4J+L5LbNpsxdtnQrjF5TvlymG4BSQQUe4L01wRYYhMUNGCNxwiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAxuY/+Juw7eCN2o8a+hTQFX/OTGahEDYva8rf7rjck=;
 b=MTwU78BVaAazfpkiJWmVE/gvNVyQuFL3qsgYBBbhfpD+7Mu9l6uddc8PrdHVwnjVB8uUyHZsD5/75UniYYdNQk2k8q12AFo/Ee5KnhJpTKqNddfQ7bTgCrXRT9RLFMdpQtV+kMBESQ9RZO8SEf0MK2m4qLqIYwYJAB2WAFJR0M/PmfwtdsYdlVx0b8E+mU4ch9yoccJd/0sBmDbTEAH3Rupu0tXzthGW9BNn8yMySDWTym6PtXfKb/eYkJ2hUClVJ6YUMWocSyXSyrR3B8HaIaDYa/wrWS26zb+DX8AWyjkZOt22+ciIk9c6UGhp8Ua2QxRTQMFxeFAgCgnTwzt6lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55e1391e-a289-72bd-f663-62276cf4b065@suse.com>
Date: Tue, 1 Aug 2023 15:18:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <ed166c38bbcf82ad58a14353a880d1e208cb2ff1.1690582001.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed166c38bbcf82ad58a14353a880d1e208cb2ff1.1690582001.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: e19c6a46-9457-4c24-ebdc-08db9291db6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bwWc9wSU01TVpGCRmE/n8toqE2zwkgO+23TSCmNjOosfJN12I3gStbNv3qw2PUieEDv4S5mJai1i52osFwkEfeW82kixVTHbB9lxv1x/wA5OjSychyNzO/m0RZKxGRlC2kUGP9P+tqQlB5W4M+olmH6hDFXv3EXtVHDk+HDIgzxkwMH5rZT9uAc59Mx/7sfSMKcEC+4EfU8lqcjmpinBfQdNj7ssRPwqy8U5nnmOozt191ybOmsHCkpxPKRr+Ub+HsXDHmpKdWmqvZ4/pP7ZAf1FkPc1cQthcnbiPYoGvFK7xaW5ro6rWuzSsdRWhBKpkpeiHM76lgAUfH9+JHQi62iPDH23mva+a1QwsFnmlYv5g/Hsj9tYkQGLdT7DVtuBRsJNvKoOmeiN9ZPYNPQSSAXqUV0cSRh11OXiuJiCCVt3K9v44lpA3rruq8fFFdYcWo3JlDJQuuccwIq/w88sSx9xRQOPvzldRznX5kxdnKVYw+LYIqnCj4NWznq+3znYeLkBw0nPr2aaqqmu04ZD7hFW31j0ODgYmOeOfiO7fkbua4V7Cz8DDhf6mCeCuq7q2RGdbsIOGupikVApWIFfTT05Xqk9q7qE0qWwMxpdgalQnDPOjkcpYJyl6EOs792nYo/DfCux4Fme0x5YXq+tbKY3nIB7NsSijSd8w7R0ZSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(31686004)(66899021)(2616005)(5660300002)(30864003)(38100700002)(36756003)(2906002)(31696002)(316002)(26005)(83380400001)(478600001)(4326008)(8676002)(53546011)(186003)(6506007)(8936002)(41300700001)(86362001)(6486002)(6512007)(66556008)(66946007)(6916009)(66476007)(54906003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJtcjVNMXdKTlVSZzFRUUVEaHpQdDhacEpTbExCL2ljbGJLMFREOVJtejZB?=
 =?utf-8?B?eWo5TTNzQUhxNmRPTGxabkpWVnFnV1pVLzFrT1RKVld6TVZkM2NVWGZuNzgw?=
 =?utf-8?B?b2RlWmxmTEdTUjhNekJubkx1Sy9pR0lJMGl0UEtzc29nd1N0ZXk5WXhBNmIz?=
 =?utf-8?B?dlNxR2VYazVZZlNDUWNVelJLWXlVNjhtTHd4OUgxeUdtTm8wUHAwMnErVHpG?=
 =?utf-8?B?QjVxT2JHSmh1dzBPa3RRZjAzNjZLTlVoME5RWGUvQXFoWXFNdmZxeWZUd0Vx?=
 =?utf-8?B?d3dYamdMVk1lYWRmZUtQVzY1R3RUSWJ2VDZ4MmVxckhqOVFQYU1kSVRJQ2cr?=
 =?utf-8?B?YWVHbXVmRHZaL2RLRXd3NElyR1lPeFd3eGl3QVR5bElVWEdkZFdJbmVRMG5Q?=
 =?utf-8?B?RjFPWEJabDhWWW94YWRUSEYzNUtIRHNJcUN5M0pDSmtVakFuaHdZTjh1QlNI?=
 =?utf-8?B?WlpLVlpCVytJbG91VGd0cHMzOVI5VGg1YmVUSnBRZzlZa1IzL0tBOXNQL2Mv?=
 =?utf-8?B?Snltb0FZQTRuQ0ZOS2Y0WGV2MUxXSFFPbTF6Y2I5TUVXZk51ai9FRjkrbDNu?=
 =?utf-8?B?emtjWG1TM2EweWVoUXFNajVxdmMvZ3IxYWNhMGNIU2NLS3hocWFIZ0VSWk45?=
 =?utf-8?B?Y3pyMisyQ1N5SjVvNU5wV05KN0d4V29sTmFPRFdSejlKTC9WdUZXNzhjTVZ4?=
 =?utf-8?B?VnIrZzVYTHJTSDgzQUJWUlhwd3BKUzVKSlFjT3FMRDIyQmNhVFBNMC9aVjN0?=
 =?utf-8?B?WFgzNjFPK0ZqcURxZHpoMnlxUG1pUlRucGhYQkdTQzNFbnVJVHorR21Ed2RX?=
 =?utf-8?B?dFFqd2lPWno2aitQbldCbnhDc2tSM1U4M0luaU5jbnhMeVZaS05IZHBQL1V3?=
 =?utf-8?B?OXVNNWVNUGZzOGtISlRaTHRQeENtUVVjd0o0RUNEMTRTalI0Tk1kelFiam9B?=
 =?utf-8?B?am9aRm5UNWlBZE93R1lmckVsZkE0ZUJMUy9jQ0FCVjhrUGZtcG9kQUgvNmlL?=
 =?utf-8?B?S3lRSFVlbU1UczhPUC9yaitYR0ZnUThmcFh1UFAvNWVXNVp1ckJyb0JncUVa?=
 =?utf-8?B?bVI1REhmVjdTQmdtZGZCRVR0OC9LMWRxSEJRRHZ1Nmk2T0FpcHIxY3V1ZjR4?=
 =?utf-8?B?TjFZayt6cmkzbnRFRnNLdHJTT2xReEFPRUlycVFLSXNXV2RzNU41UGRaZnpw?=
 =?utf-8?B?ajBLakMyMmpZdVZjSytNTUhNMmtNb1NrcTcwVlBQTHFJNTZhZFVDR01BckUv?=
 =?utf-8?B?bXljdldkSVV3Nnh4c09GY21oR0MyM21nMnI5eVB5MklBa3owLy9ybHY2cGJl?=
 =?utf-8?B?UUREajVSMkN2RE9uL2M4WVlEdTBEcnNVYVNMeGxIRGdyeUxiZUY2V0lyZ0Nu?=
 =?utf-8?B?NHNUWFVlSW5abllUN2gxaWZiL2FYK241Wi9yVGxTSzlZVmJ5RVdya09WV2N6?=
 =?utf-8?B?b3lMMTBQVDgybW1weHhuVVBoNDZtYXAyUFlVSTZmSFN5Z0FPaSt6eVRXcnFH?=
 =?utf-8?B?VzMvNFNacFoweVo4NDVLbHllZDFoS1FyZi8yTWtBVjkvaGVlRGpJeVp3M0tB?=
 =?utf-8?B?d211YU9VVi9JZ2g5U2tjU2xkcTZobnFYclRINTVBSlBBV3JOb2JPY3MvRmps?=
 =?utf-8?B?K2hjQzZNcGtCZC9NQU5XcFlsb2h4UXUrdkptY2FpbndiQXJVOFpzeGdwZjR5?=
 =?utf-8?B?UUN5NDlRdFNGMzNpVW02dnl6UGJOc1R4K2xpZzVGVDBOd0tuNXBYU0p2VFA4?=
 =?utf-8?B?UzZWeEEyTUtjMU8zVWVGWGNpWUtZRFB1eERHN0JEMmpiT0JtdlF3L1prSFhh?=
 =?utf-8?B?cDNUMW1PUTNKZk9WOWhES1pUQnhkN0VEM2FIK0tnbzZ4NGhlTkQ1NmdDMFMr?=
 =?utf-8?B?YXBLdWk0VndqZ01yempadlozakx2ekVCdTFrMm5uZFF2Z00ybGw5emdtMXB3?=
 =?utf-8?B?QXhtcHBmTXZNc0JqMElHSzNBdHBiQ21CSGRQTkJVcHptQ1VoYTBRMFhBRVgv?=
 =?utf-8?B?R2wxQkNHcDl3Tld1K0NvZ3FZeG5uUmRIbzgzNEx0bTNORy9iUUhZNkdzdkVS?=
 =?utf-8?B?TUM3VDdVdUI4K3ZzRVRtS2txdUZaZHZFRTVpZlk5YWpJRklCQS93TnBQVStj?=
 =?utf-8?Q?G4nBAZjwoct/8f5q6lWx7PS4l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19c6a46-9457-4c24-ebdc-08db9291db6d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:18:55.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMVCzAxLguQnW00MU1P9lUDLjUIOetNE6TxHTPJ407n31+SstlOtajbH5odmWllZCYfsZTTKZXeGpVzN8ctkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7422

On 29.07.2023 00:21, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -0,0 +1,11 @@
> +#ifndef _ASM_PPC_BITOPS_H
> +#define _ASM_PPC_BITOPS_H
> +
> +#include <xen/compiler.h>

Not a big deal, but ...

> +/* PPC bit number conversion */
> +#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
> +#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
> +#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
> +
> +#endif /* _ASM_PPC_BITOPS_H */

... nothing here looks to require that #include.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -0,0 +1,19 @@
> +#ifndef _ASM_PPC_MM_H
> +#define _ASM_PPC_MM_H
> +
> +#include <asm/config.h>

This is included by xen/config.h, which in turn is included from the
compiler command line.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -0,0 +1,178 @@
> +#ifndef _ASM_PPC_PAGE_H
> +#define _ASM_PPC_PAGE_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/bitops.h>
> +#include <asm/byteorder.h>
> +
> +#define PDE_VALID     PPC_BIT(0)
> +#define PDE_NLB_MASK  0xfffffffffffffUL
> +#define PDE_NLB_SHIFT 5UL
> +#define PDE_NLS_MASK  0x1f
> +
> +#define PTE_VALID     PPC_BIT(0)
> +#define PTE_LEAF      PPC_BIT(1)
> +#define PTE_REFERENCE PPC_BIT(55)
> +#define PTE_CHANGE    PPC_BIT(56)
> +
> +/* PTE Attributes */
> +#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
> +#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
> +#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
> +
> +/* PTE Encoded Access Authority*/
> +#define PTE_EAA_PRIVILEGED PPC_BIT(60)
> +#define PTE_EAA_READ       PPC_BIT(61)
> +#define PTE_EAA_WRITE      PPC_BIT(62)
> +#define PTE_EAA_EXECUTE    PPC_BIT(63)
> +
> +/* Field shifts/masks */
> +#define PTE_RPN_MASK  0x1fffffffffffUL
> +#define PTE_RPN_SHIFT 12UL
> +#define PTE_ATT_MASK  0x3UL
> +#define PTE_ATT_SHIFT 4UL
> +#define PTE_EAA_MASK  0xfUL

Did you consider introducing just *_MASK values, utilizing MASK_INSR()
and MASK_EXTR() instead of open-coded shifting/masking?

> +#define PTE_XEN_BASE (PTE_VALID | PTE_EAA_PRIVILEGED | PTE_REFERENCE)
> +#define PTE_XEN_RW   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_WRITE | PTE_CHANGE)
> +#define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
> +#define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
> +
> +/*
> + * Radix Tree layout for 64KB pages:
> + *
> + * [ L1 (ROOT) PAGE DIRECTORY (8192 * sizeof(pde_t)) ]
> + *                     |
> + *                     |
> + *                     v
> + *    [ L2 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
> + *                     |
> + *                     |
> + *                     v
> + *    [ L3 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
> + *                     |
> + *                     |
> + *                     v
> + *      [ L4 PAGE TABLE (32 * sizeof(pte_t)) ]
> + *                     |
> + *                     |
> + *                     v
> + *            [ PAGE TABLE ENTRY ]
> + */
> +
> +#define XEN_PT_ENTRIES_LOG2_LVL_1 13 /* 2**13 entries, maps 2**13 * 512GB = 4PB */
> +#define XEN_PT_ENTRIES_LOG2_LVL_2 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
> +#define XEN_PT_ENTRIES_LOG2_LVL_3 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
> +#define XEN_PT_ENTRIES_LOG2_LVL_4 5  /* 2**5  entries, maps 2**5  * 64K = 2MB */
> +
> +#define XEN_PT_SHIFT_LVL_1    (XEN_PT_SHIFT_LVL_2 + XEN_PT_ENTRIES_LOG2_LVL_2)
> +#define XEN_PT_SHIFT_LVL_2    (XEN_PT_SHIFT_LVL_3 + XEN_PT_ENTRIES_LOG2_LVL_3)
> +#define XEN_PT_SHIFT_LVL_3    (XEN_PT_SHIFT_LVL_4 + XEN_PT_ENTRIES_LOG2_LVL_4)
> +#define XEN_PT_SHIFT_LVL_4    PAGE_SHIFT
> +
> +#define XEN_PT_ENTRIES_LOG2_LVL(lvl) (XEN_PT_ENTRIES_LOG2_LVL_##lvl)
> +#define XEN_PT_SHIFT_LVL(lvl)        (XEN_PT_SHIFT_LVL_##lvl)
> +#define XEN_PT_ENTRIES_LVL(lvl)      (1UL << XEN_PT_ENTRIES_LOG2_LVL(lvl))
> +#define XEN_PT_MASK_LVL(lvl)         (XEN_PT_ENTRIES_LVL(lvl) - 1)
> +#define XEN_PT_INDEX_LVL(lvl, va)    ((va >> XEN_PT_SHIFT_LVL(lvl)) & XEN_PT_MASK_LVL(lvl))
> +
> +/*
> + * Calculate the index of the provided virtual address in the provided
> + * page table struct
> + */
> +#define pt_index(pt, va) _Generic((pt), \

Earlier on I did ask about the minimum compiler version you require for
building the PPC hypervisor. Iirc you said about any, but here you're
using another feature where I'm not sure how far back it is available.
As indicated back then, it would be nice if ./README could gain
respective information.

> +    struct lvl1_pd * : XEN_PT_INDEX_LVL(1, (va)), \
> +    struct lvl2_pd * : XEN_PT_INDEX_LVL(2, (va)), \
> +    struct lvl3_pd * : XEN_PT_INDEX_LVL(3, (va)), \
> +    struct lvl4_pt * : XEN_PT_INDEX_LVL(4, (va)))
> +
> +#define pt_entry(pt, va) (&((pt)->entries[pt_index((pt), (va))]))

As to style: Here (and elsewhere) you put unnecessary parentheses
around two of the three uses of the macro arguments. If you think you
want to keep it like that, feel free; in general we're recommending to
omit ones not really needed, to help readability. Otoh a little higher
up in XEN_PT_INDEX_LVL() parentheses are missing around va.

> +typedef struct
> +{
> +    __be64 pde;
> +} pde_t;
> +
> +typedef struct
> +{
> +    __be64 pte;
> +} pte_t;
> +
> +struct lvl1_pd
> +{
> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_1];
> +};
> +
> +struct lvl2_pd
> +{
> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_2];
> +};
> +
> +struct lvl3_pd
> +{
> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_3];
> +};
> +
> +struct lvl4_pt
> +{
> +    pte_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_4];
> +};
> +
> +static inline pte_t paddr_to_pte(paddr_t paddr, unsigned long flags)
> +{
> +    return (pte_t){ .pte = cpu_to_be64(paddr | flags | PTE_LEAF) };
> +}
> +
> +static inline pde_t paddr_to_pde(paddr_t paddr, unsigned long flags, unsigned long nls)
> +{
> +    return (pde_t){ .pde = cpu_to_be64(paddr | flags | nls) };
> +}

In these two, are you sure you want to demand all callers to only ever
pass in page-aligned addresses?

> +static inline paddr_t pte_to_paddr(pte_t pte)
> +{
> +    return be64_to_cpu(pte.pte) & (PTE_RPN_MASK << PTE_RPN_SHIFT);
> +}
> +
> +static inline paddr_t pde_to_paddr(pde_t pde)
> +{
> +    return be64_to_cpu(pde.pde) & (PDE_NLB_MASK << PDE_NLB_SHIFT);
> +}
> +
> +static inline bool pte_is_valid(pte_t pte)
> +{
> +    return pte.pte & be64_to_cpu(PTE_VALID);
> +}
> +
> +static inline bool pde_is_valid(pde_t pde)
> +{
> +    return pde.pde & be64_to_cpu(PDE_VALID);
> +}
> +
> +/*
> + * ISA 3.0 partition and process table entry format
> + */
> +struct patb_entry {
> +	__be64 patb0;
> +	__be64 patb1;
> +};
> +#define PATB0_HR PPC_BIT(0) /* host uses radix */
> +#define PATB1_GR PPC_BIT(0) /* guest uses radix; must match HR */
> +
> +struct prtb_entry {
> +	__be64 prtb0;
> +	__be64 reserved;
> +};
> +
> +/*
> + * We support 52 bits, hence:
> + * bits 52 - 31 = 21, 0b10101
> + * RTS encoding details
> + * bits 0 - 3 of rts -> bits 6 - 8 unsigned long
> + * bits 4 - 5 of rts -> bits 62 - 63 of unsigned long
> + */
> +#define RTS_FIELD ((0x2UL << 61) | (0x5UL << 5))

I'm afraid I can't bring comment and #define together. Bits 0-3 are
4 bits; bits 6-8 are only three. And I'd expect the lower ends of
the ranges to appear as shift counts in the expression.

> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -133,6 +133,37 @@ struct cpu_user_regs
>      uint32_t entry_vector;
>  };
>  
> +static __inline__ void sync(void)
> +{
> +    asm volatile ( "sync" );
> +}
> +
> +static __inline__ void isync(void)
> +{
> +    asm volatile ( "isync" );
> +}
> +
> +static inline unsigned long mfmsr(void)
> +{
> +    unsigned long msr;
> +    asm volatile ( "mfmsr %0" : "=&r"(msr) );

Why the &?

Also nit: Missing blank between closing double quote and opening paren.
More instances of this below.

> +    return msr;
> +}
> +
> +static inline void mtmsrd(unsigned long msr)
> +{
> +    asm volatile ( "mtmsrd %0" : : "r"(msr) );
> +}
> +
> +#define mtspr(reg, val) asm volatile ( "mtspr %0,%1" : : "K"(reg), "r"(val) )
> +
> +#define mfspr(reg)                                                             \
> +    ({                                                                         \
> +        unsigned long val;                                                     \
> +        asm volatile ( "mfspr %0,%1" : "=r"(val) : "K"(reg) );                 \
> +        val;                                                                   \
> +    })

Why #define-s here when higher up you successfully use inline functions?

Also (nit) blanks would again be nice ahead of the commas.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/regs.h
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
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
> + * along with this program; if not, write to the Free Software
> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

You have an SPDX line first thing - why the spelled out license?

> --- /dev/null
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -0,0 +1,268 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/types.h>
> +#include <xen/lib.h>

Nit: Please sort headers whenever possibly; also ...

> +#include <asm/bitops.h>
> +#include <asm/byteorder.h>
> +#include <asm/early_printk.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +#include <asm/regs.h>
> +#include <asm/msr.h>

... this group then.

> +void enable_mmu(void);
> +
> +#define INITIAL_LVL1_PD_COUNT      1
> +#define INITIAL_LVL2_LVL3_PD_COUNT 2
> +#define INITIAL_LVL4_PT_COUNT      256
> +
> +static size_t initial_lvl1_pd_pool_used;
> +static struct lvl1_pd __aligned(sizeof(struct lvl1_pd))
> +initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
> +
> +static size_t initial_lvl2_lvl3_pd_pool_used;
> +static struct lvl2_pd __aligned(sizeof(struct lvl2_pd))
> +initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
> +
> +static size_t initial_lvl4_pt_pool_used;
> +static struct lvl4_pt __aligned(sizeof(struct lvl4_pt))
> +initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];

Can instances of these structures usefully exist and be not suitably
aligned? If not, having the types rather than the instances already
declare the necessary alignment would seem better to me.

> +/* Only reserve minimum Partition and Process tables  */
> +#define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
> +#define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
> +#define PRTB_SIZE_LOG2 12
> +#define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)
> +
> +static struct patb_entry
> +    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
> +
> +static struct prtb_entry
> +    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];

The situation is different here, as array here aren't embedded into
the type (being just single entries).

> +_Static_assert(sizeof(initial_patb) == PATB_SIZE);

Is this really useful. And if so, why no similar check for prtb?
Furthermore BUILD_BUG_ON() would be better, playing again into what
the range of suitable compilers is for this to build.

> +static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
> +                                         vaddr_t map_start,
> +                                         vaddr_t map_end,
> +                                         paddr_t phys_base)
> +{
> +    uint64_t page_addr;
> +
> +    if ( map_start & ~PAGE_MASK )
> +    {
> +        early_printk("Xen _start be aligned to 64k (PAGE_SIZE) boundary\n");
> +        die();
> +    }
> +
> +    if ( (uint64_t) phys_base & ~PAGE_MASK )

Why the cast?

> +    {
> +        early_printk("Xen should be loaded at 64k (PAGE_SIZE) boundary\n");
> +        die();
> +    }
> +
> +    for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
> +    {
> +        struct lvl2_pd *lvl2;
> +        struct lvl3_pd *lvl3;
> +        struct lvl4_pt *lvl4;
> +        pde_t *pde;
> +        pte_t *pte;
> +
> +        /* Allocate LVL 2 PD if necessary */
> +        pde = pt_entry(lvl1, page_addr);
> +        if ( !pde_is_valid(*pde) )
> +        {
> +            lvl2 = lvl2_pd_pool_alloc();
> +            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_2);

paddr_to_pde() doesn't mask off the top bits. Are you relying on
lvl2_pd_pool_alloc() using PIC addressing to get at the value it
then returns?

Also this and the similar lines below look to be a little too long.

> +        }
> +        else
> +            lvl2 = (struct lvl2_pd *) pde_to_paddr(*pde);

This casts a physical address to a pointer; normally only virtual
addresses can be used this way. Could there be a helper added to
have such a dangerous-looking construct in (ideally) just a single
place?

> +        /* Allocate LVL 3 PD if necessary */
> +        pde = pt_entry(lvl2, page_addr);
> +        if ( !pde_is_valid(*pde) )
> +        {
> +            lvl3 = lvl3_pd_pool_alloc();
> +            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_3);
> +        }
> +        else
> +            lvl3 = (struct lvl3_pd *) pde_to_paddr(*pde);
> +
> +        /* Allocate LVL 4 PT if necessary */
> +        pde = pt_entry(lvl3, page_addr);
> +        if ( !pde_is_valid(*pde) )
> +        {
> +            lvl4 = lvl4_pt_pool_alloc();
> +            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_4);
> +        }
> +        else
> +            lvl4 = (struct lvl4_pt *) pde_to_paddr(*pde);
> +
> +        /* Finally, create PTE in LVL 4 PT */
> +        pte = pt_entry(lvl4, page_addr);
> +        if ( !pte_is_valid(*pte) )
> +        {
> +            unsigned long paddr = (page_addr - map_start) + phys_base;
> +            unsigned long flags;
> +            radix_dprint(paddr, "being mapped to ");

Blank line again please between declarations and statements.

> +            radix_dprint(page_addr, "!\n");
> +            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
> +            {
> +                radix_dprint(page_addr, "being marked as TEXT (RX)\n");
> +                flags = PTE_XEN_RX;
> +            }
> +            else if ( is_kernel_rodata(page_addr) )
> +            {
> +                radix_dprint(page_addr, "being marked as RODATA (RO)\n");
> +                flags = PTE_XEN_RO;
> +            }
> +            else
> +            {
> +                radix_dprint(page_addr, "being marked as DEFAULT (RW)\n");
> +                flags = PTE_XEN_RW;
> +            }
> +
> +            *pte = paddr_to_pte(paddr, flags);
> +            radix_dprint(paddr_to_pte(paddr, flags).pte,
> +                             "is result of PTE map!\n");
> +        }
> +        else
> +        {
> +            early_printk("BUG: Tried to create PTE for already-mapped page!");
> +            die();
> +        }
> +    }
> +}
> +
> +static void setup_partition_table(struct patb_entry *patb, struct lvl1_pd *root)

__init?

> +{
> +    unsigned long ptcr;
> +
> +    /* Configure entry for LPID 0 to enable Radix and point to root PD */
> +    uint64_t patb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1 | PATB0_HR;
> +    uint64_t patb1 = __pa(initial_prtb) | (PRTB_SIZE_LOG2 - 12) | PATB1_GR;
> +    patb[0].patb0 = cpu_to_be64(patb0);
> +    patb[0].patb1 = cpu_to_be64(patb1);
> +
> +    ptcr = __pa(initial_patb) | (PATB_SIZE_LOG2 - 12);
> +    mtspr(SPRN_PTCR, ptcr);
> +}
> +
> +static void setup_process_table(struct prtb_entry *prtb, struct lvl1_pd *root)

__init?

> +{
> +    /* Configure entry for PID 0 to point to root PD */
> +    uint64_t prtb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1;
> +    initial_prtb[0].prtb0 = cpu_to_be64(prtb0);
> +}
> +
> +void __init setup_initial_pagetables(void)
> +{
> +    struct lvl1_pd *root = lvl1_pd_pool_alloc();
> +    unsigned long lpcr;
> +
> +    setup_initial_mapping(root,
> +                         (vaddr_t) _start,
> +                         (vaddr_t) _end,
> +                          __pa(_start));

    setup_initial_mapping(root,
                          (vaddr_t)_start,
                          (vaddr_t)_end,
                          __pa(_start));

(if flowing across multiple lines is needed / wanted)

> --- a/xen/arch/ppc/opal.c
> +++ b/xen/arch/ppc/opal.c
> @@ -1,8 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include "xen/compiler.h"

Surely <xen/compiler.h>, but then neither this nor ...

>  #include <asm/boot.h>
>  #include <asm/early_printk.h>
>  #include <asm/opal-api.h>
>  #include <asm/processor.h>
> +#include <asm/mm.h>

... this addition look motivated when nothing else changes in this file.

Also (I overlooked this in the earlier patch) all xen/ headers generally
want to come ahead of all asm/ ones.

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -7,6 +7,8 @@
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>  
> +void __init setup_initial_pagetables(void);

This needs to live in a header which is included both here and in the
file defining the function.

> +static void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
> +                                    unsigned int pid, unsigned int ric,
> +                                    unsigned int prs)
> +{
> +    unsigned long rb;
> +    unsigned long rs;
> +
> +    rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
> +    rs = ((unsigned long) pid << PPC_BITLSHIFT(31));
> +
> +    asm volatile ( "tlbiel %0, %1, %2, %3, 1" :
> +                  : "r"(rb), "r"(rs), "i"(ric), "i"(prs) : "memory" );

Nit: One too few indenting blanks (besides others that are missing).
Perhaps also better to pull the standalone : onto this second line.
Overall perhaps (also for line length)

    asm volatile ( "tlbiel %0, %1, %2, %3, 1"
                   :: "r" (rb), "r" (rs), "i" (ric), "i" (prs)
                   : "memory" );

> +void radix__tlbiel_all(unsigned int action)

Is the double underscore in here intentional?

Jan

