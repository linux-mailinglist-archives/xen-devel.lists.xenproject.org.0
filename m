Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC7264088B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452050.709868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p178e-0003K0-2A; Fri, 02 Dec 2022 14:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452050.709868; Fri, 02 Dec 2022 14:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p178d-0003HK-UX; Fri, 02 Dec 2022 14:35:39 +0000
Received: by outflank-mailman (input) for mailman id 452050;
 Fri, 02 Dec 2022 14:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Q3E=4A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p178b-0003HB-VV
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:35:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bdf5e4-724e-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 15:35:35 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9083.eurprd08.prod.outlook.com (2603:10a6:102:325::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 14:35:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 14:35:28 +0000
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
X-Inumbo-ID: 94bdf5e4-724e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klrFdnOl2SHTEvfkLgS0SG8dVAO2cVJ2AIcahlHZ7lLXpbIpooXV5guWvQJjNrZ7HO2L7RPsKxLoe2hobz3ip18C/DW5tr+WuwdGmV4BcwZb93VJK6KoSdUfCE4mckXCl5eokSxP3UUuGLVC2I2ke7x0WVx7bZw+XTYRFnej7+ToMLWcl5GAtE9xw//T8vFZJq1vE8bcHKtxtt9CoJ2HG9AzM+iKL9D2hwhWwllO6KBC1QfOqLMm3NfoZw6VMWT/hBAEFi3xjLMfie/RnKMj5osqqTWjYGY8HA7aoPRFuKtn4RV72WlJDBzG/uHcEftpQIy438TGbkreOAVoXhyw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEitq+3J++stQzZU/YHdTz1CUgH1nDajj21rY5JwkRE=;
 b=iACV1egD1NVk0WbXRzMUaohyDkb+Q1CyuVhqzmi+6lgUwNI4gz45xBj95skJdawygFUeSqECKSCrKy2yY+mqfNCKcmbALyE4PZ/SM8beQTUTFZdbfj7zVpIfNhqN68LoPMJcy0bvCilH5RIJt8+DW6vsEB7wa5DvG8kIu6ZRu52VOA6s2fFbF4AGKkk4E7fsYjUhnhCZtQZ8NyQ6Q/AjNZa38ki83lTy1RNOLWHtPiNxVj9vk7ba7ThTWHGS6lwyV0Znuf2uwoN6cBYXB8+7sjGTI/ic7OV3pOfl+REkYdaSxKW9nlQ/M1sz2CuGX/0+At+kStKlsFnu9bYnp62Kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEitq+3J++stQzZU/YHdTz1CUgH1nDajj21rY5JwkRE=;
 b=sOVYQyEhBruqmBPD3ws9h/IFkNQUyxM8pziE6yrA+Tz/+K9CeRmj7/I5MhMYkRTco5440UIT9GQOih2RxN3VyGm2iXvDWDVQR6bYkU6GSGgXFNidj88QEUxqZpl9TZx9yLuy2xm2a/twmZfhdgpA+2bA4aJVTOvfJ70fHzcrG78=
From: Henry Wang <Henry.Wang@arm.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Release checklist and qemu-xen-traditional
Thread-Topic: Release checklist and qemu-xen-traditional
Thread-Index: AQHZBlcaFgKY4sxRgkKeuZOIzkVZhq5apnOQ
Date: Fri, 2 Dec 2022 14:35:28 +0000
Message-ID:
 <AS8PR08MB7991236FE66DA48390C8E88E92179@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB79918A8115770DCF01863D7292159@AS8PR08MB7991.eurprd08.prod.outlook.com>
	<25479.27844.230855.996791@chiark.greenend.org.uk>
	<AS8PR08MB79917D648261C9ADB5F8EB8A92159@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <25482.1554.910128.804488@chiark.greenend.org.uk>
In-Reply-To: <25482.1554.910128.804488@chiark.greenend.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 173C04E21159EE44955C4238571807CD.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|PAVPR08MB9083:EE_
x-ms-office365-filtering-correlation-id: a003d1a3-9bf5-4f71-8f81-08dad4727506
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1UR6n1ZOgfWxkYzX215QK3/LQ5yEb8nDkW6gbCWDMWNOAwW4Lykn41bPJfYQ7FS+0y80+TF00NSacWhVYtNfmdM266sAm81I2Fqku0TMf5HyPB2r1xvu7Mfabq8uqgUgBwYErPK4BLls+eR1yR58KMe2xhMnpaK6lQckZj91T2GvkMgdjXx3m8P/QRwBHaupSjTBenpALcT61que0aDWgkoTGMbHOFxOYUYh2GjB6xjSQOOy7HE5hf05oBBgibiqCeaGjR4vV2kuh6selPTKK+oTuB2kt2gUJUMnDbrIKMBUHi6WNNjfcCoBIYYZ2ebtKmWkZeD7DnBso9F5TeEn3+fP90qUkXkeU4vnJXp9PTZWqi4tWZdtf4x/YPz59J9GkKwzUZ2DdWDdmojnZJ/2LgbqocCpbYhuo5wtYHufSu6WUZzE91R0ui7cjzkW4iE16U3TwUxoQLu/I2CFfCoMmYVDsPyfX4TpeFRmGXjVrTEbvBuEsa/e3Blglp0uJJWecfU2gNRhaTKhc3V58Ywd7uVNo6KNHF5qnTMNwUTGTck9a+Bf2Xkzsm9bc41kGjdCqMoi8EOpQFXBo/ltpBMsYqU6BB7U3pjuYCeiu6xnHtaTyUkWnZQnNPEVvJU4QFyKSDgZbJvPHjsjZPqzRvFB9bIzgpfp2ZJnBZftLT2QHXdDB2Hw9SN+PUIk73kQmSP28/nEMz2ZNvooGmRRAbK2vyQNWRApu9XTRYiO+hLokPggM7vITDp2py82gbpleFGGKMHNZRaddYInq3l2Z7fyAA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199015)(55016003)(86362001)(66946007)(76116006)(41300700001)(8936002)(33656002)(71200400001)(66556008)(5660300002)(54906003)(8676002)(66446008)(478600001)(66476007)(4326008)(966005)(316002)(64756008)(9686003)(6506007)(7696005)(122000001)(38100700002)(52536014)(6916009)(38070700005)(186003)(83380400001)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xVGbxX9SMI/Ib/OTstkwFFnOZhOdEEMaO9v+ODfMo+RyRXcf5xO2PdqsRCBj?=
 =?us-ascii?Q?fJ0M5/gdhoLixvMcJfQ8G3HaSRODBEbQiHpC+Rm1YeRxS5dSxJmpu1QH6u4z?=
 =?us-ascii?Q?WHfcOsyemk3tPBzfTNN24ClB6DivmeU0cWz/Xw9OC4GodxvMwgC4W8mppdgp?=
 =?us-ascii?Q?IbzuhTSulZ+ShV0VDaFld0JyiJ456VAR3iys3OiJmhx9TZ5VstUlGt2zWwLn?=
 =?us-ascii?Q?WjqmRUeG8k5ZHjKYT4Bku1KK030O2yzEZxtGm9IKU64fEiE6vBUCqHSJAl6k?=
 =?us-ascii?Q?QCgY1V9KhcwkPdLDutykDOwcX7O1AqXATw3QfUeCLE/u5+ELj+XxlByxzM03?=
 =?us-ascii?Q?C6rlSjwSWNn3JfRnbcD+gA7s/stbwbI/p8V9JxgqkEAjrbxpMNKs+moBg8Cm?=
 =?us-ascii?Q?uTuU78oFhAdemdXyPiQyY8JUpHBXCX6idv9F43x5T+t5EKsucEdNdfFkXwAk?=
 =?us-ascii?Q?gCuD5LCL0kY2pTva362TmQfJkyzQPcO6TceLro4Hsqn+Z2BoZ0+z6o5DKB4z?=
 =?us-ascii?Q?UcjFDt2YFhRVC1qEHjGdOyJ1R7DujlcwMD+z3+9y5+omNxKfp3ZnoKHMfLV/?=
 =?us-ascii?Q?xCzXWHZLCPtGDljQisL1TbOxEV25LQr5uOm2Z3KjgNvAZBdAnUq4ET+1GPrx?=
 =?us-ascii?Q?9QfncG/ImSZNiN7gOdKfly+teReTxvK7EQgL75Ygt773VOBMLQ72OyUK8XTA?=
 =?us-ascii?Q?LL3NelobDmLHPxpH7sviHfOLbQjZ5BvMOeI3zRhClBiRo0rqh4duaC//ralb?=
 =?us-ascii?Q?yh06ayoqQRcdoGwlfPDomp5SYcd1nf/mrvhRXYICQ+p/2nzUMmyKekDnvKeO?=
 =?us-ascii?Q?1n2MX8lPCG6+HcA/tRXqOpocYWHTMKNfNfhHuqvIb1wJG84QOX8Y+yiNlEbL?=
 =?us-ascii?Q?DWSKhWSbD7+a7gnlpORxttd1H9BZ8PF4VEnI0i8ngk9UONm1/Sn80lpgi26/?=
 =?us-ascii?Q?kPDgAGx/AeHg5k8+j8OjWnKUlpXPHEy67s59mXZ+PqwC5Pbi+Fk4pZFI/KZf?=
 =?us-ascii?Q?SPEfjIK5/6vFCUWt5Xv7R7iQrJ2LFFkytULlRuDZwJtvNaVIeI0UTuCHFfnP?=
 =?us-ascii?Q?rOA9J9xkFUBOYIx7u2lQH1h9upGLKN2FX6WmRAZZ8jKJZAZaQgR0X3Wlf8iW?=
 =?us-ascii?Q?MEha1tSVAX54zDuBW8FYrS5Cjkms3SlxsDeDY6BrtWYEG6/LoRGDOAWLidWH?=
 =?us-ascii?Q?5CeltIV8+e82K8JJfpPTWBh/64647XMqf101fogIaOe2tn6fg276l+wVhnsL?=
 =?us-ascii?Q?VGRgUvVFMGPIFR4wL/OAfrsvHQC66Y700dnFtvNv/hz0umgQ3n7ewXIOToLQ?=
 =?us-ascii?Q?cN9BN9qiwFPG5D4DOOQmECsYLoEmqTJV43KK+g5clQc/YQacA5QVBSXBXGVI?=
 =?us-ascii?Q?hBvL3IP/H7T/406cPZnHTRHKJFITtmSkyT8HWoTHkeQtSuKGk/U6nTjO9THx?=
 =?us-ascii?Q?eUPHTxuSoLHCRNIux4S7a16VRXtxPoZoGGi6DkeMXEOh1P4LHq0EraBHh8om?=
 =?us-ascii?Q?iKj9szWPCEjs+IIzqfeECfQ2qO4WRJdKCRHLxJfsUxWF9ey4bua8fErbQLwU?=
 =?us-ascii?Q?Tesjm6xaSTMqz+HUJl+bDj7JK8OvKxWRSrtwjcV0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a003d1a3-9bf5-4f71-8f81-08dad4727506
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 14:35:28.0602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deXbqd1zPjb0u2p4ia5d9eEF79Y1CWF1iJx63eX+pU8GfdUGkIjJpsMi7i3grSAJAEGwpqK2QIyYRlSdWtzhGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9083

