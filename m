Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7341318E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 12:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191639.341734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSd0g-0006vB-DR; Tue, 21 Sep 2021 10:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191639.341734; Tue, 21 Sep 2021 10:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSd0g-0006sK-9U; Tue, 21 Sep 2021 10:28:22 +0000
Received: by outflank-mailman (input) for mailman id 191639;
 Tue, 21 Sep 2021 10:28:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSd0e-0006sE-3A
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:28:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2cfabea-1ac6-11ec-b8b4-12813bfff9fa;
 Tue, 21 Sep 2021 10:28:18 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-DK50HmfFMHSAcA2w15ncxA-1; Tue, 21 Sep 2021 12:28:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 10:28:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 10:28:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0081.eurprd05.prod.outlook.com (2603:10a6:208:136::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Tue, 21 Sep 2021 10:28:14 +0000
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
X-Inumbo-ID: a2cfabea-1ac6-11ec-b8b4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632220097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV3I1Zo8tNf8W3rweWKyBOe8Xc8sjLGTMlHqR1XG1YE=;
	b=TxK7cDrhDi6m+MzrrXCJw6S1/mnAo5awVOHx105AV1GxZFAM/r8sGXR5Dks7a3i01nVACv
	JkbKSjfGQIhgIaK+1f/XgFrj1u8Vy+DwIKIGkMuQ91N+g3BqGA14bQt0zkYFIL9qwtCSHS
	/2uRQAz+J2R9PnxWzY98nIii+Mo7+Zc=
X-MC-Unique: DK50HmfFMHSAcA2w15ncxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk/ly3Mo+OU9uTEiDUTHO51wtKmTYlwOJvBUCT8JSJk43kvvF7aWh5sdTUjIVePW9yLJNRQV/D0/xhHioXUmAXcFETMdH6CBuFVpgh6Qcr9NRg8LRtK/qa259XF59DA9w5ip6fK5FphEIPNEMLogKGBMaOJJqwzRT2ZVnwDjxsfe1ZkLSfRwvPKEMWeXEf/M/+72DT3B/cZ99lVklWZs9QJrShYxQdvto2RDOys8eYdUZIibPrauvvWCLj6hxxfU6i1XQpOY10IyHYzqn/oyIrXmqFpbIew1X/8XKr5r0r+pAbrrCzROw/IAGjPcpRd18WTrIq5PJEBzrenqd20l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+yRVntTgbnnOC9d18dQVZrXN5kZgOLcXWkhZgnh+hls=;
 b=WdTve8cjiMzgWC9qy4FYtY1d5DDjhhGooJg1keaIlde7vv5XvXzb2XAHRMAVJW20zrfhbKgKi2GaFO1g6MenhMxkHln8qEe4a/XUbGVTkaCuQ3ZNbkyqNFR56VOA1TkIFFRWCmDii0mw/1oJkuqkBHl1NkjGQWwNxvJXQ5m0UDFoQ/w9aHQh0X+R6CxO/i2e+t83e0f6F9/SJEcZu+M+idXstCOAeeTrbkb1jPPvj9bjcJfboHPs9NUuCulxKVonrA1KJkh/WWM9AuC9jKXRLkIZjQtQcSr4VLS5vIepCx6mVYtGBvT86fU1APRE4bX/ZuTPRyqBV0rVUBQQKh8iJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
 <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com>
Date: Tue, 21 Sep 2021 12:28:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR05CA0081.eurprd05.prod.outlook.com
 (2603:10a6:208:136::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4411a391-db27-498d-e525-08d97cea8510
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39333B3E8CA1AC40B12BF2B0B3A19@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScpmX5RcdjJmSTOVfTQTGUL7zym/zi+6yapT63Ejs1j2ykEQZ5VIxjtWlgCSN7oLV4ZTtpoySf31rCxUXqawqacbDgDFQ5rYewVkMvhXUMAXdTeGaZE7zkDWJ9f+Q5oXoWODA6bwG1twOYVpzMF8xDENRT0F96YBDCXdrTz117kysNPXE0LajwZGYbRtLLs4qoNW4LLaAzvUUY4ckMdTJgKqxl1E2K2k1mAtyJL1/pwIXMEZHniw4ytF3yWnx9aq8Sk+4lFMsfYnL28GHXQG33l+x3rWk69LA+PZTgdkTdbX4WK9E+mvv3gIeTypB4U90Otc8byzcWJgC1Wd8E1Vhtwo80AD81ohEjIbreWyj9wuPNOQErnVZQEix05ykjKLQHk2uijprTpOGbvO7ZodjVGQ8MM5F6+Ygb+S+bCrljkXoff/4qo8srsNO/G258VB3IOTkFsHCMSdh7/HmoxF3WUMOiu/zdLg81unBRWNMEX3dVDq0AYadTO+KCGStEffnXQyoPJWPMqTXstC0iNjP81qz7dXtWaKhi68QHLVvns1L27vByCW4tKNmFnpe8xOVb1ThReWHbfk893/nFUPmxts42DEO4SdAcogijJ/su1aa6nHxf0bmNEJNsCdXLL4SW7h+A5NdTPaf8y0TM9VnnQ0kIkUy5FlnF3gW5W60sxtJAEk8nfm01vli04rKI2kPYjspebgOBzTYQEH9gZP4IpYWHJdX40GR0C8qgBWzfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31696002)(316002)(6916009)(86362001)(66556008)(36756003)(66476007)(16576012)(4326008)(508600001)(8936002)(83380400001)(186003)(54906003)(31686004)(53546011)(6486002)(5660300002)(2906002)(8676002)(956004)(2616005)(38100700002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VXo1oW4/lF7lhc3l4bIwV/AhJAVK6KaY24WU/gJNllZnUo6wA1eTg3bDmK+D?=
 =?us-ascii?Q?yuv+PQWUYNOkWo/roU4MrH9Y9lYC5v9XFZu9daDziRgYjAXg9iqVpT41ApuR?=
 =?us-ascii?Q?KJmU/V5XRi4WkZ7p/eR3mP0SlDgI6IhqAnEY91EfkIl5PJxghZnoogw7psZV?=
 =?us-ascii?Q?ikb1jpPWAmk1uVZD3zVlrLxuOxNZeufq8ecA7hJ1aZU6Q9YcaBlxRbyAQ2zN?=
 =?us-ascii?Q?I6a5pOnr/aF5ZDtP1JLEe4bTv3vIgqR7pZMCoU2cfTlKFEsDiU3z+OJsiD41?=
 =?us-ascii?Q?0DJOTJAPrY1+rqWxe+iTh+HadzV6TQY/3W/lU8xmCT1AkeJjJjcO30GaW7IS?=
 =?us-ascii?Q?xjnb2J/M7+yHFV+3sS25wQKkf6ihyEENp0LM2w5VgXyI+kx50RBaOoCRzoq9?=
 =?us-ascii?Q?2/P/UsjHP+4zSEXBU4o8aSWF4rwf4fqmfZ0q5Qe6DCBi6Ul8g6JMHADICJ6p?=
 =?us-ascii?Q?EB5lcyPZU+jTJEwhcYFjWI/8s2hpWLXwPd6qmnH49DguOSx7Ag0nTMsmaNmL?=
 =?us-ascii?Q?68KnkIgAp9Zv0N1fA7GR1hSZIL916sRfvzQAuxyH1ZUD5n9uvZYePeph1rCl?=
 =?us-ascii?Q?Cosf9/hJ583OLjTCWzbcdRYlYQ8rHW4Nqy+fqWljvjYScBYCL5DR3L+oMhaf?=
 =?us-ascii?Q?tSP7acbohCia8a7ajdi3lm2AnUFczBxGW7k4s5i0matNb/KimJwbJ5zdMlEK?=
 =?us-ascii?Q?UQlqAhGsvNRwPzlGoQyGNA9XukXkFin3KToX8uONhGycKaRsIHEB85z6hdwO?=
 =?us-ascii?Q?wgV8BxrHEDj4Lazl3PRpCKX141rraUJNHd7mzpHKdqPHrnyH4D0k8UV755Fv?=
 =?us-ascii?Q?o0hKXCGKwYXV+fxGtVmNoYE9NOlJGrUfm90IL7XB8iHXpNoQ0PdNxIbFES1B?=
 =?us-ascii?Q?iZNMnnJuJu2LEyMSFznjZ55EBQ3ou09+eZtIFU+Hl2zn30OPqRHLg7aPBdO8?=
 =?us-ascii?Q?9gWtyibbVQ94sJzWCzrfiB7Vtl62zmaNoG+1d6DSZ09cEg0Sta5PR5og4mci?=
 =?us-ascii?Q?UCBfSvad2jRT3cDb/l/8OfrdnKjU2GoAgmaG5xbjo1z2cm4B5hq3Uznc9NRX?=
 =?us-ascii?Q?wQyeJZKrIfaEIQd0De2N55d/xvggTnukl/s4qkV8i7FFjeYhHTY3b+N3FAFn?=
 =?us-ascii?Q?mmtXBBRr7n/m4Tox9H0bNBWWCTVtNqEyHkqTg9bGTQKjiU2cqdyRNrXlj+Tv?=
 =?us-ascii?Q?L1BFHbYTEWRyTJthnWr6pE5bX9q8nNk1ZZe91ICBWKIw3bLg4luJdckWdPLm?=
 =?us-ascii?Q?kLTxU9q6ZngLeW4/J8SGBsvtiqab6b+5IRFTetV5vspEIUVeX/6sXynRuBv8?=
 =?us-ascii?Q?gvHaDeX4KChrUr7Ud9l6nC3K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4411a391-db27-498d-e525-08d97cea8510
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:28:14.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7pOzwy8K6pca0LQW/oekcV++yKK0IMF3ex2UJnrlpKHrZVjPJpeSLPnEYHzU5iQkHKzvzk32ZO0+GUtUbp1Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 21.09.2021 11:20, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
>> The function may fail; it is not correct to indicate "success" in this
>> case up the call stack. Mark the function must-check to prove all
>> cases have been caught (and no new ones will get introduced).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks. Albeit strictly speaking an ack here isn't enough for the change
to go in, it would need to be R-b or come from a REST maintainer.

>> ---
>> In the grant-transfer case it is not really clear to me whether we can
>> stick to setting GTF_transfer_completed in the error case. Since a guest
>> may spin-wait for the flag to become set, simply not setting the flag is
>> not an option either. I was wondering whether we may want to slightly
>> alter (extend) the ABI and allow for a GTF_transfer_committed ->
>> GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
>> at the same time as setting GTF_transfer_completed).
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -2394,7 +2394,7 @@ gnttab_transfer(
>>          {
>>              grant_entry_v1_t *sha =3D &shared_entry_v1(e->grant_table, =
gop.ref);
>> =20
>> -            guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
>> +            rc =3D guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
>>              if ( !paging_mode_translate(e) )
>>                  sha->frame =3D mfn_x(mfn);
>>          }
>> @@ -2402,7 +2402,7 @@ gnttab_transfer(
>>          {
>>              grant_entry_v2_t *sha =3D &shared_entry_v2(e->grant_table, =
gop.ref);
>> =20
>> -            guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, =
0);
>> +            rc =3D guest_physmap_add_page(e, _gfn(sha->full_page.frame)=
, mfn, 0);
>>              if ( !paging_mode_translate(e) )
>>                  sha->full_page.frame =3D mfn_x(mfn);
>=20
> Is it fine to set the frame even if updating the physmap failed?

Well - the page is now owned by that domain, so there's nothing outright
wrong with reporting its MFN. guest_physmap_add_page() failing in the
!paging_mode_translate() is also only possible under obscure conditions,
with the guest guessing about MFNs it is in the process of getting
assigned.

>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -268,7 +268,8 @@ static void populate_physmap(struct memo
>>                  mfn =3D page_to_mfn(page);
>>              }
>> =20
>> -            guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order)=
;
>> +            if ( guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_o=
rder) )
>> +                goto out;
>> =20
>>              if ( !paging_mode_translate(d) &&
>>                   /* Inform the domain of the new page's machine address=
. */
>> @@ -765,8 +766,8 @@ static long memory_exchange(XEN_GUEST_HA
>>              }
>> =20
>>              mfn =3D page_to_mfn(page);
>> -            guest_physmap_add_page(d, _gfn(gpfn), mfn,
>> -                                   exch.out.extent_order);
>> +            rc =3D guest_physmap_add_page(d, _gfn(gpfn), mfn,
>> +                                        exch.out.extent_order) ?: rc;
>>              if ( !paging_mode_translate(d) &&
>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
>=20
> Would it be worth it setting the mfn on the guest output to
> INVALID_MFN or some such if the physmap addition failed?

Like above - the page is in possession of the guest now. Once it knows
of the MFN it may be able to do something to remedy the error (at the
very least: free the page again, e.g. via decrease-reservation, where
only the MFN is needed).

Of course in both cases a prereq requirement on guest behavior would
be that they consume the output field in the first place despite the
error, which in turn requires them to prefill the field with a sentinel
allowing them to recognize whether a valid MFN was passed back.

Jan


