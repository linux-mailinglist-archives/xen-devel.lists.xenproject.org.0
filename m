Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F493EB0C7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 08:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166651.304189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER6u-0006lw-8t; Fri, 13 Aug 2021 06:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166651.304189; Fri, 13 Aug 2021 06:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mER6u-0006jK-5Y; Fri, 13 Aug 2021 06:56:08 +0000
Received: by outflank-mailman (input) for mailman id 166651;
 Fri, 13 Aug 2021 06:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mER6s-0006jC-Nu
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 06:56:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8766e53a-fc03-11eb-a25f-12813bfff9fa;
 Fri, 13 Aug 2021 06:56:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-PWAXmOg8MZ-5GPMuxril9g-1; Fri, 13 Aug 2021 08:56:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:56:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:56:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Fri, 13 Aug 2021 06:56:01 +0000
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
X-Inumbo-ID: 8766e53a-fc03-11eb-a25f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628837765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQ8iN2HmwXT8aMDM0QQrRUm0E3KZ90ZjQ1txQyFPUtY=;
	b=dbRgbXpTmlBuK1gN28LVDJnzxhSU0R8f48/TyjVgl3gSlmHzppnp4g7Wr86ESv1F2smnR4
	uNlsZvc/TsKlwiU5r32Q8tap+SB2mWXbb76lZb6nRC1ci5Q+mhqkbVatCJB5mrSUbt63mU
	lHj9x8DzBWZuuOWIa0Xx7/niA+dIZ1k=
X-MC-Unique: PWAXmOg8MZ-5GPMuxril9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqygkNx4u5O3c1TqMjxIQS/XFxSUi/DGeas3u9jNxT4UxwDe4ogW4G0EODiIHZ0x+aCvRMktxEU0aCrhnDgsvHZULAqzxa9zVQUuhqwESGbONuqQzLjPR6Tjax0bf729+DxeYd+JK08bJr8b6PtwqWaHiG+6tASE9UrtTkLBN45UCHAElSJBYEX4kpCYKM74oUoYncHamhRVJsot9dVh614GaXAev9/pxndFhnPTCVZjVb0Q51CrFmmJnZ13Yqr6NszUvqgFond0vmplHKzM33964I2BL90NMamoGMJ+QNFJiXHZsYjhI9QMkOhL1SJcLpiuRm6Tuxl3agoMtWe/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCzRmmkQnWmJojPOPOlxiAyqEbOUIZf/WSJPKdTenkE=;
 b=JyCOpRi95onrRt90U4aMQ4nRAmf7dXy0COE4BpZ8yL6yrAOcP4BehiJKbPeUwBvdaqSB4n/YwJN5BUHlq3aqNlYKmmZQnsJnr2LUFDqMGtz4BygSbr5qp1j0xuW9wu7qSvTQLrqxd9LX+M6sSbbz50rLFx0j7DZJQ/gdi6NotD04pLtcvpRDgmlyrPUliFDXDd/sUNLJbR56bN6RjfyNUh8eV7xOHBN1G7Gm48r5YcPYv1X9BmjrQndITc5DGpM8XLtzIBnvAaRI/Gv+KUMOdDLTCvjFB/Fd6oTsXrq9mv4iyMKqMKT1DAgHYvCqM3NIHoLjsEOS22gZMRL+5OqinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <9f3f002d-6919-bcaf-1f00-aa13ec1a2ccb@suse.com>
 <DB9PR08MB6857BDA872A6271EDE37A4DE9EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <873d9cac-194e-bd4c-57bf-5789b50512e8@suse.com>
