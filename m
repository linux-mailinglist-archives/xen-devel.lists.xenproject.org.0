Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809C464D2E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235951.409274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO37-0007xG-5O; Wed, 01 Dec 2021 11:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235951.409274; Wed, 01 Dec 2021 11:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO37-0007vG-2Q; Wed, 01 Dec 2021 11:45:21 +0000
Received: by outflank-mailman (input) for mailman id 235951;
 Wed, 01 Dec 2021 11:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msO35-0007vA-MM
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:45:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 280c1f11-529c-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:45:18 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-mDQSilL8Oqm10oZk_3Bt5w-1; Wed, 01 Dec 2021 12:45:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 11:45:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:45:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0089.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 11:45:13 +0000
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
X-Inumbo-ID: 280c1f11-529c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638359118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkIqO0RRzt/L79xxcX5H+p/ynLuWRbwBr/UR9tkB0jc=;
	b=l1RRu6oGF6z95ARfCPFR+x4TxSYbe07MAjBmY53WdXDJXygAEQLSZq9XFcdS4tGSAblwme
	zobXrYermxSpLBQv40nik7mbaVktRXvN+GFlA7TqN/p6/w9GwAXh+wxjWJhNPYnlbouq8f
	OhnS+bDW5A+7HCz0CtUpM9fy7dOnlzg=
X-MC-Unique: mDQSilL8Oqm10oZk_3Bt5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCkxJcOgo22WD8K9dSfifIEBuNMYDhiPh8wg7IOpNTknmXC5b6vttTx+B3hU7+wWfvMP8UUWJg8zWfN5ztc/jOG3OvprQbyaozXtm3WiMDdAG5Tn0Si48HT9hTsP6HppoXhHs/wm7v1K7hwfRHp1BD6mTRgsqGfg6yM86oVHjoRlHu25/VFF9OH2VOTZKyi/zhYxwkgPjedyTlmZLsYdlmBMdCbX0MU1PkmNiIAql7NyHF2K+teEyGwex1AvvxdgQVKOld1t9IbIYiqVezbKpD5NXNhx4Qk3zm8J7UQ06dplqQolkE8cOQl2I53YaKpYrLBYZafxrqrcfs5/2hTBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4IVWEtRk6K7m+zrtbeKk+dr4fXqtN0FFcTY7TgJ9+w=;
 b=bqwMwrez+nWoEEIOxeNhi1BuZZw7iyS7d53SJcfKEAA2TUi4kR9y89sn/1ncvcb5KXpUXCSFk6mIxp7KqyytUWrZEl+ABZJMxZFrOyoRCqq+WX2zJ9JlAxf9HKHy6OsAlZEH1hX/h4jC7Bo/WOH8bRGROhHZoDpkuDr33lQ6NFBw6mcWKxJEh0Ap3rvH0KFvUNAidgj7rmpGloVg/4pNlx1vek1PwfATkM3fdiJR4kZPB2LnEEpmVElITkYWfwqB5nEijl9BHptroJU32alwJoNey4hz2cmVyMOEFdjL+NBi6i90LPskiS/8yV//1Xev7lqB1WKVoeDJ4t40rLUerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
