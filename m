Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D1539E39
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340271.565270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIo3-0002VC-Vm; Wed, 01 Jun 2022 07:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340271.565270; Wed, 01 Jun 2022 07:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIo3-0002TQ-RR; Wed, 01 Jun 2022 07:30:15 +0000
Received: by outflank-mailman (input) for mailman id 340271;
 Wed, 01 Jun 2022 07:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwIo2-0002TK-7G
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:30:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6eb242-e17c-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 09:30:12 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-R6MtrXxGNUOvIJCJrzZVBg-1; Wed, 01 Jun 2022 09:30:10 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4743.eurprd04.prod.outlook.com (2603:10a6:20b:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Wed, 1 Jun
 2022 07:30:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 07:30:08 +0000
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
X-Inumbo-ID: ac6eb242-e17c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654068612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRyVaMZksuTzQ8n2sOKfA0XEHeDp8MNHPGMJCPsZguU=;
	b=mRSghf3ByqumdmENCNilq4Rtc+N3SS12hyjA4eUaOKNXBaH23g6a/+D08OrZsCL3ecQutR
	hoE4C+PZWEtoCaP8RS1LjduSFx8G2mGXf26Td4FKu11vs04diLhfCRXcI8jTO09nhCg4GW
	yffO/+j0D+YtB3qG8SjVSgHdOuCYsro=
X-MC-Unique: R6MtrXxGNUOvIJCJrzZVBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef2+BMHYaTIonF1OHWt1+Gznr354YUShykNly5hgjYP+9YfMBKmOQvvDRdHltoydSZKPlBtskNhVNR1zNxURW8DtSDImtviQ7c7TYLlhRY0wP+aYeI7m/YguN5kMJSHWtEa+5zoPDhKKgrfEhdUqi7t39Ys71aTSpRw/w7Etr6cN2zSzNim0ULp+WFD2WI3/Vjr+1xDD6nWoCn5+2ql5hHtaVXd28LLmGiZDWiqzv1wXBA/XJizUHl2VkxGGkmcCczPoV/qw7bezVbzYHCTxETu8yUWLMifsmU1ip6aIEjPL4SrNcAlBXuBEbbE2+4TFL3a1H3PcZuwmdbWWtGWd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dELefG2bSYXeyZV9CN/nMhdgDni/uZK8NPZC86J7h1c=;
 b=Lo8nD2mh/zho30wG1xMZ90+i1u38DGBZWM/zLl0j5EZbd0UqjTG9G1o7q17L4wk1MYZ0Or23lMzbnQEKqDABW4jLw43rCzV1WN5zleGj0R25oB3v2GjShm3SjP34CcWlS0rPDyc9zlLg6DGBycybPxDZqp36RixB2UjAECRtns3A7Y8+LNsM5uxfAZXwxoyYtaTDHJ8aEJ/gWN5uv/tI4sgLNbdxV0YhQ7ahIL3IM+s0oR5VOisOGijTxLKYdLbRnIepmNFaS6FyM1dgQJOplnci+v/5rG2KNsmfIe83GBUYUhDS0xWKYNx2kMNYL8DjPnydgDpagu+R71cresfNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0146fc48-096a-1c5e-406f-bd7b471fc1fa@suse.com>
Date: Wed, 1 Jun 2022 09:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 02/15] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <67fd1ed1-4a62-c014-51c0-f547e33fb427@suse.com>
 <YpY71HuPOP59Do+Y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpY71HuPOP59Do+Y@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 186d9cfa-edc6-459e-3c8d-08da43a08e41
