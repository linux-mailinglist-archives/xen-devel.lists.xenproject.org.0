Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90031443F5C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220658.382008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCVw-0008H8-72; Wed, 03 Nov 2021 09:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220658.382008; Wed, 03 Nov 2021 09:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCVw-0008FM-3Y; Wed, 03 Nov 2021 09:25:00 +0000
Received: by outflank-mailman (input) for mailman id 220658;
 Wed, 03 Nov 2021 09:24:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miCVu-0008FG-TL
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:24:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8e2d5ac-3c87-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 09:24:57 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-JWCkTSoxOiOKpxkc5LXMUg-1; Wed, 03 Nov 2021 10:24:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 09:24:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 09:24:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Wed, 3 Nov 2021 09:24:50 +0000
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
X-Inumbo-ID: e8e2d5ac-3c87-11ec-8563-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635931496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9YenonVGTVm0hq+rtvdpS5LXKJkyQKXJ9Xu9zkYQ37M=;
	b=Qnx0Ve503gW5H0lX3thURG2g/bsNXbU8utLSAAdA91IOvphfOsy9Wx6euzsWRzRy9/JRdj
	GRWLJeTRxvUb/AD0NuXUulRFM+awUaAMPnLdAfxOTVOveHbrFMgoWbdG+5YJ0SfxaXWAXJ
	r7TgkKHwozW1mjOZX6OQvSF489/Iiu0=
X-MC-Unique: JWCkTSoxOiOKpxkc5LXMUg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGyy+mTvqi5mAKThuJWaXXLT84PnAaSgDhBvYLONHefirfrzJim6mp1YLsVe+Ip4RN+ajrqBvfTeHYCxyAGRWh047vC0nEAMMYOTs76nNSl3Gx82by8NQiJu08rouM/JqStYrN//4BCfjcTQsjqqQXvT4UoMmz873rOLzyoXiOrRie6HVrzzKeflakqOfxWpWWQZuNuWWPUZRXJGXYwf/9KCFlt84kw6Lcuj7SkLiJrghQh1QpjqPkpjK6woiCydY+tsUvViYyIyrrVXzv60d+wnDT6x2nS/H/HJoFlkqAGsz6SD3G31gt8xCJXh78qWXHHMMFTdVzzh65U0V/uc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm0TGPqNli7vPslCtZGtXYWf8COnvUce7JQj/+4f9ik=;
 b=jk221QcFiFrQbt7voVOHzuaOat3h36Fi+309zKvFgo7yuQHgGk9fLmGPx37ENH3BAvjWebqHolGKE2t60fL0YLqe2FRA6JmL3Il+XS4qg7SpIt06KtK+iVy6KAb1TdRNS0+3ikeYxX+4vT7n52Wf+LRx7mIkVkb+eMkBBrchONFIyZskn+cCEiV4wkuqheVh42fBAdSuZvL53KJrQKajzFmDeGzRmoW5pP0eM/yeQyraM9wdyKe4aWSFl/xRil2pbrSAhp6sza31m4GdH3RN6P2jFQrFNXtbkGDyQbBB+4CqAjHNJrmWKAOjQEw/A36JEhN5lLaKtKMzDnFbacmo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
