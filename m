Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC68251E9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 11:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662060.1031995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLhOt-0005NT-O7; Fri, 05 Jan 2024 10:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662060.1031995; Fri, 05 Jan 2024 10:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLhOt-0005KC-LN; Fri, 05 Jan 2024 10:26:03 +0000
Received: by outflank-mailman (input) for mailman id 662060;
 Fri, 05 Jan 2024 10:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fzlm=IP=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rLhOs-0005K6-6r
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 10:26:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ffff84-abb4-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 11:26:00 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB7781.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 10:25:58 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7135.023; Fri, 5 Jan 2024
 10:25:58 +0000
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
X-Inumbo-ID: d1ffff84-abb4-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTba9/BgxItHJULkueSGiTUW1a1DMFi5zEnk4iCB5JJ7IZJSC8ROUJjYfgiNrku4jnBlE2borCsw9Gxc3gTt/ja7QjEPKeDYyRcfm5591DcF0VgfN2d93rwlW+DjlEx/vtJWz+tVGWfvF0c1HYxkETlx9Q3yqviIGDz1TaLU5ixjKN157MLF26+09FWOYhT2ocUgdqA8mD9abUnRoOkjjPUoMpkJiGZdQic9CIQplt45GI/Ac+mzujSlAw1f6ZYxTlSfl6U4j/NbEF06oZ41w6nnW/h4Y/WtpKQ33K8p+YJHyxhtyNpCEGnaoO4c1zM/lKNE60QdvSb/HUxl1hWTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fBchUzrHlye6vjgeBqx+2rSs8evyNW3KlPmksgmqTQ=;
 b=WpPqnbPK2syLJgPn+tTUlWz5eZVcKn4N0dxxmcrD2S9pt1YRX0hILHSzhbeeH9gGDIFbCTc0VQP+PSSPVS7D+U84HYd+Gdu3pvDmhIkbPIs+oIdi0RaBxFj0kC2AkpHcmFADyjCHqircdqPZk2d3gl2ACmCFNVjfk0ZkiycgH4IBCl00iOpCeIFYdd0aWp4BciwHNykG/E5Mqnz/krx81gK5eamYQv+iPIyocQwb2xQmaHulfPXxCVNy5WMgdM55KGgtNpPOJP+u6GbXMFNzgu+Zdqe0gkmbtV/OBo9qama+AkzaMWStbAg7xh4g+22A+dmaKBi/sw/LxG9a8aqFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fBchUzrHlye6vjgeBqx+2rSs8evyNW3KlPmksgmqTQ=;
 b=n1VC0YQnKiHF9SYcvcGDSAgY8dDfZbitQL99Y8MrXRE37jG0ToWdpyeif1x7GdkqqYdBjjSOhAYuaxp0ZiULBpU9kpeUWlDmB4IO5oVrf6URb3fttDo1WPqnqUXqRN7RhghXKM1MjIaIPj/rhUFtgotdQ6Dtl2rqxOALXJm0g1A=
From: Peng Fan <peng.fan@nxp.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Oleksii
 Moisieiev <oleksii_moisieiev@epam.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Xen and Qemu virtio question
Thread-Topic: Xen and Qemu virtio question
Thread-Index: Ado+Bh/9MuDR+84cSOCs1HJKnhYJ1AAf3YSAAE7uAHA=
Date: Fri, 5 Jan 2024 10:25:58 +0000
Message-ID:
 <DU0PR04MB9417C886FF942AB7E8B0CEB488662@DU0PR04MB9417.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB9417F7A337D7CAA59B38ED038860A@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <ZZXHE3lQ3XPOj80o@amd.com>
