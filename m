Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAC3BF7F9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 12:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152969.282586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1QvC-0007rs-Mh; Thu, 08 Jul 2021 10:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152969.282586; Thu, 08 Jul 2021 10:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1QvC-0007p2-JU; Thu, 08 Jul 2021 10:06:18 +0000
Received: by outflank-mailman (input) for mailman id 152969;
 Thu, 08 Jul 2021 10:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1QvB-0007ow-LU
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 10:06:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 215b3fe8-dfd4-11eb-855f-12813bfff9fa;
 Thu, 08 Jul 2021 10:06:15 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-RNIzeyVPNneu6iAiCwVSMA-2; Thu, 08 Jul 2021 12:06:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 10:06:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 10:06:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:208:d2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 10:06:11 +0000
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
X-Inumbo-ID: 215b3fe8-dfd4-11eb-855f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625738774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rVfISkU99P0r19Z3rZgAf7vFzRW94H9r+AliVenu5dM=;
	b=a0kANcrrCZl9vJIDhVorFPyO4RWRbseKpCNyHN9AG13Z+S30pdTVxGNFSJ49rmHoNXa+5H
	WmEj3x/QV0AZNYhJ3WWSwU1lAWPzbpn1MInwvldLo8PGszYK5iWw0iO//VXqTtRfWPgiMB
	gAGeVQv/hak0U7CaikRPa/z6sSu4F1I=
X-MC-Unique: RNIzeyVPNneu6iAiCwVSMA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPDF3hHqnZ9mIjJbDtot+oBL16glBOWD1xtUkYen4PenHU0+p91BNty+V9kmYYz6JrE2yzpg+NVXcrO/MYTAlaVKjbrYDcQagQKYw8zR/VJFRtO+FjdaUJdvrR4IENs+AZGRDKpFchXNh7yQPK6cr1iyL5DL/H6JgmL/3IykinVBynloDd/GIls1OKpJlY8kTfIgU8l2EKJy3lwo7kKhpjMwIPk+hbsNbQlhgDwfkrUmfV5XZ5K9MsX4tf5MfYiph4iNtHCaKgqskeVkBoW8Nax8KypWk/syg/CnpwQ3aL5AbuYULMXg/9EmvVCatD8npDPEHXKR+vuwcCIJlqB1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRYQ7yGEcA6a2SeFyLvl9aWSx4oFdocsSXHzBfXWTBw=;
 b=ZFDC1kFWerG+/XztH0+LbuEYI3kHHHOrTd1G8yr6XtIZmlUZBmcq57wQQ1EJOxcjZHIKx0vOtW5gULyfNRQ8daXirIfDyegVCZHRIlVvqAmBj2JDq26GrW853TvIKzCQ48kJXne2DqvKqwRAzmOYEzUR7vg74VJCORzMngulqRe8XtorRhaWxnbRy13EyHYhfy7pN3FbTRX64gp+u4lHy+p0yjKF0i0jTZSG/vcizQIRO9qNMlhDgaj8wGIgpUYU3/EySD18Qz6DQ/TyV5XtwxyBRErJE5pb7Yr2CdGvgrEnhyzRNa4HkOG8KAPsIG88aHuyRs2m00xkpihPDeZ48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
 <VE1PR08MB5215139E9710EE5DE8E698B1F7199@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <886da191-602d-5dc6-8a4c-777aed90fb09@suse.com>
