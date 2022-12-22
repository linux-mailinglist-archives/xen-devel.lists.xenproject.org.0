Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D8653EEF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 12:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468466.727574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8JbD-0001Fn-SM; Thu, 22 Dec 2022 11:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468466.727574; Thu, 22 Dec 2022 11:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8JbD-0001Cy-PX; Thu, 22 Dec 2022 11:18:55 +0000
Received: by outflank-mailman (input) for mailman id 468466;
 Thu, 22 Dec 2022 11:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8JbC-0001Cq-Sl
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 11:18:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae123ef-81ea-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 12:18:53 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9489.eurprd04.prod.outlook.com (2603:10a6:102:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 11:18:51 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 11:18:51 +0000
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
X-Inumbo-ID: 6ae123ef-81ea-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9hsV7XtxLn1zbhT7xnusjA2GcLUpwzx7JYK2z2JtCByXutYhajVZw9Ef8IC/K3GGC1RxA/2XcauecFcY1H3qc7C11ne6Ln93B0Z645W3nX1MtPAdkIOIUf0eGc8ZZPpGFePpdloAALtPUV9LGXZZBEQ+7VuormdbSCk3xgGKAJBUxXd8YuRqnUA0vyGg74DPVunqX2o2B8Z+qkiRaNaXjiwsilTJGGiuEru0Kes3HNa6p9ndPpVBQSphXoT3ZHSqSUpLlCwQ4CzuGnpaHnjm1W0RVjTo2AmQb6AujZQEzrbKlDOc7A8z5mCk01f4exkt2dco+NoaCsc/FHBpwD84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP9W60VpTyxZH8ArdFJJbj0zoSjt/ZG7rFAEM0rVdxY=;
 b=nrox0zGJcNDIVBbrtryRJ4+ClUQz43bGq5zdEkBrNBnwyIQvK8opvCjDPjzqPdHilWq+dYyKOe2rC98TN4ahBZGhsRSjeNuYZ0lP5xvK1VhnI//OVaEC446/3n3tcgOlohXoJhPNpT4IFpNkqZJlx9xxm0vm0g5UOr90SpT4ppcylNAAC6Pb2/ozv/MzmctzfC0h4+c9lYk6ElGoS4wSpqvN5/KgWBgVOlPBBX+Q3J4Kq1x+O/gFHDUmA/xrOcvWKjduzHHytTTCFazh1xqEtZzo3vb1NrETjKltvWuiIbeTLEIVPXyqOmyjfuv/F2lNk6eWVuZ7xSIFJeRcIqGTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP9W60VpTyxZH8ArdFJJbj0zoSjt/ZG7rFAEM0rVdxY=;
 b=SmC6HK4a4yrOAhvr+NAvcNNobGvQnvNwX1d77QnmoQnvXQ1q2OiC1a54BY9xq+bOz7r+iAUfAWsqkdSTkU08WVGD8hMmd6LzREunCHSVd0nW/w4ZJb7xLEn3DsqDO9oSPcx6GkjG2kE1zEeTAtqFd6pg/yx3Q4Zxkw/rvd+HWXayyPtLF+853w+88wfU1VOAKPeo4fDiO24g2adxMx9wtgLAtli+e7TUp55MAW1Oog4zD9R69RYchLdSr1xtDqPHpbDjoJ6r36nV9xHq7eG6GHPFpn93nbridE6ubBaqwt1F3lft6vwEwN6UFdvMJcldq2tlD8FhmXTlhArg7Cg3Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1b39940-a8ab-1b1a-8ac9-fcb4762c2d36@suse.com>
Date: Thu, 22 Dec 2022 12:18:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 07/22] x86/pv: domheap pages should be mapped while
 relocating initrd
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-8-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-8-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: ae15cdbf-9806-4309-1c69-08dae40e4dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	olcIAjnpdOrBa3zWGzhkdIOaRLG/d0smV2v/sQKq0HfE0/lqTPw64Ds/sBXb466booRf4x1EnYpBGHsofn8xInb7sV6tkbs30gARN5M8hjhNQHK4lEudCwr3reQ3OQLABUqsLghgh26TZyp0uvodxVyp9+K8DTLLSDzS2HWquTEJAEcAkEsczYoOrHqe+MqLFGUtUMSRUYSjX+qp47LFiM1cayxnKZdaIVmDk002PbqI0K72nElJboiXPJKevv0uvfd/LmebmLLWHEOs/j7nuKSmsKGM6tixZf59kMaA2eFSllbw3E3jLoA/wa531iwD3wUTVNF4ayoKLs/WFc97VPC2/Gb7Li/UKtLoMzcjd8kg5aSwmbCr2McT/acLDk2ia981QsnKk84ZZV/rTKbUZoKhmyHipC388/gXkPFUiEuYWvJ9SiKqFkkmSEFdrUPSfiX/4cgb8jWkts4bIjVyk4KT9ofsLPZe+t2GrI5MgPe3cKOITldbMHKLv6UVDswN8v6Myck7cwMnoR81q/mg76vgn1tOf24EOFPDqvqUMSZwv77zrXImA/ZHLFUd5tqR1jodFkhxiccj/+u4U+HYTyr1BKSkVfazVyNJ0I3QtjuyahMA65k+NXmZphAJHTORAm9EmnR5dRX+xpGTVy8y8Yd+QE8pxXCqbfF+pmfFUA7ADf4ZV5GS72fuBDMPZUICel83kkry0MLotIeAAH5TlZ215HySxXHsQR3aPqAmfTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(31686004)(2616005)(66476007)(66556008)(38100700002)(66946007)(4326008)(8676002)(41300700001)(8936002)(2906002)(53546011)(31696002)(86362001)(5660300002)(6916009)(6486002)(83380400001)(316002)(6506007)(36756003)(54906003)(6512007)(478600001)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEl2RXN4QWRtekxZU0NlK2toVVBLOC8vU1Fic3ZPNkwvS01YcHZyWStQQ0lT?=
 =?utf-8?B?ejJwVlE5ZVhsNXpFcDJ0Lzhsc0FZN0wyRkhobS85LzNXbW5waVZFU1YxM0Fr?=
 =?utf-8?B?aFJGYmZ3eTM5Z1BhYnZmbDVJcG9ZcG5wdEdvczY2K1FiV1hjYVE4dmVXM2I5?=
 =?utf-8?B?Q2FMdFJyRnJDVVRZaHdnRHdXb2ovek9Ebi9rWFlCMzlzMmczd1owek1STDdp?=
 =?utf-8?B?K0xhcHRPUGJKS1UxMEZYZ0puUjM5Y1lVeEhvUlRVNHlCdXhQZmE1UW9wTGlD?=
 =?utf-8?B?S1liR2VuVmdmY1psSmlJT1dsRWRldjI2SVVuQlp1WXlzaGZ6bStQTkk2WHBK?=
 =?utf-8?B?NkhGSEd5ZWJmanF4bHQrMmFla2hSU1libnMxanBJRHBVdXF4U0RkeU5ReDVr?=
 =?utf-8?B?MDF4b2lWME5Hd05td1hpV243bkFWVTZ2cy9NYVBITkY4YVRGRzN3eDQzMXpw?=
 =?utf-8?B?WVd0QlBldXZ5VnRVZTcybHNhWmw4MGQvb3ZCOWgxRDdseGVMcm1kVklOcU9M?=
 =?utf-8?B?dWZTQzB2Um1ybzltUjNOcHlWVkhSYmN2TGp2SHpwOElMTnJxeGpkRks4WUJv?=
 =?utf-8?B?NkFubkVnTFJ3akpITGVUUXltVXJsVHA2bHNiWDNKMElibmRJMnYvNU9vdnlm?=
 =?utf-8?B?V0ZldUJaamp3U2VyV2FSWFh3TVRSRHp4eXpVanhLUTE5SXBlRWt3RTF0d0dG?=
 =?utf-8?B?bGgrRVVHQnBNdGZWUWVEc29id2ZuNC9ROFJJLzdOVmViRlhhMjVvUHdrMlFO?=
 =?utf-8?B?aG93eWkwM1N4N1d5TEQyUUZhL2xuUHdFcWZLTVlUOCtuemI2M1pkQ1drNzhM?=
 =?utf-8?B?OWZLU0xXQTc5cHVRdEs4VGZmV0dpWVZjL2Q0Rk9kNHA4eklyNXNyUTBVUXg4?=
 =?utf-8?B?THVBWXc5dW9CWnEvdk1tMkg3NWx4MmhHek4raUxiK2U1OVRUaWpkQ1Q0WHhK?=
 =?utf-8?B?b3VqUTd4ZVVsZ1lPUWp4U3RQdDdXNG83VG5pL1l0ZHBRL0xIMWpEL3RtR0o1?=
 =?utf-8?B?VkdpaGl4aDNnaFpkQThTZ1QzUWFkdnRWajVXMXozbVJUZkRyWkRpZnhuQno0?=
 =?utf-8?B?Y1hoTHV6ZFB3Y1FwOUwvczNuTHdtWWl3Wk5iS2JJSWVxWFpZdGJXYVFXS0NR?=
 =?utf-8?B?OHZWbytVdlh3YWVGM1RCbkx6aGFnN1B2TTRoTHExNHhGUDMxdGl6Y2FQa2wy?=
 =?utf-8?B?STlXcGlwUzd1ZUFXM3dadndIKzFRRW1WYy9VM0xCZ1lad3ZmY3NWWStGcS9B?=
 =?utf-8?B?K3hscFc1RE5rekJ5b0t3MCtqUllNSUNhalYrcjFkTXArd1hwN3NOZkQ5UnIv?=
 =?utf-8?B?VVJwSUgzRko5OFBEL2N6dUtYUHFMU0VtTTQ4MGlaYzJGRm9ZeTZ2RnB3VHd3?=
 =?utf-8?B?T09qTy9udXg0eEFtWFFtbXpxL0JXVGFDcXJ3RVVSd1FIU3Q5WVNXYWJVYm5w?=
 =?utf-8?B?YWs2R2UvUzJyblM5VFNjRndBTVBmaFVwNFJ2UzZKNW1IaUF2ZDJLQ25abHRR?=
 =?utf-8?B?YmxPNU5UNWRvd3JLOWFENis5VDFNRGx3WWloWWtmSkd0c1ZsSkhYTmtRaS9y?=
 =?utf-8?B?eHpoY3FDOW92RGpRcjdKbWlVM2puSm9kb0Z6d3RHSldsdWZBdllYTlFQbmI2?=
 =?utf-8?B?bWExRi8vMlFrUWNmc0tZMUpsZ0EwMUE1NjZmWHZzWXczVFhETFdqV2UzZzNp?=
 =?utf-8?B?WG01QU5lWHFkRmIrWHNlSGhTbStkRHNIR2dHZXRWczQwdnQzdWZXK2U4SzNO?=
 =?utf-8?B?cmlvZWJGMzBmQzZvV2w5UzdKdHN5MmpyV014TWRhMnRrZnk0a3FwcEpzUHEy?=
 =?utf-8?B?bHJGZTZnc0hZVnhLUGxBMCthdURXQXM1dWlFZXdjVWduNDVGSG94VnlEVkhD?=
 =?utf-8?B?N0M1WkV4emZtbmlOWHdZKzByVFZJMmtUSE9aMXhxWkZMdHI0Mk0yVEMwUkFN?=
 =?utf-8?B?VzZVcjNlZWl5Yk5YMDJHelNWV0FZZThpbTFhNjBWdWkwV2J0S2dNcnJia2xM?=
 =?utf-8?B?aThqVndxQllySHgySUtTL2czT3VGc05EaS81d2ovcWVlT2ozZStHV3VMUktt?=
 =?utf-8?B?ajBBd2J2RUs2cGgyenN6b3U0SWJWQTBKRjhVZzI0SnFTR24wSUhOM05NT2ta?=
 =?utf-8?Q?6FeIIH6G28TwbVAD8JFWv04tz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae15cdbf-9806-4309-1c69-08dae40e4dde
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:18:51.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbUey7T2bfTZgRZArIip+DAh0vgHxTD9DyscXMaNUDBTQkNjERr8siFDxYzr7JCSDcLM5VZBqbMuWI/Q1fffnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9489