In-Reply-To: <ZZXHE3lQ3XPOj80o@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB7781:EE_
x-ms-office365-filtering-correlation-id: 7fe6a15a-cba9-40e6-4849-08dc0dd8b51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SORr8an3sAr3Z6ixnSbalV/1METzBIv1wk5UROHM2LQ5oYdtEJJUS7fhoypo4w4js5F/DQj9Z+NnWLryjaV0HOGYwFJYIjA8/atikSMyzgfUTt/4ze5EZyqiLRp57H2G2eArUqxhGgdnwihhuM+ilAyZQDJZHkW/zmsqY+Oph2NuuoSEC60njqR/vtnU5EBPpn/slz3bhHEnNGnfpNrpH0963IhcF8cuImltRlXquWsZltU/PrumiX3jG9CGglcHqM1YU1qAdrYEglYUn4NA/0dc1rRhMtK8lbyhIeHI4v9jvyE5nre9+Q+N7CP7iJ4VsODpM/448Zaa6fjfF6PB+r+13cXjLSOOrofaQ+68kdA3RwMmBhy7L0KKfVurLh67gwzO4EPO/Ip4yqAvou2UFXy06MqWicxgV8OX8SiTLU3BR4S+Dh+5Y46pCKk7wwdgicEC8EvQfg18rGuZT4aAK9gxLRIXm8z2SCzOGC+oJF4KrYdkC1VEZdZ5i4a931PyOumZuvehLHyd0Du1nUc6RsOsAlw0K4HgEU09WDM7gYuMg3MU1PqDeeWPKCuzwKDrUsG47OYZ21tPOoqJyBTvz8JyR0P9fNKAsG/uwRdiP9IZhaNgx/k4XmewFRjotRfD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(7696005)(45080400002)(71200400001)(6506007)(9686003)(86362001)(55016003)(83380400001)(4326008)(8676002)(52536014)(8936002)(316002)(54906003)(2906002)(5660300002)(44832011)(33656002)(478600001)(966005)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(6916009)(38100700002)(122000001)(41300700001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Oc6sDFEU+l46yrctM7gZRuSK/fOeDAb2vkahYLtMXXgEwGSBnnH/fp3SOsVD?=
 =?us-ascii?Q?awYSR/GzxN2UQ6aGdudhARGDl9JnOinU1ZVNA2+C2U05VXLLe3wPzv5YarMF?=
 =?us-ascii?Q?InTFin5SGs4DWknkO2s+Zv7OpQR6/EsDoAHY3N6/WGjLcOqCwC0lfMcIl+Is?=
 =?us-ascii?Q?XaNiAs+A2N//acOs4hgfraft2IGR5feSp4bQoKh5MHcpxUKa6UJ+47emb/TD?=
 =?us-ascii?Q?/gpsMKyrec8uvafddrxJNSBZi5azOCd3dU2b5/7c0RE8vxXHXyfl6nvjEO3X?=
 =?us-ascii?Q?auyzsfsZgdqC9+4EOWUPnTCOhlHNDubETQlxOTZ/rOeqzM/3Jl1d+1Fa4whz?=
 =?us-ascii?Q?N0TsQQdUaiyjoKAoNZ09NKwGGA67kBdUdIZ99BcrLis4U98AR6HlWEKU59pS?=
 =?us-ascii?Q?VjOmRVMjtu4i3VHGy/3e7f1FPOqKW+DdErSiDk3nWMpFEjAJVXvoBfMeAsMi?=
 =?us-ascii?Q?QHx6l+ydZ/XQ4g2c8GaldMv1zsQz/GlhNzfCJh3RF6ZiYNl1fB9nC56vRupk?=
 =?us-ascii?Q?q81AvL/IM27UITxOj+DXdOfh993YZB7l4ZDrF/WniZG3vl4w0DyTyAnq/CBI?=
 =?us-ascii?Q?FSW5uHPkEZxROjmyc2RypEMhBCgOuwFcWhXGsUK6bT0zINqZfLP4u+9LoY3y?=
 =?us-ascii?Q?I8kennqfAB6DSEiUzUcVM8fZBZ6uouSb7XPv6x1/ZwzU21GCov3rkxaomLuT?=
 =?us-ascii?Q?imP8JbVPlb+mse8+Dana8BGPmxw5eurlkOOJVz5W26ErQTVkMXdDqXGsFZgT?=
 =?us-ascii?Q?u4WLTLzOShGYFljLbfQRtCW4snDzE/KrosjgW/eBvRXIE3ZF3lYmnQo8PloG?=
 =?us-ascii?Q?rJbbi9LMyDQE4tubznEYx4g3SVYCBwqyFX7dWz7OstromiOvhZpa/uLqOtBf?=
 =?us-ascii?Q?a0SgkwmnDPfIjZ+xiCXdLidCG0h8RdcDGa5Wt7YDyUwp7HF+e4A0s94CypoY?=
 =?us-ascii?Q?oL4vmYOZV0I3Da8/RTJjf8xMk7MwPOcRI0XqySGaJOVpyWJtNaQ8hMBgaJdc?=
 =?us-ascii?Q?4wze0mpkuQtd9HcfBX+nY0ZM7GVNw0tl83wLnpcEOIXtsf1jGxb+9ozW00kV?=
 =?us-ascii?Q?5IqFmyKaWR4sxUfmKY5cfyMNya8Li6+CIOTba1KaCqBT9lOy4AqgWJSsYiAd?=
 =?us-ascii?Q?4WsLljfSHP6AUIC6kmwbb7WhBzMb29dMOJo3r8JJasvsLgqnodH5QgMaBkWz?=
 =?us-ascii?Q?PV69DvH1iLwqgMIkGNS73bRetms2/2eBgNgpeDJYfscopVMecPcVuhf9QoNu?=
 =?us-ascii?Q?sUrX2Jq06uob1KZnWKfbfSc13a4cQmls6v/Cmg+23DeWaP1gRna9AsaVjqha?=
 =?us-ascii?Q?2R6aQ0fw7Mm1yAWPLiQsxRCvJbaOQTl+qpHgdgtCvihxFkXWIGQdnCbJXWGp?=
 =?us-ascii?Q?s6BVFNynZthGRR+fpUBcYi+frXnTfTBWTJJAqjOUAFxZCqWYyvWtXsvb/ENk?=
 =?us-ascii?Q?iU2WUEBDdoDW0xu+C1x4D5nici1XM35hh6/jCiqjyGdmTOGhm5y53kZstp8p?=
 =?us-ascii?Q?Yj4fgYfYKpgJDJoSekYO+E0HhA7g6lM1LqmFP6rtBtLsIBiVjO1Z61LvjFGu?=
 =?us-ascii?Q?lXNmt7RUQs4kTs9/17I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe6a15a-cba9-40e6-4849-08dc0dd8b51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 10:25:58.2044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y75G5qDlPS5nP1vbASVjYZx2iXLM0mf9eA/yWPwGGEUybHwDnKdF7bkzk3M5M0c+nB3N6MzVPRlojEKJKwtDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7781

Hi Vikram,

> Subject: Re: Xen and Qemu virtio question
>=20
> Hi Peng,
> Please see my comments below.
> On Wed, Jan 03, 2024 at 05:38:07AM +0000, Peng Fan wrote:
> > Hi Vikram, Oleksii
> >
> > I follow the slide virtio for Xen on ARM[1], but I met some issues,
> > and stuck for about two days.
> >
> > I use upstream lastest qemu repo master branch, not qemu-xen.git repo.
> This is right.
> >
> > My start command as below[2], but seems I need first `xl create
> > domu.cfg`, otherwise it will fail, because xen hypervisor
> > dm_op->rcu_lock_remote_domain_by_id will return failure if domu not
> > created.  My domu cfg is simple:
> > kernel =3D "/run/media/boot-mmcblk1p1/Image"
> > disk =3D [ '/etc/xen/disk_1.img,,xvda,specification=3Dvirtio' ] cmdline=
 =3D
> > "console=3Dhvc0 root=3D/dev/xvda rw"
> > name =3D "DomU"
> > memory =3D 512
> > serial =3D "pty"
> >
> > I drop qdisk in the disk entry, because xen tool report qdisk and
> > virtio not compatible.
> >
> > And the arg xen_domid should be same as domu domain id? Is there any
> > dynamic way to set xen_domid, start qemu when start domu?
> Yes, it should be xen_domid. Below virtio-disk patches will take care of
> invoking QEMU with right domid.
> >
> > Does the domu dts still needed to include the virtio,mmio node?
> >
> > however xl create domu.cfg relies virtio disk ready, which needs qemu
> > start first. This confuses me. How do you address this or I do
> > something wrong?
> >
> > Then after xl create,  I quickly start qemu, but met:
> > failed to create ioreq server, then I see there is mismatch.
> > qemu use HVM_IOREQSRV_BUFIOREQ_ATOMIC to create ioreq server, but
> xen
> > ioreq_server_create will return failure:
> >      if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )
> >                return -EINVAL;
> >
> There is a downstream patch for this:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2FXilinx%2Fxen%2Fcommit%2Fbe35b46e907c7c78fd23888d837475e
> b28334638&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C52a0d96c7d95474
> c016408dc0c9cbc2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638399114509848564%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> 7C%7C&sdata=3DKylGkFrL2hOazsLjFwwj%2FIAPDQU80LhFfONQL4ytaic%3D&re
> served=3D0
>=20
> > So I change HVM_IOREQSRV_BUFIOREQ_OFF in qemu, but met:
> > qemu-system-aarch64: failed to map ioreq server resources: error 2
> > handle=3D0xaaaad26c7f30
> > qemu-system-aarch64: xen hardware virtual machine initialisation
> > failed
> >
> > Do you have out of box repo that works well? Including Qemu and Xen, I
> > am trying virtio disk, but will move to test virtio gpu soon.
> >
> > I am not sure there are some downstream patches in your side to
> > address and make it work well.
> >
> We have a few downstream patches for xen-tools.
> For Virtio disk backend:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2FXilinx%2Fxen%2Fcommit%2F947280803294bbb963f428423f679d0
> 74c60d632&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C52a0d96c7d95474
> c016408dc0c9cbc2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638399114509848564%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> 7C%7C&sdata=3D%2Bfjlzz%2Bvut3WyRWARfCij03kJ5ZuiGIika8uK5MIdM8%3D&
> reserved=3D0
> For Virtio-net:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2FXilinx%2Fxen%2Fcommit%2F32fcc702718591270e5c8928b7687d8
> 53249c882&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C52a0d96c7d95474
> c016408dc0c9cbc2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638399114509848564%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> 7C%7C&sdata=3DBLtX2GbY77J65H6mBF1r3nXkCWN%2B0SfRJTkH1CnTiQE%3D
> &reserved=3D0
> For changing the machine name to Xenpvh(to align with QEMU changes):
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2FXilinx%2Fxen%2Fcommit%2F5f669949c9ffdb1947cb47038956b5fb
> 8eeb072a&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C52a0d96c7d95474c
> 016408dc0c9cbc2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638399114509848564%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> C%7C&sdata=3DFbmQpeyrc86qapDK8gDNr7o0fYj09t6RrBA3RdmR4EQ%3D&res
> erved=3D0
>=20
> With above 4 patches it should work for you. Please re-compile Xen and Xe=
n-
> tools first and finally compile QEMU with this Xen.

