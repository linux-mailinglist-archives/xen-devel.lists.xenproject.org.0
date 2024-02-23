Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D1861124
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684831.1064994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUNj-0002RR-Up; Fri, 23 Feb 2024 12:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684831.1064994; Fri, 23 Feb 2024 12:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUNj-0002PM-SC; Fri, 23 Feb 2024 12:10:23 +0000
Received: by outflank-mailman (input) for mailman id 684831;
 Fri, 23 Feb 2024 12:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvZq=KA=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rdUNi-0002PG-9h
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:10:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 836d8d55-d244-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:10:20 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Fri, 23 Feb
 2024 12:10:18 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::4ac3:3559:4200:38e1]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::4ac3:3559:4200:38e1%4]) with mapi id 15.20.7292.036; Fri, 23 Feb 2024
 12:10:18 +0000
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
X-Inumbo-ID: 836d8d55-d244-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtavfOpLmmktXl29XoSBANRMm08NpW5JEH4HPixU28wvoX8yCA05MkeBZjAEHM+FhnttaGhcX2MIF8oazi4xmO8ZwpQc2OkmqTiU9LeLXw1JQArzDx8jpsWFNJPa+tYfQi2dyXmYcWLwlmKGJt4Bpgdcw7bc1wj0RZjhmL24gntZB0BohqN9LY91DuuXhMi415gB9twFBWZTRiNM6iQUa8YuWBdHKDuCcE8jliLWSjOWfdrW5DCSCnU6SE9tbpReL/rGwIygA1tHOHnv5qrVlFTNRXifemBq1L2SznvYzUT7MO+vpR9xnsYPUxdgqN5UmvD1rVfGOUth374PWRCLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfu5C4ujnHdSPWzaSeFwKT7LbJnPZHwHqjo7MkanO/Q=;
 b=NKofgqmYF7BKonp04xMDGPcT1wZ1TVdrm51VZIil2HdUvUjlTzFT72Enw4ru+3oiaXDE9YhDOCa3B8sJWYhrsNhzRTYVt1fOPRfk9pBtIdyIlBoV4u1gaFP0lz8h1BRrlP/QqvyA2Ph/yz7EW56PbiSkz7SgI0zVlOlQ+pGjjtOTC9/swryjusPmMrtcJqG4HWEf3nr5WtcnLmdVBU2RTanOBUllDjji6qzq9toiKgRdSCm3hGWg8mJplhO0tt/QJUOf8MUG8nQN9R6eW6Pbn9TdigltoH+hjHQ0CFVS3dI1hC3ffZ5AQdmluar9RyJz9aAOBTLnAzXOCH6GTsgSTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfu5C4ujnHdSPWzaSeFwKT7LbJnPZHwHqjo7MkanO/Q=;
 b=djhmb+SJI13v3vTHeNsNnHNKua1ELEtJiGaM74LLMODifSkn2bgdjXzKi6ffqaOJiiwJG0pfy8AKhpj1bsXqvc4fJYnVSdYBj2QQqoIHyy0DvTQS1FpkPFu5+aiSfWj3oBCecDwtCq1DUpelhgCzfHIftZ087JOa2oIjlSaz/R8=
From: Peng Fan <peng.fan@nxp.com>
To: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Julien Grall
	<julien@xen.org>, "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, Leo Yan
	<leo.yan@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	"stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng
 Fan <peng.fan@nxp.com>
