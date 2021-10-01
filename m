Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2E41EF64
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 16:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200665.355213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJQu-0000qi-9M; Fri, 01 Oct 2021 14:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200665.355213; Fri, 01 Oct 2021 14:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJQu-0000nm-6E; Fri, 01 Oct 2021 14:22:40 +0000
Received: by outflank-mailman (input) for mailman id 200665;
 Fri, 01 Oct 2021 14:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWJQr-0000ne-VZ
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 14:22:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b529e4a6-0ced-487d-a0a7-126aac6f371f;
 Fri, 01 Oct 2021 14:22:37 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-yxqGr9SmPmuSbDw-hyRuFQ-1; Fri, 01 Oct 2021 16:22:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 14:22:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 14:22:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0101.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 14:22:32 +0000
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
X-Inumbo-ID: b529e4a6-0ced-487d-a0a7-126aac6f371f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633098156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzzBDYgH4BIG6954eGEJMmkJty9VN39Y8naWpdE9Yek=;
	b=SNjMLWeCS0FHExvG3SVy9dPQ4yPues4ZkE+RIp9W/v+3HJBN1Xi1+aBf0wmUPcHzah3D7A
	mSnMJnjbG3GcEFWmAdMjKHkQZ5oJSkUgjk+pYyuC/wXljFEgReL/ITyzcbP2T0wHn6CTd4
	gb50kWn/sxK7IQt9G/hzQcdMDBdFeUg=
X-MC-Unique: yxqGr9SmPmuSbDw-hyRuFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBvpjqnJJHStY6I2pA1JrffE+VkYwtB1Ar7BoN+wSpeWxm7B/hkj9CFgWJeGsnhZJZ5HQGdrQ3ipCPWWFd1CHwOfvEupQ6fmjs7G+DDUt6t4LM+Bh9NeAp6SvRiUA8aB+0oqcH4dcI+cY2KeC1cQCEINp/v/sGrMb88zUhEo+n10gtKbD855vlSAAwseu0ydAdf0rxJp/Q9PzKmYy/mToXiKJDzfVOReySnanl2z2bBepn1LJbXLSYZIpp84l09U8CqTFKwMkva0lqqjTkJsXoaZJZtKc5YHW9zB0yC76UsRk0ZiTpDcw8WgZxhJUiEf9WcNgpnWZ4r/nZrPDsTCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLNmfXCum9NOo3tqNOI002MiiiM9/ogQsZzO6YqF58M=;
 b=j9kn86gy5WE2DONtlm9TNJbuEcwxUfretty0SpN36ODrzTFYbh7nacQd2AFE06zxzwVLFsoUjg9a1Rz7Wn94PuwFoAKD70xJFgYdAGNiM58GLxLrS1jWznCH73Aov8ZSaYL5cn5LmsSQjjP0wnr1PC4HRFKdTjViC3Gpkb9agIooMYoRd0ENU6q7y7bBwacBo58xZ+afdRfVgE2mxOwFXEYDFvCI4/5/kQC9mew9Rjm9iu5dziJuAn91VgXRngesJjUg+FDlLicxyP2W1ipmZRlCAWLSGK03q/982t2mihbJbNBf8KZDt+lzLyc0e4wFsfS5iIETGu5PdVAlgsMS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
 <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
 <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce8e7fda-4d74-4bce-78bd-387f9b7a395f@suse.com>
