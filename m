Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCF53A49B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 14:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340447.565482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNCm-0002LY-Dv; Wed, 01 Jun 2022 12:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340447.565482; Wed, 01 Jun 2022 12:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNCm-0002Im-AK; Wed, 01 Jun 2022 12:12:04 +0000
Received: by outflank-mailman (input) for mailman id 340447;
 Wed, 01 Jun 2022 12:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwNCk-0002Ig-3p
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 12:12:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a1dc21f-e1a4-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 14:12:00 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-8T--mCyDN_CdcEQOHta9jA-1; Wed, 01 Jun 2022 14:11:57 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8744.eurprd04.prod.outlook.com (2603:10a6:10:2e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 12:11:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 12:11:56 +0000
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
X-Inumbo-ID: 0a1dc21f-e1a4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654085520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmNljydhbifzkJYxeJr/2ZbCc04r/6gwjTVNoNW7FrY=;
	b=CQo9IQ6jdK0+yp+UIvA6/EA7AUJuj3JJ3Q1VZ+qwBjxtcppXcAwJeSORhwlowj0Ty1S6No
	tPFNRUt/m0IV2Tizuu57nYSMyGEUYXqFWByVcJOks6z71jZG2FiI2sJ6fzmUHK9vL7M580
	m3tkL7YVJskTc2y5VMg5EMURe0M4MnE=
X-MC-Unique: 8T--mCyDN_CdcEQOHta9jA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFX1pCH6jX0qJ10d0aVY90GWa7Shts7Y45wn9E/VInhGyAPS5voFD9uzZMSIG557mo6L/VdhH+McbXxKpoNYgZ0Ig8B3IJKBt6X76MxEmoQHZ9MuHQhCDZ4bQgFhZtJnLeg7WFfP8L2rWjU9Q0SwtUwHN4QuPUEd9h0QkmfPg21LY3Tfmep2ZLDA4Mblihh+jFCAOZrrW9Nyl/MR9SFGmbl+5MuynSdKDwjQlDYGHKJwZ5g9KGT9F90hesZ5h4XMOEfphnJxSfZmhupDVM6L7UiPDCp+PM8QdEnTTsiVptdRm+1rjvfQyQ6m20F4o0I9zlmPzG2TdTXMHhpX9Tl2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aIBUsNDsDIHwEo7dBvOXRkfMWUr4TDmeOyCxfX00U0=;
 b=Jw/WozIjub1atSw4Zv6hwCufhIl211lEXezm/TVmgeBlO2epE0COnJqnY7fLFLugg2Fa74eSPP7AXEVVuQUubqCPNdAZpWkUp25zZq0Q3zpBWWD8u/CNEm7sWm0PwLwvDWmtP/RL+KR1BqY1yXkhkLxeh/JiAgNfYKoBXhMDemNAeSI+yMZKDfJ+dEq96K3mLGkC8BRZXHgSJu/it6wSPQQkCJQ/FIwsLfIihvqq7Ha/HJRdoB9R1nidjyEMLXAlMB+zck6vmlVCFQ7AOkpjVGuN72H8dBHco7WoFW1M16qaiBemkOd+6AZ0TnDpzI1A4o8OV4mO5n2hZyMS8qXFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <803e1e01-5a8e-36fa-1fe1-35bcf147c8e6@suse.com>
Date: Wed, 1 Jun 2022 14:11:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 07/15] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1fec512a-8c7b-69b5-40bf-88b42e9ecb7d@suse.com>
 <YpdNg5fgAncfSeTK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpdNg5fgAncfSeTK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0211.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac5e9ad-11a7-4bd0-786d-08da43c7eb80
