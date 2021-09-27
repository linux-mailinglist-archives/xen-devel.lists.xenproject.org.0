Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73460419145
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196558.349452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmYq-00073c-F2; Mon, 27 Sep 2021 09:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196558.349452; Mon, 27 Sep 2021 09:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmYq-00070D-BK; Mon, 27 Sep 2021 09:04:32 +0000
Received: by outflank-mailman (input) for mailman id 196558;
 Mon, 27 Sep 2021 09:04:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUmYo-000707-Gh
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:04:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb74f396-1f71-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 09:04:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-WDu41gZKMLqyKG12tlhcDA-1; Mon, 27 Sep 2021 11:04:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:04:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:04:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Mon, 27 Sep 2021 09:04:25 +0000
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
X-Inumbo-ID: eb74f396-1f71-11ec-bc43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632733468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rR5Bi4C/0nThtlZ0ncdcLtoL5SQYZkVOfglVAd2DgKg=;
	b=MH/fHbE+hxI9Bjh+jCobOhaexjJ+T3ZSUPdQ+bb/HROYKr/0FBY2le1N5Ig/w4G6VKWzVT
	SLIZL/FaSVeIwaBLpKupLR0aofPkscUoTzG6j2o82EPeCDauJGiBa7+oARx4xmLpkjmcIF
	PoHMiWJjz1i8h0ZILiCDQegT1Inn8rU=
X-MC-Unique: WDu41gZKMLqyKG12tlhcDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWu+ASa4VKwokixrn3Uvnjq+DCTfN/u3GAJbOufsOdhiazjNeZIuL4QpMN2IN8xPL46Ml92AsnfxlLYrl3zX4802on1GDcTzihrlxTn+91JKiNizYL/YhfHz3Gzc6NrDE72pR26VJa/AO/E+FzTorROzS1/eq61kLBrqPqy16K1Q2nykZ5MjKT/myLuFKStiEqP1wxbyif2N4rltRkndz70XnMFz/+KpooHFLXdEk0e0UzP95gbG6o4oeNNXQdOtUGruDcfgrmJTsmB4sm/0bBnLGKqXHPYFIqvIQFebkU+6DHYObCCqv5G9HxTAAZU3bkllBPhz4i51DsHEeIuLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XsFCFAVp28fbkgmW0sLX6BCKQZCn6WqvaZwT8rsKZf8=;
 b=SC4igtGScXi284bsTrUOfDeUaZ1BQ7pK53SlxvcA2dqTWKqGRvXFeS8OxoDz2Ku5JT6mGISiLbxOf7k5Y1Fy3Ahp9FB7NGEh3dk4qBD+cNHqMuUQDO9xXPHdejKsH0xCEnGTRhofCnQTklSYcrrE3BLTmii2heKSHR85aUvwVMzUhbIc7SByFZpeSr8yQDyvt0Du941jNBr80JEmeaI9y09dZzhRjuovxM05tx6nrfS/PWmkflV21LulX+AB1CB3lo8m0qrJ/NH6n1HCzQgD+tU9+ivRoXJCEVwZpnLjz1sv3ndTbtVAm1oeeD4DFOFjoIkMlvVBK6N60cySmz8gFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 02/18] VT-d: have callers specify the target level for
 page table walks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
 <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
