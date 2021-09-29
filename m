Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CD41C309
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198999.352797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXDP-0005tM-0C; Wed, 29 Sep 2021 10:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198999.352797; Wed, 29 Sep 2021 10:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXDO-0005rP-TF; Wed, 29 Sep 2021 10:53:30 +0000
Received: by outflank-mailman (input) for mailman id 198999;
 Wed, 29 Sep 2021 10:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVXDN-0005rJ-Mc
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 10:53:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36040277-d798-444c-b842-3169c871b1e3;
 Wed, 29 Sep 2021 10:53:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-h_Bu1teEP0-WXqwyzVOmRg-1; Wed, 29 Sep 2021 12:53:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 10:53:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 10:53:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 10:53:24 +0000
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
X-Inumbo-ID: 36040277-d798-444c-b842-3169c871b1e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632912807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBvmVN+IpqsWcOvuRmgv053p8T677yHv+WGh+bolzo4=;
	b=DKHaBRsdm+45On1uHlPHRtwkAkRdkv7YSDxIx3CtftgXnQISHlPuM5Iuzx9BJnW09G2vSz
	mj77Kk2pJpnhDKX6riRut9TerUfw4++6aiJbTu4QV3FbdJBZSYqghigQUGMDs0vyJPNIZp
	xcGg1g7ZRr50OlJlLj1xvc7MEOkKLgc=
X-MC-Unique: h_Bu1teEP0-WXqwyzVOmRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQh+EArVp4u1VKtoH7ngVnuvRYmo31hFcR/vdfMD3YgbOjOb6xnwqRev5//CSeHggyEu2kSH23GoBX5rzAOyJreubO85C5DNq7QAWSQEv/INYW6y9UQapk6pl9Ta2ifultUy310j8z0rhYHYZ0d92+UOweS/x9klT5nn8DewjFoeQChZlCfMuub/k/GvW0D9tdch/prAVNaZiEgpIy5tWhrthLuhcw4uwsx4RnYUkj5baMwvKLzp8OyoHHI1rh+IGCrPQFP8fLQn0zp3ryJc3V1dBWU1q5Gqsb9enZu+kZjK6SCD4GRK250+XPKcLhTp+unZmfjPQMjqwJb9N35JJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EkUe7PDWn48Y6jUAL8tFmgb8Z61St5FYaV0Td7l5Dl0=;
 b=SmtBcb9HIVuIzMQaV6XEBBvsKgMh1lOe61tWcnncah/afh7IX8K/Z0vKXqQwEFzkH4hynZNxamtI7YjRSMphvSSOIwSFUig2zpau+Icggkdli8Zzsg2jia/ZMxI+A2VjWBJQJ1Alg7TNfUtuEvWVYqasBfLhDS2BKVCXuA7rXb/dXqc8kHV9yxfuWmC9cxzEqLYyHWPq7W5wg2+oXg7dezOfA2GnYf9NUmDYdX10/Vum7Q5eKDdq14eD1D0mjFAmgMCTwirUGFLWaEDTo7CaBbPUl/os2l+AC3HDb2ZD/xbsKaewXc8PbWYvnudSabzMJF4tUH5CLEFivtHn7+CzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 1/9] x86/PVH: improve Dom0 memory size calculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <562a9ee5-102e-ee25-e4cd-721e44b7409a@suse.com>
 <YUsapfsfoL+ODa6+@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d64b491-cfb1-addb-9f5b-e1447d3797da@suse.com>
