Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20F406805
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 09:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184123.332686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mObL3-0007do-9r; Fri, 10 Sep 2021 07:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184123.332686; Fri, 10 Sep 2021 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mObL3-0007bX-6E; Fri, 10 Sep 2021 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 184123;
 Fri, 10 Sep 2021 07:52:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mObL1-0007bR-Jq
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 07:52:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75db1c2a-ea9e-4f8e-a82d-73e4786aa680;
 Fri, 10 Sep 2021 07:52:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-0fZQqXS2O0OERv7fL145BQ-1; Fri, 10 Sep 2021 09:52:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 07:52:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 07:52:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0018.eurprd01.prod.exchangelabs.com (2603:10a6:102::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 07:52:36 +0000
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
X-Inumbo-ID: 75db1c2a-ea9e-4f8e-a82d-73e4786aa680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631260361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vICiYVtqGfp9eW6V/8l6IFgWwdeWllZwzXOLg3Q9tQ=;
	b=YpsUkS6Zpk1X26k4+30nz/44fpQHg9QhlXCkMMGm4tI3gDV6dKiTIrVlFJT4My1m8TF3AS
	0eVLdpbY70hK9pFOF+FR9tJDvs7Pu1bkVZLjnO6SU8qtAIKkqDVeLq5cS9nx7rnSOfNHXY
	PjkK5/5isuugQfKyPsyJ8zMRYfjMSJY=
X-MC-Unique: 0fZQqXS2O0OERv7fL145BQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrA6SFZlse8tmXgSRdT4hivXmMTtr/PnM+5Y3jQ32mVLiUzh2DrNoejd/NxBmieFNDExcEVP7BORVUboIg1zxskJo0melJcVg2UgGqt23beHNx72wNStTRVAVQgfu+O5r7Kt16fsZyav+UdrZYYM1nkgR6UDftw+0qffuW1kJhZk86LddZoMfWkvbYDxrzIeIi8YLsbgnFmfvVpIBpYFSPytAIxWgvdqyJEAlGQu+ugElSG1ZJSrRaMpfj8ofJWs5QfaBKj2HmGeNVLBYq6Z+jJe0BwJ189zIzzfhj3xd5WForHBP6D8DRH7GFaUopG3JQj3hlmlqQrfdLIai7F6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6vICiYVtqGfp9eW6V/8l6IFgWwdeWllZwzXOLg3Q9tQ=;
 b=i3tuCm5uQMYMcayBRQlCmzdMEo9ON0vmA9A9NuDZEUWw6qd25+o6wMXEOQGQ+GsWNTRxRNh4kuAbtuhtfnOtw+RcVF66IfpRjMroFmPh/LuQRaLnyXDcvFVgYQ1LsIeJf4ssZs2wFQ+ztKqzcbrZY7ZT1U5FRL5yRqgeRVLFQPnoiXoqrv4TcjiwM+mV6t5NyP9U77Dt2sMnpLka9biUJLWvC0uw2/+AcvInoWcArDqSgX7zhvobAJAsQFB8tF/uCfwEA6W55/LppYDg5DiFeqzPSntt5rvOZhtPkMXd0v9xT1UXwUtKjaGHhiGG21oNttCSOKm8sdmUYAERdklzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
Date: Fri, 10 Sep 2021 09:52:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b324d15-d55d-4d4b-3841-08d9742ff51d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB560096F20E1E58A9CA1A48B7B3D69@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ytbq+jatCFD51Pu9vfRwqfwWVThJUsUMuFQf6cTD235sDSs5OduPNa/i8+cSRfKR/dL4Wos6dC/te6WPH6pkVAiRVjmCK8wA+ZtDmOTy+1OzbssQLv0Zr2JWbm2XzR25BJmjNKMLvW5VkTuVyynqNKFlLRJtcsg/drLHJ1POQbIkfik09N9s4JFoPuA8bY6hbzQ1TUj3tkLaaJ8ITTgxQHr9SsEo8DamNlm5tOtvqhtAxtedvk5wmSJ/mdbO21a3z4unyfUpUt/CDA2Ooi8lYdrccgBd3PsFwG6hfez+tZHK181440FoTSR7GQy9saExCp21bShIxXHuZYqBtBZouE1pUjFOGrL3tBkXe7mYyVFMcpMc2zGeXg3IKDjd9vdXSqaWy+uC+EeQzvlwew4kYcBtg8zZzDAl5rznOrAVNE23eARsyuYF/SCMEmeUrz+NRcMmP81Si615MFjQ39NL2Tr9lZmF8AVXWDajAy+NGuUcpooas5GwLUN0Nmzc1bIKxRzuIZprRFlGOHben+RjHhOhOoousz9GQZ5ufasQ5jzLIrR0S1X3PcirzNkDoY5W0rvEa2fFR1INeMOwDHxjuPp0zWijBLVKDOC97SJBFO3VBrWqBQnRJCQw/WwU698sd5vMDx0pIC5UKb4znEsynwUVy0NFRMp1Hq567wLnnZ11vhA385ky645+yf1Hp9IMrKtCpicQE5iunkRmHmhF5Pt61GID8C2Vsumi4DTPGjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(16576012)(31696002)(66476007)(956004)(4326008)(6486002)(38100700002)(316002)(8936002)(186003)(2906002)(54906003)(8676002)(26005)(6916009)(31686004)(53546011)(7416002)(5660300002)(508600001)(66946007)(83380400001)(86362001)(66556008)(2616005)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVRjTFhheU9DdmoxSzRaSi9LeWxBR296NmRkQ290eU5HUkVseEJzVGlNbFR4?=
 =?utf-8?B?Y1FiQzNOeGFFb3djSmpodWUxVzl2TCtUaVZyREh4Y3dTMTdQN0E0SUF5bytw?=
 =?utf-8?B?UXJWdnBJTDdQQ0Y4Yno5V1BNV0tTRXdFVUt2SnFWQy9WN0YzVHVOL20zTk01?=
 =?utf-8?B?dCtUaEZZNzVlY0RsNExMVlFMMWFHdW0yRjYzYVUzWGg1eVJNTzYya1ZpeVFp?=
 =?utf-8?B?WjVnenJ5SVhvU09JclV0RGpKa0VRKzBsRWVNRGFWUjJJT0cyL25yS1N5dnh4?=
 =?utf-8?B?bUVzS2haSHhSSUVwVzVDSDRwM04yVHljVndRTFJ3VlJXUEFMWExra2ZIVU4z?=
 =?utf-8?B?VkQ2QnZhbEgyc3RzdUxiWi95NEh6S1V2VnRXTnJVWU5BWnFOUzN5Qzc4UENC?=
 =?utf-8?B?d0lPZ2ZteTAxR281YXY1NTd0WVQ1T2c1blFDOTE2VlVMVEdleVpySEtNSm1u?=
 =?utf-8?B?dmxTUEdvWkRaVjJwZnR0VkpEQzVqWTlEdnNqdk9XMEhUMFpYUVI4L3oxM0RK?=
 =?utf-8?B?TVFKc2E1d2gwSUh6N0Y0azZBd0RXZUJQNDE4UlZSazJkMHRIaE9Ha2pyTWxV?=
 =?utf-8?B?VXBiVWdGaFVOYVRrS05NMGFpcDgyWkdsUzFCMnFLZmJhOUlvT2FIdWN6TjBu?=
 =?utf-8?B?aU5tZnhaVStLQkNxSTdUZExGUWNtUmNLRmVDTWFWYzJrdVM1djUzKzh3Ti9R?=
 =?utf-8?B?UlViTlhjRS96cGpvSWVSNjlvN3o4UXE1MGdCMVVoK3pvU2drdzFDaXhQOWRG?=
 =?utf-8?B?TklxLytSZXkwQStMeHFtMy92enZ2NkloaUo4SU9jM0JnOHR1eHdOV1M2cDF0?=
 =?utf-8?B?QWNCUnByT1ZWa2hLTDBiMk13UlhFZTZEQ0ozU3djZUs1OXlJdWo5SXdhNC90?=
 =?utf-8?B?RzBSUmtsVGI2ZGVMazBNcWxkNEZQUjd4Rmw1NVdNWDhDWmtsa3RXekhZckxI?=
 =?utf-8?B?Y1RFSHJST09STFVwd1k3TkZQb3g3SUFBV3pud0hwdWVtNE9Xcll6RHExYktN?=
 =?utf-8?B?VE9Pdlh4ZGJKVjR3WjV6aGVzS2RoVXYvN1d3ZXhmUTBRNWdob3V5NUpKZmw5?=
 =?utf-8?B?NkVadFpPMW00MVcyVDZaV0twYkRjWUpnbXo4SGU1cDFSMWh5Z25waXpzQXJV?=
 =?utf-8?B?SXlLUWhtTmtUNm5QaXJCb3RMLzExUWExcmJ0NU1mbnA5eENSb25BdXlSUVFn?=
 =?utf-8?B?OVRDUHoxT3dkNlcyRC9taC91YUNJVk81SmN0Nlp5UG56MVA2TElFbm5KWXlL?=
 =?utf-8?B?azc3NEd3TFJLSmtBbkJsRWRYaE55ekFNd3FGSmZLcGpyTGhINFFwYlo0QXh5?=
 =?utf-8?B?RFJsRWNXUFJyL04yQjMvSFhkb2xUdlBvbDY1eTgxdDQrNUNkMnNkbkRDdEt0?=
 =?utf-8?B?d1FPaDBIS3k0V2dyeDdzbVcrbmNlZ3pCNlFmRXp4a1JhSlNNOVNiRUFrdzdR?=
 =?utf-8?B?STZaVEpaSlBNZFZHRG9ycXAwdk11THdiRklsZkNJc0ovZ0toZ3MzWUhvK05s?=
 =?utf-8?B?SHZibjFXeDR3di93RXdEU1duMVZMbWRYejFsdTBaQW9UUnF0Qm5iV0NWUktm?=
 =?utf-8?B?Z3dYdTF3RUppUGJzV0tMYmRIQ0pOelFkK3dyeGVEQVdCRFFjVVpGZlI4SGEw?=
 =?utf-8?B?VHBzakVvZFpkZk1nMkE5ZTcySEY0MWRPMnFmVEZ0U28vVmMyTTdiNHJQV3RS?=
 =?utf-8?B?UE9QMkdBTzBacFA4UXN2U2JpbW5ad3NlRmhPMXZNNVk5MlJWaUVzVEpUSFpX?=
 =?utf-8?Q?rTBLkn0kHf0acDnCIfcJCE4hCdqL+DLmguO+V+m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b324d15-d55d-4d4b-3841-08d9742ff51d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 07:52:37.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSpjaOeCR7NPBEIObpkWLQyI+PxjO1sClASS2iDLIkff76MhSZazXfRC3dq5JvuI1YP9UBYCOtnP2C2nXGiz1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>       */
>      if ( p2m_is_foreign(pte.p2m.type) )
>      {
> -        mfn_t mfn = lpae_get_mfn(pte);
> -
>          ASSERT(mfn_valid(mfn));
>          put_page(mfn_to_page(mfn));
>      }
> +
> +#ifdef CONFIG_GRANT_TABLE
> +    /*
> +     * Check whether we deal with grant table page. As the grant table page
> +     * is xen_heap page and its entry has known p2m type, detect it and mark
> +     * the stored GFN as invalid.
> +     */
> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
> +#endif

I take it the write done is benign for other Xen heap pages? I suppose
this would want making very explicit, as such an assumption is easy to
go stale by entirely unrelated changes.

I also wonder whether you really mean to include p2m_ram_ro pages here
as well.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1021,6 +1021,7 @@ static struct page_info *alloc_heap_pages(
>  
>          /* Initialise fields which have other uses for free pages. */
>          pg[i].u.inuse.type_info = 0;
> +        page_arch_init(&pg[i]);

u.type_info's count portion also gets checked upon freeing a page.
Don't you want to have an arch-custom check for your new use of the
field as well? Or do you consider it not a problem (bug) if a page
was freed which still has a GFN set on it?

> @@ -82,11 +53,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>          : gnttab_shared_gfn(NULL, gt, idx);                              \
>  })
>  
> -#define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +#define gnttab_shared_page(t, i)    \
> +    mfn_to_page(_mfn(__virt_to_mfn((t)->shared_raw[i])))
> +
> +#define gnttab_status_page(t, i)    \
> +    mfn_to_page(_mfn(__virt_to_mfn((t)->status[i])))

