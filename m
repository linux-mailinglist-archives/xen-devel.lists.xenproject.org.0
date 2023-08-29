Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCC78C68D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592275.924949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazFO-0000AO-DO; Tue, 29 Aug 2023 13:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592275.924949; Tue, 29 Aug 2023 13:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazFO-00008T-Ac; Tue, 29 Aug 2023 13:59:10 +0000
Received: by outflank-mailman (input) for mailman id 592275;
 Tue, 29 Aug 2023 13:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qazFM-00008N-VR
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:59:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ca4c8d-4674-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:59:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9674.eurprd04.prod.outlook.com (2603:10a6:10:306::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:59:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:59:04 +0000
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
X-Inumbo-ID: 37ca4c8d-4674-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS/xSq/N+PlKrEKGqBuKTpvfQISgSd9AHj6wvO1eoGXDK302U3gdd6p6mK3APJQwx0+JzQ3SGQtpMLhjvqjw2AllWRObzRCqjYfgsyetp3Yf3IBTuSBSsQbBomnwfw2ZBGXn8Y15DcbIyzl4SGqmaFU6HLLTNPagLkQQ+aD453fE5y5cN10jZMXpiyiHWajzsXyTTIvKGb4xMplu+8g+NwtXD0WRbVKnox8wtsHY6OdAtEHRYLh4VCAmxnLH/Vb3+P52HrbakL1/eUyqynrp4zPkUpPiMHujl1YXaqOG6O/wzesd0CWN4JI1THaGDKvDWOyF+TlnTMtkzXRuLMaBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9PtzEkBtpU7v0tqSiGeA8L6JHWl6y7ZYZ9DwbwhSQY=;
 b=jsm+PfrtATWKhtP9mH4GmO+CI+EiPKjbJ1bWa+biuvRRcJ0QQCiDJRiffDtUbMPG53fZZre89xXPz4y2883vXlq/xR35OuXnUqXa+jMY8KpZdPalGwnsvVHgHYOQpxaOvHAL26lqZFUROHjKbOlBcgjlqtkzCG5SGaQMoOJQGo8TzW/Mwr1XcmvLfzQab0BLydlw4Wo3OXjxtmQf5wOxNxPV6YEt1GE4i9nrPDfCMJOT3Snts9CIHwVe8vCu5tBoDP9sdNr0FjRQKnpka3MnQhILj0D/4qcahdmRCV+UrujRdgTuAvHUPM2PmhxWLYfuMMg2PPrN32uxaXfHVAbIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9PtzEkBtpU7v0tqSiGeA8L6JHWl6y7ZYZ9DwbwhSQY=;
 b=SrheaUFVZ7L8PWjbD0wIJIpYiobhNzU08MPTYc4fVljN/ViFFAjeUoJLMQwgxYFJfx1ItoWBGfL9HeMmW8j4UVn1sFpfz+ggrU2GvUJ3lq/gyfDLka2TU6Exn83MksmWhHwnT40CufFOoVkvv+wfWyfShrssmBZKD7saM4j/4XJpcp7lo0mRDmcyoIcL7A3iGp2oQBKfthsT/PZiXOPyS/B5AdLFILIZ5D+8Rci5/mYd85jSSQ15R3n2GjGo0LS6QT6qRCfmzVsW3aoEyPxpy+xarzfkYPPXOFHSuUp+oIWjhqjzZLKl2wSTm4ivZdIB50mkn/QCJusS5nT+t+zuzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11f73889-2059-1d6d-6498-1f1907afabaa@suse.com>
Date: Tue, 29 Aug 2023 15:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/8] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <583ed0d715aa70e777e7aa62a287acafc52d5a24.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <583ed0d715aa70e777e7aa62a287acafc52d5a24.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: f56a67cd-18b9-4945-7083-08dba8981ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i9y8ngKY//64NMPKzKUz2Pwh/z2xB4eWqH4F53mEboarJpzq+d7qz5jvQy4fPs18gVVRsjstNT5+eCbBZawrzbthl5XfF2AI21ya2Tvu3HvFeVqVwQiYN1DDw84xINo6EvElIkDKRYlLK9LUUmZTrzBXoAs/X96TA5Dzauid8DmvherCwqZRWo2Oy1Z6lJjbS4OPgKtvLAPItysqpJb3r1oDBZc6NBWvSeCZ4prRX+ZkcQ+wBTBDhcdfo77KxPeP6L4PqsDzAYZ45Ru/A74xv4En2jd9ugogU0KbjXK4eDsj+EHV4jI63AoA4ATcDFM+p9r9SAOQM2OsMkHjPISvzvN23yqBNzEtIYXeruEyBCi106rPjpfsgOJpHjQllHMRBdpyk4xGXLtdn6p+rad3Xv3GX+AEPSK5FwFgatTzqUJ3CZ/0LdvfFGQhFpmpoi84hhUWemcC0VmR/namkH37WjLs03P7CHOmNGCDjwl6UBjB+IGzRdxmPYkn6Npoj/U+04Uvv20vpOL/pJf8+vnrrDMr7SvmZUMChtbZ+YYVHqKJomeW5j3ApatFq8mvAVCVauPbVzvOK9rOyKahs9h0RLAOz9lDhVq7Spm7I11khpyN0xLkXgmpuTngZmEnwuHbrxgU+F2//PvMxnaJsT3ilA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(376002)(136003)(186009)(1800799009)(451199024)(2906002)(5660300002)(38100700002)(8676002)(4326008)(8936002)(36756003)(31696002)(86362001)(31686004)(26005)(478600001)(2616005)(6506007)(6486002)(6666004)(6512007)(83380400001)(66946007)(41300700001)(66476007)(66556008)(53546011)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEhlTHZRVk8xMEtSYXBWM1d6SW9aMzBDRGtxZ3hKY0FEbURBVzFIZjJyajlz?=
 =?utf-8?B?NnFGWUlNNWpsZjVSeGFBaE5kNlM0bkVGMysvYmFoaHpBRjNTaUZmdm1GK21N?=
 =?utf-8?B?YUZRbnFqV3o1VnU0bVBvQnU2VUg0cGt6aHRQTUhYbUU2YWxlbklEckFUNm9q?=
 =?utf-8?B?QkFkSVBnc24yajV6a1JCK2NORHc4ZlhhQndlTHlaU3dySHEzTTYra1d5QmM3?=
 =?utf-8?B?eTVBdzhmc1JZWWs4ZU04RDg1NWFjM21kVE1vWUpmN21ZWWEzQ09MaE91RzVI?=
 =?utf-8?B?bHY0NkNpK0ZpUlRxc0MxM1N0L3pjVzNYVDRNbExLVFppUXdxYXVGTjByV2ZK?=
 =?utf-8?B?YkhBZ0pLVDhoalB4NDNKMGRnZFdtV2kzSFY1a21QS3hCOEZSWDlFbGZoU0Ry?=
 =?utf-8?B?bHJuaGVmU0VJREtta0J3TXl4ek5xVE1oVk4yQU16WHllZlNwaTM1TERvL2xN?=
 =?utf-8?B?MWhpZkw0NTR1cG81WmIxaUJyRXFSRlNGbjhDUlNtYVF4Nk5xWlJtTHBpQXBH?=
 =?utf-8?B?emJQK3BFRzhpb2xHVnE3czFhUlkzWDMwUHliejI4bDhUZUtpcy9zNkxjNjlK?=
 =?utf-8?B?NWUzWU9UYk9vQTdzakQxZnpyNXlkUUtGck9HWG1LODlGcFJ1M2pqcVUrQkND?=
 =?utf-8?B?ajBzc051ZGdnczI5c052V2ZGd3dmTmVMNW9zWmMwaFFqWjlzZ1I2ZnU2elhn?=
 =?utf-8?B?cUFpL3FRSTdtY0pxWVdhZ01LcFdOVmhjSnFBa3VqRHNNOU9LU004RC9MSFJX?=
 =?utf-8?B?R0R0dFBPV09BWVQ4QkE0WWlNTkdQMVFHZE1oQWFRODU4dlBEcGlDRmo0V1dU?=
 =?utf-8?B?ZEVtb1daSUtVQktsUFRsbEZrNkFPMWFBdER5Qk1WdzA2cXVBeG1iMVQyR0Nk?=
 =?utf-8?B?bGNBbkFWR01WcFZ2Y3pER2RuaVJCNnY1MmNwd2t6Y3dma20rWEt5bG9sK0lI?=
 =?utf-8?B?QlA2N0R5TXczWDVuRGNPTHAzN1RmZ2dtRExIb3JWZ0R4dXlNMTVXeUxJdVl0?=
 =?utf-8?B?R3B2Z2dqcDgra2wxcE9DOGZYSmVFTWhBU1I2YTU4VWZlOEZpYWFWMk1YNXFX?=
 =?utf-8?B?NmNJaGgvRE1QQUVObjd4eGhEV05TRkhTK0x3Nzh2MWZHbkYwcy85d2hHNlB5?=
 =?utf-8?B?Y200NC9zZlI1MVZieGtPUnZtZlpUd0Z1M2Vvd1psaU95NG1Ib0lpb2IxTHJy?=
 =?utf-8?B?Tkc2S1prM3dlUU8yWWVFeElBSDQyUGZwUERHeXFpT1p3WThUUlc4WG9rR0hl?=
 =?utf-8?B?c1dNeDNGWmxFMUlNL1ZTYnFNa2lrdU9qcEIvYng0QkdHWURvSGZkZS9lOEpH?=
 =?utf-8?B?eWFIcXo3WDZkNnQxWlZGaTcwdDlmbktNK2NmT1JwcTI5RmZYLzUzczNsMDN3?=
 =?utf-8?B?OHdqczRiY2tJSURmT3NjcHhkLzI0TlhRdUhNdDN4VDJYSWRXRTJ6S2ozUDBW?=
 =?utf-8?B?M3NRb3hxRFd4OUJDYytYZWx5Ylg5RHFTZFR4NGJBT0tjNDBvcEtMbURmajNJ?=
 =?utf-8?B?bUhZa2d4enRCMVg0MkNobzBHdVJreWxieU5LK1pxN1pxZ0kzTkZBTXU5QUNu?=
 =?utf-8?B?b2QrLzZUMUN4WFNyR21BaWllK2trRWdqMGdxbTBlVVErTTJ6YlNuQWd6L0JL?=
 =?utf-8?B?VVFkZkg4MlpNN1d6NFZWcUk2QlZPZGxVMXVya0FSMGhGQ1NCTFNkTVBqbUh6?=
 =?utf-8?B?dUNLbjdMNG9ON3BQaGEwOU85UUxHOGdGMWRrMjZIQTJtMGF4RUxmeGZPL0p4?=
 =?utf-8?B?TjBDNXV6QVB3NTNXS3pDcWRZeDROMmlEa28rcHFTc25ybkcva3ozbkNJa0RW?=
 =?utf-8?B?NGhiS0VDY0UvaUlCMjZhdVBpOTZQZFczaHpzZEYyVzlvVWJyMXNEMVh1QXhi?=
 =?utf-8?B?UzFKaHlxQVpYcmMxaGcvNHc5cG9ZM0w3dmNZVTZuMFh1MEtVWlFuUmJkSmRG?=
 =?utf-8?B?TFMxenIyaHhFdkRkOURZY2FXcTRKaXFrdGIyWm05VUlPUkk2cjJRNVl5ZktV?=
 =?utf-8?B?SG9Ld2JTMS83WmJyMHdsWlVmVVcyb1V1UUtOUmpObnhIZFYzUk05MDdMeGQ2?=
 =?utf-8?B?SzlOMDhqZjFacFBGOGwzdFNGbXFkMi94eWl5Kzl4S3dzTnBlbjF3aTVhYWJw?=
 =?utf-8?Q?VEvRqXwb4pvNpfIyVkU3Lb37Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56a67cd-18b9-4945-7083-08dba8981ab3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:59:04.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7melHqx1xIvrNRrhBMddljFQj03X8+RRB8pzU+X7hYl3UgOpE843Hn8Xg0qVPULSp8Chob3Mwq3eT5+8amLPPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9674

