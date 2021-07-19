Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB4A3CD0B0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 11:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158249.291439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PXS-0005ju-JV; Mon, 19 Jul 2021 09:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158249.291439; Mon, 19 Jul 2021 09:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PXS-0005hZ-Fi; Mon, 19 Jul 2021 09:26:14 +0000
Received: by outflank-mailman (input) for mailman id 158249;
 Mon, 19 Jul 2021 09:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5PXQ-0005hT-II
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 09:26:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a6edc21-e873-11eb-8af5-12813bfff9fa;
 Mon, 19 Jul 2021 09:26:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-45yaosxyNrCCNEj7fpB6fg-1; Mon, 19 Jul 2021 11:26:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 09:26:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 09:26:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Mon, 19 Jul 2021 09:26:06 +0000
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
X-Inumbo-ID: 5a6edc21-e873-11eb-8af5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626686769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpvKOl/SIqEGF6Rn34hhDb+f33JgWt/bwbMjt7i3T/k=;
	b=hq43ZForrEUL6mdBQZNBn0fpuePPvMAHYZqqwL6sgjCOqf6JI9FF2k+mNI8ja0/FEAkHvs
	ysYu7nAqFGn/t7tbYRZEBM3RZi6fr2zxlybOwV4h1jKMKt43YeX8K5wKH+8mI9hV7MO1cC
	LcUYhkzFggZ4lwLLYTyALh0TYR1Ib3k=
X-MC-Unique: 45yaosxyNrCCNEj7fpB6fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8xyUfVNq/tqBitXQNV1yiKxwP+oqlWIj1MG9hdG/PwjRLnh75bqIDtSamYRt1z5CLG8rilgCdEYn3S+tXS0S3clnbLiXm8keIfE6zeJHZX6cLHasnA3tUroXhS0zVggsxC4b5nOd3qzCZFvEBQoyiAnXZ3Ai/D5h1jvyaNmmiwzP6inEU6watEmgc5nuVBT6OZEgYsllx41+7KQQmk76nu1DfQbMA+p/uFlkEjWAaWaE5UClPnA8xVYV0hPyXGUUleQvq7Ca+gwg+y9UPUiHr+nMsI7Tq/OGSJX/alfhSqX50yV85+KnKwgEuj+4leR6gEWOjZroN5JGpb4aEY0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpvKOl/SIqEGF6Rn34hhDb+f33JgWt/bwbMjt7i3T/k=;
 b=g3fEiLqPcez2ZnM3vjgc1rxUZj80V/w7IPaNttmTomZ3vjv77Ly6Gycv6yeLvSHHuFQ3OxIRe6pXxo9P+FVyTGbV/72gKRrJHFUIJtFVVfa0kXaBKtTHNmJLejOLaz7FC4PdddM00+LHoiukrj2gVLIWnap3LWv31Ham1XfJU6MxeBtsQts2lDMCpNYuzRMv5GUH0BbKusXtiMXOGzqc5HUabIRG+aGL7MoX9uakXXxeK9AtY5YT9LBBZqK8dFjyFssiBXxPOIVnybZSG68BlUXxjiD+dlqn0Jbb/3UtpL4vWnkY0d921yhaTrdTcR3fCbi3hoP25EzdbWVshJGshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-9-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48c59068-296e-7060-1352-f07338833378@suse.com>
