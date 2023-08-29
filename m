Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A6A78BECE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591985.924590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasYO-0002BH-Gj; Tue, 29 Aug 2023 06:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591985.924590; Tue, 29 Aug 2023 06:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasYO-00028P-Cp; Tue, 29 Aug 2023 06:50:20 +0000
Received: by outflank-mailman (input) for mailman id 591985;
 Tue, 29 Aug 2023 06:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasYM-000270-DQ
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:50:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fcee402-4638-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:50:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7163.eurprd04.prod.outlook.com (2603:10a6:10:fe::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 29 Aug
 2023 06:50:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:50:14 +0000
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
X-Inumbo-ID: 4fcee402-4638-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKvKHCKZlThc7NeddotBnylOlBowRwnEbL4JjnK+xu1WQmYix8kgp7cuGP8HIhzHSU6yIDoP4vnuxMVjXZzSuoQqap3OCEkDB5pxsJsaWKN+Hn3kst2WNzstA5kfrKlABTzIDDQv9t7e6RH1TM2C4r6eSbpyVPMHssPyGjFNjwhX3UwCWd8yXgEP77j6vxq8bfb590m+gq9M3REO0IjbGImyoavAP3aaeJ4mQ9ceYxtYOJ86xCQ4BASm+Slh3UE0d+L2awRa6lrgucwJjGDD2mAnb2yftTvQjHZ+o0FmrLgzY1SFfpYBirCCTwYzf/W8f8yKWPbuyL/r1jgxtO6oUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUhOxWnOFlO6DHDWaDimQHauNO+LCfzlMafAO9n+010=;
 b=d9s7p3MapmRgrWCpPpeasbsIiNcltu9OFwxcSxrLUFL2V8tBGk90CXHbgjJW3fDAwjruLXIJ3htmfhywXe69Q2tcR+BwwPcslUyoR+SNSC4M9/Abb5DeGiIeb+MpdowasGApaufEEjnzCZuXhhmhcHBFlLOUkgsqegnoSPqbbhMPPF71M6Be0RFNNaIvGY8ZfOR7vcHOI6cY1fMSN/lO0QkrZW6/XlZ9vDIDjR6lhtmFmTlZzr9O7CuhlRBdLaTQU9fKEOEwGnIr/QfqDsFG/tEM2zyK/OQI+5ZrvZcQk2OGyg4QLzuPnkqBFklTNCJbTtJNC7bMUKfw7ie7zV6KGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUhOxWnOFlO6DHDWaDimQHauNO+LCfzlMafAO9n+010=;
 b=5rop0+Yqu/GNGOVyK8pKXgwZ1vgr8coyEe8DKY8Jpi0zrhj2EDkJuLuDUnzof5PhV/uoCXIN3u2w3Hc5zRpL1XNDCYZlqbq8RYgj+rd8nJG81alqfeXGdak9uC/eAbUsAz1auzyc7SzVZL3pEV7DDHVf+qba3ZeyR3+guWuoef70AzUuFbt7WnIFvCor4BZhnkHEtc6bY9LhtGBD4ksR5zkDr4RmrISp/CK3cXMOul5jJkKXKRQNlfYJ9njdNvIvrFT3WD3hdxLuNotAb4E1l95QDvOKF/6hRHCL1Xc0n6IReHVCo8p1IxICSLs7BH1RMmm2M0V8yDX3lwuQWKtpSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
Date: Tue, 29 Aug 2023 08:50:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 73499178-b8dd-46a1-b364-08dba85c32ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zW+heTC+UzDTZTBUfZXVbiXnmPckYB4Y8SdIfsl237KjS5fhes2EZCubQamPT1EvywsSenUOltbMv2W8GdUKSXp2juCtsYgPGgBnlbjLpI8UawyW0jA6gPJKHaH/aYy76fwuOKXDcgENXFhUD+BkRXV8u62MpoFnRSwMvcI6VvOkcsfOvFsMjWyyoWcpGrUkUczSNc06cJhEeK8gRmmkPoYiItETVa5tquB6wdLuMQyIKwz7PTRb9xHVRVDY9q0zaeQepUyL3a5THWZSBOuq91caYxSs9F8VvgaPpR0nPnT3V6Xg5Do57CwvPi72N/nwX3UekxMKYDgh4GYzICOVupGRLkQ6d+R1j42caLDDjg4XpxIxAmADjK2/QC++XqV92aEs6Um2kQ7zhMHEVkrkkuPLGAHswI7jubpCnnWtw55X9R2vS4WJYimAok84oN/R9WbapSA65ZNRnE9LKELKc/XnvHLHPi3HBsD4goQDy2+6OeHbLCjAkLidy/EBooF0LSYKDlXefvqJEJDbVS1Z6BhhzSyC2uxe4wmanlXRBgrZEyzsc17W8QRjXzaa6sxNqnj+BxRPdx4HbMTXpbIV2HI6Kgf2KpEZ47PfFUTF2TknPWn4M2fY1tH6s9P3r35RqDpyPQ4ESQku9ucTNZCxBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(83380400001)(2906002)(6506007)(53546011)(6486002)(38100700002)(26005)(5660300002)(86362001)(31696002)(31686004)(8676002)(4326008)(2616005)(8936002)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(6512007)(36756003)(41300700001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmxXVHRZbnRmMVJYWHZKaS9WdzQxZXIvdUc5emRsRjltVXJwS0xMUnRtSnJZ?=
 =?utf-8?B?dFNqVjVaRHhESTg3WGtVc0Y5UXlJV0VDSlJHWmIxN0E1T2xoZEVwTnBsOTN3?=
 =?utf-8?B?YjNsMHVBdmtrUXdtb3IwdnRpRmJSMVFRQlY1cGU2UExLYWRvaVdwUzdNbGNy?=
 =?utf-8?B?K0VDNTZRQlFNM2ZORDI3YmFEOTc1RWxWYkllWlB5UjNBNlYrNThwOWRDZFA5?=
 =?utf-8?B?bzcyN2ljRW5mWVBUcUNmbkdUWUNoaXFHb0VDNHlPYXV6Zi9NbUdUMWg2aHI3?=
 =?utf-8?B?Q0dDYTk5TWxGYWYxdTQ1cnBMRkFTblEvTXNpZUFTVVk1RHJBOFhvWmlMdHE5?=
 =?utf-8?B?cVc4QnNobFpWTG16L3RpalJydUhBZitqSUlxQnJzd0xUNVA3SklJdlFKVGI0?=
 =?utf-8?B?TjFYK3dvMkNTMzFSQStFK0pQeHlEWC9JYzlubm1YMWVUSU5sM0ExY0toQjY2?=
 =?utf-8?B?bVNwZHB4YkJYbTlvNE84eWtVL29PdXg1ZWxhWjVXbUkvZ3dZbVBsWUZXN2Ex?=
 =?utf-8?B?b0VFQXBmVnVpbnJRSW1TSTlLMjJFZ0YrbExKQ0ZBT204UWJpbHJYU1htTUpu?=
 =?utf-8?B?L0hUN2xEd3dqSk1YeGhUVUdpdUZOcjlCOXV0V2wvUTVqRVBkRU45WHhQR2ZZ?=
 =?utf-8?B?U1BCMlBVNGFUMU9Ya21PZ3BUbkNsV0dKc3BCdlBIaldXU1JweTVvcXdPbkVR?=
 =?utf-8?B?TjIydXVKc0RuMU1SRFpxK2xNc0pUaWNaK2FLNlRmTUlRbGdwLzRDQjlQWFdH?=
 =?utf-8?B?OXBHc3JiU3VybzhHZlE5L0dkZnBqZ1hOYS9tWWxJb0hmWkFUU1dNdXdwa0Rm?=
 =?utf-8?B?WmRUSjg0dWFUTmZGYzBFT2ZCdHFQN01waS9OUUpzU0h4OFErNUlNVWljMU01?=
 =?utf-8?B?eE9SUWFiS1lXRk81d2preHM2cDJORDVuN0wxODB0RkMxYW5XYTlIT2pVYkt1?=
 =?utf-8?B?bUhuYlh0alBxZTlIcWxiVnNUVjFRdTAwMldjTFZpVXlvVXNXM0RPeVRrL3pO?=
 =?utf-8?B?ZlIxVklZdEFTM0JsUHhNcHFGM2dTOEcxajEya3J3WkQrSEtSV0kwYnhtZ2dy?=
 =?utf-8?B?MjVwTXRyc29jYUJ1YUpvRWpqeFoyNUhOMUMzWkk3bkF1R3YzMjMxYjYzT295?=
 =?utf-8?B?bzZIbzQraGtiaVRIeEd2RVpza09BM29aRlBvZFB2eEV1NkdaNU1HZFVPdGhV?=
 =?utf-8?B?VXFUdTdRdE5Gb2xOaDFZK0FFSU5uY0Y3dTdraktsWTUrR211TUdXMkZYdkdX?=
 =?utf-8?B?a2F2UzJMdHJMbW9qcUc5eDJRZVhLWlZqL0s2WThCMG1EdFRBREJ1NnNSL3Ix?=
 =?utf-8?B?OTRLVzBwdFlnVDJvRHlwUk55S1YvV2YxbFo4UkxLWFJONFpVZURpYzNMRUgw?=
 =?utf-8?B?QVkxL2prdVZ1N1FJcVc4aGlqMjdYeHgrMjlPb0hIL2pCM2p6MEpHNmtpcUlx?=
 =?utf-8?B?Rm9vOHlyK0pWNysvTXRzWFpWalArcFRjcCsrWVlaR3BhZFpqZ21vUDNXVzZU?=
 =?utf-8?B?d1lsTVc5NmtFbzh1eGpPSHZWTmpTZGpoQmZtTnBZSXFjNm5OOUhTeXNZanVK?=
 =?utf-8?B?M2RkeTZhQW50QTB1N0lQL25hYW5HYlprd1VKM2dJZXREM2E0YzBNclZoTFlE?=
 =?utf-8?B?YnBHNHpWWGpjeGlKOFBRZjRsU0dpQmJHdndKN0lIaGxEVk1US3FoTDRkT1N2?=
 =?utf-8?B?UW9WYTVjYlh3OGxmNXVJdWt1YUw2amhhRWhiUStqYnpGWGwxcDMxVnY0WG9Q?=
 =?utf-8?B?c2FWMVpkQVViSlNDdXJ0RldvT1pXQXMzd2NyanR4T1hZWTRJUjk5SVZhRlBt?=
 =?utf-8?B?bjljWURRZFg5MTk0YkxiMitwRXlnNkdXb1BIQkQ3ZU9UNUR6aFFnWXV3S0J2?=
 =?utf-8?B?Zlpud3NTWDg1cWJvbmpSTHhiYXBTcW1WWDg4SDZRR01VTGNKTGw1bDZIN2Jz?=
 =?utf-8?B?K2xQdStTWS81U2xlTG4vK20vVGFyYVl4Tk82b2hRNGZmVFJGTzJaVXl1cW93?=
 =?utf-8?B?N2N1TlVibWZEc213VnRtRms3VXVqbGs4Y2djM0F2VGloc3JQRXVmalpOdW1t?=
 =?utf-8?B?T1dHbldkK1RTdlNLYW9nUXRwWHN0WEZCSk5tdEQ5UGdwZVFxbWJEY2JxOUZB?=
 =?utf-8?Q?eJhfxGQn49OtfL6M6vRgQyu5Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73499178-b8dd-46a1-b364-08dba85c32ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:50:14.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJJkg+XWgQcmcQDqoCNz/aOiwACKqL/RLu4WW4SEYTvwc9VlXCM4loKCMFr1SgTQxvrAydApJpO6I0Dvhn0zGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7163

On 28.08.2023 15:20, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Also C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/common/compat/grant_table.c | 7 +++++++
>  xen/common/coverage/gcc_4_7.c   | 5 +++++
>  xen/common/decompress.h         | 5 +++++
>  xen/common/event_channel.h      | 5 +++++
>  xen/common/multicall.c          | 5 +++++
>  5 files changed, 27 insertions(+)

As already said in reply to another patch, imo .c files shouldn't gain such
guards. These are commonly referred to as "header guards" for a reason.

> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -3,6 +3,10 @@
>   *
>   */
>  
> +

Nit: No double blank lines please.

> +#ifndef __COMMON_COMPAT_GRANT_TABLE_C__
> +#define __COMMON_COMPAT_GRANT_TABLE_C__
> +
>  #include <xen/hypercall.h>
>  #include <compat/grant_table.h>
>  
> @@ -331,6 +335,9 @@ int compat_grant_table_op(
>      return rc;
>  }
>  
> +

Again here (at least).

Jan

