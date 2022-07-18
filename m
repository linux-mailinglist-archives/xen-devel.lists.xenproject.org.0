Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737D57805A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369612.601063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDORU-0003IO-CP; Mon, 18 Jul 2022 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369612.601063; Mon, 18 Jul 2022 10:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDORU-0003GX-9S; Mon, 18 Jul 2022 10:57:36 +0000
Received: by outflank-mailman (input) for mailman id 369612;
 Mon, 18 Jul 2022 10:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDORS-0003GR-NY
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:57:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d06964f-0688-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:57:33 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:57:31 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:57:31 +0000
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
X-Inumbo-ID: 6d06964f-0688-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apaMDCGVcOoXXJpEY2MW/izmFg5EZL+5ntK38DKu4hNwLNr3KByN+XhqhgKvWHY/DvF/UY73c/VO7hu6qHMpm/iEgVMfLxsp6lk4wIaZqPfSvefZjsh0+8lsOt30M3aMj4WStuxYE81aXnQH4M86KZy3HlRVGMNtI1ivzpR187mot4s/ijEpmvZhkZRtCeETEYhVskRiIuwi0sov7xd2AKHSvfGyEEaNgpqk+dQ22VHU7mZ3JgKTJUVBZzP3MsNREUfSAbypA//cMQR9DkO3eSE83Dz5QSQcEKy3iJURT2vfw5aIZjokCZdrLEDHvVqtdk5VyeLavK88kw4kQL7txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcnbUL+ktCxwJctxuLulZm0GoSCc+ICRTdW/m5MlcDM=;
 b=OzQBn/fnJhQXyFBfIapSD21M8cyUmJnmCvwC36LQJuRam/RreHKWsZc8wH8uH/l82FUUjeZ1s5Po97+Epv6OAlB0AndpoCXLs94uH+GPpQDtS8nUrFfIPuhsbPdwPfWrHPtUaLggnSH0A4s+DGFxsuvWNWU0CeT98EYK8OaIIW2Y7t/3JNN9nccMu6tWwdgSqZmFstO3ujprnnP9b00qqkdTeNwE/UGVrf8d7nZyz1VIYsTm7rAZ9aT7YGMWkrgzVjN00IU9rR48zHIdAz8PBOAplRHxx01lGboHhPoAkoQrl96WhQmqQWOkYQHPMR+1wS7w5DIj4yB+XUb5kS8Dnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcnbUL+ktCxwJctxuLulZm0GoSCc+ICRTdW/m5MlcDM=;
 b=thxz93VySFUWuz5ioy5fN9jp8yj81kWF6eydsQzHSypedPr1ZcIl5vRBEXUs3MZuTy74lJ78hJA9VWpMVVQYxvgSWUDyVcIDfbeZkN+VgfqcFNQl67NGZ07ZD4/268KaiU9yKPwqof8LQ2CO3vEaTm/+maj4VKZ/oYN4hKOOkSFM1LglCvA0fWsiD3tmdg6A+goPA7Zc4NqZM9Xowf+Z3TdUuswADLtjK/0XFtixVQyiPswD0t11tYWJSCocBulnqKMEZoJonKwgq3l7s/BuJhKBwPk6tIlEMRUe3QmTkiMOyBCu9BN1m+zG+zVSOGNi9uAAQXxqCizp6aBC2epy5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ce96525-7533-3ae5-4bef-eb6021992cdf@suse.com>
Date: Mon, 18 Jul 2022 12:57:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-3-julien@xen.org>
 <07304aef-e278-9da9-ebd9-640ac7933268@suse.com>
 <be525e4d-1dd0-bc4d-1b26-c4483e16cc10@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <be525e4d-1dd0-bc4d-1b26-c4483e16cc10@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::27) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33546301-52d0-46e3-0dc1-08da68ac5047