Date: Wed, 3 Nov 2021 10:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0182.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e50deb66-ee2b-45b9-2d23-08d99eabc996
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472DC533CEDCB7279A5ED42B38C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C48vwZvnY28vNNcGjmY3ebj0qslsH34yRZW2R57lVzLDTyviSopF7J0k401uL/+0gXvmozRb91sbN8QOPFP1340wPon5+J2D5LLNzqIeidDi3IVjOrdKBUiaFhsc1+Gi7y6Ec8buEFjyYNGZjgbKw9Ecxy4Sad08pngaHDljzsYVny0HOIasfXDeujKhrl1Kgx8OVwvsdDorOCuyllKMFNnBOVqLGKt6sraqgXHTxxxyFzhKAk+sC2KjQqMK6glZsu3oeNjbfK81zGpGQQhEpUtt9agrUhLxzIsOHlkzUOHt9O4eMKKMoKOara/GNrXlZ63d8ecC8q3spo8PA9k5fkbmaHinvaUXv8O1chWJzZyXfbmRgdCGTVe70jSA4CuUd4KcEDYtTw0MjQUJrNsU2EwCe+wKippqmq9FiMTu9ZdeuFifNSy7tjtSDugma4NjLhRdH0CG1ceXlpB2dBcOlosd/RBMCyWILeeCwesYtLnGC7NAxb80LqxMI+OiI9BENI/NMu64aKCcmplvlOn7bwLVpsXLJM7+yb6bCG0/hi/1Cg0jG3VpUmTqMejUNZ95MsYE6EP0RW4S6mw3Wx3NE9pjeYem7air+Onyzjyx2LxLqmczUq4/Rbd1H/Zuh1I727cCFFoxKuNFLlGrfasHum1s9TTBbGlDdMbX81EWyRlrj3CHZoelLQu8ZSZRkzADr9kDDoDP5eIJrJoWcLmtBC1v40izRcxgGnzW4tM9TwDUetZkrbCabP+CrcySTkwy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66476007)(66946007)(8936002)(38100700002)(66556008)(31686004)(6916009)(86362001)(8676002)(16576012)(6486002)(53546011)(4326008)(5660300002)(956004)(2616005)(26005)(508600001)(31696002)(186003)(36756003)(83380400001)(2906002)(7416002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AMCAWUNI1fAkXsy/4jwU8dJTS4Fch2WhcUcBMazymnqJ3GG0yTI2lRVuDdwx?=
 =?us-ascii?Q?xx8D1Hr/0hVDUVhCOK+0yhc3Ke75Q+nPySvMseLqxkD13pT92gaEzrrSrmEz?=
 =?us-ascii?Q?ErvrROdVSTNtAHOtQuQTsTOY20M1dicfTPpCM1hDl50Sh+ZU7CzMWBe0DNq9?=
 =?us-ascii?Q?dTCvxZ6t2sp7FQJGq+///mb4Q0N9xF0yV12LGWBoFQYlq5D8Oyam2i1Pl9ug?=
 =?us-ascii?Q?q3fBV10dsIZ70/p5Ytugsp0Xv31EQPZ2GfEgxLFbetALfNp6zDujiBhGyorU?=
 =?us-ascii?Q?v4YiAPlD7NmEsKLR6T1UFTz9ln4xjHfNTPrntpYuNVds4NyCE9XCwISV3Sxv?=
 =?us-ascii?Q?xU8bx+tWzYrI0xJc+KnXrOtJZvYwNwrIor9/3yQe/xWNlbWoSoyDPArC5psg?=
 =?us-ascii?Q?u/m8b4f12GLAuSW6bx8YymR4UJs6KhIjcQdtErqH/09q9jUAmb5kjPW+BYuP?=
 =?us-ascii?Q?EZH0uRxE8HdWx2SlUV9vHnld/YEZ9HCk0Q0Juevv0UhpC0Y6NdytG+SK7YFv?=
 =?us-ascii?Q?8MNpkcfFGF1iQFcZEHbIITgZFMnUdzboU4CM2Raya8zA+o+ZyW7qwoE/UM1j?=
 =?us-ascii?Q?rX/tdzdUnMJWwF/LNDm1plaD4qFbhcLfb0EuyMPuNowYAKBN3v3GoBhukvKV?=
 =?us-ascii?Q?qtgCNmdkWOslMBari2haFgFTxtaqTu/Jt0GQievY6FhmtJ5v4vxEZMEki0XU?=
 =?us-ascii?Q?+0WdyLEw2Lfvk5ibXyCyXF5ECxq8B7vlFIBXuDch10bVPz/HMG8MZPYICNY1?=
 =?us-ascii?Q?h3XDAhf2LU0N6BRnLxh7ffMFioTsKFztWGw26TUVluW7oUzFeRYnZTLPcPqj?=
 =?us-ascii?Q?kcYgb1MlSSAyKiqaVjiwEtZ1P4WrSkRKWif4XpgaZZvkpnRHxAFNL0xCZYa9?=
 =?us-ascii?Q?/w2MY7aUd/GPiFvOY4ns0ZQ8LNqqpghnOJptKtGtICU/mVwiuoUz+a3h2TK2?=
 =?us-ascii?Q?B8ys4EYetvQtSxjLG/QrmklZ7vcifIiQBmMmanzdTZl4+A0+91HrnKDnLiTk?=
 =?us-ascii?Q?ZtDb2kKaNVmBV3uk2d955sEMiQYB+4Y71rxzIxj9aq/nHKc9Co39LDFjOVrr?=
 =?us-ascii?Q?YvK/kNr253qzYbaMHMGygOyVRVBVuBxl9hGrP8ZJFEo6+Y3t6DQxGwwQnZcN?=
 =?us-ascii?Q?LShGuTIx2OAViTkp/AXT2hJKuBO3zD6LBYCW1ePv0gR4hgAqpusPMm5XN2We?=
 =?us-ascii?Q?FI9IXo3MD8tL8r6jheJ0EkaIuv9Ot7acx7Uzp/5Bl6TdeoG+lbY67DQV1MkP?=
 =?us-ascii?Q?yS3qgMG5JtjXAWp3c+tXcuueg2YlaURlOlCbY+kG5dm8lZ2oPPrAj0o+C1y+?=
 =?us-ascii?Q?5iaGOhQnfgucdrCbxWeUCHX+irj1beiBXNXdOFDPPzsLlTDivY4p8cgvg5KF?=
 =?us-ascii?Q?Q5UFqKR8pkaPx+79rdQmeViEqMSOFAQwT1FpSvYhqzBnqVzlplarydA/bQFZ?=
 =?us-ascii?Q?yh2mGj/tLaAlbkSJIOMn52YlLjA+8ePelhXvLZem8G0GGWtY+J1ze6gQ5sRi?=
 =?us-ascii?Q?LcLEzaulDMAnF8Fyfud0WZa5nqLU1gLj5hO8kLY0JZIwTmflP328FmEu+t1t?=
 =?us-ascii?Q?5MTrJE74Es14USfYhdZGXr14l9EGumOdX6efqLT9Zuj9bIYVVCF4utNheVM2?=
 =?us-ascii?Q?Vz4p16b0SXcMJL4IX7nfkLw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50deb66-ee2b-45b9-2d23-08d99eabc996
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:24:51.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eIeKT1GgGhosU4bQgsol8ZM0iK4fUmxfCVD9BgP6FVL/6WlIreT54l87mBqdNCRy1NONk7XHay5xt3HNEg3TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 03.11.2021 10:18, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 03.11.21 11:11, Jan Beulich wrote:
>> On 03.11.2021 09:53, Oleksandr Andrushchenko wrote:
>>>
>>> On 02.11.21 16:10, Oleksandr Andrushchenko wrote:
>>>> On 02.11.21 15:54, Jan Beulich wrote:
>>>>> On 02.11.2021 12:50, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
>>>>>>> On 26.10.2021 12:52, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko =
wrote:
>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *=
pdev, unsigned int reg,
>>>>>>>>>             pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>>>>>     }
>>>>>>>>>    =20
>>>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned=
 int reg,
