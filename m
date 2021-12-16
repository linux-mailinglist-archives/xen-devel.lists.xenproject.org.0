Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C247765B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 16:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248048.427811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsyp-00023b-6V; Thu, 16 Dec 2021 15:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248048.427811; Thu, 16 Dec 2021 15:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsyp-00021l-33; Thu, 16 Dec 2021 15:47:39 +0000
Received: by outflank-mailman (input) for mailman id 248048;
 Thu, 16 Dec 2021 15:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxsyn-00021f-BY
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 15:47:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cc955ba-5e87-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 16:47:35 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-9pX9A2f4NliRNsWn-MogDw-1; Thu, 16 Dec 2021 16:47:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 15:47:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 15:47:31 +0000
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
X-Inumbo-ID: 7cc955ba-5e87-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639669654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQGer4lm9RghDJHbY3h8ab57Mz6LF3pXAal506c8Dl0=;
	b=VKIxeknp3rJcWJ3p4YVFgGgFh2zsKZHgk84nwByu7pJS0J0LOA6ECcvbYCoiVNP6eruIEU
	WUGdqyxiCPWYXYSFK8PSgoxdtaNweWdf/AuHEwhoiuBVG7sL4VRkfCOIQurtrRKSDa4GTU
	IEsB/XvStx28NSIx73LFviwcdse6yLA=
X-MC-Unique: 9pX9A2f4NliRNsWn-MogDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5IEuGs7OrC++DW6XJnglDrhRYqSXCm/a9ZyaI5UQEZY/7z7gBDRH1fQKvKNkt7Mj/FMKDHRaLFRSvhrvjgOUwI8L+kIIfGU/da+UDoQQFOccDD6vQKLJXXQ+vGJvclIm6yNFv/XYWE/0WxH4Gfd4mNPywI9+NDfCaDji4fqrUN9f9qtn6zIw8hjKw/B5BzkZ3O/Z1hyoVzED5PlCWFYLBdAfNVpp4vaKecylQFtfdTnQUbaMh0OHaVmZu+byE/QpPi25OhcS4c0WggztB1svYXX6BgwHUZYGPZl8ewBBz/569NBWa+jgIbmmJ4UO6ICTjwUj+VLnHVIoStlA0QdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rpWSAOGphzfiTMMNmh0k3Xs0pyubg3Wvw+kJiaHEOc=;
 b=Pg6IOrDIwmSdO1wYqX6Dl7LT31CNi524ia/FoUVzAzKLQf4jzlBtBLdNVtHbVV96C23Cx2cyfQPLEHEyC095Vh+C/NmqwYnhEagPkfKFvI5KzJKphQeeCLPEAdI0kVtCldE7PFq0LdCy1maBmBB2PyZbxiLUUyPZZhP7gNbKtup1YAqapicvoeNZf5oQb9ji7MhiuxEFEMHTff7PkCNWifkxq2TdL8nz5ENCPOKa5ZoTbjknFOKUS3cT7mAEg2TOOSatvAgZOeyZDgvmndb0UVCgHcIbI4rZzW74cV8Ae6srn1wpMpidIR9uo4+Z+mqkk5y4gtqQ+ryf91w3cixgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
