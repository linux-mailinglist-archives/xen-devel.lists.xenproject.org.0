Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603752EA8A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333819.557727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0XV-0003Q7-Cw; Fri, 20 May 2022 11:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333819.557727; Fri, 20 May 2022 11:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0XV-0003Nk-9z; Fri, 20 May 2022 11:11:25 +0000
Received: by outflank-mailman (input) for mailman id 333819;
 Fri, 20 May 2022 11:11:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns0XU-0003Ne-KD
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:11:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95474714-d82d-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 13:11:23 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-UJpTS28OMGaW36TVJFZ2sQ-1; Fri, 20 May 2022 13:11:20 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6164.eurprd04.prod.outlook.com (2603:10a6:208:13b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 11:11:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:11:18 +0000
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
X-Inumbo-ID: 95474714-d82d-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653045083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hhz/s9zEFt0Ndc7C3JnhAb0ewS7J+DJwnjc9vVXmIf0=;
	b=QkqLerxdKWP6EDuORDbRTudpKqfDcnmK7u1F58s/PBBy3/4+Hd4Heaxq0PEJxoDQAAjcP7
	CMyS0uV5uQi7eEpkn5jMFEkkCR1SWf7NTU488omVLTtO7N0ViMhNYeCOAXJc7eMYrKBZI3
	wroQjlBwWkxOqYpA5IGIunPP+R34kpk=
X-MC-Unique: UJpTS28OMGaW36TVJFZ2sQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZUsHvv1VOBOXqAxcRP428vzAU6QlKmpvP11wFO08aETzwNHNbm9IRgcIJMEGIOSa4xPae9TXXmacXj12QM3n0cLqfkDy1UwHhr4cctiw7fgyx8LABNNTzODJQlM6uyyJ5T9eyw01KU6ae5CJy1m5MsoJ7ANvDamoKhN7SBkj4fHLvN8eWxmzyElOiQCTqxScAl/zRSQLEvfkEgZp55cfzUULA8+n0F2GoA7XVUSWf6b+PjdCHdqt22QnuCVRLFwbGZgKaOniwqa2LELB98p9Ed8Cvz3R4nuX2Bk7Sl5LcoMFTLAZgU250iPFWBKkeXfIKzu84EXBIkuoha3iTkarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz5rzOLMUT3rMOjAQV0OuVPbZxrRl3+om8PP8fPbGys=;
 b=YGWV04HXPCTjtaLz2ix83ABix5DKtmvCyMzzu1EerXrnhEFOD8SInZqpjVv/EYaQ+jBPkHyVo3HiXbPPBRRlaoDfIgdGGXXl8nnYCdhKVLq4JELlGR7hm7cM1IHW1JAdrm0li1ZQvvv1U8Wi7PgJv0DTJUBwyqCb8qDUMFj4g7nX2QO9koXTL//9rZ+fz28rAoiXm712iRrTIOyjR9lyrMcELcDw1Iu7OWuRYX2ulitTYNHRzwtuh80w65wdfHWchQFKRs1s3+CXdvdRmCLmfpC9uZ7BV4Q0UQo4MXMFOZ22GZBjnMU6XA6ZaHvZ/Tx3Az0MZgM34nh1uuhoQoC5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
Date: Fri, 20 May 2022 13:11:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yodx21zhWtZCV2dY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e0f5869-3e77-4973-1fee-08da3a5176da
X-MS-TrafficTypeDiagnostic: AM0PR04MB6164:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB61641A9A372D60F1B42F4CF7B3D39@AM0PR04MB6164.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KdnSEdRQ3yxyZzFE9Zt3eW48/opYm6fJTwbuw84yvFii4i8eVpFewSm6RhEvUSKHesanvBkNQp93V7UCRty21UB1tuRV4f4Kg321fkeBvOzlHa+zFsBoXiirDRY2bWnXPWkrlY7YQQ5znySdFjqgc4x/NL5nlFQBeCTZ2Ug8jFDahAbfH+aw4n76iIBhDHxLUSuWq0jAmi8guG8TPG02uPOA65ha1MjSUMAurW+NSnpEMaw6Ckpr4kjO0eAh4JkyvcdWIzNzf52qdeyYDA8ESCym1fdHpSeIxwBEqrE+Yr01dF8EpIeL6AuSV/1tEI8zmFB1ATflpv27rapg9EowYexcZyfeL0HJy9KhLaQUc2bVV9flluQsD1C+mTwAXRHRO/UeXsL4XeCAfRYOmY8S3EkHfml/5WCpH3TUc3hvH9MR8eqPQ+NmaWne95H2wxCUY2gH+VK7x52c0x4LPwXmkRbYy+abg/i2yDEgMOmqTVl4f+qvi1vBhtQRHSi/BJ9BKlNOEQWUWo8vi2ExGsorvtr5izkOZDNMECOXMz9JrghURoMGfAlCkksxMWnM3KzpptPoUKehpBpF+cDvH6d53UsXJV19LPV1hhftE3c2GexRsiRD+TP3jQeWgY1dNC+tqeGKVZ+0LSFbWwotUxTQZtci+NqJ4AkXFmfiOYwAWoRnQffQ5uBc177wxEUlanxCmT+jC0XyT077gPBe22YmQwekzqovo3aY6OCHid9QP0vpaf3W3x2YhIIvV6m7gy49
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(6506007)(6486002)(26005)(31696002)(508600001)(38100700002)(2616005)(86362001)(83380400001)(186003)(36756003)(66946007)(8676002)(66556008)(316002)(54906003)(31686004)(5660300002)(6916009)(8936002)(66476007)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D6SegEZyA9+Bkpqk9EVXFOCGrMdAXkqOR2HBu3JLTUQqbKwXwgA9vSoZIc4s?=
 =?us-ascii?Q?YS5AOXPkFf+skuzdcYoP1RDkmXWy3nXqPB+0zVvZuMDIPrRpyMDaIyY8ntR5?=
 =?us-ascii?Q?8XZO14wOTnno4kw82djTosZWKioK5CeNJrIy2TZV3si1ZfznUI+PumqdnoZ+?=
 =?us-ascii?Q?pOFEgnyPesT0no/tDVZw3wIwCijd8kXdEJ+2tQgKdLHFBDEw5OdQ7xvABnRT?=
 =?us-ascii?Q?eVyXiApItth/snx2vxtYCZ5OY8Mo35OXx49BiaXepAGt0gEq0aRyQqOXZt48?=
 =?us-ascii?Q?U93mHdif4I6/UL49K6/0KGXfh7gsqoK9W3n4oBrZ9Uv+bzMn7rhh9mk8yZMr?=
 =?us-ascii?Q?nnaW+WPQ1fwJaXl9cJ1/YH+qUBKKQ9eifX/izaK/Abfyc/7xOthg+NqJCQKL?=
 =?us-ascii?Q?emWGrBXPtohAPlGuEFoCpMA+A9JEvI1yByw3qd68Llq5eEhX8AemFWZzFrM2?=
 =?us-ascii?Q?Wk2UB4zJPnx2yooGuNAeHRHF6VR+Yph+tXZSGFllEdfzwpLUD+1Zo9kt9Ga6?=
 =?us-ascii?Q?+o9EfQb+kvIFy6E3Csj77CrWhs+Q5PrQNxTzFHlkJiSyKSyYAS9cmIjWI2EA?=
 =?us-ascii?Q?L4UXzubKmeTfVHXBSzxTXO4LiGszChf5x5qHNU+VDRCqrN0GlPK0yfUJfLHL?=
 =?us-ascii?Q?cyeGHWcXHhQtWvxu0SaJ6fUYRTDa3rrrMPiYxtGRFDKLVRso8nQ9rfdW9Pkt?=
 =?us-ascii?Q?a5MRe7oXRl5wlCWXIqKOUYQKvv/9hstmEUhHMTjAv8QKAoAOVwfSm4r/cMPt?=
 =?us-ascii?Q?2AKRmSgmcQSh2Ob/kgX8REwMOPuViEhVmfm3al3Ca6WHaU/nUwCnNqdL+vkh?=
 =?us-ascii?Q?qPRq26VfIBomwkGaHtKquvMQTQbmQHcWBrVrxTrM3E/CihxZmEA5y6jNWJzj?=
 =?us-ascii?Q?X39pvtSWLDiVmvRR28+5bzBQOY7MD8WcxnD9mi5VnXTbEhdTLXBHog4h3HeR?=
 =?us-ascii?Q?tW3OQZ79pCVJ3FAu5EwYa0ZIEOeYg8ZHk3hwXN4GtYcKhL8cLchGfOoJ9l2u?=
 =?us-ascii?Q?t+pURDX9jJ7b+NiPVXQMKb1SCDlLhxotIyKl9OCZLVpmi0+loeeYQJAmf08C?=
 =?us-ascii?Q?D5u7/d2ejMU4i2s9GvmEE4jpZKug492RUTkwSdDHj5N6ONRmhUyDCjMI4xw+?=
 =?us-ascii?Q?yajW8VZNZ+Pyv+MucO+Ah7GWP92lHKnvpljDDYbaqbb6cIvGD33XVgqPmDH1?=
 =?us-ascii?Q?ePuCrfaWzRX+t0gQ1ou3Pvo/HjDJ1bi8arUIj+1X6zxqIKEBUwnWe6aGxRNE?=
 =?us-ascii?Q?5+NhIcNTB+qBiZLD67TC+0Fdg0q+4+l42/NNGb59Rg1lz4y2e/XFPy5CBGbM?=
 =?us-ascii?Q?l4C4SreHES1U1i1XSMKgI0W6rHJ6al84UcU1hBySLElLFyISyU9Izw/u128W?=
 =?us-ascii?Q?NJQnMyla0ghGaHd0eTuhsWRvAq+Etvy8HWF4otSoWHVHUMNDbBnAfx+qBqZM?=
 =?us-ascii?Q?x9oXPo06xIsP/yrWrgfc3rMllNWXKPW5jet4XuHBDvVKjXoN5j700lKzAIeN?=
 =?us-ascii?Q?v4g28e746TdLOOAoXcZHgVKFl64MoB3AdEAGK4t8udtPy1sOL4FhQxJIkfNm?=
 =?us-ascii?Q?E4VFLCwBmoSOIl4QZNSoXVqBeX13xSbFJbDZBihN3n8cZxK6QOPVKH4vxR5R?=
 =?us-ascii?Q?HNVyrK3tzX9uEELxpQJC/NcNHyHTjdgy2o4Dp4OZiZO/XGwxG1IjGG0wsajx?=
 =?us-ascii?Q?8lvURO4TkUAmlEtM3bunYiokO+GKMfoCCbeIo/90nnMhQNKTwLY3+2QHjDa1?=
 =?us-ascii?Q?q2tMmv0CSg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0f5869-3e77-4973-1fee-08da3a5176da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:11:18.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82BwVuxv2odlxBXrTqdSIAIDojohcZ7gu98XMw3DssNmVfJlThQXR3HbCtm29duoPYFtjLko8z7jN+3y7fK41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6164

On 20.05.2022 12:47, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
>> On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>>>> =20
>>>>      while ( nr_ptes-- )
>>>>      {
>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>> +        ASSERT(!pde->next_level);
>>>> +        ASSERT(!pde->u);
>>>> +
>>>> +        if ( pde > table )
>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - table));
>>>> +        else
>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>
>>> I think PAGETABLE_ORDER would be clearer here.
>>
>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhe=
re
>> in IOMMU code afaics.
>=20
> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
> IOMMU code  but not PAGETABLE_ORDER.

Hmm, yes and no. But for consistency with other IOMMU code I may want
to switch to PAGE_SHIFT_4K.

Jan