X-MS-TrafficTypeDiagnostic: DU2PR04MB8744:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8744B558494CBDAFE95D668FB3DF9@DU2PR04MB8744.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lw8d2N8ae14ZEnRRTkoZH1XPOu4t235ESUu4YdP6o4DP8qMJFmCuwGsbbRnBZssiY6kpmCQqHWkeldF7QQFI8iv8kjut9JNHF45Lw6k6bA3Xm2eem87EuE8rjfIb/+K9se+3mXGLKWb/dmLSVnGUtB/Dl+KsTY3SyOnxO8NW+1BVdl7fGdt2dC14OcIOCi9FDEzq5LH0zqIy/mtyUKvuP0FvMjuyiff66XSCnK/EQXRVB/oPeSTyQUkwZ0FP3VOtZjocrvv1bxVz/G3C6WGmFjXgozrp3yUb7ioJO1F2H84vefGaUeDzp9VCAmP2ntzdZp+KPVllvGRvSkfi8pOR0J+9YpOoArveSu/2MG8Kvqy2utsLobQWwiVJqZmddZapKykGo/z0LgR5yAKSRCaS5npDplGvbrCUMP2PlQEY+jX1rpm6Z4C3R73Yon/2XYiXdmHhXB7PEu3P/WztyvYbZuzXZ4prGShLaDrqwg+hmWOU2uwozgJoNzrziO4Q3WHo5yk9Ta4Jq/K7Pf0Pp2akBZezPz64YMdGKhKednAyNwjRJlZdh336bfXCGd2509JJFzUzHacU4Aq6LF0EF7TSejiZxdTpZKYRwjiGaGK3x+XLzjXl/Ie+nwqoBiiNZQlyYyTPgphSCCuqZjQ25pmANwf2Tnsm268ozEcVtxVonomfnZ4hefrO22+h9SvgfAXXCRTj+NiRUKZIbhYVyT9In/YaBkr/+2+R/JkJyAiVCgw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(4326008)(8676002)(5660300002)(66476007)(38100700002)(8936002)(2906002)(6916009)(6512007)(26005)(6506007)(508600001)(53546011)(6666004)(54906003)(83380400001)(2616005)(316002)(186003)(31696002)(36756003)(86362001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcd3wQ5RJ2/PcELUh3ujim5i+Zxhvgq7PN9cfkt+cgey2DwyMCtoZV5lrmUc?=
 =?us-ascii?Q?Y9tMRGr8qiKhiQn3QNbDp0wkK3YK0+CEY43kWCbeSXVfCpnPZOKLMCe1T7Wf?=
 =?us-ascii?Q?DxfhsDOdOoFOqo2j+5WvTMRfY0hEq7NQOY/xnqZn3nZ0a+mizIlpwKAZ6AJ4?=
 =?us-ascii?Q?eeGQm/trSDahpKSJqq3xHOn8DaPo2gn8/gjhA98HVf3HB6OPUOyqQg+uHPVE?=
 =?us-ascii?Q?MHb2RkyjSZaOpvBAmFAX0TOPrfRPZTb59bKMtUGmLvyVg/a/0WbFeofL8PzW?=
 =?us-ascii?Q?BvWpGINN2bV2cPMiLTHz3FNuWIOmAoZC+NnaLnk0JwlrC/ZBVgdhN8ML2agP?=
 =?us-ascii?Q?vgwyWQGkNGATOrVGQIdTLe+vm9GFtTJrOafCbYw66VjGvuNSYoKYdsweByRH?=
 =?us-ascii?Q?6mjKNRhUBAO+7Z52TniiGvw6iI4FTadY7SwmYiXKg5m1X/PiZ7NyjdMPCKKp?=
 =?us-ascii?Q?ZSBaAqrnkdau+ib5iCQbCBaGCE8bOVXTOxCPrDa845IXlL2JM44mYrJ7Skua?=
 =?us-ascii?Q?nk4KWGQmsdLuOIuHUdtwz1TczHqMosqXeA/hUiDLfKCdOhgzYHo0mUO0JpGa?=
 =?us-ascii?Q?kowNe39XjN4tp8AEXfYp6Se8QHeOPecnIihPa0frGjalE98SktarDKwytPp3?=
 =?us-ascii?Q?XLpEssWENvsgXntJZjv2fEGIryAebzC//28vLE1vvavyoQKBD6CCHalpvXW+?=
 =?us-ascii?Q?fHb8hKtkoYpRvLImw76W9IMeuAMo3vjC0e+YUFy2dROchWrozT4WWD+MigdE?=
 =?us-ascii?Q?15e9vxlA8i4pGRcNUJfwI/07hmYV9JlUfib7ip4GV3XhJD9+y4kz0+KdAXhd?=
 =?us-ascii?Q?fI21axEIJ89l9zA3iUR9KPU0B7CniZSmduKXSNd4JAjy6/WbjHepy7GsSsA1?=
 =?us-ascii?Q?DncKXz1NiOb9UYqsU2QQeQar2NA/Q8i8jlSkuwxR/00sn7rXsNuFUBNKxldf?=
 =?us-ascii?Q?fDJTOK55Cv7Pov/zKVLdMY7dDF5V6n+mNcige+u6DxKRjMGVfxzJDZkU+33s?=
 =?us-ascii?Q?gcVNVHUulaDq3++jtaReA1M8fxz5dWj2+zYvmTRXmNWwrCWvpFh0xamI75IQ?=
 =?us-ascii?Q?SdL8ZbiKENsGgJ7skAmjiwP1d0+dM0ZrzW5PsIDdo8/dzg2tEq5xq7ZUIxxd?=
 =?us-ascii?Q?1y/pG6SnLbGwdFh4bG4ejKHL7RkOXcvmpkVlkek7ryEFucEJYDWb1AC2iVkS?=
 =?us-ascii?Q?CNCLW1IUtkL6uUtfLRQHAYh8vHqitQhf/fkh5qvI6sj/WCViWdMBi0m4Uy8H?=
 =?us-ascii?Q?W95xbemXaeIfWxwRmKtrAZfR92sLD4wvymK/sbdgWCzpabZ36KazlZ/CR8/s?=
 =?us-ascii?Q?lczdWy0GUzjNsdls9Kgy95d67nww45fTgVqMDwMBG0empJN7lz/l6KHoJ6xh?=
 =?us-ascii?Q?3T/ldJd570QjYyyeAJ5x8pDS7q2DHffYDgkljWzk37QwkKuNxsTqUgz9FUeD?=
 =?us-ascii?Q?Exxp616mkwMnTqXPKE3whLjtZfShy7WOTRh6Zb8XRAS/wAJ7WCikpHk3dEYm?=
 =?us-ascii?Q?51kqGE20ozvOceLCfDG5jUKRwqVJ+pOyQ5uHaGfskJS6YM2m4Xe2wfeEgd05?=
 =?us-ascii?Q?dAyesQWo9s9wVESBTgfcTl7o88gCth1Wb+ysVyeCw8DJ1mpAyJRi9tW+goBF?=
 =?us-ascii?Q?nzTIEeTKR7+eRVqQCOIN2FFTdLUSoyFQ+gcHsW8wsDOGPCMTPFRQowtDd727?=
 =?us-ascii?Q?3N5ATRooDDQXymGdfgzf8F6eqwUbEyPbT04TNlQJDgxh+nqZtHAryPOGvpSS?=
 =?us-ascii?Q?+ouTcKDUfg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac5e9ad-11a7-4bd0-786d-08da43c7eb80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:11:56.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrO8SvKlxl+/bUiTBp059SU5DSzgC34VYc8ta0c9mU9TZqAsIlND0Xgh8PDrs+9O1feC4Jsx5wwcQ4NWET7/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8744

On 01.06.2022 13:29, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:17:08PM +0200, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
>> @@ -0,0 +1,110 @@
>> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
>> +#define __ASM_X86_PT_CONTIG_MARKERS_H
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
>> + *   contiguous bits (ignored by hardware), before including this file =
(or
>> + *   else only CONTIG_LEVEL_SHIFT and CONTIG_NR will become available),
>> + * - page tables to be passed to the helper need to be initialized with
>> + *   correct markers,
>> + * - not-present entries need to be entirely clear except for the marke=
r.
>> + */
>> +
>> +/* This is the same for all anticipated users, so doesn't need passing =
in. */
>> +#define CONTIG_LEVEL_SHIFT 9
>> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
>> +
>> +#ifdef CONTIG_MASK
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/lib.h>
>> +#include <xen/page-size.h>
>> +
>> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
>> +#define SET_MARKER(e, m) \
>> +    ((void)((e) =3D ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
>> +
>> +#define IS_CONTIG(kind, pt, i, idx, shift, b) \
>> +    ((kind) =3D=3D PTE_kind_leaf \
>> +     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) =3D=3D (1ULL << ((b) + (s=
hift))) \
>> +     : !((pt)[i] & ~CONTIG_MASK))
>> +
>> +enum PTE_kind {
>> +    PTE_kind_null,
>> +    PTE_kind_leaf,
>> +    PTE_kind_table,
>> +};
>> +
>> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
>> +                                     unsigned int level, enum PTE_kind =
kind)
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
>> +        if ( GET_MARKER(pt[i]) <=3D b )
>> +            break;
>> +        SET_MARKER(pt[i], b);
>> +    }
>> +
>> +    /* An intermediate table is never contiguous with anything. */
>> +    if ( kind =3D=3D PTE_kind_table )
>> +        return false;
>> +
>> +    /*
>> +     * Present entries need in-sync index and address to be a candidate
>> +     * for being contiguous: What we're after is whether ultimately the
>> +     * intermediate table can be replaced by a superpage.
>> +     */
>> +    if ( kind !=3D PTE_kind_null &&
>> +         idx !=3D ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
>> +        return false;
>> +
>> +    /* Step 2: Check higher numbered entries for contiguity. */
>> +    for ( b =3D 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
>> +    {
>> +        i =3D idx | (1U << b);
>> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]=
) !=3D b )
>> +            break;
>> +    }
>> +
>> +    /* Step 3: Update markers in this and lower numbered entries. */
>> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
>> +    {
>> +        i =3D idx ^ (1U << b);
>> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]=
) !=3D b )
>> +            break;
>> +        idx &=3D ~(1U << b);
>> +    }
>> +
>> +    return b =3D=3D CONTIG_LEVEL_SHIFT;
>> +}
>> +
>> +#undef IS_CONTIG
>> +#undef SET_MARKER
>> +#undef GET_MARKER
>> +#undef CONTIG_MASK
>=20
> Is it fine to undef CONTIG_MASK here, when it was defined outside of
> this file?  It does seem weird to me.

I consider it not just fine, but desirable. Use sites of this header #defin=
e
this just for the purpose of this header. And I want to leave name space as
uncluttered as possible. Should there really arise a need to keep this, we
can always consider removing the #undef (just like I did for
CONTIG_LEVEL_SHIFT and CONTIG_NR because of feedback of yours on another
patch).

Jan