Date: Mon, 19 Jul 2021 11:26:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210715051819.3073628-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a761e972-7464-402f-b277-08d94a973c7f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597EB872F9607C7516922BCB3E19@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MLjFXq1JClv13mtDXWnw9z69h05pYcATrZfQoymXHm65GZQNbI3inB9BFxQlYLOw/QwTZwwF7rAXpYZ9RH0C7rKDHCq1obRMIJ1Ql24H8FqvTXDFPa2/zULs36ro8UXGln1tU7nVnKU1wMB3TiBrwbXwJz08VZclp7cNYXfNw0MuC+srJZuV4ScKJLGup2eLmG5rvkW/gCytfo6r4SSxcVKwmJ4T3ITUlmSTlMbxYoNJ+cRGuJO5PI37qqOQF/GoJ9Xbqvq3JNYmBsvcWU8VqG9KfAqnulSV7xwJxt0Csil/rNjsl3e4TilxF5yFJq1nhXUxuJ8OaNDdXxjBDbfgHaI2Fi83vFzEWWX+GKIoM71eHheydcINWkFBXDsSE1m2lw8Wen6eUbDR6rG14f9+eqFGo8II4LkOdKlICu2a+tFTxR4mwO2AMh9frXXVz5l5lg/afkR0WVmxWCsRg2AS1WH4ybudks+tFnYSUkTJqQVPMsK+x2v7Dnci89uExLFlxigfGZfAJUGrTEOvoG1Ep1LfFfkph6xU7rMRkyagB8MpyxxdgAtkUsJw9GZoe2mxZrPA/j57wkZWa9KWRFvwb0ECOt3045inDvhYNLe06VnMYh8MBUBXaYNpzLYgFpg3B6TVd+w5zG80UIXGnCADIQjo6vCTY50RnkwQB92mFxMUhjqP0742c80iNfHZduRo4XkkTlfm/m/f7rQTLO45YBWKwDHZRdnYEcWW7yKB5lA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(376002)(346002)(136003)(396003)(26005)(6916009)(2906002)(53546011)(316002)(956004)(2616005)(16576012)(83380400001)(36756003)(8936002)(186003)(4326008)(8676002)(31686004)(31696002)(6486002)(478600001)(5660300002)(66556008)(66946007)(38100700002)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9VWWEvNXNqNCtXaENDRVI5OThSdm8zckZ3NThYL3ZiWU9SbjY4MS8wZzZo?=
 =?utf-8?B?ZWNlZzFQeW82L29OVkI3WjdzMVhDWXBycVM2RlRYaVF6c1JRQ2wzdDhvRE9S?=
 =?utf-8?B?dVUzV1QwREpUTk5rREsvY3ZhNHlQeWdCU0NmY2xkRnNrbUNzTlhxN0drVVEx?=
 =?utf-8?B?Vmcxb2NqV3dEemhISXVCZURIcS9IbVBpN0Fpanp0V0twVklNeG1ZaExKNERU?=
 =?utf-8?B?V3NaNUNzd1JaTEQwblUySWxqekFZYWN2QWltNXV6NVlLd3BnNnBpUlJZdGgr?=
 =?utf-8?B?OC9aWHBxZ0swdG9nNGhydnVlR2g2R2hTT21zZjdETU1DUE1vYXlRNDlpQXRH?=
 =?utf-8?B?YmhocHJMT0E2ZGp6MWhSM1Z2dUVGN3V3L3h0S0ZDL1ErQWFPMTN4amRsS0Z6?=
 =?utf-8?B?V05KUHAyM3RxekNXeWhtaGkxQW5POWpjdlZvSkhaYXQrRHVIeS9JVEVqOFNY?=
 =?utf-8?B?d2R2Y2VGRmVLN0N3WjRjdGdBMUJqQnBqLzBHV3QyNERsNUhSbU9VVGJLOFlx?=
 =?utf-8?B?ak50aUpPQWpnVVVpYnVjMVI2MHJETy8yb3MrSGx3dzZvNnFRbkdiOEVhU2Nx?=
 =?utf-8?B?ZENuMUJ3Qm5OZ0NyTGswZG1ack5KT2NlTUk1a1htdThVUVdnWUlUT0JNYStj?=
 =?utf-8?B?dE10Q0xhWHlkcURBMFlGN0dCRzNVUGdUUVdiUGR5TzVHMmVWajZHSi9uSlZ2?=
 =?utf-8?B?WE8zdzg3VmZBdTZqWGhsTEwxd1FIOThOQlVLSXpsWjREdnFHS1RWay9tQTA2?=
 =?utf-8?B?QUtzZ0gwZUM2V3lnTW9ZcjM1VVgrSXhBdjBVdEN4cVlTdW9rcXJFQ3RHcnlm?=
 =?utf-8?B?a3cyeTI3RTIybnV0MitSTlZnYUlUSEJWOW14WnpoWlVidlM2ZnBmRnFLS05l?=
 =?utf-8?B?bVQ5UFFwaU43d3JaK3loMEdQaENIa2t4aC9tNk8ra3g2dWpOM1B0aXB0ZzM5?=
 =?utf-8?B?WGN0MjdOQjNXTlZjOTZkenczMjUxdW11WlNJYmVzekRyb0tjOE9hWkVYSkJm?=
 =?utf-8?B?SENMOVJYL0VJTFVCcks4TlA4VkJsZFRQZTlUWm5DWFUwdm5SUlcrZ1NmWG1I?=
 =?utf-8?B?MTY5UHJFajFsOVU0ekVVRnNPK0Q2N0lLd3FDS3lvTzJEMTk3TnFCc1NscWFT?=
 =?utf-8?B?clZnN0dNVUl3clNETFNRdnp2cDkxU29LVG9mOUZmRzlCUk1DY3Jtd2dJbWV4?=
 =?utf-8?B?MkxUVGJOU3pnS0d6eXNwQnJEWS9oZWxQYXB3RWdvenptNTBsRUdxN3U3QVZY?=
 =?utf-8?B?MVhPSkluajJTVGYrYmk4VGZSUFZNaUl5Vi9rY3hWTm51eDFwYWRXSVVPNXJ1?=
 =?utf-8?B?QTdnSVlxZVI3dzZlRjZOYUw3a1pYc2h5RlN5QVU3UHl5V0dOQ1JQOVp4YzdP?=
 =?utf-8?B?YkMzTm4weDBYRmh4bU9tSXorR0JIR3l3bmcxU3VIRkpnRTZzb2JOY2cyNElE?=
 =?utf-8?B?Q2dFeFRNeHFBOVpTY2ZoUVBKNW5NS1NvSjZ5T2xxSHlUZXpZbUxsZmNqWHF6?=
 =?utf-8?B?WEpGVlAxRitzT281bkF3N1RMcHVXbE01UU9aelhNVGdtZjhHSEtoVmNnM3hu?=
 =?utf-8?B?Y0RSc2E3WlpGZERneHY0eWEyVVJ5N3ArNlk2bVBlNmpsaExaei9PQVdNL2RZ?=
 =?utf-8?B?bVFVYUNwZUFYcE9ESnFnSHRXbmEyczN0NUI1SE9CeFdoNG0xdzNqOElmOGhB?=
 =?utf-8?B?a2NYRFBZNUJ0ZmFsL3dYMWNsa3pWS0hIcUszQlVrRDZPQVNKeFlodjFnWXB2?=
 =?utf-8?Q?GpHDKulIb7yEUOMEMOjDpIDt/zHOJ90NT1HHJQL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a761e972-7464-402f-b277-08d94a973c7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:26:06.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D42IcL1eLroV7Nafd7iGuafmREHmrWxhLaUySbBIsT1+6CdgjICVQ2tCWmKw1abDNN2pqqIL15WlXEP17n7lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 15.07.2021 07:18, Penny Zheng wrote:
