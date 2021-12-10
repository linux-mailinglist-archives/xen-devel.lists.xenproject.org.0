Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E784847003F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 12:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243790.421833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mveHU-0004Db-12; Fri, 10 Dec 2021 11:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243790.421833; Fri, 10 Dec 2021 11:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mveHT-0004B8-SS; Fri, 10 Dec 2021 11:41:39 +0000
Received: by outflank-mailman (input) for mailman id 243790;
 Fri, 10 Dec 2021 11:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mveHS-0004B2-6j
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 11:41:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b6454b-59ae-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 12:41:36 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-6ufrNEEWNj-bf_QcgCYD4g-1; Fri, 10 Dec 2021 12:41:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 10 Dec
 2021 11:41:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 11:41:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:f0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 11:41:32 +0000
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
X-Inumbo-ID: 21b6454b-59ae-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639136496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVtSlN6OefiVGXOCVUNHbVK7NUdqjaoDch3sE316kCQ=;
	b=Q8iyUteOp0jzIh/1vy5kbadHuP94DiKgIDNg3eIiPOg+Na5Scui1ib5wqPBlubHz1V4q3N
	fang8kZX5ho9yY7+wG0BiLm1wBf9gTmXgM3NVLSnBG3Ara9IFFzDYvzVPdBZE5XFzq2TIq
	Em/T8onUUyNsFWTGSK/bsNh3Oz1wT24=
X-MC-Unique: 6ufrNEEWNj-bf_QcgCYD4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExPz8S9EJCXUR4R2uX6YNq33iuz30po/IqlDQyg99godVvbTUFDwjYzciotTmLvAVsfDr7NzVT777dNurSnelasmz5YauOQ7oMxfnVv/GC1/52zh4NPjsu0fHJ+nA2RihTQRhQ4ZhdG0UyxaKkhz+q5VKiBhH6mixesREXCMq4ehWsLwkTXVteTlhbhxfUfxI96aDsmQu97DL4zbC5/t0LnlonXDiDjn28tu4uC/BDCycgSa+KKGQxDfug/lkcAigjcCtx7kIU+Qv8tAv0YdlnClamec4FZp8WXPyZsSNn0wSGHOIFx+RnixqIUG6T6tS3UyKUpQhR/h6t/wIFKx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x89M2zig9DXdn3QqBbLEBv2HMC5p/11NIDL8RS+jL+o=;
 b=dR+ZwBIshvlUV0AHuRP9Bd2oTr+fjMkjScuj0tD6JA5hAKJ/PulLDM4eEDT2KMEK/fsh+yPIiJLVcuxMyOwUuZ2v+d+Z818WQCz8wW1HArml/K+XN6wz/7drkAtV2IQJRAQUA+ZWpE/NT9wLRu0GIHYtHv+QEquoxZn3/QMYhFHVGLPdnTLfCESz3WFU1yf9KfKwD3Ei5sEhZUBB4scVbOPlRr7BA782wZR+50inSNssFSpeZMNWnXQ3cQTkKOG2z6Hs5ZPoYdH1bwPqhgg9vlsxf6QGf4xWkkuaRqTUkqvjA7plfVTQ4JU3B9ZOLu3hLfMM9ngcZ1i8UHxPKr6wmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad9d298a-62c6-bde1-ea42-698ebd1a7f10@suse.com>
