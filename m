Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33D62D7DC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444895.700055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbym-0002zP-C1; Thu, 17 Nov 2022 10:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444895.700055; Thu, 17 Nov 2022 10:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbym-0002wc-91; Thu, 17 Nov 2022 10:18:44 +0000
Received: by outflank-mailman (input) for mailman id 444895;
 Thu, 17 Nov 2022 10:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovbyl-0002wW-3k
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:18:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35676020-6661-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 11:18:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 10:18:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 10:18:39 +0000
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
X-Inumbo-ID: 35676020-6661-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P41FUvF7Wd6+X9KN1373kifOoTouAi/sjT9X6Tys3Z8qKoKE+6uMYkqKS27fzhHvCeSb9HRu2NvHIcQJjkhxV8xUjDZVJViPQRZRV0UfBO73NieZxudGNuzJdioSuAzOQaQKzZcYHbm5gpklffHyMk1iIAQ7aXWsWzzXq9NNXumZKEyfVm4dAcOJmklT5lTp7BlQWRKoZt53pLCfoCMn1fIMD1n358ZDegfbiCqOzakbirllq195dPD2bzQnYtxymcIGLwS2sw13vYFhsqvha2oHypPGF77GcBnxDWKI5ryy7WAULNu0biyTAcK9vRu4svV7ohtTa0DGvXTS7bwTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tvy92WkXe45I9oOXd1L/urf2YeCxtLaQ1nwyO/wJ8Qw=;
 b=FpCuNWe1M6rXA+Q0J8Bdl+x97NkUSb4rP/CFbhxZIGy6jZz8IRWBAu/MvjBh3hUvZoTWtgsGeBH7oM2yD2n9vJsvCfJyOLuioAK8H+pMJM7Cdmcp4T3rnceI49dlpBGfBd3E+hCSWGdlMaHlcD/Ih7MHAbdB0sByrnCP7yNX6IHghLJSAwsnuB2UD1PXpR7YE7HhRIrJrvpjY95P9gPSOtcGAurMBmizWNgKD4AiwVxOXUBw6FgIjZ3gjWgAI5wwcfiYSPuiC43Thz7EhAFlS8UJFwyJ7EbhSRYooTiMAoAp6Y6v1IwzArtS6g7VesA7eijTVrzxEoKRO8E28dGwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tvy92WkXe45I9oOXd1L/urf2YeCxtLaQ1nwyO/wJ8Qw=;
 b=1A3/eZ8arD4aEhVo4uQ2meK3FvhI2xDej1rDjQb+bKRHN5ql1GvKTMxXxKseGHZoXBSkX05cuc72yX2ZNnJj2WLpUJap8djhAiW6wOefLauueW3QnivHIPcblp2GuIv5FHqN6UNYCfhqG3Fuyut9iqNBkUShtzIU096evtsS6jpoenVIsiOfSiwpaLf90PbbLbto0V3xqpYPWZKpNtA+gxJjofXLe+NWuvPiovnAM86vSpdY/NLXTqdo5CCj/PI/HNGATBxjqHZmGvIBsKp8UIFfP4xSni1zyDMRVL3HPrxdNMprigevYY68b7FS0vTn5HryqyvcMLsPglImWyTUvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50b643b9-0347-4587-0c32-7af018485911@suse.com>