Date: Wed, 1 Dec 2021 12:45:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
 <YadPLZqfN2pu5SeG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YadPLZqfN2pu5SeG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0089.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc227b77-7f21-4fe3-37a5-08d9b4c009ec
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304963330C643D17E0985FDB3689@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DFBFJ2ed4iRGgb3wKWicMQKQ7DtcoI23pWMw2/K5ubdTZUqm5SOYC3mkB4pKpkbh0xL+oYQMJ+sM5iQu6QagjkUHVtZKTkz8mMV9n6p6m09JK9o2RjOWRqvYZg2Bw1y239YiM+a2Lt1VWiFEIY2UXxm+bB00nbJ95o6A9fXtwtWYW5Mxv0j39yJTn8Xc+ihsnBh9e86krbq1J6YfCA19wDpPi1ZWLTikRecedK/UpO5cazLodFYYHOmpOHR0uH4TdeJ1YxfQuDIsiLt3iSddwJVNLHlJvViLvcS6EBwQZ4Mfe+prJnmVRCQhu1qP5QTChrn0d2xIQcPMartLRtBQu6f3qH9GizzSAhr/No6VBDSFdL4wIRBg7zQpj/BiFNidVztIpBhJeMeunIRtOimgSSqRxYoNWRvxvAKCeJs8BdFSz7NRlspSfyMylVI+5oHDfuiIS8Eqam+Q7XPJTrFlbmZXXXiy++GQALa2kTw/Bq0Ey3DL1O0spWBA5wfavoRO4D/K837oxLZDXCsmdPReLp5f2EIrpdkpyclYdRDHDGXeXEXLMSlLT05Ke3f681GonwqMWZm31wc6tEdTrvvQ9SBo7DeUtsQyckW9tYSyzX+MmQt8NkgML7Abh+Yyw2t6KnDKZQ4rvrFAMV8LjqPM3hTHnOFuq3oV6ttaHLgeE8cVhZ+IBj9F0aSDhvggezTYCOdhd6g+IE1mue5g0JCK60cGKqmqg1BYR6XZh/QG2Is=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(36756003)(38100700002)(31696002)(186003)(26005)(8676002)(2906002)(5660300002)(66476007)(53546011)(83380400001)(54906003)(956004)(2616005)(31686004)(6916009)(66946007)(66556008)(316002)(86362001)(16576012)(6486002)(8936002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UVxjZN/3ikODAvF6R1NC0nj57ctyL9KWJ685aorQE2IIxT1U41ucbgK9kIib?=
 =?us-ascii?Q?u8S0eLENdjAV6wNoE+/p6HWWZPu2+/2Fj1SBw+D3fBrSckMTnrQ2i/u4hVhU?=
 =?us-ascii?Q?RecYFsGOS4ba8LuweybAMATkOHkXhhh50KnvOznOPkXx9hAn0/SSYZfsV8PL?=
 =?us-ascii?Q?qCUKzLaGGl0fA9CML7XYyJqOFhEyITOcOzYwjAXwltMArXqsWr2p56Y/Qt9z?=
 =?us-ascii?Q?ZdyZiR2KnartHWYsWTUNOl8oNcmIjhe9dJFMYtddUV+jpUPul0RqGyYqcF6+?=
 =?us-ascii?Q?BFZE/tK8E3i1FaOLpUpDL0iudL6YwuIbcGEaHZQTpZVcuGktPcAxZWMUVf54?=
 =?us-ascii?Q?Y/7LMMnoAwMSU7xWad+CwyLWcjY6H5RCwbRYYO9GRz2bNELzxAp8FZ+ojGzV?=
 =?us-ascii?Q?MqG5xbfAQG7gs8L1m9qWxp8SAvD5uUEyw1HTxdltXsLV2ekFfU99fjaHgif9?=
 =?us-ascii?Q?7EQLINyYmBWr4YCuvv8fVJg6IF8FZ1qW9Ivi/jaA24jwr7JdatPCI7sGWfDG?=
 =?us-ascii?Q?ObQgpHIZ30RQMV1qojZxY8W16WSMKuA5xCzyVGhCSeA9B1jkXSLBW4ibc/xY?=
 =?us-ascii?Q?cZJ/XKATaaIUmmrwlS5IlsyuFTY1r7DdkTrtuSooW2tLqnyJkuMAB/jZeMd8?=
 =?us-ascii?Q?yxpwKOkGYjtbU9ujhfomKEzdw+ltPMYCtmt/pgHmA7c4uKu8XB9LfsKxp5zv?=
 =?us-ascii?Q?giiorTSSt8/ERGigiXtS1p+2bKQfUL7ySEbGoQa7pvoBYTXknJZ+H5GWyq61?=
 =?us-ascii?Q?bl9jQvS4ZQOZ23515/E9eWzCcKC4Po4Sc+KPgEA/BLAAD98AG4wHry/F3w2A?=
 =?us-ascii?Q?otYz9qc6TMYlYJupLJ8Kkx5At3Mayrv7pAlSywegfWAExHMhQJUsoeNjbjQM?=
 =?us-ascii?Q?EpNfBVKetF8EMj9DM+q3lvB0RiCjNqzgk/ivY0swCblo4bIHWl6g09SxRZAO?=
 =?us-ascii?Q?5KiBeQwRr+2Pc5zKWm3Td4+Myk4SX5PveEDQMEuzrR6gne7v8gCQ8CaCfsK0?=
 =?us-ascii?Q?xK1tLOe609EIiJvuBu77sgRH3V4y5enIXO/Y+hSascmvJ4NrTJqJQRc16DOv?=
 =?us-ascii?Q?ldP+4wzAFXFABAKV+BIye4wz7mgLxx3ZaOn/zx2MckFODR+SXW545+vwAqBZ?=
 =?us-ascii?Q?Z8P/wxOmVmF7kyWr86gOW48Pc69Md6lIBrFjH6j6ihnRjSgY1hUfeTbEnPNd?=
 =?us-ascii?Q?OcFQs1zaZHJunNK9IvQGCf5UH0P0cWJOHVCS46LH5OTszeNP3Ooh4eSuWEaX?=
 =?us-ascii?Q?SN3BObdDS+zymURzR9iKCgZHM8xCcpoY/+fYX2IhgyqdCTKJ47Q4Dnea8nui?=
 =?us-ascii?Q?vgfEcUBQP8//O3vmwmj8rB0g5Px78D7UF4ssXlhGfqSgDSVRd6mLe5ISjIjK?=
 =?us-ascii?Q?mXV3nHYeB6291MfoynNOrHixZn6te0je8UxpsM+HNlps2DriNw662aPmwDqu?=
 =?us-ascii?Q?KOmlyIICMPUXAzLh2w3/58xSbMqshT5P3HPiVGtg4zEbdTp+DOrtHIHb38IY?=
 =?us-ascii?Q?lT5ptgMZ5eMurdMWOZJinT+O20xLz/EH03TWwIcLeSk0o13qa2dbbMqnH4xY?=
 =?us-ascii?Q?EgQasPLhPwc+guA0tvPCSiPPkdp5eBkEerVlnPoS3qiRVR/LTzYUiObZ2Qna?=
 =?us-ascii?Q?skEaazSN10VeJnrpo0HoCwg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc227b77-7f21-4fe3-37a5-08d9b4c009ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:45:14.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/CiM6ofI5fT9qlZu39LHZY4hjWzZUcLNULnh+tQiuS0bge4xSo4VXlFBw8St6fPfa1d3Z8PslY94cEo6FqkqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 01.12.2021 11:32, Roger Pau Monn=C3=A9 wrote:
> On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
>> On 01.12.2021 10:09, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
>>>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>>       * that fall in unusable ranges for PV Dom0.
>>>>       */
>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>> -        return false;
>>>> +        return 0;
>>>> =20
>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>      {
>>>>      case RAM_TYPE_UNUSABLE:
>>>> -        return false;
>>>> +        return 0;
>>>> =20
>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>          if ( iommu_hwdom_strict )
>>>> -            return false;
>>>> +            return 0;
>>>>          break;
>>>> =20
>>>>      default:
>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>          {
>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>> -                return false;
>>>> +                perms =3D 0;
>>>>          }
>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn >=
 max_pfn )
>>>> -            return false;
>>>> +        else if ( is_hvm_domain(d) )
>>>> +            return 0;
>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>> +            perms =3D 0;
>>>
>>> I'm confused about the reason to set perms =3D 0 instead of just
>>> returning here. AFAICT perms won't be set to any other value below,
>>> so you might as well just return 0.
>>
>> This is so that ...
>>
>>>>      }
>>>> =20
>>>>      /* Check that it doesn't overlap with the Interrupt Address Range=
. */
>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>> -        return false;
>>>> +        return 0;
>>>>      /* ... or the IO-APIC */
>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++=
 )