Date: Thu, 16 Dec 2021 16:47:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
 <Ybn0LaRuFpUfcmoU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ybn0LaRuFpUfcmoU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b05bf2e-eee6-4b79-eb85-08d9c0ab5f1f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608550B7494F338F3102895B3779@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0UkUXl0M0pE09R+EjDhoHH+3xHmp4vyV5FB1fqTBJSJhspRBlvYqVxbb8+y6urtarbKUWRIFbVGdoXQzVHBJEkedRgXT6HTDbo1KZbGylRzX5GCCgXucZvP5FXrhW4NzK++gvue91nEuCvKlXlsqH7sHuARE9xi7TTLPUHFPk/lCnZPEZEHtxjQa7PMeOHIwIHrdnR5gWC1ApmJSKGLohkFoKdbNTq7OM4xEfach3C8KzWl06HOr4k89ASX0mFj//V4KntTBv0hSMvsNmwBP4Efu9aBJpnZDMRGT4FZItQhGmlLIaznUluTa7geuG6rO2LOXtRm3pWJjD2BepteSMiHn528NtWsUDTWNtGtHiAzt22ivLk6xG1ryX1gmWArefNIqjTx1fd1vGR1dFFKDCNoplAdoTf8uDetAWczgRcRvnWiQN58/g8W9YDP3D7S7+EgcaLP7A/biZmS8cu7r7mxf0FyTNJM25Ac3zEL4YpqRsbv6CXpQ++hGBXCCJgdmhMe73Wx7BA8mZL6EdzrxNcKdBsoXz59lmDQV+BuLs2SlTvPavfUuF8/3ailKGMjjYU5AsTP6txeLDddBqsGenCmLoKbB2eBDptIMqUI3sRW+zVtOCaspyJxZoGhtpi6m9Y/4JNoWMnyody+0VhV9cN+DBL8hCwTDD7w1z9w43QSsEfiCaTg8RuxQO4SNAnbOh7310XV6x0ZLs8XzJ73CDyPJZWevyrl+LDUzm1NxEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(31696002)(38100700002)(186003)(36756003)(6512007)(31686004)(6486002)(2616005)(53546011)(316002)(86362001)(26005)(83380400001)(6506007)(54906003)(8936002)(66946007)(8676002)(4326008)(5660300002)(2906002)(6916009)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jVVDhnUQXme3dyDGxspjBUkxkL/BVE6X+/g0PCR5AVS/MM5mZ1PhFxlgNZoD?=
 =?us-ascii?Q?zJAqIt9H5YWfi86GrCZdIg6Qaj3rtVyn5Hg75AqJpxsp5C8bhI3iINRbd2HT?=
 =?us-ascii?Q?Zok1nwXH9RUApwNycxJzoNvvoiVJuPw7rPQKIHh++cEHYr6vyYCtqmQGjPbn?=
 =?us-ascii?Q?QUrSRrgFoLLr1hGPXFuBYo2XUA/7GZaHgnxzZ7XcXN6Hqc3qncic+tmxzVtA?=
 =?us-ascii?Q?N10CIymsAJzUToTlZfV1AXfdRRvEVnlfxhU3e3t8cscgFfPtUWHeX8fulvuc?=
 =?us-ascii?Q?rOPUUV1W9wYR9dfoVyyJLBlKzkYPd0b04WaGiqA4aWisHHB91OS2w/jZ0dR0?=
 =?us-ascii?Q?nJac5NBvwkN55tvNHSz6WbzMg7avrGdMBRDySiDX3NNoDQXgaLHyIRiD5WJ0?=
 =?us-ascii?Q?XpnI0jUU+OC18s8/FssKDBKVmU7HadchMvUXgsBC/6kX3I+GK/8IUVPAZ2+2?=
 =?us-ascii?Q?YO6Yaxwi7iQlCJM8c9bQ4dwMHdJc7bvcwo1KE6C17u+RqdhACmzChlE53QpY?=
 =?us-ascii?Q?Cfo0xWaSk/B5nBXNUmRQ+MbMz08/3AszGlrDwdpEuzG4BRuneuDhXrb2OfhP?=
 =?us-ascii?Q?TJrFotPN61hSfEDP1UW4hN+6Xl+1jUDpKjn9PRwUVixIGo07Jqj3uXT+yMso?=
 =?us-ascii?Q?6PckHLnRfUfKRR5Iy2XvhTGa/8H0ZVrdD75C9LwTeZIHVKj+O+elOPG0H1rr?=
 =?us-ascii?Q?AsUgGA3Yngg+2GoYWZjEAnEYBlTXpCBQTjGofnBzncWBW7PWVeAVOOIzUcur?=
 =?us-ascii?Q?64ZpcEzY2QfMX/1L5J6xeuJo6tjkveY39K1DL8ftDjpA02gtrwNbCoeYqLs4?=
 =?us-ascii?Q?u4TSgJlClQNbMHr019xIMB6gX/sqYc7gVm0PxEHlwaRcnyEWBo9i4OCMv2Ct?=
 =?us-ascii?Q?5OuJRt20Y91BOue0hoignhjL99a4SRajJNU9ZMFjJRLZTPsAvaFyEC/+2pso?=
 =?us-ascii?Q?cQ40mrHKDSkhqST7gp3tXHwQGZdLCLaab9UQCpH6p4GB98ErSC9MWHtuII0f?=
 =?us-ascii?Q?rjXEYLEPgPtNfS+bFMquIPixWNys1Ca2uVecoUdvVs/NAf8CbBA1ng9B+jPh?=
 =?us-ascii?Q?ao3yPv3RE+0SIoCeTmhzBIzTiocnmiEmBzHQgJnLxwEs3PZ2disoZhSymB0e?=
 =?us-ascii?Q?DI5h2xARpg0VHoFRMkbS0YtkzlFPCW53wwZ88vw5zYLWMiKK4qeRZo//zgAb?=
 =?us-ascii?Q?jD4l1x8UD3/pzODvcCY/kfzHV/V0UmsykdVM/Uj8NhDeurAIXQ3idpBUAQdf?=
 =?us-ascii?Q?v0dHcnDB5aW845hQ7mMnpVURWI/hJbjuPRiT+zjGaNMa7nIcNSHOKbiQWWdU?=
 =?us-ascii?Q?sgG7egaosWlv9KBMpNbts2EuzYv3HmSqbQewxUN7kDIbWC0okS6aO2d8Z5YD?=
 =?us-ascii?Q?cB6KB8CNNzRgJHys1BHYJ8B8oAJp6FohhBsT5KdV4awNXlknRTGAUEBc5Xdz?=
 =?us-ascii?Q?KPKWd6MM7iXHjwtMjhdsolMtb/hfHaAGrAO0OP+0L/Y4mI83lU1wA7QqwjuX?=
 =?us-ascii?Q?oDtDXCJeik7VRlTBfm5xsSM17frv3T89qubfELptBH9xIO+Xx7tPWFWXMAyf?=
 =?us-ascii?Q?6NGkmmugqRXwVuwFzSXKIZYUcUrksv33Cx0EwsDSQ2dGZ4DbKEgQKl+2/lYd?=
 =?us-ascii?Q?vMFTxU4s0rPSjj0TyyK5x3k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b05bf2e-eee6-4b79-eb85-08d9c0ab5f1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:47:31.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr635kHxZjVutMI978L1HrbFbdNU+4jNqqRbWQ9/jcb0j6xBVTW8hipmOMBmCn4/oNYEYlNI2BO05pqLEue6cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 15.12.2021 14:57, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:55:30AM +0200, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/include/asm-x86/contig-marker.h