Date: Thu, 17 Nov 2022 11:18:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging
 mempool size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221117010804.9384-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf2bc80-a71d-464a-60ca-08dac88518b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvhvCJz4LdRQYiyw696tERAImq6FtXQ5gmNclaugWYvwHEP0JVetow/1Q3kPxk5+lcDLRDiPa0PQEtx+lpkpp+vWE/Wf7efWcGFf6aKRIGzO6P9tuIlj1BXlJqC6nKpKL002aQLNSMaEAFvDhuG2zmB4qq8fL8kRUQ130LNQHp/Y77a5H39ARzQGcy/8sD9jZLGzLFQEmYBgESGXccSbACnpE6gpyqonus69wXVr6iDF5+D6zNXoFaqn9aED8NqCBbMKIOAjnUVNiWHqsKfhdnWZ/YOemjcWLozCR+b/6POUgrh0h8ZwXExFo1FgQbBe+2oPKDR0AYaeRtC2BxxIszQFX7R67eOagUWSax4ta66GAXttVCV7FrfGqi+PB2jLrdo8caBD0PjKCq6UFtur207ZA4D3ulHk/NrWStVfk1petXhqpdXHOX4AeWC0pjIuWsbR0VidQmgWqqMS7mbaHp2B27Ygm4Dw4RX4Gde7Z2amhoEJeUqtFzaAzCtdnsw9Zy4H/SIfhfg0/DW+9VjswPfCc5cfZrWZIiVY+l8RPqXZ1U8so57JlfRabty7trCNGmQMN3nLpRsAdNwVhEppBhCGFnhb+8RI1aRjQx/7edDN5j8GBTRI0KSrT/2Iyi1YmmbfOJVoEklEhnrHi2HpEZyNMMjygHspv9k7QMZnarrKejwKufewB7w8GrwPotTd2QSLPXmTobgVO0+m7X/bbAY6GNMFmyiiE4d8upDoj1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199015)(186003)(7416002)(5660300002)(6506007)(110136005)(316002)(54906003)(53546011)(41300700001)(2616005)(8936002)(6512007)(26005)(66946007)(66556008)(66476007)(36756003)(8676002)(4326008)(38100700002)(2906002)(83380400001)(86362001)(31696002)(478600001)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmY1bFRBeVRyQjRRdlo5YUxJb0dNNkpjSlEwZi8xZ3oxenorN3M4aU54ZTgr?=
 =?utf-8?B?YStKa2dmd09jQmFRNnVKMFd2aXVhOTN1OE5SdlZ6NDJiU0FMOER2VTMrTFEw?=
 =?utf-8?B?dDdPT3A2cnJSM1MyWnNkckxzcmNzUEIwTFRFOXI4YVVPcHNLYVluWXZOT1BR?=
 =?utf-8?B?THdvTjNpVG9LRi9CMlRobnVMOHNaUm12U0hsYVNtenBhb0wxS0tuN2tmNU1J?=
 =?utf-8?B?RURibHI4U1EybEQxQTRVcGs5QVU4aGRUaU5YK2VMVU9scmxBZ0ZDek9ab2ly?=
 =?utf-8?B?clJvMkloeVBGeUlYWGw2TVgydEsreEEyTVRFLzFERDBNTlExUzJTY3dwVWM2?=
 =?utf-8?B?ZnhIWlJsUGpQTHR4Z21lcUFyRlVrY3RSV1FsMndzOTd5YkcyUXltWFFOTVox?=
 =?utf-8?B?YXhJSS9uRVVNTGl2T2xDVitDZjdTbEFUU3lVdnRKbHIrUEtUT1hkN3pQWVB4?=
 =?utf-8?B?ZUZDQTYyUk0zdmdZZzV6Z2RvUWRvTDV4Sm8zTUtxbi9QbmhKM0h5MnQwdmdX?=
 =?utf-8?B?UEg1VVJ5U0FReVpFTDl0RFBCMmNUenZUcjNiNkFsc2VJdWJsT2pyODBjS0hJ?=
 =?utf-8?B?NDdwZkJKRmZ2V2tmTDNESUZEd2ZNSUhiaUlEdmN0ZXEzTTd3TUI0YVZOeTVN?=
 =?utf-8?B?MGdreU1hNGs4bjJhRzZRMEZIZnk1dm9aZDcrQkliQWE4dUpIaXVCeXNGK2VO?=
 =?utf-8?B?K2NoSG5CTy9UZUE4QjhPUWRhajllbkVEYm1adnRMYlJ5cUFKNXZBNGZJT0Jh?=
 =?utf-8?B?VTl2UkpBM1FKWHMxSHlocFBLLzRoVXdFK1lnUlRwNldUSzNRc0F6WC9RNlQ0?=
 =?utf-8?B?bUF5OWlXSWZqS1prb2dHTStPVzFPU2s5b0VsTmxpZXBkeVp3dHM4TmpQS2Ny?=
 =?utf-8?B?RE9rUk9qdlRWZlNXVUpIclBpQ2MxRDdsSEhjUDVQN3Y5LzZtZ255SUdpbngv?=
 =?utf-8?B?M1BDOW4zNUZoMVNpaXZDdThTQ2RWdm9yT3R2UDNXN2p1Vll6MkgxenRuTTMw?=
 =?utf-8?B?SVlYV1FpVDB5b0wzRDBHaHZkYmwxYTlQWFRFWVJuZGNCbVRXUVdDTDJiNktx?=
 =?utf-8?B?TVV2Q3ZEdzlPczdjSFluVmhUUTBpbXJDY1A1dXYrYmh1Zi8rK2hLOUZGc3hS?=
 =?utf-8?B?bVhHdjhmdklueWxHak5KZ1BWOVExb3FSeVlzaDVYZHk3bURLR2IzVU5qcG0y?=
 =?utf-8?B?UDhvNy9NcFJzTXlyTjNaN2JVVm9uREd6SUZxMHpaaUtCV2sreGwwL2pvSWFK?=
 =?utf-8?B?THNpajQxWGJKeVFhUlo5djR6T2d4L2RGNjFHYXlkNCtJaWlqRlAwZHg3dTVZ?=
 =?utf-8?B?Q0hiYjg1d0tCelJ4b0V6dUpvN3BiNlpPK1hCQkNmS3VpdDZEazFDVHNaU2dw?=
 =?utf-8?B?UWdXKzBDNDFtN0FxVnZtZFJBRzRleU05Z0JpVE13dkNaM3A5L1ZHWUpyLzYv?=
 =?utf-8?B?eWtUMU4raEY0c3JxWDVhMkFwK3cyQVVhV21HS04zbk5maGJpM3ZSNU5hbmJV?=
 =?utf-8?B?UUZlaUwya0F1WnBJWVVLSU55aVMvTzdJbFlpZEJXQTVVd3llS1VWTkRGRlNs?=
 =?utf-8?B?eEkvTmhaeTltcFl1TmZtVmkycDlvb3Ntbjg2RTRxUkpRVE9hQWdmU3hNeDRQ?=
 =?utf-8?B?cUovZWs2UUE2VHJVYkxVSDJoQkJKSVZkS3NIUFc0NG9mMzhXRUhxVUZKeGt2?=
 =?utf-8?B?dGd1RUFRUXpBM2U2MEdkRHM0WU5zelgweGpDSC9LcG9qbXVyMnlSc3N4bVhX?=
 =?utf-8?B?Q1ZpU0NIcHp5SCtmb0h1Ti8vRnJuemlndFVITzZKdDRjVjFDZVlXK3FRTUtW?=
 =?utf-8?B?bVNNbDM4ZnlSRWcwUGRCZmZqMk8xYnR5LzlqcE5lNldtSFZnSmxPa29uVGQ0?=
 =?utf-8?B?OFduejhsTk9nY3NQTnpGVUsxQzk2Wjk3RTJmVERGaWcyV1VWNHk4MGVQQ1Rm?=
 =?utf-8?B?dVQ4dVNPYmc1MG1BdytybnJlbEt1TU1GZ2JEYTBvYVdKTENseU5QNzBiTzZp?=
 =?utf-8?B?NzBUNHNqWmRXWXBUeDE4R1p1SVBSOWFKeHNpVEVCK1kva2lQZDJma0x2V0Jp?=
 =?utf-8?B?eXNGQ0NOQk4vdUwyTm5MUUtYalVqWXVwL2RjTDNLQnZKWXFuMkF5b0s1US9M?=
 =?utf-8?Q?Zcaqv9+6oDAuNRYxOx56N1yvc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf2bc80-a71d-464a-60ca-08dac88518b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:18:39.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PD7nsOss+DLJmDhhKC8wVXMzqS2g7uGMDJqa9Ip4KCUoQbBss+bg8WA5WaVxy9wRuTvMtrY+B5mJe02SwuVhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

