Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250C19A949
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 12:16:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJaO5-0008UO-3Y; Wed, 01 Apr 2020 10:14:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyEw=5R=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1jJaO3-0008UH-Nd
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 10:14:20 +0000
X-Inumbo-ID: 8b099f2e-7401-11ea-ba8d-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b099f2e-7401-11ea-ba8d-12813bfff9fa;
 Wed, 01 Apr 2020 10:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbJGWT0qwPSmnsvSdUE8H4EPX6R5FEPnxljgFWinDLM6wPchAb8siFEHSydkNoro9S73ttBrje5zqh2ibEDLKC7NmG8WBzHgGC0vkT8HV56yE0z+AVB0wIx0AX8znSwWytZPKogYiuCAHemtgb0CwA66gRTImrNVNMtF3OE0vGwkH+aktLD+SF8W7Of3r/7Tgiz2DIpenhg8kFTtpSpjppZV0PZSWooXNCqZAvxB938oQ8RE5l+TrBBipY0GBe05krZbRsfX2mjhVeCFpkLw/faKADXHsDga1Eso7Ci5yqnac3CbIHdgchTemC9KXGQa3v1Edp/S8qrfXuxm5zjGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmoWeB1fzXKECWW1aepoOQ9+RXJTKTh1gm2beSo16o8=;
 b=RjvVVzjmRWkgubTJgTk8+Il9lvx1R+1+fbPRg18r77gy3EyHGFbkk7kHnSrjKktsll0aJctLvIDqntnIPUlab42ARpFMAd3knFQhZHH6fRA0CjFG/A23UbBNLbjADUD4BNt1SO0lQ+YC82oXF646VeRjXcwXsD6oeebXbESRRw34/pChuE9UFAgkw9cFvpF7Wm8TRbVw3cV2oElsu9kPlDHN19oXFqIMy7410sHI0fA1loobNNgzb6b5k+MGLLeglZrCtfk48r+GeURF6Axn1bnfq3Jox6GNQH+Cw0YBn0B4e9orr0oy3jpHP3e0ADAlHCA3RX7aHmeeMOnHE6W75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmoWeB1fzXKECWW1aepoOQ9+RXJTKTh1gm2beSo16o8=;
 b=lzYI696iEE+IZVuQ/zQ80jpQSK6xDgrYUdCmHG6vrzqy18o9CpKnLMSn8aTS5fDCoamkxyBNQeKTqbZUtc/oGBhYEF0vWeQmlcXlpLdG/zsZ3Du3CVIYtJa0MSika815ZKjXxXmwIt67EE9FSWJLGgvvfDKEpsIhLmKN4xjzOrM=
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (20.177.50.141) by
 VI1PR04MB7181.eurprd04.prod.outlook.com (10.186.158.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 10:14:14 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::4494:fca6:829e:8fbb]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::4494:fca6:829e:8fbb%3]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 10:14:14 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
