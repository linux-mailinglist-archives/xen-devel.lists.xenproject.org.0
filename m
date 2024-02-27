Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498286850D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 01:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685845.1067232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relUO-0002Aw-7O; Tue, 27 Feb 2024 00:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685845.1067232; Tue, 27 Feb 2024 00:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relUO-00028j-4S; Tue, 27 Feb 2024 00:38:32 +0000
Received: by outflank-mailman (input) for mailman id 685845;
 Tue, 27 Feb 2024 00:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uNB2=KE=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1relUM-00027y-Cs
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 00:38:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2611::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865ab8bd-d508-11ee-8a58-1f161083a0e0;
 Tue, 27 Feb 2024 01:38:29 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 00:38:26 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd%4]) with mapi id 15.20.7316.034; Tue, 27 Feb 2024
 00:38:26 +0000
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
X-Inumbo-ID: 865ab8bd-d508-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvB1OMEAMRGEzGeYcguzntm56Zsby+CdnlNFZKo7QQUSlMmLNqfSsjqF8f3Ge0yEoOiaVsSOSVZKdn2JRhR9hPe8sRMcduGAsTSe4yJlYPW+yWQZh6JfBflJTKbM/bmjq9FWIrE1pxcMdXYB+X77edkHLgaU7k8VOWhdfQK+6GR3HPhuM7RCe+X03y3NBgc9JXPU2aIp38CSW5L0QVK9G/6xPdCWy88G3zAu/kFdkabN4In6J+Hqiu0pc31gUibiQiDTxn17gOQKblAABojU4rsIZfEsVBDVzeirLPDWNAgDz7wB9IA38Mcn49QlFLErftmqBoaT5topReijort2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z97EjzGtu9/xxGGajgA60u5lrmI1O9k7D6WquivLoc=;
 b=K/MWDVzwx+EQX7NIyRCUCWkMM6jl7CrrEVTyFAfivUcKdSSpRxackFJwDpZ5vIJHVN2KS3SgM8c0UBbUKCiJduAaS4DifVCTNhuEcqwhT9Qbrr8e1VSGKd2FnMUc3sva/ooxS+sXTfSHi7vkgTgrjoxNwEYLPHTUt6aHQZ7YhLrqqH3WCEr8LOqcS43PXYoohCmHO8TZEMbvJDn0UewohKT2v6zuUjh7xOp3ZmX8O2WG3MIX2Ec5WQW+ZHucSjrgxnCe66WUis+tmszrHWoKo+dKrI72rvdVwPSpZFcqSE3AhX8LWvpRl9NXh02J6IfFu5I7H2jXjuV+Dj38wLUF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z97EjzGtu9/xxGGajgA60u5lrmI1O9k7D6WquivLoc=;
 b=mPp8wqxhTgnPRMrwGc/X7AianILchKsp58k+m61unkZnrFkQf/je99fBcWLXuj2R1Aa20RedTBSml1QdBITmrxSfRwxDfEKlOZtZc6Gx7BqvR4ZAzIUhT5wcABZUCgb4u8CsZVMg0WDimT8IkgPzX+CUIn4bPH/DbHl59RjY/XI=
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
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAAG+7FYAAJ8zQAAAFc0Og
Date: Tue, 27 Feb 2024 00:38:26 +0000
Message-ID:
 <DU0PR04MB94178062C441EBBAF5D0BF2888592@DU0PR04MB9417.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
 <DU0PR04MB941746B1F385B6A514704F2B885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402261359280.247676@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2402261359280.247676@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|GVXPR04MB9734:EE_
