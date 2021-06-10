Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE83A2858
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 11:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139757.258354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrH6G-0001LJ-Np; Thu, 10 Jun 2021 09:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139757.258354; Thu, 10 Jun 2021 09:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrH6G-0001J9-Kd; Thu, 10 Jun 2021 09:35:44 +0000
Received: by outflank-mailman (input) for mailman id 139757;
 Thu, 10 Jun 2021 09:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrH6E-0001J3-MC
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 09:35:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9378f33-d42d-46ba-b2fb-890e13ecbc79;
 Thu, 10 Jun 2021 09:35:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-N0koyGfsM4mAvccMGC5_eg-1; Thu, 10 Jun 2021 11:35:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 09:35:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 09:35:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:102:b7::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 09:35:36 +0000
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
X-Inumbo-ID: c9378f33-d42d-46ba-b2fb-890e13ecbc79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623317740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l53C/sQpvdxNO+AMMq7KVDzxPzCP0wDnMDSJ26C6Xf4=;
	b=EHKL3vglV9hVjjrq+yCAUsXp6PFy9KLp/LCwwHVdJUNjZqAp9gRjtjSVH1UVy+la7WIuJH
	PcC19RcwD7veh+X3GUEuc/zixHUCfZ+JKK0iJuqx+zauiD5nDfaEdm2F16S65LXdnVwHqY
	YX9Qa4Ig/aG20koLiRhKjCWFGbiI9fc=
X-MC-Unique: N0koyGfsM4mAvccMGC5_eg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEIpSin8N5c1v34GMyfFkDrOgOFwboXOsQB0zKI0LZpyYm5KEfx3Z5mMbpWJ9ZnnvL7DgUtfrdraGJqDGCXgnyBlrpagepPaP41kH681RdOnVg8ok113JdvBASb2j30nJXBA5RxAxKOYlKCivuI7Btw1Y2yzvRN39L+8yoj5UiJh4TIbCUMWsGnPaJnsSmgU8HPhPnWtCD7icrBKNWwkd++d0327u+GoJnzXOe5G0v40ovh55rDwCob9WTvspHMov/+MMv4cD2qv/A6uRs2R9cmAxiHrvzRZCtzUJ+TKpmriSHATYFD0P2e4/8ToQl3HADny2gP0yCmS9d4kStgRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l53C/sQpvdxNO+AMMq7KVDzxPzCP0wDnMDSJ26C6Xf4=;
 b=oL/MLi06sJ/J9Oe386wpe5Rg23Dcyc1mpZEghbUlCqvn2Kb27PLmfL9D/c5d4VQUYWewfD7IgmpYgED1ARX7dIMBnaihoE7N828UaVBr2wZUr7JLAxOc8n42giBp00JMqhFzbA/WmafjHNsPzI1tcqLjWejo8zQ+1f5pdWt1YPCIeSN8JIU9Vi472IRB3W2tYX9jLkzy7dABbmA8DFtEPhD18EbyVWTDELaLlY2oeIM7c51Co0M4Qzu43CrZnTeafHrTaEGIqgur4cae5SYALUY5QLfwlgxCLDEW+111JqBSYUeK3vrAcuVddut7StmdjcpFaoMZrGpQnTKkY0CEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
