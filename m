Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92843BC6E7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150766.278725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0exx-0004hL-8C; Tue, 06 Jul 2021 06:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150766.278725; Tue, 06 Jul 2021 06:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0exx-0004en-4E; Tue, 06 Jul 2021 06:53:57 +0000
Received: by outflank-mailman (input) for mailman id 150766;
 Tue, 06 Jul 2021 06:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0exw-0004ef-Bm
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:53:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c20acdd-f782-4d90-9a60-23b23bae9cef;
 Tue, 06 Jul 2021 06:53:55 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-UQUtt3cLO-Gu7uXAsnUAiQ-2;
 Tue, 06 Jul 2021 08:53:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 06:53:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:53:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 06:53:50 +0000
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
X-Inumbo-ID: 1c20acdd-f782-4d90-9a60-23b23bae9cef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625554434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWvi3Jq0kO9c3hJze5vhCxNEJJLQhWibh17OFiKGi00=;
	b=n7mpithINFPBQ+GxQfR6piOhpc9jifNa/rCe/S5vXardxrlRYLbb6V9USOXKu8RczeaMcT
	tmuaOz2CrlAqkGNhG6otaxRVQslPHjrTA7EGVojNc0hvaC+Ox8bBfVO2y1TDXxzZHjEt6A
	eG6/qVrjSJoMy17BvwYLEvQtP/4npwE=
X-MC-Unique: UQUtt3cLO-Gu7uXAsnUAiQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBT47U1VREo+CTUNymvzJeHtD8WTLC7XloYx8u6/5WjINYafkBpq7ghMvarsevNSy3MtXL/nLCsDfzo7rCfJ6zagS9iVZCJ1HCRmPLzI3yHOuBzWvgwtFbsc3St6Opf6VVVSE2jQvYUwdkLszsmJxeB1Nmxi/OlAYqviDZnU1hJZ4lfoJdk4f0dOg/6bL/QnRvhwFbIUdXzxMbgF2UxKNLncP/gEYHfjbRoOkMlJgyTFAH5+JX5UwoGQUE1x9XV8qkezXRvl7ULwp+xsBR4gpfErEU7ZP3h5V6PNrNVkGzwpEMCuk3TAZYfbecsrdfpdblSE318flIrwdqDesWc4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTS+7xxmaN13I6BzFeZcFWfA+d640YbKO6NKqW2txOw=;
 b=M/3CsalkJ6o6Ta+90SHDGzC2fCQmsvYfnP11z2jjVXaS+5RzLIqh4+NouwUA3zVRAmNMDVydsxqKF9uS6LbEucHTxdCKTfonQdratbcxhdYQ4Dp0KPOL8uH9AyO/BHpjS37QNflH96b6TeZDGrAtPqvr5oTSqGgNCEiresqIST8EzwV+nqc+whvGc+TiYGInHED7yG5jvwNu5nqaep2bJTn6rI6SASacxgAXlnM35ABsKdqFfwtw2oscDOd5/rASLko5QdJpbe9pteAPWIlKgmW4vJ/T6AnteShQKY2CBc/SxXs7BrI2U9hiDS2jI+gXhARwJI1Z1VlP16+JHy8NSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
