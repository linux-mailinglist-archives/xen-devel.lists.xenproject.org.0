Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2E53A053
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340381.565405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKeP-0005IH-7w; Wed, 01 Jun 2022 09:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340381.565405; Wed, 01 Jun 2022 09:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKeP-0005GY-4X; Wed, 01 Jun 2022 09:28:25 +0000
Received: by outflank-mailman (input) for mailman id 340381;
 Wed, 01 Jun 2022 09:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RHfR=WI=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nwKeN-0005GO-Es
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:28:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dbca34c-e18d-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:28:21 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR0401MB2656.eurprd04.prod.outlook.com (2603:10a6:800:56::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 09:28:18 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%9]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 09:28:18 +0000
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
X-Inumbo-ID: 2dbca34c-e18d-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a21KWyYX18l7N98QxFsxm02SevQfqITHthbQj4cBlw7aCAnXdw7TOd748VoMhEGIAyAajRvR4knJV3lJciPDriMnnCxQUgOygL7lUdY5dB5tuqUA2td6cNCLjvFoFhlzrtS1FWAgM8V/JY2zqjkxrPM/ZmAQHvs/G6D6t7KGSLnsydFEQ/rShNyM3R6cvRwLWhDqXk0v7EYTR0c0iHS1P/i6YxGPjKFMyAb8Ge6Aa1rKIPOnaOdwdaryRjTVs3Hp2gWzDeG2I5dMcKc0YvZ6xm4ej5QX7XkeL1hbpLShbcONnikWQ1RY9ccIEoCiT++wZhRSzC9O9eVYBfrDVoZS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trUnlHmFW617d+57cYc4H3IdZLgm/qHipiQpeXKmM3Y=;
 b=heiYCLGjJvlLVcqHtLsGRvl6KVdyRsaSIHc6CQ6IUj0prK62nWory7TT9VWR7Ecp/WX4HUqNpSSDVASVQjB1h4gtxParxjyCDOPwzszHvlmqRC+iLg2ovauYdBC72Tc98DT6/N4apn5UWfs/+gOTmMZWlTf7xj+H3G2CZjqFi2h8rgc8PiVC0PS223MSRk/2LIUVe8MEVgYLqap+XuPUGfeBl9oZ5OxeVnGBLzXo+SqdXuyEmV1tziGT1W7CdXDbm7i2nhC7V0i++OBuuy9MLtM7bsywtRzVvcEfQJSk8KOrUMba1PrWty4RtcbmGQnPekIb1uoG+C+hHXqseJwaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trUnlHmFW617d+57cYc4H3IdZLgm/qHipiQpeXKmM3Y=;
 b=PodMGlM3saJwRJ3nGV9BnhwwMaz+tdQphJcfbW1CIYfeUsA82ZsazdWFefqwcImsRSZCc908BmHeh0YCy6k4JLYqV9mITqTAwNKtHc7nEmFYVRwWLx9hp4ByomCmZPMgVN/eTzowk8Wj5zbArxrqifFQwaKFLw39BgDJSRAlnYg=
From: Peng Fan <peng.fan@nxp.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa06Mh/QgAAVEICAAANxYA==
Date: Wed, 1 Jun 2022 09:28:18 +0000
Message-ID:
 <DU0PR04MB9417A3436FB754A7F374C44888DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <DU0PR04MB94175823AAA60802503F802588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <20220601091311.GA3658954@EPUAKYIW015D>
