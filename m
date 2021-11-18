Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8315455F2D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227471.393420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj9G-0000vS-BW; Thu, 18 Nov 2021 15:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227471.393420; Thu, 18 Nov 2021 15:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj9G-0000tc-8K; Thu, 18 Nov 2021 15:16:26 +0000
Received: by outflank-mailman (input) for mailman id 227471;
 Thu, 18 Nov 2021 15:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnj9F-0000tW-5E
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:16:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ddc0ecc-4882-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 16:16:23 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-Qav3UCqtM_2qEZLChcRh1Q-1; Thu, 18 Nov 2021 16:16:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 15:16:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 15:16:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0053.eurprd06.prod.outlook.com (2603:10a6:206::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:16:19 +0000
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
X-Inumbo-ID: 7ddc0ecc-4882-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637248583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahoCHD+ZJkECgVIZzHmKlPxcMDr3MzNmPwtkYuf12Dc=;
	b=koaUeweyVdIvAlrjQLicbhXYbPkgS/nBRnCLGIj+dGFqE/Brzha6Nq60OeO0CXz0ojIDic
	1B4c4uPfg0GlOgqsxqFf0yXq66d/VqohYvOMG5CWWdo/EPC11Gul/SgzIIRW0XifCsgSCL
	nKJ0PNM2jIY8/ImJtxOVe/eGOf8D3fg=
X-MC-Unique: Qav3UCqtM_2qEZLChcRh1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTc5XDsE340I6S0x1xv6sDAmfgPm7L6utAuA9DLkFdFcm0fQ4Vdu2NSfxVokHoAnC1Ro+2jzODq2ShMuweCDjvzFmAA3JRvAXrwD1OJiSfDqlvM99S8oZYeY9WJnl2xHf9hMbRWB6eFK8GyP2peXEUc5xLiWHZ/VYBt+rsa3WgDa7wrA6OX9Lwo1C1zuKlBBIUK76VnR7EXOGO+g0BetPnCzUygo0gVzJ8Dey+NmwEkuR1qtJ6W2uMqDyWjVvQ/2rRoR9W1pMVAJ4LNTkKbdsm8c8x2xtaNiOGwus4ObHTKRiPEFFn4ft42Yeopvz+k8p3I4Wy1c4g8WjrMuaEQmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9GMCsnhAbzXX2yJdr2wcRfw1H/QqImUom0VTKn33kA=;
 b=ZG+2E4N8KkXLsPp7sKH3y5OQ2McWNBxwbF9fQg5lGiBZvFp6B+lPb6wXzHMq6AmVOtBr6AaEdO2rrDyENBx+whJKewE2oxEweviCeRA8G4pSS2zxp98QvAnqtKBsXr11StNz5NIedVTwJ+26aeqJfeiMhRhxR0H21x6ARd5E9alJZTj1UWzglpeMPxlReeUqhcu1MU7XAbhCJuCw4OXIYzA9bQWSJq6JHTBZX6IKibBUZ6qsj/XtRKms1u+RfhyBC0XturWNFcipPMnzOvV+lvwkgjngEBsYHiRNXlh4nEdLbxwBWDCB0DzyhKLT3JPghpylFLo95p8ye4fw8U1ZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
Date: Thu, 18 Nov 2021 16:16:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0053.eurprd06.prod.outlook.com
 (2603:10a6:206::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 117a24a5-3cfe-43c9-5c94-08d9aaa65ff8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43829A09E761E7D80373B8A7B39B9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L/XtfaBUjkK2EHDqTNzpRKaWAUmTWBW1kp5EsY71/Gc21+EZYmJnm6uCerbNDEZcCGKL4wQFTcJ610Jm/rpcBc/C2TFoIlilVEK+zrhwrCuDk1/tDGeO8tF6vBTmDGHqUEF6lj9mvxbHxoO1ANzlpRc5U9sYUR5dk92DJEWlvPPgwIWpLMlfGtZZ1drhmWSKVhY4Eyci1xiUgCiP9E7qObn+VQwAilJ5kATMgfuW8RUB1cYJ0T8S8dd+eDTTGqtArth+xcJpQbX7WPRo9l0wk/V1SMZ/XGLfna1MdCsJoITqmil3TXvREXlm6ebopvc5M2Ei00M1ned3qRQLRZAyJOLhcqMMXtLKxNN/BUJDujitD72DQcKfBVAv68Aypgx+BZSh28FvBlo/eXftJokMlQ6EOPrgqB0ykdOx4T33C1M/yTEIYg/Cuq0JyVbYjTe46WFDDT5cp+amBwXq2v3jlsdt367+lTqfn/VGO9B2J1ZwC+8aBxCp5Az/LLU9QG/eVrXBGbHlt9GAaDxgxvaZ04hKunrS7HgdZcpaKBB8U/162jeZGjfbZUr/MoEbTot1wvdbdEDOXU+AcFJbHzT+XJOLdLCX6Due5rgkExxK1GlSmc0cSeXdhsV3kzEPO0J1x0qy4njftbnsI2LlFk0haSPuTfOJUIAu3X5z82L5+5+F6GegmPCiczR26UH5qt11nWw/yga703Q0iw7A79BwQqPvqmzBJCqLkGvzwxTfWKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(31686004)(86362001)(2616005)(38100700002)(54906003)(316002)(508600001)(36756003)(186003)(8676002)(31696002)(2906002)(53546011)(5660300002)(4326008)(66476007)(6916009)(26005)(8936002)(7416002)(6486002)(83380400001)(66556008)(66946007)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pT+IS846h9LCaw31BEsz3+Oaq0MpIocrKjlUD8mce+p3x/7hGLLYN+PrJEJW?=
 =?us-ascii?Q?WRgAZjVCTb5TXVLvDQVDr4EtcKHXf62OLTVSff/Vbrm7G6roB4EQ7IQd7oTf?=
 =?us-ascii?Q?R/YDDq8K1pPVnQizySy+cxM82S5fLVSuHaqg+mACIjZCTHtXjfD+6SmOT3cP?=
 =?us-ascii?Q?4Ohw/+bSnL7bvduYw46tMdQe+3I5HtBek8ASx0hd6StSdjfUYU0Q30cI800O?=
 =?us-ascii?Q?dJ10iLXUvrIAsEP2npbNDwlUzMEYXc05hINfFezJMYHE+c0uSTDFshedZ8w/?=
 =?us-ascii?Q?4u4tzJhLf5uPmFbihLgFOKtBEWtmVP1feoJJ6fBYp0TH6ntfXbBb+uEE/lXO?=
 =?us-ascii?Q?vVlu5mD84jF0ULpF0veXMWgJby9rDUcGx6g+fk5cX5NO1rsSeVUjyLIAcq2c?=
 =?us-ascii?Q?mAfVcK+83pCiEaHZgYbOFmiuS8XSGzlSFxxrNLVdTdx0ls0fe/aQw5wPb7Dx?=
 =?us-ascii?Q?dO+L30FEzpFGPisC6ccVAGC3fjH0cqlIlFAcMubtexGPgkAdcHLGGUicn61/?=
 =?us-ascii?Q?n9+U2aj4UzdPet9HPlqdweBjVOx+9x54HpI3NdujEFZ0pBoEhGQSnS6X3tVf?=
 =?us-ascii?Q?5k82EbkgP/0PDXoDLdwu2YSMoTwfKDg/D6NzQdq5IRnvEH11aUEuxcVahL8A?=
 =?us-ascii?Q?oJp1MJBaHrFbsnMMkzmYC8/u/rFn4fDJBBwYcXNsoknEkBpAUnfZVTl5CtP+?=
 =?us-ascii?Q?xO/UIjkYzjzuJM8vwuuSEUr1CNMpIEoXOulafO+q9ELHf2V1mCV8QLl9cF1r?=
 =?us-ascii?Q?G4KFmvbx/A14gCZMCLjS0LA1xCDYdtTGtXVdwnM4ZL0dgIkGjaHybyx70XLg?=
 =?us-ascii?Q?N3mOb48vX5BZ+WfqPjjiJJQ0okzEDWRLp16RnIOXZPNG+8/j0CcLMmcMh9dy?=
 =?us-ascii?Q?vI63QQ0JmdI8vMIrij2RHps10QWXM8W8VqEP+loymi87Tz0o4DFXwgSErWNm?=
 =?us-ascii?Q?e0f8ByMJg7hB1+BMVIVApIJh0QfZdwraGInmlPLWqANfz0J9VuefWJctN4Vx?=
 =?us-ascii?Q?PvdJr/orW8asiNbRboIT1bZlntShe7pjUYEkMHTYHgcbcdNo67FRNcSPBnl6?=
 =?us-ascii?Q?X9k3/k0Ux70W0i8/GuZ6qaDhvQvguC81cnf1qPC9BJXkQCI2jirzf6VTu/ZH?=
 =?us-ascii?Q?oG++7IwPfZ1vivKQ6G4ChHO65CrVtf9Y6LgyBxqBhQagsXpMOUqcJx3FERDp?=
 =?us-ascii?Q?5NgvNAetQG5jtiPg0VbJ5nIo9tvoOiwptsxprzr6UkwuYvR+0rwzkc2GNh0/?=
 =?us-ascii?Q?yTS4wsd2upHwGSW/vDwdlxHeF81zJeELriP+X3Q//+j8tPImYDT8aNCmC8Js?=
 =?us-ascii?Q?DwcZI7yl+PlVVcDRmkgZF52KG4jkH4xIVjfjlnPWOSr4lVnLYK/L+PSRoO5c?=
 =?us-ascii?Q?aV4KDcwYBQfJIFT03QAKd2ylg6SM7k5ZvvAQqAgfhHzL/885kKKiEsKTrmph?=
 =?us-ascii?Q?4Lby3Vb4BD8NQWuzb3uG8BYqudisTMzikaAtMoN6Va7riIcpz2np+pAq2/bo?=
 =?us-ascii?Q?Pyd9R1HYYXPjuQaXIVRPgZiUy3Z4lHyRoQe8aZ+yuj9wQkVfbEM8/y0Wi+SR?=
 =?us-ascii?Q?CAkCqTHxc8fBANodBLyyLmWnwdCVkBp2ZDQrYU1ZBSLHXsJCpo7DP6R+JZGz?=
 =?us-ascii?Q?DkFXjCH0ehct1rraSvyzJxU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117a24a5-3cfe-43c9-5c94-08d9aaa65ff8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:16:20.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3xvkhBN7pA22RgL+2CschXbI21K9SOCYCXFcqmEDvIWNKxw7t2h8mxTMuM7YFs7Du+RmFWas6895Nqr6tvDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 18.11.2021 16:11, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 18.11.21 16:35, Jan Beulich wrote:
>> On 18.11.2021 15:14, Oleksandr Andrushchenko wrote:
>>> On 18.11.21 16:04, Roger Pau Monn=C3=A9 wrote:
>>>> Indeed. In the physdevop failure case this comes from an hypercall
>>>> context, so maybe you could do the mapping in place using hypercall
>>>> continuations if required. Not sure how complex that would be,
>>>> compared to just deferring to guest entry point and then dealing with
>>>> the possible cleanup on failure.
>>> This will solve one part of the equation:
>>>
>>> pci_physdev_op
>>>          pci_add_device
>>>              init_bars -> modify_bars -> defer_map -> raise_softirq(SCH=
EDULE_SOFTIRQ)
>>>          iommu_add_device <- FAILS
>>>          vpci_remove_device -> xfree(pdev->vpci)
>>>
>>> But what about the other one, e.g. vpci_process_pending is triggered in
>>> parallel with PCI device de-assign for example?
>> Well, that's again in hypercall context, so using hypercall continuation=
s
>> may again be an option. Of course at the point a de-assign is initiated,
>> you "only" need to drain requests (for that device, but that's unlikely
>> to be worthwhile optimizing for), while ensuring no new requests can be
>> issued. Again, for the device in question, but here this is relevant -
>> a flag may want setting to refuse all further requests. Or maybe the
>> register handling hooks may want tearing down before draining pending
>> BAR mapping requests; without the hooks in place no new such requests
>> can possibly appear.
> This can be probably even easier to solve as we were talking about
> pausing all vCPUs:

I have to admit I'm not sure. It might be easier, but it may also be
less desirable.

> void vpci_cancel_pending(const struct pci_dev *pdev)
> {
>  =C2=A0=C2=A0=C2=A0 struct domain *d =3D pdev->domain;
>  =C2=A0=C2=A0=C2=A0 struct vcpu *v;
>  =C2=A0=C2=A0=C2=A0 int rc;
>=20
>  =C2=A0=C2=A0=C2=A0 while ( (rc =3D domain_pause_except_self(d)) =3D=3D -=
ERESTART )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_relax();
>=20
>  =C2=A0=C2=A0=C2=A0 if ( rc )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_ERR
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Failed to pause vCPUs while canceling vPCI map/unmap for %pp =
%pd: %d\n",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &pdev->sbdf, pdev->domain, rc);
>=20
>  =C2=A0=C2=A0=C2=A0 for_each_vcpu ( d, v )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( v->vpci.map_pending && (=
v->vpci.pdev =3D=3D pdev) )
>=20
> This will prevent all vCPUs to run, but current, thus making it impossibl=
e
> to run vpci_process_pending in parallel with any hypercall.
> So, even without locking in vpci_process_pending the above should
> be enough.
> The only concern here is that domain_pause_except_self may return
> the error code we somehow need to handle...

Not just this. The -ERESTART handling isn't appropriate this way
either. For the moment I can't help thinking that draining would
be preferable over canceling.

Jan


