Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931E7859FF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589297.921158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoTa-0002IH-Eh; Wed, 23 Aug 2023 14:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589297.921158; Wed, 23 Aug 2023 14:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoTa-0002Fp-Bt; Wed, 23 Aug 2023 14:04:50 +0000
Received: by outflank-mailman (input) for mailman id 589297;
 Wed, 23 Aug 2023 14:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYoTZ-0002Fj-7d
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:04:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e7379a-41be-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:04:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:04:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 14:04:44 +0000
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
X-Inumbo-ID: 04e7379a-41be-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPHvLaH8Uf8heL5NQ3peqTNGP0gMxx/GsBcaaoIKC1BkE4VN2P/XTO/o6nAWFQqN0AIzKva9RaQl9xRXOB+yzu6vm4MsNT4NhPq4XFexltq0hL6qnqBmyotYBp+vwP8DszBT/roF9d73pCQc+sU2Q4wjxwfoojaCVb0xMsOlNAx5SnbEtyN9JszGL3xtf1SrSS1i1uOkhT2GrjJpQWuYTd65qWCuUGvlXljiJMi6/YtA08w08Tqz4OLzooRFBhD7YfWulzxjV5FsRmbyq2n962S41a2CDo9Kc3UI54tLzwkhDl1ymaAPylU8X1dMHCsx0s/5R7DidfmeG92GPEVhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8orRgI0xJBLYjHFWBC40ypxjZSlooJCE2oSuKG1qxw=;
 b=lqlJkj0coXI1dac34Eog7YTzqJ/e33kk0zvct1V0Yc6BnOtAXvzjc8xfkazpRFJjvqadNd7GUzIOFTCjj6sWm+smafzqrv0BjN3e50Jdy4/nmhjEBNKKWzXTTjqLPsmXHDSqk+sp28EdWIBqA2Xxgpwwb4/52Yzb+gof8n6hQAujaOngOrE/Jia0C6/QOE9y7krra6ZumhysaFWmSexBCJQ83XKYXnjIx7Li76lx5M8vsMhysGeMNfapARCMGg1lh6ULSkN9DicER6Ziv8rYaEHjehioQW1kuR0xxlgE5/gY0+YNneK8jtsXBYOCd5w/KuM8TzdKaXl5+re5oya+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8orRgI0xJBLYjHFWBC40ypxjZSlooJCE2oSuKG1qxw=;
 b=m+d/ujR3Ok6/OimlGchtSw+jjIhgSHPA6IiUET3oFhs67lbxfRef+woTZnQMrEb3RaXEC7eYHnnrmrPk95wWJIV1krnetGjVLZZiA9t4/U8Hpgknnuu2DZLPGlcEfuSBawrQyC7WLHx4xp3u8ICsg6jwfUQ+crEf9YxCycOlqumyWSfo5JvE9cuK2SPrpgFmUyHJINVBUK4fcmXrgkHiJ7prDLv24fl6PDhdocazDL6axO8U8g2c2ke74EcMB1R7E7tOFZpCgh1rBPEGoUMn5T5naPn7dFdLNkiEFnMXtaTfPrPl1STNIw5ZbuwSP/qDgcQsmE7qs8JflGD7WODa2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e942f853-3536-2033-f214-1beccdfc8240@suse.com>