On 23.08.2023 22:07, Shawn Anastasio wrote:
> Implement bitops.h, based on Linux's implementation as of commit
> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
> Linux's implementation, this code diverges significantly in a number of
> ways:
>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>   - PPC32-specific code paths dropped
>   - Formatting completely re-done to more closely line up with Xen.
>     Including 4 space indentation.

With this goal, ...

> --- a/xen/arch/ppc/include/asm/bitops.h
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -1,9 +1,335 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
> + *
> + * Merged version by David Gibson <david@gibson.dropbear.id.au>.
> + * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
> + * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
> + * originally took it from the ppc32 code.
> + */
>  #ifndef _ASM_PPC_BITOPS_H
>  #define _ASM_PPC_BITOPS_H
> 
> +#include <asm/memory.h>
> +
> +#define __set_bit(n,p)            set_bit(n,p)
> +#define __clear_bit(n,p)          clear_bit(n,p)

... you want to add blanks after the commas as well. (You might also
simply omit parameters altogether.)

> +#define BITOP_BITS_PER_WORD     32
> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
> +#define BITS_PER_BYTE           8
> +
>  /* PPC bit number conversion */
> -#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
> -#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
> -#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
> +#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
> +#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
> +#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
> +
> +/* Macro for generating the ***_bits() functions */
> +#define DEFINE_BITOP(fn, op, prefix)                                           \
> +static inline void fn(unsigned long mask,                                      \
> +        volatile unsigned int *_p)                                             \