Subject: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbw==
Date: Fri, 23 Feb 2024 12:10:18 +0000
Message-ID:
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM9PR04MB8844:EE_
x-ms-office365-filtering-correlation-id: b99384cd-4f98-47bf-934e-08dc34686690
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IugZv6lDnmZwrQBXIeUY/87odEBpbkbJqFSwARZyKcBHsOiDjoISQA4FkWa8dtStTyh7nQzwiwn+tiFqFEOmvm+m0pn9oeEXR+uiQLLZEsUwwl5Fv54oNIeVD4JPTmxEXgeXs29ezwLbEXdmvi2DNtXSIkJWaB8WfJPDuLMowJRLY/uh1G12/Xev03m2DXnTIArQwsL9cTWvAYNQ84AaAOC4WM0z/VKI2q/FbgbellyGKFMzmeO4DjNhtsNAMdTyoAffWfRFVSbGPQ+bY0gPhKwkSgpzsedfM7aU1OH9QN5X6AHCZcrVcmlbHUHWbWaJOT/VeYoLQiGg765ITfZaRh92tTLPNh7v79+sYHs/d1KiHLsYV897wQrfgQ6V35ywEUO6kbzyRkpWxX+ZWivoFdjbyDaODWYaoayMKoz/zYj47afCgmvyV7ng6Z2BHoBVPGR4H/5t8ps94FYgL1BZfuauJRUAgwJi8rAPpgSN/6fFP8ZqCx/1GQk3yv3tewVOlP37qEEfhIzzkFElh/0pzWGjlNz3V7+PhqyYGT189kM0dA1amnJ3/ExPWrybr2B/6SqaSwiku25DHZ3YL3d7GtCvltU5TkoiGcfLPf4mxQMqPBOiKk1hXO7Llk5HKCCq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?B08cS3UZivHozT3M3F2wChgFB9ansk+hBrM6AfLVlAoBubLZLuxMIcnoTWzd?=
 =?us-ascii?Q?2CoEntLAGRhKGUZKA64TzyOA/0d41YLUZPMmft1sftHkdWlm/44n+VCJEBiB?=
 =?us-ascii?Q?R3xaUe8l2ue7m9EFSWIZrQNRxgeHtU54Uu2fSerPq9IcFxTFJkDHHWd4E69P?=
 =?us-ascii?Q?dB1hewfN7IrTq+u7tDfhu9+cqfz9wZA8IVXlMGJX2eVcRNa3Gd5HRanOkqoe?=
 =?us-ascii?Q?kem4wwmpERA+Quw/pzhn07Zb6r/0vz5+Zj4tjrPqtZRfGAXVRgG8Uwh2B95x?=
 =?us-ascii?Q?QxnsHF67iTIkLnx8ocG0wTyMFj7U7NFm7sb1OxtDdzMewabGqSzzuCJGPGyy?=
 =?us-ascii?Q?wm+Ifr8eM6LkigJMRrdnhb1GEYWOndZuw5OYANs9m8aZmYpSENm5yzM4xijx?=
 =?us-ascii?Q?K89qU9w20nIO8nDRx9aC5g6YIPA8Gkc4Z9u1uNKtR9Xpkt/0PEQoP6kLcl82?=
 =?us-ascii?Q?C+If5KTFtpDNnbzuxMIxGvXwp2PjxuskxAHwcKErvOjsYK/TeZarQ+/Ta29d?=
 =?us-ascii?Q?fFEjPb28n8A6yGWI6xi/iXVw6O/+BTjtlMZC8EzMlAWpqxWXKaEJHr7nAEHL?=
 =?us-ascii?Q?5bg7IFKa92z8/qE5f5CUipnCuoN7yZ3e5KTvC7hP2fxjXLON2Dok11l8XLe9?=
 =?us-ascii?Q?oZqO6HrX0DvlH4WjDhs3mDzUcRov1J4xW2FOPewLF56hZNvkTW1eXWqBc/UY?=
 =?us-ascii?Q?ggtEh5A9xbJb1EVuqVsrGzPQ5C2B0qxC+XFqHvS+dsJk7nkU/tjKEJG2WDgB?=
 =?us-ascii?Q?48rR2iL9nBOi0i0FLfB7UiOdHfh0Ng7bps2jnVFMlOj5xPQFvG1JSDWwKbuo?=
 =?us-ascii?Q?RwypcL/ZanF0AfwYGj3RCFXmfSgoeKWVhWwtnCDgsZ/622e5p3nl9OTcX9p7?=
 =?us-ascii?Q?dhPv4HVLP3TVauJUcTySNkoTO5zPHd15ZmPCFgQEDbDl1mKLuO7y5IvqAAlc?=
 =?us-ascii?Q?oUp0it5Wsm3Yx8THYhTn7wRQZWEN1fGTJ6e5PAAHAdD15044Czno2v+d78MF?=
 =?us-ascii?Q?/+65umEw/5m1k3o4hZraCeVE9iViN/O5oNwtZsWuYlKt+MHoh2y+PrS/6wbO?=
 =?us-ascii?Q?rvGqwgJaqgHRXWRTAuslJWLz0EUn76Ww8rR3MsijoroqB8/7Hn2ajNS3spAk?=
 =?us-ascii?Q?iZYx8lHtPXpZ3G16BZlPZU594B28ZiAGsOybYS3bYd6Qfa8vmGEG5MMHrAD8?=
 =?us-ascii?Q?/OZxXZcCCIqNeZ5KWyrpWIBbA4d2GfwYA/FVHJ7BA7+B7lxu+oO18cwZDgdo?=
 =?us-ascii?Q?fZmXCMDr9k3IvNxoBLSxczav8bGMlKcwIUHYPkimtTbG5Z3mpOBfoY20Zp4M?=
 =?us-ascii?Q?LiVgI4MVdnF6ibb4GdBPhtk6nFctMPtBDLP/h+RarE4J76pOpThrTz7y7u2O?=
 =?us-ascii?Q?kqJuI66ICu0+3oMnLD+MfIVvrBS9uJFMgsDtwFhu/ffyvpd2u+hBdIXUg5x8?=
 =?us-ascii?Q?DtQ509neEiB5Ia8hpyqgCA2dYtyUOHqtKZOLWU6bzCEZwhQYIY6qqIeskhTw?=
 =?us-ascii?Q?qsKrTU9oQ4cMHG7fxpNGliyQVBjQQNHJ4Om6fKD7YxlaHW+focEQ5WbbpLjv?=
 =?us-ascii?Q?e44B3xBET8erFm8f86o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99384cd-4f98-47bf-934e-08dc34686690
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 12:10:18.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pscayf22oatOshqZpFEQq+eZ89Ev9rjMK3ybVHjrMJeaJqIoXsCcpJlU6O8mcX2kOkorwzIo9Xy0y2I9Qd9nFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