Hi Ian,

> -----Original Message-----
> From: Ian Jackson <ijackson@chiark.greenend.org.uk>
> Subject: Release checklist and qemu-xen-traditional
>=20
> (Adding xen-devel to the CC list.)

Thank you for doing this, it would be great to have the answer below
logged in the mailing list.

>=20
> Hi, Henry.  Pleased to "meet" you.  To answer your questions:
>=20
> > > > (1) Why do the instructions say to branch that repo?
> > > > (2) Where can we find this repo?
> > > > (3) Is this repo used anywhere since the 4.16 release?
> > > > (4) Is this repo used elsewhere in the release process?
>=20
> This repo is this one.  I think it is still used during some builds.
> See this line in Config.mk:
>=20
>   QEMU_TRADITIONAL_URL ?=3D http://xenbits.xen.org/git-http/qemu-xen-
> traditional.git
>=20
> It is very old and we have been slowly deprecating it.  (The copy on
> my workstation was called qemu-iwj.git for historical reasons which
> aren't relevant, but that's how that got into the checklist.)
>=20
> The release checklist will also instruct the release technician to
> update the pinning in Config.mk to the tag.  For example, Config.mk in
> RELEASE-4.16.0 says this:
>=20
>   QEMU_TRADITIONAL_REVISION ?=3D xen-4.16.0
>=20
> This needs to be updated so that people who get 4.16 don't get any
> changes that are made to the "master" branch in qemu-xen-traditional.
> The same will be true for 4.17, if it qemu-xen-traditional hasn't
> been completely abolished there yet.

