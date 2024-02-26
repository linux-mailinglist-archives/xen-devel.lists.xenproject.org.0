Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3586687A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 04:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685251.1065674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRIu-0000T5-2j; Mon, 26 Feb 2024 03:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685251.1065674; Mon, 26 Feb 2024 03:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRIt-0000Rj-W5; Mon, 26 Feb 2024 03:05:19 +0000
Received: by outflank-mailman (input) for mailman id 685251;
 Mon, 26 Feb 2024 03:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieDH=KD=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1reRIs-0000Rb-Ca
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 03:05:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc811242-d453-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 04:05:14 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8935.eurprd04.prod.outlook.com (2603:10a6:10:2e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Mon, 26 Feb
 2024 03:05:12 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd%4]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 03:05:12 +0000
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
X-Inumbo-ID: dc811242-d453-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ckp0MSWmZ2eMeJFGoxkGm+HVdnq+69VwSWjUFK7wHX3YEXJ+G+dyHATMQWRmk31i/MbbGNKqjAHyrUhkmkaMcyv3optaBU7hS8BpYXcBZkbIaiVUQ6sdQwAyV79zrtyStb8/wF7ZYnoHjJXBNVE+SypRqKehKL8cx/1MZzvNT/EcODMpAd+7CKqhKkRbiSKFwtwrxurMjqH3fQgQKckwQYBogZJcY3SweXFLlwRIBA4zWO+WRGN+iz4WZ4zn7UEdR6hgYVhSYM3YiuiTRVf++MsP3uoLYc9hjhxZKUQ8EMnByzhEx1+cQ0hfgCxFkE530eirn3luA7bDwHmvSyQLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5z3JfmvSQXMXM0K6dZ2WyrioM8mQUu8oA3IKTQPYO9Q=;
 b=ETNkzpv5o/wNDyUul9D0vaSnnBjGnLSSiKo3RhKCkbwQpxACqenEamnKmB+55iCDuL0S1XMMpEmvBfh63Gbc9lKkCpdDO4IfUF3rYnGPsHCd0na7bcN7rkcNtDQIeAkIZeXa0u/Idfo+kwyWjE7IExZIUr5oQy7PSPan0K06leLWhDNB+St4sbHapC+IY4Ln6YVyDnpLDWbgsv9Dg4UdXJQq7wnOWNa8/k4HgILxzSFtVy8x0NMWAzpe0RKV2zkul+WtJzvb8lBNoaL34bSZKRjswdUTkFamGA3+80tZ46GHcbpu0KuSVsLH/g52tGag1gpUBK4PHnYMhQ/TZucb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5z3JfmvSQXMXM0K6dZ2WyrioM8mQUu8oA3IKTQPYO9Q=;
 b=eFNintCmIIYcR2l56PKsUPZOzxm7ZweAFgcdXsvtY9dNnzlUByvdh9T76pRGqAbTjiOMjnEcw+nI22HtHeSKKJ17u99ZYQ6XFcIUi3b5klxXIQXpzZAqxknoSDpuGnX3QASkHejKvyEp+dm+ryFeuenWtnBYH3QeNdz2lmcPVUY=
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Julien Grall <julien@xen.org>, "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, Leo Yan <leo.yan@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, "stewart.hildebrand@amd.com"
	<stewart.hildebrand@amd.com>, "sgarzare@redhat.com" <sgarzare@redhat.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAAG+7FYA=
Date: Mon, 26 Feb 2024 03:05:12 +0000
Message-ID:
 <DU0PR04MB941746B1F385B6A514704F2B885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU2PR04MB8935:EE_
