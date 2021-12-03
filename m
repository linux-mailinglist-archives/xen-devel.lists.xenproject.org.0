Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D046778A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237557.412010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7qD-0004LC-BI; Fri, 03 Dec 2021 12:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237557.412010; Fri, 03 Dec 2021 12:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7qD-0004If-74; Fri, 03 Dec 2021 12:39:05 +0000
Received: by outflank-mailman (input) for mailman id 237557;
 Fri, 03 Dec 2021 12:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7qC-0004IX-7h
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:39:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feb37fe2-5435-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:39:02 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-b221BH7jOZydz3_0f0j1Fw-1; Fri, 03 Dec 2021 13:39:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 12:38:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:38:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0163.eurprd06.prod.outlook.com (2603:10a6:20b:45c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 12:38:51 +0000
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
X-Inumbo-ID: feb37fe2-5435-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638535142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMH9z9dNLeljwCG0NUZ3oQRW/DQoP73m0aKjVbemS/E=;
	b=RprdeBh8ql7h5msViNPibbvGpXTGj1zfjdYmf+fL2NPW2vx6aQQC2E4GrjNDcM19/cCgx9
	ff45AnMI7TBLlQQNSrgrkkj/mPvDROvlvn1FnyQx6PAb+xfo+SPl5FynKtzvoy1lUyZA8V
	5kkru3zxl3g+LYhZiGjVqVRtRBw33t4=
X-MC-Unique: b221BH7jOZydz3_0f0j1Fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoC6gumCGwM9664o2gPVFVBXs1DlrVRdblhoM9m3JewZNaIDy5MeOylqUbcJ+7OJdRkxCfcFOq61X8LZw0nrZpwppCFGVcROHwhfsD6Q5w5aZrGWuZY0+hdhMx3o3AB9bia8gv6fs9cFZKVfG5BLIK9ArucSz+3J0dpk88gKLc8IfSVZVqHbxXo3SC/l4zeRmKv0TbEgfnD3MFEXFl2TB5hwVOigtOOMuyn4Syc2Tyk80yEd8ENjZUmCgLlVfeyHSEq9luqWw2nqQWrFFl4H9AYF0b74Fh9N0OdDZJivKNneYNz4j32dRbN7wmLR0Ce9nNcTFKlaIuEXvR+v/am8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VYRfu9EyLwvA7J3Z1EnTAe0vKAKo8A9fD7jOLH5kiw=;
 b=ko311QiCSV1NMs3YLRvImm0YJqB0x+Ms601n8IKm++p/nlxk3iiiMFRQa7Fgo4yOFA6JFMZ4wdm18Z+QQEadk3O1hOqbjVk4MEKSw0VNDgsH6U5BxuxYwRGnIb41YRWjfn8lIoMkneMie38x2uWsp1YebcGgpCqGU+SMy41IhKKtiJyooWBePZgeIecRc/P2zAcPYendOO9pDm91Lv9ch2D/IxVv6cbCcZmc/VgGxH5ONWPacpuemqR5MYtyo7nUm5SdFRroaF3x77/2JEDsTPV8GwdXfA9EVy9Mzz4WUH2NZbtaMwrkzZhag8HxOvbMtjvTSpIjorjjWu5gKtbJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a3a0a37-525d-e2aa-b396-b01d97434d56@suse.com>
Date: Fri, 3 Dec 2021 13:38:48 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YajTvrZz0xGOR3vT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0163.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc9b25e5-ab18-43ee-6f0c-08d9b659dcc7
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120714FC1F3C90F008E383AB36A9@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hJ5hT0fLYSnlzia/QexKJdBkPamkvuQEYcuhSXZs4z3X9Tgd1M/YfRmT176Q29YvsNxeN0RG6Q5g/1kSbQ++yFp/asexIbikZPRS86ZmrDe5Y+B9Oa7IB89wrmK6Ui1SNH1C8B5uFqM0sJf6pwh42xf7Ygjz21W9xiM6ZM0YHwsa9ufqkVpAZyjRQZasYVKl+Ocd7W/3CMfLapinsLN0u2HuIhKOAVkFRRZa9iDxpskDqp2BlWmbseKG78r/EvmJsqjqvAwFHDZiH3IE/4INnasSx7VAqU0rDsG5rS2YSY0/V9RIZe+JIB+DjkrKyWW2gS4eOR4vDzezz5Ln90C10bvaWhvS8pd+3qiMA3avN2wwmU8AsE2JOYpLHXP9kauUhUe2m7CwzLfrKRLRonNwsMElOsqGxtxey9dApOW4ylYRuhdgRcKcZ6TlP9Ifz6h/olHrmrti576Oy2ucrClMK1D95Yfdf+ZPevpmUdngwEyU7/BHQmhC/YFX8KVYvu8ofslntYh4ItOYreJ62bYn4Ur78aussl9UoftPSOY1l9vU2KwbVIt9yshXefnkPz82foNTDuLbv+l1G8l2ochDbLbwNzlQG96JuGQ6o++U2PE/odg0SsMkzhfM72fE61/eGNW4pManMHCk5v7lH02NgDBr28AlVfHe7rpek4goliBDwuaTXytEVA7vr9mNicglR7MpygZQkuyJ+evcF5WID7ZrzAw4boqpIFR41jRvj+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(66946007)(66476007)(83380400001)(26005)(5660300002)(508600001)(186003)(2906002)(316002)(6666004)(38100700002)(4326008)(86362001)(54906003)(8936002)(6916009)(66556008)(6486002)(2616005)(31686004)(8676002)(31696002)(956004)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ydKdKRPGhH+ZNlb7MPLgxIiljxYN+jL9TXdlG5E7BCJw7D8i7dO/JM7xL+wK?=
 =?us-ascii?Q?kvuOaLL5nWGK2xaR8v1NxtARAZmAWaXT4KifMYyrG6c2EghwfR7zhWpFBSD8?=
 =?us-ascii?Q?Opt8jX3Zo0ypzcsqOq5YDlO4Rg3ax4hK213q6TuulN/qQA3+VK85xSvFUR7A?=
 =?us-ascii?Q?Cfe9bKQWa2XsXnhJXc+X20CCLITvX21/05CALRxr00smc4uvnsJLQcE3TD0n?=
 =?us-ascii?Q?TOCdVUZeKYU1x56mjujTrxFO+moDxRPCTM0EhhSgY9ylUdx6WRx8Z/+5KXG0?=
 =?us-ascii?Q?26YIa900JtdqbA+v5V7W9mU/D+SDFrbT4HQvZ9f8FUbna9i+ouq4raaXr+s0?=
 =?us-ascii?Q?Adv6zjJhMDvyhQA39XDYV0KgrQDSA5XRFdWq6hlg6xLr7uhi//pICC7wpWdA?=
 =?us-ascii?Q?S3v+l+YPZwx8XTVDfevJ9KEyC97Y3sJaa7tmKXYTHN/nNJpwtGdgELG8rSk2?=
 =?us-ascii?Q?10F58z5mqQuVuuJRyOY/UICgvvs5rJwWqWihv4tJupOXKPCY4HsqYeJTje90?=
 =?us-ascii?Q?fUxtrA5WVDHOjGNQkjn3LGczqcrhzj8sVol4MZliUSIzvL7O4bcChaR8LBmt?=
 =?us-ascii?Q?8xgtCAb0gvUYlbwsuQdiQ5un+GETi+imW4JUkNNG4lyGnsqnp5pdLr9vtvTS?=
 =?us-ascii?Q?C7vh3i7cf3rt3dR8fsjvzBfthRZa3K7AZg1dfoNzP1jjTq19VxrtwZcJPLBu?=
 =?us-ascii?Q?fhnk1n/p6RB+UByo0wH6MkbdlPRGw+Pwpg+bELxz51URHAETN7EFy9FXaN9J?=
 =?us-ascii?Q?AeOXL6FRIsdU3qjAHkBcOl5jhTAz5TrtcRtRAEM4zYlyD0MyMKDgCx2KSP59?=
 =?us-ascii?Q?aTE/ZJ89aZffJdwkNH9Er4o+Clsrx3ZlHme3s5LNgJVlekVnDLpfHEjuvI9y?=
 =?us-ascii?Q?0jUX4pC9KdAxnZN2wPV8Ih0PcGPRUCVPGc4axtVWZip3ZNK/PGSlcySdEUNg?=
 =?us-ascii?Q?xCJsfWiZq1H1vckP+lOtNG05XosvE4rL0TGNXOuLszTRgkCHfS01XycDXFYh?=
 =?us-ascii?Q?6suW3iJDt/mkB/qIPF46HGqwaYYQUls7Ncrm8J7jx82rrJ+UBMpcSkZMf/j7?=
 =?us-ascii?Q?+cvH8GLy5ec0DcX87FruQBaYJy5OrMQsCypNAMkXpU8va4B8t8sspdwEYUNE?=
 =?us-ascii?Q?KJ1EAJQaSk+vTY24YFLtY3r+wtFWBrhiy3OoFb5GQ5CoMghY6WTBWSFMx2JP?=
 =?us-ascii?Q?HhUkVZvBJeiN8sbkwd1YP8hqgeUmUUraIFFig+dvEgZENRWAbrCY2vvPhQ54?=
 =?us-ascii?Q?WfTPt6STHW+l+vCE1UeGJubbTMu5ea/vqa/9zL3kumjrDXDLkVvr6OgxXhHq?=
 =?us-ascii?Q?qQS7vSqZmGEoIdAS824gzyiqRSwHSegbdzB/OVfV9DBh0YoOIse2+Zi7I5pk?=
 =?us-ascii?Q?kE5bmZxAP5TlTZJkpNsTYE4jN9Jv8854C9EeTzD3Ws2Pqnd4c0EEHKMMAcCy?=
 =?us-ascii?Q?OQY4W7aeOIbwdNk2ej7ltcfxJUd6PmoJEp0uXeS9asM0tZ/CPFH1U/rEETtw?=
 =?us-ascii?Q?x6mlQbatBH5FB6n7B9++wmtmq085EYFmMwkB6St5Lzv4cnjikRmbMzTBtgdl?=
 =?us-ascii?Q?TI/q7b4qX1M43CWmCRgR47ae+bsn3eNCV1UxSsifccw85SC47e5GMByDaRFv?=
 =?us-ascii?Q?r8UTCDx8d2l8+i79x73obPQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9b25e5-ab18-43ee-6f0c-08d9b659dcc7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:38:52.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2OSLrli2JopLpAJPQGJL8VUKhymmAhWW3AajivaTdfRl1TnTsZ72nL7lKCC9nXNdk2vJbmEtaQMM1HkcuWqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 02.12.2021 15:10, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:47:41AM +0200, Jan Beulich wrote:
>> @@ -689,7 +763,8 @@ int __init dom0_construct_pv(struct doma
>>          l1tab++;
>> =20
>>          page =3D mfn_to_page(_mfn(mfn));
>> -        if ( !page->u.inuse.type_info &&
>> +        if ( (!page->u.inuse.type_info ||
>> +              page->u.inuse.type_info =3D=3D (PGT_writable_page | PGT_v=
alidated)) &&
>=20
> Would it be clearer to get page for all pages that have a 0 count:
> !(type_info & PGT_count_mask). Or would that interact badly with page
> table pages?

Indeed this wouldn't work with page tables (and I recall having learned
this the hard way): Prior to mark_pv_pt_pages_rdonly() they all have a
type refcount of zero. Even if it wasn't for this, I'd prefer to not
relax the condition here more than necessary.

>> @@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
>>      /* Pages that are part of page tables must be read only. */
>>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
>> =20
>> +    /*
>> +     * This needs to come after all potentially excess
>> +     * get_page_and_type(..., PGT_writable_page) invocations; see the l=
oop a
>> +     * few lines further up, where the effect of calling that function =
in an
>> +     * earlier loop iteration may get overwritten by a later one.
>> +     */
>> +    if ( need_iommu_pt_sync(d) &&
>> +         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_=
pages,
>> +                     &flush_flags) )
>> +        BUG();
>=20
> Wouldn't such unmap better happen as part of changing the types of the
> pages that become part of the guest page tables?

Not sure - it's a single call here, but would be a call per page when
e.g. moved into mark_pv_pt_pages_rdonly().

>> @@ -840,22 +928,41 @@ int __init dom0_construct_pv(struct doma
>>  #endif
>>      while ( pfn < nr_pages )
>>      {
>> -        if ( (page =3D alloc_chunk(d, nr_pages - domain_tot_pages(d))) =
=3D=3D NULL )
>> +        count =3D domain_tot_pages(d);
>> +        if ( (page =3D alloc_chunk(d, nr_pages - count)) =3D=3D NULL )
>>              panic("Not enough RAM for DOM0 reservation\n");
>> +        mfn =3D mfn_x(page_to_mfn(page));
>> +
>> +        if ( need_iommu_pt_sync(d) )
>> +        {
>> +            rc =3D iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_pages(=
d) - count,
>> +                           IOMMUF_readable | IOMMUF_writable, &flush_fl=
ags);
>> +            if ( rc )
>> +                printk(XENLOG_ERR
>> +                       "pre-mapping MFN %lx (PFN %lx) into IOMMU failed=
: %d\n",
>> +                       mfn, pfn, rc);
>> +        }
>> +
>>          while ( pfn < domain_tot_pages(d) )
>>          {
>> -            mfn =3D mfn_x(page_to_mfn(page));
>> +            if ( !rc )
>> +                make_pages_writable(page, 1);
>=20
> There's quite a lot of repetition of the pattern: allocate, iommu_map,
> set as writable. Would it be possible to abstract this into some
> kind of helper?
>=20
> I've realized some of the allocations use alloc_chunk while others use
> alloc_domheap_pages, so it might require some work.

Right, I'd leave the allocation part aside for the moment. I had actually
considered to fold iommu_map() and make_pages_writable() into a common
helper (or really rename make_pages_writable() and fold iommu_map() into
there). What I lacked was a reasonable, not overly long name for such a
function. Plus - maybe minor - I wanted to avoid extra MFN <-> page
translations.

With a fair name suggested, I'd be happy to give this a try.

>>  #ifndef NDEBUG
>>  #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
>>  #endif
>>              dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
>>  #undef pfn
>> -            page++; pfn++;
>> +            page++; mfn++; pfn++;
>>              if ( !(pfn & 0xfffff) )
>>                  process_pending_softirqs();
>>          }
>>      }
>> =20
>> +    /* Use while() to avoid compiler warning. */
>> +    while ( iommu_iotlb_flush_all(d, flush_flags) )
>> +        break;
>=20
> Might be worth to print a message here in case of error?

Maybe. But then not just here. See e.g. arch_iommu_hwdom_init().

>> @@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
>>                                          perms & IOMMUF_writable ? p2m_a=
ccess_rw
>>                                                                  : p2m_a=
ccess_r,
>>                                          0);
>> +        else if ( pfn !=3D start + count || perms !=3D start_perms )
>> +        {
>> +        commit:
>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count,
>> +                           start_perms, &flush_flags);
>> +            SWAP(start, pfn);
>> +            start_perms =3D perms;
>> +            count =3D 1;
>> +        }
>>          else
>> -            rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER=
_4K,
>> -                           perms, &flush_flags);
>> +        {
>> +            ++count;
>> +            rc =3D 0;
>> +        }
>> =20
>>          if ( rc )
>>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx faile=
d: %d\n",
>>                     d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, r=
c);
>=20
> Would be nice to print the count (or end pfn) in case it's a range.

I can do so if you think it's worth further extra code. I can't use
"count" here in particular, as that was updated already (in context
above). The most reasonable change towards this would perhaps be to
duplicate the printk() into both the "if()" and the "else if()" bodies.

> While not something that you have to fix here, the logic here is
> becoming overly complicated IMO. It might be easier to just put all
> the ram and reserved regions (or everything < 4G) into a rangeset and
> then punch holes on it for non guest mappable regions, and finally use
> rangeset_consume_ranges to iterate and map those. That's likely faster
> than having to iterate over all pfns on the system, and easier to
> understand from a logic PoV.

Maybe; I didn't spend much time on figuring possible ways of
consolidating some of this.

Jan


