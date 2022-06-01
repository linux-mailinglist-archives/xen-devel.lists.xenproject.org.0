Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E358539ED6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340305.565313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJGK-0007FW-6e; Wed, 01 Jun 2022 07:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340305.565313; Wed, 01 Jun 2022 07:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJGK-0007Cg-3X; Wed, 01 Jun 2022 07:59:28 +0000
Received: by outflank-mailman (input) for mailman id 340305;
 Wed, 01 Jun 2022 07:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RHfR=WI=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nwJGJ-0007Ca-2k
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:59:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c139256b-e180-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 09:59:25 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by HE1PR0402MB2828.eurprd04.prod.outlook.com (2603:10a6:3:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 07:59:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%9]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 07:59:23 +0000
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
X-Inumbo-ID: c139256b-e180-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+MuOUdUlr1EILlnKhMEo2j9T8jb1TyWFeJ8mIRZSjn235Cqq9Y3YUDe1AB3P14d9/BBFW/VycglZuhDwaTeSjKSseVHgMSi+SgaqiOfpSteVtlJxveZ+NJ0MShX5Ch9bnVpBu5fA982TiUDhE1U/8s4/92RNz3Ms3DBAPqPI/pv0k6at1xFq7hSQJ7ywlXFr4i78siwwvhCohUlKXGASt0zO/SOFzIZHovEyoL/OvPWKcYS626DzJvi1J6ZJ3+m96bT/w7fRS9Sy99sNeHeHD6rbc9QdN1wAkJDcoBx9M4n83wbUF4nuJgTOUHRTNN0mDbXWrpBsBm3L1X0WZdjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZaCf6yj+k2pTxQ/obHa+4j8WN3nS1YOXvsVM/ZQM/8=;
 b=NXzAz83qqWQbXj90R0BMZJtgTEKy/KTybB2lhEjGN0fcxm46ZoE6wAdElq7V+hrf9vfJpSwEw9mXPfKC1yDKSa5enkASzMlmzD/7lGJHq6a3gSs5jHvPzp4jI0wd7x2v9aWCwAM7bJ7iyybkQl7OoBWJfZJRpCQ5z/Ycj7RyjRnxffpOjhpxa/iVOZd5FCcdM1Jdzcc4f3ksRHJWXL+xam4ToR3A2wH5NmDNXCY6HPfKqtdBRJgO9Yp+zkdVHZ1rWDF2Jy0skxy+UuNcVoovDPo77J/1+7onc0BYMgGLD4LehZHwcKeyl7F1j2Y2u6dUScSFU79etTAjexVyo6tZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZaCf6yj+k2pTxQ/obHa+4j8WN3nS1YOXvsVM/ZQM/8=;
 b=JEkVn/7jLdCplfpeckoAz6eoMKodgxcmvPq3kQQ+KSLufF4h/0VAlQIBN2ptinu0KQR7Whb/xmwLy+y70vJUcGmGViu/VXAqLTpiVqa9qOY4g5Bz8mRhsU9Cxy72EwMYg9ZhRt5429ErPqPtLK5DNBhIb9iOlHCwllC8dI4tE4Y=
From: Peng Fan <peng.fan@nxp.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa06Mh/Q
Date: Wed, 1 Jun 2022 07:59:23 +0000
Message-ID:
 <DU0PR04MB94175823AAA60802503F802588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220530152102.GA883104@EPUAKYIW015D>