Date: Fri, 13 Aug 2021 08:56:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DB9PR08MB6857BDA872A6271EDE37A4DE9EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d49f7b-18c3-480c-887d-08d95e2769c7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864635E234F2E67F5A36358B3FA9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	06zR8EW9ZAcTzbKEtkQRZ4MzKkkcPbwd7k0I2DaPHd3bQq/Wq2I7iJDTctQ6pTz5gD+0MM5xlRkp2XY3X0AtQ0IFwWDxJHdd2rwzWvOaSLEXy9Fvrb83GbgjxyXiJPjF2qGNJm/LUlrkFvThCD5ZuNzLQYk+gwWPdQHmtU1FmAc4YBP9TvAZMwvm30J/2/VaE4udvwgp74lR9Q1ircqh2h6BIMbzxVEwpJsWl4crG59xYqhEGpLCbnmDazA4KPnFNQ+BlAArwBSbllSL7Q62wYdsE4bT4Ypr04fKp4ie1993jx6aO1D1L+61D8gNEzxIbzVMwaZtnwpPFkGTMZJFDSwu0E8QQoaQIwxFic0DXel/ZSHzfWRy9TB2ISHWJss0viHLyVmiouGYVnMOoXB4IjReGN3hb6Wp/aO2UOr+kCgbVGX2IoCrmfJCPDO97gYu3wl7x7CUqJqtf/RJAcdspXYadKkYD76FE9siN8On+/z8Y4nfsXCVYB8vRnFB/lYvxvTnW5a17O45GSbzAeo5bBEEADup0T6KRFQ8xoz1QlFUFpQiLzFLJOt/I/kCTRzTyDBz6UI9cA8h+BlmuPooBdkh5uoS83XQ8wzuWeXm90ELrQiRsMd/DLUtJ3FNSPMWMhBlVK36TvYiW4V66nuN+z5Nqpr7N1GqnUkwU+1z2X+n/TSimn4SZ52Hk2NF7JKcrhlApfsSuJ+0NgBXkFq8xpptrj9iqWphs8dIHypFhAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(4326008)(316002)(6916009)(2906002)(5660300002)(16576012)(956004)(31686004)(83380400001)(53546011)(508600001)(38100700002)(186003)(26005)(2616005)(66556008)(66946007)(66476007)(8676002)(8936002)(54906003)(36756003)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rOhiiyksjBwyAJZFo3M6NVtmwvlS17YgKhqfpNlaCIXKah6Z7l4IvJ+QnOGv?=
 =?us-ascii?Q?09twgIyqGzMnFAntwQFgkoEe/sMpEdECc9pHTut1imcvjfJhSPGzbXPQ4UPd?=
 =?us-ascii?Q?TPM64bHcmJUP0I/obD/FYZqWBxjI627MgvSq6GHufdW6G0NNG7kZQabvx75L?=
 =?us-ascii?Q?xGwiwobDO58ESa3+sGjdGWhYG8vzW6zziKwv5HbGiBKggASDWv190KRySLHJ?=
 =?us-ascii?Q?NlnZBpoYwRT9IB7vFiuow4PHoqdAClAb9Sed07wHov+IswgQy+1PMxP0cv/A?=
 =?us-ascii?Q?7FebV0D9qOpOtDgtX4CT5vilJn7RA7Ev8uUS7pYQqOZTDwMz3pIlw0LZl2YU?=
 =?us-ascii?Q?lvDpLEDmVt+kjoPVVDsP+cyHpUPxDrnUi1Hbnw/EVh12MeyPFUv+mUagFAgw?=
 =?us-ascii?Q?lXAETLk51nX1VB4ZQyzZIiSvnjSABd1yluYwEKo5op9x5xsW45UVKhDob2AL?=
 =?us-ascii?Q?BACrZF5LbX2uUUG/MLkU7/g4I0JM2Q2XbfMsBhm4w7lqRmgVPqrrEmU1xiIo?=
 =?us-ascii?Q?XrONK9DQGuBl+cxLE4YJRdwxXmwD2Mi74rWhOIDconKsCP5Blyv515mjqsVs?=
 =?us-ascii?Q?wJUgFIa+Wi30Qyisjh9KKfolsWUXcgKdWY75wW8PkYy7AmdCo9ypVZJD8ozR?=
 =?us-ascii?Q?xJVvnFcEhqxvqz19zapjcLO6P1cXHetqI1QPwuDJJVdS94p/WhocHE+Mv1A2?=
 =?us-ascii?Q?8CzoX3yDsVOrO+G4LdL43tR4iW9WSSOGm4eJyUXaarZYVQqZcVqAlIPGJPtQ?=
 =?us-ascii?Q?Kw7MZcklP+BKu6VsOaMr0ML3OxJvszX+oItde+n0FfpKBilMPP2uVro/TlRS?=
 =?us-ascii?Q?uR6Th9TO+ot9FjBf5bCaUuo2Ub7G9T80G5xlxaplGpPB2IkWOrv4KjqHswSv?=
 =?us-ascii?Q?NAiTcPD/tq/fA1PtujWcW/23QLTGEAcFFTFkDRfEa0OvAG6dN8ATqnEymmUQ?=
 =?us-ascii?Q?10IDZV36HL6Qv7EG/DxdmLEzV01/vi15OVvcw/6xJ7zxZEvJnru6mudn2JOC?=
 =?us-ascii?Q?cCG/Ynepk0DCuiFIdaxk9nb+dBFxDkw+QjxP7ZM/Mtn6zQusPt5bLOCIfnoC?=
 =?us-ascii?Q?PD58cbb/FP0dyMZbg9GiRU2X8TIeWmVjWNeJsWuvuoeNj6KdqdhcuBToQm5D?=
 =?us-ascii?Q?WbfEdwcd5YterBq52VGLwDaK1fWNZlwqDqjW8v7GfFS5WsqG1IYalpQPFl8z?=
 =?us-ascii?Q?CvTmggIl69SsCpxifZbWIrtvfh8Tf1zjsJykFXNE731ue4YSVSMFihTG5bKW?=
 =?us-ascii?Q?K75kUKLX/VdSK8lzkVssxh006bJyKoaW6atwKq7rncLD85F3AUCMH5AbSfEs?=
 =?us-ascii?Q?EjFOE5YZ/SEmu0jDeN2FEnlT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d49f7b-18c3-480c-887d-08d95e2769c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:56:02.2154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vq6x4j0SlVkfMQ9jG5sfiwB/4Cm3UdonFl1OYov8D6Ol43pHWWG5iPY+l6xPP7IWEuSii8dDrfNxuFyqpwb5tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 13.08.2021 08:54, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8811=E6=97=A5 18:54
>>
>> On 11.08.2021 12:23, Wei Chen wrote:
>>> --- a/xen/arch/arm/platform.c
>>> +++ b/xen/arch/arm/platform.c
>>> @@ -27,6 +27,7 @@ extern const struct platform_desc _splatform[],
>> _eplatform[];
>>>  /* Pointer to the current platform description */
>>>  static const struct platform_desc *platform;
>>>
>>> +extern unsigned int dma_bitsize;
>>
>> This is a no-go: Declarations need to live in a header which the produce=
r
>> and all consumers include. Else ...
>=20
> Ok, I will place it to a header.
>=20
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -227,7 +227,7 @@ static bool __read_mostly scrub_debug;
>>>   * Bit width of the DMA heap -- used to override NUMA-node-first.
>>>   * allocation strategy, which can otherwise exhaust low memory.
>>>   */
>>> -static unsigned int dma_bitsize;
>>> +unsigned int dma_bitsize;
>>
>> ... a change here (of e.g. the type) will go unnoticed by the compiler,
>> and the consumer of the variable may no longer work correctly.
>>
>=20
> Sorry, I am not very clear about this comment.

I've merely been trying to explain _why_ the declaration needs to be
in a header.

Jan