Nit: Style. Either

static inline void fn(unsigned long mask,                                      \
                      volatile unsigned int *_p)                               \

or

static inline void fn(unsigned long mask,                                      \
    volatile unsigned int *_p)                                                 \

. Also there's again an underscore-prefixed identifier here.

> +{                                                                              \
> +    unsigned long old;                                                         \
> +    unsigned int *p = (unsigned int *)_p;                                      \
> +    asm volatile (                                                             \
> +    prefix                                                                     \
> +"1: lwarx %0,0,%3,0\n"                                                         \
> +    #op "%I2 %0,%0,%2\n"                                                       \
> +    "stwcx. %0,0,%3\n"                                                         \
> +    "bne- 1b\n"                                                                \
> +    : "=&r" (old), "+m" (*p)                                                   \
> +    : "rK" (mask), "r" (p)                                                     \
> +    : "cc", "memory");                                                         \

The asm() body wants indenting by another four blanks (more instances below).

> +}
> +
> +DEFINE_BITOP(set_bits, or, "")
> +DEFINE_BITOP(change_bits, xor, "")
> +
> +#define DEFINE_CLROP(fn, prefix)                                               \
> +static inline void fn(unsigned long mask, volatile unsigned int *_p)           \
> +{                                                                              \
> +    unsigned long old;                                                         \
> +    unsigned int *p = (unsigned int *)_p;                                      \
> +    asm volatile (                                                             \
> +    prefix                                                                     \
> +"1: lwarx %0,0,%3,0\n"                                                         \
> +    "andc %0,%0,%2\n"                                                          \
> +    "stwcx. %0,0,%3\n"                                                         \
> +    "bne- 1b\n"                                                                \
> +    : "=&r" (old), "+m" (*p)                                                   \
> +    : "r" (mask), "r" (p)                                                      \
> +    : "cc", "memory");                                                         \
> +}
> +
> +DEFINE_CLROP(clear_bits, "")
> +
> +static inline void set_bit(int nr, volatile void *addr)
> +{
> +    set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
> +}
> +static inline void clear_bit(int nr, volatile void *addr)
> +{
> +    clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
> +}
> +
> +/**
> + * test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static inline int test_bit(int nr, const volatile void *addr)
> +{
> +        const volatile unsigned long *p = (const volatile unsigned long *)addr;
> +        return 1UL & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD-1)));

Nit: Too deep indentation. Plus blanks around - please. I also don't see
the need for the UL suffix, when the function returns int only (and really
means to return bool, I assume, but int is in line with x86 and Arm, I
expect).

> +}
> +
> +static inline unsigned long test_and_clear_bits(unsigned long mask, volatile void *_p)
> +{
> +    unsigned long old, t;
> +    unsigned int *p = (unsigned int *)_p;
> +
> +    asm volatile (
> +        PPC_ATOMIC_ENTRY_BARRIER
> +        "1: lwarx %0,0,%3,0\n"
> +        "andc %1,%0,%2\n"
> +        "stwcx. %1,0,%3\n"
> +        "bne- 1b\n"
> +        PPC_ATOMIC_EXIT_BARRIER
> +        : "=&r" (old), "=&r" (t)
> +        : "r" (mask), "r" (p)
> +        : "cc", "memory");
> +
> +    return (old & mask);
> +}
> +
> +static inline int test_and_clear_bit(unsigned int nr,
> +                                       volatile void *addr)

Nit: Too deep indentation again.

> +{
> +    return test_and_clear_bits(BITOP_MASK(nr), addr + BITOP_WORD(nr)) != 0;
> +}
> +
> +#define DEFINE_TESTOP(fn, op, eh)                                              \
> +static inline unsigned long fn(                                                \
> +        unsigned long mask,                                                    \
> +        volatile unsigned int *_p)                                             \

And yet once more (and there are more below).

> +{                                                                              \
> +    unsigned long old, t;                                                      \
> +    unsigned int *p = (unsigned int *)_p;                                      \
> +    __asm__ __volatile__ (                                                     \
> +    PPC_ATOMIC_ENTRY_BARRIER                                                   \
> +"1:" "lwarx %0,0,%3,%4\n"                                                      \
> +    #op "%I2 %1,%0,%2\n"                                                       \
> +    "stwcx. %1,0,%3\n"                                                         \
> +    "bne- 1b\n"                                                                \
> +    PPC_ATOMIC_EXIT_BARRIER                                                    \
> +    : "=&r" (old), "=&r" (t)                                                   \
> +    : "rK" (mask), "r" (p), "n" (eh)                                           \
> +    : "cc", "memory");                                                         \
> +    return (old & mask);                                                       \
> +}
> +
> +DEFINE_TESTOP(test_and_set_bits, or, 0)
> +
> +static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;

Too long line.

> +}
> +
> +/**
> + * __test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static inline int __test_and_set_bit(int nr, volatile void *addr)
> +{
> +        unsigned int mask = BITOP_MASK(nr);
> +        volatile unsigned int *p =
> +                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
> +        unsigned int old = *p;
> +
> +        *p = old | mask;
> +        return (old & mask) != 0;
> +}
> +
> +/**
> + * __test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static inline int __test_and_clear_bit(int nr, volatile void *addr)
> +{
> +        unsigned int mask = BITOP_MASK(nr);
> +        volatile unsigned int *p =
> +                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
> +        unsigned int old = *p;
> +
> +        *p = old & ~mask;
> +        return (old & mask) != 0;
> +}
> +
> +#define flsl(x) generic_flsl(x)
> +#define fls(x) generic_fls(x)
> +#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
> +#define ffsl(x) ({ unsigned long __t = (x); flsl(__t & -__t); })

Hmm, here you even have two underscores as prefixes.

> +/* Based on linux/include/asm-generic/bitops/ffz.h */
> +/*
> + * ffz - find first zero in word.
> + * @word: The word to search
> + *
> + * Undefined if no zero exists, so code should check against ~0UL first.
> + */
> +#define ffz(x)  __ffs(~(x))
> +
> +/**
> + * hweightN - returns the hamming weight of a N-bit word
> + * @x: the word to weigh
> + *
> + * The Hamming Weight of a number is the total number of bits set in it.
> + */
> +#define hweight64(x) generic_hweight64(x)
> +#define hweight32(x) generic_hweight32(x)
> +#define hweight16(x) generic_hweight16(x)
> +#define hweight8(x) generic_hweight8(x)

