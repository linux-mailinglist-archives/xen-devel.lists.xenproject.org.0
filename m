Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC5769BA1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573171.897630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVIE-0002oq-Ot; Mon, 31 Jul 2023 15:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573171.897630; Mon, 31 Jul 2023 15:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVIE-0002mb-ME; Mon, 31 Jul 2023 15:58:46 +0000
Received: by outflank-mailman (input) for mailman id 573171;
 Mon, 31 Jul 2023 15:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQVIC-0002mV-Ke
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:58:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f6aebb4-2fbb-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 17:58:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Mon, 31 Jul
 2023 15:58:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:58:40 +0000
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
X-Inumbo-ID: 1f6aebb4-2fbb-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKNBCVaDZBXTq8EhSQKJzu07gGoxif4PnsKVg3e0xED1MfIroZNjPcgmN2p/5wEn+BKu14e5gVa/pykClnIFV5FHypaAPBFp+bzljw9yZn+7eZZr2p8Y0LdC8fHrCA6eXRiKOCxmIFRyMg0/3Xt1Ycndr+PRjqyizS1YQbRQnWi/offR0DTjviUOCsByiwCw8w1DwVCY3C6kCPLNrLsxU55n5/wQ/72UWqxGbvkQsSIMlFBkSVl1TUMOKbK2LBC6k6zV+yAR178qnmeNVS3X3YV3sZehRxbV25VWsCrj7SrD123RpSA1YWfXoErdI6G94PLIVmMHHTwSOO8I5J0InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCz0ZMv0rjcF8ceu2MJXy/aHsqYv5b8g9VU76qBIgaI=;
 b=A4qZ0AtPAnRTK5OBw/Th3M7YEuiwUKHYJeWWtAOXQqoqF8rd6zwz3+xYJJ7CcGTeNmaLfto9WzGUTYM9jsSBRtSaltSRpA8hT7XjRQRusbyiX2u3TTbAXa99rKOvaS0Gk9etBSA96ZRdl+4k5wXoL7wk7/4i4zFzddJWj0KkYFfAj2F5jspHajoPLTbVU0fhC/gLXl0yWMA5TuBrb6pGhLx06OzbWghpRcXrh1JGxqZ/tKni6/4JBtDJ6WQq73jxwL4xNecLS7uLPrgZmjuyS1zB6+n4ALilSMBJnijei/J6+l4kx6kQp/NqBVyB8+eDxnWxRnqL8YylMuH/D5ePYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCz0ZMv0rjcF8ceu2MJXy/aHsqYv5b8g9VU76qBIgaI=;
 b=kOIjc8YBBOjH3JO+SyC82jnRMZ6LeNzYp/B+8TPF2bcTbBj4K9F821sTUxk7IzUrt5F6T/qd/AcN7sEDnrteEHRxkXPmPXkQaNng2IkhN7Zdw6Ynpf38miEu3W1OnQkNBzb4uufX6ghgz5fDysnROYkBW0C4kHMK9QMAHxMCngv0SUu3Jwb3gfIiS6vIYEQnnK9LKWkk7wiqdjm8cwJQ1V5EVMSr+07gKC+rgsLGcOZ0IljPFadeafJVOiylp8+0G4PII+49JgRJhwZ3Ue2wj6SLUW/aUdJgPD9oKB/Zsa1inkbCSRK1YPagKK5Bs5Bt2vWMEmQSDLpQnuazEVLulA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <904d9448-1fd8-bcd7-2cbd-c9e5752dec66@suse.com>