x-ms-office365-filtering-correlation-id: bf74059b-9df0-4132-264d-08dc3677bfa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EdvJkoWHZ2/kYvPps8MOvd6Iog8CAkzHzT0gqTquOyKA2p6FJ105vQz4Ik6dnk4uN5eC4K6RCIcT9pqjoUXSBeEJvGQL2CSixtSSCiI4FOduK0Wt5yThCaGz0TR60ilUMwOFOxVTP2pJl6gQhSj1JKUtwNzO/MQBDQHFricZgaKRnfINGzJsYQ1mlal1bltYDtrTq6HD9qgZgdfhHegSZhb+1VFurfZpRjBChfSo1tMa0I/+29Pyxpw2YZskefb2pVSKzX3WWfSMjNzhW/QEQgdSpgMCzY8xIzWvKIx5uw1IUSJ/J/0HbNL/nKLRLiTzYEuZYBwhkkYGFP9O9Fjm815zdBflkGtRAuVAQOZdSXYPgwLGlqJzEhP4htEjUvjZzRwDSUarvnMsx/gcyWWwqmRCoYUcjjJsKiEdOftyAKMLC4+GrgeIWN1LeMpmkpUajKVqRVIEs9ZEdkDMahssErkI/Yac9y60MXms5OhLa4tQ4EM9J128Ftk/WS3R8yIX5RdM0ZBDNm0xJWQ4lMB1rqF7fSaTmrlabYvLOaAwWUE+NjTFhQKjX30JmfK4q/u45UbsGber77EJmjFrN2hY9mzbfDPPqWJ2E8GTXiSf1lpC3CWelZhovykEZVZ3TO5LB0VWmUlIBYmz/1NNMXoCjh6S8UoUIyyvsbFDFUssW/k9ND0vpKBHeyMpCdN8CDE7zJCzZl1ri4rSfYQaxtQ8N11m9he/d3mCjixLv4D0fk4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h6OoFXsaYBcoaNbJRgOoFlQ7uJedUCoHMLKWDy0mxpI2vxBHt3o5mSopK8g3?=
 =?us-ascii?Q?LaxP06G915411kNL1Z5UYaX0t4ydDYGoa4jO5vyzthhfP6MrVQ3+bTtYpKhg?=
 =?us-ascii?Q?3k5+dtMgtHQUHKM0zDJmqZKeKqsUsVQAOZMZSt51gKSieJOMgnbMV6iDXt56?=
 =?us-ascii?Q?cVci3BFD99m9iHSQFu+fiwaV0BeyZ9UEn2JcSe5TWaMcKVmiiROc9skETF8y?=
 =?us-ascii?Q?kD6WGZzwifPEwekz2mjtVmDtdsyDDswketGl/eNSAph3hteYPr+WRG1gcKu2?=
 =?us-ascii?Q?RuY/7852c9Z8jsDqHsX07pNEckzUWNHVTesC7yvmbIL1Dx5LekynPJiZ+FdU?=
 =?us-ascii?Q?RtuZZHPzfzvgcl0ksXWrAUWM9vvYNYELjFxYMuDjjMnyHugHmnoszVhu6xMQ?=
 =?us-ascii?Q?FhFR6SqcLxYxPBj5HUdYhQPzTDGgnskJrALjHaCsSLh3xv3DIYfxUSWdiXAJ?=
 =?us-ascii?Q?PhhgmQFiS4zjWJM3E8vJc3/oCyLNazmxeyzDLgn2eQSNU2PDNQkNSL/tVV13?=
 =?us-ascii?Q?JvZiKe9IYjEGeHQlT3PFDXlZglmU65H8asSIWs/0+VXySrU2m6EeMRgI4Weg?=
 =?us-ascii?Q?dO1mSGFVpwOiVgL5SQuhj57nbjBnsyvWlMzwOOWtEyhAOPXDA/NfQ6f1NpXX?=
 =?us-ascii?Q?He8ycAv5ORCNZO9gLlSqm+G8jFHgNkfjL7S4X/lpJNXUARv7JLLUD6Kl+qiw?=
 =?us-ascii?Q?0jcZt2AdKSl4e7IvL9G/K7FgdTUBl65SfrWBjSpPAD0HfrYdiPx/z6Pygb7L?=
 =?us-ascii?Q?V91rODOpypO+wrhFNCODJr+lQZNs1bs+3roJcrj3y+84aAL2rjO+qYfO3oRJ?=
 =?us-ascii?Q?yEca6dDmbbQLhZrUZUlH3b+FUdVUFYkj/lqTnhDG6fZAdWHxZK4UyBmZ7k8I?=
 =?us-ascii?Q?0QvDXJWPC7Kj6/XlnsFb19UJNiANvk9zSLCuYj5t7KW5svJ+bkzsB8STk+6o?=
 =?us-ascii?Q?ZKFIEmgEozplsWJ1qZboCkeNN+pKtpVYLBBASanc8umvLLSILRnVM9k88am1?=
 =?us-ascii?Q?eneeydKnQWNeHLK3vdoIpSBfUfH9PtSVDW6XpSocu/GVCYdqAbx2ii1H7C88?=
 =?us-ascii?Q?QrEe/gfm3oanInKjD2tVQRN/IWh8VNPOraDXGrQubGs471HiiCmpajf9nmEL?=
 =?us-ascii?Q?reV389E6+5lP7srj4dXFVdG6rYuWTwDV3lr/iuYng60G718JPtvFmJyfTCbX?=
 =?us-ascii?Q?uENWBv39uJE1BZlRfIZYo2qJ9QV8hgw6pDUCzgKZawbmETmKXyR/T8cIk7gx?=
 =?us-ascii?Q?HW/4LNIoXK5Y0UnIbHoriXN8whKTK6d/KjMZLy4BXN8QzeZFYHLrE6g1N9Aq?=
 =?us-ascii?Q?pAE5cqQ/exoDC/7qDp2A4W/NNxq3hBzIDTkMOC3boPlD2tIldjo8r5Zjf5VG?=
 =?us-ascii?Q?tVTyDVOE6NyF/p3z8Ak43V2Z3nKLP+2xgeqbmluRvsGb1J3407cLNO5eiqoH?=
 =?us-ascii?Q?Vfkc4oxF1tw6x0Uaptj0svwUUvp3f0jn9XFjKhOWubLIxbwuUHtZN/wa+G6l?=
 =?us-ascii?Q?4PBUl3f7NF6HZWK/5ieD/+UcGI/DnaCFRvRWnigHZCR2N/Q7DJ8rRGEn1ofL?=
 =?us-ascii?Q?jiIFnNq2xeoIYrH0fv0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf74059b-9df0-4132-264d-08dc3677bfa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 03:05:12.3671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXMtzwi4OhWRxsJ35IjcCCE9LhTVY7OAw956D0QLjtoLA2+XBIjzREYM5Wj+VuwmzGYPzrM0Q96zyxN7fm+xOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8935