X-MS-TrafficTypeDiagnostic: DB8PR04MB6475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mebXUVk7rLvDiqu2sov3/vrhqaUEynopqPbGmRi523H42/5SEMw6f+//p8S3RePCzpkDEggxfNy9qT4JPLz8rAsmcixRHz6YQTtCnZ7e5qTkYoSIRzXNAwyODJvlQzzy4fXb1fP0n4knQpSUsnJ6x238pQl8q0UTjpyIQys7Qewh+aBnJkIHBOYEdK2d6KH6J25b09uMvIA0iAbDoeBEX5VoNSnAkRNyS2OmUagw87nPKk/YW8Rm6eSK45tgtCPRNc72u1FeklF0h1GFP9FfCNUt86R+6u2NoQSrDgXhqYa5hTR2V2BtHJ9AF/KHyzazeXrcWqdQgNCOvFx6x8USPV5ZsaXgvqHRhYvfMXpLtWU+9uFdt3NMnBWrEd0X8PxwiR/LbZTtNawCJGvU3yIrp+5W6GqEoBa1DaK05bqYEAdUY1RZMKx9VB0MLhNIah7cBEu5IqC4QxYMPj6VXJoBdNfxkMqkXdwRqsRdQnSBjTjHPj39tWNQfzwuUr47MWyqu/IuVtu9tzP3DmIkHvWuGP3vn9rnLPb4H+A6tnruWhFtr+Le+1PdCDwrb9kARUPVKb9NGCnkWT+i/FrT1bNZ5ZPvykuIRCPNUUtEK74dileIuvi1/UJzZL5w4gxyBh6Wx0GK7jek4Z74h/oL0dykZwdz5qa/HaO6JlK3Jd5OGj/dKvPuR/yiLAkBDeyTUh8a51cZRs7GCA8E9ugEv5va++FgWPPcVlo2migwOtAKHVJs+Nok6kif8lw+bDL5XqinJjin/VqFMy3hR7qgKdUILv/B6/wdNbsnEEYYNtegCgwnt8Lv9Y+PeZJWob8X3IlZYn3GQYCotqrANtPm+iiA/88i3DUNmCbMg/E+0MUYDdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(478600001)(8936002)(66476007)(66946007)(66556008)(86362001)(4326008)(8676002)(31686004)(5660300002)(316002)(6916009)(54906003)(6486002)(36756003)(31696002)(6506007)(53546011)(2906002)(6512007)(26005)(41300700001)(38100700002)(186003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGhrSmRtMGVNZFllQjIvWGQxQXNJSW1wVjdESTJ1Q0VodEFUdlk5ZzNLZEhj?=
 =?utf-8?B?Q3ZpaG1UWC9DQXVLYThBd2pHaityUFZ5MlEyTkEyY0tGcm5jQkEwSHRORXVI?=
 =?utf-8?B?d0FvQmR1cEFxZnhZYUdJRk9jN1M1UnpPaHR0MXNHTVAyTmlzQWdoL3UwaExw?=
 =?utf-8?B?emF1ZnZLYVl0NU1zbTZndmVQUWlZUEh5SFgraThCSkhSaFIwVnpkd2RBbmhP?=
 =?utf-8?B?NjJmSFc5N0w1U2syOENBYVNmNlFhbEN6eEk4eExYays1UlhueCtNYXB3alp0?=
 =?utf-8?B?L0d2dUNOZHlZNmVabm0zeitiSFdOckdBNTdRMktvYW1IV0VwY0E2UmE2V3lz?=
 =?utf-8?B?ZndYMGorWjh5T2FPbkM1MlJIVVNZQXA2VGlHem5tZCtDbmhJTkUwVTJMWkt2?=
 =?utf-8?B?OEQxbDEydmZoczZhelZqcms4UXZYN2Z3em80OTV2ODIyeHNXWmRnNEtXZkdn?=
 =?utf-8?B?VzhVc0Fhc2tyY1JhR2ttdGVqZk5WU1RkeXBtR1BkTTVkNitoQkdCOE83TmFq?=
 =?utf-8?B?aVk0VWliMkxxbUErWE9SdGMwemh4cmJHaWx2MUdnS25EczF0UEJlekhQeEFL?=
 =?utf-8?B?TXFBZTFiTVVhdk5LNEUrVHhtSVREejJ6MHNCY0EwdTd1MFJGMFdXQkZFL3hY?=
 =?utf-8?B?UURRQmN1ZG44RlVYWjFLc1EzYmtWbFNITDlNZ0dmMjg3QlNibW9CTE9GK1pS?=
 =?utf-8?B?bGlRSWVQVW9iWThyZ2NrOWtqZ1JvbWV0VGZyOG5iSzZvZ2RIcHI2Ly9sUTRN?=
 =?utf-8?B?SGMzYjR0WnZ1SDQ1MzBzM2x6TEpYNElSeWNYUVAxNWF1RE81cCtGMVF5R3la?=
 =?utf-8?B?TTdGMFRmR2dYdlpOY3JiVGJYZUJlaWNxYzNnQWk3NFlBM1VuTDB0djkydlBF?=
 =?utf-8?B?NFlEV1VhTCtLdVBaeCtLMGQrREN3SSt4WEE5OVJGTC9hRnVGd1BZaHlBa2lo?=
 =?utf-8?B?ZTFhVmhYa3ozNXBnTFY3SERvK3N3Q2dVenlGVjE4MXN5UTVGK21NK1pYQzQ1?=
 =?utf-8?B?SjFQV0ZpUGswUWJSdTVjU040WHNuU0FabWdveGwwWGVWRmJSNE5hSnlTTDZm?=
 =?utf-8?B?dVlNZDl4S0pIOUxneWJ0RGVLMlZBQVRyU2FXNm10R1VJUTdsK3VBS3czRDJr?=
 =?utf-8?B?Rzl5eWMzQ2VlOWRBYk9ORFYrMlFHckVyMFE4c0dxdTd2RS9Va1pNVkpWd0Ra?=
 =?utf-8?B?K084ZktZTHZ4eGtzQURhU1A5Qm9MVE14dzlpL0ZKTGFyc1R6U1FvY0VwSmIy?=
 =?utf-8?B?LzJyTzFieU0yZXpSUWp6Y01zSzdBNythSEpxeEFrN2svVzA5QTFSaGdlWi9Y?=
 =?utf-8?B?SWFsTlFjdjAxWUkxWXlybG10ZnVFWXVyV2lBbDgyZGI4NkVaNU9nclIvYkRz?=
 =?utf-8?B?ZmpyTzVKNjdxeng4bWZ5bEVVWmZKUllyRmtlMVNxcDNOcDl3YnNVeDBldENZ?=
 =?utf-8?B?aEM0dTB5QTd2S1gxU2wvSGRMRmhUdml6YUpDV3dOeVhyOVh1Y3VINWp4NFNw?=
 =?utf-8?B?ZHRPNFVtUzR5aVNnWDNKd2hBaGVrbElrQzhhN2k2d3J4a1VIc05EamVOWXFU?=
 =?utf-8?B?YklITWp3d2FYczMzNFhXUEdETHdKQ01MQmpJSC9uU3JMZDRrTkk1U0VnbmZm?=
 =?utf-8?B?QlVmd21oS0dXbU9xekJieWkwczZTSEwxTzg2a2RZSEhoR3pNMEpXRzl0K3Ft?=
 =?utf-8?B?OXo4eGhYUkZTMkVqeEdVeDFjQzNhaXVVTE9UQ2pRWVRIbHNBSjRzQmo2cm9x?=
 =?utf-8?B?Vk5sVjJTblFPOFdYRjV4ZU5iTDc5dXJXV2ZkRE81TFR4eGU4c3MrR3NaRDBZ?=
 =?utf-8?B?N1Rvd0xUdWtOb09nMDV1czZVTURwOEhVRm9UOVcwK3cwNHcvVlJYYVFjNlMx?=
 =?utf-8?B?RVA0TGwrVGpTZkR2VDNXZW0wdER0d0pjK1NNaytaMjgyaFluVXpXNXZIT2Ru?=
 =?utf-8?B?VElRVTRVRGg3cFNjeHNrVFpXMGZuTGdPNXRITGZENDR3dk0xVldLd0hJaFhw?=
 =?utf-8?B?akFEdktFRnNyTmFZOHAzVFFpM25UMTltUHpabFdjT2lYMDdLYkR0OVF2ZDNU?=
 =?utf-8?B?Y1hTd3VFNnBvZ2xLS3l0MUhQSmR3SUMxZlVhQ3ZDMEtWOEpsRldFTjVNbFI2?=
 =?utf-8?Q?22As6mX0lbWUoAKW3PPasJVYO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33546301-52d0-46e3-0dc1-08da68ac5047
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:57:31.7781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPc6+plgtEXBc27UuYeXMXQK297cndd7tSrFL6xSZxWmwmXt/WSP9YuQsY9frZF9uPdALAD5MFF/OUsXB66xZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6475

