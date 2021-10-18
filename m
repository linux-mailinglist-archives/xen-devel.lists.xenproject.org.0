Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D974316B8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212039.369774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQP3-0000Bd-Cq; Mon, 18 Oct 2021 11:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212039.369774; Mon, 18 Oct 2021 11:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQP3-000096-95; Mon, 18 Oct 2021 11:02:01 +0000
Received: by outflank-mailman (input) for mailman id 212039;
 Mon, 18 Oct 2021 11:02:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcQP2-000090-9A
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:02:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfee7f42-3002-11ec-82d2-12813bfff9fa;
 Mon, 18 Oct 2021 11:01:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-0Qaxow2TMJCoLlXqPWsSXw-1; Mon, 18 Oct 2021 13:01:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:01:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:01:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 11:01:54 +0000
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
X-Inumbo-ID: cfee7f42-3002-11ec-82d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634554917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QspbvaET/fKIId+6qOGtqo2qsD2x/bCrhnclhYEg84=;
	b=lzeyupfqoIOOf8OAlN8nm9k/Tb4jhj3+FtjoYajbJfxamnusGTPog5cA4AbnY7SoS0SFDG
	t1hYyglSUyuOhPCLLZNNsa+/YzyOS5jP2rIG+s+W39Ee42Pfwy+Q3RFWPggf9ejOND9ea8
	TxpaBbL/2ENx5uTkMYe/cjln7hF4tco=