Date: Fri, 1 Oct 2021 16:22:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0101.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2c52bd-e162-4040-a20d-08d984e6e8ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150DA00CDE21C358A66F2B5B3AB9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osYEys2sxkcV/FlJwEvq45uMATh6I1GlWKoAl/LJwaFKrjC8ALX9S2QQSn9idN/fQC/1kvsbWy3icDp/+IsIFfojriqtUr1U3v14aMaYxb8e7UWuVQr0Yc2OOabwAq6x7qCg3hGCeqxF+VLMWbB+uyRGy5hRQq8Hdt+ah24z1nhXums8KYdtwl1jdA+qtTYeH6MR5H/wiIvfOIqwOI94GfPLzXgVvaCD5toxS0P/JcHs0dcMS3pvgDh5nlRJg700/0HijFATdwVPLyGNeCvB+L60t1OXfa5dkmhvJ3U8XEY6Lj0YC+obrsPphsvukBz68DrpohNblKXoJdRJXwFbWgOs4i7gcbLXu+3r4ONlq6+1KaUqkvQexI3ZFME8MkuhOojUZZmFUcFoQG7hf1KmihRdfHCslL/ntA3/GeYoQ51m0PemwNlYhIhpstOoLJep1MXvBd34Es6w9iBVm9j38KbkTVimPFW7Mxwd0k5BZPzbdFjiJ0hgy0I2lYEW6lN+Aju4t7F/YweIsHEgknnecO6+WTpIpGNtJe37TPVAFJlbIaSOY75oOo1A9S8QGMFjj04Zn04scPhzVlaUaiyx4dYhtEu5bUWInJGsto/1/ULzrkESCmdOGnQGLjhG9Pw87AwSN9w0fNpumk+IuMTOCwItmRqzivaM41AlhxhEcqyLNqYRrARKM3le5dfmjPvo7Pj93GppwJHs1pszA47GSgsDniCV4bLOvF8nRGCH0ldrSH3V8B/Wc4N9dpb9LEfM3auBGRrGTZoHbw9o+xt+Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(36756003)(956004)(66946007)(66476007)(8936002)(2616005)(66556008)(86362001)(508600001)(6486002)(6916009)(186003)(8676002)(26005)(16576012)(7416002)(53546011)(54906003)(5660300002)(2906002)(316002)(38100700002)(31686004)(4326008)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?++b2gI2gRHxhCOlOXyI0SG8BKInEW7qFjYEf5EAQ23uKFJWzLv2vTzyXtX6M?=
 =?us-ascii?Q?Cx8L5WPrJ2FnCZtYHk8w45VKtYW1TRvxleBUugyxJg7QkCF/bM4MqzPpDJCk?=
 =?us-ascii?Q?mmDjZiZPqZqnSjv7wdm6PI0tVPYvMWwXMCuRfN/xW+JOii92OTnc7YtgW4Sm?=
 =?us-ascii?Q?cCI7EAhWYy5l9YxjE7G/cMZZhu7VM89T+pa/KLHsvVyRRIsI5c52T4f+a7HN?=
 =?us-ascii?Q?fjyFhkvTxQniaRZ8iKtej2e5hXN0jG2tZWEllqsqm9Y+62NepvdLrfqjNQx9?=
 =?us-ascii?Q?n2397XEnFbPDmYOz0fP06PqdjJi+k2xZ5b5NzIlIcPS6r/PfvExaBYzlVy12?=
 =?us-ascii?Q?2Car2ijN2or5cIp2r9huES0NytruoVV9tM2dmmZLAHHwfTedNHrC4X/KZHQi?=
 =?us-ascii?Q?Pa6ixgmahA7nqhfxN94t3EbYkIVQFEWi7LXEPlD6qgOjXluxJlzz1v9obmPr?=
 =?us-ascii?Q?Djq/Nc78ua+9OS7KNHT576yUG+Ur/3MrIzWyrq85SEEhwht60aRDwsose6kK?=
 =?us-ascii?Q?xs0iCm/XvtyU20rTgQGt0wCdwBU3FphMEM+1dW+ZVt1E7+So8OvEccE/7MeX?=
 =?us-ascii?Q?B8C7LUS72b9atloMdYQfpHTC9616ZsgrEKp6/waLMk2pT1warwoansFO46Og?=
 =?us-ascii?Q?9zuuyCqrkBxZC/blrEw/GtRuHk7/egLLV/7PfA7bO3BHGSaeakgyexB60qqt?=
 =?us-ascii?Q?nfeX8v72cSxXAfykUbXWaAXN4lPuvKomJArlyrQqxoRgsqYer0tColWRQxLz?=
 =?us-ascii?Q?/w+1RGSNdcNOraqImRIIO9i1ARQoLHVQJqXKLLsT06lGSRReF5i+FlXMIQ+y?=
 =?us-ascii?Q?MVeoSQ71wplDLMwzKLkm6wd2APzZ8xhCRE51v3KLrLu4WxFHCP4gZvnAZnE2?=
 =?us-ascii?Q?wyr4j5gO8qCaEfWoQgWODrjpr+3Gbym8K+jnY12pUXz6c++VzyAkt+cS/lp3?=
 =?us-ascii?Q?gsC6/KxsWt95OdHvCTft8VVDXE2HI1VwtVzAP3ez5ftRQvvIVyfEyfMYXmIm?=
 =?us-ascii?Q?A9KZdQFQbWawddhUeAGMxAvHg6WFgS65wI85qMTRC7gd2U/1kenLU09TcpCZ?=
 =?us-ascii?Q?/HE1mVKjeamCkaSyCz0HHYx8VaX7kV3zVjEwyh350V+ygrDS5ejErIPLdoQN?=
 =?us-ascii?Q?pMUGiRkMVXB8jsVcOcYGYZ1LPmVNW5UdcMMzeNp7luwO+BsZ5+7z5IuAYRST?=
 =?us-ascii?Q?mYwbTQxF/gMu37biTcDM+eYHRn7669k05Kqy+wlqP1vHWD+a1UuiNYLJSzlK?=
 =?us-ascii?Q?q7IHTSes5S2veccLGQc6ovgT878b5R3ctEvgW2l1VJTHsGig4gFpfAfmXq5C?=
 =?us-ascii?Q?j+yixwPx/qOqEcylCzPPZM98?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c52bd-e162-4040-a20d-08d984e6e8ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:22:33.6557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZHVxdS6tt0r8v/V2YEoVedDQsRaLo6lHSmDP62Ld7SPR06algjdfm05hfYlCS+J3Nvm5IhJsSAndk1kUd39IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 01.10.2021 15:55, Luca Fancellu wrote:
>> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
>>>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>         cfg.addr =3D 0;
>>>
>>> -        dir_handle->Close(dir_handle);
>>> -
>>>         if ( gop && !base_video )
>>>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>     }
>>>
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +    /* Get the number of boot modules specified on the DT or an error =
(<0) */
>>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>>> +#endif
>>
>> So I had asked to add a stub enclosed in such an #ifdef, to avoid the
>> #ifdef here. I may be willing to let you keep things as you have them
>> now, but I'd like to understand why you've picked that different
>> approach despite the prior discussion.
>=20
> There must be a misunderstanding, your message in the v3 was:
>=20
> "Every time I see this addition I'm getting puzzled. As a result I'm
> afraid I now need to finally ask you to do something about this (and
> I'm sorry for doing so only now). There would better be no notion of
> DT in x86 code, and there would better also not be a need for
> architectures not supporting DT to each supply such a stub. Instead
> I think you want to put this stub in xen/common/efi/boot.c, inside a
> suitable #ifdef.=E2=80=9D
>=20
> So I thought you wanted me to remove the stub in x86 (since it doesn=E2=
=80=99t support DT)
> and put this call under #ifdef so it won=E2=80=99t be compiled for arch n=
ot supporting DT.

So FTAOD I'll repeat the crucial part: "I think you want to put this
stub in xen/common/efi/boot.c". There was nothing about removing the
stub altogether.

Jan