Not using popcnt{b,w,d}, e.g. via a compiler builtin?

> +/* Based on linux/include/asm-generic/bitops/builtin-__ffs.h */
> +/**
> + * __ffs - find first bit in word.
> + * @word: The word to search
> + *
> + * Undefined if no bit exists, so code should check against 0 first.
> + */
> +static /*__*/always_inline unsigned long __ffs(unsigned long word)

What's this odd comment about here?

> +{
> +        return __builtin_ctzl(word);
> +}
> +
> +/**
> + * find_first_set_bit - find the first set bit in @word
> + * @word: the word to search
> + *
> + * Returns the bit-number of the first set bit (first bit being 0).
> + * The input must *not* be zero.
> + */
> +#define find_first_set_bit(x) ({ ffsl(x) - 1; })

Simply

#define find_first_set_bit(x) (ffsl(x) - 1)

without use of any extensions?

> +/*
> + * Find the first set bit in a memory region.
> + */
> +static inline unsigned long find_first_bit(const unsigned long *addr,
> +                                           unsigned long size)
> +{
> +    const unsigned long *p = addr;
> +    unsigned long result = 0;
> +    unsigned long tmp;
> +
> +    while (size & ~(BITS_PER_LONG-1)) {
> +        if ((tmp = *(p++)))
> +            goto found;
> +        result += BITS_PER_LONG;
> +        size -= BITS_PER_LONG;
> +    }
> +    if (!size)
> +        return result;

Just using 4-blank indentation isn't enough to make this Xen style.
(More such elsewhere.)

> +    tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
> +    if (tmp == 0UL)        /* Are any bits set? */
> +        return result + size;    /* Nope. */
> +found:

Labels indented by at least one blank please. (More elsewhere.)

Jan

