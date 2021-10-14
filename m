Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C0E42DFFD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 19:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209531.366022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4Lu-00082q-Vj; Thu, 14 Oct 2021 17:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209531.366022; Thu, 14 Oct 2021 17:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4Lu-000811-RG; Thu, 14 Oct 2021 17:17:10 +0000
Received: by outflank-mailman (input) for mailman id 209531;
 Thu, 14 Oct 2021 17:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mb4Lt-00080v-AK
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 17:17:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f294c3bb-be5a-4641-ad18-f0cfebacf4d2;
 Thu, 14 Oct 2021 17:17:07 +0000 (UTC)
Received: from AM6PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:20b:6e::22)
 by PAXPR08MB6558.eurprd08.prod.outlook.com (2603:10a6:102:151::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 17:17:03 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::a) by AM6PR02CA0009.outlook.office365.com
 (2603:10a6:20b:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 17:17:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 17:17:03 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Thu, 14 Oct 2021 17:17:02 +0000
Received: from 15b934ca11ec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4FBD704-2403-4376-8D0F-6EBFB79A1DB8.1; 
 Thu, 14 Oct 2021 17:16:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15b934ca11ec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 17:16:52 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB5964.eurprd08.prod.outlook.com (2603:10a6:10:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Thu, 14 Oct
 2021 17:16:49 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 17:16:49 +0000
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
X-Inumbo-ID: f294c3bb-be5a-4641-ad18-f0cfebacf4d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PEFSmnXKbM2ASjGXD+a4EcDbofFNB851yvFrkyBjOw=;
 b=AiGFM0IP5MSB0LoGdnJSnwn4Dej4BnRMmHhYrbJT5AroiLMZODruIbPbMV8dbraDoqNnlaKlx5pzhzG9TzZ0srpLZ77luuxz8uOKjs9d/zbQBYNNzN5vPyyLIptAWgf/LaDuibpDkzwhHOSIfXEzekEWFRrw00jsu85vt0rorx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90775082a3286655
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYJKfRX9XqICC5ZNhHHXhL9fNdZOpYEdQN28mSi/tdEqJcWo+A8L3kt6oAjN3RpvtjBHTcEeFx7k6HwBjNxMZ1zpK5AU9psBlKiH5OC6GVjXYQhx3kvKxLx3EG/3AuhhJF9ig+nXb8La2++Tlh0gM03exKjGUDy3nvoFVmZg0xb8IQTSUrDLt5Ov6IaUc33bsqjZUBRsN+T6iyJVmTSPgCK2/MJhRehTC7L3Od+cnMyTUy/apv/0X6CqrR+D5KOjRyZ6tLg58VPGSmitadZaBdNSPhyiQrWlVSbh8cZv+jKt/pQnhreZqHQQnvTbef2LcRGAMpr1o36PXTqx4NDclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PEFSmnXKbM2ASjGXD+a4EcDbofFNB851yvFrkyBjOw=;
 b=KgyP+4Yluds7/a92yry6HOdsB0tEYlw4ZEqfRMqBChxAA8oeME4CwNwfF0tXC8ceFViWg0CB5xytoxJjsupDH+Rk5vZ/VJKep+soTlp3gWoo4w4H8qfR6r8VArC+GD4ul8Ruf9gOjETRf+xjijy8erKQz17yFPhPtMOsJTBrIE6Jaa9yj5hnC9UrgJ+zjlk/Hzt61cCAKZCTYM3JB/cR1QoTuotUiOotW95Sl2TFi2lgxzj2bM0ndR3IBL6yJg+fxkwi1iSzrOeBel7u0UTSOSty7gaCM3VNvZLLv28Lrzp/AM74xiohax87YJUrHhombor1HxzHRR7/A8X7Pf0Uew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PEFSmnXKbM2ASjGXD+a4EcDbofFNB851yvFrkyBjOw=;
 b=AiGFM0IP5MSB0LoGdnJSnwn4Dej4BnRMmHhYrbJT5AroiLMZODruIbPbMV8dbraDoqNnlaKlx5pzhzG9TzZ0srpLZ77luuxz8uOKjs9d/zbQBYNNzN5vPyyLIptAWgf/LaDuibpDkzwhHOSIfXEzekEWFRrw00jsu85vt0rorx4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXutl6ulaF6M0fM0eW19BgA1BbHavGQpyAgAEa5QCAAE0egIAAC7yAgAsSfAA=
Date: Thu, 14 Oct 2021 17:16:49 +0000
Message-ID: <8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
 <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com>
In-Reply-To: <24927.7235.736221.270358@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 40c99755-c85e-4599-6a50-08d98f3670d6
x-ms-traffictypediagnostic: DBBPR08MB5964:|PAXPR08MB6558:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB65580A799B30BAD4E473EBDB9DB89@PAXPR08MB6558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s6IyIYRcPfN9MCH0sRGGaVhOE4vYxpxTvTzaRJisFZbeeb5iBXyVXlaRbQ1W4BXs+oYOAUkypwb12WFgbGgmh0sqMZ4S6RivG6FCuaAz2ahMVPkCfwlSAcbSOq0p+ieNdrf1LQCq1VLMu86l6I5xrNruaW3XzF/bytNGXqaQygvNIA8Et4lf005S3CZzB1Ujgy/eybQmmSdz6gdCFdzXZFc/+vfHCBa47+iqxkf7GupOvuFSGbXV7syJYAhcXe1gSkMgylvV5Pwi4TFuvAnbWCaloYvvwz6Xk0Z3qWXVwsJQSqtUm800VXVoPqTSjsKyiFYis+W3viXBO3nAcRDjcSp6pLb49U+BBU4ifaG2UyMI+N/nVLlMJs8hLXSacQXGdq5qOEA0fofckKOMCN+HxTJbP0kibxCJhU0R9Xp20YJG+e5VmoX6nwT2B1GoT0iCT2+Qqh9GqZS8t/SF3+xB5bbeyl4C4uO94C+V/6czSqAq0IPOFP0EASneR8qHbHEu9/ixc4FCZLhbnfXBP30fiOKLGJzBVHQl2RPJpOubhd62kZcC+mRq7JfDFNGZ2pVOHPUB5CrdN+dhzq7UmR+a0lOH6GKNOy4yK/Sx+d2++/GxiXY2b2x9yBU1wM0b2qcOP7cKskGEXHAjxKlWDS16pMdUwhU/CzT0Ha4juuhiNXbsZmuG17rk04/QXXVyrPScA/ixOSe/mkqr4O5xSprgx7vs302la8ejdBy2dqqrFW80QHLzB1m73bwxO7iVNPFG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(53546011)(8676002)(54906003)(4326008)(2906002)(316002)(6916009)(33656002)(86362001)(38100700002)(8936002)(38070700005)(6506007)(66446008)(26005)(66476007)(186003)(5660300002)(64756008)(66556008)(6512007)(66946007)(508600001)(6486002)(83380400001)(122000001)(71200400001)(76116006)(2616005)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B35C0DD0E9908944AAA22077CA50055D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5964
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c0dc025-a473-4bde-8822-08d98f3668bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CEy9zSmwoPXvlcjQ08fYb0zO40lguEyPPDX2U0ISJq4V/5gSqEVF6hhIRzkC0l4zqvqC5fArzsI3m7s8MmLgr8rhQLQ+sy6FwYjaE5fEdbBpGliAYIFh4AdYprOcox+2yN8vK3cHWdAuiQkP8Ai84/U5SYhH2dhtiPKwEUzjZc1fCDH4Zm31kByklVi0eKHKg6rgjNTzma5qizX1uQkVaYWw7NmIzFYrwoIfxnvqfJR4KroE4/C7xCKGGoTxj3snzZ6Ac4IIZ5X4c1q4zDrc26f9OBYSLuuY0EmfJomm+batdFvJndc7EcvyGdc8naoYyOE8zYe8KeOWe+VzqpNyq3qHlStbIQUuJ+UzMrRVp3fr7QSemPQGj1xqx3OMxIVIOcqYX3dNlr3BV8okV9eIJK6QqJhpGU9paK0erieuBKIRUyEa3tcVdBtBG5YNMZiIyMS1oUh+gAJCm7JlLoEvGMPl1LG8eT738jp0S0PDp4+Ky6KJtui/pPpDPhScVndGWhLWEdgYmvcT/9yGkFZnZoEdAj27veH/Gpp9Ie5dzUllsl6NDQDGRjPV7170Qg483vR5uFebZerUukLutC62HWmw5TVU1XyB4glV7ft2VD1tpCCFnshJR1n7tty9tV4i7fXRbgy1auQdiMLHBA7kbqKR7SpBI9YGji23DJ5pU32uzAU1xeVNIx7+aE1CO6fm6TQ9bz/ugCH49TJpVe5iEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(86362001)(33656002)(36860700001)(26005)(54906003)(6512007)(82310400003)(186003)(316002)(6506007)(8936002)(508600001)(53546011)(81166007)(70586007)(70206006)(336012)(5660300002)(8676002)(6862004)(47076005)(4326008)(2906002)(6486002)(356005)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:17:03.2642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c99755-c85e-4599-6a50-08d98f3670d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6558

Hi Ian,

> On 7 Oct 2021, at 17:11, Ian Jackson <iwj@xenproject.org> wrote:
>=20
> Rahul Singh writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device =
tree node in libxl"):
>> As Stefano suggested in another email that we can remove the vpci
>> option, if we reach to conclusion that we need vpci option I will
>> move it to internal structure.
> ...
>> Yes I agree with you VPCI is necessary for hot plugged PCI device
>> and once we implement the hotplug in future we will use the
>> passthrough=3D option to enable VPCI.
>=20
> So, to summarise, I think the situation is:
>=20
> * VCPI is necessry for passthrough on ARM, whether coldplug or
>   hotplug.  It's part of the way that PCI-PT works on ARM.
>=20
> * Hotplug is not yet implemented.
>=20
> * VPCI is not necessary on x86 (evidently, since we don't have it
>   there but we do have passthrough).
>=20
> So when hotplug is added, vpci will need to be turned on when
> passthrough=3Dyes is selected.  I don't fully understand the other
> possible values for passthrough=3D but maybe we can defer the question
> of whether they apply to ARM ?
>=20
> I think that means that yes, this should be an internal variable.
> Probably in libxl__domain_create_state.  We don't currently arrange to
> elide arch-specific state in there, so perhaps it's fine just to
> invent a member called `arm_vpci`.
>=20
> Maybe you could leave a comment somewhere so that if and when PCI PT
> hotplug is implemented for ARM, the implementor remembers to wire this
> up.

Sorry for missing this on the v6 serie.

Now you suggest to add a new field arm_vpci in libxl__domain_create_state.

Once we have done that I will need to access this structure to know if I ne=
ed
to add the DT part and somehow to give it a value depending something which
for now would the number of pcidevs as there will be no user parameter anym=
ore.

I had quite an understanding of the solution using libxl_domain_config and =
changing
The arguments of libxl__arch_domain_init_hw_description and libxl__prepare_=
dtb
Suggested by Stefano but I am a bit lost in this solution.

The following might be a stupid question but I did not dig a lot in libxl s=
o:
If we add a parameter in the state structure how should we access it ?

Thank
Bertrand



>=20
> Ian.