X-MC-Unique: 0Qaxow2TMJCoLlXqPWsSXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrrUCFZko0PGWC4GwYuPtPDK7Gi3dkCM1+m4KG1yKCMCDERvNKznt9MuacgBlq5tkgje0/iyf3pctSr/wf9CD6+tLBhKQEG2IJNiUBQOGxloE7sgdUWomuxtwVTlBnHlBXIfxWRQaBTQW2mvVpY6ybhyLbTAI/IDJJr1HDxDJpxd2xaRgus1bN5H8TOZK4rgJboswyRW/XQ7YnYFOJAVgfegniVR9NhQUt1Dy4oCUERWilfFU6fQpxOwaypUnWa3NWCom//qOdy31xoi2cSoO1df/nz89xKphrwXww5hg41wR6YuynVOi7/Jf8sKagXyDI74+iwwNUGOdpuBOd1xZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QspbvaET/fKIId+6qOGtqo2qsD2x/bCrhnclhYEg84=;
 b=QiqX1q6GchtBqCyYAlCLq7C7pl8MfUxZdinBphIfmxf0E7ahz1eedL77MRhyHNpFS9mV/MD8bYacuX0Oa5dnrAn4+yZY8+Tksz8aborFM3mpQvrWm8OgYA70CIoNRFs03dJZ6tbVQ32VchVb/7PaGv154OGqIGpL5baSmPCCxP2dFBeNDBia/ZHsjc7T7qNYPoiqWfriugMom0Mk5B5EBgNUG0QW6HXQJyKy495uk91hNbDWtMKoQP52qTVsiUhPzujOxY7ebLjiU24Z75qx4Bf8/P4fzVzUilslR9T88LiKutGB3dL3T8dM6ZOiGNcHr1bG0jX0cIzMuN/qJLkHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tests/resource: Extend to check that the grant frames are
 mapped correctly
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211018100848.10612-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11747958-dc2c-270f-6f96-4d9f53ea724e@suse.com>
Date: Mon, 18 Oct 2021 13:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211018100848.10612-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e872a40c-fcf5-4bc7-1690-08d99226b286
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190A5F8873DA6C0C8002318B3BC9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1IJxq/dHjy7xwQrMqwZGFC70sqbKIJa35vNGqxvRsVFiAq3W4u2QdRhKZK39hR5Y32qvKnQQYP7ClEwjQu/OiS413gaaGf9o1Koa/TpGvzkvPAL6/GlZcCAA2v/zAFfCXAdsj6brcBX2FrcpH00V2t2EMpYhShiU/561A2MBAe8t8vpV8SRh35IG+4L5SysURuISWLjZGZaF5FcNYY6CIGX2qkDqcYznPf1ARB4xwqSvTd7lJzK9+VX78RV57iyLTKf2U1A+bvckv8deqwmJ+Ru1ut33SS4Kp0gpnV8tTnwdcg/P8mck5kVJkZR5z/uJi19jjPmSGTjYtNeAv/El52HOJna1/AsjHAIGPdtbnthzHrl85NKzcw8YnqROf7TTrEoPvmxIgWABVqujypGOiM6hZ7KoVb4RiMLAOxILbQCescKST67P14as/SYOdBZRSo+BBdRGqEMTfjlfJKCstcsve7f2rxnv1X+tsIz1pXzr4wlcVXz+/nOrJvz8Euj9zBGIYxjPKg3DDQKYKfHqlE2RsA15w6j+3MNwuD9eH/xYHIosKwT5ucZUqQXAkRRo0X/UfHTRr+rAq/WhE/VShJsIafKQW+Cv4RjJUuv/9jQ/QkRBYZwNltruvG+IU0/+Kii54z1paSqoXwRk66HzU2Jahu6LKvSxINuQ9bRojJUP0dYO/962lwHOHmhwfvFSsCvvDhQdsi9mFD3q0YEiMVQGop8iCqgL7NOFNd7LR+oCxSqnBUmXoyet7gOhhFk4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31696002)(16576012)(36756003)(316002)(53546011)(186003)(5660300002)(54906003)(2906002)(8676002)(86362001)(31686004)(66946007)(4326008)(26005)(508600001)(956004)(2616005)(6916009)(83380400001)(38100700002)(8936002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVo2V0pUZmJadlhJb3JVbmV1cG5mbWNhdjlnZnA5citxMXVQbnBJdTZuazQ5?=
 =?utf-8?B?N3g0c01xNGNrUXE4NDVVSmdXdjl4bktjOG1mSkxZTTg4dTJTaXg0amxFbXow?=
 =?utf-8?B?WWpFTWZQdzlMZ0IzM1FpajI0SzFHcXY0Q2QzTU9tTFRyVXZBRnJ3TEJjdUdi?=
 =?utf-8?B?M1B2SWFsWWFaTVBNK1EzZm80Z2RlMFA3WGp6OC9uMDRPWVZrUGJWRFJIUHd6?=
 =?utf-8?B?ZkwzaGFwTWIyWTQ2emZDNkdKMzVkcGJ1VDNSRFlCZ3dhZjdsU2MxOUd0M2J3?=
 =?utf-8?B?M1VnakFUbXJ2YkdabmNlb0k2bG9DNngxNElvNEU2bjVic0kzVmNsbUVEUXhq?=
 =?utf-8?B?cVpadi90M1RqWjVRbXBGYzIrelkyemxCZGc1dFFZRUVNdzR0eW8rN2hjUlNV?=
 =?utf-8?B?d3cwTk5ENkNFb0Nid2pYT214RlFQZ3JnVnowLzdBNmQ4U0JQZGwydzFPUmY2?=
 =?utf-8?B?YzZkU0NMcG9YSXZ3dzJ6YjR1WTZxY3Z2bHl6QWxsU3ptaUJRNGFzNm8xYWFl?=
 =?utf-8?B?VCt2L1YwOWNnSmxHY3E0K1hvdG9wWnJLc0ROZngvVlB2UmxhaFE1c1kwSURS?=
 =?utf-8?B?UTBHTWhoNlVLZnFrOWx1MU5oNkJRQVdUb2QxRjhrSDJad3gzbkRzYVcrenRH?=
 =?utf-8?B?a3FuM2Q0RU8wR2FKRGhiL0xNdkdtbnk3c1BkWGxRTmNZYndhS2QvdzA2QnpT?=
 =?utf-8?B?alNwWTBuSDVqVzBJamtBckVsd0xMMG5vWE1ybzVIVGlpbTBRbWthTzhhdUtw?=
 =?utf-8?B?R2RCV0FBNFd2bUxWVXQxNDljTHV1LytFMTNzeUw1SFlRREFvdGZsekZxNjhD?=
 =?utf-8?B?RnRXenJJQ3VpU1lTbTM5SURhblpTbDc0Q3pma0UyTzJJK1RhOWFPOXdLLzVM?=
 =?utf-8?B?d3BudC9CenhsSUFjNG9rQ25ycmZUbGtaM0t2ZFBuUHZUSGdldjhzcVBaUHlR?=
 =?utf-8?B?b3kybGx6NENSZXVRTnBDeUJEbVFRTEJocDJDOW41Wlg0RHRrcVFsdXU2NU9L?=
 =?utf-8?B?N0Zqc3FtS1d1MWg2UklDZi82Uld4RUhnL28rUGxIcnNYZGJLT0JKS1hpZExv?=
 =?utf-8?B?TUtXS2ZVamYzWmVzYWY2cCt0V21VbWVqbVFRWlZreGNLc2ZmbDhlYVpuYkxS?=
 =?utf-8?B?aUFDdFhBM2dvMllGRi9ZOW1kbmhMekduN1dlVk9uQzVoblh4aHVNUGZSR25D?=
 =?utf-8?B?cVg2SkZTbFRrRkIrSXRDUmFabzQ3bWZZYUxhQnhSejZMM1lQZ2d2NCs2ZFE5?=
 =?utf-8?B?cUY1VWJYTENYZ2NxVmMxdERMUEg5Rks3aTZ1RlY1ODl2N2Q4UUsrS1hsUnFW?=
 =?utf-8?B?Sk42TGxYMktSdzd0Y3NVMHdRMTU3L2p4anRaSjNlRG1qU1I4K0p6M3ZmczAx?=
 =?utf-8?B?NzBwUmpKRU5SWHpwWEIzOSt2MFFVRVlpcFA4NHNzTStBQTBGWG5lTWpjVlF2?=
 =?utf-8?B?R0xVU3BUT1cvWUdkNGppR3EvM3Q5WWdIaHQvQXphSHM5UWVzYm9zSnNCNDdq?=
 =?utf-8?B?VFc0cm5WT0s1T2VENE1hbkJ0OXYybTdodVNhWjdNVTJodUNhZjhqKzl1cmZ6?=
 =?utf-8?B?ZlJ1eDU5WTNLNHA2MUpyT1p0K2NVY216KzN3aTgzaGZBTm4wM1d0ZVVPVjBq?=
 =?utf-8?B?UG1PcDh5dWhReU5xK1VaRUhMMm9FR2RJVFE0Wll0Wk5ucDBZdWRwUW5BQ01H?=
 =?utf-8?B?WXdxZzJhTHl2TkI2QUhONGRtdG5EM29vWWZsOVdYQnZXc25PNG12aXVDTTRR?=
 =?utf-8?Q?19OfYKUYb2D3nvN3HI8Qem7MZd+7qgzX7KwlNpS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e872a40c-fcf5-4bc7-1690-08d99226b286
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:01:55.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKEfPx1GDeMX7GXRBuaLtNb/nhcPMA4frUFTL62+GrohbYdU60BA0/aEb1pcIPePSIET9X6tjeBhj5E6UuY2Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 18.10.2021 12:08, Jane Malalane wrote:
> @@ -51,18 +55,52 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames)
>      res = xenforeignmemory_map_resource(
>          fh, domid, XENMEM_resource_grant_table,
>          XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
> -        &addr, PROT_READ | PROT_WRITE, 0);
> +        (void *)&gnttab, PROT_READ | PROT_WRITE, 0);