Date: Thu, 10 Jun 2021 11:35:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607024318.3988467-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a270a6-fe18-48f4-b4ce-08d92bf31a6c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43527C6D82C79F3C114EF6BDB3359@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2VFpcRgjl8W0+Z3DzSCXFqAw1c9teDPFvsvSh7QpLD2yO5317aHGL/uvoy5vDw9YrODQ4NLBGrCMn/WuB4uO5CRUwnJa83sQ0LF/0fJJwqbHV6NZ/lKBkTLcY7vW8x2joC8lvr6mKD8zyOPtBH+PYscey+tsqxRZ2V9F3msdAXcwXhCjEaBkShIPTIU2Swhu+ufQE+DGIBD/2xNF4sElAp4TxeqWeBN+iW88INc3VUM85Qcl4OYLVmSyDnXYBBHhdqoXHXv+f1ARn9Sx7msgw9jgxIdu5nEB6aS7RE/lYIROfW6Ds9RFnoWAyp2B5a99puDp36LOyp3ktQk0H541ZOnNbewPX8I68z+jFqU+6PJRxJBl/6ZdPt6MwWFgMMt5/ydQczOo0joIpyegSKr+8i1wSBFR2FPCo6NoaYaXRQYkH4apfc4gUPaGrSxx6RE50dnYEQEjHwENXnGZRhGOr6HGUzfKctRJginXqXF/583Nu1w4cUdMG4c9lSW4h1uIX4pbW/ZTUqCLk10Ru/xYNsLuZJy1lD/cKtCzUYoi3PiLfO7o55KRREID623srb+mGtUY0FvcRhr5zZtT/9vtQRDQsfnGEbck9qdnKJqhM4Yjozq53BLvnga3itkIxN3pfaZbWs8T9X7dANyISKUb4/aWWQy5uqIcUK8FwG0kcu7DkerYBltxUFu/e/vX6YQ7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(396003)(376002)(366004)(346002)(6486002)(83380400001)(38100700002)(26005)(2906002)(4326008)(956004)(2616005)(36756003)(86362001)(16576012)(53546011)(31696002)(316002)(8676002)(478600001)(16526019)(66476007)(66556008)(31686004)(66946007)(186003)(6916009)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?ampPN09MSVNFSHJxM2ZISGZEaHhjS1JzVklMb0x5ait4azlZUzV5enhvNkk2?=
 =?utf-8?B?OEJDdldsdG9OMnFCaTArMDdCRTVoTXdteTN4NjJSczB5WnVnTnRCbUdoRHdU?=
 =?utf-8?B?OUtOMW5pd3lmaXJkc0k2Rm05RFpJWUFUOWk1QmloS2F1SFI5aU5PdmROWmNu?=
 =?utf-8?B?RkRDN0VvbmxTd1V0MlJMVk0rSDRBMVpNdjVRTzA3WGNrbUpDcERYVkhzR2Yw?=
 =?utf-8?B?WmlKTDRwdDVRQlQ4ZktVNlBydUNPSSs2cktmOWEyTzBmRzl0ajVtdS9vQmpX?=
 =?utf-8?B?T3l6YXloU2NWRDhkc1RrdEo0MGVTWGJ4Z0xOOGFiQWxMQnVSQVJFNnk5YTZY?=
 =?utf-8?B?d1NvRkV6MGs3TnRROHlVNE5JZmdTc3l6SVdMZ3Y2MkJUUkx2SmpHZC9ZN3Mv?=
 =?utf-8?B?aTgxb3AzMFQ1WHRpandEQUdmZkdNTFMvMHhhblFOUXZ2RjV5MlFZUU1pM2Ez?=
 =?utf-8?B?RmNwN051SGFUbnVZTUhMRkdZaGZ1LzN1YllncldXRFlYSVRsRGM4MllnRGhP?=
 =?utf-8?B?d09qakVyNXFrL05ndm5WMk1hdUNKUVVid3NWbWg0ZDREWmhtRDNQdis2ekcr?=
 =?utf-8?B?TkZYdVRaZEpWMFZiL3MzcWRRYk1ZRlRCV2hkaWJ4RStmZkdBdDh0cXJXb3k1?=
 =?utf-8?B?eDlHekNUZmRUUUN5djF3TXhOTE1nSFhUdWs4OUZ0RDZjVVdtQ2F1OThQb2N1?=
 =?utf-8?B?Q0ZOVy9FeDYzaWJiYVVsWm9OcDBMUHpUTjVzdW52eUFINUIvWU5vcFptMUFM?=
 =?utf-8?B?Y1Y2TWNrNHY3WHcvT2RIT05KaFUxUHVaL1FlaGNqQzZqQlU0TDZ5bUl2UGRw?=
 =?utf-8?B?aHdNdUthYXZiaG85eGNVeThjM1REakxyNWtVY1YwdVhpRHg2cWNhQUZEdkpq?=
 =?utf-8?B?Vk9BVmRQUzViRWg1YkoycENVbTZXY29yUlJtb1BMRzYza2tDNmJQcWxHcVFt?=
 =?utf-8?B?UVhoYytBcFJaZ1dOZ3EzZ095b2R1OFEvUlJ1ZnBSU0I3c29hWGMyL2sycG1N?=
 =?utf-8?B?NTlPbmsyUzZSbU94Y2FQNGdlMENkTU94SmZvV2FqWHprVjZEWm50eTNnK0dm?=
 =?utf-8?B?N0FQcUh4eDFzWHE1d2lIOU92NVBKMkprRzF5TVZjcUhkZ0hyWEVZUE5zYmww?=
 =?utf-8?B?UXVPWkJ1T1ZCZXZlNUdYeVVjQys5RmhCMm1xL1EvZC9ZKzFwRWwzT2xMSC9s?=
 =?utf-8?B?cDVHVUZUajk3T29oYTF6eDJHL3FNY1hQZURwdlNtSWREUjBhMCtDcGpWUGZD?=
 =?utf-8?B?TmNjZlIwVWR0Yk1xWU9NdWlaUW8rOExxRndZb1RhV0xGUnRzUUowWnhIZFRP?=
 =?utf-8?B?aUplc2hRc0YrcEk5S1dwV3BQcituMFQvcUtnY216T1JOK1VuSWpJWUxiOXBV?=
 =?utf-8?B?Y1BESmN6R0RFZWIxRERSV1NHMmNrWGdrdHRCRkNLSGU5VDRJWE04Qkdza1ow?=
 =?utf-8?B?d0E4YjZIaHZLa0ZVQlZCMVgyNHovdmNXeklSM0xNWHFUNjhlNFNHMGFPeU81?=
 =?utf-8?B?WlBIVGNVUHlCcll0QWwrZDB4b1JpZFpPRHFvblhoRzkvMlNKUzZ1dWlONEgv?=
 =?utf-8?B?V2VoZU1FYzZwZ2RtRkc0UCt3Vm9LdU1NR2pTZWF2VDA0QjE5YkFSeVVyb2Ev?=
 =?utf-8?B?MEw5WTI0c0FIL0VKZDZDYkZzK3lVWVpQMXJjcXBtTllScUxrRFFLY25XRlhz?=
 =?utf-8?B?NjlpNFFvVkZQclhOQ2w1RUN2ajRhNXRFajI0VGQvSjRCUGgrSXhjMi9nZVRJ?=
 =?utf-8?Q?dXHFrLbXTY8NZRFSFsRjgy2twEkaQDXn1HjS9dn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a270a6-fe18-48f4-b4ce-08d92bf31a6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:35:37.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjVEtamION/NddeOh3alTm+odimExh1tn9cYGn7Gvz2MTuFpSITbF98ibcknstcB2eKAz79N4+RmLXgNzvtqpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 07.06.2021 04:43, Penny Zheng wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -611,6 +611,30 @@ static void __init init_pdx(void)