In-Reply-To: <20220530152102.GA883104@EPUAKYIW015D>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce67c8b1-1f99-4729-4324-08da43a4a444
x-ms-traffictypediagnostic: HE1PR0402MB2828:EE_
x-microsoft-antispam-prvs:
 <HE1PR0402MB28288DDE7718587E4D883EBC88DF9@HE1PR0402MB2828.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d5f84rBx+sGPuK3nORw+JtIMY9+Oz94nk8/+XGfVZESwghihuvQqS51M7o2tYMR18IwFh2QJIYlQJwtPeMyAyTdGJv5CZtSRFgUggZIkzbY8jgpRnVfj6pT8kzbaSF/I6RarYk79jZ9gdOJadAhUnjAG6l6O4NJISJYp/rpawakNaLtbsNkhyiKunxOBbpJEgtEg93ddUKM+iL2aXABbumB5jnxhpDddtarjMZZMI2nlEiIui3f30XQy1HerurCgjiLwKt6lZaWo7CnsU9EeMUj8hdjXv66PFdpjT28S61AIWAn5ucED0LGZ5C6davu0EDHmyiJ/+IxI8j4xXJ9qvfxjSTtBeQQaTnOGQypmAFHPpJKqyZuSlAU0nxcvyd5ASjIZWiDdHDWiMdBfah6HeSpJJ7bgY+iKdx/mIHYPZVUPe5+W3pwXum8Dl/MmkYFwqo4tiY3BiQpl8rHzp6sqw62yOh0hwjAmqzVL0lEskos8lGs8T77whKWvSklxQs3BGCXI8v5a9ZZQLwxkm/btMRk8U0QbL6CQbQpDW8taTaJGr2+SwlPwZo6Qsqcz0iIFxySBsmwO3R41OTjklmXEdP7QK8YCtn5aYJn901yIGbnv1XpcA0SNky/Ti87GgmZqOmq8bMiqOeZjTDiMmpON0XYYBQUzf7BbbXuqhhsfj8zKkwxftzjKRn3NiOwKkSUu8jVYffmp+JZSnSMHSv5pAYG+qZiDaB2BYZAwu7sqT4rTWd1Vc25kb7DzJeg0938hsdYQ/W1/K4gE8X3Oh6TYe08YWD+L4Isgdu8PZGngRVI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66446008)(76116006)(66476007)(66946007)(64756008)(8676002)(4326008)(966005)(33656002)(86362001)(8936002)(52536014)(71200400001)(122000001)(38070700005)(38100700002)(7696005)(6506007)(44832011)(5660300002)(26005)(45080400002)(55016003)(508600001)(9686003)(2906002)(316002)(110136005)(186003)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YMIQb5RkzcyEbvd3ERvU2QT9VpbYafDp6XCS4hjQzH6GTMz4FhjnvOPKBQQZ?=
 =?us-ascii?Q?Yyappu8eld9bGGken4S8JjKwjDVZcowD3fBp70smvWPmU2WimM2tLoYR3lIf?=
 =?us-ascii?Q?Qr98+LMTCt8Zc76DfH476nePHHM1Sm51ONX00Sv3SFz4t0JSfusB4UlTqxzQ?=
 =?us-ascii?Q?PUSKSvt9y6xmtA9FNgIi9L4A05+Jbx4sEKE+JcgWFa1RBCqT41N3HV29d4EW?=
 =?us-ascii?Q?0md/CY1QC488jBKFWYXUd/N4KSZnpKmlU7M184GGtJaqQJ1gee+FU9iQiFNU?=
 =?us-ascii?Q?qOowtl7rDh1tlQZmZ16l6P1Pbhp8g7S4YG6Sx7AKW8zkqGpcZpFHWSyoOSG8?=
 =?us-ascii?Q?+jgwnp5G9AkLrTbZvaR23uCLywhkRYHcuPu+xQ0MsaFLLsPAJus1b/1sKPo/?=
 =?us-ascii?Q?wbn1hXZ8uCY+pjkJVRY/VKLLggqdAEYqQvEjsP1TjcN6tJr81k4IzFuO9KY+?=
 =?us-ascii?Q?Xn+CJuvOGRCWRacZUnr6IDoYQQsbq37LM4O2P2xaFiAy7VwHXz/1pFRC78fT?=
 =?us-ascii?Q?qW9DhAWQVUEe0LmM0VnNliOpNlQL2N32srwejGYXTLzc9K/a8MUTZXV8SlNV?=
 =?us-ascii?Q?TFaGLzXuAkni1O0XKJK0trFqUJlCA3tWCaziPmzGsgEK9PHDlwEGF0CO0OEU?=
 =?us-ascii?Q?NQATYBRUo5fOVAEObPvQGt6tHR7NmPdcEL5VQlUooBpCK+lKlWDbAQGYt/lZ?=
 =?us-ascii?Q?LFCbOQF8hSNlec2+B1KxWp3woiNjdEyGmBjHpWe072Lg4d85Ks82HT9fvySh?=
 =?us-ascii?Q?H5X+bcHOzIP3GczzmH7ycstSM0cmfleBWKS0Kq9h5Le3NWq97LiX1LNhgc+e?=
 =?us-ascii?Q?tnxU1IZLH7sSrfUCJ3kEjaSxZoqoDXM0CUhZBfkJ+FsI0vLj+5G7TOlqKZ7z?=
 =?us-ascii?Q?DaOFD9BkBrfk2W/EiUib498uJ19SJAs160rj400rVDJzRdv4AuLqWCgVDFel?=
 =?us-ascii?Q?i85wKBcf4O+zDBbNaYftSEsNF77uDrQVzNrWxtk16wPlMoQ2T1KpRmUYOpAc?=
 =?us-ascii?Q?sCRJGOp8O4c7ph7Bzxr9uUvFnqZqyYXwGylsyvQlC9x0kpomqDEOIOsGCOEN?=
 =?us-ascii?Q?eEEhtWdyrgAfszOoNLkxav8Xwcsg9wEAyz2CBlNYRhnr5OqaJQEnf12A/9fE?=
 =?us-ascii?Q?yS39oRrK70UkT52HkRFlt/hX8mKYp9UMSrLmm35H57WgBJ1CYObuz4+MJRcT?=
 =?us-ascii?Q?gI7WYVi06pdEMlpS6Wltt3pfyWI00j5v2cv2bCLPsM1yOfpDy5/4ZSvKVHR4?=
 =?us-ascii?Q?4wa47aSYBlhijTcDMy4Tb40cXGtKwg4pJdaLtNNBs0Xu3PdqYSUr1LFMtOGM?=
 =?us-ascii?Q?hysET0Ak39/2+RQO0lVGYRQF20F3N6+GwBAhT3JiQDNTqJXpLcFF2xsjRo5O?=
 =?us-ascii?Q?riKTID+a3aXksnQMl4Y7hERqSi+VdN9snPQPS9JBSIshhEDhTy7cCdSdJvCx?=
 =?us-ascii?Q?KyniXksCG18SR3iVzWE5mlUsn9YE9X3It9g4qHxtFzI/LmCL4u3siyBjb6zt?=
 =?us-ascii?Q?NKiDCRqrCZbJYsUt0vPgdXl1/zhsv/chxX/Eo/8EQfMJlBbg451XWeBeCTXP?=
 =?us-ascii?Q?x9+e5gRqCUqyxad+QdeP0NgYJFr3Sc0j0ejUeCuT09a37LCjHrwkpTUMdhZf?=
 =?us-ascii?Q?ABWrFasbi1yj4us1mCbPvHjr53dL/F7DcSQd9q3ydKdjoBaafra2yOkDn7Mg?=
 =?us-ascii?Q?ZQr9FpyU4IUJb+Wy48W62mvLQ4l4KZB4lNaD+gqaMI9TYG+B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce67c8b1-1f99-4729-4324-08da43a4a444
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 07:59:23.5512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: su7kiL4n7QHgrRo0rHWp03T+0YOXGqjVhLYV2/4Qw+cAeHencqhq07QIkYasMZE9fzJmvQKYu5cROb0MFdCb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2828