On 18.07.2022 12:08, Julien Grall wrote:
> On 18/07/2022 10:31, Jan Beulich wrote:
>> On 15.07.2022 19:03, Julien Grall wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1778,16 +1778,44 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>>>   }
>>>   
>>>   /*
>>> - * Hand the specified arbitrary page range to the specified heap zone
>>> - * checking the node_id of the previous page.  If they differ and the
>>> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
>>> - * not freeing it to the buddy allocator.
>>> + * This function should only be called with valid pages from the same NUMA
>>> + * node.
>>>    */
>>> +static void _init_heap_pages(const struct page_info *pg,
>>> +                             unsigned long nr_pages,
>>> +                             bool need_scrub)
>>> +{
>>> +    unsigned long s, e;
>>> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
>>> +
>>> +    s = mfn_x(page_to_mfn(pg));
>>> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>>> +    if ( unlikely(!avail[nid]) )
>>> +    {
>>> +        bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
>>> +                        (find_first_set_bit(e) <= find_first_set_bit(s));
>>> +        unsigned long n;
>>> +
>>> +        n = init_node_heap(nid, s, nr_pages, &use_tail);
>>> +        BUG_ON(n > nr_pages);
>>> +        if ( use_tail )
>>> +            e -= n;
>>> +        else
>>> +            s += n;
>>> +    }
>>> +
>>> +    while ( s < e )
>>> +    {
>>> +        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
>>> +        s += 1UL;
>>
>> ... the more conventional s++ or ++s used here?
> 
> I would prefer to keep using "s += 1UL" here because:
>    * it will be replace with a proper order in the follow-up patch. So 
> this is temporary.

Fair enough.

Jan

>    * one could argue that if I use "s++" then I should also switch to a 
> for loop which would make sense here but not in the next patch.
> 
> Cheers,
> 