>> @@ -0,0 +1,105 @@
>> +#ifndef __ASM_X86_CONTIG_MARKER_H
>> +#define __ASM_X86_CONTIG_MARKER_H
>> +
>> +/*
>> + * Short of having function templates in C, the function defined below =
is
>> + * intended to be used by multiple parties interested in recording the
>> + * degree of contiguity in mappings by a single page table.
>> + *
>> + * Scheme: Every entry records the order of contiguous successive entri=
es,
>> + * up to the maximum order covered by that entry (which is the number o=
f
>> + * clear low bits in its index, with entry 0 being the exception using
>> + * the base-2 logarithm of the number of entries in a single page table=
).
>> + * While a few entries need touching upon update, knowing whether the
>> + * table is fully contiguous (and can hence be replaced by a higher lev=
el
>> + * leaf entry) is then possible by simply looking at entry 0's marker.
>> + *
>> + * Prereqs:
>> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
>> + *   contiguous bits (ignored by hardware), before including this file,
>> + * - page tables to be passed here need to be initialized with correct
>> + *   markers.
>=20
> Given this requirement I think it would make sense to place the page
> table marker initialization currently placed in iommu_alloc_pgtable as
> a helper here also?

I would be nice, yes, but it would also cause problems. I specifically do
not want to make the function here "inline". Hence a source file including
it would need to be given a way to suppress its visibility to the compiler.
Which would mean #ifdef-ary I'd prefer to avoid. Yet by saying "prefer" I
mean to leave open that I could be talked into doing what you suggest.

>> + */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/lib.h>
>> +#include <xen/page-size.h>
>> +
>> +/* This is the same for all anticipated users, so doesn't need passing =
in. */
>> +#define CONTIG_LEVEL_SHIFT 9
>> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
>> +
>> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
>> +#define SET_MARKER(e, m) \
>> +    ((void)(e =3D ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
>> +
>> +enum PTE_kind {
>> +    PTE_kind_null,
>> +    PTE_kind_leaf,
>> +    PTE_kind_table,
>> +};
>> +
>> +static bool update_contig_markers(uint64_t *pt, unsigned int idx,
>=20
> Maybe pt_update_contig_markers, so it's not such a generic name.

I can do that. The header may then want to be named pt-contig-marker.h
or pt-contig-markers.h. Thoughts?

>> +                                  unsigned int level, enum PTE_kind kin=
d)
>> +{
>> +    unsigned int b, i =3D idx;
>> +    unsigned int shift =3D (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIF=
T;
>> +
>> +    ASSERT(idx < CONTIG_NR);
>> +    ASSERT(!(pt[idx] & CONTIG_MASK));
>> +
>> +    /* Step 1: Reduce markers in lower numbered entries. */
>> +    while ( i )
>> +    {
>> +        b =3D find_first_set_bit(i);
>> +        i &=3D ~(1U << b);
>> +        if ( GET_MARKER(pt[i]) > b )
>> +            SET_MARKER(pt[i], b);
>> +    }
>> +
>> +    /* An intermediate table is never contiguous with anything. */
>> +    if ( kind =3D=3D PTE_kind_table )
>> +        return false;
>> +
>> +    /*
>> +     * Present entries need in sync index and address to be a candidate
>> +     * for being contiguous: What we're after is whether ultimately the
>> +     * intermediate table can be replaced by a superpage.
>> +     */
>> +    if ( kind !=3D PTE_kind_null &&
>> +         idx !=3D ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
>=20
> Don't you just need to check that the address is aligned to at least
> idx, not that it's exactly aligned?

No, that wouldn't be sufficient. We're not after a general "is
contiguous" here, but strictly after "is this slot meeting the
requirements for the whole table eventually getting replaced by a
superpage".

>> +        return false;
>> +
>> +    /* Step 2: Check higher numbered entries for contiguity. */
>> +    for ( b =3D 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
>> +    {
>> +        i =3D idx | (1U << b);
>> +        if ( (kind =3D=3D PTE_kind_leaf
>> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) !=3D (1ULL << (b + s=
hift))
>=20
> Maybe this could be a macro, CHECK_CONTIG or some such? It's also used
> below.

Hmm, yes, this might indeed help readability. There's going to be a
lot of parameters though; not sure whether omitting all(?) parameters
for such a locally used macro would be considered acceptable.

> I would also think this would be clearer as:
>=20
> (pt[idx] & ~CONTIG_MASK) + (1ULL << (shift + b)) =3D=3D (pt[i] & ~CONTIG_=
MASK)

By using + we'd consider entries contiguous which for our purposes
shouldn't be considered so. Yes, the earlier check should already
have caught that case, but I'd like the checks to be as tight as
possible.

>> +              : pt[i] & ~CONTIG_MASK) ||
>=20
> Isn't PTE_kind_null always supposed to be empty?

Yes (albeit this could be relaxed, but then the logic here would
need to know where the "present" bit(s) is/are).

> (ie: wouldn't this check always succeed?)

No - "kind" describes pt[idx], not pt[i].

>> +             GET_MARKER(pt[i]) !=3D b )
>> +            break;
>> +    }
>> +
>> +    /* Step 3: Update markers in this and lower numbered entries. */
>> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
>> +    {
>> +        i =3D idx ^ (1U << b);
>> +        if ( (kind =3D=3D PTE_kind_leaf
>> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) !=3D (1ULL << (b + s=
hift))
>> +              : pt[i] & ~CONTIG_MASK) ||
>> +             GET_MARKER(pt[i]) !=3D b )
>> +            break;
>> +        idx &=3D ~(1U << b);
>=20
> There's an iteration where idx will be 0, and then there's no further
> point in doing the & anymore?

Yes, but doing the & anyway is cheaper than adding a conditional.

Jan


