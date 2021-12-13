Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFA472D8D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 14:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246052.424409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlYU-0006rI-Rs; Mon, 13 Dec 2021 13:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246052.424409; Mon, 13 Dec 2021 13:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlYU-0006pF-Nt; Mon, 13 Dec 2021 13:39:50 +0000
Received: by outflank-mailman (input) for mailman id 246052;
 Mon, 13 Dec 2021 13:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwlYT-0006p9-Ec
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 13:39:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23678a7f-5c1a-11ec-b442-ab1a14567e0c;
 Mon, 13 Dec 2021 14:39:48 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-s4m3lFytPRGeDxfH7qGe1w-1; Mon, 13 Dec 2021 14:39:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 13:39:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 13:39:44 +0000
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
X-Inumbo-ID: 23678a7f-5c1a-11ec-b442-ab1a14567e0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639402787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGzc+VllGjUQmLpJqOMSQPA9XNGozl4JLrugOJqdT0M=;
	b=EbHfTPi3GnMnWj90sGSKwWV2pYOb1b42ukV9gy3a8Ks3tdm7LHYyp7b9ruoYhOe6XhIcMF
	zrTcLprS1ik7lrQAZfFrWrkCyTH8bYkFtQk16VbdtUTMtvDYO0D7PntbY0jMgIdz4FnER1
	Q7qlmg97cEsMmlO+2aLVRkKBlZJY53M=
X-MC-Unique: s4m3lFytPRGeDxfH7qGe1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0Ai38ihPVzbNWMJCMB5PmfSQNZCfmGkLqLh4q39OPZljFG+igGU8dtKmDOPrqJCdzPJBrd77/76VDTh5eLQpCpZFIIq0PMYPMzktowF8lkq+xNiyrLeS4/8ydLM1zlA9fXiAmxkA7642qxqz0Umncke6Ictr0FygG1zv5TYUhVyRuWLhXAQpg3Lx4OiUMG8bpZvwd3aU3vhr8ZDWcRM5sA06EgXkz7ITQ/gVYGsfdTv9ZLiVzTgwrwWttJHptNr0MdWaGWJNmpws9xvEuwPoNMKMlAOqEBIjH2d5xJrY9JzkBRgQbyM2giqdpHbODl4Y8MYIR62Bbzg2jXPz6SYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L96i7sQ6u5l7fW2KuMVWOD22iIWjEDcGtG5sQoOy31Q=;
 b=GkJWbGqA5fZ+Nmqasd0x64FdJCRQekG5tvvk3tR/k1kg0nOcXscHldkaZbvQGFqr6fdxG7okVAGgboehp1fworNZVwTWu33Hys4jYUC5hG9cm3WahYX2vp78D3/U4gCpJESHzMyjr//yUFJlGTO/ri3dyw1IFvnoGNsKQ9f4Wn89HRj33lDtp+cjDIUtt9uefUP4GNU8xfP2ntqJgqpQUv96CdDSktcrJzbrgfnNhnujhYA3eKHbvHEuP0cND++CiTcdeClR6YICvrhHwhuBKZiTWcOmthsM88IYVsBq0jPD3RXByGeinkcR3CMzqPTzq9KGfaikXkACRdIA9XDMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e8a4472-8bbb-a2b0-2fef-4ec587f69124@suse.com>