Hi Stefano,

> Subject: Re: question about virtio-vsock on xen
>=20
> Hi Peng,
>=20
> We haven't tried to setup virtio-vsock yet.
>=20
> In general, I am very supportive of using QEMU for virtio backends. We us=
e
> QEMU to provide virtio-net, virtio-block, virtio-console and more.

Would you mind share how to setup virtio-console using qemu + xen?

>=20
> However, typically virtio-vsock comes into play for VM-to-VM
> communication, which is different. Going via QEMU in Dom0 just to have 1
> VM communicate with another VM is not an ideal design: it adds latency an=
d
> uses resources in Dom0 when actually we could do without it.
>=20
> A better model for VM-to-VM communication would be to have the VM talk
> to each other directly via grant table or pre-shared memory (see the stat=
ic
> shared memory feature) or via Xen hypercalls (see Argo.)

The goal is to make android trout VM run with XEN + i.MX95, so need vsock.

Thanks,
Peng.

>=20
> For a good Xen design, I think the virtio-vsock backend would need to be =
in
> Xen itself (the hypervisor).
>=20
> Of course that is more work and it doesn't help you with the specific que=
stion
> you had below :-)
>=20
> For that, I don't have a pointer to help you but maybe others in CC have.
>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> On Fri, 23 Feb 2024, Peng Fan wrote:
> > Hi All,
> >
> > Has anyone make virtio-vsock on xen work? My dm args as below:
> >
> > virtio =3D [
> >
> 'backend=3D0,type=3Dvirtio,device,transport=3Dpci,bdf=3D05:00.0,backend_t=
ype=3Dqem
> u,grant_usage=3Dtrue'
> > ]
> > device_model_args =3D [
> > '-D', '/home/root/qemu_log.txt',
> > '-d',
> > 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,trace:*
> > pci_route*,trace:*handle_ioreq*,trace:*xen*',
> > '-device',
> > 'vhost-vsock-pci,iommu_platform=3Dfalse,id=3Dvhost-vsock-pci0,bus=3Dpci=
e.0,a
> > ddr=3D5.0,guest-cid=3D3']
> >
> > During my test, it always return failure in dom0 kernel in below code:
> >
> > vhost_transport_do_send_pkt {
> > ...
> >                nbytes =3D copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
> >                 if (nbytes !=3D sizeof(*hdr)) {
> >                         vq_err(vq, "Faulted on copying pkt hdr %x %x %x=
 %px\n",
> nbytes, sizeof(*hdr),
> > __builtin_object_size(hdr, 0), &iov_iter);
> >                         kfree_skb(skb);
> >                         break;
> >                 }
> > }
> >
> > I checked copy_to_iter, it is copy data to __user addr, but it never
> > pass, the copy to __user addr always return 0 bytes copied.
> >
> > The asm code "sttr x7, [x6]" will trigger data abort, the kernel will
> > run into do_page_fault, but lock_mm_and_find_vma report it is
> > VM_FAULT_BADMAP, that means the __user addr is not mapped, no vma
> has this addr.
> >
> > I am not sure what may cause this. Appreciate if any comments.
> >
> > BTW: I tested blk pci, it works, so the virtio pci should work on my se=
tup.
> >
> > Thanks,
> > Peng.
> >