Date: Mon, 27 Sep 2021 11:04:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6df64749-a66b-40ac-a5f2-08d98195cdcb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70390797E5255D239FEA17E5B3A79@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OYZulweWFfSIpzybj0c3CX8KtkGt1bWk2cEyZsn5dYzDOiuB6Ns5N2rV5ytxilkNalbNoT4qqB0C62TBPvFDEp6ubHM5tcY1J7iQMZ2FSmKM9Mhc4yJ436ZzCVMpD590VLLJKUhjKxi6yY7x06J3AE+m2Ib5zUypj/DJUQlmDwuxRRNuvq0osM5acCNDN+bcJdcKSvqY7My3iRFfx5iFhfmjP4/WG5ZnGlN0Lhl1qjYBTzy6PsUKwqvLQ+b6faGbq6rHmsXuTjivee8KoZApjKqqUk5dzQnZIwW13T1uxvf4P29/g8ir5WBUOslHF9jMkva3SIlm8M7Wezz2lu6gB4bXM8naRb9cjawIX3MSlLFaH0U3FV71NZoZa6QNZnJxHgBcCa3Al9ByaoYYVoiiVolRjRhYB8YAFTz8zYiKNzIQPGiKUjuVxnwOcU1hl4Ds91TasG8VjmJ5raCZtqMWj/4iwVc0Xn5fHMiT+Wp5mOZFq0Vo6WNLs40y60bbcRapZMd5Ei9RfFqcVqDfZozBUIAz/iVPYLx579EAfGHseOb+VQasOCj+98q9rGNS+dfPl9Ug49ob+U9u2fak0lD3fCd+JLuXxF1ozy+DT0Ka7ye5MZdCRDPtbRgESDkUjNo/ul6nmHPmdmlUHjEIj2bHReFRavMLeSrwVTDo7gpWyAUANJLixg9ivuPDuNaFL+yaVTkcHGhuQO2uO6F3inaGRX//KQyw+SLDu9DLW6nmTUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(66946007)(16576012)(8936002)(66556008)(66476007)(38100700002)(186003)(26005)(508600001)(2616005)(4326008)(956004)(31686004)(8676002)(6486002)(86362001)(2906002)(36756003)(5660300002)(316002)(54906003)(31696002)(110136005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1QJnb/hO7KIEZciTkLE927qEq+lH+9uNAKfsiH7R2GXuW9XldqU23TOyV1vs?=
 =?us-ascii?Q?ho0Uiu0BHtR+2VDsAgjmberrbpa93U9R2BceE6T2/KBfYeCqeScfJEJBH9uI?=
 =?us-ascii?Q?VMDyaIhCOTqTTtb6Wprw02i2bGwmNGyl7ys3ab9oDVtJqovpa8BeUjyG2P2o?=
 =?us-ascii?Q?QFE7HQAJNZY6kD1nsGxLu0IDxq8O0PB6P9HxRbmp2nwyByTYuawBiGQu4+Vs?=
 =?us-ascii?Q?D4CzPHUdpDN9jaOFkrwqck7sTSseqlyjknhayvoy6YSi96HbwkgiQk8HC2mQ?=
 =?us-ascii?Q?A8klWnccCftyNle1LlUwZeAUCcBKu6BhlaTexpkrPio3L8BdeCRljOwD/9G7?=
 =?us-ascii?Q?wXJV3mJDfns4vy63uJYSdA6E5gZufEfbfGwvFOe5yIQ27oWAlpnFRtD/1jx+?=
 =?us-ascii?Q?Kdsxi5fuWi5iKjYlszvgAHNi9D+HMwxnOkkedtjePGb0jlaExbmHfoPKCMZ+?=
 =?us-ascii?Q?91azHUQtMREbyjs5iGwNwvv5KQkVFS7zbcSmOJzBJ6Rwc7QbG1w7fMcAlVnG?=
 =?us-ascii?Q?dYrl8vNz/k5pN1EmfkHiAw2M2qDTgQeZOHyD7+97cJ2FihC4DTN46qWUQh6X?=
 =?us-ascii?Q?cb1cp32Wd9LoaENv4sv3ZKSYLp/QhoivgoNmxOccEQ4TGMYfXjBnS2f/D0Tg?=
 =?us-ascii?Q?gxhn44/+vlUmsQpmofuVhuVLmXE/PY2VGh5GQUnwBIUNQMhT4d7PmCg3u2Fi?=
 =?us-ascii?Q?otYnbBP4BWYqcI8qiG5vqiqgYpZ+BkFbiCDsRcu6uv4nnWuvp69dAqItylJL?=
 =?us-ascii?Q?0gEuhWoZqzJY1kr831zFtw9O6DSn81RTl5vxKzSTiLL2lvrkcb2YFtujcCJN?=
 =?us-ascii?Q?hhJe5/DET1V1c/5tcbc52X13sztD0avKgyzYL8+82bOQLfW577h7PRJfkl9W?=
 =?us-ascii?Q?OqI1QXgMDx1nJiov8iksuwDtCVWls9TMV4KqfwRmBXE4ExCwv3GK9aSxOApl?=
 =?us-ascii?Q?3i7cCHOb5KFAZsry0cqpze2h63NKvfDqPGKAzF3rNWNM4fXS897heQmp9Rm4?=
 =?us-ascii?Q?AuEzKWfKEPCjj+wS5RtrM5Bx3GtnFZZiqYbr29phUAOoWI0Unljt9WEuhemW?=
 =?us-ascii?Q?hroimY6oyJAAFUztuIMjCcI0sFfTH9KfzTw9kZNmlji0XZE94cKExFy+1diL?=
 =?us-ascii?Q?Sur0whSpzhxt4zYb8lfWftt7YY5sn8iZl38pI4tSQ4vNJsb9CbBMvgRmEoSR?=
 =?us-ascii?Q?i6l/+GUewQ+NwPStXvUu2UYrWP/5bIGGLqp65g4PNhJX4Uijzw1XVyX7I7oY?=
 =?us-ascii?Q?qUyCJDpng7idINWFeAr3lnNEAnknXal12FR+EAaw3kQjgJFq0yGNY4wyZ1dm?=
 =?us-ascii?Q?pWoJr+rkeETN+68izVXEhAaK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df64749-a66b-40ac-a5f2-08d98195cdcb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:04:25.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59/EGjYP9KTsk2WckCxDCJ6/HrRuWhQYlL2sAz3PzZMYiiO7eIhwKdAHDf5pIcSVJgaCOp76CExPRb9y3qx51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 24.09.2021 16:45, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:42:13AM +0200, Jan Beulich wrote:
>> In order to be able to insert/remove super-pages we need to allow
>> callers of the walking function to specify at which point to stop the
>> walk.
>>
>> For intel_iommu_lookup_page() integrate the last level access into
>> the main walking function.
>>
>> dma_pte_clear_one() gets only partly adjusted for now: Error handling
>> and order parameter get put in place, but the order parameter remains
>> ignored (just like intel_iommu_map_page()'s order part of the flags).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I have to admit that I don't understand why domain_pgd_maddr() wants to
>> populate all page table levels for DFN 0.
>=20
> I think it would be enough to create up to the level requested by the
> caller?
>=20
> Seems like a lazy way to always assert that the level requested by the
> caller would be present.

The caller doesn't request any level here. What the caller passes in
is the number of levels the respective IOMMU can deal with (varying
of which across all IOMMUs is somewhat funny anyway). Hence I _guess_
that it would really be sufficient to install as many levels as are
necessary for the loop at the end of the function to complete
successfully. Full depth population then would have happened only
because until here addr_to_dma_page_maddr() didn't have a way to
limit the number of levels. But then the comment is misleading. As
I'm merely guessing here, I'm still hoping for Kevin to have (and
share) some insight.

>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -264,63 +264,116 @@ static u64 bus_to_context_maddr(struct v
>>      return maddr;
>>  }
>> =20
>> -static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int =
alloc)
>> +/*
>> + * This function walks (and if requested allocates) page tables to the
>> + * designated target level. It returns
>> + * - 0 when a non-present entry was encountered and no allocation was
>> + *   requested,
>> + * - a small positive value (the level, i.e. below PAGE_SIZE) upon allo=
cation
>> + *   failure,
>> + * - for target > 0 the address of the page table holding the leaf PTE =
for
>                           ^ physical
>=20
> I think it's clearer, as the return type could be ambiguous.

Added.

>> + *   the requested address,
>> + * - for target =3D=3D 0 the full PTE.
>=20
> Could this create confusion if for example one PTE maps physical page
> 0? As the caller when getting back a full PTE with address 0 and some of
> the low bits set could interpret the result as an error.
>=20
> I think we already had this discussion on other occasions, but I would
> rather add a parameter to be used as a return placeholder (ie: a
> *dma_pte maybe?) and use the function return value just for errors
> because IMO it's clearer, but I know you don't usually like this
> approach, so I'm not going to insist.

MFN 0 is never used for anything. This in particular includes it not
getting used as a page table.

>> +static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t a=
ddr,
>> +                                       unsigned int target,
>> +                                       unsigned int *flush_flags, bool =
alloc)
>>  {
>>      struct domain_iommu *hd =3D dom_iommu(domain);
>>      int addr_width =3D agaw_to_width(hd->arch.vtd.agaw);
>>      struct dma_pte *parent, *pte =3D NULL;
>> -    int level =3D agaw_to_level(hd->arch.vtd.agaw);
>> -    int offset;
>> +    unsigned int level =3D agaw_to_level(hd->arch.vtd.agaw), offset;
>>      u64 pte_maddr =3D 0;
>> =20
>>      addr &=3D (((u64)1) << addr_width) - 1;
>>      ASSERT(spin_is_locked(&hd->arch.mapping_lock));
>> +    ASSERT(target || !alloc);
>=20
> Might be better to use an if with ASSERT_UNREACHABLE and return an
> error? (ie: level itself?)

I did consider this, but decided against because neither of the two
error indicators properly expresses that case. If you're concerned
of hitting the case in a release build, I'd rather switch to BUG_ON().

>> +
>>      if ( !hd->arch.vtd.pgd_maddr )
>>      {
>>          struct page_info *pg;
>> =20
>> -        if ( !alloc || !(pg =3D iommu_alloc_pgtable(domain)) )
>> +        if ( !alloc )
>> +            goto out;
>> +
>> +        pte_maddr =3D level;
>> +        if ( !(pg =3D iommu_alloc_pgtable(domain)) )
>>              goto out;
>> =20
>>          hd->arch.vtd.pgd_maddr =3D page_to_maddr(pg);
>>      }
>> =20
>> -    parent =3D (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_m=
addr);
>> -    while ( level > 1 )
>> +    pte_maddr =3D hd->arch.vtd.pgd_maddr;
>> +    parent =3D map_vtd_domain_page(pte_maddr);
>> +    while ( level > target )
>>      {
>>          offset =3D address_level_offset(addr, level);
>>          pte =3D &parent[offset];
>> =20
>>          pte_maddr =3D dma_pte_addr(*pte);
>> -        if ( !pte_maddr )
>> +        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(=
*pte)) )
>>          {
>>              struct page_info *pg;
>> +            /*
>> +             * Higher level tables always set r/w, last level page tabl=
e
>> +             * controls read/write.
>> +             */
>> +            struct dma_pte new_pte =3D { DMA_PTE_PROT };
>> =20
>>              if ( !alloc )
>> -                break;
>> +            {
>> +                pte_maddr =3D 0;
>> +                if ( !dma_pte_present(*pte) )
>> +                    break;
>> +
>> +                /*
>> +                 * When the leaf entry was requested, pass back the ful=
l PTE,
>> +                 * with the address adjusted to account for the residua=
l of
>> +                 * the walk.
>> +                 */
>> +                pte_maddr =3D pte->val +
>=20
> Wouldn't it be better to use dma_pte_addr(*pte) rather than accessing
> pte->val, and then you could drop the PAGE_MASK?
>=20
> Or is the addr parameter not guaranteed to be page aligned?

addr is page aligned, but may not be superpage aligned. Yet that's not
the point here. As per the comment at the top of the function (and as
per the needs of intel_iommu_lookup_page()) we want to return a proper
(even if fake) PTE here, i.e. in particular including the access
control bits. Is "full" in the comment not sufficient to express this?

>> +                    (addr & ((1UL << level_to_offset_bits(level)) - 1) =
&
>> +                     PAGE_MASK);
>> +                if ( !target )
>> +                    break;
>=20
> I'm confused by the conditional break here, why would you calculate
> pte_maddr unconditionally to get overwritten just the line below if
> target !=3D 0?

That's simply for style reasons - calculating ahead of the if() allows
for less indentation and hence better flowing of the overall expression.

Jan


