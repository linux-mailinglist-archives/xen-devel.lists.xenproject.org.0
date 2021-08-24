Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852F3F5CEA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171166.312473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIULS-00023v-Gn; Tue, 24 Aug 2021 11:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171166.312473; Tue, 24 Aug 2021 11:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIULS-00021e-Do; Tue, 24 Aug 2021 11:11:54 +0000
Received: by outflank-mailman (input) for mailman id 171166;
 Tue, 24 Aug 2021 11:11:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIUFL-0003ls-FN
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:05:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbc3882b-04ca-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 11:03:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-pJa1RFsuMNmKdwwRcq2uPA-2; Tue, 24 Aug 2021 13:03:05 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5217.eurprd04.prod.outlook.com (2603:10a6:208:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 11:03:04 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:03:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:208:3e::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:03:04 +0000
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
X-Inumbo-ID: dbc3882b-04ca-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629802986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgfXHDHphN2Fw8F8fIRnCOYdf0FiQrXZkVg4xMq3sr4=;
	b=E8bG1gsa3NLDx0nKY3UlrLLFhfN9pmnOjsbrsTnlv0HZOo3P6fY20U3TvvcpDqSnlBU69/
	POlwWQUipe+3pUAGfltaqx+jl4z8SJezj12rjnTo6WyQ+5Xr1nhNtQ5U7tp/GPrJ0x4hZm
	a8EysTz3sQzhEFuTYWVrnrlkzsT2zJE=
X-MC-Unique: pJa1RFsuMNmKdwwRcq2uPA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3ob61oHY291fkfEP1JaeR4ffCY39ndhQh62NTqUt66rwF6pD26FTGrTJGgzCQ90Z0ARWG9SgwE1UzT2SA4DSIKKWfwtB+8Og/brAK7qeC9i8BSX60ea/aY+5zKssH4viG7t30PfM417iagz1LlVz91Oo69f7+yvG9RNrhxnLYSbbf5IyP7lh/VkUIIqr0NUw9xjmqSgMTi0dxk6tWPplKm5xn8ObpcY1wB8y/cRJukqTAn4C3ZOYfMLI9RVpfQSpdpI67vXG1zBInUrDLBEU4abzcyHN3U8dRTHx5+OJ5FMjLSC7uF77RR1tu6wlVdXOIEnvhuoe0DliD7YacM6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgfXHDHphN2Fw8F8fIRnCOYdf0FiQrXZkVg4xMq3sr4=;
 b=EpzqLAJ65NvVUVGubmpsFchfPGcaYqZcsJAFnN9porIO+ugbz0skmyJ06ZybGs+L6EDWY0UsCeIJD9Ia1X4KApZw/FRHZFr4WT/PJXTFylcuczEMDVZew5u3ZcJ+or7yy3cmguCIcChjeBARBkvSucwblfohJTUAiKPDUgJlwwiZ2C6FsfxhuAbczuAwTpmlNuhjiRRGsXWDODqgEy/PBZLe9Gbkgv75sY1rlKNhUhNv9kzeDX9tOZlmVC+C7yL9uRnID0gbPN8XghzeEfO+Cst8t3ck1GEGja3k+egxnUxHyBLud53357H9W23fOIxI9QRshyvK3/YTjgTBNJNn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 6/7] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-7-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c072e886-16ae-e271-ab1a-669561312c1d@suse.com>