>>>>>>>>> +                            uint32_t cmd, void *data)
>>>>>>>>> +{
>>>>>>>>> +    /* TODO: Add proper emulation for all bits of the command re=
gister. */
>>>>>>>>> +
>>>>>>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>>>>>>>>> +    {
>>>>>>>>> +        /*
>>>>>>>>> +         * Guest wants to enable INTx. It can't be enabled if:
>>>>>>>>> +         *  - host has INTx disabled
>>>>>>>>> +         *  - MSI/MSI-X enabled
>>>>>>>>> +         */
>>>>>>>>> +        if ( pdev->vpci->msi->enabled )
>>>>>>>>> +            cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>>>> +        else
>>>>>>>>> +        {
>>>>>>>>> +            uint16_t current_cmd =3D pci_conf_read16(pdev->sbdf,=
 reg);
>>>>>>>>> +
>>>>>>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>>>>>>>>> +                cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>>>> +        }
>>>>>>>> This last part should be Arm specific. On other architectures we
>>>>>>>> likely want the guest to modify INTx disable in order to select th=
e
>>>>>>>> interrupt delivery mode for the device.
>>>>>>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
>>>>>>> enabled - only one of the three is supposed to be active at a time.
>>>>>>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
>>>>>>> the bit is clear.)
>>>>>> Sure, but this code is making the bit sticky, by not allowing
>>>>>> INTX_DISABLE to be cleared once set. We do not want that behavior on
>>>>>> x86, as a guest can decide to use MSI or INTx. The else branch needs
>>>>>> to be Arm only.
>>>>> Isn't the "else" part questionable even on Arm?
>>>> It is. Once fixed I can't see anything Arm specific here
>>> Well, I have looked at the code one more time and everything seems to
>>> be ok wrt that sticky bit: we have 2 handlers which are cmd_write and
>>> guest_cmd_write. The former is used for the hardware domain and has
>>> *no restrictions* on writing PCI_COMMAND register contents and the late=
r
>>> is only used for guests and which does have restrictions applied in
>>> emulate_cmd_reg function.
>>>
>>> So, for the hardware domain, there is no "sticky" bit possible and for =
the
>>> guest domains if the physical contents of the PCI_COMMAND register
>>> has PCI_COMMAND_INTX_DISABLE bit set then the guest is enforced to
>>> use PCI_COMMAND_INTX_DISABLE bit set.
>>>
>>> So, from hardware domain POV, this should not be a problem, but from
>>> guests view it can. Let's imagine that the hardware domain can handle
>>> all types of interrupts, e.g. INTx, MSI, MSI-X. In this case the hardwa=
re
>>> domain can decide what can be used for the interrupt source (again, no
>>> restriction here) and program PCI_COMMAND accordingly.
>>> Guest domains need to align with this configuration, e.g. if INTx was d=
isabled
>>> by the hardware domain then INTx cannot be enabled for guests
>> Why? It's the DomU that's in control of the device, so it ought to
>> be able to pick any of the three. I don't think Dom0 is involved in
>> handling of interrupts from the device, and hence its own "dislike"
>> of INTx ought to only extend to the period of time where Dom0 is
>> controlling the device. This would be different if Xen's view was
>> different, but as we seem to agree Xen's role here is solely to
>> prevent invalid combinations getting established in hardware.
> On top of a PCI device there is a physical host bridge and
> physical bus topology which may impose restrictions from
> Dom0 POV on that particular device.

Well, such physical restrictions may mean INTx doesn't actually work,
but this won't mean the DomU isn't free in choosing the bit's setting.
The bit merely controls whether the device is allowed to assert its
interrupt pin. Hence ...

> So, every PCI device
> being passed through to a DomU may have different INTx
> settings which do depend on Dom0 in our case.

... I'm still unconvinced of this.

Jan