Date: Wed, 23 Aug 2023 16:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b91aa27-e34a-44d7-c3fb-08dba3e1e754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n3bpeWB1wCMOzzMZ+QzhbwOhnUwYQTuQ4w1JoYhDBrc10DfdxI2IjUq4isisbSVtTWimq68VLbY5ZOoB/h8xTLCJ+jKsHsXZN0wNpPvQRxV35IKEdwOyEC8tpazaVC4k/0kTV79TQGL+UwCCyUUC0hBoaDEoKAG7Gb4Alge5bUy9kyJsUHCVuJ2d6s8tKcu+bf/1PNV37ERdxAvfF/MfH3UOKqiVcAuOUfiVzBsIrj0IiTOY3wERm8wr6kBTK767xEt9N/Ci+Tof7dKoemBQQ0QoawL4tcPdX3Q82tlxTvzhuz0lO2DOAWSME+woLQFrLGY4NVdJ1ISUWLWk1ks+fpZgbM6aAjzrsbiw7lupWdvpQevBMuRCpk5Ehl6uluvIDNs+1EJk4ZLSJHHON3zCHB1A8cG5N4hC/pPHvpqPHNUgWEqIIpsOpGDl922ICAHygu87B9hV6OKg2vqPw71igP//ZQoCPlDsQT5q76Uf2Ojz+vHT7hyWobsGUJ6T8eqgQJI9yKHrP0RAQ7YyMZrQj/U2zbCrMH53mLKXiiUnrR2cEJ9p6mEfXYSCOzV+Crakf5tFlkOYcnWOeDUcjV9LPT7Xv0leMUVO5si7uV+l2wvwuihhnzeTyk5rEtzisXdnXv9yRZ/i3YGvj+7cqJlZsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39850400004)(1800799009)(186009)(451199024)(83380400001)(36756003)(2906002)(38100700002)(86362001)(31696002)(6512007)(41300700001)(54906003)(66476007)(66556008)(66946007)(6506007)(6486002)(6916009)(316002)(53546011)(2616005)(8936002)(4326008)(8676002)(478600001)(31686004)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzIzb1lPYzk3aTdFVmk1NWJSelhzRFludXI1SnJ0dm51U29NS01CcmtjNU9a?=
 =?utf-8?B?OFUyRUpuclRXS3BFOEJ0V21mcUlkNE9zdHpZcVdmc1NzTkZGaEJxcElPdFVw?=
 =?utf-8?B?MFRQY1BYbEx1bTJYOTd0UCt0ZTA3VEZ2MGRjQ2xQVkVRVllHQ1Z6cmorYzl4?=
 =?utf-8?B?M1diRTZSdDhEZHFFZXJ0SEk3SC9aeHFubkN3c3ZqUkwyb1MwQ3IyTERPYmQx?=
 =?utf-8?B?emVSVUVISGRNNC8xVWQyUFd0TjM3RllzcXM5MjEvZkVqTWtWUkNkQXQzSnEy?=
 =?utf-8?B?dTZXUDhvbmxrR2s1bm92dlNiU0xiQWNieGlab1JkNG1MNlR0aEtsc0hqNzl6?=
 =?utf-8?B?TVp2UlM5SEwrYmZ3YUtMTHFXOHRkRGFxaUFqZVF3NVBBUFRTR015NFVTTFNn?=
 =?utf-8?B?NlNLd1dpTlFTa3FJS2NuTHkvVFhNaVd1aFdpNWsvSExwOHRrR2ZYaGdDQXMz?=
 =?utf-8?B?bWNNaWpROVZoV2pWMkJnYW1rc1NKS1ZidnlmTzBPNVc1TW1LYnhrMm9icFBO?=
 =?utf-8?B?d2RLZkFMT2hzcjF5eVF0RmdGUllOK05JNXNUUk9CZFB5TEh5Vm96UEkwdmdq?=
 =?utf-8?B?V0Iyc281QnBaN2JHdmp6blYyVEdTd29QaG5tV01pNWRZRU92UnJCQnNiZDhJ?=
 =?utf-8?B?VDRXVGk5dnZWaEtBL1l6bVQzU3BRWTNKMHBCSnBPK0kvc2N2aUVSRFBObHp0?=
 =?utf-8?B?djRiREVXOWRINWRRdGZ5MHRWSWV3OGxuVEc5YTJoOHNwOVhIUXBSYjdLNWVH?=
 =?utf-8?B?ZjVpL3NLSXpXYWMyWTdxTHJRQWQ0am9nZCtoNzl4ekZkdGhzRkVIWitrNm40?=
 =?utf-8?B?NjZiMTEyMGcyOFNmaUZFMlRWNUhMcFptOXlRa09WSzgyYmIzR01NdzRXdGlY?=
 =?utf-8?B?WFduVFp2Q3lEUk9uYzcyeHV0VHJEQkpZdWltTWZKUVFGMitmdWkvQkNlR1hZ?=
 =?utf-8?B?WGd6NG5YRFJGVkpEKzRpdmRuQitkY3VUajNkOVZjVnBkME9EcDltdnRVbXcw?=
 =?utf-8?B?U3MxMWJZR0MzMTZNSko3N29NNEFaVTdqU3hUSVZMbmI2MjdUZ00zNFcyTW1p?=
 =?utf-8?B?bm5qUTF1U1AzZUF1aFhZY09jTmV2N3lRMEppSUVhOVJQTTExc3ZXdGtlWWpD?=
 =?utf-8?B?TytSK0lDNTJaOU8vYkxmUHdldytmOUZkQm1LUFhnOThtWTRJSnFRZjlhSmNQ?=
 =?utf-8?B?dVRUa3BvT1Z1VWU2VEhDQ09DQUZNN3hGQ2ZsRmxMTFR2VnZoWFdpbGd6S2NX?=
 =?utf-8?B?QXYvY2VRUm5PdkNiZFp4QkJ1UXl6UmxYUDFLRU5BUWJpMEJkM2V0aUpaL1c3?=
 =?utf-8?B?VE15ang5bzJJMU1uaDFiek1XZEVsbVBOSmZzTXFYeGFvYzhtZW90ZnR2WlV4?=
 =?utf-8?B?M2lHYUUyczJ0QlR3OCtDYVZxWnBwNXFkOXkxUEN6cDBLaWJpMGZ5anJuS0hh?=
 =?utf-8?B?cVhuZE5yTHRRcDlGUGFaMzQ2WEFpV1ZmRkxRUGlhNkc0RlV1b2h4Zml5MWpE?=
 =?utf-8?B?WGY5blZySG1VNlExQXZHYzlySEZ2NUV6eVBWZGVadk5EWUJQLzU5Y0lwdFho?=
 =?utf-8?B?SVBiMThWOEFESHR4Nm9XQjA1YVRhRGV5S3p1NCtzTzBqMTZDWVF3dVJtbW1M?=
 =?utf-8?B?QnhVVlREcjlmdFcvWTJzZzhFaVpvdHhLYTZpY3huZmNtZ3FZYW9IK3Vlb0tB?=
 =?utf-8?B?L0Zmd2UyZTFZUHFnVVRaVHVzM1BPWTJUZDE2c3NrZ0IzaUlXMUg2L1E0WmdM?=
 =?utf-8?B?bGc4VzJkZERpZ1dtdWM3eWtrb2ZYVlpWOEhhN3c5Q0Z6eHlTWXpXU2RtL1hr?=
 =?utf-8?B?QW5NeFRUVExhU3RBUEFlWWJlb012SmhKZE1DQzZKaDE3NW03dkhkTGQ5ajNl?=
 =?utf-8?B?WTNhZTlFekY3eW1pd2IyRzc4dlVGbmJCaVc0dzVPNDd0clRCMkV3SUdtREVR?=
 =?utf-8?B?ZDBBYmNieE13dnphNlU3eE1nay9PbzFkbXFpYmtadjB6MWIvTEFTYVhyWk5a?=
 =?utf-8?B?UmF5Q0h5TUhBeE5PaHhXOFRjT2RDdlV0eXRUS3FTVk9BYU9MWng3MGdNMzVj?=
 =?utf-8?B?dlJvZkFjeUNIQ0tybk56TnhvOVdNR3luZFpnRVAwZXJFaFBWcnFPM2tRSTNt?=
 =?utf-8?Q?aLrp/EhlfE0+jvAKH9xn+Q7tY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b91aa27-e34a-44d7-c3fb-08dba3e1e754
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:04:44.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcnYsqpJZgy6fZIUqTEWYMjp/GzbMFHaLcyaaZF6vE9QfMyGTnIRXlsJ09bvAbCmJuXEyz7RPY1y3+dXZdLsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640