x-ms-office365-filtering-correlation-id: c92ece35-f0ed-42cf-58c8-08dc372c6914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UQW1x/Ly6oh9pO0phiA+7b8Kps6Fp2rpW7mOMy4r41a0HYiNgAJGIP0mzlJvpNIMCGLnBY5dzfxqcRjRn7+VnEedYs9F45mm5EmVwGCC3Kszbt4Poa4rMzvP+C+psH/LioHEhyXxIubsrzEVVZdI66a2z2I3zHmuUHtiRfidxQZFL7AjqfrzUzw1ny6uom+6roNATLKAqnj4O32przE8mvKObbB0jGZ/CCABjuxY5u3whvXUe07QgBeWfaSlJEkQbxjTyGLbGvTQQxYkNvz58EY7y0GYnVTpLeQPcKV9aktp6AvCHZpruzL8pWPqFAIOBYvxkhek7YiUaJGrMjaDIZ8WyRrdWEiC5n4ObAPH4po4i5HTARHc533YGq9Cc3ICmpNmByW3VU0SajVn3dmg+QJjlchVdkcU5OMDsrj4QlD+eSMeHeCL32WCFnA41/L1eEUkdbFD/c/SfZezCOYh/hTd2p1QgIRevDe8TBs4jp68y0lumOLzJg18o4tKtg2oXY/7FE2oTSKtBWiADklOOJnPedPOHLTyvF0WoCjujCerFyQ13e3EfPYkF4l6wzdtJY/7p9+gDZv0X+Ji2rQuA6+eSh6aWOOgiozjp4lWvqC8cRVGULRX9wg+qlR3s8n8eqdlROrJ/VdkFE+myIdnOf6ZNo1RjpFnJeGaVSSRGnbOXB6l9RyZ0M8dluW411kWNiX9m+1K60qCOxaOBbe/lA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w5+wLzuzHhhWiVx33Z0QuTlbuKxX5oP1WREYooLeqt6zM+UBw61361jOCESO?=
 =?us-ascii?Q?r4NsTik0/2gxwN6nV2KTKpuY+nWywtbRu2ZORZEGYJ8cvhzOigOZqAqZyJJH?=
 =?us-ascii?Q?jqCXu38uN9GNPlYSCmSZMroXOjmdefsLyu9VG1o5lLYueyVB7kDQuFyRRW1I?=
 =?us-ascii?Q?pduFZ+YKMnKt5XmQBNJ6sGYJzFfcltCwTVeRXAINVStXS39JINzEjoVnbzN5?=
 =?us-ascii?Q?Hz8F51uVhgouS1sBa0xOy9LRHryD2qY51Vd8UYpDfyrlqfB4npoBlwJD5sDi?=
 =?us-ascii?Q?3nE0hoSkGOd6qCcpYmEwnD9BUKPbuUZb7BxRKyijT9Cr/Tg6CRcsEhdZSVWI?=
 =?us-ascii?Q?56KpcmPxHh1n8Qdoja+F3MEln9mNEJqgUm6ynefY4wbcemDq2rs7UdURT5BP?=
 =?us-ascii?Q?RaRV7lcTh361dP6Z4n0Y/7Ra0bHhFWWDDuZYufLT7GzPHKyaU6vd5fpevTDp?=
 =?us-ascii?Q?vrdKfJ3Hay0gejPtCbsklyPPIRwMhY6S8lPn7Dvg001HZixeIJbbm3hes4Nm?=
 =?us-ascii?Q?KfbpRlaz99BBXFX3Ny2kdAHHtg0Un3ISKTiT8M2Inwq11bo3iVL0EOnuw9u9?=
 =?us-ascii?Q?/1jlgf7SGVEMcnL0K+JmZld7nTS+xK586qB9vCq3EFRReBpwMRnW1nMsWWlv?=
 =?us-ascii?Q?jUmVHpA0a04t2TeTs4LFhnPxWBRWmT/UQsnhQqU6NAHUDs5LHzspP9OAlkRy?=
 =?us-ascii?Q?h1GU+iTMUF6wBHnwqnSje8dHuv6qdJZfCLvY3IC6Knt2KX80nTDcDjq9NxXW?=
 =?us-ascii?Q?SUv1OK57MxsuAXwRrxy5JZejw33eFB3t88Yh4uv8GVbK78GeyxQsyodMq+CX?=
 =?us-ascii?Q?+/ACn3hqnmIi1zHgireMvD1OD6M2VB7hT34csMetjaIuc/AS+65a2bbD6tLZ?=
 =?us-ascii?Q?dMWmeQNyrrnixfbE7lslNoLJz//F72HGk0oFxxKgovhtxp+yAbtAHMvUxput?=
 =?us-ascii?Q?pGlt7rGD7WWgaiZk55VLM+0kVV4SQF25WWSNdLW0fkU5wRrIrAmbyK4mUWs7?=
 =?us-ascii?Q?BESKV2oDKDQJiXgYYZ+o7r2iPD0EdrLmSlOFfXOIKRycr1xoguYNA+C1+zmo?=
 =?us-ascii?Q?zhOFJsamctEKnftNzS05DBUxsg/lCP11KPtMtUp/V+/WWm2jwJte9XQIYjme?=
 =?us-ascii?Q?T6qw2W97I49zC+4CDUDL5Q3nLrKJbJaYGC0bxLPC//Ibolrl4VobWQH53tiG?=
 =?us-ascii?Q?ZSbd+7GNPf/a9PGoqMRqjdUE/B8Mr6+VAth3TxEPoQp13dmUuXB/ml+JCNdV?=
 =?us-ascii?Q?fRGBr3ZEmw6DFFwIn5YBeDMO+TXGsGOCevULJhY40WVneZ46a5NaMEzzWThq?=
 =?us-ascii?Q?h/6jDtVAT4fPgMUfb3fR84QkwDRb5wAsEgDszBAhmwguatTroWWRfR3QatDI?=
 =?us-ascii?Q?mKmu4ZhDByy0jjsyMZIh8q7kz3gzpnW6dDZvpxn/OCUOhYKPkB80cAYwV2gA?=
 =?us-ascii?Q?/VWt6SgkNP5yIPVUNqCDmq+uvl9yfTN0MeIdeOsAlEnJRBay3EIObnxFBm+p?=
 =?us-ascii?Q?Ck2dA8aX2gA5K/Dq+eZqVMpHlnj7yDtjn4dctHwfqheKLdbroCU6cxt2U6eQ?=
 =?us-ascii?Q?8nbt2nAQgg+b+h4hI8o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92ece35-f0ed-42cf-58c8-08dc372c6914
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 00:38:26.0405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MyBlp6xPqZsinYfZqGM5hJYN5wQBrB8MpCmrmoCIvCHq3JJxayJb4nb/JA/zq7vOqKhZTo+0Gg0MlzALG4DRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734