Date: Tue, 24 Aug 2021 13:03:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824095045.2281500-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::44) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b8533fa-d508-4d1f-2d57-08d966eebf19
X-MS-TrafficTypeDiagnostic: AM0PR04MB5217:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5217CCAB0487BE3262347571B3C59@AM0PR04MB5217.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w620F4B0Mx2eq7iLJtQ5IYg8bDmRDm6NQIX8vt8Fnm/1bdArIXy1w3phqidx0UzfDlWYg1nrFgdtyGTo98/OIkPuJB2u4g+nla5UIfKuDy4SMtKz+4mobLjbeUa56xVqu48JY08JZfR6ADRNbp/8lN1IgrY3uBLzBNAlbimfYHVb0Rnl0nNwX0Znu13elp5QVc/Lc1e4eh4WM/8f+UIggrKrppntFkEHwa9zLmgtvlTfZf4L51OO/Sgy1GLIl/tRMwCjrB+ZwUOC63+YAM30J4L1PUwbrQZp+Z8zkWzyI4VFxpnTo1ZivYzhZEi54rh/C1ES0aZncOPc5jsLGB5ol8VpKPSW3ME5xBuQJECwkphXYPbhibFBjfEdQXh5Qw0T6GCjj6dkTyIRL20bRLMf+RTojY/Rw0ia567Zej4U36XSLMYH1/lgImIDhE1OjimRBQPWLRN4IILGQoOuAYrWM+GHoqtdIrILFrPtjMEj/v1ThNb4/yjQYulOP6Pbbww7XrZHtGdC/mQMXL5iAlt82Bnwto1/M3J7zF3fdBPTtfT6tZZtov22bAuvKJu+XydDXH/FxNwQkRoOxD76L6PvEDWFmpkDLM3XrgeV6xcjz9jetpGPMdc08hFi0nz2G14qloAQ2odFuObAC/k6e+Nu25BAw0eXU7X8CKOgEizgUKsnLobbxApXxmfRSJmm7AuQTwzwzw15AA3gz4AnIBF2CccNOP/1TlHNRy4bgIsIfdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(366004)(39860400002)(376002)(38100700002)(66556008)(66946007)(8676002)(66476007)(2616005)(8936002)(86362001)(956004)(16576012)(316002)(26005)(186003)(36756003)(83380400001)(4326008)(5660300002)(53546011)(31686004)(478600001)(6916009)(31696002)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlSZStyYXVqeFRSYUtaZGlXMk1LR3A3cDA4RCtidnl5dVc0WnRwNEw0UVZX?=
 =?utf-8?B?QWRGS1hNUnpMZHZlMFJ5Y25Nc0ZSR2kzNGNtZ2VlVHVhL1dmSStUbFFrTGJw?=
 =?utf-8?B?dnVWd2tPSUg4SFpZRXRUMllJQmRpeGkzbW9GNnhBb1EwSmVHVTFGZHMrT20y?=
 =?utf-8?B?L3d5bDlvOEtXKyt1N1pOQzBzTHB3NVdKU25YV09KOFc3eitsTURWTEI4R1cw?=
 =?utf-8?B?TUtQejhOWHV6MlZRb3NpbllyTGxrOXVvejFKUXJtcUlvcmNEdnZSRG1NaDVY?=
 =?utf-8?B?ZTFtWWFNN1Fxc21FM2xNOCtxTndyOTYwSDVVKzA5WnNaK3pqMWE4bkdjNU5Z?=
 =?utf-8?B?dnAxSEczb3FrM2pXSUg3THRMa0dIZzhlcFd4MlIzNm9DK2Z3YzRraXZGaWF3?=
 =?utf-8?B?THRvOFFQMHZOSzBHNHd4ZU0zY242WW9hS0tNd0x2MHpNMk5yU2RjWG16VEd1?=
 =?utf-8?B?dm9rK2tMVnBieFh0NDhwK1lZaE1uT1k0SnZLaFV6MW53TE8rb3lWeEIxYmsy?=
 =?utf-8?B?dGxZZmJUaXY0UzlCSUlSOHdzR2hpWEtrLzFnVmxRSWloamZxQWhMTzBjVzBH?=
 =?utf-8?B?eVc3bnZZUzQzTkpBSURLd0FSRGFpV0tQcGwreWJweEd5WGNHY1ZWUFhXNExw?=
 =?utf-8?B?OHJjMUpTMEJNRFpNY1NDbm5yd3lWL0FTZmpubWxqVER2Q1BLZlFvaUowTG9B?=
 =?utf-8?B?NTFwa2ZlNUdQTDhBNkk0aXRFTXM1MEpMN3VHY1ZCR0lFUkxUS09MSjBqcFNR?=
 =?utf-8?B?bnZCOXdzV250elNnVWlOcjV1ck1ONnZxVlFhekFFdE5zR29pOWtOMUNiNXZS?=
 =?utf-8?B?dTRFQ1ByZ3BDZlRsTVhRNEVoS0M2bEhLOGJiNW93VWlFL3dyR094OUZvaUpM?=
 =?utf-8?B?cURUMnBzS1Ryb2Z0bjZ6RkpLVEZsTStOc0ZoSlJmc0NIL0EyOFU0b2JLR0ZQ?=
 =?utf-8?B?Y1c1Yks2bHdCMmxldG9PclhKR0QzR2ZHUCsySHIzUGJ3Q2IxRnZEZzdPdjJZ?=
 =?utf-8?B?VWhRb3MvUVkvQzhoNGplQ2RIRDM1MnFpamZOcjhrQVVjQWhRSU9xOVpyRlBS?=
 =?utf-8?B?b0FheHVpTFhtK2hlWWpNM3ZpVWU1ZTZzQmtpVGNUd0s0WmhUMjM3aVJXZjYr?=
 =?utf-8?B?SW5idk1WcEZzVmUvUThyS3cvRzl1K2NxaFc4QklUZEp3V203cWRBWEZwV2Fn?=
 =?utf-8?B?YWdWZVNoOHkxVEZ1RTJzb3diTUgvMkFBSm1QYmFJSm81d1UyV2crVlVDRHV5?=
 =?utf-8?B?eHpQejFyQUxBMnZoLzM0UVlQdDJVVHVpV1hZaFdMUkFVakxFcDZ4VlJwa01H?=
 =?utf-8?B?ZW9XcUhGTW05Y3ZYU1dEcjNxd1BuN0JCTXJweGpmN3luUS92NklpbWZnMTJ5?=
 =?utf-8?B?VGY3MFdwWm9wUU1IUUhpQkxXbmg2ZU5BMkZQNlYxRnpyN291dXUvd3RXMjhU?=
 =?utf-8?B?amFjTXJNQlZ6NjRoRzNubFFFTW5rZVVCaFFXSUJOSUwxTWtrek9Qb3l6ODMr?=
 =?utf-8?B?bHUxOXZqQ05DbVcrUzB0RHY2QzBzUEVWUkpKTExRZHpjM3BQdFVEUDExaE00?=
 =?utf-8?B?WXYwS2lOMitzanFwd3FyRi9waXpreW5ITExDaDhoUVcrRy9oYXVhUUNPc28v?=
 =?utf-8?B?VEJDNy9vNTVkcms0R0tHUTVPZ3hRQ1ZXM2lhZmRpV0x6dWtqUWl5ZHhhcDVF?=
 =?utf-8?B?eklhMk1WWGpDb2lEVExmOGNoUVVsK0xLYXBta0hWYjMxSkZxMHN0YWlLbnBr?=
 =?utf-8?Q?vKvWJeFgBiZtepklOAthFVcJPm23liLn7zvRVF0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8533fa-d508-4d1f-2d57-08d966eebf19
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:03:04.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8tyd7ZaStZ8o6gH5yB+pELndTh0H1kmX+AhGw4F3dIUN5KAG8xzImZcXXmug2ydAvQlPe81vD8KHa18awW0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5217

