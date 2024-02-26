Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2A866889
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 04:09:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685256.1065685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRMe-0001Aj-Lz; Mon, 26 Feb 2024 03:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685256.1065685; Mon, 26 Feb 2024 03:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRMe-00018K-Ic; Mon, 26 Feb 2024 03:09:12 +0000
Received: by outflank-mailman (input) for mailman id 685256;
 Mon, 26 Feb 2024 03:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieDH=KD=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1reRMd-00018E-EB
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 03:09:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 688c2eec-d454-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 04:09:09 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8935.eurprd04.prod.outlook.com (2603:10a6:10:2e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Mon, 26 Feb
 2024 03:09:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd%4]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 03:09:07 +0000
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
X-Inumbo-ID: 688c2eec-d454-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA/lek6+CyvjTmFcO2K6TdKf9lvh5QLoCU5MObkaxZznNLja6teehfmXuLz6BSTdHJCrPQZfq0+9S86aqbIiW6T5SsoAZGJrJ7u3MhSsiO0uFigRqm+u7B3wBfMF8q6F7EHmWpqkPxisZEl3sdqokjQv3AbQcvr1TxNqwUIzw6WiaRWK+Kl5BQRl0hUkRgpPbF+NFPR7McWuFpnozNJEWNUPdabimP3r9xZEIU88IluM3SiTudnrsB6DQUdgMKMrTdqNPDMJ9eQF7ixu3U+gldeyZIzlr1OCgMRMahuAbKEjsGbh09L1G50GVRa3OI+tf2sGR2Q7a4vfBhrCbiYIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6FBDVc9DuZ4LImNhHXFOD8atrPcOK44Z0QGLn59K/Y=;
 b=TBXa5N1wnE0GahRL9vOqIMSEMHh06+9NY57QXplulRw6t0dZsOTnI103DwMWbNAQT67ssDCuO5y4dP/0Pf/wHU3FRwWpitKTpJLyf/yZOcwe4HG7sCln+egBgOq08/dGrZ+tMEmuRL8DAmaWu/z761pgHoLj7wA3UJrrKLAHSZmnlPavSziEcE0AicCAgv1jsZS8FT6soHUZ+WBPPqEyZyaRrmW3g8o3UUbQAdr0sv39A2LFpkwqQDVaEqYAhxxavNQdufpv7eiaI4xsKCjDj/5IfsYinZyJ88OGIULxNxnVVcrz5q4C29E9tNAQCTytdNpdhe7PZGyWOGXsfLUe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6FBDVc9DuZ4LImNhHXFOD8atrPcOK44Z0QGLn59K/Y=;
 b=sSiA9JWljTw1rPeC1q9PsF04ee3XHor1Qu1WmvzlH/PL3HbmyLiy/jLFWHENG6uNjD7z59d43K+qqYNJmL5duRpIA038KjxE6FThVOs5Fqu5rcWIpDOdIV9yqroV4suEUEfmFMKOpYyZYJot2yEfKl22/xQzNoBVPIO2YGdy1bA=
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
CC: Julien Grall <julien@xen.org>, "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>, Leo Yan <leo.yan@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAACuPlYAARFRfYA==
Date: Mon, 26 Feb 2024 03:09:07 +0000
Message-ID:
 <DU0PR04MB94175684F8B7678A7B885559885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
 <ee69684a-5aad-417a-8522-1cd1b5322bbe@epam.com>
