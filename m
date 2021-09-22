Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B41414C63
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192905.343627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Ws-0006wC-T5; Wed, 22 Sep 2021 14:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192905.343627; Wed, 22 Sep 2021 14:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Ws-0006uP-PS; Wed, 22 Sep 2021 14:47:22 +0000
Received: by outflank-mailman (input) for mailman id 192905;
 Wed, 22 Sep 2021 14:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3Wr-0006uJ-5y
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:47:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcbe4ba0-1bb3-11ec-b9a5-12813bfff9fa;
 Wed, 22 Sep 2021 14:47:20 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-r1r-x2qxNl6fNemDLRQG_g-1; Wed, 22 Sep 2021 16:47:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:47:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:47:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0184.eurprd02.prod.outlook.com (2603:10a6:20b:28e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Wed, 22 Sep 2021 14:47:15 +0000
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
X-Inumbo-ID: fcbe4ba0-1bb3-11ec-b9a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632322039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bfmu3HUIKlA6vAGqrhy+xV1qYBAdmE0A2SBHOmvTyYI=;
	b=OMyLr8nn2CDQOh0PAtI7Gp5EEDbRkgU0kNtJ/4i1UrHi+fA1cTI2zf3b47nTM/T0EW5TDr
	x/wUbW7CUMv6qzvcLXQTx1w0Gp1RgCdBmfSua7QZItHKEBEcK02SByIj32otQH+8HAtEff
	x2EiSxsgb3FH94xOcfNEE6+aLAUZHEM=
X-MC-Unique: r1r-x2qxNl6fNemDLRQG_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdU5S+H02fY4dCdvfDEWO3C+FBNVGDQsikWwy3QuFcctShXzecnZrMEt5hax/KPIHso6igvWzN9jO/2AxFluIp2mp39QcYhx38AnzlycDDbRf+pwUd9zBtr0l0g5gsDS0KzA2U+1rn6vNEmFlktgzkCkC9NAf1Fr1Sg4v3evcPpHT1HuFMIZULr7bowI4HtdMbJwXFBarYRqUa/uUJG5dqL1FihqJfGx7IF/XjJnImc8AktB+A8nnseBvINewmBCcf9cBu0WaXbK0YPJJTKN98ogNhtV+UFj/7cyXFpxpIaVHYgNyq08WcETB/oT2cmbqO7BS1ywzMmZ7YWSFb9K6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TsZfJ/e/HjHx9vRm/4cDVIru8+MI9qsCuRKIHFtqCLY=;
 b=W4P8EPuI4pWz/xCVXQPY9PfFNFHFpXvuIKOgAf6sCQ7jDSs8JfDPRGXnAz8J3clRiTzV3pSqaHvynP3wmg7TctpydtuJwUz4VkFaWjefwkt5AjeKIqoiSPOdYPJqwH4hrVpM320sE7lVeonIwmcId1nmWPtTV1f+gM+aBssJgSgl+/BAyaEw4bHt0/h+8WLauXUXYyiCBdUTAWGYY1lDPjYQz7IcVdiIuSI7X/wtbEXE4h7jTZFV0ndryDkNBaD2Vzx5t9LvZ9ePdR4YXf3f/CdGAiZbNcYs70nExnIDmlkGfQEQXJz6Ha7HofIHfxCIXdn2KkcTyKN+4gJ+ECw09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
 <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
 <58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com>
 <YUm3yLOfAfqrwgmH@MacBook-Air-de-Roger.local>
 <24905.47298.105494.711706@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad798aae-0f8e-219f-59d4-7ff5fe52c984@suse.com>
Date: Wed, 22 Sep 2021 16:47:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24905.47298.105494.711706@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0184.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fd9481a-fb7e-4152-f52a-08d97dd7def9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24458AB6F199F50DE40E5111B3A29@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHxNpvNzC9tMf7DxRn/cyv20uD0a1GcIdk3m2ImOmz/t69fiMXMy4/TP4JmjhahjcnqXqslUgPi6auFEFrp9r+T+Z+vTj4t9vyUhZPOtzpi6GBW89Gm5DO7Z4IOHu8Xp6QnMPNHylBvO0w7NQJZh/vzyWlmAcKxMyrjrF/1L1mKnHRDwfRfBG0FKhiGzPQFCAWYAKt/zBEh+NFFYOI+euopmengWPvsRV0A/szhqwxcwBIEOEUJpLJdCl1nSLw8mtVHF9VwCS0A5OChbX0jcTywxS/0ob7ZeyPLZxWXEXNfer9fbkN3jcMiNBIbxfxgrv0Sl4mb1bvgzEMiIiUs7HUVplDAS7Cti5dxfjWSoWMJGJB7wJjka2hZedyFz1g5NVgf6MXDIoKVwwomUmgxTazNHN0aeT2QmnGLEkAIBlpKrKbvEQHJEW+0jzBe4uFCZbN1+CjFke/hWLalVm0g6tpzpFb7ks8ooYgPf4r5wiU9JDhrSMBWvqGghDQogmyQcTq6rM+wM+JTbWzPs3wwliFKZRTwNU9Yu1bZQGtBs5GwMHUu1UzShLV0ukXxnhSzWrlOkzB71yx1S93Cq2alm5iKZuhLybOu07DZVW5Pqft+DIWm1uB9X4oik4PhApv3UMrFzyT4SxF593e68cuf7Ympy4xhiCdiAxD6nnO/SvaVMCdzMOQ82d7XEMgyIB/aDV9Q39GbumolzHTqq7uxweoTObssQYSDJHuPr3sGD9ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(110136005)(16576012)(54906003)(186003)(316002)(31686004)(36756003)(4326008)(38100700002)(6486002)(5660300002)(66946007)(66476007)(2906002)(66556008)(26005)(31696002)(86362001)(8936002)(956004)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ze457zc2B50HIXKIZyivvJ9dgNrx8LA2JZIHd3X/Fv6g8AyRNzgPTd+hVR+?=
 =?us-ascii?Q?dNan9JzO2nDXFVa3NsKml14CC9D/S4zQS3WNn7bqUNjtNpt2jg5mVT0rq+E9?=
 =?us-ascii?Q?hQ+husQs5GN/cN88Q0YWYsO0HaIxdjKXz40MW0n7MneHtLMf6R4GA+qiqlfe?=
 =?us-ascii?Q?D5rJWkrlJ7Q2J9x3Do1lZid1moEYoERzzTpxLVWEArxRMZHwQ6cGPcVLS0tu?=
 =?us-ascii?Q?KUAq1UqQKUb+BdAKN0GlVBba0xJIyv8o9u1Wxsac7o8wASyR6mqIYfRrgn6n?=
 =?us-ascii?Q?qJCcJCoBXdo2NyctPnULGwWmB/zyEChP0R0mRZEapxwC3mViqn2MLq3uzClf?=
 =?us-ascii?Q?8HLKIM+hol+rER7RZr1CVZdJ0kh1mxK5UA9V+yywC8+uZ0+07f8077bygF1l?=
 =?us-ascii?Q?XAFCqlTddAW0pTqqqB+O+a3XI4+uE0CzLhq9gbPAb85i9UMgtfZDAFhWXuho?=
 =?us-ascii?Q?P/vIp0KOqRDEgfESkkga/KsUoavdFJFlslZ8uJnRjAyMaRuXDsOPY4SRWrqz?=
 =?us-ascii?Q?KyI5HTdPQfHP5UQoLu9o/RqAHt+xQLqoEQo53fu2f5xGdUb+p0qRmRHNfH7k?=
 =?us-ascii?Q?iJYz62ohz9lF8NNJbx7GDk4ku6tC24nRccekubFdELRO6EQfIypGw0eDD1na?=
 =?us-ascii?Q?gf1a68EWwKfvMcsimXMQxBSX/h3PXcOQW55whfDbIEk+pyZt1y2gIprgtyV/?=
 =?us-ascii?Q?JBGNgXw85YTf8t6qGuatmsRjDE9uT0ors8rvgJesMkx5FDWU3V3Qf1/RTkSc?=
 =?us-ascii?Q?YzP6DYS9S+3tEMXOUx3WD0OkmBi0coL4OEldU7JYr+vkMBQAgcze3D0Iai8U?=
 =?us-ascii?Q?HxGxFPcWAHQ2VbmVKkcYdUii488g3HxpIZPyJ32cXDau0xgtIxAVxSgD/yip?=
 =?us-ascii?Q?Km5IHMDO4g42qIG/JWKe5lvM4Vo3FVNK0KZdvZMpC2+VkJ5wlxvO8J+KySZP?=
 =?us-ascii?Q?KraagaM4BknUH6wAfCKaI1siSMzvzz88IVLZJwwY1dQbyphwGSUcwDqLOcvL?=
 =?us-ascii?Q?gM8UC05InYM3dtOH37jRNVd2MymUbJBkjgDywpR9xsTKJsD4fEt7I6428/Iv?=
 =?us-ascii?Q?LDIjtgyCU15tinqrYbkFYJyC4OR4pqjR+r+cFW554085hgO5/y3dQzjD+iFQ?=
 =?us-ascii?Q?FrahHAgDtCOA4z9OTCzQ+kkF5Lmw2IbzXZQeTEJ2MB+LJZZSH9U4tR+ZeyKu?=
 =?us-ascii?Q?oFzBj2H648BacWjAH3hEd6CvzpXb+d79MM9Njkw6zO8ekXYkcP1CtcFuoNbD?=
 =?us-ascii?Q?ZgQYPmuJlmCezpd5DGiqFtx6gENuV0mvT48SajzPznfME/WG3oA4rwPrO1kC?=
 =?us-ascii?Q?a0Yin8hqYBh7UcgoLvijIJPv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd9481a-fb7e-4152-f52a-08d97dd7def9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:47:16.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M8efMzuJNWFX2eiWLHlybqbkRs2Z8jDdClGY1HTrMW6vBwsh2jB5zlVv/xeK1JVex+KgAJA0ABDEcweBC5RWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 21.09.2021 12:49, Ian Jackson wrote:
> Roger Pau Monn=C3=A9 writes ("Re: [PATCH] common: guest_physmap_add_page(=
)'s return value needs checking"):
>> On Tue, Sep 21, 2021 at 12:28:12PM +0200, Jan Beulich wrote:
>>> On 21.09.2021 11:20, Roger Pau Monn=C3=A9 wrote:
>>>> On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
>>>>> The function may fail; it is not correct to indicate "success" in thi=
s
>>>>> case up the call stack. Mark the function must-check to prove all
>>>>> cases have been caught (and no new ones will get introduced).
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>
>>> Thanks. Albeit strictly speaking an ack here isn't enough for the chang=
e
>>> to go in, it would need to be R-b or come from a REST maintainer.
>>
>> Oh, FE:
>>
>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Acked-by: Ian Jackson <iwj@xenproject.org>

With these, any chance of getting an Arm side ack here as well?

Thanks, Jan


