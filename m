Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E535983A6C0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670657.1043975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaTf-0002EL-9x; Wed, 24 Jan 2024 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670657.1043975; Wed, 24 Jan 2024 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaTf-0002BC-5C; Wed, 24 Jan 2024 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 670657;
 Wed, 24 Jan 2024 01:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSeL=JC=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rSRoi-0005UB-J3
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 01:12:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7ee1535-ba55-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 02:12:35 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Wed, 24 Jan
 2024 01:12:32 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7202.031; Wed, 24 Jan 2024
 01:12:31 +0000
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
X-Inumbo-ID: a7ee1535-ba55-11ee-98f5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5qMPJZGa+RmHXqmfby8a3KMvRyOlZYQ1UNF3LqOVkGaFIU1Tp4VgYJ75t7F9NQSV22aCF/loVGguw1/VHB1XzhkmDf2aumKBqDIBPMOXlcihRw2fuixE20qLeetJg0W3IccK9zbtiOPyuEy9c2gJwh+bULjVzkNHZsmFCMFh7iJCCLVJ3JSQCR53hSO/eCBfUtITAYbPtw7vhkNIxkMTN3LhAdBPm5hzUcdwcKlYEa12wS9mceuPlOhX5ymqjOMRLZjEj5Q4kxqSfv6bNOoAP1QwjxYgK0SRTQwAjZ6nu7WvKkAPaIVnrC79Hl8Tnxz+9c68J5ld1KJXGb6p5MZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Uh5Uuewj3HrZv8HvNW0sw98JGv5swA2ITXbEp8Fm9k=;
 b=Rxanh8BPZ1gw3c2ybkkb9CfWF3OkaElyTODzUJpaPs9Yd2N7k8nxsEF/oIfk8PG7/AIZW9beiyX/NEcyxeOFXpq/nOXimHRGluCPa1n0WWdqdVr4+MRP+dCIpzwpDoMJ/4Lc15zYnR7NgmdFXXNwrRJ3L2HQp7MoQiUDR2lMjAzgnWxwMCuGWJwd6+jF5M/V7ZGT3ORVEm8EMDjP3Mw0qP/qE1ikXflbg0vB7UaT2hUtMXINzpA5VkuFpsZt5Ct1JXkTaaeiqpk55SxPH1kSvwtNY9C3KWF239TF7XWwa0NogcUc3HxDk+PU0jamk4FBT/+Jg/DVzgfhZyk1y928EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Uh5Uuewj3HrZv8HvNW0sw98JGv5swA2ITXbEp8Fm9k=;
 b=fL86yTR7Uq+xMmbNB5XLFekOlN80piDURrt7wDY+OdFzR5htWbUaTFcoXIQBnSJ4mGs5khXvdBrLLEPhknLNKIh0p1IL7rbY9q25/yHRA/+tl2yDeT4WzT9GfqTmkS/M9meNmGLrspoRUe3DrHbT/Ssx87lnJDkYuy6mgJM5m+k=
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "anthony.perard@citrix.com" <anthony.perard@citrix.com>, "paul@xen.org"
	<paul@xen.org>, "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] xen: Drop out of coroutine context
 xen_invalidate_map_cache_entry
Thread-Topic: [PATCH] xen: Drop out of coroutine context
 xen_invalidate_map_cache_entry
Thread-Index: AQHaSIFf0aPvG3VKVE6r93sE3K93tLDoL1+AgAACyxA=
Date: Wed, 24 Jan 2024 01:12:31 +0000
Message-ID:
 <DU0PR04MB9417727EDAF25B0CCC228DD4887B2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240116143622.6641-1-peng.fan@oss.nxp.com>
 <alpine.DEB.2.22.394.2401231655530.2287888@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2401231655530.2287888@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS1PR04MB9430:EE_