>      }
>  }
>  
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    int bank;

While I'm not a maintainer of this code, I'd still like to point out
that wherever possible we prefer "unsigned int" when dealing with
only non-negative values, and even more so when using them as array
indexes.

> +    /*
> +     * TODO: Considering NUMA-support scenario.
> +     */

Nit: Comment style.

> @@ -872,6 +896,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>      cmdline_parse(cmdline);
>  
>      setup_mm();
> +    /* If exists, Static Memory Initialization. */
> +    if ( bootinfo.static_mem.nr_banks > 0 )
> +        init_staticmem_pages();

I don't think the conditional is really needed here?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1376,6 +1376,37 @@ bool scrub_free_pages(void)
>      return node_to_scrub(false) != NUMA_NO_NODE;
>  }
>  
> +static void free_page(struct page_info *pg, bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);

With pdx compression this is a non-trivial conversion. The function
being an internal helper and the caller already holding the MFN, I
think it would be preferable if the MFN was passed in here. If done
this way, you may want to consider adding an ASSERT() to double
check both passed in arguments match up.

> +    /* If a page has no owner it will need no safety TLB flush. */
> +    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> +    if ( pg->u.free.need_tlbflush )
> +        page_set_tlbflush_timestamp(pg);
> +
> +    /* This page is not a guest frame any more. */
> +    page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
> +    set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
> +
> +#ifdef CONFIG_ARM

If avoidable there should be no arch-specific code added to this
file. Assuming another arch gained PGC_reserved, what's wrong with
enabling this code right away for them as well? I.e. use
PGC_reserved here instead of CONFIG_ARM? Alternatively this may
want to be CONFIG_STATIC_ALLOCATION, assuming we consider
PGC_reserved tied to it.

> +    if ( pg->count_info & PGC_reserved )
> +    {
> +        /* TODO: asynchronous scrubbing. */
> +        if ( need_scrub )
> +            scrub_one_page(pg);
> +        return;
> +    }
> +#endif
> +    if ( need_scrub )

Nit: Please have a blank line between these last two.

> +    {
> +        pg->count_info |= PGC_need_scrub;
> +        poison_one_page(pg);
> +    }
> +
> +    return;

Please omit return statements at the end of functions returning void.

> +}

On the whole, bike shedding or not, I'm afraid the function's name
doesn't match what it does: There's no freeing of a page here. What
gets done is marking of a page as free. Hence maybe mark_page_free()
or mark_free_page() or some such?

> @@ -1512,6 +1530,38 @@ static void free_heap_pages(
>      spin_unlock(&heap_lock);
>  }
>  
> +#ifdef CONFIG_STATIC_ALLOCATION
> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                 bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    unsigned long i;
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        switch ( pg[i].count_info & PGC_state )
> +        {
> +        case PGC_state_inuse:
> +            BUG_ON(pg[i].count_info & PGC_broken);
> +            /* Mark it free and reserved. */
> +            pg[i].count_info = PGC_state_free | PGC_reserved;
> +            break;
> +
> +        default:
> +            printk(XENLOG_ERR
> +                   "Page state shall be only in PGC_state_inuse. "

Why? A page (static or not) can become broken while in use. IOW I
don't think you can avoid handling PGC_state_offlining here. At which
point this code will match free_heap_pages()'es, and hence likely
will want folding as well.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> +#ifdef CONFIG_ARM

ITYM CONFIG_STATIC_ALLOCATION here?

Jan