I wonder whether you wouldn't want to at least ASSERT() here that
the virtual address you start from is actually non-NULL.

> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -39,7 +39,15 @@ struct page_info
>          /* Page is in use: ((count_info & PGC_count_mask) != 0). */
>          struct {
>              /* Type reference count and various PGT_xxx flags and fields. */
> -            unsigned long type_info;
> +            unsigned long type_info:4;
> +
> +            /*
> +             * Stored GFN if page is used for grant table frame
> +             * (bits 59(27)-0).

Are these bit numbers correct? I thought Arm, like x86, counted bits
from low to high (unlike PPC, for example)?

> +             */
> +#define PGT_FRAME_GFN_WIDTH      (BITS_PER_LONG - 4)
> +#define PGT_INVALID_FRAME_GFN    _gfn((1UL << PGT_FRAME_GFN_WIDTH) - 1)
> +            unsigned long frame_gfn:PGT_FRAME_GFN_WIDTH;
>          } inuse;
>          /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
>          union {
> @@ -94,12 +102,12 @@ struct page_info
>  #define PG_shift(idx)   (BITS_PER_LONG - (idx))
>  #define PG_mask(x, idx) (x ## UL << PG_shift(idx))
>  
> -#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
> -#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
> -#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
> +#define PGT_none          (0UL << 3)  /* no special uses of this page   */
> +#define PGT_writable_page (1UL << 3)  /* has writable mappings?         */
> +#define PGT_type_mask     (1UL << 3)
>  
>   /* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> +#define PGT_count_width   1
>  #define PGT_count_mask    ((1UL<<PGT_count_width)-1)

Leaving just a single bit seems pretty risky to me, and I can't see
why you do so. You need 52 bits on Arm64. Which means you have 12
bits left. Why not use them in full? Even on Arm32 you have 3 bits
available for the count afaict.

Also there's a disconnect here: If anyone wanted to change the number
of bits used for the various fields, each such change should require
an adjustment in as few independent places as possible. That is, there
shouldn't be multiple uses of literal 4 further up, and there also
shouldn't be a hidden connection between that 4 and the PGT_* values
here. I think you'd better express the GFN as such a PGT_* construct
as well. And you better would keep using PG_mask() and PG_shift().

> @@ -163,6 +171,15 @@ extern unsigned long xenheap_base_pdx;
>  
>  #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>  
> +#define page_get_frame_gfn(_p) ({                               \
> +    gfn_t gfn_ = _gfn((_p)->u.inuse.frame_gfn);                 \
> +    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_;   \
> +})
> +
> +#define page_set_frame_gfn(_p, _gfn) ((_p)->u.inuse.frame_gfn = gfn_x(_gfn))
> +
> +#define page_arch_init(_p)   page_set_frame_gfn(_p, INVALID_GFN)

What's the purpose of the leading underscore in the macro parameter
names? They're not in line with the C standard's designation of sub-
namespaces for identifiers. (At least for the x86 counterpart please
read this as a request to drop the underscore there.)

Jan