Date: Mon, 31 Jul 2023 17:58:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/5] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: e1024a82-074a-434e-f10a-08db91df021a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xs5QNDYYiVNSIUju+Qnl/xc5TOvKNw9dUl4tRqCljvcHfU35ry6N0muj3iNL7nnfygc2n9A+Ovhj2G//4m1UC+7+5Q/IJgK8LvQRv0hFCVZTVaRdTS9Yso/D5nW04sCi4HkiiXb2Af5D5T8qg1YkcwL2ReIAd1LEAc9syGxhXqRTti7KVA2VXik97Egn34j77PBsogRrbAAv8ocDNvTFbqyXwCCqIa49REbJKkw+xmNl0SuDrLhOYvB1kNr5ZzkdR84GEnkWErcZaGuVT51THIvaVwNzB/6JQ5sJ4a5EiIM+KoMzlyn7EeTi7Sf8LvbqZ88uanWWXFzpwVFBWROR3VCufFTGuBI23C6FCmMMAGL6zObK9FLGuS4FM0oPKq8xUBNQ/ujYp5G8QgzsUasmVtAptwsyP7df6+xiYq+SmG8RCAn/CDBwQiurosKMIQY0C/RdDZOGOnxlTH4u19WOkpBK08P2p+qbCB0zzFs+65h/CY0Y+l9gJGKAXihJAtN8mVqeozKVNZy/+XQSiTEyyJm401hwbckjfesaEDe+icyVlnhLvbzKsCaQxd8BvhhQwSmibdDVtkEgcej/bZ/F1TlLlJgWvOF6powYhZ6MAQNCe0pqJio5/MtmZOMtKBOutV5+qzVtXSq5VmVh9QL5wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6512007)(6486002)(186003)(36756003)(2616005)(31696002)(86362001)(38100700002)(6506007)(26005)(53546011)(5660300002)(8936002)(4326008)(41300700001)(8676002)(31686004)(6916009)(66946007)(4744005)(2906002)(316002)(478600001)(54906003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzF5WlpObjQvV1FHMXIxMDdabGd4V2wvb1dRRllBY1lIUHhiZHJxemxua0U1?=
 =?utf-8?B?M3h2aG42ekVEczNxZGtlMmpVekc4RFNoUWsrKzVYWUFSSE1iS0tmVGFTTHU4?=
 =?utf-8?B?V05iR3hqTjYvbnB3ZkwvNHNUb25RNlorc0wvTHIyanV4MFlzRGk3eU5RTHlK?=
 =?utf-8?B?SnF1aGY0U2FEaGhSQmZncXo4QXJJcjVmU1Z3UU9tNUpJYWxab2JRbldWelNy?=
 =?utf-8?B?STZjU2FlSkladktNNGpKUkV6Z2IyVGNQNzdvUS9GR2d5Zm93RFZTbTE2eXY2?=
 =?utf-8?B?WGl0SE45aURGeWppRHpYSzBHLythbVlhTDZPaUwrWDZTOFhMSlY1ZWgwc3Nm?=
 =?utf-8?B?VW1KT015SjNBdVdzNXFYeC82cHJDaDVERWJmQ3lGZDJMV0VBUU5JWGQyOFh6?=
 =?utf-8?B?WmJ2T1NBVmpiMXp0ckpoT2VJZmxpYXIvdDdYNmxZbEFvMFBEUm5aT0hQcXZE?=
 =?utf-8?B?cEVSYjM1UUx3aklFZlVBMTdIbThHZmVLblNXQTZxUmdpNWVMNWdOdktHVFlB?=
 =?utf-8?B?azhpOCtjV3VaRHdVN1lhQ2p3UmhGSW45VlV1alRwMjk4RHExRkNYbGhuazNH?=
 =?utf-8?B?aGF4Q051eWZ4OFpmeENoRjFYR3crS1ozVUg2OGZ1TEprYy9FOElna2UzZ1l4?=
 =?utf-8?B?bkZFOTVUZzcraFdMV1JpWG53c0JjeFZWUHJjNVdlY05EdjFiN2lZOXEvOVBH?=
 =?utf-8?B?eUF0TERpNHVCR3dGMG44cnVQaEpwRUVCNlpqTEduZng4NnNTRUhHNEtnNmFY?=
 =?utf-8?B?Y0RkdFNWK2FEcUJRYVlLQTk0UXJvZzRGSWh1WitYSzgxR3BxeFQyZWdsTlRY?=
 =?utf-8?B?SzFkSUUwU3ZrWkN6MFdoTEIvOEIxOENreDZzQ3dMNzFKR1FibmYvVXNqRjh6?=
 =?utf-8?B?MFRXV08zTWlvK3BPM0lYL3J3akpES2w5cEVOU2txRDJqcTNCYnljMFM2SEgz?=
 =?utf-8?B?cFBPNGtUd2lSaU96VWNyeTI4Y0YzUmpUNWJuWmU1KzlUVVZDZ04wQ2czMmpU?=
 =?utf-8?B?eG5vRkpoQ0hzTnFQQ0hVdkZXUjlpV01UdUlZVnYyWlZXZDA1bmpxSXEreDd5?=
 =?utf-8?B?VHA2OUZBcHRQL0FmdUVUeGxpNHBoZDk4dHF0c3NMUzBDNDE1SWNBNHBmdHdj?=
 =?utf-8?B?dmQ5UUlZOG50U0luZjIyeUlrU1d4YlRuNTdDcUhvY1Izdll1eUN4ZHJnWGgy?=
 =?utf-8?B?NjZqTVd0cCtWaEs3WmVqWEhjYUlpOGh4RVRReWxpNlNtNjdGczd3MEVWSG9k?=
 =?utf-8?B?S1FiRVZOWDJGWEhwNU4vTUpwc2ZIQjdIOUtoaWFoMnlzQ3JLcm8vbWYzMFo4?=
 =?utf-8?B?MndmQkZmMGptbjdNN29HdTJ5dlEzdzlGNnNOR2J5di82QkIwQ3JoTDJBcW5l?=
 =?utf-8?B?bUttMGNoblVBT3lFNGhSb0hQenBlMUczR1BuQm1TVVVmQ1FwOFZZSkpjQjlG?=
 =?utf-8?B?aHpLY2JYY1YvaU5neXczOEpYWk1wRm1XMURSZWFIcEh0cVZHdlN3MVNRbEJQ?=
 =?utf-8?B?R2wyZUZ5QmtUQ2Y5blUvZ3ZtVGZQM25aU25FREZlamQyTUFYalRIaU4yMFQ4?=
 =?utf-8?B?aWRDTDN5YmRxT25JM3pjS1I2WW5CQTQvT2RSSGh4dXJ5TWhCS2RIOHJHWWRC?=
 =?utf-8?B?TThBb1kxOGdpelVPaTRrQnI2aDM1angybXJGdzFjcU8wNC9nTWt5Mmh5REJR?=
 =?utf-8?B?WTk5UXdwOFY0TTRESThVTWRSZWVuZWRGR0l6cUhIeUNFbWEzWi9obzZhWEF3?=
 =?utf-8?B?WW1zUldCQ1JueEFhNXpIeVNXWGhyQmw5cGN1WDlNbmdXQjRZYjdzMUVEd0Jz?=
 =?utf-8?B?L1ZkK0g5SklSWUk5b1d6dStEWXYxNmlkREhZeDNVQXRoanNGT1hYd2o4MWtm?=
 =?utf-8?B?dUEvQUQwUGJQMFBtWFFuTmZhcFJ6MVVrVzlEakhId0g5ZmtSNUJqMjc0Nml6?=
 =?utf-8?B?d1QxWjVKcmJNRWNYOG5JY01Ya2NIZ2pBbThvcG5VSy9hQjBVcWxlN1lVVUMr?=
 =?utf-8?B?VGwyeGFDS1RWU2tyUWtpTmdyL2Fna3dkc3FiQ2Noby94WWU5cVYwcVg2b1FC?=
 =?utf-8?B?dXI5eEd6eFFKRXFkbG95ODBvZmliTGNMM243amRKM3NoSGdPOFpJTXIyWEx2?=
 =?utf-8?Q?+zcT9FjQPVuc/qdlZBiEExRAr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1024a82-074a-434e-f10a-08db91df021a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:58:40.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6/FnYvK9twbhiMI6c/OGQ/MwOrQvJ0bTKKUszaUB7gDdNW4ALU5DmglM2Gkmd2DwPr1U2XkNvr5LcR1w1/lyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