>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address) =
)
>>>> -            return false;
>>>> +    if ( has_vioapic(d) )
>>>> +    {
>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_addre=
ss) )
>>>> +                return 0;
>>>> +    }
>>>> +    else if ( is_pv_domain(d) )
>>>> +    {
>>>> +        /*
>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to esta=
blish r/o
>>>> +         * ones there, so it should also have such established for IO=
MMUs.
>>>> +         */
>>>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>>>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>>>> +                return rangeset_contains_singleton(mmio_ro_ranges, pf=
n)
>>>> +                       ? IOMMUF_readable : 0;
>>>> +    }
>>
>> ... this return, as per the comment, takes precedence over returning
>> zero.
>=20
> I see. This is because you want to map those in the IOMMU page tables
> even if the IO-APIC ranges are outside of a reserved region.
>=20
> I have to admit this is kind of weird, because the purpose of this
> function is to add mappings for all memory below 4G, and/or for all
> reserved regions.

Well, that was what it started out as. The purpose here is to be consistent
about IO-APICs: Either have them all mapped, or none of them. Since we map
them in the CPU page tables and since Andrew asked for the two mappings to
be consistent, this is the only way to satisfy the requests. Personally I'd
be okay with not mapping IO-APICs here (but then regardless of whether they
are covered by a reserved region).