Date: Tue, 6 Jul 2021 08:53:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acbe08b9-a2d0-4113-46ac-08d9404acfa4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB708731C8FD0986DBB199354DB31B9@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RPmdOSMcqsNFMX95hp02TqaCG85XaA5dqbE85meCpvRauFiyLeWAVb/PnQPPFhqZ7bvER2/PZajGYWPMhOQ76w/zXKJmaxqk6WFgI7OBxRk6NpoQtt8f9UqxBxdW17JLAVlwuFGuBizdZ2szUg3nxEZuNdQYreInz0NAAa10H/83hKLSrvLaUv+NvJ+zFosXOtxHNUSSOODAkGrVNO7mWLJk4rNJfRcMfVRDqC3y3iqbycJdTcqkNjcLfzIc9tuN8ndG0vdwNyeYuDwe2K/5MP2522A+x293o3XrQRUfwna1WuZW/W232kKLvDapjl2fkLe0KFG+h37gG4/mckpntvnkBP/qSC2W5xIatM7zc9fSi37bAmX50ar5Rt8UMKJJaCCbbydVV004iUU2LZ7Ja5WoBcudR1gWYBoiqVwNnT9JMicqWnY6ZUr3nCiyXVBS8Q7qFpQwKyvyWbYyxy5y4qA9OiMatnoHuJLt0QBay2fEiOBoIyBZeMVaUbIexFcEf/VFPSbKk/N8TNEc2zKTP4NJ3EbfuD/b9pTkoDopP9JJxdwsRL3B8PsMGL5rKZKqH/b1hCxhpgyl3bQU3H47A5S0HLqoOTSQ6dai9pGcKnd33wv5YhaAxnvVG1JShgzrd+vqFNJ7s9Cav0feWnQI7pFCIV/mDPdyxI4XbWMMRtFanOc6jJz83gqCBYCjARdJKXpJc8SCK9fZ64X67EXL5sDMr55jppMk7yJfsMpURmq2Xrv7LZbtDe/AwgDKJgM3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39860400002)(376002)(396003)(316002)(66946007)(54906003)(16576012)(956004)(53546011)(16526019)(5660300002)(66476007)(4326008)(186003)(26005)(6486002)(8676002)(83380400001)(478600001)(8936002)(6916009)(66556008)(31686004)(2906002)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iDEtzc9jbGzfZZA9p7Cbzd1/JUiy4W3BcYXOiPjaS7wlnLyI5ZNMP5WFtsXD?=
 =?us-ascii?Q?LiKNGlvO/9T9z3uirA8veGaommgK/9eKs5jw0c6BGyhDo5G9J99LBMOQQfKK?=
 =?us-ascii?Q?qn+9P1QhHS/dKQjLSG+5DQEsdRfMt33GPQWPUdq7V7ujS4Ozk3C7TeiE30ap?=
 =?us-ascii?Q?lewrtCl0kp+3112u4f4Jh7YChOb7zP7Qfv4o24twMMr+2gWw1+gtmWwd6Hy7?=
 =?us-ascii?Q?xq8TRr7BG83l9LrtBxB7StbjExN2HqbLDd3TG1V1KYHUJNqbH6x4FZGJnq++?=
 =?us-ascii?Q?8MSGSqSHcSgze/uPo/S7MvQHR9MOV8NGeRInhr6TAV0IMaxygTs5w+jWHIJl?=
 =?us-ascii?Q?R3c74zp3uaoLQhboDAUiF3suJX/w3u4kabR/LwLL0+tjRuO2IK/cDW/LtT9N?=
 =?us-ascii?Q?46zKvn62i5FV/482agV0usH9WEw8KoIiiUIuhmKIoVOnJ/DnCvoWSnzon4kO?=
 =?us-ascii?Q?dKMUoIp/4UjYyUVdQAQUqrKDKbNfkOYvjL9wNtns9jfGyFCygw9Y5jYF7iN+?=
 =?us-ascii?Q?BtL1unjzpSPZxlu1LqFMU3MTd2JOf9hoRJjaGuU8lRA2a8LdLPzIQwQlHLOq?=
 =?us-ascii?Q?ZKpGQoR1vmcDVQGqS5tExmECa4af6qJfihshdB7BmIVFAewW+kA8st/3OuBE?=
 =?us-ascii?Q?pUU4BTYnTKLQkrEYLReQIH4FrYSoaOfq7c1Grw+LlAibnXlpKiUEJfNOpUm2?=
 =?us-ascii?Q?kPYVZ0XaHGrtnQoj/hIi51oGODzlNsiMnft3N9zjVWkkUuLgy5xanddOSe15?=
 =?us-ascii?Q?9YoUY7UbTubZLomCKPbGmFe5+9Ip3bTpJVeDXgovOuTliLhHQH3OqUjZ83jf?=
 =?us-ascii?Q?y/e8VGcfYJCnfAkN0pkLD6vki1GMMW0cuJZXQzR1iJocVplx/kBWxzDkP1fU?=
 =?us-ascii?Q?7+N45GMIz3K6n2pFWe8fWhtSsjFc9jHuFoI7sFmPCQD8WJdlakdmhfv3O0pQ?=
 =?us-ascii?Q?1qn9IFxghMcIYL6nAu3AEwwLbf5kFtIL9afMeM4q1su+d0P/324Ezc6PRAIq?=
 =?us-ascii?Q?X6v153q8sSKYZBgtZoELtxvz1WVtX4jnh+lnVL+raSrpmiBhQg6TD3yk9wz/?=
 =?us-ascii?Q?USvbHfZ9hH6RJz1IuxwMdcxSRLRjgVpGzW8QWwCqQ2ULjh+cG6mnJMwpzB6v?=
 =?us-ascii?Q?CDyKRPbzMA/ldI+7P8jqcgeTSz4X2KyTndk4psXaXyTc3A3ZNNkG9RdW94oC?=
 =?us-ascii?Q?ttxc/adWG2ru4JGbCGAGzSLj7Khc6phLX2nJghuh5yM/waShBuHe7CTAEe4b?=
 =?us-ascii?Q?n3/Lhk3cRpVBtPO5v3C+9xiuXSAZ3dIzggI8UEAjarPA8IhidI9DSWlRWkoW?=
 =?us-ascii?Q?f20KP2n0fU2tJHJMQA8xAlSp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbe08b9-a2d0-4113-46ac-08d9404acfa4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:53:50.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ca0oDS7wk/H+Mep+qejzhtDY9jpRdA+aGkyhQkuvqDJXSRIG+onpa6mySjQA4HJbNnBa/GSsbUgaolIAgLTjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 06.07.2021 07:58, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 10, 2021 6:23 PM
