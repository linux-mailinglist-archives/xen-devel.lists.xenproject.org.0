Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0F602509
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424756.672419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okgiK-0002Rj-Lm; Tue, 18 Oct 2022 07:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424756.672419; Tue, 18 Oct 2022 07:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okgiK-0002Pq-IW; Tue, 18 Oct 2022 07:08:36 +0000
Received: by outflank-mailman (input) for mailman id 424756;
 Tue, 18 Oct 2022 07:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okgiJ-0002Pk-PB
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 07:08:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad903020-4eb3-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 09:08:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 07:08:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 07:08:32 +0000
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
X-Inumbo-ID: ad903020-4eb3-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJDyt0PH+VsV8bFrmx0JrNdrFKX+vOIUxeEZsNlQ8d6U9s8PM0sux2QFuYgvcmTuS5FJ4NST0SOoSCmbV9eLLDZiLeRS1XNTjIaIOQut4vXnXUrD8S8pmS/sy+DuYwbtNKjw+Gguq1Qa43EOIq6Z2/pBopSAK/6nHvKO80iDd088WkGTEJW89wJquV/mBG65mg6A+fLAMLOMJB6MRH4JyBOhCiJefQINZCuXItbTtyLOhICe49epRSGJnkzEvLcLXBEX9n8NuP5d5Zki6qUZ41a9k1e1wpthVW4Vak/2e8QQm48jZsgWtDnS7er3G6DbPR/+bwrnUf7d5a87Ud29lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avymgcjJ6uBY8Le7K1Sv9JaeDNUpZldvNkHynNp/vEo=;
 b=TS+baY4iWVWkMwwMHHs+/tsTX0KMmlpUB0s6aE5B8qFUYrrAyhwxsAXPkPpcl+FpVBok6buLmXzBhRE0v+vGIUNFMmJNAnDOVzwOPZxe1Hy/OdFlpkTzJQqQa68C6m1Sf/OL0bHDTXmzoY6NdadUNKRqDYxmf7tA13bWIGW7Uf7If4qfBYWlrLkee0UQqSHoXcjIdo6hoel+uomFbGwV/00y92b7PB92sTaf1yp0SOX/yPjbAlGoyzUCQom+jIU72cwzZV+r+kqOf2JXsN/H/mZwI9K2RWA1Aq8kF2ShYfjX8iKmQm1CmEG92bfSJ3H9jbK3YFKutTjH4Btg/HeyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avymgcjJ6uBY8Le7K1Sv9JaeDNUpZldvNkHynNp/vEo=;
 b=uCfSNNTJyS8XyxGnPteL17foCeB+dtIupawbAi9asIdTzOoUXF5C7zfqWL4LAnAcWg1gmsJADlUcQYEpGpP3aqfBGkZ0vMxR0yyTAjBWkn3Xdb2pcVBQ0T9eu3itihbVLgFSGxUgzr+SE1OH0PDR2CnyRep8EGVNNz/OB0NewLE9v1dz6uamLShv/E0tJLKzR5ewVyvr12WaBGHElhspBq3vK+oInq2RHkl6BhsfiFxeVYr9u23rqz5ursWGYvl0HKAL++2WiCdPE4LIUKnrzLWPJ/VIZR22RhHiMZ66dN3HuIxgpF0frs7aGRumGMwlKXtLWEGgDI9/3yZ0pTCLmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81c0a4a9-c10a-2020-d26a-0a82d8a3131c@suse.com>