X-MS-TrafficTypeDiagnostic: AM6PR04MB4743:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4743A0E56DA01DC3D38DB083B3DF9@AM6PR04MB4743.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZFOk20wCJ/WJud+VoqUex+2CcyAscDxoO6o1oy2boYJ1l7yEFB/b+dbDjFxcmKfMi4bT+xii5Ayjxc9xOf2vEjpJcxRIbox6wPBtyP68qucHMWb7aduIS5bj/08fBuFscKp0JSsFSzPcwatVwC2yHAxM7wSUJdYpKcitsEnf05QohZOUvdUb1jJpp25Eb5a+yWogdcyw+Ea9+L+ANwXX0QrDsS7WTKA3iOucVCT4kOD1ockS5aNNqjYVBRZf51kpZTS8Sv0x+UQxZYtgSwvErNEsQX1gdh6no6mJ0z2aK+EHPLiw1foyCBDrXw/T5ZQsINEBNu65dGhAdom0ZKZaOx6geVec2czdvBigWW3uM63tDv9Gl648Kg5lv8iTWN8PRJ5weQR5HSwbl7vpbfyRhIIpGUpbORcv4PjVJUhDAXg76cZIzRSnDgXpmbEgpuJs7HskYOPzGHJOyIfaoU2OZCykO77hOFnt7uwHRTtxNJO1LengbP5GKAivVXhzAM0bQBmC0oBvSY3YDDcFtwUJhEhwQ2KflH6PldetWQtdVj6g77PjQdvasM1CLi/8XKJFnYZLknj4swcGajrwCpSBaarTBHjsXFn/zeBMlz/eeSfX+lb+EEY/YuTAr7Hbp72f0pZ72Q92I+OttIVaYzYyHRP9dz0eW0FSfora7Ir+IrD1Gy7by17PTEAxT6jPZnES4CnPdiVC6TpoO5nW0kqsVLUEx45AP10FID6dwGq8LRjC+I4I9kS+A1pzvmOj91dq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(36756003)(6512007)(53546011)(508600001)(6486002)(26005)(316002)(2906002)(31686004)(38100700002)(4326008)(66946007)(54906003)(8676002)(66476007)(6916009)(31696002)(86362001)(83380400001)(5660300002)(8936002)(2616005)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgOVFiFKQ8QA+UqqrS40uHS+w6SF0y3WBlCts+N1ITiyVsvVv77zok4gOgZj?=
 =?us-ascii?Q?jXgeTKcVSa+r0KE5bJeK0OUwTtecf49Yqbb+25ymDwhR+17I65MXAtJzEnwd?=
 =?us-ascii?Q?psbhRS3B8Ha9RHaiVtEZESAJboa3FEIAjk9ZQ/4rzcEg+tQIh+nV59bOFbVj?=
 =?us-ascii?Q?129jK4lQrPWHl8S57yck/EqXIlAKPvNIVV8LLANj/IVVfHpXr+0Snzm8DcMA?=
 =?us-ascii?Q?Pela0y0hViElNSSktoSX5wBKxyWJrVZmovdGBXf8AwALAgOZcKwybFyTK4Di?=
 =?us-ascii?Q?9krhoyXtxJQlPS2vPD+EicBIzkNw6G1IK4wFsBGaW/lrsRyan5bLv3hHRMbG?=
 =?us-ascii?Q?0yweDDKCZVPSWdNDX3jkE0Wgjl/85PUhoouk1aQpXH7F/gT6L21q1BxHzdew?=
 =?us-ascii?Q?NOvbYApQeJuMRzZl+DzZlfvd5Nzg7R8VAMKf1WyVzAGK9aRvtFRBvMVX4dhx?=
 =?us-ascii?Q?HTAok7RD5J4sOsLfnGn2UGXoNT5A7ebsr7DodIjU1tPbNFDiNiv0+q9Fx3cb?=
 =?us-ascii?Q?lVnXkWm06S4N5cpzZl3S3PjiiW+r/Zr5yScx5Wo2P+a9FZldh3qBqnhzKs3p?=
 =?us-ascii?Q?uFtI6NjvvBxStJT6yLV7mdzHX1KyU79jHKJ0k6R+6Qp5iwAJBY+FNsrwSCey?=
 =?us-ascii?Q?A3Gsnv47LnHo8ACv8dD5/Wz6Nn+VSka4Y6+DDvQGdGoX5Ho7JsmhIk7MV4Fw?=
 =?us-ascii?Q?KA1FuJZvEefdZ36vBkLXf3mQX8CoJkGOk6RsPuyKYPz0ccwqfIbyCJgQEZeY?=
 =?us-ascii?Q?H9EhHIVjOmD9zLQjLLa9y84mf6uZ+jVKDuX0/64+M2MArvmFU+1migt1sSCi?=
 =?us-ascii?Q?LREMGPdPW7JJWi75okZyFlgT1cG+5dFQJ34Lh8VYVDGAMcXebRemkQx7cWFy?=
 =?us-ascii?Q?EVrqn+iyCto47Qsvk1kv2p3/Bp8m69PjurQ5UaaOyQEqo1HKfcPQpMc/sGF1?=
 =?us-ascii?Q?BdSVeVHYQ1AqP6kXA1lGhXTuk3FA/NWzeJDDPlOVesUEGMuhGHN5Kx1PqY6t?=
 =?us-ascii?Q?HchiAdUI8w3QJmznhtVVFEkhRPcQs6WttClJONidtVzCLixo3v9lh7h7JgbX?=
 =?us-ascii?Q?fNBHeDGraw5KzDgVBWIoCmx/yQwN5rNU0jV5w3zZ42J850GqabAF77ELr2gx?=
 =?us-ascii?Q?E17Yi1JFyd9JBKT9QG7Mjjxb/47nuSjFRgdnU4yENLZA4q+tjZONazplNRoH?=
 =?us-ascii?Q?zlsW8rQroncaLqoajdxPPK8Oa5KnghFTj8w3uAegyEtMPdEZacWUREzlSihs?=
 =?us-ascii?Q?hL5L02/wFA7cPfmRFGdh7oG6fJebJ9jWJyVue5ms4zSDAM41/l6qTuy2iZHG?=
 =?us-ascii?Q?WMwY+u8hDgZH3sEXOcWwBhKssAF+bsqm9YN41vWnDecHCmvVAOSEyOCC8Ql8?=
 =?us-ascii?Q?M4Oi9wcIK1dBMmGCHRPynJHBMBajJu3HhJiFSAFmHIg7nkDY2xszB8ax9inS?=
 =?us-ascii?Q?zuCsDxJ41lNN4cE7kngo2ymfXMH2MYjC3e80oFZAQr+INtkQGUnnjnn8ebIO?=
 =?us-ascii?Q?YKjRMXCriJ/UBAGlkYASjAI4SKDop4eV+yrF8uNRv6O9LUO7O6AUGCuBKlWu?=
 =?us-ascii?Q?BOVN5jUh+ZpNMkP3MJf7cNYm88lcEFR749lCgb5d/biKa7Bww/qe69FzNxR0?=
 =?us-ascii?Q?DxxXCnhZ1/RvmoH/qSjnpgkfWXAz+ggzGgyJq5Oz6lE1P62QuKPJN8yRIkXE?=
 =?us-ascii?Q?fzT62z5umuGj28bjwIQEs6LVBpMO9LXLk+UIkeE644v7jMRqKJjcCLTQzMSy?=
 =?us-ascii?Q?XsMpTTzghQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186d9cfa-edc6-459e-3c8d-08da43a08e41
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 07:30:08.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NUJfaRTwuV19Blv9hzdfrFqCDae0JOIx1sOWFHljyEa09yv32Vjo0sKte+tm3QYKvgBANDha46bpsl8RcD60w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4743