>>
>> On 07.06.2021 04:43, Penny Zheng wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>>>      return pg;
>>>  }
>>>
>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>> +/*
>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static mem=
ory.
>>> + * It is the equivalent of alloc_heap_pages for static memory  */
>>> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>>> +                                               mfn_t smfn,
>>> +                                               unsigned int memflags)
>>> +{
>>> +    bool need_tlbflush =3D false;
>>> +    uint32_t tlbflush_timestamp =3D 0;
>>> +    unsigned long i;
>>> +    struct page_info *pg;
>>> +
>>> +    /* For now, it only supports allocating at specified address. */
>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>> +    {
>>> +        printk(XENLOG_ERR
>>> +               "Invalid %lu static memory starting at %"PRI_mfn"\n",
>>
>> Reading a log containing e.g. "Invalid 0 static memory starting at ..." =
I don't
>> think I would recognize that the "0" is the count of pages.
>=20
> Sure. How about "try to allocate out of range page %"PRI_mfn"\n"?

This still doesn't convey _both_ parts of the if() that would cause
the log message to be issued.

>>> +               nr_mfns, mfn_x(smfn));
>>> +        return NULL;
>>> +    }
>>> +    pg =3D mfn_to_page(smfn);
>>> +
>>> +    for ( i =3D 0; i < nr_mfns; i++ )
>>> +    {
>>> +        /*
>>> +         * Reference count must continuously be zero for free pages
>>> +         * of static memory(PGC_reserved).
>>> +         */
>>> +        ASSERT(pg[i].count_info & PGC_reserved);
>>
>> What logic elsewhere guarantees that this will hold? ASSERT()s are to ve=
rify
>> that assumptions are met. But I don't think you can sensibly assume the =
caller
>> knows the range is reserved (and free), or else you could get away witho=
ut any
>> allocation function.
>=20
> The caller shall only call alloc_staticmem_pages when it knows range is r=
eserved,
> like, alloc_staticmem_pages is only called in the context of alloc_domsta=
tic_pages
> for now.

If the caller knows the static ranges, this isn't really "allocation".
I.e. I then question the need for "allocating" in the first place.

>>> +        if ( (pg[i].count_info & ~PGC_reserved) !=3D PGC_state_free )
>>> +        {
>>> +            printk(XENLOG_ERR
>>> +                   "Reference count must continuously be zero for free=
 pages"
>>> +                   "pg[%lu] MFN %"PRI_mfn" c=3D%#lx t=3D%#x\n",
>>> +                   i, mfn_x(page_to_mfn(pg + i)),
>>> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
>>> +            BUG();
>>> +        }
>>
>> The same applies here at least until proper locking gets added, which I =
guess is
>> happening in the next patch when really it would need to happen right he=
re.
>>
>=20
> Ok, I will combine two commits together, and add locking here.=20
> I thought the content of this commit is a little bit too much, so maybe
> adding the proper lock shall be created as a new patch. =F0=9F=98=89
> =20
>> Furthermore I don't see why you don't fold ASSERT() and if into
>>
>>         if ( pg[i].count_info !=3D (PGC_state_free | PGC_reserved) )
>>
>> After all PGC_reserved is not similar to PGC_need_scrub, which
>> alloc_heap_pages() masks out the way you also have it here.
>>
>=20
> I understand that you prefer if condition is phrased as follows:
>  	if ( pg[i].count_info !=3D (PGC_state_free | PGC_reserved) )
> Agree that PGC_reserved shall has the same position as PGC_state_free.
> Hmmm, for why I don't fold ASSERT(), do you mean that=20
> ASSERT(pg[i].count_info =3D=3D (PGC_state_free | PGC_reserved))?

No. By converting to the suggested construct the ASSERT() disappears
by way of folding _into_ the if().

>> As to the printk() - the extra verbosity compared to the original isn't =
helpful or
>> necessary imo. The message needs to be distinguishable from the other on=
e,
>> yes, so it would better mention "static" in some way. But the prefix you=
 have is
>> too long for my taste (and lacks a separating blank anyway).
>>
>=20
> If you don't like the extra verbosity, maybe just
> " Static pg[%lu] MFN %"PRI_mfn" c=3D%#lx t=3D%#x.\n"?

Something along these lines, yes, but I wonder how difficult it is
to take the original message and insert "static" at a suitable place.
Any part you omit would again want justifying. Personally I'd go with
"pg[%u] static MFN %"PRI_mfn" c=3D%#lx o=3D%u v=3D%#lx t=3D%#x\n" unless an=
y
of the parts are provably pointless to log for static pages.

>>> @@ -2434,6 +2512,57 @@ struct page_info *alloc_domheap_pages(
>>>      return pg;
>>>  }
>>>
>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>> +/*
>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static
>>> +memory,
>>> + * then assign them to one specific domain #d.
>>> + * It is the equivalent of alloc_domheap_pages for static memory.
>>> + */
>>> +struct page_info *alloc_domstatic_pages(
>>> +        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
>>> +        unsigned int memflags)
>>> +{
>>> +    struct page_info *pg =3D NULL;
>>> +    unsigned long dma_size;
>>> +
>>> +    ASSERT(!in_irq());
>>> +
>>> +    if ( !dma_bitsize )
>>> +        memflags &=3D ~MEMF_no_dma;
>>> +    else
>>> +    {
>>> +        if ( (dma_bitsize - PAGE_SHIFT) > 0 )
>>> +        {
>>> +            dma_size =3D 1ul << (dma_bitsize - PAGE_SHIFT);
>>> +            /* Starting address shall meet the DMA limitation. */
>>> +            if ( mfn_x(smfn) < dma_size )
>>> +                return NULL;
>>
>> I think I did ask this on v1 already: Why the first page? Static memory =
regions,
>> unlike buddy allocator zones, can cross power-of-2 address boundaries. H=
ence
>> it ought to be the last page that gets checked for fitting address width
>> restriction requirements.
>>
>> And then - is this necessary at all? Shouldn't "pre-defined by configura=
tion
>> using physical address ranges" imply the memory designated for a guest f=
its its
>> DMA needs?
>>
>=20
> Hmmm, In my understanding, here is the DMA restriction when using buddy a=
llocator:
>     else if ( (dma_zone =3D bits_to_zone(dma_bitsize)) < zone_hi )
>         pg =3D alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d=
);
> dma_zone is restricting the starting buddy allocator zone, so I am thinki=
ng that here, it shall
> restrict the first page.
>=20
> imo, if let user define, it also could be missing DMA restriction?

Did you read my earlier reply? Again: The difference is that ordinary
allocations (buddies) can't cross zone boundaries. Hence it is
irrelevant if you check DMA properties on the first or last page - both
will have the same number of significant bits. The same is - afaict -
not true for static allocation ranges.

Of course, as expressed before, a question is whether DMA suitability
needs checking in the first place for static allocations: I'd view it
as mis-configuration if a domain was provided memory it can't really
use properly.

Jan