On 24.08.2021 11:50, Penny Zheng wrote:
> +/*
> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
> + * static memory.
> + * This function needs to be reworked if used outside of boot.
> + */
> +static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
> +                                                         unsigned long nr_mfns,
> +                                                         unsigned int memflags)
> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    ASSERT(nr_mfns);
> +    for ( unsigned long i = 0; i < nr_mfns; i++ )

This form of variable declaration gets warned about by some compiler
versions and may only be used once we settle on C99 as the base line
language level. There's one more such instance below, and the one
here is even worse in that it shadows a function scope variable.

> +        if ( !mfn_valid(mfn_add(smfn, i)) )
> +            return NULL;
> +
> +    pg = mfn_to_page(smfn);
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /* The page should be reserved and not yet allocated. */
> +        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        {
> +            printk(XENLOG_ERR
> +                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(smfn) + i,
> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            goto out_err;
> +        }
> +
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Preserve flag PGC_reserved and change page state
> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = PGC_reserved | PGC_state_inuse;
> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
>      }
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    /*
> +     * Ensure cache and RAM are consistent for platforms where the guest
> +     * can control its own visibility of/through the cache.
> +     */
> +    for ( i = 0; i < nr_mfns; i++ )
> +        flush_page_to_ram(mfn_x(smfn) + i, !(memflags & MEMF_no_icache_flush));
> +
> +    return pg;
> +
> +out_err:

Please indent labels by at least one space.

> +    for ( unsigned long j = 0; j < i; j++ )

You don't need the extra variable here at all - simply use
"while ( i-- )".

Jan