Date: Thu, 8 Jul 2021 12:06:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <VE1PR08MB5215139E9710EE5DE8E698B1F7199@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5608c6c9-c362-4891-aa90-08d941f803a1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57434A53346D8BF28AF86225B3199@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6DADQS2ByTHugL4r2J0EO1XiKVh9ggQFyvfTqgNRz629NIqm1goGolZzTDyBu9YknQPu8qlMOpVBDe271/nvE7Fu+wDwyEN90CMBOF5bzHkBxMEf/Sm7xDy+q+EBV/oue5pS4ZcfYdnILbwT3R59ucOde2KWD0hcN2p/63GITc8BkVsECgkzEGoTbMY5tdOdRpF+CvMNMbxIq1e3cC37UkskptKhEQuI9pLsBwAxFEFSx/TJjtFtSP0scdv0nfkw7zylrNSmVbgqof8FuIWVr423VJtQ1HszpSQLSQJKyMsdCitJmVKS7XsWKtHbGL4okXZ2xQKFln3Neo0/9K2h9MorUQR1PT3U0g+JIR86Zwv+zAOFyqo6umRjLw0inFXc6zyVURJZ3MtkofkjLlHjC0eX/8V/sSDwxkojsZY7frwnrM2JCw4nwPy9T60EPyaja5s0X+olyeIi3FfX5AiAqmSBk3zb6CtJO1A380ZkGL1ijTm7xyiaMFr/56IRgyClh0oFGymcxpuSLyqZEAP5KAONTUpLXHpTK5mel4XZ77GkzJ0mo6BUhLKTTfnHVAbCwOs4crTdmFdJDFz9FXh0NhY22a4m1E/Lizv5yVWyl4LKvUrAqHEYgI98WBkFUOGHrJkl+o51/TNA8j8sogyXp08qwdk0Y1PG3P7iA1kcIbXrPIkG/y9G9kIqRElhbvwrnqRNCZnjRwDTuR8RT3x+X7Fs0sXotPe7PzJUqxbqVjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(39850400004)(376002)(6486002)(66946007)(38100700002)(4326008)(36756003)(16576012)(316002)(54906003)(2616005)(956004)(66476007)(66556008)(2906002)(8936002)(8676002)(86362001)(6916009)(5660300002)(83380400001)(26005)(186003)(53546011)(31696002)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XfQ8+aaXGXp6fKtAFTxMqovW+qtuIxfGFJuHLBcakPKz/TVKPd6pji6KcgeH?=
 =?us-ascii?Q?NTKcVRJ9qOjG8Lc63QslaSXQiMFN5KKxrsLkMZAt2R3gdWbR4f++/kaTXmNi?=
 =?us-ascii?Q?LjnzlnfMeaKyDU0ztPkD8T4QZiYSnpsNhs1SYUk7dxPw8OsnhedJMyolkTuO?=
 =?us-ascii?Q?sNvw3QrcxNqH+sYPqcGWsnIOulS/bNwGrz7xZUynd2tImQwpph4mS3MF2FU8?=
 =?us-ascii?Q?xv5uSgslNwg4KQj+PnkIlthmZpHThimf3DqNZyHLUDXaPkEZ9OBK81MCOSkz?=
 =?us-ascii?Q?9xYHLSYTH3lI1jUHq4Q8VauB4RWgYVIAWHh9osg/ofKlsQMDkJfHQPHOm+16?=
 =?us-ascii?Q?EJR8ttZwGkgTfgTLdV4ZO/HPuD8uqxaLdCWDU9siQ7JUqPWg3liGyZea2QOf?=
 =?us-ascii?Q?imTlpEU15nrlhqwaOrKMXRtm8aEba9IaOM3aQWh+uyVeO12Il2TRU8zYwh/l?=
 =?us-ascii?Q?enFtwIUTaFT4z+kW2k/Ld45BYuAvj8mMrrBgMKiAFXYqWHN/BeFqQJJ/1VEk?=
 =?us-ascii?Q?4KZuEISoBPN4xYDS64WaKE7mVS+Dqe+NUGhX98uHiCMT4VfRsWIr/53tNZfO?=
 =?us-ascii?Q?QBo/zwERJPqvHaxIM4YfK20j2pIYYQO1O7izPoI8Z4pECma+TVWWR4xjI5F/?=
 =?us-ascii?Q?E2u8xdBdmldLTf5SdRE+LD/t8YyMku7rgoX6o9IXKrhWXs4QoxnL3TmhsICw?=
 =?us-ascii?Q?LwTHEWf0gWoLK0S9qPeiV/TqCL41L6Py3pcZOYhaUWv+f6+x8gtBWsp6/LRo?=
 =?us-ascii?Q?gHrJqQ8bgAdiwrPNV8WotM8F1O9W9x1ygb/gMMcH2b+YtCiOlFU2E27jjxrf?=
 =?us-ascii?Q?8GsAqbwR9kmhb2CfXWEbV5rBDhP/rjfVTaC0y/u/lf8W0/rk1+aaPta4ROss?=
 =?us-ascii?Q?BL4cBgS/nc/qXMwwqmCDFzAQ8sc0sirhpaDXh2oQvcpSK0yo15+ODDHoZxR6?=
 =?us-ascii?Q?Xj4z1RuzbfJqsjOcMD40lduulsuA0xcCMwTlg/fIbt0AVL6bwutiolY5F4go?=
 =?us-ascii?Q?E+4dZ9nLX1EQONuDtKw4mLLd25yvzAcEEqWUw1iqF46adVEfzcmOCexeRN+v?=
 =?us-ascii?Q?3LhhgsDr4bEQyddiZ15Vpq7BjneCG//JNIX0JRUEB9nj2iqxGpweU0abDzqY?=
 =?us-ascii?Q?qUvzTCkJtByGH/Gz2M+sLP1vspf6V4Qod00s2o/4YGWuPSfsUCjJAgZkwVAN?=
 =?us-ascii?Q?PWDvf2TYTE4s7bUOuwLbPk26c9ry6gphGQoxvvh0bkakfzkbo870/+QzrZro?=
 =?us-ascii?Q?xCKRe0Rzq6MSj/h6d2byttQeoWf33GN2DfU1rQJLgG2lU/iDiLGshU2n4bFD?=
 =?us-ascii?Q?wdR23+ZdNa5nVLGiSAzfns5Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5608c6c9-c362-4891-aa90-08d941f803a1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 10:06:11.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zdy/qhOBbPEiqomJgsLZ8rsUXN6uWeasuWnYg6o1O4MOiCRlrp93j/1las89OGRzVllQgHUSjV52nlwIw9DUmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 08.07.2021 11:09, Penny Zheng wrote:
> Hi Jan
>=20
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, July 6, 2021 2:54 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
>> alloc_domstatic_pages
>>
>> On 06.07.2021 07:58, Penny Zheng wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, June 10, 2021 6:23 PM
>>>>
>>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>>>>>      return pg;
>>>>>  }
>>>>>
>>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>>> +/*
>>>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static m=
emory.
>>>>> + * It is the equivalent of alloc_heap_pages for static memory  */
>>>>> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns=
,
>>>>> +                                               mfn_t smfn,
>>>>> +                                               unsigned int
>>>>> +memflags) {
>>>>> +    bool need_tlbflush =3D false;
>>>>> +    uint32_t tlbflush_timestamp =3D 0;
>>>>> +    unsigned long i;
>>>>> +    struct page_info *pg;
>>>>> +
>>>>> +    /* For now, it only supports allocating at specified address. */
>>>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR
>>>>> +               "Invalid %lu static memory starting at
>>>>> + %"PRI_mfn"\n",
>>>>
>>>> Reading a log containing e.g. "Invalid 0 static memory starting at
>>>> ..." I don't think I would recognize that the "0" is the count of page=
s.
>>>
>>> Sure. How about "try to allocate out of range page %"PRI_mfn"\n"?
>>
>> This still doesn't convey _both_ parts of the if() that would cause the =
log
>> message to be issued.
>>
>=20
> Sorry. How about
> "
>         printk(XENLOG_ERR
>                "Either out-of-range static memory starting at %"PRI_mfn""
>                "or invalid number of pages: %ul.\n",
>                mfn_x(smfn), nr_mfns);
> "

I'm sorry - while now you convey both aspects, the message has become
too verbose. What's wrong with "Invalid static memory request: ... pages
at ...\"? But I wonder anyway if a log message is appropriate here in
the first place.

>>>>> @@ -2434,6 +2512,57 @@ struct page_info *alloc_domheap_pages(
>>>>>      return pg;
>>>>>  }
>>>>>
>>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>>> +/*
>>>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static
>>>>> +memory,
>>>>> + * then assign them to one specific domain #d.
>>>>> + * It is the equivalent of alloc_domheap_pages for static memory.
>>>>> + */
>>>>> +struct page_info *alloc_domstatic_pages(
>>>>> +        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
>>>>> +        unsigned int memflags)
>>>>> +{
>>>>> +    struct page_info *pg =3D NULL;
>>>>> +    unsigned long dma_size;
>>>>> +
>>>>> +    ASSERT(!in_irq());
>>>>> +
>>>>> +    if ( !dma_bitsize )
>>>>> +        memflags &=3D ~MEMF_no_dma;
>>>>> +    else
>>>>> +    {
>>>>> +        if ( (dma_bitsize - PAGE_SHIFT) > 0 )
>>>>> +        {
>>>>> +            dma_size =3D 1ul << (dma_bitsize - PAGE_SHIFT);
>>>>> +            /* Starting address shall meet the DMA limitation. */
>>>>> +            if ( mfn_x(smfn) < dma_size )
>>>>> +                return NULL;
>>>>
>>>> I think I did ask this on v1 already: Why the first page? Static
>>>> memory regions, unlike buddy allocator zones, can cross power-of-2
>>>> address boundaries. Hence it ought to be the last page that gets
>>>> checked for fitting address width restriction requirements.
>>>>
>>>> And then - is this necessary at all? Shouldn't "pre-defined by
>>>> configuration using physical address ranges" imply the memory
>>>> designated for a guest fits its DMA needs?
>>>>
>>>
>>> Hmmm, In my understanding, here is the DMA restriction when using buddy
>> allocator:
>>>     else if ( (dma_zone =3D bits_to_zone(dma_bitsize)) < zone_hi )
>>>         pg =3D alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags,
>>> d); dma_zone is restricting the starting buddy allocator zone, so I am
>>> thinking that here, it shall restrict the first page.
>>>
>>> imo, if let user define, it also could be missing DMA restriction?
>>
>> Did you read my earlier reply? Again: The difference is that ordinary
>> allocations (buddies) can't cross zone boundaries. Hence it is irrelevan=
t if you
>> check DMA properties on the first or last page - both will have the same
>> number of significant bits. The same is - afaict - not true for static a=
llocation
>> ranges.
>>
>=20
> True.
>=20
> Ordinary allocations (buddies) can't cross zone boundaries, So I understa=
nd that
> following the logic in "alloc_heap_pages(dma_zone + 1, zone_hi, order, me=
mflags, d);"
> pages of the smallest address shall be allocated from "dma_zone + 1", lik=
e you
> said, it is irrelevant if you check DMA properties on the first or last p=
ages, but imo, no matter
> first or last page, both shall be larger than (2^(dma_zone + 1)).
>=20
> Taking 32 as dma_bitsize, then the memory with this DMA restriction alloc=
ated by
> "alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d);" shall be a=
t least
> more than 4G.

DMA restrictions are always "needs to be no more than N bits".

> That=E2=80=99s why I keep comparing the first page of static allocation, =
that I am following the
> "more than" logic here.
>=20
> But you're right, I got a little investigation on ARM DMA limitation, sti=
ll taking dma_bitsize=3D32
> as an example, we want that the actually allocated memory is smaller than=
 4G, not more than.
> So I think the logic behind this code line
> " alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d);" is not ri=
ght for ARM, and it shall
> be changed to "alloc_heap_pages(zone_lo, dma_zone + 1, order, memflags, d=
);" as correction.

But this step is to _avoid_ the DMA-reserved part of the heap.
The caller requests address restricted memory by passing suitable
memflags. If the request doesn't require access to the DMA-
reserved part of the heap (dma_zone < zone_hi) we first try to
get memory from there. Only if that fails will we fall back and
try taking memory from the lower region. IOW the problem with
your code is more fundamental: You use dma_bitsize when really
you ought to extract the caller's requested restriction (if any)
from memflags. I would assume that dma_bitsize is orthogonal to
static memory, i.e. you don't need to try to preserve low memory.

Jan


