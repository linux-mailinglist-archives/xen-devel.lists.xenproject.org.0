Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23537199D0F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 19:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJKnu-000864-Hv; Tue, 31 Mar 2020 17:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GyfJ=5Q=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1jJKns-00085z-1R
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 17:35:56 +0000
X-Inumbo-ID: 1173f2c7-7376-11ea-ba35-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1173f2c7-7376-11ea-ba35-12813bfff9fa;
 Tue, 31 Mar 2020 17:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXguWVy25mZ8tgKTb41Eqvgxa159vHYaR+IXibTNZPvLOw5nrMvzB7J9blM9NUYFoTBaOYTghZjDpdK3Rsmix6cX+NbdpY5VdTmsemgMNn119lbdVFeo0LgcLANZdnQF8hJPnRP672LfOysCiuaIfjH3TxuAG0FnRK/kEJ/4a/snULELrz2j6LNLot5NwCu+J7ZHVIHE8Yoyk0vW9rxyrpJthp4aHhy+ghoTFPKar/sBP8Ba6eLOiyAaUQ6wfrr3kyFfqtowgqW2r8r74qj1MxF9i/SWEWvehdRbT20ydG/EatjFRC26VZJOZ9A6u9S7zot5ztVYLXOLM/PU9BRE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jndkulGprMsWR4+DgT3BD8kSnQsx9m+d2LeuBX+YqxY=;
 b=N3eMykwuBFNuM+ClQvL+8rwx9oRvEOa4WzbH3/2P7qYMfPBrC5uEVUu1PzwZaOvSTNvTBmbw+I0smdlI6BxwcxjqvwhI8sT7IhtMhuUXp6SdVfey0vyEWPKoVPXU8OehKkqerDugUWn8KSCJZx3vXzSyHnJ7VcAgL0+jK4Eand69uHXApgN3I8rnkHRG6vQMgdygpqr++6aGGNnnyMnp6Raq2uozXVlFOd1/LhdCm0JlDtDpThrhxw477Gt7x2aoTz790AgtbRTtyWLvj0UzKPspXGgUEXH1o080rNfKvT/vB/HT9XIQqUqcS2bXIKFSZjTemahURHZ+ltSbt8g8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jndkulGprMsWR4+DgT3BD8kSnQsx9m+d2LeuBX+YqxY=;
 b=j/sOxT6P2WhoDTVZA7aNqQSarEQIvPL+Z9I88TqjUK90OzKiHwgilloQXSKaTX0PFWcK/4F9dlP+YJ1b0CO8hSZt9XKCHIyfiuXOhk19bQQCKbxcQnghcw6oSvcVg4PBNjUeazdS9+JHbzLdzOCrt4qfpvxHvLRUrIWe1ozF0Lo=
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (20.177.50.141) by
 VI1PR04MB2958.eurprd04.prod.outlook.com (10.170.229.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 17:35:51 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::4494:fca6:829e:8fbb]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::4494:fca6:829e:8fbb%3]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 17:35:51 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [EXT] Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in
 the second stage MMU.
Thread-Topic: [EXT] Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in
 the second stage MMU.