Great thanks for your detailed explanation! I checked yesterday's branching
commit done by Julien [1] and seeing the qemu-xen-traditional tags [2] and
qemu-xen tags [3], I think Julien did everything correctly (Thanks Julien!)=
 :)

Although I am wondering if the instruction about qemu-iwj.git here:
```
* make branch in qemu-iwj.git
        git-branch $v-testing master
```

would be duplicated with instructions here:
```
# make branches in xenbits.xen.org qemus
        ssh xen@xenbits.xen.org
	cd ~/git/qemu-xen.git
	git branch staging-$v staging
	git branch stable-$v master
	cd ~/git/qemu-xen-traditional.git
	git branch stable-$v master
```

[1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Df51079b5d87b=
39e79fe499ed818d50d856bc9c35
[2] https://xenbits.xen.org/gitweb/?p=3Dqemu-xen-traditional.git;a=3Dsummar=
y
[3] https://xenbits.xen.org/gitweb/?p=3Dqemu-xen.git;a=3Dsummary

Kind regards,
Henry

>=20
> > > These instructons relate to my local clone of qemu-xen-traditional,
> > > and will need adjustment.
> >
> > Thanks for your reply! It would be good for you to clarify what adjustm=
ents
> > we need to do. That said, I completely understand that you are quite bu=
sy
> > today, so...
>=20
> A clone of qemu-xen-traditional ought to do for this.  My tree here,
> rescued from my old Citrix workstation, has this for the "origin"
> remote:
>   xenbits.xen.org:/home/xen/git/qemu-xen-traditional.git
>=20
> I hope this is helpful.  If you want to talk through it some more,
> ping me on irc.  I'm Diziet on oftc.  I usually lurk on #xendevel
> (although I fell off at some point and only just rejoined), or you
> may send me a private message.
>=20
> Regards,
> Ian.
>=20
> --
> Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own=
.
>=20
> Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
> that is a private address which bypasses my fierce spamfilter.