x-ms-office365-filtering-correlation-id: 4b6c043a-ecf9-49be-4a78-08dc1c798a5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 36W8ezj0V81gaIVN0yS4oETonN+jBsNleCvduOBT9dx0T/MMzVaSCD+55m1NeXVKt8JIW6bJi7xwNfPgw4ppT6r4mwwv+7YwOfFQOVqjQ+LM2Hztyi9nF7tNNXakSQux500cmWxiwC7ivwCAuqo9iVeofSi1BvP8LWMfVi9kbGhG8Hz4EiAZiv94kV/yUbBDtOoO6JeO6ZgcLQZlesDWny3IbLVDabL9tTyRz4MzMqN15uLDJy0jFvjvjhzTjPSBf0VHsrvJXPsxAdqeJqHMrSttsNYVxVMwfzpqnnQLPhcg0+hoG4qPdG0Arz4z5car9DRjzIMhNONyDhMSRBE99q4dY1iyDdyBys8Zrbbi5roJG5WIIELXkyAabsaTIDnjOrM0SL3GeZTmap/kVxzuVojv8fZqGqDYxqAA89W+dWkLKHqvkRMIwfejbGd7zcGGh74trQwmzMfPNlDDzIf/IgrdICE1tKZy1JO+R/nlVKlYxQuLnL/aUSM1CjThShXlwa+nPBuw/lx3jItXQRA88xRRrzwILk1dHPBOeLbNMg7JyRyVU/cjvgEux4pjd4L35T5eyhwzDCBP09zpUujl1KyVhGiRx27oU0B+OVIr+IEBNUBBB9+cnQPDyaCRS5CX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(478600001)(55016003)(71200400001)(83380400001)(52536014)(38100700002)(122000001)(5660300002)(44832011)(6506007)(8676002)(7696005)(4326008)(8936002)(2906002)(26005)(66946007)(66446008)(86362001)(9686003)(33656002)(41300700001)(316002)(38070700009)(54906003)(66556008)(66476007)(76116006)(64756008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yeKfW96zKjWEQpwO/8Yd+25E/IQJIZkNVhBQFH09ki8d2o/IJmQ9ameDVuja?=
 =?us-ascii?Q?Z0u6OnnF//0nMReKF75fUA81GsvBgpKgAlmzBuQspmwUSP1GlIO9eBmatRWd?=
 =?us-ascii?Q?ByBeXFBREg78eFvOHT3vt2Z57pPOGcLRbp0z/fG1cgX5svsjmr3oYfLoL6fR?=
 =?us-ascii?Q?o5isyyHmXq4XC9p6nsOVQTlxbbhmoS76VJaa5zBa4M72zIGKhJ5KcFy31s1h?=
 =?us-ascii?Q?jg7hbz1H/ziIK6AYaItDx61ILz4dBhVz96EQB/nlngPQK4axftmA3eWV6nkt?=
 =?us-ascii?Q?sJZb29nIRM9159qTfvsqjLqpAujaHHmzeqTLHU0biop2xgt9MQ9AFvI/OszQ?=
 =?us-ascii?Q?ujFbq+ybrVM7qpGBUmI4VdA+eL4jrbu59iVHgtrvVIhb6PSFGvuYiqUhEykX?=
 =?us-ascii?Q?Hm6gpFCq/uDFHYcH+czIrwV8pzNuBWCS/vStZ2sGgPblYq5cQi6NGavwhiTx?=
 =?us-ascii?Q?o1GZY+wLWGosTlEDGWqRyD9qKF9iVTnnJm3DkRgbfKDyefQXhfFzhreN6nDf?=
 =?us-ascii?Q?I9OvtuIn3MHmsSNjLT1lDmLhzJDUM31f1Od4w4H2RIc1k/Fi9aaAqIb8sAh8?=
 =?us-ascii?Q?dDuyRqlvpo9LT/5LlwdaXt6MvJy9V+gkE/r4xhwrrg7TlzIwC1qocftphgQK?=
 =?us-ascii?Q?T6USKruCSZmW+RC19HCETluym9/FppZtYOte/PNXuIKoG8sfSbWQz7XR/OqY?=
 =?us-ascii?Q?y5mhXTyooGR/PTqv8BT5OsSK3E/GNJF5ONBLdFTZYayKzVXTLAtAmQUKz4Am?=
 =?us-ascii?Q?Q7rECc+PIc9nu6QtU5rmE3P1U/nEOjTELIchz4P9/pcGDYVs95M8AiGt3a11?=
 =?us-ascii?Q?UPEluY3XwziBj/vsXOcvWXgaT5DnS018wc1Z0ySzutAG13d/6w4bpJeqRMic?=
 =?us-ascii?Q?LmUTUEgqFdfHoxJpgy2hLw+cei4rdeZkdOIiWn/MqCKY1O7oeDJEdR2GZ6BG?=
 =?us-ascii?Q?5obcwUoEe7iuS55XYNrcdZovyA7zw/86WkBZtQEGCLuw9mJ1X6Mg61oZB86F?=
 =?us-ascii?Q?UCRuAPb6HueL/5lE8+CuKXvhd3wy7sJ9NY+18X+95KmdP2Dign7RjtfZ8YkH?=
 =?us-ascii?Q?ESRr6swyYzFMWUMELARXUC5WihuQCeDxIGJ7Oe87GnuJa3wjn4gfqlO79sJ9?=
 =?us-ascii?Q?fIMGDU27H5Fd1x5m8D6mzw43OLi+lmhWjtSIn79U6iGesEZk54nftzYNpXH5?=
 =?us-ascii?Q?dpitzNJG5wq8WWXUfnMQxhc9PzXOdTXmW47sqrCgIyhHhBgBSNGz7ZvAX8MH?=
 =?us-ascii?Q?cc+BtOqZ6TC1AJmOGJM0LxaN76xSYes5qaPUO/+BvgySh9W/c8JjC3aWEtul?=
 =?us-ascii?Q?ytf5DJX0kWE+y3bSJ88ndemPZEXcZSm+MZl/d5FvpQENVDE2DUzmqazofXVF?=
 =?us-ascii?Q?4mwd8jnm4nBu5HWemxzS4kaD4s54Xn226VZwTEDkCpkG2vZHUrTSxpF0y1Gq?=
 =?us-ascii?Q?Se4GSIU2t11mWOZapFmQpPKhsIhf4LA6AZxydtpY6OEQq/6tQxViWxO2Isgp?=
 =?us-ascii?Q?PR9C997/+5syDn6690EvR8tfKD9sNymOiZVsmQnOgp+IYe9aHAd0UD5aSbfw?=
 =?us-ascii?Q?hm2WSh/+sPQxnvcQPyk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c043a-ecf9-49be-4a78-08dc1c798a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 01:12:31.7535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9ZqRwUusv1bNBY+eWITgJK8s0fU3d5T2gAeKVrkFjEH9REvlgJEOmMQyfDoX36VijHE/wnrOyBA3Qzx7s2Jww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430

> Subject: Re: [PATCH] xen: Drop out of coroutine context
> xen_invalidate_map_cache_entry
>=20
> On Tue, 16 Jan 2024, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > xen_invalidate_map_cache_entry is not expected to run in a coroutine.
> > Without this, there is crash:
> >
> >     signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill=
.c:44
> >     threadid=3D<optimized out>) at pthread_kill.c:78
> >     at /usr/src/debug/glibc/2.38+git-r0/sysdeps/posix/raise.c:26
> >     fmt=3D0xffff9e1ca8a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
> >     assertion=3Dassertion@entry=3D0xaaaae0d25740 "!qemu_in_coroutine()"=
,
> >     file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-xen-dir-remote/block/gr=
aph-
> lock.c", line=3Dline@entry=3D260,
> >     function=3Dfunction@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3>
> "bdrv_graph_rdlock_main_loop") at assert.c:92
> >     assertion=3Dassertion@entry=3D0xaaaae0d25740 "!qemu_in_coroutine()"=
,
> >     file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-xen-dir-remote/block/gr=
aph-
> lock.c", line=3Dline@entry=3D260,
> >     function=3Dfunction@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3>
> "bdrv_graph_rdlock_main_loop") at assert.c:101
> >     at ../qemu-xen-dir-remote/block/graph-lock.c:260
> >     at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-
> remote/include/block/graph-lock.h:259
> >     host=3Dhost@entry=3D0xffff742c8000, size=3Dsize@entry=3D2097152)
> >     at ../qemu-xen-dir-remote/block/io.c:3362
> >     host=3D0xffff742c8000, size=3D2097152)
> >     at ../qemu-xen-dir-remote/block/block-backend.c:2859
> >     host=3D<optimized out>, size=3D<optimized out>, max_size=3D<optimiz=
ed out>)
> >     at ../qemu-xen-dir-remote/block/block-ram-registrar.c:33
> >     size=3D2097152, max_size=3D2097152)
> >     at ../qemu-xen-dir-remote/hw/core/numa.c:883
> >     buffer=3Dbuffer@entry=3D0xffff743c5000 "")
> >     at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:475
> >     buffer=3Dbuffer@entry=3D0xffff743c5000 "")
> >     at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:487
> >     as=3Das@entry=3D0xaaaae1ca3ae8 <address_space_memory>,
> buffer=3D0xffff743c5000,
> >     len=3D<optimized out>, is_write=3Dis_write@entry=3Dtrue,
> >     access_len=3Daccess_len@entry=3D32768)
> >     at ../qemu-xen-dir-remote/system/physmem.c:3199
> >     dir=3DDMA_DIRECTION_FROM_DEVICE, len=3D<optimized out>,
> >     buffer=3D<optimized out>, as=3D0xaaaae1ca3ae8 <address_space_memory=
>)
> >     at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-
> remote/include/sysemu/dma.h:236
> >     elem=3Delem@entry=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769)
> >     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:758
> >     elem=3Delem@entry=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769,
> idx=3Didx@entry=3D0)
> >     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:919
> >     elem=3Delem@entry=3D0xaaaaf620aa30, len=3D32769)
> >     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:994
> >     req=3Dreq@entry=3D0xaaaaf620aa30, status=3Dstatus@entry=3D0 '\000')
> >     at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:67
> >     ret=3D0) at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:136
> >     at ../qemu-xen-dir-remote/block/block-backend.c:1559
> > --Type <RET> for more, q to quit, c to continue without paging--
> >     at ../qemu-xen-dir-remote/block/block-backend.c:1614
> >     i1=3D<optimized out>) at ../qemu-xen-dir-remote/util/coroutine-
> ucontext.c:177
> >     at ../sysdeps/unix/sysv/linux/aarch64/setcontext.S:123
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>=20
> Hi Peng! Many thanks for the patch and for the investigation!
>=20
> Only one minor question below
>=20
>=20
> > ---
> >  hw/xen/xen-mapcache.c | 31 +++++++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c index
> > f7d974677d..4e1bb665ee 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -481,11 +481,38 @@ static void
> xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
> >      g_free(entry);
> >  }
> >
> > -void xen_invalidate_map_cache_entry(uint8_t *buffer)
> > +typedef struct XenMapCacheData {
> > +    Coroutine *co;
> > +    uint8_t *buffer;
> > +    int ret;
>=20
> Do we need int ret? It doesn't look like we are using it.

Good catch, it is not needed, I will drop it in V2.

Thanks,
Peng.

>=20
>=20
> > +} XenMapCacheData;
> > +
> > +static void xen_invalidate_map_cache_entry_bh(void *opaque)
> >  {
> > +    XenMapCacheData *data =3D opaque;
> > +
> >      mapcache_lock();
> > -    xen_invalidate_map_cache_entry_unlocked(buffer);
> > +    xen_invalidate_map_cache_entry_unlocked(data->buffer);
> >      mapcache_unlock();
> > +
> > +    aio_co_wake(data->co);
> > +}
> > +
> > +void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t
> > +*buffer) {
> > +    if (qemu_in_coroutine()) {
> > +        XenMapCacheData data =3D {
> > +            .co =3D qemu_coroutine_self(),
> > +            .buffer =3D buffer,
> > +        };
> > +        aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
> > +                                xen_invalidate_map_cache_entry_bh, &da=
ta);
> > +        qemu_coroutine_yield();
> > +    } else {
> > +        mapcache_lock();
> > +        xen_invalidate_map_cache_entry_unlocked(buffer);
> > +        mapcache_unlock();
> > +    }
> >  }
> >
> >  void xen_invalidate_map_cache(void)
> > --
> > 2.35.3
> >

