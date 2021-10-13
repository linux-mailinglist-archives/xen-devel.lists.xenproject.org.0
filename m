Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27F42C087
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208409.364519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madfd-0004k1-5t; Wed, 13 Oct 2021 12:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208409.364519; Wed, 13 Oct 2021 12:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madfd-0004hk-2v; Wed, 13 Oct 2021 12:47:45 +0000
Received: by outflank-mailman (input) for mailman id 208409;
 Wed, 13 Oct 2021 12:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madfa-0004he-Tq
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:47:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e284e242-dd6d-4167-b31d-ef71a34819f4;
 Wed, 13 Oct 2021 12:47:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-bUkD4En0NxiCPVXff0aUSg-1;
 Wed, 13 Oct 2021 14:47:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 12:47:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:47:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0137.eurprd06.prod.outlook.com (2603:10a6:20b:467::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Wed, 13 Oct 2021 12:47:36 +0000
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
X-Inumbo-ID: e284e242-dd6d-4167-b31d-ef71a34819f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634129261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+L3dsp3QwdNKQRhFD+xf4aDzkPFA8A9ojwp1dX9GwVQ=;
	b=VeJg9H9/rfveH3tGgpHjInKcXxkA+yQpvqyvEP4K+IHsjiGu12uFr8VNiyt7kygk682TUn
	uehzZzPNPjEazGqwgOd2ou+5YUxfBC5wavovTJiUvI3KhONIAVoDuXblzPUgXBdsLhSHRV
	N1S7VvFTKBNg7HMolQSya5r0QodF/Co=
X-MC-Unique: bUkD4En0NxiCPVXff0aUSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI2KWgcu7UqKZtylJrH2GQsX6k56sKYjipF3YwknoBnCs0qctWQMRD7MHo6ApipXUD6VMkETajo9QabOyA6DQ2lqLGkUVvSvRTM+E8N7hoINWD7E5zZDZ03hdW4g3Yu/fTeqQ+tEP6fHNVGpG5jK0yGCuQwobc/qX9v9hQt2haCodIugnZKtY3BY1v4IFI7Yto9jjyPBZDCEyQOHpiheZfMgbun1ckzeOAeXA8sQptQ+f357spKptI+ouUNenRNjJ6H8wYzQ6V5oHU6fYVqrYThB+fMJQ5aIkXF7uTmQc/fMKSqLiJYUeED4MfmkEEJ4/5rvxRKIzY7qNCLbcnh5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXj+/mJ+8Se/pxVKgWm8ElQM5M0xznuinDGSYgOirrU=;
 b=UHPTOVSrKd/Wx5uii8ed/c3jJTCVtscPkcQi64hbhctFw4YVQUppZeFAiQN0aQM46gu78wrp3+JMs12mJi2XW602oxET9sUoV9zH8oc2WR2GTCXibWYMSASwcff5TLEFrGp2apZAKGszpQe/s0DfDaQJlWYdlpuw21bQ/nk9X+bYC91DMLJHaGAXaHrXlWSq4u+oqlyeFmfPBTADNzzonDUI9OI+X8surONXowXZSzmzVRd4Zy/RvDBvP3iaj/wWQZw+a0rQ120tRFMM0Z266RihrIm5CZabjUwbeKlrp5eduJdtQyDNRPegZReZ8V/jMqaj/S8AQXJHIXF2HJ4HMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <YWbDMwC+6ehmGurS@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <590e18ba-e68f-1db7-db6b-68d547387ef8@suse.com>
Date: Wed, 13 Oct 2021 14:47:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWbDMwC+6ehmGurS@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97574ab2-3971-4a87-fc5d-08d98e47a28a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB648029541C6F63B3DEC41B4EB3B79@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z7jr9l3FsHX5dfy4nBM6dykfVkHfs/x/25itX7GDH+X4IX+ih4EAjTJ7kEIpajgGkJSE28rC++wPdZoLifu4TeKZ6uCTZflQNW8Oc0pvB/LT7TVaKAcG5IRzvNLnr8c/tOIQzGQXC5lp77uy4dXlk+DP66J70qQUCrQNvEy9XpNDySZ4sC/jbHd8u5T+g2Y/M1qvjBQvYBqCwAvCgK7P+42gkOPQM1JnHofY7lE3VwJeo48tIRyWDSJC6XZZ+kSOwOGpbGva9E1iSeJBPnTSQtXMmHqamUQcIGHIwQzSVuJYdVgfyi1yOcEOySonJu5RF6tPbTpRX9q0MOvtXuxNGMVBpHEMDDEVcX2Lo9kzHVSMKtxowDz867h4ckxwxWwoHpXVPLNp3rANWRSHHMNnxjHs2Wwoj0O9sZLsGh9/syA7MxpT3pLNHjKukTmVSmPQ/ZtcAxEJmJ25pw2Gcff43lQfLCo4UEUgq8rV0/NrAAcjymMVG/n6oKg1Ox7J82n3ZO1jVQ7fEVbaKuchSsmOGDGnLtEs5P5K3bm16zmvn6rdltpi/ybk54TpeKv76pPisl6nfPISPr/IxBHzyoWxB1zbBMI+fundtLySu/fSTk0QOhvQIlTgz5kJg5UQe3D3lYi3r8qxv02K5eKy5AZJhz6E+poMuB2471lBZrrpC3VM3y/bj35A2QiwA1foVX4xzNK02VkfOEFyBqlRtV8yg1oRwtgMhYyIRJi8GFx8c74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(26005)(2616005)(8676002)(8936002)(7416002)(186003)(4326008)(5660300002)(53546011)(31696002)(4744005)(508600001)(86362001)(66556008)(66946007)(36756003)(2906002)(6486002)(66476007)(16576012)(54906003)(6916009)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTBC1KCLHAgEKf9X3Y3kOLHtDlnVZzVvuLAIXhQe5SJiF5LJQ54Vaw+DDDxX?=
 =?us-ascii?Q?QQJPLcam42hiQJCViquRL/eQ+CFM38FgjQisWVngsa6EPFvQqWtfJMtTrklE?=
 =?us-ascii?Q?lXWFlRCNBfziu1vl9Zk+q4g15r8VGwe10IqTLvytT5zdXK2NWF1XjTCTXW6I?=
 =?us-ascii?Q?NFSpqeRPKKfsN4cvV+3EhWenoU/vkHDRyTCbe7L9NMMlPDDeWcZLCnqCu94d?=
 =?us-ascii?Q?C7S9bxm+gcruCaUdcxfDR6XAYs9BQodkdgRjTLmGWJkHNrBNlp+GH9WV8MFG?=
 =?us-ascii?Q?gAn7n6Ahsw8fubXRmPNfZfPpSiDI1X5BSIUVG2r7P8hW695Fjo/z6uLljaxy?=
 =?us-ascii?Q?Z2tyTXYSApT/VaJS1wweufVNi6VqLLGgVojPhyadY4BoVZXJ6EFAlfShQknf?=
 =?us-ascii?Q?M141gGvmjWEJqa6Csy0gavqXISCGJbcy4YAolpXfO0wlYQq6w6VJCCn8+LT7?=
 =?us-ascii?Q?HJNZ+qwmiY19/S+7MQN8dCoLAl+DJ4pQi+/uh0uaRpFbjlApy2JthkG2HEbI?=
 =?us-ascii?Q?Z2mipOZLkh1f3tId0d+bHYVNk+tFdaVm4iKY2qYmkitLOjT1Mc5weQrT9QnJ?=
 =?us-ascii?Q?WBjjAjdUw8vVdQA6GsZd1/Ynf/KdDrmveZ9KLWa7ZVZSsDdtHJqXIny7h/nM?=
 =?us-ascii?Q?C5n/rFojHrD/1x+dfRhClfSUxhh2gEnKeeZX4gyAPDyA0x2CesgDeBjhd0Lk?=
 =?us-ascii?Q?Ux76ZLcUsK1PbYfXDwtJGcYvXvWyQuBLin8PZjQLFi+HEZfGW9onRPo+StCd?=
 =?us-ascii?Q?NEuJYLsPyQjrLjHLXZFFX1zIRf6ZvPsd4w6PPUP8b31U+Wg+buNCS7pKvZYd?=
 =?us-ascii?Q?IRa9QsqE5lwip0EstGzvMokllzyMjxQMyTF5xx9svLWQwWVghnsTdv0uYaw8?=
 =?us-ascii?Q?JBRe2Je+5ixZ67m+2pzOc8vXdznf0mxaNlTIE8FSqjPtk0eK4UhDuUlOOY8V?=
 =?us-ascii?Q?Bka2qcjwokHy9novXH7CpbEs3tknjGP2JFQcl/36KHtkQNXFNKL9TbvvCUJt?=
 =?us-ascii?Q?/t0wdqjFg1yECUKoohk7RM4cZ0cxL5VxuuVcP5fisK+dJUTixdsL6OfoDrST?=
 =?us-ascii?Q?7Z6nlRhGWJYRNlkqqbmSNNIua1ct0JAh9Q5zvZ6BvPwz/LqEhG0+BeE4epVm?=
 =?us-ascii?Q?NnLdaj/L0E2vyaA+cgec4Gafv23lQEzL5KX4C5GF3eucd2ZhWDs/RH2ptwFc?=
 =?us-ascii?Q?gqHAi0zmO8sx+4LFU48Ot2Vwjo3N/k+oe6oOInej2xT5HeMsZDu29N6Orq5L?=
 =?us-ascii?Q?a4Wp8Ad5k4+jkXmE186S23CSf3mqAH+7MJdP7uKpRuUZsr+oyg0NPTgUG55l?=
 =?us-ascii?Q?FS8uoyQ3L9V+YowDDhS+TSq2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97574ab2-3971-4a87-fc5d-08d98e47a28a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:47:37.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KRtuH1FmK1xai1h1WreS3BLsyEFaw55U7yFk1L6FLBC//i/Lt+MyI2A/46JGEE0YqT4oY77MpejGEhT/WMYJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 13.10.2021 13:29, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 30, 2021 at 10:52:14AM +0300, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/Kconfig
>> +++ b/xen/drivers/Kconfig
>> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>>  config HAS_VPCI
>>  	bool
>> =20
>> +config HAS_VPCI_GUEST_SUPPORT
>> +	bool
>> +	depends on HAS_VPCI
>=20
> I would assume this is to go away once the work is finished? I don't
> think it makes sense to split vPCI code between domU/dom0 on a build
> time basis.

If by that you mean x86 side work, then maybe. I did ask for this so
that x86 wouldn't carry quite a bit of presently dead code.

Jan