In-Reply-To: <20220601091311.GA3658954@EPUAKYIW015D>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78336a46-2ecf-4c34-6b8c-08da43b11037
x-ms-traffictypediagnostic: VI1PR0401MB2656:EE_
x-microsoft-antispam-prvs:
 <VI1PR0401MB26563BD038A6931E83376C8488DF9@VI1PR0401MB2656.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /vbZGtGFE/+p0RrNzy7gR60FwtJec113HJT9h0wHVKm8HsN2yedGpRXJJ31Co3ZRQ/G8QlHrlgARFJBdZ9Wu4xTWssVa1oG87ZKHcTVvvdQ7Z72AAyicc+fRvK9xfNnBNPEYGuVKlqsJl2u2QVyatbBFyAgR+1fpGSbp1NnX8F9X7Qw8lC8FWfIpCk1QqO55rg49LjZfse4ALn3ohxQWlsbwGc9gXPUmpcnfaih6IP3lgdjifjdw4uhbWtmwUkFrNGNbU41hhSfC9y0onE4Hy2ZyLNJxZ4RqQqjspKuvkeG2eyVjnatzMzrSGgwsz+xSpXIxpQ1mWjFuzpZss7s++TVnHgX2DFAiYmxT++eagGMmANyT2NOfM49VGBbVyuqyzvJt1VCnc4VWMYF/rzx84FTKgBS/+q42/IpTcc3o4B1xq0Q9lby67y1B0FZAvmm2I4JyICGMolN4Tfpe1DACEGDvaZdxSEk7zpMoBwEerk6fThY4eTEq+9+AAcJsnlSPvOxb+H9plp7pOEJ45ldnbjE2nMrQmU/4dngSYFsZF23wFSRPo0PYrYlPh4qSd15xZUDhT15S58ukDhe2pWOQ8HcYpOOi0z5WSkxCtQLghz9u/kNTooec9AsDTOktlZw7nMucy+w1EEU+cPqtTkNPtccwWerhpv0l2jtVLHNIAfguvy3LuvAEiGUo2It/52tRYAHH5G2Miz97Upfz+3NrQ8/4EuxrKi+yypkW3aAJap4uYjMdFBFxTLINCz7CPcZDOPnHJGZUptjcT9pjhoaothRGv+yxeUj0/m6fYw63mfU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(33656002)(2906002)(76116006)(6506007)(966005)(5660300002)(7696005)(45080400002)(54906003)(6916009)(186003)(44832011)(86362001)(55016003)(316002)(83380400001)(38070700005)(9686003)(122000001)(71200400001)(38100700002)(66946007)(66556008)(26005)(8676002)(66446008)(66476007)(8936002)(64756008)(4326008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/qNANLxhk+5/UWp4mCsO/xwGh7iMQiQirDn/w/m5GvcU9uQmtK8+9I/KDWKI?=
 =?us-ascii?Q?vyb1ohKV3mZP5z6QVer27jhohG8yFXmn5u0tWHw/vwp1oEJdfj6AF5Lb74J4?=
 =?us-ascii?Q?2PZFYIU0fZwJ81+qwFT1m32bRaER5PHyv7Mos57Gdr8AsQaFMwDDxfXOHt/4?=
 =?us-ascii?Q?MA1VcqZPdoHxLfCFNc3bbBl302yK6WTzip0KhhtNYYETC1wDmNsNUpJnaSP8?=
 =?us-ascii?Q?n9rBxnD9HJO9acRtv9ms9+2HVipoYqkfg5kUvTUajvfDZ7O48WnbVM8GlImB?=
 =?us-ascii?Q?sTg6i0LEUso2/Y0QRdGkRVeIesj7GvJkf0w9ZuqX7wsKH0XWnY4YTCFamUQA?=
 =?us-ascii?Q?G0ek+MNSDFaPPC5vss72izRxLqv7hDbuupTnmaYX1uMNXZTHIsHI7liLTpcy?=
 =?us-ascii?Q?SYdPCMstp+srZvwlOQ6Z87FSNepFH1cvs1lSJUCbpRquV0JT7BfQxbXEPImv?=
 =?us-ascii?Q?KuKvA8XnYnoWTSgGjXNG5CZ+gG4IvatgBv0PanTuTeFxTt8kgyol2ZOvmQr6?=
 =?us-ascii?Q?JhzLRHcnuhnBDx5uuj3SX2x91Zr/wVXSRgats8ZBq2+XY2TtHZDHjL3yzhuA?=
 =?us-ascii?Q?PapEdLiGq0F38yErZXAuMm1mAmifGB0uzz7i13oe0Ybi0RkSe4+AnMQjKJvX?=
 =?us-ascii?Q?+ywu194dP9Fcokxp+b5P3Ii2dkqdS7+JKJwyBeuC2E8zNtnYwelVTm++90ej?=
 =?us-ascii?Q?b+OdO6KDRsbp6oolcfQuQHYBQ5JnLuIyXiMpPnj6VdVw9g998FrUb2quUKZK?=
 =?us-ascii?Q?lrlELe3QGoAAZ23TDMVXA5TxKoub+3C8LvTYdjiCQUxM9FGG43TtKQ+6k+gA?=
 =?us-ascii?Q?WtXr92wDUzr1VvnfuThWAv6x7wKJViYwzmkESTXgXZTq81flufVRfvb7BNIi?=
 =?us-ascii?Q?czvSCTnxv+oWL6Oz+63LbvBFKV7Vcg1JQMnCc/hAUVQrMR4HW414j2Yy/T76?=
 =?us-ascii?Q?twwsh50NY7UgDvQWQY8HtVarFnRJ9Kmd1S19xR/d3PjNj9SkkR+aIjAMLTy0?=
 =?us-ascii?Q?fjLeH1uuj7nBw1Q6I+WM+xzNwh+X3Ih/RC6w21HrAaNyqefcqAN4scY7eQMp?=
 =?us-ascii?Q?8idclZ8BJaewpFwi5HAuS7hVrxIBzL0fgowvrNNspRkLOr9wm4YalrmR0jek?=
 =?us-ascii?Q?suxxliQzGTGMZfDGgm7do030v6yzCPEB78XUjIdshaiIUl2vkHB4NLC8RTU8?=
 =?us-ascii?Q?Zdd/TCcmiSnavMkNLVY8ZkUHQE/cfBokWzJgsnXUyCqWyYUavxvQPu3xcrut?=
 =?us-ascii?Q?JSprBtRRx9KiGQjmFaqln2+MfPEHfCkA/PcvjS7L0ePoR50uhNnEYujjnvoJ?=
 =?us-ascii?Q?SvNqZARDPhSHr44yp2k8BzA6Tizo7sZOQN4kaxEf8JpDqqYrwB4d1QURqtni?=
 =?us-ascii?Q?QwvI2BrHVzEoFMcPigmgthIUV7NIZMQiGjkkQIFOmpxkpsHUOlPbCge0nsck?=
 =?us-ascii?Q?0nflT6p9pw5thzwDQrO4Qk2zhfbvbR8eh3tBqLB1oNQizzGXZUfeduDQGaLG?=
 =?us-ascii?Q?l8hhuqYPJbxb2KZGxMNSofvhBwjEE1VM6gfZHpXi+HT7HkUBK27XQMlN1zO1?=
 =?us-ascii?Q?ivj8Q6nSHJPaevzLqQiY/FT9xgoXM4u/1HZtJ7wEPXmzrpIkdYg4OTsnJtm7?=
 =?us-ascii?Q?fz2UjNih6WabVeAzqYFEoC8HX80sKIgWu5O0k16NV5x1PpvVpy/gE/DjJEf0?=
 =?us-ascii?Q?LWfWzhGyKjnQFXEraqbsXhd8pWvUMUQHxc4A8g+IloHkZ+s+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78336a46-2ecf-4c34-6b8c-08da43b11037
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:28:18.6218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gRFQt+6B6cLbKwyYopSerh1YFjmdsrCyoF0oVTJeCOUJ2I20VUUQZ1icnhyFByuYy68tFJHE21btGkMCHTiY7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2656

> Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init
> vpu_decoder
>=20
> On Wed, Jun 01, 2022 at 07:59:23AM +0000, Peng Fan wrote:
> > > Subject: [Xen-devel] SMMU permission fault on Dom0 when init
> > > vpu_decoder
> > >
> > > Hello,
> > >
> > > I'm getting permission fault from SMMU when trying to init
> > > VPU_Encoder/Decoder in Dom0 on IMX8QM board:
> > > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408,
> > > iova=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0 This error appears when
> > > vpu_encoder/decoder tries to memcpy firmware image to
> > > 0x86000000 address, which is defined in reserved-memory node in xen
> > > device-tree as encoder_boot/decoder_boot region.
> > >
> > > I'm using xen from branch xen-project/staging-4.16 + imx related
> > > patches, which were taken from
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fu=
r
> > >
> ldefense.com%2Fv3%2F__https%3A%2F%2Feur01.safelinks.protection.outlo
> > >
> ok.com%2F%3Furl%3Dhttps*3A*2F*2Fsource.c__%3BJSUl!!GF_29dbcQIUBPA!
> wz
> > >
> oDdJsuf4bjXMe85tA46E0tLpFG5gqHoo-OeY6o_ARroNBmX7JByHW67qEUik7bN
> ow0ST
> > >
> gvAjR4rBkRu2Ux%24&amp;data=3D05%7C01%7Cpeng.fan%40nxp.com%7C5abe5
> 7eece
> > >
> 404f6c017808da43aef8f7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C
> > >
> 637896716019179992%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQI
> > >
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sd
> ata=3D
> > >
> 47ddyB8JUz8sDHcXluhcB7RJ7bH4a33l%2FF2XzUpAPxY%3D&amp;reserved=3D0
> > > [eur01[.]safelinks[.]protection[.]outlook[.]com]
> > >
> odeaurora.org%2Fexternal%2Fimx%2Fimx-xen&amp;data=3D05%7C01%7Cpeng.f
> > >
> an%40nxp.com%7C91e3a953942d414dcc6208da425006e7%7C686ea1d3bc2b
> > >
> 4c6fa92cd99c5c301635%7C0%7C0%7C637895208732114203%7CUnknown%
> > >
> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > >
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dno%2BV2ubjGmrsm96NP
> > > ybeeug4a3BXx3oX7xmylzZCU8E%3D&amp;reserved=3D0.
> > >
> > > After some investigation I found that this issue was fixed by Peng
> > > Fan in
> > > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from
> > > codeaurora), but only for the Guest domains.
> > > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > > p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved
> > > memory region in map_mmio_regions function.
> > >
> > > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type
> > > for the reserved memory in map_regions_p2mt, which is used to map
> > > memory during
> > > Dom0 creation.
> > > Patch can be found below.
> > >
> > > Based on initial discussions on IRC channel - XN bit did the trick
> > > because looks like vpu decoder is executing some code from this memor=
y.
> > >
> > > The purpose of this email is to discuss this issue and probably
> > > produce generic solution for it.
> > >
> > > Best regards,
> > > Oleksii.
> > >
> > > ---
> > > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
> > > regions
> > >
> > > This is the enhancement of the
> > > 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> > > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > > e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.
> > >
> > > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> > > same way it does in map_mmio_regions. This change is for the case
> > > when vpu encoder/decoder works in DomO and not passed-through to the
> > > Guest Domains.
> >
> > For Dom0, there is no SMMU, so no need x. Just nc is enough.
> >
> > Regards,
> > Peng.
>=20
> I would say that SMMU is not neccessary for Dom0 because it's mapped 1:1.
> But using device under SMMU in Dom0 is still valid case. For example to p=
rotect
> device from reaching address, assigned to another domain, since Dom0 is
> trusted.

I mean the reason to use nc_x is that VPU DomU is accessing DRAM through SM=
MU.
It needs X because there is VPU firmware run in DomU.

I not see why need X for Dom0, unless you assign a SID for VPU and create S=
MMU
mapping for VPU in Dom0.

Regards,
Peng.

>=20
> >
> > >
> > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > ---
> > >  xen/arch/arm/p2m.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c index
> > > e9568dab88..bb1f681b71 100644
> > > --- a/xen/arch/arm/p2m.c
> > > +++ b/xen/arch/arm/p2m.c
> > > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> > >                       mfn_t mfn,
> > >                       p2m_type_t p2mt)  {
> > > +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > > +        (((long)gfn_x(gfn) + nr) <=3D
> > > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
> > > +    {
> > > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > > +        return p2m_insert_mapping(d, gfn, nr, mfn,
> > > p2m_mmio_direct_nc_x);
> > > +    }
> > >      return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);  }
> > >
> > > --
> > > 2.27.0