Hi All,

Has anyone make virtio-vsock on xen work? My dm args as below:

virtio =3D [
'backend=3D0,type=3Dvirtio,device,transport=3Dpci,bdf=3D05:00.0,backend_typ=
e=3Dqemu,grant_usage=3Dtrue'
]
device_model_args =3D [
'-D', '/home/root/qemu_log.txt',
'-d', 'trace:*vsock*,trace:*vhost*,trace:*virtio*,trace:*pci_update*,trace:=
*pci_route*,trace:*handle_ioreq*,trace:*xen*',
'-device', 'vhost-vsock-pci,iommu_platform=3Dfalse,id=3Dvhost-vsock-pci0,bu=
s=3Dpcie.0,addr=3D5.0,guest-cid=3D3']

During my test, it always return failure in dom0 kernel in below code:

vhost_transport_do_send_pkt {
...
               nbytes =3D copy_to_iter(hdr, sizeof(*hdr), &iov_iter);      =
                         =20
                if (nbytes !=3D sizeof(*hdr)) {                            =
                          =20
                        vq_err(vq, "Faulted on copying pkt hdr %x %x %x %px=
\n", nbytes, sizeof(*hdr),                       =20
__builtin_object_size(hdr, 0), &iov_iter);
                        kfree_skb(skb);                                    =
                        =20
                        break;                                             =
                        =20
                } =20
}

I checked copy_to_iter, it is copy data to __user addr, but it never pass,=
=20
the copy to __user addr always return 0 bytes copied.

The asm code "sttr x7, [x6]" will trigger data abort, the kernel will run
into do_page_fault, but lock_mm_and_find_vma report it is VM_FAULT_BADMAP,
that means the __user addr is not mapped, no vma has this addr.

I am not sure what may cause this. Appreciate if any comments.

BTW: I tested blk pci, it works, so the virtio pci should work on my setup.

Thanks,
Peng.