> @@ -1065,6 +1069,73 @@ static struct page_info *alloc_heap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/*
> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
> + * static memory.
> + */
> +static struct page_info *acquire_staticmem_pages(unsigned long nr_mfns,
> +                                                 mfn_t smfn,
> +                                                 unsigned int memflags)

This and the other function not being __init, and there neither being
any caller nor any freeing, a question is whether __init wants adding;
patch 10 suggests so. The lack of freeing in particular means that
domains created using static memory won't be restartable, requiring a
host reboot instead.

> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    /* For now, it only supports pre-configured static memory. */
> +    if ( !mfn_valid(smfn) || !nr_mfns )
> +        return NULL;
> +
> +    spin_lock(&heap_lock);
> +
> +    pg = mfn_to_page(smfn);
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */
> +        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        {
> +            printk(XENLOG_ERR
> +                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(page_to_mfn(pg + i)),
> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            BUG();
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
> +        pg[i].count_info = (PGC_reserved | PGC_state_inuse);
> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
> +
> +        /*
> +         * Ensure cache and RAM are consistent for platforms where the
> +         * guest can control its own visibility of/through the cache.
> +         */
> +        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
> +                            !(memflags & MEMF_no_icache_flush));

Indentation.

> +    }
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    spin_unlock(&heap_lock);

I'm pretty sure I did comment before on the flush_page_to_ram() being
inside the locked region here. While XSA-364 doesn't apply here because
you don't defer scrubbing (yet), the flushing may still take too long
to happen inside the locked region. Of course there's a dependency here
on when exactly the call(s) to this code will happen. In particular if
other DomU-s can already be running at that point, this may not be
tolerable by some of them. Yet if this is intentional and deemed not a
problem, then I'd have kind of expected the description to mention this
difference from alloc_heap_pages(), which you say this is an equivalent
of.

> @@ -2411,6 +2483,42 @@ struct page_info *alloc_domheap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/*
> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + */
> +struct page_info *acquire_domstatic_pages(
> +        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
> +        unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;
> +
> +    ASSERT(!in_irq());
> +
> +    pg = acquire_staticmem_pages(nr_mfns, smfn, memflags);
> +    if ( !pg )
> +        return NULL;
> +
> +    /* Right now, MEMF_no_owner case is meaningless here. */
> +    ASSERT(d);
> +    if ( memflags & MEMF_no_refcount )
> +    {
> +        unsigned long i;
> +
> +        for ( i = 0; i < nr_mfns; i++ )
> +            pg[i].count_info |= PGC_extra;
> +    }

With MEMF_no_owner now called out as meaningless here, what about
MEMF_no_refcount?

Jan