Date: Wed, 29 Sep 2021 12:53:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUsapfsfoL+ODa6+@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a06b4060-393c-4839-f307-08d983375c3d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167F2270B22E548DE0650FDB3A99@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m0+EH2pyWmbTvEY6SqZVVMqJgiEB1a35GF0LwhGDBoZPeRUbpFHuYT2rNFQdSgZFAquMJNQpVyvFFuGokveCiSMPBJ00Ro6VrmLNFm1vMpQbnve4/jgNBPjpu8lPnvbkqctAgqUbNfUa0ZFfR1xiw2xToAoqvhdtoTqB3U8q5Mt3xZ8/sNxsCdPJs4SM8UEcXIqaEeXbzPJNsFwjcw9LPt5lBTUmbKZf7iyQQiAn65xYAAIQ/e7znDgWCwfPZoyp/c+i0m2D6rlGMhvGsoHHnf8SeiUUHUq540vHlhCgQDwGNz0w1wbwRQvadxlg12/cQpZITgHAOWdJVdpHuhOG5Mw/N9Q2B9bVMYpMUajc5DKsmcvA9sqtI+OZTWyaRo4uoOXr5HivG/9FUGwOMwvXpYN0iDM+okTyu+TcS0gjAzQhpuMshB0bnYuF4khg++yQlcfyoBOQfHVgsmJmqtQ5OA+MXntR4qb1TnZ9MNUujB95wV2xpu6cziIZptCIR9Tkpesw2361oC8TCUsVlGtCaYcrl+P9GCW0KSrhxdV5RLAJsqJLzRQG98ea50bv3jzijMi7Ck9SemP3VC016xbCI0geVX5HZNqJVJdjdb2Mi0WdKetSLB3Qvbkwui4li2K7OpCygKBOqsgp9Pdg0/KU/cDJj1s/51hY5KFpO/9KKXg5WyAKdTUQvqoM2Njt8CaovuhbgVInBzkORc7uE1m6mnvBqbcBAG7qJJ34yrs6cUyWu/Es98zVSDkDmvgNMYBF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(956004)(5660300002)(66476007)(54906003)(2616005)(2906002)(16576012)(6486002)(316002)(38100700002)(66556008)(6916009)(26005)(508600001)(31696002)(53546011)(186003)(8676002)(83380400001)(8936002)(36756003)(66946007)(31686004)(86362001)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lLwuMkGts4sEXVKpuESQs0beP1ERs6MhokOLEiik1ObenXxa+ZVk2sVGn2+Z?=
 =?us-ascii?Q?iPPOeVfH4mbEyfUz978mT8QYU/lenistLfqlBjo55ZTNlz3cIbo9Ly1rrtxe?=
 =?us-ascii?Q?vjGjjPn1zEHYLwPmRVdUws+LiGYfrsox6S4E0Nbmrq5p31gtAmAq+L0d87Ue?=
 =?us-ascii?Q?X9jmgKczt04dpn3koQZ9W2vAORvgk+docInaUmnZ5bkKi1GfuXxQPj5LH9LT?=
 =?us-ascii?Q?EYJvlYjo27qOp7S0d3lyTuFJu1Y0E0kUo1JnVo3fauCB63muNwe6Ctpx7W5H?=
 =?us-ascii?Q?R/eQ784/NK9cYNpMr2MOcTasBdhxUy5XhCPz8JFPQ/kToeuDUhCAIFijWOyM?=
 =?us-ascii?Q?P9Hgn5hCqpvJ8Jv9zbbaCnLwkIJVzgw0gThr6McnbZmUqsqd6wqPkmKbETHc?=
 =?us-ascii?Q?IVxEDIy+gH3Ym9EoNbZPXwOVhS3aIXlJdifgLv/dCBQoJ18TDdxu4+ARTXv4?=
 =?us-ascii?Q?OnruY0EWFIMULrFjsvd+1b55t4T1VabsWKYOngLrFn6LB+9mU6iEG/j3J3l6?=
 =?us-ascii?Q?bsJZeF/hprRlft5tktd5yfaV26LUYHLgy62Vr1TJjbIuhZrocjMBA8pg+rUN?=
 =?us-ascii?Q?YJUn+zJQe43n7vaBPM4X3jCk7EJJv/HS0AgxFYGJqBpVg0IYX/H+dZ1xgzYF?=
 =?us-ascii?Q?2VnwylRwiyahJw536eshBOPwdPdyd6vAX3nNJX06gIvIcls2I+3zqNmWMZbG?=
 =?us-ascii?Q?Hyp4PwCX6czzEFBOZyu4/9+Fl/s37Sf/8+bw6GCYsALWskIBcUy1LPNF94r6?=
 =?us-ascii?Q?JqKFv1hT0fsG5f0FcClvv9G566lYM6zE9TRDHBPMqP8mcslYIOnQ210BjldH?=
 =?us-ascii?Q?2lQYWoT58V0zThjdREae4nwWt8I40oxsWFEIAGUrIYfzS48g+TcAKaBXL4dP?=
 =?us-ascii?Q?GByDpdKmMfE85+B58y551IRqDkU7aEQnSxlQfqybqhUbgW73r9JA8/Etit5n?=
 =?us-ascii?Q?IwStOhpUDqWNPGR1pu6D4s5vNeIu++gkQiGYmrUw7Y0I6rhzBP6yqTj9OnuW?=
 =?us-ascii?Q?O/rDhZjqEgDgkzHf/Ooxr9robPFLALIzP92RzkUyolkyfy2+6g1TQ/7EbQBn?=
 =?us-ascii?Q?CmEM0nRKnoJk/wxieYG8LMuLV3CcW5COFEjPgmjhCwDNAsSjRHIDT6RX6TpI?=
 =?us-ascii?Q?Xq7e/Cg6qAAOXSpK8MfLeuG2hh4yZ9obX2cWUzNU443wUfISGuU79gKuPOm0?=
 =?us-ascii?Q?RaUBKmH4GKBQs4W5HoW4G0i5GJmbRWj47Aq7J9fiRuJ6dKdFir/zch+7L/sA?=
 =?us-ascii?Q?4rC49+b8yzVQCpAmf6Z1ywMnec8VmUzSVsMVJbbldHuUsC+svCUxfNN2nbq2?=
 =?us-ascii?Q?LwaWfbSiLf/aOhVqa6XJgOb9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06b4060-393c-4839-f307-08d983375c3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 10:53:24.5148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYZYQNifpUL/8NiZFcr8PWvvGUQPQiQP997hYtzAIUsQ5I7GdLpcFObWaGQC3RzKe5JZTZDumISv1cj8etfo/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 22.09.2021 13:59, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:16:44AM +0200, Jan Beulich wrote:
>> @@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
>>          avail -=3D d->max_vcpus - 1;
>> =20
>>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
>> -    if ( is_iommu_enabled(d) )
>> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>>      {
>>          unsigned int s;
>> =20
>>          for ( s =3D 9; s < BITS_PER_LONG; s +=3D 9 )
>> -            avail -=3D max_pdx >> s;
>> +            iommu_pages +=3D max_pdx >> s;
>> +
>> +        avail -=3D iommu_pages;
>>      }
>> =20
>> -    need_paging =3D is_hvm_domain(d) &&
>> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
>> +    need_paging =3D is_hvm_domain(d)
>> +                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
>> +                  : opt_dom0_shadow;
>>      for ( ; ; need_paging =3D false )
>>      {
>> +        unsigned long paging_pages;
>> +
>>          nr_pages =3D get_memsize(&dom0_size, avail);
>>          min_pages =3D get_memsize(&dom0_min_size, avail);
>>          max_pages =3D get_memsize(&dom0_max_size, avail);
>> @@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
>>          nr_pages =3D min(nr_pages, max_pages);
>>          nr_pages =3D min(nr_pages, avail);
>> =20
>> -        if ( !need_paging )
>> -            break;
>> +        paging_pages =3D paging_mode_enabled(d) || need_paging
>> +                       ? dom0_paging_pages(d, nr_pages) : 0;
>> =20
>>          /* Reserve memory for shadow or HAP. */
>> -        avail -=3D dom0_paging_pages(d, nr_pages);
>> +        if ( !need_paging )
>> +        {
>> +            if ( paging_pages <=3D iommu_pages )
>> +                break;
>> +
>> +            avail -=3D paging_pages - iommu_pages;
>> +        }
>> +        else
>> +            avail -=3D paging_pages;
>> +        iommu_pages =3D paging_pages;
>>      }
>=20
> I always found this loop extremely confusing to reason about. Now that
> we account for the iommu page tables using separate logic, do we
> really need a loop here?
>=20
> In fact I would suggest something like:
>=20
> unsigned long cpu_pages =3D 0;
>=20
> if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
> {
>     unsigned int s;
>=20
>     for ( s =3D 9; s < BITS_PER_LONG; s +=3D 9 )
>         iommu_pages +=3D max_pdx >> s;
> }
>=20
> [perform all the nr_pages adjustments]
>=20
> if ( paging_mode_enabled(d) ||
>      opt_dom0_shadow /* shadow paging gets enabled later for PV dom0. */ =
)
>     cpu_pages =3D dom0_paging_pages(d, nr_pages);
>=20
> if ( is_hvm_domain(d) && iommu_use_hap_pt(d) && paging_mode_hap(d) )
>     avail -=3D max(iommu_pages, cpu_pages);
> else
>     avail -=3D cpu_pages + iommu_pages;
>=20
> There will be a slight over estimation of cpu_pages, as the value
> passed in doesn't account for the iommu pages in case they are used,
> but still it's better to over estimate than to under estimate.

Overestimating cpu_pages isn't a primary concern, I agree. But we
want to get the min/max clamping reasonably close. Therefore, while
dropping the loop as you suggest I've introduced two instances of
that logic, before and after calculating cpu_pages. I'll see to
send out v4 soonish (provided the result actually works for, in
particular, the case that I needed the fix for in the first place).

Jan


