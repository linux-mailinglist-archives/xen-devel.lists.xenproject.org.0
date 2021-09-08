Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E891403C86
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182242.329726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzWV-000610-Uy; Wed, 08 Sep 2021 15:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182242.329726; Wed, 08 Sep 2021 15:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzWV-0005wv-RU; Wed, 08 Sep 2021 15:30:03 +0000
Received: by outflank-mailman (input) for mailman id 182242;
 Wed, 08 Sep 2021 15:30:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNzWT-0005gb-Oh
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:30:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a12ab90e-10b9-11ec-b167-12813bfff9fa;
 Wed, 08 Sep 2021 15:30:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-K4IFlJ-UMW-fLb5KrPljBw-1; Wed, 08 Sep 2021 17:29:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 15:29:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 15:29:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0158.eurprd02.prod.outlook.com (2603:10a6:20b:28d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 15:29:54 +0000
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
X-Inumbo-ID: a12ab90e-10b9-11ec-b167-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631114999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WShhmBomMdXUvoPL+ZxDbQGjovzQP4FsvPEmvg/RKY0=;
	b=lvvTS4DLJ+JoGs46NyheD7RZY7kuDb9QelJWQP5Y78SfRux26aR3wnRBzPOPWqjHGBM6BX
	kCPNlE9We344jYsDQj69hPjzHDycagY4kbvkoNPfBoM7cWic992fA+HKpeLGDG5A4BZwPG
	xURU0TNsmpNxNIXu0TEgJ+RlgInb9gc=
X-MC-Unique: K4IFlJ-UMW-fLb5KrPljBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XClmFNKyrvyT7I0uCs5oeem2vZ3fCar7EDkD2LPoe6J1cRmBPFOsJL9EKvy4QNx/ofdE3SUQTluDbyPtX+pATJ1kMvAHyS2vFkqZ2e35hnAG9cbe3v1fespU9IoVER++qP94330ucDRhJeodL2PA42o2OLjc5AWWBJYnt+YVVKYI7X1YD3e/iQN+Iw/DoymCxi3O8lsuQkFG6yJ8TMHXHMX3nMWq/pRivaE2IQNYfGEmY4sTnzKS6Vdjz2psHYqwcnsK8gYHNU4dRsL/EVoQVNMbtvFcGdk1D8E0GZNEEC1zJOF+Dxsi5DwuprqduXnInbK6e/kVBlzJQwU0/Ma3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DvYrDPdby1PLKL0r55nnyfge/U0QTcsM7hcPE5QmApE=;
 b=THUAS6Z9hmP17VlQgFafqczekRVQN74FatCWz25Qd8Bc/AYVUV/nWu4kD/DuEdPzPzA9PMD/elESRTK6LiMS8Q300wRAQyVF7usJs5RXI+RJjv/lT4QqH59X8wBycXsTzCkb2r/zvYeHnZ0XIxhm2P3bsKUGiJfQSgh0KKsMxRnRk6Sqf+hoWPBy6kFGvsS9d84K0SaA01R4f58ARstfeuxqCNB0FeqXXhaZiM2LIy2bS2XPLs+sy6El3lwpGNvO5XhlNv3XbQCSh6hHi3xfjME8+IhtMdoSvzBp1qAjhoyRI8fjl6qEgdvH6JEuKwAgeI5Se78RtbzFUXbvrWOc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
 <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
 <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
 <2fd6b81e-e5fc-f6d8-b24f-9fbb1db034d7@suse.com>
 <d5ef78d1-253e-26cb-8d24-667d1ce7a671@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47173d64-781f-ae37-5eee-f483fd74e828@suse.com>
Date: Wed, 8 Sep 2021 17:29:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d5ef78d1-253e-26cb-8d24-667d1ce7a671@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0158.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b15e9ed-7c20-4178-f8a7-08d972dd829c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686392597ADB5C1EC978BAFCB3D49@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmtNS9YUKif7KNXwfKaQAr8EGt6odx1DwW681jTfvBsDPpBoQVDy6FjB2doaatgRvHMWxdw4oo90X+8Tsvo/F5uRwEAZWdt2PXdxwLuF2fqxWNpPSJilyhZ3066iu6lHLTM7668U1WSVqYzQMi/idzVWCOdUDXBEazqpHlQbbCDRongBYESHdZjgUfB4jEE+pg/SodqOUIPLrLfdcYTpomBwgOmEXsTt+YFSq8AqS0LO+c37kQMvUj/o86PVi3IHu/lXjfjgZuAggyIrdiC5O2P5e6J82VFM/Lvin+4LjzVzHDxMaU3hJXkOOja/SKgb9mCqThn409AwAdm3gSSj4Farh4vGCDvcXMO4+3WuziMqKmMrH7iwG9jvJ+rPGDdOY7P3BtR7Mr9Bcj0t17Hba7Z46Iv3+pKJoEjDQIw0rzrLmVpQQH0n8OUxV2NjrB3Z35uP5lSnjc3ASr9HakZARxd8lOYBD7Uzr6X69Soa4PQGy1qi1sUO/kazpaUTosbyqJHRSaY8j825md/6LajdvsgACdyObqnw92R1QVlzoKG1mvQ3EBOQxGeMf8M57q8pUsB7HrSomSd++0wUlOR0iTNaoNcpgNw/zm54+euaqFf8kq+detKe+jikRXQlLzqCtiCKlm141P3svtdOcSI+FJWceNnh+WTXtV8PZtHgNR51xgna3a1mbsW5lNKHu0TF/pe3qL2/BTxj47fIYM+IskaI9k5CIZHsHSQ8ts2SSmmPc9G6pa6GXSYmP277SaSm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(39860400002)(346002)(2616005)(66946007)(53546011)(66476007)(38100700002)(66556008)(36756003)(6486002)(86362001)(956004)(4326008)(31696002)(26005)(478600001)(5660300002)(7416002)(4744005)(186003)(8676002)(2906002)(316002)(8936002)(110136005)(31686004)(16576012)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EIViW5IwzmhWX6ILq1sNqYu5lAB0Ycz7xOyf9FC+/gMM9YK0vtHRMqfwPbP0?=
 =?us-ascii?Q?UERqsLgojZRfC15yYUeaHcgxcEF7Qk/9zODn+cywwYWhL5zXi2r/6RZVsCAt?=
 =?us-ascii?Q?XuVLbPbSHdXXcR6tYGbgOko62BTOYMPB9bZhng32qyrl09EDPdUbGLfrmqWf?=
 =?us-ascii?Q?V4KUIMKlB2US4oFZEgRTU8GFPyeJKLmeedX77cOBuAkRbajI38Mtk3c9e9oQ?=
 =?us-ascii?Q?5cHe7PLHPoVy29ynjf9fP3M5oTJizP/THVykQakjDr0Q/mwyDBw7LqwNRUh4?=
 =?us-ascii?Q?dVFFXfH4l3ukz4nL4VpwF1tIg3+5IDTXRArttLlY5+v6eE3gBpJCTicXY0bT?=
 =?us-ascii?Q?PoiBcAlHt/JuJtElm/sBh/19u/ixzqUWz0u2E+nCQDSt3yGbuvZADSoYUYnN?=
 =?us-ascii?Q?WVern6q1cA2J/Ukdrrsh/Gk9lbj/POfBZZPmtFCy6gPgVDulqi2h9qfycktz?=
 =?us-ascii?Q?9/1NMyGhp8aienJkaz4NvvzMzyJLIdEjGQkSlqzJuF56NDlqfl1lvebnq3a2?=
 =?us-ascii?Q?Jo4sHkRQZwkzRVcnyNHbu4+4lvIbg4Dr+6M6mSTU4gxGj8/0IxwPaGsOoVQD?=
 =?us-ascii?Q?44BUDRbgOn94nv2qIuXB8iFsB/K1J3NVJEWuLUyjjClgJXSA539ohxsyIt+d?=
 =?us-ascii?Q?dqTpIzAIf8b9eW0Ue4oExqzWURmTOEbOlOmInPCCSw5bSqdL7ytIZFpGUPXr?=
 =?us-ascii?Q?kE/+JfTboPVVGguj+n15dcCNKBJYbclQXKe5A5MTWB3HY3CPIsgROGPuO4+P?=
 =?us-ascii?Q?Sz61xJikKzRVUaEq4ibnFkejSMyYj4wzMEly3G+ItqYEm9+lRIc0+36+gceN?=
 =?us-ascii?Q?3O05Usm9hjOobxSB+C0NpLD8V2oTtvaJZV2hQx8obv0B2RZC57IWG8AiaABw?=
 =?us-ascii?Q?6BRF3e5fnOY/aDHgLafBjAJ8cmuM+PFMIgQEFfKh34k14VvcPyOnFzXrhcfA?=
 =?us-ascii?Q?UyB4xU6vSgH6U4aWtxLVgnmob8VGl31E0e3gkTWzfFnqu9xDbAbeKyBTMT5U?=
 =?us-ascii?Q?LYx25DIJ311R+ZrHKhhrTF3zih+tyYwCUW4cCRznLVNHFRJQPVqS2meGasal?=
 =?us-ascii?Q?A5ojEnKbnFAeNURwq6+gN3Pp2CmqMe3ycsrq9WNjxvJUP+xIAPTH4SRQ/LA5?=
 =?us-ascii?Q?Dtd0hZZjweqwFZLdo2CziI0A/k/tf1kHd4a0L3uSauEHiYr01b7x/jEdjAH6?=
 =?us-ascii?Q?OxM14jcYmpU0whfDffBKkxYQhWnTSyF52QgxeMvBSq2dL2MHVKP58Qt2qSGp?=
 =?us-ascii?Q?9m0VbTi4OwTcyQdnsNv5fjbWSa9ytzrgiyhY3d8eK3ZGt3j3u8IraX+GyxXz?=
 =?us-ascii?Q?EG0PHxPInbk126ylS+JfjEUw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b15e9ed-7c20-4178-f8a7-08d972dd829c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:29:55.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWAd/g4mvIj+x6n99KPcMfE+jICw41/TLVyd/FdP/AV1SrCjd5Tj69coEOB47nzDA5AgFBPWEc/Jv1DA72i9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 08.09.2021 17:14, Oleksandr Andrushchenko wrote:
> On 08.09.21 17:46, Jan Beulich wrote:
>> On 08.09.2021 15:33, Oleksandr Andrushchenko wrote:
>>> static void guest_bar_write(const struct pci_dev *pdev, unsigned int re=
g,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uint32_t val, void *data)
>>> {
>>>   =C2=A0=C2=A0=C2=A0 struct vpci_bar *bar =3D data;
>>>   =C2=A0=C2=A0=C2=A0 bool hi =3D false;
>>>
>>>   =C2=A0=C2=A0=C2=A0 if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
>>>   =C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(reg > PCI_BASE_ADDR=
ESS_0);
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bar--;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hi =3D true;
>>>   =C2=A0=C2=A0=C2=A0 }
>>>   =C2=A0=C2=A0=C2=A0 else
>>>   =C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D PCI_BASE_ADDRESS_=
MEM_MASK;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D bar->type =3D=3D =
VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : PCI_BASE_ADDRESS_MEM_TYPE_64;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D bar->prefetchable=
 ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>>>   =C2=A0=C2=A0=C2=A0 }
>>>
>>>   =C2=A0=C2=A0=C2=A0 bar->guest_addr &=3D ~(0xffffffffull << (hi ? 32 :=
 0));
>=20
> Do you think this needs to be 0xfffffffful, not 0xffffffffull?
>=20
> e.g. s/ull/ul

If guest_addr is uint64_t then ull would seem more correct to me,
especially when considering (hypothetical?) 32-bit architectures
potentially wanting to use this code.

Jan