On 31.05.2022 18:01, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:12:48PM +0200, Jan Beulich wrote:
>> For large page mappings to be easily usable (i.e. in particular without
>> un-shattering of smaller page mappings) and for mapping operations to
>> then also be more efficient, pass batches of Dom0 memory to iommu_map().
>> In dom0_construct_pv() and its helpers (covering strict mode) this
>> additionally requires establishing the type of those pages (albeit with
>> zero type references).
>>
>> The earlier establishing of PGT_writable_page | PGT_validated requires
>> the existing places where this gets done (through get_page_and_type())
>> to be updated: For pages which actually have a mapping, the type
>> refcount needs to be 1.
>>
>> There is actually a related bug that gets fixed here as a side effect:
>> Typically the last L1 table would get marked as such only after
>> get_page_and_type(..., PGT_writable_page). While this is fine as far as
>> refcounting goes, the page did remain mapped in the IOMMU in this case
>> (when "iommu=3Ddom0-strict").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> Subsequently p2m_add_identity_entry() may want to also gain an order
>> parameter, for arch_iommu_hwdom_init() to use. While this only affects
>> non-RAM regions, systems typically have 2-16Mb of reserved space
>> immediately below 4Gb, which hence could be mapped more efficiently.
>>
>> Eventually we may want to overhaul this logic to use a rangeset based
>> approach instead, punching holes into originally uniformly large-page-
>> mapped regions. Doing so right here would first and foremost be yet more
>> of a change.
>>
>> The installing of zero-ref writable types has in fact shown (observed
>> while putting together the change) that despite the intention by the
>> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
>> sufficiently ordinary pages (at the very least initrd and P2M ones as
>> well as pages that are part of the initial allocation but not part of
>> the initial mapping) still have been starting out as PGT_none, meaning
>> that they would have gained IOMMU mappings only the first time these
>> pages would get mapped writably. Consequently an open question is
>> whether iommu_memory_setup() should set the pages to PGT_writable_page
>> independent of need_iommu_pt_sync().
>=20
> Hm, I see, non strict PV dom0s won't get the pages set to
> PGT_writable_page even when accessible by devices by virtue of such
> domain having all RAM mapped in the IOMMU page-tables.
>=20
> I guess it does make sense to also have the pages set as
> PGT_writable_page by default in that case, as tthe pages _are_
> writable by the IOMMU.  Do pages added during runtime (ie: ballooned
> in) also get PGT_writable_page set?

Yes, by virtue of going through guest_physmap_add_page().

>> @@ -406,20 +406,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>>          if ( !perms )
>>              rc =3D 0;
>>          else if ( paging_mode_translate(d) )
>> +        {
>>              rc =3D p2m_add_identity_entry(d, pfn,
>>                                          perms & IOMMUF_writable ? p2m_a=
ccess_rw
>>                                                                  : p2m_a=
ccess_r,
>>                                          0);
>> +            if ( rc )
>> +                printk(XENLOG_WARNING
>> +                       "%pd: identity mapping of %lx failed: %d\n",
>> +                       d, pfn, rc);
>> +        }
>> +        else if ( pfn !=3D start + count || perms !=3D start_perms )
>> +        {
>> +        commit:
>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count, start_=
perms,
>> +                           &flush_flags);
>> +            if ( rc )
>> +                printk(XENLOG_WARNING
>> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed=
: %d\n",
>> +                       d, pfn, pfn + count, rc);
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
>> -        if ( rc )
>> -            printk(XENLOG_WARNING "%pd: identity %smapping of %lx faile=
d: %d\n",
>> -                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, r=
c);
>> =20
>> -        if (!(i & 0xfffff))
>> +        if ( !(++i & 0xfffff) )
>>              process_pending_softirqs();
>> +
>> +        if ( i =3D=3D top && count )
>=20
> Nit: do you really need to check for count !=3D 0? AFAICT this is only
> possible in the first iteration.

Yes, to avoid taking the PV path for PVH on the last iteration (count
remains zero for PVH throughout the entire loop).

Jan