Date: Mon, 13 Dec 2021 14:39:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 13/18] VT-d: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <df4bfaa9-e708-929d-3c2c-68833dcc2d2f@suse.com>
 <Ybc0Z+EtzQx4CUen@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ybc0Z+EtzQx4CUen@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdc65628-20c7-4691-6592-08d9be3e05fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590245AC86B19D0105C47E75B3749@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jV3sSk5LizAC6fUv2IHrTLlvyfVyuNdGi1YthAj+bDl2mRX3ThBZ47PNMiggwAlPi/tmyxxdZItJjsEgesmhrFwFOiYyJIyS+R9ivwjQnjIwMnw8kzBBuSNJy5U2O73Oy5OZaFDmYKcGUTB4n59aQraSQ6fT8H0LVd8SbrMRg5/2S+EkdpEYUSdFoFV4OqARDONagj6WS09cQAT7+oRgJxg6Vex4lV3r+06xJS8rzTsa2MmhwZdRcrsImO32uAt6CKgodWpPsQg+E7DkxpUeRa4/wO+70guo7QQAhhtJf1pwW+/r3Jng4CbfXx0eB7Ejf7d/zw8K6312sq4y7KAjtst1i4/ae091BWzxhFEKlLfTqz9/xLXftZIMj0SsVvkk1fYtYDTQYNaAShPuH87sIyfVZjzvCIM0vuUWgXqPMTzlH2skJZDOoWC/1KpoZILcSeRk10kgT4dY2Q8C5ZBx8H+8QtKzhRTEAZM/e619x4rhUYLKI4s5ROy7mAx3BtsiQ4BbZ1ehuaCBI9Nw7daSgnD/GN7WgT4zt14mn9Maudkch9FZSiD6Xv7W4xnSgL0ues3pWd/PumTARiUE6yGOEUdp9Bovl925VfyV5w6N0MFoezVjOu8e0SOQvPrbNZOOdnY3KaE8BWSkMyIflwWOaJt49tqUwMal+UA578GdrOI8DIq+bOP2gWGuyuL9q9HzjUFhDhtmf5mO8aPHAG0rZs1gczUmkO+fG7s4JUd+coo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(508600001)(6506007)(6512007)(66476007)(31696002)(4326008)(53546011)(5660300002)(83380400001)(38100700002)(8676002)(26005)(6916009)(186003)(86362001)(2616005)(8936002)(6486002)(31686004)(316002)(54906003)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DYjf3dhwU34DawNaLQuTbKGwJ/0K6zh5YDnIdNENrEEVfry9V9PD5RTWdRqP?=
 =?us-ascii?Q?W1+7GzXJIm+dN0JyoCbIxhC24FDMI2/L401P3Kfi3swO53pW7KsVoPreyAWa?=
 =?us-ascii?Q?PAnLxkrk5tRh2JhUDa/MnfKvEozvE1Exz642kbhr5sePMTO1Kxlh35ZaOhjq?=
 =?us-ascii?Q?k30DMiQG0bmKwDNCgl+ZOXVq6pL4IPdgS846iMfTEdZIC+69KpaaA35eEaqI?=
 =?us-ascii?Q?pCA74PSy6tXusEM2G1IBY1gs5a/s0ZNsDKLwgbx+xvhcsOSroDFcQPwJ7+wU?=
 =?us-ascii?Q?QyKJ6dZ4IVfMvvR1hgZcnsxX3kfba5V9wYd/MKBW3xziCXg7Wdxg1Dq7GhDN?=
 =?us-ascii?Q?gYYOg2scjGG0PUD2VYUib/ortURU8D3QcoRsGGhRCLKc0/NhY5r4knn/SRvE?=
 =?us-ascii?Q?+pkwfmeVhgZ+msw8vLNsqgKNgY7IisUSqnkXq0cWtzdiC1ZhSSvlthldcmje?=
 =?us-ascii?Q?XyIgQGsxmHYmaCffe97gZcEnSfxpjk5m8Rp2VKi0ldroEd9zpIIEkmkN5hKf?=
 =?us-ascii?Q?780PUTJ1M0IWaOP+a7lkmXx09afVOs10K3hzhz0SvDhhZc8AZJDDjCVkPr//?=
 =?us-ascii?Q?snOezFlRBF8S/D/9otpG8jU9IRO0n+sm4IqsRMSoYKNpAFO+4u69M+pSxCKq?=
 =?us-ascii?Q?ApvhbQoCAcF48g9XDzYe6Xt9zBnVO+k3wrOwnypQma7eULs4sEVvO/7MrJDh?=
 =?us-ascii?Q?ILTPW09rgXHiBbmplUE+tzpb9WZe+IraRNroz5IjYklAp9xfFzeC1HJS/LzH?=
 =?us-ascii?Q?de7mXhfUt0S4r+ctcvB8wyE5TY5lDcdjeiedp2uzKWDO3KyXIlusrQVjaYu0?=
 =?us-ascii?Q?exeKtDd5+rNU83YtKfIL8JCdGjmcliFHJ4A3bbn+5rV+kDFSN55IBwSfiaLf?=
 =?us-ascii?Q?Ku+S91YA8BXj3D/1+DB1b6vCU8cOLeDK7RMvmTOXBmC2r8OaEqTtCNbnxrDZ?=
 =?us-ascii?Q?bm7zmNSiZz66XQC/YNN4900oWWPXTa5Jpi3YvGm8HxRD9FyI0G9MGw3zjdlA?=
 =?us-ascii?Q?vukHcfv61Vq2qPFaq6wKRYFavSEpREYSKMZwoeH45ZGu3jCaJI8ZJSlYZIG3?=
 =?us-ascii?Q?aCZonTKfyPXk/gtVkvNHPDlKuMMSDUU5nWVVJtNJGEt1S455JkILm5HEz8xt?=
 =?us-ascii?Q?hJRbVlA6N31GPU/SNjz+z/Y50BtmZeHiCk3RGn7LKbSIF2lWJ0olrM4W46iL?=
 =?us-ascii?Q?zMlgKFTItYEZKCGNodppCljtK1Wm1jQQ3P4aLxdS3JNKQbs3B1iKmvkutY69?=
 =?us-ascii?Q?6XZfnK8aS7ahYFRARVqNn/8DESW2XmIAnd4vEWP/dhq7g5EYpoZ/gEfDSpKq?=
 =?us-ascii?Q?NXK3RMKqxR8bWKM2AokDx49j5CsAzsBXyYMQiP8rtaTGp65pRPgHY+bq8vVE?=
 =?us-ascii?Q?3dAxpKgdrYmrrNf7hcecFY7FBZ+uumuxsCuefHZDFK/IjOKvx6Q8S/lsgPql?=
 =?us-ascii?Q?X/+UELwCkEXGT3l8t6/rRMT32jDWSMuF9KqzSaehATZcH5tifO8AskBJIicn?=
 =?us-ascii?Q?PPXehex8nTyc8V2AcnEbr3HQGXNuGeGm9278toRV3sYXnnrvqbXKYCTpRmGe?=
 =?us-ascii?Q?nUAVvBeLF6gSVePwz3rdj5indfBOIesGne7oTzBf+zI8GF92wOaJcxdD8BVf?=
 =?us-ascii?Q?flxAz7o++4RYOZhpVG7bgJw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc65628-20c7-4691-6592-08d9be3e05fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:39:44.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIhAxPCAcFqZAXDLWWSYW5ymlNVKos5w5IZYc401AXXI0HJBjeGwNIC5REIbAPoQSq6W/jOq0bKJP+sH/KSIGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 13.12.2021 12:54, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:52:47AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -743,18 +743,37 @@ static int __must_check iommu_flush_iotl