Date: Fri, 10 Dec 2021 12:41:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 07/18] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
 <YajTvrZz0xGOR3vT@Air-de-Roger>
 <2a3a0a37-525d-e2aa-b396-b01d97434d56@suse.com>
 <YbMfnFWIlSN+GXH9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbMfnFWIlSN+GXH9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e10baa-8037-4d56-d447-08d9bbd203e3
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66718844F5D888226B792FA8B3719@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mGQiz9DWPvaf51sRGxqMtI/Qc2pAtfahZ+t4Wrdb+EQxRPsnQP6BLHuUeO6UdSdMAGuresXLc/ku7NrAunXl2fr4US+S0H5gFecaCnvTU8Y8djuOb8RpPEn3R7RRlvMa6Wt42+n4AuqzrsH6rC3nNcCdFjgtfe8JBSxoYa1Geo+zOubxD1vOv8OKgVZo0ZYx86Wersy3HyktXmF3Ln9g/hyDjxf/Bz4IsIjCv9bl5Qdaf/PZEkc/9i8GXQ0ZYHyZwWRnBNxx2vuYRg+cFWRAp0ao/FW0vIfSm99y6JsHwC4BccpoQVLTozlvlpoquF9nubX4nygfhXZlm5uRpFDXTo7hGyT7UJVzk5nsvgQG2YdUHaLnkATtCWaeUTZ1iMVMQCrtuRQ51y5rMEMLJOaQuyhCevZGljesOMEthmMT7aqKP8WnWirQkuetpsAFMohB5nsww6bnNWGidQ7K+nA2tJlZWAmkbiE9ZzS2clG0h5vrTgzxLdm3Q8S5Eo56KmYPU3RPGgytEDKc/7uERsBAcHh8pnNfkYCYe9YlULIqw0v3/qo9p7JAm/Ibmfju2lkhKtRo9wIgu0yZho2r3XaYrTls+fvKXU88P98jqDncVJA9bOfPShOe9Qq4rDpuCIntrY6nL34444sofLZup8CIfZVgj+ML3CXz5dMRLRnhMmmnCKxWzNYg7dV7fzDrwXo0O1LXVYjYIbQv1b13DQB+z+V5k0yOu2jU4pQVdM/7+RY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(508600001)(54906003)(186003)(2616005)(6916009)(86362001)(956004)(6486002)(31686004)(38100700002)(16576012)(53546011)(36756003)(66946007)(8936002)(66476007)(66556008)(5660300002)(4326008)(2906002)(316002)(8676002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6OXK/NVMTcfLK6p67asGf4dh3baI3OZSmxJVQMecXonxh7IRB5rgkxCiTxQ8?=
 =?us-ascii?Q?AWx0EmrYz/xAJTT0eRH0fxL9g4G7kKgWQ46rPiOfuk3c2LMH/OVkFhVBqgE8?=
 =?us-ascii?Q?4Z/HteUer3lk8HHYnIzn2eIHIacNX6T5jJtrLqA59+hbZ4nLgBF2K3y/A59q?=
 =?us-ascii?Q?QBlV0QD5FF8XiixeGj7t3Issh9Fmkk0P0l80rvUOEMYHHuWuZvqvao6FwuKi?=
 =?us-ascii?Q?O5z3wsxKVlkK29AD9yG+BtvrjDuS+NqPJp4dvZL6LUbkUqyU1J6gntKCKtd1?=
 =?us-ascii?Q?hd8XCu+mrWY7i/On2fa/rdogOOPhe5XQdkYiTm5dDSi6Yg96y8o+JbWiif2L?=
 =?us-ascii?Q?j4Nr9fwQkSpAheqAP9HMbnBb+jRI/O/DU2rsPmgF8m1fuxo3S4V6KzovxZfd?=
 =?us-ascii?Q?pdrTh6cp547pkSxp95wuoeh9/BAxL6+RoWQ+97AkkqPRYOXn32+f6V6w/xca?=
 =?us-ascii?Q?6BiZaBO15AUzZzrd0fqMTeLVtxpaviPOrG8IhT9xVflbTPy2tfBTOUflc2zz?=
 =?us-ascii?Q?aTV4pGYFDBWAPwCoRBOgTq4AaYWrTce0uImFbeHOhEU0H7uyfudmD2YmP+MS?=
 =?us-ascii?Q?GSy8uJQv7dRzERyVHcspYmawRWL2FUzMkGVTODWOzYdcijLdyUXIGkzOY0d5?=
 =?us-ascii?Q?Qw3FFUCkngF65s4f7OaYknB62fWwINzIQCmV9vQbDB/VARNtQP9r837pUP7C?=
 =?us-ascii?Q?uehtrLmtAuGC2zfc8CENqrV9NGbbA/sRaHBjKXHv/y/Y8x2DZbYO/Jd8sIkU?=
 =?us-ascii?Q?w4kfETWVNoO9E9jGckRPplmWigpM1ePdTr6xw8RC3gkitu0t2YN24EHRqaso?=
 =?us-ascii?Q?doZ9dbVDMcaORs0649M4uhzqBmtLC8XUheWtfnNBxXVEFbydiQ7mhnXEPows?=
 =?us-ascii?Q?PRTV8XFjQEZ9FEg+cBQ8WlbGCxU/rWUx7vks+QyoBaW/xKhJr8ayUPjOZDTy?=
 =?us-ascii?Q?67dcBPpLjgELIec5jQtVU5Koe/Pfo+8imI7S9sB655e5v8np9wZAqvs1qdfh?=
 =?us-ascii?Q?fzaaT3NtNgU0dM3STyuxjotNI9eMxzQFOmCuMqndf05Qt/pWCPSlLPwVDPTh?=
 =?us-ascii?Q?kzgmsQpBXGml+2biiadBsSKIxTLYvX8dh0Wt6txP167jD5r5GZNBEDr+8Ad4?=
 =?us-ascii?Q?tDOkPP9YAlqJSYN7alYik5hCmAnjPpqW1zcKjrvbexOlhJ0DSuK0JULIUbOR?=
 =?us-ascii?Q?1/7ei3bLNUQ3ay9xd5mimB1OUXX6lmlT179p1dULYJWYG2PPJjXcyrlhiHEN?=
 =?us-ascii?Q?SINXix9X67++SD9N+i9Ihy3XdMqoLMnfu73syJh72KGvu1HekW6fx7jgUoBZ?=
 =?us-ascii?Q?Znu8ZVYQ1uu/HTGrdzuGzNiVzNosTnw45So7zQJEuVdupYbKrFkcNZQwXY2R?=
 =?us-ascii?Q?KuPdyNtYA7T0vpfn2POPpnz3d0YAdanjlm28UmuQpr/ibF4yiu83Y8ktluxE?=
 =?us-ascii?Q?yqF1nIHxqcyF8E0m0YRMdZinwm3V24V8ATcKWCW6pquiXD9SjTf5k5CeRxZa?=
 =?us-ascii?Q?ND+KqiR4wZZGRNHwwWhm8wCHCkuctmhtJUOy1QU8V+yDEdUJvgByb/MOGB/x?=
 =?us-ascii?Q?v+ETwl1kp018Mz4a74lZngVyZerpyYdSHIZYanzmF1CKS+uaQ2lu5xvG5IGU?=
 =?us-ascii?Q?Nd59TuXoZEvbosCZsEYOPCc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e10baa-8037-4d56-d447-08d9bbd203e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 11:41:33.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ikx0ujIyg9V09piR22GX/iOLFzzybzlbUHbebE9S9NQsO0ktSBAoaEdBH2KlEmuUMdV8UDIUvsr0O+VvG53nIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 10.12.2021 10:36, Roger Pau Monn=C3=A9 wrote:
> On Fri, Dec 03, 2021 at 01:38:48PM +0100, Jan Beulich wrote:
>> On 02.12.2021 15:10, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:47:41AM +0200, Jan Beulich wrote:
>>>> @@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
>>>>      /* Pages that are part of page tables must be read only. */
>>>>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
>>>> =20
>>>> +    /*
>>>> +     * This needs to come after all potentially excess
>>>> +     * get_page_and_type(..., PGT_writable_page) invocations; see the=
 loop a
>>>> +     * few lines further up, where the effect of calling that functio=
n in an
>>>> +     * earlier loop iteration may get overwritten by a later one.
>>>> +     */
>>>> +    if ( need_iommu_pt_sync(d) &&
>>>> +         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_p=
t_pages,
>>>> +                     &flush_flags) )
>>>> +        BUG();
>>>
>>> Wouldn't such unmap better happen as part of changing the types of the
>>> pages that become part of the guest page tables?
>>
>> Not sure - it's a single call here, but would be a call per page when
>> e.g. moved into mark_pv_pt_pages_rdonly().
>=20
> I see. So this would result in multiple calls when moved, plus all the
> involved page shattering and aggregation logic. Overall it would be
> less error prone, as the iommu unmap would happen next to the type
> change, but I'm not going to insist if you think it's not worth it.
> The page table structure pages shouldn't be that many anyway?