Thread-Index: AdXij/4YfVU1SidNS1iBhGFKGrknqQAJIbeACTEd/ZA=
Date: Tue, 31 Mar 2020 17:35:51 +0000
Message-ID: <VI1PR04MB5056CE76F727C8B53F2E296EF9C80@VI1PR04MB5056.eurprd04.prod.outlook.com>
References: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.2002131327360.1018@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2002131327360.1018@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [78.97.145.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9de65f2b-f728-4740-1aba-08d7d599f520
x-ms-traffictypediagnostic: VI1PR04MB2958:
x-microsoft-antispam-prvs: <VI1PR04MB295834ED9EB96719DF35E6E5F9C80@VI1PR04MB2958.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(7696005)(2906002)(81156014)(55016002)(86362001)(8936002)(6506007)(66446008)(64756008)(54906003)(6916009)(478600001)(76116006)(4326008)(66476007)(71200400001)(66556008)(316002)(81166006)(33656002)(66946007)(5660300002)(8676002)(9686003)(44832011)(52536014)(186003)(26005);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WiZK0pPm5nEAvCxUKF9Ex2aoBVzC/Zh4Z/B50kRwbrW2ZJKE2NTomQGsBdi+7X9dxbjlXEgnm+EEdWIJHXYejA2oU/gIPMRyE+22QmV6mUSjUJgcfxOFP3x7G8w73Hcw1sOBcn5yxFuP36ZFPTIXTqS9sVBYY/GcK62yDuBXS3rMu9FWiC+BKaMHiNJzXdr0iLCdB95BlA8xMDRi/QxwxMqIkKHOwzkE2wjgaSSA3eX7QaFh0bPVFumhIb0CoD4vg0OABBDyTik8qAQN8oNlu/DTsUcpx6v4XDZlMM0k6zmAmqHLSrdR3xPIyXllSNRlX7qUZQxqY4e/VYP4+lEcZ6MvExgwYNfAUlIoK+O2Omhi1hHuEbsT1tqox6HP7WaqhgqXzMwlWBL2QhOInEz5IUd1tpMijPYEOykguShl/+lTyiVoJn2n8Kxm61aGWaU
x-ms-exchange-antispam-messagedata: uDsCgJpw74BxHmIjKpKOix4XDow5VO0z7I/sDp1sxbHOwHOZ/kEn25mHyZJ+p5gnM0+AV3gRbLhhiov2V27Lpmbi7TMwyAWzc7shUrBohg0U+e55YLPOz3ajCAMRYW6dUQpzASHkfWtLJw7c0YUj7g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de65f2b-f728-4740-1aba-08d7d599f520
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 17:35:51.4699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFYhCKKELjrGaUx5eMjePJPcgGfEVwANVwhfNx5pSNZJ8xWF7BhQQAt/tc8LYjHYtLjFVcstCuWxLRC0FlEdJBlu1wu6U3da5n2aCn/A2ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958
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

> On Thu, 13 Feb 2020, Andrei Cherechesu wrote:
> > Hello,
> >
> >  I used the Xen from Stefano's tree and made the updates to the partial=
=20
> > dtb that he specified.
> >
> > > This is mostly likely because Linux is trying to access a region=20
> > > that is not mapped in stage-2. You can rebuild Xen with debug=20
> > > enabled and you should see a message "traps.c:..." telling the exact=
=20
> > > physical address accessed.
> > >
> > > In general I would recommend to build Xen with debug enabled during d=
evelopment as the hypervisor will give you more information of what's going=
 on.
> > >
> > > Cheers,
> > >
> > > --
> > > Julien Grall
> >
> > I enabled debug config and gave it another try. But I'm still getting=20
> > the same unhandled fault error, that seems to match what Julien=20
> > described above.
> >
> > It is indeed a stage-2 abort caused by the guest.
> >
> > I attached the DomU1 crash log at [0].
> >
> > [0]=20
> >
> >
> > How should I proceed in this case?
>
> Looking at the logs, you can see:
>
> (XEN) traps.c:1973:d1v0 HSR=3D0x939f0046 pc=3D0xffffff80083ac864 gva=3D0x=
ffffff800800d048 gpa=3D0x000000402f0048
>
> So the guest was accessing address 0x402f0048, however, the MMIO address =
range of the device that you are remapping is 0x4002f000-0x40030000.
>
> I spotted the mistake now: looking at the partial DTB again, the address =
of the device is:
>
>   reg =3D <0x0 0x402f0000 0x1000>;
>
> but the address that you are remapping is:
>
>   xen,reg =3D <0x0 0x4002f000 0x1000 0x0 0x4002f000>;
>
> They are not the same! :-)

Thanks, Stefano!

I changed the partial DTB and it did not crash anymore.

However, I am encountering another problem now: in Dom0 and in dom0less-boo=
ted DomUs,
I cannot use /dev/hvc0.

Even though I'm specifying "console=3Dhvc0" in dom0-bootargs, when dom0 fin=
ishes booting,
it looks like I cannot use the getty spawned on /dev/hvc0.

This is the end of the boot log:
[    2.947845] random: rngd: uninitialized urandom read (4 bytes read)
[    2.958415] random: rngd: uninitialized urandom read (4 bytes read)
[    2.965452] random: rngd: uninitialized urandom read (2500 bytes read)
.
[    2.972410] random: crng init done
Starting OpenBSD Secure Shell server: sshd
done.
Starting /usr/sbin/xenstored...
Setting domain 0 name, domid and JSON config...
Done setting up Dom0
Starting xenconsoled...
Starting QEMU as disk backend for dom0
Starting domain watchdog daemon: xenwatchdogd startup

[done]

Auto Linux BSP 1.0 s32g274aevb /dev/hvc0

s32g274aevb login:=20
Auto Linux BSP 1.0 s32g274aevb /dev/ttyLF0

s32g274aevb login:

----- END -----

It seems that the getty spawned on /dev/ttyLF0 overwrites the one spawned o=
n /dev/hvc0. Which
I do not understand, since Dom0 should not have access (?) directly to ttyL=
F0 (the serial console device
on our boards). If I remove the line which spawns the getty on ttyLF0 from =
/etc/inittab, the system hangs
when waiting for the username, and it does not let me type in any character=
s. For the record, hvc0 is=20
added to /etc/securetty.

In a system where I boot DomU via xl from Dom0, I can switch to its console=
 with xl console, and hvc0
works there.

The problem that comes with this is that I can not use the CTRL-AAA command=
 to switch between Dom0 console
and DomU console in a dom0less case, and I cannot therefore test that the p=
assthrough works. But at least Dom0
does not have an entry for it under /dev, anymore, and DomU boot prompt tel=
ls that the driver has been registered.

Thank you very much again for your support,
Andrei Cherechesu,
NXP Semiconductors