On 23.08.2023 01:03, Shawn Anastasio wrote:
> Add code to construct early identity-mapped page tables as well as the
> required process and partition tables to enable the MMU.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two nits, which I'll be happy to take care of while committing,
so long as you agree:

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -0,0 +1,180 @@
> +#ifndef _ASM_PPC_PAGE_H
> +#define _ASM_PPC_PAGE_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/bitops.h>
> +#include <asm/byteorder.h>
> +
> +#define PDE_VALID     PPC_BIT(0)
> +#define PDE_NLB_MASK  0x1ffffffffffffe0UL
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
> +#define PTE_RPN_MASK  0x1fffffffffff000UL
> +#define PTE_ATT_MASK  0x30UL
> +#define PTE_EAA_MASK  0xfUL
> +
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
> +#define XEN_PT_SIZE_LVL(lvl)         (sizeof(uint64_t) * XEN_PT_ENTRIES_LVL(lvl))
> +#define XEN_PT_MASK_LVL(lvl)         (XEN_PT_ENTRIES_LVL(lvl) - 1)
> +#define XEN_PT_INDEX_LVL(lvl, va)    (((va) >> XEN_PT_SHIFT_LVL(lvl)) & XEN_PT_MASK_LVL(lvl))
> +
> +/*
> + * Calculate the index of the provided virtual address in the provided
> + * page table struct
> + */
> +#define pt_index(pt, va) _Generic((pt), \
> +    struct lvl1_pd * : XEN_PT_INDEX_LVL(1, (va)), \
> +    struct lvl2_pd * : XEN_PT_INDEX_LVL(2, (va)), \
> +    struct lvl3_pd * : XEN_PT_INDEX_LVL(3, (va)), \
> +    struct lvl4_pt * : XEN_PT_INDEX_LVL(4, (va)))
> +
> +#define pt_entry(pt, va) (&((pt)->entries[pt_index((pt), (va))]))
> +
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
> +    pde_t entries[XEN_PT_ENTRIES_LVL(1)];
> +} __aligned(XEN_PT_SIZE_LVL(1));
> +
> +struct lvl2_pd
> +{
> +    pde_t entries[XEN_PT_ENTRIES_LVL(2)];
> +} __aligned(XEN_PT_SIZE_LVL(2));
> +
> +struct lvl3_pd
> +{
> +    pde_t entries[XEN_PT_ENTRIES_LVL(3)];
> +} __aligned(XEN_PT_SIZE_LVL(3));
> +
> +struct lvl4_pt
> +{
> +    pte_t entries[XEN_PT_ENTRIES_LVL(4)];
> +} __aligned(XEN_PT_SIZE_LVL(4));
> +
> +static inline pte_t paddr_to_pte(paddr_t paddr, unsigned long flags)
> +{
> +    paddr_t paddr_aligned = paddr & PTE_RPN_MASK;
> +
> +    return (pte_t){ .pte = cpu_to_be64(paddr_aligned | flags | PTE_LEAF) };
> +}
> +
> +static inline pde_t paddr_to_pde(paddr_t paddr, unsigned long flags, unsigned long nls)

Nit: Overlong line.

> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -133,6 +133,40 @@ struct cpu_user_regs
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

Why __inline__, not inline, ...

> +static inline unsigned long mfmsr(void)

... as you have here any below?

Jan