On 17.11.2022 02:08, Andrew Cooper wrote:
> The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
> 
>  * All set_allocation() flavours have an overflow-before-widen bug when
>    calculating "sc->mb << (20 - PAGE_SHIFT)".
>  * All flavours have a granularity of 1M.  This was tolerable when the size of
>    the pool could only be set at the same granularity, but is broken now that
>    ARM has a 16-page stopgap allocation in use.
>  * All get_allocation() flavours round up, and in particular turn 0 into 1,
>    meaning the get op returns junk before a successful set op.
>  * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
>    despite the pool size being a domain property.
>  * Even the hypercall names are long-obsolete.
> 
> Implement a better interface, which can be first used to unit test the
> behaviour, and subsequently correct a broken implementation.  The old
> interface will be retired in due course.
> 
> The unit of bytes (as opposed pages) is a deliberate API/ABI improvement to
> more easily support multiple page granularities.
> 
> This is part of XSA-409 / CVE-2022-33747.

While I'm not convinced of this attribution, ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
albeit with remarks:

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -977,6 +977,49 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
>  }
>  #endif
>  
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    int rc;
> +
> +    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
> +        return -EOPNOTSUPP;

I guess this is merely for symmetry with ...

> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = size >> PAGE_SHIFT;
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
> +        return -EOPNOTSUPP;

... this, since otherwise "get" ought to be fine for PV?

> @@ -946,6 +949,22 @@ struct xen_domctl_cacheflush {
>      xen_pfn_t start_pfn, nr_pfns;
>  };
>  
> +/*
> + * XEN_DOMCTL_get_paging_mempool_size / XEN_DOMCTL_set_paging_mempool_size.
> + *
> + * Get or set the paging memory pool size.  The size is in bytes.
> + *
> + * This is a dedicated pool of memory for Xen to use while managing the guest,
> + * typically containing pagetables.  As such, there is an implementation
> + * specific minimum granularity.
> + *
> + * The set operation can fail mid-way through the request (e.g. Xen running
> + * out of memory, no free memory to reclaim from the pool, etc.).
> + */
> +struct xen_domctl_paging_mempool {
> +    uint64_aligned_t size; /* IN/OUT.  Size in bytes. */

While likely people will correctly infer what is meant, strictly speaking
this is wrong: The field is IN for "set" and OUT for "get".

Jan