Date: Tue, 18 Oct 2022 09:08:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221017191237.11079-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d0ccb0-886c-4ba2-9ddf-08dab0d79110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0H1ZwhdwhmtdfIKtcHeLSVReQNRFYR+6RI0hLZNV+TkRgrm8uck312Km4OEdwhNnI7uQ6Ik2LYH4PLCxKUSjCmwgsLmwZBd4X3tyqGoCG2+9gib6Fl3u82AEXOT/OWaLn2ZA68vZsXz4CDeUuHNJNNvraOlAe0kmyFPlUq99eqRWzM7kU0mpAcs9X44MMXGGuLulPIWq0T3HH6kSjF1RnTZMFuvulUpcIModLJWbjEpHW7hl96CnPeJ0XnDAsm3nj8S7JK/sggw7CG1mvajkIER0H8wOMLEq3ixRGm3bAH22Px/e10oO4xKeEpzTI/BoaVDb+/4uCk/Xkc1+gnGEv1FW4rusXNAB7hmVYnY55gZg3pnoOzFZpDJ02Y85z2woFGb+gY2ZoKZMGL1np4iqJ3H8v5Gjks0dHlThT5lePZCm2uDVGqMOvcIOSUlIUXsksOFaM4B8cvf2J2Vd2xcQhYDkRViqLuw1dxYGuCLL1Eu+vXzoyo+zXsg5/AtepaetNBxKOONBhHbrGBdq9h1qS1wxI/9NhQdhhBUb/67FeUSc52r9McL5udRS1zjNBY5CLJVBYgVFnPnUGhmZeibmf09hXhCfprlFK3xA91SYEWt8fL3Mtde+GSL0pwiDgk42KQmDGvYMeP4cUt/iRQ7Fmr5hHwUay46IVNT6gS7Z/auqbhZahUKYH9GSHOjn+egwQmBpuWYpjofcJo4UlR7De/K+5cKBpbXifCVwdgty4LHoEy/SNnBWzuahdNBr87/6kupL5UOCvXWYSnmEFMSZqaEi7y8Pazb3iHTtCGUxD5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(6486002)(6916009)(2616005)(186003)(83380400001)(41300700001)(86362001)(31696002)(38100700002)(5660300002)(2906002)(4326008)(8676002)(6512007)(478600001)(53546011)(26005)(6506007)(316002)(66556008)(66476007)(66946007)(8936002)(31686004)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2pjWjFhcm80QWovSmZRbE5zWXFOK0lQUm1odHZOcVlWWmlRTHF3dUwxK0xK?=
 =?utf-8?B?TDY0NzRVc1UxR3pUVHNqRnphR08zY1R4bjNCQVI1WnJNU1ZLTmkvZEJsdXFU?=
 =?utf-8?B?TEo3UWZoK0hWWk5jcHVNVm1TU0pxYWVHWGZFUHJ1SzlVcFhTUU53RlVCVWsr?=
 =?utf-8?B?aHRjMmVoU29UdjFjdlVrckFNM0lsUDBadWhTdFJCVDNzT2RCelNPYWtRaW1y?=
 =?utf-8?B?aDJOOWVFSHJUYkVtQTBvNTluZ3pESU9KcHUybEZkZG9KcGVTUklUMlBaelpC?=
 =?utf-8?B?aWsrWk4xUlpHM3lnTEM5VDVLdFNrRDkvM0hhUnUweEw1MVFCSWdvMi8xZkxY?=
 =?utf-8?B?MzQ1NVlVNnR3TmVTNUJFSDRISlpIZnJOdC80L1VNR2JleDdTV1ROL2pXTit3?=
 =?utf-8?B?TmU0Tk95cS9La0dvVkpFWUxCT3VNazdjTm9nNExtN2xvMnJGY2QxamZHZGd5?=
 =?utf-8?B?ZU5JaW5CNjdZZWVWSEFxbkhlakE2RWdXeC84cWtXN0V0TURTb0JxVllEdW9j?=
 =?utf-8?B?L2VmMk1kVXRWSTNyT3psbUovMFRUMkhYM0J6Zm5PMVRnRm05SHVqbDh1QWFB?=
 =?utf-8?B?eGtUMDBFQ2E2ZlJ2bVFNWmNtaFBlNDBFS2dWb3JYbGRqMzhWZW00RU40STRP?=
 =?utf-8?B?eC9wTHpySURsMXZZYmdhUHJIVWVOZUpCL0UwM2M5UlZEbVFXNkVwbUlQRUcr?=
 =?utf-8?B?WVpwL3VyL1IxdGJLTm1Sdkg2bks5R05jTzVjRXpVY1MvOHF4b3FWb0RxOWlv?=
 =?utf-8?B?dThaYXcyOTg0d1Mvbk1tYUFHSi8ySEN2MEtnS1JGQkNQTU1xQzFsaFQ1dVQ4?=
 =?utf-8?B?b0grS3ZLcjRLY0xrUGNyMnN3Z0htV3hLemVYRUpPdlZJMHc0MXEzSy9xNS92?=
 =?utf-8?B?MWpIVkdYV3crQitndnVuNkl6Qkh4Si9HdHZLS1psZy9TK0VDeEJzY1kzVHFi?=
 =?utf-8?B?Z3NUVWd1bTN2dENCdXFaVkxsejdOR0RXL0Z2YllXbDU0TTh4V3RQaUcrUHB3?=
 =?utf-8?B?RnMvUjJYLys0cWpBNldlTTYwd1dtTG5sd2cvU3cvRG9jYkxXeTRrdVRmWTQ4?=
 =?utf-8?B?TWxqZVVzeGZzVGJCalFIMllmc0pBZmFXakt1R3I0ZW1Uc1dFUGtaNnAzLy9h?=
 =?utf-8?B?ajZjVy9ZYXFBZHZ6REJhSWRBWjNYRmFPN09kME1tSDNQbGZ1amh5L1hBSmdj?=
 =?utf-8?B?RHJoSnBpVExqaE5MMnNkd1BmN0dLRVZBcjhPQ3daVnhuUzlKRFBpVk1YdktB?=
 =?utf-8?B?Y0pwZXU3NHM1cGRCaUZqdVBXVWpSWkVNM2JvalM0WEhIcFdNMlR4cEdlMXBa?=
 =?utf-8?B?UVlueW42Ykx6K2luNGd6Tm0rSXJCRE9LOTBxOGFJQzJTNElKaVFPSnNNMlZ5?=
 =?utf-8?B?Q212cnlROGVOeUpucEtHZm9TcG9qTEhoeGtEaUltR3ZsWUw3UW52d0s2ZGlu?=
 =?utf-8?B?YmpiMGNSM3J2N1ZEZkppaHZyMklGUTV5MkdMeWh3S3dKbGJURGFOYVduOWNv?=
 =?utf-8?B?TGRralBrQnlKeTBLTXF4V0tLZWZEcnVmZll6d05hYWh5RVp3bmtWV2p2WHhI?=
 =?utf-8?B?ZzA5M0NQVDl2TC9pMDB0REozREFDR0habFgrZW5MdHExanBSb1E4RjdFTGF6?=
 =?utf-8?B?UW1UVFdCRGl1ckVBeWJjaGRIM3ZKeHBabWE0dDVIdUhFSVAzamtpRGZSNVNn?=
 =?utf-8?B?SGgzSm44bWN4blZ5VUVGN21MblRuVkZmTUtwOHBDWVRhKyt0WmQ4YzRaZ3dQ?=
 =?utf-8?B?TnRITzJtWWRQVnVvbFBETkoyb2dLZnF4UTFZWG0ra2VMbldPVmFhOGV0OWx1?=
 =?utf-8?B?RitRMkJLOUQzNDVveFBYVFZEYng4UzRkNDU0MDZtak5rVFNkTitRUDJPazdO?=
 =?utf-8?B?YTRDRDVnOUpJM2RiNnNtaEhlU2lVa00zeTlSaklLOUtURlpoczI5VHZNSEpD?=
 =?utf-8?B?TzcrWVdjb0RHR0FjK3pLSEFvQ0ZGQTJ3KzdaSi9ETE96TSsreUFGeFZiOUpG?=
 =?utf-8?B?U255aWJRWUpyaXBxVXltWkpBR3FldTFyY3BWaGJ0amt1eVN1L3FqcE9kbzJD?=
 =?utf-8?B?ZE56NC9lWGhmS3RoZUxuOVBaU01qeDQyOXVRTFJLNEw2c0RLUWxnNVMzZXp3?=
 =?utf-8?Q?4nIK9XFwTaSYHXFFM7v5TY3us?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d0ccb0-886c-4ba2-9ddf-08dab0d79110
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 07:08:32.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: py/pook70MfN81lxApZVFX6UOY9HmO06PNbisCQPhE6kDpjLENYomR95ew/mps8hjIpR9Rk/3FoDEFw9JNdV7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591