Thread-Topic: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
Thread-Index: AdYIDkP0tQYlxDAYTOaajGQHdLFSyw==
Date: Wed, 1 Apr 2020 10:14:14 +0000
Message-ID: <VI1PR04MB505609C8A448B9FF84EDD667F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [78.97.145.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03eb01b5-d456-4759-02d2-08d7d6256e4b
x-ms-traffictypediagnostic: VI1PR04MB7181:
x-microsoft-antispam-prvs: <VI1PR04MB7181FFFEAE409DD9BA4AD0B1F9C90@VI1PR04MB7181.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(33656002)(52536014)(66446008)(966005)(8676002)(8936002)(64756008)(66556008)(66946007)(76116006)(5660300002)(2906002)(66476007)(9686003)(6506007)(44832011)(4326008)(186003)(26005)(316002)(54906003)(81166006)(7696005)(86362001)(55016002)(478600001)(81156014)(6916009)(71200400001)(10126625002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t5x/A6NratBnfYbDIGj5fYPiAw8SeQG8aucP/zlYhrdkflWrkWJv68VIxDZwE/ftldNXYvGJapCKsBl3mqNipJTrKLAKMsdVdZZmmuZGAOWZx1udjOcY8me5brHPc/QdcI3nq19zOlGcgrfIX5kqrAKNMpf9paY+jYjVYg+lL2oBd+dM29K7eNs9EjJipBtKfRPf4TzRfZFx2ZT1JOFPEmDGG8/7p1y4jmyr2xd0KcGvVtn9m42c2QNIiQJleP3qgwVUBw6SoYI91o29QqbJ2qTq5wLZNQcUOso2vjo2xV2emnGnS+j7V5ls34/Zl9OCdQ+dx0p7QgWp9UM1KF3Q5dI6m3zRrvRGVfW7W3oaELNON6sEY6lhOjUuPTKpupEE1InvJ52luiA0CTuR1dd7zwnzZ05QpGnxV0rEwmfyTy2pvtBogD1SBzCzUnxcA36+Pl/+tokT6Xy2vr/y4lJKVWzH6MweKmCQ6CgR8nyVlL+R3ymJkNnhy6WSOB6K0gckXuU2kmKiBeFf1KhFNPRVYd+5Edpw3b1tpwjLmRGYvMZe44sdBS9flXNFJBH+WFqUj5SLqYlOoK3T65dQRxFoKQ==
x-ms-exchange-antispam-messagedata: /UsFTZkrRzvETjUUxq6/dd5/pjcuwyHy1DMdsykz91dDjAQ6jGSaw6m4mbewaRawJGG8C1rtDr0m19PtfzPIcMEBvi/SJ/U2ifU7q9tNkYYQ3fY0NdXK1e1YaavND956B0xqxHCbd1RILWMAuOuysw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eb01b5-d456-4759-02d2-08d7d6256e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 10:14:14.7738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ly1RnI2SAgzUbXYe5EJyuJySE5JPC7eCFQjwdfxOeVu2VNQ5QVWxgAaqWi2Pq1aWJbeOOs/wbdKJxJFAYCZVSUw5iDK0bcD0CHQ1j632u18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

And thanks for your help.

> Great to hear!
>=20
>=20
> > However, I am encountering another problem now: in Dom0 and in=20
> > dom0less-booted DomUs, I cannot use /dev/hvc0.
>=20
> For dom0less-booted DomUs it is normal because they don't get a PV consol=
e,
> they get an emulated PL011 UART instead.  Make sure to have a "vpl011" ta=
g in
> device tree to enable it (ImageBuilder generates it by default.) The devi=
ce
> name is usually ttyAMA0.

Ok, understood. I had my vpl011 tag in the dom0less DomUs nodes in the DT,
so that's not the problem. I am able to see DomUs boot prompt when booting
dom0less. The problem is after DomU boots, that I am not able to switch to
its console from Dom0, in order to be able to log in.

> > Even though I'm specifying "console=3Dhvc0" in dom0-bootargs, when dom0=
=20
> > finishes booting, it looks like I cannot use the getty spawned on /dev/=
hvc0.
> >
> > This is the end of the boot log:
> > [    2.947845] random: rngd: uninitialized urandom read (4 bytes read)
> > [    2.958415] random: rngd: uninitialized urandom read (4 bytes read)
> > [    2.965452] random: rngd: uninitialized urandom read (2500 bytes rea=
d)
> > .
> > [    2.972410] random: crng init done
> > Starting OpenBSD Secure Shell server: sshd done.
> > Starting /usr/sbin/xenstored...
> > Setting domain 0 name, domid and JSON config...
> > Done setting up Dom0
> > Starting xenconsoled...
> > Starting QEMU as disk backend for dom0 Starting domain watchdog=20
> > daemon: xenwatchdogd startup
> >
> > [done]
> >
> > Auto Linux BSP 1.0 s32g274aevb /dev/hvc0
> >
> > s32g274aevb login:
> > Auto Linux BSP 1.0 s32g274aevb /dev/ttyLF0
> >
> > s32g274aevb login:
> >
> > ----- END -----
> >
> > It seems that the getty spawned on /dev/ttyLF0 overwrites the one=20
> > spawned on /dev/hvc0. Which I do not understand, since Dom0 should not=
=20
> > have access (?) directly to ttyLF0 (the serial console device on our=20
> > boards). If I remove the line which spawns the getty on ttyLF0 from=20
> > /etc/inittab, the system hangs when waiting for the username, and it do=
es not let me type in any characters. For the record, hvc0 is added to /etc=
/securetty.
> >
> > In a system where I boot DomU via xl from Dom0, I can switch to its=20
> > console with xl console, and hvc0 works there.
> >
> > The problem that comes with this is that I can not use the CTRL-AAA=20
> > command to switch between Dom0 console and DomU console in a dom0less=20
> > case, and I cannot therefore test that the passthrough works. But at le=
ast Dom0 does not have an entry for it under /dev, anymore, and DomU boot p=
rompt tells that the driver has been registered.
>=20
> It looks like there is some kind of interference between the dom0 ttyLF0 =
driver and the Xen serial driver.
>=20
> Is your Xen UART driver marking the device as "used by Xen"? See for inst=
ance the pl011 driver, at the end of
> xen/drivers/char/pl011.c:pl011_dt_uart_init:
>=20
>     dt_device_set_used_by(dev, DOMID_XEN);
>=20
> Devices that are marked as "used by Xen" are not exposed to dom0, so you =
shouldn't see the ttyLF0 device come up in Linux at all.

I've checked my Xen UART Driver and that call is there. So ttyLF0 should be
marked for Xen to use.

I don't have any ideas why this happens.

I've attached the driver [0], if you want to take a look.

[0] https://pastebin.com/PuXi50H0

Thanks,
Andrei Cherechesu,
NXP Semiconductors