Thanks very much on your information. I will pick up your patches and
give a try.

BTW, any plan to upstream the patches?

Thanks,
Peng.

>=20
> > Thanks for your help.
> >
> > Thanks,
> > Peng.
> >
> > [1]https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
w
> >
> ww.youtube.com%2Fwatch%3Fv%3DboRQ8UHc760&data=3D05%7C02%7Cpen
> g.fan%40nxp
> > .com%7C52a0d96c7d95474c016408dc0c9cbc2e%7C686ea1d3bc2b4c6fa9
> 2cd99c5c30
> >
> 1635%7C0%7C0%7C638399114509848564%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4w
> >
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> %7C%7C
> >
> &sdata=3DVUs6u5qmXi7X5M0JgYJypNO10SIdFkBdVz7RRmUkuNM%3D&reserv
> ed=3D0
> >
> > [2]qemu-system-aarch64  -xen-domid 1 \ -chardev
> > socket,id=3Dlibxl-cmd,path=3Dqmp-libxl-1,server=3Don,wait=3Doff \ -mon
> > chardev=3Dlibxl-cmd,mode=3Dcontrol \ -chardev
> > socket,id=3Dlibxenstat-cmd,path=3Dqmp-libxenstat-1,server=3Don,wait=3Do=
ff \
> > -mon chardev=3Dlibxenstat-cmd,mode=3Dcontrol \ -xen-attach -name guest0
> > -vnc none -display none -nographic \ -machine xenpvh -m 513 &