> I also wonder whether we should kind of generalize the handling of RO
> regions in the IOMMU for PV dom0 by using mmio_ro_ranges instead? Ie:
> we could loop around the RO ranges in PV dom0 build and map them.

We shouldn't, for example because of ...

> FWIW MSI-X tables are also RO, but adding and removing those to the
> IOMMU might be quite complex as we have to track the memory decoding
> and MSI-X enable bits.

... these: Dom0 shouldn't have a need for mappings of these tables. It's
bad enough that we need to map them in the CPU page tables.

But yes, if the goal is to map stuff uniformly in CPU and IOMMU, then
what you suggest would look to be a reasonable approach.

> And we are likely missing a check for iomem_access_permitted in
> hwdom_iommu_map?

This would be a documentation-only check: The pages have permissions
removed when not in mmio_ro_ranges (see dom0_setup_permissions()).
IOW their presence there is an indication of permissions having been
granted.

>>>> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>      for ( ; i < top; i++ )
>>>>      {
>>>>          unsigned long pfn =3D pdx_to_pfn(i);
>>>> +        unsigned int perms =3D hwdom_iommu_map(d, pfn, max_pfn);
>>>>          int rc;
>>>> =20
>>>> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
>>>> +        if ( !perms )
>>>>              rc =3D 0;
>>>>          else if ( paging_mode_translate(d) )
>>>> -            rc =3D set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
>>>> +            rc =3D set_identity_p2m_entry(d, pfn,
>>>> +                                        perms & IOMMUF_writable ? p2m=
_access_rw
>>>> +                                                                : p2m=
_access_r,
>>>> +                                        0);
>>>>          else
>>>>              rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORD=
ER_4K,
>>>> -                           IOMMUF_readable | IOMMUF_writable, &flush_=
flags);
>>>> +                           perms, &flush_flags);
>>>
>>> You could just call set_identity_p2m_entry uniformly here. It will
>>> DTRT for non-translated guests also, and then hwdom_iommu_map could
>>> perhaps return a p2m_access_t?
>>
>> That's an orthogonal change imo, i.e. could be done as a prereq change,
>> but I'd prefer to leave it as is for now. Furthermore see "x86/mm: split
>> set_identity_p2m_entry() into PV and HVM parts": In v2 I'm now also
>> adjusting the code here=20
>=20
> I would rather adjust the code here to just call
> set_identity_p2m_entry instead of differentiating between PV and
> HVM.

I'm a little hesitant, in particular considering your suggestion to
then have hwdom_iommu_map() return p2m_access_t. Andrew has made quite
clear that the use of p2m_access_* here and in a number of other places
is actually an abuse.

Plus - forgot about this in my earlier reply - there would also be a
conflict with the next patch in this series, where larger orders will
get passed to iommu_map(), while set_identity_p2m_entry() has no
respective parameter yet (and imo it isn't urgent for it to gain one).

Jan