On 17.10.2022 21:12, Andrew Cooper wrote:
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1736,8 +1736,36 @@ void p2m_final_teardown(struct domain *d)
>      if ( !p2m->domain )
>          return;
>  
> -    ASSERT(page_list_empty(&p2m->pages));
> -    ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
> +    /*
> +     * On the domain_create() error path only, we can end up here with a
> +     * non-zero P2M pool.
> +     *
> +     * At present, this is a maximum of 16 pages, spread between p2m->pages
> +     * and the free list.  The domain has never been scheduled (it has no
> +     * vcpus), so there is TLB maintenance to perform; just free everything.
> +     */
> +    if ( !page_list_empty(&p2m->pages) ||
> +         !page_list_empty(&d->arch.paging.p2m_freelist) )
> +    {
> +        struct page_info *pg;
> +
> +        /*
> +         * There's no sensible "in the domain_create() error path" predicate,
> +         * so simply sanity check that we don't have unexpected work to do.
> +         */
> +        ASSERT(d->arch.paging.p2m_total_pages <= 16);

I guess this isn't sufficient as a sanity check, as the count (contrary
to the name of the field) is only representing all pages on p2m_freelist.

Jan

> +        spin_lock(&d->arch.paging.lock);
> +
> +        while ( (pg = page_list_remove_head(&p2m->pages)) )
> +            free_domheap_page(pg);
> +        while ( (pg = page_list_remove_head(&d->arch.paging.p2m_freelist)) )
> +            free_domheap_page(pg);
> +
> +        d->arch.paging.p2m_total_pages = 0;
> +
> +        spin_unlock(&d->arch.paging.lock);
> +    }
>  
>      if ( p2m->root )
>          free_domheap_pages(p2m->root, P2M_ROOT_ORDER);


