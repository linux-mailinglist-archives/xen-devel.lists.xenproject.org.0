Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFF41C4FA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 14:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199053.352874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZ6r-0005VI-N8; Wed, 29 Sep 2021 12:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199053.352874; Wed, 29 Sep 2021 12:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZ6r-0005TO-Jz; Wed, 29 Sep 2021 12:54:53 +0000
Received: by outflank-mailman (input) for mailman id 199053;
 Wed, 29 Sep 2021 12:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZ6q-0005TI-92
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 12:54:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 651d428e-b153-44db-a19c-e4c22b56cb6e;
 Wed, 29 Sep 2021 12:54:51 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-b10iZLWqN8Oio8cmDRAMaQ-1; Wed, 29 Sep 2021 14:54:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 12:54:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 12:54:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0057.eurprd06.prod.outlook.com (2603:10a6:20b:463::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 12:54:44 +0000
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
X-Inumbo-ID: 651d428e-b153-44db-a19c-e4c22b56cb6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632920090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6lQRwJmICDJFvYRvRneNnb78+i48pz1dYJPNPoVD/8=;
	b=O+V6IeFhezD1GjtRIPE/+/R1YWBDDXU7CNzhdN4InSE6dCLH3PHkiLbSX/xgZ7Ybs3MLAO
	xNYaAjAJennWowMHEj0Gyf/22iqSUl8rFCNczKmCgEO+7hJMFMokKXz0j5/E+Lyty4hrWQ
	c0UK6KxGKWm9rvoFZfnn9fHnIAuDXT4=
X-MC-Unique: b10iZLWqN8Oio8cmDRAMaQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6Bwsd/mSFzMf7ppUv81MDqILPDrz/JiRpfZfNA/bKJlEn3gLKLLM3RXZJ5wfrL2arX/PbZxqL3uk2BfEjA+6bXZr+rjiu9ZEp4NNIozEoyXuV55LATh2GWxIMe89eT32D82b8aXp7nkv3dBa0ih7MunXLa+iCHH97KfLoON5RKgHy2a44ZvwDA2IkWA3KRFph1qpqJ3oMjePDmHWvZ99vPqhjQ74rmFmyqHoHB6M/8autoI5LZ9aZMyOS9VRurs0VDL6+kIOgbwDGdK/dCFEFPL0GJEiv1xZbsDjawkiUM8xWHpf2rQBj98Pi3jOLfXuvV248aqH1pqxlCZ0EWAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R/QiLLZSov1Cp8mTGsC2wZm/hqDv/QWpizr2+S/QJ4U=;
 b=TVf5Dg5uiWtRKtoxd9OkEhiCr3avl+p6llWQPo0zuNkgxlsmqO9qDEouabnuN+vnCE9mbWCuNO8G6RbANnRr+5wm871NVy3imJq7QIsNymeKcs9avWmoSJw6U5cnZ0MTjoNFrzG8/GJcFpV1JDzeo/89L5jL7yHz5tTExbo2YubHeYlT3boaUheeEt2wWUZ5TiNew9WDRQPs7AxklcBltvEc/7oo+y0BKryPuIseZThlIXQNSsQcNX9qQpqO8pyhHx39cvUDeEMHcxvrHgreYbQNOz6XjfXDbKqZ/ZZYEd3qFtvl9zHCSW4z637uHO58d41FP6d8v0iav9cMmr9hxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
 <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
Date: Wed, 29 Sep 2021 14:54:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0057.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ea754f-a4bf-4dab-73e2-08d983485004
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351685D5C24D43CA5615D7BB3A99@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJl3IVsadClgSpnIYDX05zD3rZRMPtaxgCfCxPjZf3U6ivlr5BSF5ZCnvr3/+2Di9e6pv7p6Mf7qGOP4vxu3bdCbYA5HGxL00p1njVWumCvbbihf/lmXted1l0UXa5lhlI9o4Q2YgORIm4SUR5LB+nbXa5qnRtNyqzSIfRZHw3a9vgWqSl6ONH5j1hHOjfSYpLoPWrZeiS/k90y/icLl9lraptL4PED3caaWpaxWCSVNCDbHT7UOv/UHDtY6Pumgq/3P1RKX1LbodsIzKoGl6XDG8fTQr2JCuOaG+arrTn317I8NAbr02mAiOiNFaj481t6PKJJ1k07DVG73dQqb4qTzWlzsLr92ZT2bn1QMh+9CBSI4O5k3xfPz987uRCdgOoNZeuLldhQbTyYGHRvcRMqnpRHuCxlPqRbHoaEV9cTKUz714cDnDNuqArmlUaRkZbb0LdwaKNs6fiTZoEgmVuQ6yYdKhJtT9naWQwK0ZQqOGeaP0APFawcBbsoaS9lQaLh2npFf3rJR23l5ikuaBej19pcP9cu/QsdSgJ2/DsvKq/QGOZ4LgZfgkwpLTXhBCTYmjWOYM6TZGk8Zd+gn9sMVMlTsD3XZG7Vyx94RJxrRVkANQXSI/4R0CD767+yvoIcKceDKx/TbL+H0wIzvSbnRjLKusam/rc4XaCBvlOdiHtb5nhAyLdxuAyxK8uUYQGjxjQR6HSJ46sQSWow+IHBGH7P9Fvb86FXFftkpvRSVkAWW/VnVHIwJEa/9KQvI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6916009)(53546011)(4326008)(5660300002)(38100700002)(186003)(508600001)(36756003)(66946007)(8676002)(31696002)(2616005)(7416002)(66476007)(66556008)(2906002)(956004)(316002)(54906003)(16576012)(26005)(6486002)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hiokbUgcWSzDQncClePIqz9afOPrG0b2w0y+2zq2Ww6tFrsGMIbEhPBZHl3O?=
 =?us-ascii?Q?Uf+ObDQEv3h1BDnMwke6Lsu14iszYaMckJKG2UMpjjqvJOG9WTNnuwRaKgh9?=
 =?us-ascii?Q?gUJcQM//4GMTlfN0IooNIxtRcPSNriAzAB3zGu6CplAgHsdyg9wk0x7smROo?=
 =?us-ascii?Q?XCnmakp+dLItrvwo6XTCP887JKTtoiV0+ybo9OQ67vcNcy/ITfsoMnmUTg+O?=
 =?us-ascii?Q?lMs0/k6ECHNgSFN8RMKm/d7Xp8UemODsSxPdoL7e3mDJuFQSuyyidpTaju1N?=
 =?us-ascii?Q?/NA7gM/beT9MTS6LxDKvOhIpJfgHCHnvdsJ+XMYMX1QJFo26mRNNCZvR16c3?=
 =?us-ascii?Q?wlLpB0JSpZyKdzyqLeRK8ZzzPIEoMfYREiAjjQkA+mBBvoqQnmNMqAhZfn//?=
 =?us-ascii?Q?4jv8xFmFMc+2n1Y5yM9IxBPmwbIGTvHjSaWuyWxps4St3lbh8qDBIERPZ3uT?=
 =?us-ascii?Q?SjpayfSDoMOXctuhvWWu7FPOercgVyYpmFIJXceI9SBGCH36mjRCtIW34599?=
 =?us-ascii?Q?LgiKDf+ZYgkMoLoS+EIijRJ5uTdiUEPJzLc8Dkb2oWE/v5cQMrH7/ZHdvYEx?=
 =?us-ascii?Q?fN+1bGvLvePpcugujuq/gF0SMpK6YqzO3+ZJSA/Sz2uu3EykCoV6lc6DVyna?=
 =?us-ascii?Q?h7GZKtdmMgDeY9dyyKlXoqAumyuyaMH0mNdWxRoiJKCMd87X5a7XKFfA1UUJ?=
 =?us-ascii?Q?ry/sF1f6SbzCkEzOsCcDFOptueb2qrV7qz7VR9L25pG0dK5WFwXtc/KnQDze?=
 =?us-ascii?Q?6kUsJG2YGJS6Jro4n3/P/7ux+mK7hu/8n9cx3pWU6+kJIKyvc9Y8IMalYaRV?=
 =?us-ascii?Q?/LJxc1tVP9BFOhyw02CiZUHf2y8SpLE6yrsaZtpbxbVuRzReJE6rs67TYNFx?=
 =?us-ascii?Q?KeoJQmhqOI8fYIV2Mso08Blo9OeMcWXSgg+Ij9WSVwOHu9cEFPvf7/p1nVxC?=
 =?us-ascii?Q?8kA5pr+8LBPgAnxY9x54zRGylSxJQZNU2B61caUAG2mFJGMzeGJ+MX63Jzxq?=
 =?us-ascii?Q?ZNL+Tmb0ED2HbPiz/ES8JFVzelTCt3z+rDnPfW2OeMKmZTS/vzijwScNlQ2U?=
 =?us-ascii?Q?hGtlSeqENL1zbhG0oDJLO5DEVDz94bA76YuOwXb+zQK52AHjJziODAYAnR42?=
 =?us-ascii?Q?RfSg/QL/ebF4lFwYJ/IsTkKEs0wgwQgYd/gOJiJkJDEw7HGcI31B7T+8/zHR?=
 =?us-ascii?Q?FysilX6MuwCZOBfY3dC/OIaDH5qCxNs8/Tyg7HRn+teje8l57I+kJxPC50V7?=
 =?us-ascii?Q?IbYkwvdlCbtZClKKgatP3dBcjnvWLCIcXyouFPooeYk5/sXWrg4dEE1lGD/6?=
 =?us-ascii?Q?r/i8Z620if22a8qd6gEqeUif?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ea754f-a4bf-4dab-73e2-08d983485004
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 12:54:45.3778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJeysp1j+dxIFyRLLqnAyTNGIVQ0jkHN0g7J/6okIDg3nF54dGERYgPkreJZEToudeoY1OVCmicQ0D++NqNV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 29.09.2021 13:56, Oleksandr Andrushchenko wrote:
>=20
> On 29.09.21 12:09, Jan Beulich wrote:
>> On 29.09.2021 11:03, Oleksandr Andrushchenko wrote:
>>> Sorry for top posting, but this is a general question on this patch/fun=
ctionality.
>>>
>>> Do you see we need to gate all this with CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> as this renders in somewhat dead code for x86 for now? I do think this =
still
>>> needs to be in the common code though.
>> I agree it wants to live in common code, but I'd still like the code to
>> not bloat x86 binaries. Hence yes, I think there want to be
>> "if ( !IS_ENABLED() )" early bailout paths or, whenever this isn't
>> possible without breaking the build, respective #ifdef-s.
>=20
> Then it needs to be defined as (xen/drivers/Kconfig):
>=20
> config HAS_VPCI_GUEST_SUPPORT
>  =C2=A0=C2=A0=C2=A0 # vPCI guest support is only enabled for Arm now
>  =C2=A0=C2=A0=C2=A0 def_bool y if ARM
>  =C2=A0=C2=A0=C2=A0 depends on HAS_VPCI
>=20
> Because it needs to be defined as "y" for Arm with vPCI support.
>=20
> Otherwise it breaks the PCI passthrough feature, e.g. it compiles,
>=20
> but the resulting binary behaves wrong.
>=20
> Do you see this as an acceptable solution?

Like all (or at least the majority) of other HAS_*, it ought to be
"select"-ed (by arm/Kconfig). Is there a reason this isn't possible?
(I don't mind the "depends on", as long as it's clear that it exists
solely to allow kconfig to warn about bogus "select"s.)

Jan