Typically it wouldn't be that many, true. I'm not sure about "less
error prone", though: We'd have more problems if the range unmapped
here wasn't properly representing the set of page tables used.

>>>> @@ -840,22 +928,41 @@ int __init dom0_construct_pv(struct doma
>>>>  #endif
>>>>      while ( pfn < nr_pages )
>>>>      {
>>>> -        if ( (page =3D alloc_chunk(d, nr_pages - domain_tot_pages(d))=
) =3D=3D NULL )
>>>> +        count =3D domain_tot_pages(d);
>>>> +        if ( (page =3D alloc_chunk(d, nr_pages - count)) =3D=3D NULL =
)
>>>>              panic("Not enough RAM for DOM0 reservation\n");
>>>> +        mfn =3D mfn_x(page_to_mfn(page));
>>>> +
>>>> +        if ( need_iommu_pt_sync(d) )
>>>> +        {
>>>> +            rc =3D iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_page=
s(d) - count,
>>>> +                           IOMMUF_readable | IOMMUF_writable, &flush_=
flags);
>>>> +            if ( rc )
>>>> +                printk(XENLOG_ERR
>>>> +                       "pre-mapping MFN %lx (PFN %lx) into IOMMU fail=
ed: %d\n",
>>>> +                       mfn, pfn, rc);
>>>> +        }
>>>> +
>>>>          while ( pfn < domain_tot_pages(d) )
>>>>          {
>>>> -            mfn =3D mfn_x(page_to_mfn(page));
>>>> +            if ( !rc )
>>>> +                make_pages_writable(page, 1);
>>>
>>> There's quite a lot of repetition of the pattern: allocate, iommu_map,
>>> set as writable. Would it be possible to abstract this into some
>>> kind of helper?
>>>
>>> I've realized some of the allocations use alloc_chunk while others use
>>> alloc_domheap_pages, so it might require some work.
>>
>> Right, I'd leave the allocation part aside for the moment. I had actuall=
y
>> considered to fold iommu_map() and make_pages_writable() into a common
>> helper (or really rename make_pages_writable() and fold iommu_map() into
>> there). What I lacked was a reasonable, not overly long name for such a
>> function.
>=20
> I'm not overly good at naming, but I think we need to somehow find a
> way to place those together into a single helper.
>=20
> I would be fine with naming this iommu_memory_{setup,add} or some
> such. Marking the pages as writable is a result (or a requirement
> might be a better way to express it?) of adding them to the IOMMU.
> Would you be OK with one of those names?

I'll use the suggestion as a basis and see how it ends up looking /
feeling.

>>>> @@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>                                          perms & IOMMUF_writable ? p2m=
_access_rw
>>>>                                                                  : p2m=
_access_r,
>>>>                                          0);
>>>> +        else if ( pfn !=3D start + count || perms !=3D start_perms )
>>>> +        {
>>>> +        commit:
>>>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count,
>>>> +                           start_perms, &flush_flags);
>>>> +            SWAP(start, pfn);
>>>> +            start_perms =3D perms;
>>>> +            count =3D 1;
>>>> +        }
>>>>          else
>>>> -            rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORD=
ER_4K,
>>>> -                           perms, &flush_flags);
>>>> +        {
>>>> +            ++count;
>>>> +            rc =3D 0;
>>>> +        }
>>>> =20
>>>>          if ( rc )
>>>>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx fai=
led: %d\n",
>>>>                     d, !paging_mode_translate(d) ? "IOMMU " : "", pfn,=
 rc);
>>>
>>> Would be nice to print the count (or end pfn) in case it's a range.
>>
>> I can do so if you think it's worth further extra code. I can't use
>> "count" here in particular, as that was updated already (in context
>> above). The most reasonable change towards this would perhaps be to
>> duplicate the printk() into both the "if()" and the "else if()" bodies.
>=20
> Maybe. The current message gives the impression that a single pfn has
> been added and failed, but without printing the range that failed the
> message will not be that helpful in diagnosing further issues that
> might arise due to the mapping failure.

I guess I'll make the change then. I'm still not really convinced though,
as the presence of the message should be far more concerning than whether
it's a single page or a range. As middle ground, would

             printk(XENLOG_WARNING "%pd: identity %smapping of %lx... faile=
d: %d\n",

be indicative enough of this perhaps not having been just a single page?
Otoh splitting (and moving) the message would allow to drop the separate
paging_mode_translate() check.

Jan