On 16.12.2022 12:48, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Xen shouldn't use domheap page as if they were xenheap pages. Map and
> unmap pages accordingly.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
>     Changes since Hongyan's version:
>         * Add missing newline after the variable declaration
> ---
>  xen/arch/x86/pv/dom0_build.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index a62f0fa2ef29..c837b2d96f89 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -611,18 +611,32 @@ int __init dom0_construct_pv(struct domain *d,
>          if ( d->arch.physaddr_bitsize &&
>               ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
>          {
> +            unsigned long nr_pages;
> +            unsigned long len = initrd_len;
> +
>              order = get_order_from_pages(count);
>              page = alloc_domheap_pages(d, order, MEMF_no_scrub);
>              if ( !page )
>                  panic("Not enough RAM for domain 0 initrd\n");
> +
> +            nr_pages = 1UL << order;

I don't think this needs establishing here and ...

>              for ( count = -count; order--; )
>                  if ( count & (1UL << order) )
>                  {
>                      free_domheap_pages(page, order);
>                      page += 1UL << order;
> +                    nr_pages -= 1UL << order;

... updating here. Doing so just once ...

>                  }
> -            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
> -                   initrd_len);
> +

... here ought to suffice, assuming this 2nd variable is needed at all
(alongside "len").

> +            for ( i = 0; i < nr_pages; i++, len -= PAGE_SIZE )
> +            {
> +                void *p = __map_domain_page(page + i);
> +
> +                memcpy(p, mfn_to_virt(initrd_mfn + i),
> +                       min(len, (unsigned long)PAGE_SIZE));
> +                unmap_domain_page(p);
> +            }

You're half open-coding copy_domain_page() without saying anywhere why
the remaining mfn_to_virt() is okay to keep. If you used
copy_domain_page(), no such remark would need adding in the description.

Jan