> Subject: RE: question about virtio-vsock on xen
>=20
> On Mon, 26 Feb 2024, Peng Fan wrote:
> > Hi Stefano,
> >
> > > Subject: Re: question about virtio-vsock on xen
> > >
> > > Hi Peng,
> > >
> > > We haven't tried to setup virtio-vsock yet.
> > >
> > > In general, I am very supportive of using QEMU for virtio backends.
> > > We use QEMU to provide virtio-net, virtio-block, virtio-console and m=
ore.
> >
> > Would you mind share how to setup virtio-console using qemu + xen?
>=20
> Vikram (CCed) has been working on it and should be able to share more
> details
>=20
>=20
> > > However, typically virtio-vsock comes into play for VM-to-VM
> > > communication, which is different. Going via QEMU in Dom0 just to
> > > have 1 VM communicate with another VM is not an ideal design: it
> > > adds latency and uses resources in Dom0 when actually we could do
> without it.
> > >
> > > A better model for VM-to-VM communication would be to have the VM
> > > talk to each other directly via grant table or pre-shared memory
> > > (see the static shared memory feature) or via Xen hypercalls (see
> > > Argo.)
> >
> > The goal is to make android trout VM run with XEN + i.MX95, so need vso=
ck.
>=20
> I am not familiar with the details of Android Trout... Where is vsock use=
d?
> Just asking for my own understanding.

Here is the link
https://source.android.com/docs/automotive/virtualization/reference_platfor=
m

vsock is used for audio control hal, dumpstate HAL, vehicle HAL.

Regards,
Peng.

>=20
>=20
> > > For a good Xen design, I think the virtio-vsock backend would need
> > > to be in Xen itself (the hypervisor).
> > >
> > > Of course that is more work and it doesn't help you with the
> > > specific question you had below :-)
> > >
> > > For that, I don't have a pointer to help you but maybe others in CC h=
ave.
> > >
> > > Cheers,
> > >
> > > Stefano
> > >
> > >
> > > On Fri, 23 Feb 2024, Peng Fan wrote:
> > > > Hi All,
> > > >
> > > > Has anyone make virtio-vsock on xen work? My dm args as below:
> > > >
> > > > virtio =3D [
> > > >
> > > 'backend=3D0,type=3Dvirtio,device,transport=3Dpci,bdf=3D05:00.0,backe=
nd_type
> > > =3Dqem
> > > u,grant_usage=3Dtrue'
> > > > ]
> > > > device_model_args =3D [
> > > > '-D', '/home/root/qemu_log.txt',
> > > > '-d',
> > > > 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,tra
> > > > ce:* pci_route*,trace:*handle_ioreq*,trace:*xen*',
> > > > '-device',
> > > > 'vhost-vsock-pci,iommu_platform=3Dfalse,id=3Dvhost-vsock-pci0,bus=
=3Dpcie
> > > > .0,a
> > > > ddr=3D5.0,guest-cid=3D3']
> > > >
> > > > During my test, it always return failure in dom0 kernel in below co=
de:
> > > >
> > > > vhost_transport_do_send_pkt {
> > > > ...
> > > >                nbytes =3D copy_to_iter(hdr, sizeof(*hdr), &iov_iter=
);
> > > >                 if (nbytes !=3D sizeof(*hdr)) {
> > > >                         vq_err(vq, "Faulted on copying pkt hdr %x
> > > > %x %x %px\n",
> > > nbytes, sizeof(*hdr),
> > > > __builtin_object_size(hdr, 0), &iov_iter);
> > > >                         kfree_skb(skb);
> > > >                         break;
> > > >                 }
> > > > }
> > > >
> > > > I checked copy_to_iter, it is copy data to __user addr, but it
> > > > never pass, the copy to __user addr always return 0 bytes copied.
> > > >
> > > > The asm code "sttr x7, [x6]" will trigger data abort, the kernel
> > > > will run into do_page_fault, but lock_mm_and_find_vma report it is
> > > > VM_FAULT_BADMAP, that means the __user addr is not mapped, no
> vma
> > > has this addr.
> > > >
> > > > I am not sure what may cause this. Appreciate if any comments.
> > > >
> > > > BTW: I tested blk pci, it works, so the virtio pci should work on m=
y setup.
> > > >
> > > > Thanks,
> > > > Peng.
> > > >
> >