> Subject: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
>=20
> Hello,
>=20
> I'm getting permission fault from SMMU when trying to init
> VPU_Encoder/Decoder in Dom0 on IMX8QM board:
> (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408,
> iova=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0 This error appears when
> vpu_encoder/decoder tries to memcpy firmware image to
> 0x86000000 address, which is defined in reserved-memory node in xen
> device-tree as encoder_boot/decoder_boot region.
>=20
> I'm using xen from branch xen-project/staging-4.16 + imx related patches,
> which were taken from
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourc=
e.c
> odeaurora.org%2Fexternal%2Fimx%2Fimx-xen&amp;data=3D05%7C01%7Cpeng.f
> an%40nxp.com%7C91e3a953942d414dcc6208da425006e7%7C686ea1d3bc2b
> 4c6fa92cd99c5c301635%7C0%7C0%7C637895208732114203%7CUnknown%
> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dno%2BV2ubjGmrsm96NP
> ybeeug4a3BXx3oX7xmylzZCU8E%3D&amp;reserved=3D0.
>=20
> After some investigation I found that this issue was fixed by Peng Fan in
> commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from
> codeaurora), but only for the Guest domains.
> It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved memory r=
egion
> in map_mmio_regions function.
>=20
> I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type for =
the
> reserved memory in map_regions_p2mt, which is used to map memory during
> Dom0 creation.
> Patch can be found below.
>=20
> Based on initial discussions on IRC channel - XN bit did the trick becaus=
e looks
> like vpu decoder is executing some code from this memory.
>=20
> The purpose of this email is to discuss this issue and probably produce g=
eneric
> solution for it.
>=20
> Best regards,
> Oleksii.
>=20
> ---
> arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory regions
>=20
> This is the enhancement of the
> 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.
>=20
> Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> same way it does in map_mmio_regions. This change is for the case when vp=
u
> encoder/decoder works in DomO and not passed-through to the Guest
> Domains.

For Dom0, there is no SMMU, so no need x. Just nc is enough.

Regards,
Peng.

>=20
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  xen/arch/arm/p2m.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c index
> e9568dab88..bb1f681b71 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
>                       mfn_t mfn,
>                       p2m_type_t p2mt)
>  {
> +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> +        (((long)gfn_x(gfn) + nr) <=3D
> +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
> +    {
> +        p2m_remove_mapping(d, gfn, nr, mfn);
> +        return p2m_insert_mapping(d, gfn, nr, mfn,
> p2m_mmio_direct_nc_x);
> +    }
>      return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);  }
>=20
> --
> 2.27.0

