Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1D63DAEA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450006.707106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Q9p-0007sV-B2; Wed, 30 Nov 2022 16:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450006.707106; Wed, 30 Nov 2022 16:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Q9p-0007qb-6r; Wed, 30 Nov 2022 16:42:01 +0000
Received: by outflank-mailman (input) for mailman id 450006;
 Wed, 30 Nov 2022 16:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0Q9n-0007qV-2a
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:41:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e82e81-70cd-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:41:58 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB5PR08MB10255.eurprd08.prod.outlook.com (2603:10a6:10:4a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 16:41:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 16:41:56 +0000
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
X-Inumbo-ID: e7e82e81-70cd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI22q9HUpJ2FWnmifpt5/qV0DX+dGluLMnNza9xxyXgs9K2AWm3Xjyhh5BmMgECSSjFbM3Ob6QMfmGq3o1to3iAEM7YB+gue0eayCsuGVGEPzntjScwac9b6uOdAt0zwJU2I1ftiVgIufHYMs7lluaAwkBCsnu4JvKqZucpxzKgXGrcQY8uJ+Ohb9/KtAH+2QAvdeJhDLVuXNfjmRoLFOXI5CIeALtCnjyWgMYCLpcm/GhaRkYyyq7HTgqQZ5FpJ9r+XqgN/R7kswrSY2E3Du06MThHNo7Z2UT3Auth8fg3E+w/HPcvhgI3gI+FtiC+VHhkpTv92oD/UDPkHG4DytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7E+yrdO2pVsYu+qCoQa2KfdQIXmZQ0ArivRQAXTY/s=;
 b=C1rxVXmIfEV7gcb4Zo4Ypy8j0fajo5DDl19i5y0dKD1HKTUmZza6rZ3ziB0CE0pMUpVycL3zpKGvt5gLTFBAGKfQnV1oLU8ZDfDGgaYE+ULMoHFI7MFOBMH3o3A3zkuuxa7lw2oblU8jwz2vlsrU+QjADmIo/iW6BaKjlV4jB1UlbQFiVg07HuVD338+V6JmIEuMBfbFLHguz4aJR9r48+SDevKshAvQwKavJutZGZNwVY0jicsdEsiQIx9Wkvu7TLoxjeJ8QGt7WmgXXOEXBi+BZhCLOpMNHejU2wNc9CQEDJhM9ynFpJBc6JTaj0IS5576hFVsVpaLb6F8uaz6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7E+yrdO2pVsYu+qCoQa2KfdQIXmZQ0ArivRQAXTY/s=;
 b=EN5eqdVlc/mIaOiZHwC4MvtqU87b0GOqcyVJrx6sPx1hPQJBndLCPPTjPTvxML4R+LxCyHRK+1jPFmfhNU0aPKVyz0QlKFFo2vxR+izYkbanJw0uWC8+9tg83kAxumNhPZKPjD6uwoC/qahNpHiOphnup7zMyPVV0eXSRBSWqgw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Topic: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Index: AQHZBLWFmb3GO0y8oEy6bIpMhPppa65XpzsAgAAEqYA=
Date: Wed, 30 Nov 2022 16:41:56 +0000
Message-ID: <67AC127C-F59E-49ED-8C45-4615208EC1F4@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
 <Y4eD6r0zWVp3Upr2@perard.uk.xensource.com>
In-Reply-To: <Y4eD6r0zWVp3Upr2@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|DB5PR08MB10255:EE_
x-ms-office365-filtering-correlation-id: aaa72f0c-c8e0-41d5-9956-08dad2f1cb2d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 psawSKQQQ2lMO2dq0hRs+wccZY6K07afrhMfcEkFIIAoWjg/jYdPkr4HECUZJioiCJLsY+7bIZ85HNEI40Ea9xod/qpLxBz6BGofAD9At7zBa5e2sxnnTjttcBa2ntcAMqc8xKifcc8+fR56b1rzeH75C9OeSRN/51m/MeINI5+wDWqUapZx22tpa1+Jmh4w4ysAMCCngkX4q3oIErsUMlTwztM3pe0JNq55pIbFy3o5/R69bQ/+MzIgwumzY3i5Uxtq3IEGpocmdagQI+7vp1N5HFFCFeB7s5dPzR7bCVX8KkVZfpRBXZ7GP5iJLTVvNNk3VEetWTiP5LpGVOR6EYH8sItUGKmaPGKATe+3Q9GBsoRG99FLp5CKhu97V8XpxeEGm783NELJa3aGobAxzAEHd3Ho9O1iEkRxcxPPjwznFE9VesWCZ5pRgxEss6jMWFJNi4V8c2VvysjPahsUUz+IZlfkeA5xhr8TUfGXwFXs0ou+t1yjMSjwXNyTdRk6yOQo6saGMqq4xTyAEVz/nrPrbClmEvMBj9TL9/SypH62Z0Dspirmkg8/nY6GWPptrxjxBn6TLP3xwAMjFTpLXluKgVtaioTawbkqMXrngcrzyvFSguZCs2QrKMPIDfEpZwxyZf/hezjgOGLeYrfEL3wjCfx8DbWy52Mjnvr/cPsVAwfOIYK9OGbzu2tnbLKgdhQtyahb8zdie+zB3l/GTomMO1qUSU06+ihickUZIRI9jN1ppmXh1EgtEJoj+9vK/k/70zOxC0otmMEyas1EPA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(2616005)(84970400001)(2906002)(83380400001)(38100700002)(41300700001)(91956017)(76116006)(8676002)(66446008)(66946007)(66556008)(6512007)(66476007)(33656002)(64756008)(26005)(53546011)(6506007)(478600001)(71200400001)(122000001)(6486002)(36756003)(186003)(5660300002)(8936002)(4326008)(316002)(86362001)(54906003)(38070700005)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?a6MZ2EAfl+eqTM1Fk5I198EcH+rwa/gDX0PNQ7FUEnuPbMK88fNh9zsKsFIT?=
 =?us-ascii?Q?bABwyZ4RcXLrJ0C81lrsIIEHtp5KLCtmcADmL08PJIcmzXhURTccySRSBGNT?=
 =?us-ascii?Q?Y63/mnybT68g3n1zvlVFHUUICb+xquv4XMsvAKBeJtykuJOMJ0jUeJlKuKYe?=
 =?us-ascii?Q?c0OYySy4A46Jb1a/Yte0J8fDUKVPRNKvjYEb4YxfQGE8jG62KkYo40n7FFm1?=
 =?us-ascii?Q?5IMRyOxvpPdd2UfdYlZHGz9FVbECiTjFm9mMarHGzckI8IUGeZCp5ijrG0+m?=
 =?us-ascii?Q?3ADO3gul4DH18V3jfFsBWTZasVRS3iF8pxl8E765bolQeGKuuqrzBmgJR/rm?=
 =?us-ascii?Q?PhQur/MwUA659uhc9i2vRzWvymNMh1QxLoNtH7B/ymzFT8sM5Tj8LSFHC1nj?=
 =?us-ascii?Q?NdGcIxkBs3BJSo2IqS585ZJlOrgN7FyEcRJ4DB/+z3wF4+cLsyezNMmATnho?=
 =?us-ascii?Q?C/pP3d6gGa/gXMh/h8F327/nGP2F1ME2vEppqdz9C0EHzsWGhusYEWZNHZYV?=
 =?us-ascii?Q?b5TVaAv4qloq11gs3mepN8pAfK6nCxbgv7rLf2WNaooWWG8+zYg1XZDh4c6i?=
 =?us-ascii?Q?H7L+x8Y11l/YL/MekOpVYqH++5yauDkIulMhonlbKQCDcM/a6FvhSROBWVR9?=
 =?us-ascii?Q?z3W/ja6Sgw9/eLXDOohdD8RTdoP4S+0NW0USyX4Xk4Fz/r5OUo9k8tSfMkVh?=
 =?us-ascii?Q?n26T3mfQzavB+MPbJkbewHCPFfDWlDz/B4ep8dW7T32IGgng0qJ8ka8s5v/b?=
 =?us-ascii?Q?Lhh+rANi8Bzz8z9P4w7i0UA/mmY2MSjvKPRJoeCJYk48BC3tabm26whbMpj/?=
 =?us-ascii?Q?hCcmF0dREGFowDBlJ0T2M+EddQXZeRRun/tBwbQezPpcZVNTKsdIhcom906P?=
 =?us-ascii?Q?5BUGu5+PPDa/Py36VR7P/cgD6Gad3RDk064wuLiMbR0+/1PFSeDIJKjGYGRd?=
 =?us-ascii?Q?C8PLCOaBw51l6LTGf9OEKWOYIw6vVKgfn8FSFHqT0dcA2P5b98o1y3f3tLV3?=
 =?us-ascii?Q?REaByjX718D0CHPNIr5UqGKh7vcfhZEAHsd29j1PjXYE+lI9tU/2eQiT12Cv?=
 =?us-ascii?Q?rjl2HzAmBoETVYk0HW5n+Xz6Aed7CEYihDTRYJzGjt40zAbjHhzTOAX8sU68?=
 =?us-ascii?Q?tTpN7fK8H+pDpKOdq3tH0ytj0+PnkFvCPXphWQCmHm8o4ijqHNjotz/3cpQF?=
 =?us-ascii?Q?WCvVtSCam5nE+0cr412pQs/8hoBhFBLtdovztTv2T9VPtl9VdB20ch/vlYzq?=
 =?us-ascii?Q?+lUjASp8MjVNZ0hunHqtR65RMYNufBuAYv3UC5YhuDzz5AJDCgly8VqUIB29?=
 =?us-ascii?Q?i2aTCuQ9t7VOWwxil4Oveg0cSWd0I8RPU66ikiHXvc9xgMHyAj+TYTe3dk2j?=
 =?us-ascii?Q?CY89J3P93LQXbftOcNswUbsFlgv7EtXu5rvnQGnKJOwNOxyWDk7/Q8YaNg7U?=
 =?us-ascii?Q?1HNMggVpoWZrkSuXVsd0lB8AOdrl5X4Y/2MT9D1sWb/iKf183II3c1fKJSA/?=
 =?us-ascii?Q?8FmKcLuwqPTqq6ruQLl1+EeRw9wVvNfmjIvtiZGnbqStsuqW4XR+anuIRr5x?=
 =?us-ascii?Q?E/BLCV85IIb2EAcuAq3ofObivk3SIGxTLVR+ompx7QzFVc0mS0jHshtGOZ2E?=
 =?us-ascii?Q?NA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7EB2A28BFDF6FB4DA7715BBF61071D12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa72f0c-c8e0-41d5-9956-08dad2f1cb2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 16:41:56.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJlOHReFqRSSDJ20bnoNHswoRi9RongsKeVeQr8W8mGpJ0MmrohCexXGzficmm29gA5izpQVSwWgAyg5agyz5P2ciEOXwRGPI3niOaojooE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10255

Hi Anthony,

> On 30 Nov 2022, at 16:25, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> On Wed, Nov 30, 2022 at 12:15:07PM +0000, Bertrand Marquis wrote:
>> diff --git a/automation/build/Makefile b/automation/build/Makefile
>> index a4b2b85178cf..72a5335baec1 100644
>> --- a/automation/build/Makefile
>> +++ b/automation/build/Makefile
>> @@ -1,13 +1,18 @@
>>=20
>> # the base of where these containers will appear
>> REGISTRY :=3D registry.gitlab.com/xen-project/xen
>> -CONTAINERS =3D $(subst .dockerfile,,$(wildcard */*.dockerfile))
>> +CONTAINERS =3D $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*=
.dockerfile)))
>=20
> Nit: while there, could you use ":=3D" instead of "=3D" ? The value of
> CONTAINERS is always going to be evaluated by make because it's used as
> a prerequisite of "all", so we can at least tell make to evaluate the
> value right away.

Will do

>=20
>> +CONTAINERS_EXTRA =3D
>> DOCKER_CMD ?=3D docker
>>=20
>> +include yocto/yocto.inc
>> +
>> help:
>> 	@echo "Builds containers for building Xen based on different distros"
>> 	@echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>> 	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
>> +	@echo "Extra containers (not built using make all):"
>> +	@$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>=20
> I wonder why the help syntax uses both ${} and $() for make variables, is
> it to confuse people? :-)
>=20
> You can write $(file) instead of ${file}, I think this would be less
> confusing. I rarely see ${} been used in make, so seen ${} can be
> confusing. I've learned (relearned?) this alternative syntax only a few
> weeks ago as it's used by automake or autoconf.

Definitely a typo, I will fix that in v6 (you have good eyes)

>=20
>> 	@echo "To push container builds, set the env var PUSH"
>>=20
>> %: %.dockerfile ## Builds containers
>> @@ -16,5 +21,10 @@ help:
>> 		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>> 	fi
>>=20
>> -.PHONY: all
>> +.PHONY: all clean
>> all: $(CONTAINERS)
>> +
>> +# Remove generated dockerfiles for yocto
>> +clean:
>> +	rm -f yocto/*.dockerfiles
>=20
> There's an extra 's', I guess you want to remove "*.dockerfile" instead
> of "*.dockerfiles".

Ack

>=20
> You could also add those to a .gitignore, even if there are likely to be
> removed by make.

Sure

Thanks for the review
Bertrand

>=20
>=20
> Cheers,
>=20
> --=20
> Anthony PERARD