On 28.07.2023 23:35, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,9 +1,11 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
>  #include <asm/asm-defns.h>
> +#include <asm/asm-offsets.h>
>  
>      .section .text.header, "ax", %progbits
>  
> +
>  ENTRY(start)

Nit: Stray change?

> @@ -11,16 +13,19 @@ ENTRY(start)
>      FIXUP_ENDIAN
>  
>      /* set up the TOC pointer */
> -    LOAD_IMM32(%r2, .TOC.)
> +    bcl	    20, 31, .+4

Could you use a label name instead of .+4? Aiui you really mean

> +1:  mflr    %r12

... "1f" there?

Jan

> +    addis   %r2, %r12, .TOC.-1b@ha
> +    addi    %r2, %r2, .TOC.-1b@l
>  
>      /* set up the initial stack */
> -    LOAD_IMM32(%r1, cpu0_boot_stack)
> +    LOAD_REG_ADDR(%r1, cpu0_boot_stack)
>      li      %r11, 0
>      stdu    %r11, -STACK_FRAME_OVERHEAD(%r1)
>  
>      /* clear .bss */
> -    LOAD_IMM32(%r14, __bss_start)
> -    LOAD_IMM32(%r15, __bss_end)
> +    LOAD_REG_ADDR(%r14, __bss_start)
> +    LOAD_REG_ADDR(%r15, __bss_end)
>  1:
>      std     %r11, 0(%r14)
>      addi    %r14, %r14, 8