While in testing code I'm not as concerned about casts, I think it would
be better to cast to a visibly correct type, i.e. maintaining the levels
of indirection (void **). Alternatively you could (ab)use grants here,
allowing to drop the cast, by then assigning grants to gnttab.

>      /*
>       * Failure here with E2BIG indicates Xen is missing the bugfix to map
>       * resources larger than 32 frames.
>       */
>      if ( !res )
> -        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
> +        return fail("    Fail: Map grant table %d - %s\n", errno, strerror(errno));
>  
> +    /* Put each gref at a unique offset in its frame. */
> +    for ( unsigned int i = 0; i < nr_frames; i++ )
> +    {
> +        unsigned int gref = i * (XC_PAGE_SIZE / sizeof(*gnttab)) + i;
> +
> +        refs[i] = gref;
> +        domids[i] = domid;
> +
> +        gnttab[gref].domid = 0;
> +        gnttab[gref].frame = gfn;
> +        gnttab[gref].flags = GTF_permit_access;
> +    }

To make obvious that you're done with gnttab[], perhaps better unmap it
here rather than at the bottom?

> +    /* Map grants. */
> +    grants = xengnttab_map_grant_refs(gh, nr_frames, domids, refs, PROT_READ | PROT_WRITE);
> +
> +    /* Failure here indicates either that the frames were not mapped
> +     * in the correct order or xenforeignmemory_map_resource() didn't
> +     * give us the frames we asked for to begin with.
> +     */

Nit: Comment style.

> @@ -123,8 +162,25 @@ static void test_domain_configurations(void)
>  
>          printf("  Created d%u\n", domid);
>  
> -        test_gnttab(domid, t->create.max_grant_frames);
> +        rc = xc_domain_setmaxmem(xch, domid, -1);

That's an unbelievably large upper bound that you set. Since you
populate ...

> +        if ( rc )
> +        {
> +            fail("  Failed to set max memory for domain: %d - %s\n",
> +                 errno, strerror(errno));
> +            goto test_done;
> +        }
> +
> +        rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(ram), 0, 0, ram);

... only a single page, can't you get away with a much smaller value?
And without engaging truncation from uint64_t to unsigned int in
XEN_DOMCTL_max_mem handling in the hypervisor (which imo would better
yield an error)?

Jan