In-Reply-To: <ee69684a-5aad-417a-8522-1cd1b5322bbe@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU2PR04MB8935:EE_
x-ms-office365-filtering-correlation-id: 8d301486-af32-4fb8-c49d-08dc36784bca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d80EalE6pLzqjT0JkulFYqdGg6nd6wLFsl1/XcE8BW8FYIQ51fvWCqnIi801rbJItPXD5R/Fnuk9zdg/KUhfy+PCnO05EgburY2RNDRSYJEA7crxr/JDxDHmZ4NzcnmyetQ9lf5MtofrSyqDbYJNghSN5qPOgJLrFaxXrBwO1dMufB1yaW+kR1Y7SDqzRu2dlN8cZSmG+dMW1nuvWE7xlnBjzCNv0LsojkOvorWMH9v88vxdAZSG/1tdXvALs1sLoO+MxtpN5i61c4BoJvvSLC5xEF62057B+XhhczHWMx6/opZXj3wvie8pTOKwxHgjngbSo2E9XauYJdj8SVxVSWl4gr5OI1m1QcCH701XQuaZ01Sc5B+EFhr9uswrjsKNAIMlEX4HZxHhfwDt4u2bd1I0pf1hMKc+smdLd6J28zXGeGE0qj7NAudxo7oidO3TZQaSkrTj7cmxl7zh/581jN0oRMbc+ULrSyNFTqx8fnOI5AxPn8qq7CVMBdN3EsE0dmgR1zcJiFxNYHmDCdnAo7quYPmji+ngKoIjC8qEBM1iN9RSp7wRgcJOqgPB3SoRYLW0O7qtIwxV6hILK1VM4oBHoiupYcGX695bD1zRc4o8fjiBoHXokPSmVnmpyQDEcn5hejlb74MrojQN+VeE6XoUKQ8SioTygC1NomdT+uUqsL4knP7t0uozGbhDglzIDOFyFRZFBmUyqq5r9NzPqg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2RXG6+BGl+sBkIGsP0nn/+7Vs47vBvyXV5IEdraIWFPtAyGDMp+2jqPorPRq?=
 =?us-ascii?Q?d2WElVUJP+6eyxfCeTLgTOQ2imJehtOFURBJbLynGg1nrKMe4SVtuOdCYrvW?=
 =?us-ascii?Q?jAIUBUQbUcJH8FyI8Pc1tWdsWNE3WUNLG0OHF0kAaiw1MbZ0YSigKG1BSdHo?=
 =?us-ascii?Q?GOylZrciMbl5018Nrek5tBZtxPKz2nfCJr0NMpapBUQVL2bD8m+iGIfEPEIc?=
 =?us-ascii?Q?kvkUoUuZ0UpDl6tDgUI2S9VPzktgXe0Crjn6hAzcYxDd80nT/cJp+RjOFqrO?=
 =?us-ascii?Q?qkcbLhhKsFMFrjDVujGiQgCvFRenSiZDnsjchIjIT9ZGOvrQHwMQf7A3fjc4?=
 =?us-ascii?Q?pQSxdtDaZFZBZP/0PA3KdZXmu4vHvvrgMNWtn9ogabymKBqa2DSmKNwv2EhF?=
 =?us-ascii?Q?NQaxCXlgXQmoFeEZnD27jsJAZTA00LEAVHwFlHZkdA3IvSEqKZGvRhYWh1qa?=
 =?us-ascii?Q?2o/zrUdrhionbOKcqvjJcbw5USlDY4z9grtsPMn96asHiCdcWzTQ8paGrz33?=
 =?us-ascii?Q?KPsQHWXlDZ9lOgTDV8XMKUHECqEVon+PnL8R/G2ehO6yqLRW4xGxah0fbwYY?=
 =?us-ascii?Q?oKO39u8cgYIdxKKLReS/QB0s3a3lykLj+y9JaOlABSGzGRw+AQaHApWNnLoP?=
 =?us-ascii?Q?o6oSXI8DaD5l4n7kWd1qrnMf7h2RotFqARR9gl6demd64AOC8q+m3+VTnY4p?=
 =?us-ascii?Q?HMBs9nyTR6XfwL2+eWILfYj4q4nbof/1lz1kjHN082pg8NgZQyzlHbw2j0uF?=
 =?us-ascii?Q?kvgsbXJ0jTQa9T6HgdT7XLrym7yiC3NoDN0ehTPFYsUAf0uKspIjiL4I3SWg?=
 =?us-ascii?Q?WPFaIao29ADOU0zBgiVx80cHFTCu0vbXLngm5jLrXjk35LzcLuIsjCp2pViN?=
 =?us-ascii?Q?FkyAGRqA3HMEM2MqUoV8Y8SB7DC91k4eCBk9JOFgkoafZ8nDbT0apKjN+Fd3?=
 =?us-ascii?Q?Dlt9P17LfWhnvUoMaGr76BjQiYxZNpAsjkAxN7M7m54P3eJIDj5ejgL4KUxO?=
 =?us-ascii?Q?iS1L6UNgqcEvTq+5M+a/+cAHh4q9xwYFazNICpEevKyZ9ofNpjJZF38uq80x?=
 =?us-ascii?Q?U/uBI6bq4wXNU89ACQk9rEhY7a3+yvwb+6EcOKrgyaGWeqpEUm77oUJXk2yD?=
 =?us-ascii?Q?23HGxEg45uu3EUaLi7AR+eYVFY5MeNBP5Q+5aE9ANrGaCIh8OB28f5ZixbGJ?=
 =?us-ascii?Q?cern11RVGQeAQLQD+H/NRax3t9OuHfmvtSe4xzUtOYHldk9WdjtBSMd5fjZs?=
 =?us-ascii?Q?nmOe/uc+lN6zVt8whXF/F/L4FCY/4h34waCeiEdgpfwq8EXAsGRaEO0cZ9ZL?=
 =?us-ascii?Q?ixBCIauxHaXW/R0IEuVIic1tyE/ubC8d6SxsKZ1rxheAoY3dBplpWUh7L8ez?=
 =?us-ascii?Q?hUhlfd3zmFh6WOnCZjr2/6asXZQXtVDbeNbd07PfTqPH5GwTqTV9m7iGpaLn?=
 =?us-ascii?Q?EV7hwrmZYNPbfFDncVPA9d+55vbvkSSuc1ORj6ej/OJIBle1iGXoOjqpjF/T?=
 =?us-ascii?Q?tQJ7kUdOLYftpJk0PxsztPjUjX49/OxHcsVLglH/6u9TIWVh+GGkIikIIbNh?=
 =?us-ascii?Q?7LwyphH4plRCvBMQiF0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d301486-af32-4fb8-c49d-08dc36784bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 03:09:07.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TRTgU0glGpF3rdS3cM1i+BezGoCIjjAYE3r2S1q4csfA3jnwqBXF0kNwswvDJ9x3HacJZ4+cptUc7/EjiudTBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8935