>>      return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
>>  }
>> =20
>> +static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int nex=
t_level)
>=20
> Same comment as the AMD side patch, about naming the parameter just
> level.

Sure, will change.

>> @@ -1901,13 +1926,15 @@ static int __must_check intel_iommu_map_
>>      }
>> =20
>>      page =3D (struct dma_pte *)map_vtd_domain_page(pg_maddr);
>> -    pte =3D &page[dfn_x(dfn) & LEVEL_MASK];
>> +    pte =3D &page[address_level_offset(dfn_to_daddr(dfn), level)];
>>      old =3D *pte;
>> =20
>>      dma_set_pte_addr(new, mfn_to_maddr(mfn));
>>      dma_set_pte_prot(new,
>>                       ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
>>                       ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
>> +    if ( IOMMUF_order(flags) )
>=20
> You seem to use level > 1 in other places to check for whether the
> entry is intended to be a super-page. Is there any reason to use
> IOMMUF_order here instead?

"flags" is the original source of information here, so it seemed more
natural to use it. The following hunk uses "level > 1" to better
match the similar unmap logic as well as AMD code. Maybe I should
change those to also use "flags" (or "order" in the unmap case), as
that would allow re-using the local variable in the new patches in v3
doing the re-coalescing of present superpages (right now I'm using a
second, not very nicely named variable there).

I'll have to think about this some and check whether there are other
issues if I made such a change.

>> @@ -2328,6 +2361,11 @@ static int __init vtd_setup(void)
>>                 cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
>>                 cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
>> =20
>> +        if ( !cap_sps_2mb(iommu->cap) )
>> +            large_sizes &=3D ~PAGE_SIZE_2M;
>> +        if ( !cap_sps_1gb(iommu->cap) )
>> +            large_sizes &=3D ~PAGE_SIZE_1G;
>> +
>>  #ifndef iommu_snoop
>>          if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
>>              iommu_snoop =3D false;
>> @@ -2399,6 +2437,9 @@ static int __init vtd_setup(void)
>>      if ( ret )
>>          goto error;
>> =20
>> +    ASSERT(iommu_ops.page_sizes & PAGE_SIZE_4K);
>=20
> Since you are adding the assert, it might be more complete to check no
> other page sizes are set, iommu_ops.page_sizes =3D=3D PAGE_SIZE_4K?

Ah yes, would make sense. Let me change this.

Jan


