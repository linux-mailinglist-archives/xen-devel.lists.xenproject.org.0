Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF45477305
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247948.427610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqgx-0001nK-79; Thu, 16 Dec 2021 13:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247948.427610; Thu, 16 Dec 2021 13:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqgx-0001kB-3l; Thu, 16 Dec 2021 13:21:03 +0000
Received: by outflank-mailman (input) for mailman id 247948;
 Thu, 16 Dec 2021 13:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mgi2=RB=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mxqgv-0001k5-Ux
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 13:21:02 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [2a01:111:f403:700c::723])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ec496b-5e73-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 14:20:59 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2345.jpnprd01.prod.outlook.com (2603:1096:404:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 13:20:55 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 13:20:55 +0000
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
X-Inumbo-ID: 00ec496b-5e73-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCo5nAUS9xeHwaxZPLGDfiuLEwJEhHsTnXJ+IZaifHkyu7K6sNCYlpqj05WGcQ/4yKmhQrbnDZxH5AmRG9tlhbF5QKTpUZKun9iAHXk9BTBIMO+gHSixEpqOmsRfzjxmEEZhAvnmJwF0H7cz0QkTHY5+u2+S8ZlhaYl/y9Hs+RpTaCJQhkjlUSeq+Vmj99vs4r9OYyi4sX/O6nsxgmmB+YNNwtMiF3nxdgEb9LgEho2Y7qOl51Bodo3HU0+lWflFlkqzvO13VjAqqz2lYtfdrjdDvCwjzAendjUddwXRS80O5fTkovNUWTO5ef3HN8OmX/uah6uP77CoQTEYwi3RZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlyheXEXQjyolMa/KTrQIsnDMzW4nqwVgdNxyAfoyYQ=;
 b=bgyEtwZouTDsy2rCKAF64vUOArUODIw25RTQYJofOq8EKW+wWNY2JTZzeF5DDnUB0mcBIsnmqDmY07AoVmqWNf9whXxgPSlNyXDhyun2dK3+0jNvPMSi8iTaQVMDALUv8v3xNKjzFDdB7m9AtZviD9e9v2Sqr4k5cxpzBt7ZSuO6JGEcZZl4hoUKMTC1zha9+t4fY4HSOqriCxTPJVOBFdaanPR+AMDmdmNbH484vN+W8FUU++4B4BXnKImKNDRiEFPoU3GR3mJSJ4WuhBhqV+YpBCCgBJnCsRosWd0pA6JwVsu4hJc5RzxQItlipPJWy1FfEO6t5XtVudlYk+7DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlyheXEXQjyolMa/KTrQIsnDMzW4nqwVgdNxyAfoyYQ=;
 b=ih6avbPSgqPP3RfdqYvIIh8Ck+OtLlDUgMCZ3o+8STWWeD3O4hadyXMIu1YlUoqPAf/SrJfggmswKib4nKgY0/A+QMTq1xqTM7e8p3wskcuAdsamieGJwKL28Nzru6VAl1aPqcpQpNvUFjnm2wtWYULA4u3nApC3vqBB5vmo8WE=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Thread-Topic: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Thread-Index: AQHX47d7s26TeYK9j0qz+isKX7yf4Kw1N4gQ
Date: Thu, 16 Dec 2021 13:20:54 +0000
Message-ID:
 <TY2PR01MB3692A9686B4C239945A1954CD8779@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b44bc370-235f-4250-bd1c-08d9c096e3e7
x-ms-traffictypediagnostic: TY2PR01MB2345:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB2345EE4F4515052A39B92E06D8779@TY2PR01MB2345.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aI9U2y9LwbDKcoddU3iJQohPXiWwH6+xJY/O84puTMGJJfwwrVaB0Cbgv3skXlIE12cMyUIMfhBG7rAeiAxP2tqPOfZoaVynYLFfJ6jONZisnVlGnZheKlh3z83tuDQrzXk1A1p/ljejfUzg34fRit6JhMVrUXb2CJ3HBjSRhAg81CXeotPfzHbBMIi50bWpzh0Km6XC/ksQEpJ0gnDVvGzrL3oUd6wvNr8fevTUUi5OnLpJYytwwFbIk9MGPFACciXHnLc9ukA8KnigGA0MRBDy+TK6F3Ry18nV51biZ509iHpfloN2bd8EohlI8dIaTb8uS+5gU+h69Od/DJ4r0zx54mxawyhs86VB6AfTRgw7KQw/+Qel8aFQNtQDpiaYgT5kqWtwcIvlEBpVA6ECm9lruW9Zb88nb3eE4r93f5+9KDJb8+AOpb0NccFiLVgYb7nozZDQsAhwqL6I7YRNU/e5r/Sz/regFHOlHyfQM/XZiLIJsdqOGReRyXI7YnyqOsqW1HtHIAX00P+POC42PClk5qIEyy/rq5TC0ow9hzwOSaj5wqvcOWHW89Wn/zpy7/t23HHTh/YioOz9wN041KePyrxkePBfZ5GR+qLNVFBvp4Rl7CgOmYHDwUHTiursdHzk3Came/Hvg28cKxRrN+pvomwNObqEuTygaMWhrCUYPFCiOsMV66rllY1atYrv+OH8/6PTVII1svnS6qejnQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(55016003)(2906002)(316002)(76116006)(33656002)(66476007)(7696005)(110136005)(71200400001)(186003)(122000001)(38070700005)(66946007)(54906003)(66556008)(66446008)(38100700002)(64756008)(6506007)(9686003)(52536014)(5660300002)(86362001)(8936002)(83380400001)(26005)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kSeUO/14BNQ0/eyXkZIj1eLD7ke2HGluhsMKBW3/jGcLdkdhC/gjc0/xZk2z?=
 =?us-ascii?Q?L3904rsmaxW5WkVhQCPCNJJhF8l8RND6FI2uQgi0az9lWKP9JXlrv8YNBs9+?=
 =?us-ascii?Q?z9IajSwlest9ynwkBFtBi/UyFG5CIc719Wlw6+EBSkAarudJ+8OJDO66Okem?=
 =?us-ascii?Q?m+fCMPlfF1stRdT4IxsrFR084StcYe8YjmkLlkum3jSvDOjLYWyTaK9wooHk?=
 =?us-ascii?Q?2TCxHb/ypQUW6AN6iDLor6UAHp8sjpHk81e/pds0GxuHBMIFYOxXEB/UHoIR?=
 =?us-ascii?Q?keG/sHcCtiLyVPcmmomDcQNZT4SBWx8l3i7AjP/238YtIrGaIYRzQD2oGo3b?=
 =?us-ascii?Q?pcvvSzCxaAithfbiTFGtIIivhv3q4OCq8FbNbVB89fBKt0DMmsqiV+bLmmHl?=
 =?us-ascii?Q?R5vWnIrUyC58PfL5XliCyJwrfWHyBRaEETo4RIlyEsoAacjA9sYhP7Ysed3e?=
 =?us-ascii?Q?7J0CHRRlnkyoVRh8HWvv3QqZV5UbMo/1vhTUEZFfyqYnwY0eXfHvQLPUYQuW?=
 =?us-ascii?Q?Kmyl/aXKGB5Bqj8RAtVv14NgsKme6sitAiR5E9D+K7kQNHrs3IHIVz+oa3Ng?=
 =?us-ascii?Q?6rtq3Uwi2XSKezB9IGP1xxAVQR3CCzV264ZQUMa2AXP16TTFtWdgEcnbGk5I?=
 =?us-ascii?Q?VL+34IZURxLtFAOWSVaaNsW7WQEGL3MZGCSiIxHO94YZFbbjZ9NnZ9XHkiXF?=
 =?us-ascii?Q?XHHixMJo08oRbXsTYKQ7NrUqokekUldx60E8ClxG4hogtWT+PrC1Y6rCCdbc?=
 =?us-ascii?Q?1h+Bp3QDu6y0y+3I0EW1Gg+kDTi0BLirUfqpxQ1XviRpiw7KaXB93c4ruCs2?=
 =?us-ascii?Q?kUBm85IE64edJp33j5go9/AsWbK4hl/uv8i2d5QJIc/lnnTji7I29LZNclht?=
 =?us-ascii?Q?uEOqHTqZ9pua7VAu8xHot0+TzbTM2OsFqB7kA28yW+55BaQPWiuRblT0uoAU?=
 =?us-ascii?Q?CJSTssShIZpa/Gh2TJLZlpBJhs/decBl9UaXqvDRf0wquaUogUn6t+CK92WL?=
 =?us-ascii?Q?5TdEWM3SXLpvE6onTV3/hzV1LZU2g0MJQLq7MssNuUC+yM+2tjnEWzQhwZjO?=
 =?us-ascii?Q?shiGeRahjeDPmoLMUeSiSSCjpdjRoIZOEIXZBHITCW6njw++zCTzCf66rUTw?=
 =?us-ascii?Q?y26wQSh9SxyqqU9MyPik9GPVPBjHPWnEw7kfabtH/xPm5Am0JfQkm/gOD/OK?=
 =?us-ascii?Q?+daLFioLKtnlbTzBucGTwWL7cutld0cFEvwq2JyHRisHT4kEKaIquKDpTOxB?=
 =?us-ascii?Q?hpdjbI3UWUNV/jbctJYYcERl2VvZnUXIxbODhr9WVWx1CEUEVAhYIYpUO5sz?=
 =?us-ascii?Q?PN/iRlRPCbgw+40thSaxlhn3gg7C+uAcINa4bK6YIFfjexnmvyjqo1RVO5TN?=
 =?us-ascii?Q?b6rjTImK11rmivDv/n+zKlPQEAdLbMeMf/uD154ap8UxmER409P5zJ1o+YgN?=
 =?us-ascii?Q?NB9k3fdCBj6pj4lWR7st8IkyRs7wFdDiSlQmtSq/LfcKLPEpIoezcH4rAmNX?=
 =?us-ascii?Q?kbRlUT4P1OQ7tlYgYkL6GN43V0Xfy8sHyUebZtny0SY0ogf4NjaRkfdz9F+W?=
 =?us-ascii?Q?poeUfbJsogGv/5ni6uPKosPQFLDpKjsE5ejZ4kLOSNQvt/BTtE38UcsKACFV?=
 =?us-ascii?Q?yaYuZ9AayrzlWb3IB8pTF3QzSTrKExJRPNiQO+9gu0hn/SDash1hbYjf1MTJ?=
 =?us-ascii?Q?oW+DlkRhMBkNzhubML1DCi7AeZp4JIPozG01lnomG1E0g4Vh8KAiucJRX4i1?=
 =?us-ascii?Q?N1ZxPnHQSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44bc370-235f-4250-bd1c-08d9c096e3e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 13:20:55.0048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FS9qWodGEwEDrmowwU97fuC/cxZDHqogs2BIWCZM77H2SxKj4Un76CSfeKrqe4GXzocklSigDW31wYBmg6LLYXFakm671+lsYPQihZGhZbBE+Rd46J/P9wcEoLMfgCQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2345

Hello Oleksandr-san,

Thank you for the patch!

> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Reference-count the micro-TLBs as several bus masters can be
> connected to the same micro-TLB (and drop TODO comment).
> This wasn't an issue so far, since the platform devices
> (this driver deals with) get assigned/deassigned together during
> domain creation/destruction. But, in order to support PCI devices
> (which are hot-pluggable) in the near future we will need to
> take care of.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 22dd84e..32609f8 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -134,6 +134,7 @@ struct ipmmu_vmsa_device {
>      spinlock_t lock;    /* Protects ctx and domains[] */
>      DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> +    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>      const struct ipmmu_features *features;
>  };
>=20
> @@ -477,13 +478,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_doma=
in *domain,
>          }
>      }
>=20
> -    /*
> -     * TODO: Reference-count the micro-TLB as several bus masters can be
> -     * connected to the same micro-TLB.
> -     */
> -    ipmmu_imuasid_write(mmu, utlb, 0);
> -    ipmmu_imuctr_write(mmu, utlb, imuctr |
> -                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMU=
EN);
> +    if ( mmu->utlb_refcount[utlb]++ =3D=3D 0 )
> +    {
> +        ipmmu_imuasid_write(mmu, utlb, 0);
> +        ipmmu_imuctr_write(mmu, utlb, imuctr |
> +                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR=
_MMUEN);
> +    }
>=20
>      return 0;
>  }
> @@ -494,7 +494,8 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_doma=
in *domain,
>  {
>      struct ipmmu_vmsa_device *mmu =3D domain->mmu;
>=20
> -    ipmmu_imuctr_write(mmu, utlb, 0);

As Volodymyr-san mentioned before, after we added ASSERT(),

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