Hi Oleksandr,

> Subject: Re: question about virtio-vsock on xen
>=20
>=20
>=20
> On 23.02.24 23:42, Stefano Stabellini wrote:
> > Hi Peng,
>=20
> Hello Peng, Stefano
>=20
>=20
> >
> > We haven't tried to setup virtio-vsock yet.
> >
> > In general, I am very supportive of using QEMU for virtio backends. We
> > use QEMU to provide virtio-net, virtio-block, virtio-console and more.
> >
> > However, typically virtio-vsock comes into play for VM-to-VM
> > communication, which is different. Going via QEMU in Dom0 just to have
> > 1 VM communicate with another VM is not an ideal design: it adds
> > latency and uses resources in Dom0 when actually we could do without it=
.
> >
> > A better model for VM-to-VM communication would be to have the VM talk
> > to each other directly via grant table or pre-shared memory (see the
> > static shared memory feature) or via Xen hypercalls (see Argo.)
> >
> > For a good Xen design, I think the virtio-vsock backend would need to
> > be in Xen itself (the hypervisor).
> >
> > Of course that is more work and it doesn't help you with the specific
> > question you had below :-)
> >
> > For that, I don't have a pointer to help you but maybe others in CC
> > have.
>=20
>=20
> Yes, I will try to provide some info ...
>=20
>=20
> >
> > Cheers,
> >
> > Stefano
> >
> >
> > On Fri, 23 Feb 2024, Peng Fan wrote:
> >> Hi All,
> >>
> >> Has anyone make virtio-vsock on xen work? My dm args as below:
> >>
> >> virtio =3D [
> >>
> 'backend=3D0,type=3Dvirtio,device,transport=3Dpci,bdf=3D05:00.0,backend_t=
ype=3Dqem
> u,grant_usage=3Dtrue'
> >> ]
> >> device_model_args =3D [
> >> '-D', '/home/root/qemu_log.txt',
> >> '-d',
> >> 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,trace:
> >> *pci_route*,trace:*handle_ioreq*,trace:*xen*',
> >> '-device',
> >> 'vhost-vsock-pci,iommu_platform=3Dfalse,id=3Dvhost-vsock-pci0,bus=3Dpc=
ie.0,
> >> addr=3D5.0,guest-cid=3D3']
> >>
> >> During my test, it always return failure in dom0 kernel in below code:
> >>
> >> vhost_transport_do_send_pkt {
> >> ...
> >>                 nbytes =3D copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
> >>                  if (nbytes !=3D sizeof(*hdr)) {
> >>                          vq_err(vq, "Faulted on copying pkt hdr %x %x
> >> %x %px\n", nbytes, sizeof(*hdr), __builtin_object_size(hdr, 0), &iov_i=
ter);
> >>                          kfree_skb(skb);
> >>                          break;
> >>                  }
> >> }
> >>
> >> I checked copy_to_iter, it is copy data to __user addr, but it never
> >> pass, the copy to __user addr always return 0 bytes copied.
> >>
> >> The asm code "sttr x7, [x6]" will trigger data abort, the kernel will
> >> run into do_page_fault, but lock_mm_and_find_vma report it is
> >> VM_FAULT_BADMAP, that means the __user addr is not mapped, no vma
> has this addr.
> >>
> >> I am not sure what may cause this. Appreciate if any comments.
>=20
>=20
>    ... Peng, we have vhost-vsock (and vhost-net) Xen PoC. Although it is =
non-
> upstreamable in its current shape (based on old Linux version, requires s=
ome
> rework and proper integration, most likely requires involving Qemu and
> protocol changes to pass an additional info to vhost), it works with Linu=
x
> v5.10 + patched Qemu v7.0, so you can refer to the Yocto meta layer which
> contains kernel patches for the details [1].

Thanks for the pointer, I am reading the code.

>=20
> In a nutshell, before accessing the guest data the host module needs to m=
ap
> descriptors in virtio rings which contain either guest grant based DMA
> addresses (by using Xen grant mappings) or guest pseudo-physical addresse=
s
> (by using Xen foreign mappings). After accessing the guest data the host
> module needs to unmap them.

Ok, I thought  the current xen virtio code already map every ready.

>=20
> Also note, in that PoC the target mapping scheme is controlled via module
> param and guest domain id is retrieved from the device-model specific par=
t in
> the Xenstore (so Qemu/protocol are unmodified). But you might want to loo=
k
> at [2] as an example of vhost-user protocol changes how to pass that
> additional info.

Sure, thanks very much on the link. Giving a look.
>=20
> Hope that helps.

Definitely.

Thanks,
Peng.

>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Fxen-troops%2Fmeta-xt-
> vhost%2Fcommits%2Fmain%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7
> C56a4b63510da43a9ddf808dc356694fa%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C638443961893736252%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C0%7C%7C%7C&sdata=3DhDZLtjhzHGHzvuzPmQLwoNI8mwKeZDtVWgn
> VTF%2BX1TQ%3D&reserved=3D0
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> mail-archive.com%2Fqemu-
> devel%40nongnu.org%2Fmsg948327.html&data=3D05%7C02%7Cpeng.fan%40
> nxp.com%7C56a4b63510da43a9ddf808dc356694fa%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C638443961893746102%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DygBpkAS%2F1aCcyB20ymt%2BZ9jt
> 9T1l%2F8hzPwRQrGb35jg%3D&reserved=3D0
>=20
> P.S. May answer with a delay.
>=20
>=20
> >>
> >> BTW: I tested blk pci, it works, so the virtio pci should work on my s=
etup.
> >>
> >> Thanks,
> >> Peng.
> >>

