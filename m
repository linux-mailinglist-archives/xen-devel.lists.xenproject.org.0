Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA5A727EF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928398.1331113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbXr-0007wA-Cn; Thu, 27 Mar 2025 00:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928398.1331113; Thu, 27 Mar 2025 00:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbXr-0007t4-91; Thu, 27 Mar 2025 00:56:31 +0000
Received: by outflank-mailman (input) for mailman id 928398;
 Thu, 27 Mar 2025 00:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txbXq-0007sv-GE
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:56:30 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f97b56-0aa6-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 01:56:29 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by AS4PR03MB8363.eurprd03.prod.outlook.com (2603:10a6:20b:512::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 00:56:26 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:56:26 +0000
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
X-Inumbo-ID: 50f97b56-0aa6-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX/uM/78kuIYuPCIx7vifOxCmXOicx0IYfjQJ8jzhvjmgznKbPfK+uWuykYF38LanQ9pXMw1knmNMXi1ZQpUQZ3mggofHr0xFxTj3o2SGDX6jb9/UKolMujL0d+fkxj8/AZf7rhNkvXitZix133M0i2eYGABXoJFUURThk6oIgpDR/833dd0G2s6PVTf8SkUGcPjJFb8VZOklfLmdKxRVnbUNmFb8OygwMGxuaDC4kESXvSIJ861rk3rnznQnk7ceDQRXDGBw09CIlBB6ieI9OKSNp679dYCK2yyOfr5X/PVXTwSz0CRe0NumMruHKDPZGRXe3zqRkyEaJzTyOA2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zg4ZfL+EzvDZDtyMQp4FFCGm0LoESOqGM+3TIfe4Ftk=;
 b=Vv5/eGsQEM6qPDZjKDQ0p97MdrbB6s/bBUAD2CXFANK/xvkqPHRWKlOIQ+O2JrMmaBinU5xxKNTCrCBbD/oWGmuYz9YVl2+mbY+CR21WfWYu/bDH0RT2M9bs+qI5a9Q7bb5sDUXrPsV4CWaPUYGn+qAOdt0/nbZ1AmtPSzgd6JM5S6B+OrVytYwQuECL2Yhk0nINaxyfrtbvYT7SYXDiYSMNz3FBVKrfjPkWNY2qSBqkSWuGl5qnOGqCoAkqULbLNhmSkSjDR4R2CGQq+HjBpayoLTPatJU8Pwh3sH/x3OP703Zrm/X9+feW7Qs3da8bxpJZY5/Ph2zU232/nX/T5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zg4ZfL+EzvDZDtyMQp4FFCGm0LoESOqGM+3TIfe4Ftk=;
 b=npT252qLcWfyD8E9zfSGSaEkWTLiV9+MyGW3wZH3hSJFZjzHf6tuCeDHJCoPVXMLnzleYU4B7Y6qGOz23h4PsNNEmtpr6ePQ7KRrXe3Ggww9vgC8L9jNwdceN0KzWzw8vaZ18AwhnWXKNqe0C1byLMAeKigdp+AH7DzEjg+V+GKJQLrXVoEIA1fHJ5H3e1KT3A2R6DuiYLpEs79iD4fiLcCEP8n/E+le0OQ5oAPClYsVQkpYljFxhdiXx9VG+EO3n/Rm9zgzmnL8FboaRYsMkrRQyRLUvVB7AxfdamUo9T1Kaj07b5skB9iF7dh7Tb2LeSSLwEd7T/2MdjV0I4dPPw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] ARM/vgic: Fix out-of-bounds accesses in
 vgic_mmio_write_sgir()
Thread-Topic: [PATCH] ARM/vgic: Fix out-of-bounds accesses in
 vgic_mmio_write_sgir()
Thread-Index: AQHbnmbv4CnAg2LcQ06L+X8rg+2+kg==
Date: Thu, 27 Mar 2025 00:56:26 +0000
Message-ID: <875xjvi952.fsf@epam.com>
References: <20250326155121.364658-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250326155121.364658-1-andrew.cooper3@citrix.com> (Andrew
	Cooper's message of "Wed, 26 Mar 2025 15:51:21 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|AS4PR03MB8363:EE_
x-ms-office365-filtering-correlation-id: 998bad44-4bbe-42fb-da7e-08dd6cca33b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X344+aenYrvwCaXkzSNGgJ8H8K0tHChrOjFCNOOw39OxvZHJD41lxVl7iD?=
 =?iso-8859-1?Q?gErUkUrxZmryKjq4ibLLTgbEewmoccAuJbhhQrGuD7KgToLUSGXj/HHcgZ?=
 =?iso-8859-1?Q?mVziHmgdrruZWG01TQ/Jj8/f27Qn+osB15rYUwVO+f3+UoIzwTaIpVT2FL?=
 =?iso-8859-1?Q?kMFY4GB5Pd9FoylXHFUzBvWc+RqvwstlHV2e8hhrDuLDOsdsBiXuzsG/JA?=
 =?iso-8859-1?Q?QsrMGrVt2H4z45/WdImtgHfOHc2dpCeBoMgkKbru/znstpEY9oxqk5mq5l?=
 =?iso-8859-1?Q?YiVvbC0eyWN3dBMiSyebfTXvrFq6XS8WwNQXh7qT2YMCkzRw5xzg8azjKR?=
 =?iso-8859-1?Q?QQhusKmOdYFOqoMLIFnbiymUfLnQ40/fhCcsvJy967FNuozBJPt/YjJXQz?=
 =?iso-8859-1?Q?b3CZK5dizonveITmKd8EwrDRCymSuzyzW5BjyR9WOLcYrMDtnBz6IDK8oL?=
 =?iso-8859-1?Q?9JytCAnZ0YCXpBp++LNmX3+BBvg80TEv+a/2azFVoQB5cPKxnArZDSKqqA?=
 =?iso-8859-1?Q?klgvb10Vho9UO+xQLLc6SkDZzJySKnx0ii/GX6K/zPBC0w1TeospWExqIC?=
 =?iso-8859-1?Q?74JXk6oMdFcpf87SakK2Bj/gYF7Cz2yx6Pe3fHeLN+xjTud9ESaqnb/YaV?=
 =?iso-8859-1?Q?rWlUDhndL+L/IBSIDojp2ao9wfX/JKgU8QFQdre2HVR4QXrhguNWCCrcJG?=
 =?iso-8859-1?Q?ffnVBfMKhzXCj2nW8h+TK07otduuuCC6PHyOzVj+t5cbtvZDi0htPh6fL/?=
 =?iso-8859-1?Q?M/jghLI/t4jZL3WI/BxvX6TF4lBEu7rcGIFdd5yzxEevzYMVlbGDlpt/b6?=
 =?iso-8859-1?Q?EC/EdBPu0JFJPxpQzFnmD8LNW3jBGbRFF4SnceJtf6aSty7eDvvTigHTBO?=
 =?iso-8859-1?Q?M5J0gL17OG2qY3+NtLoScHzjrgnJXshPJ04cygaijufuZaV9x75rg2ku6O?=
 =?iso-8859-1?Q?VLelRzrjJLjCTX1b9xzBfkMzHPTBsIzE28qP92diRTRzGonZo82q8AFmkG?=
 =?iso-8859-1?Q?OSJpFl0DZvPIQ+aTX9+r9bP88jwM7d26biSSxrWKZyztzzumnbTuxntGzn?=
 =?iso-8859-1?Q?heXix2GgncJZ1B0+2CEUE8ocGXNrZYLG/N+tJ8u77xujARyAmX8QxkxYHE?=
 =?iso-8859-1?Q?GzCu9GiO7y5dOu72zNWScLYI0cEsbaDQlH5Os4Qx/q+ZbAk1L0nH9U9ckg?=
 =?iso-8859-1?Q?QlmD3MP24ejEfs30hVgx+Q4QyE2H9Wa5bXNDwQpqrKLbfm6f+GE4I3k4f+?=
 =?iso-8859-1?Q?nlO6qiLydPWpFwfM7f64hV+hhWXzubE2O9EqdrmcHpXTopnaWEQMAL/Jfv?=
 =?iso-8859-1?Q?R8f/gtTo/QjYKONzhNdgICRIF2+jdp+Ugfmr7Xj/Nmz/reomelgDvN5oAl?=
 =?iso-8859-1?Q?2idCp92Zan81lFKHnt6pWS2UdlzQAs6M2Eul1NmiSydnzqirEV6tNl8tEK?=
 =?iso-8859-1?Q?nxVSxKdZlRKiwz74p6ijsde2//LoMYVU0gUgPy2OXC+sadVxrOsTAaEke7?=
 =?iso-8859-1?Q?p9wewmUbXg9gMm9LqGBSjo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ldXFZ+AdhKoFXvrTiAOTCGeGKbmtRoHOXear9EeVCgBsx7dwIxwpP80nVZ?=
 =?iso-8859-1?Q?hsVBdgRkcEK1aIPLzp9dyHGT0FP3EJ2PYC1UO6+5Rb1+7f54wxRUrs+M/T?=
 =?iso-8859-1?Q?qO05BsNCoUa29+5vjM+mY+fe9lt/fT0/ayi6xpJuPDiGlbwvaKS0gJ7OM+?=
 =?iso-8859-1?Q?AguvLsHK89KxpZdTLOTzCiK55kRlMoIHxR0X6d930VByntuJKJkmkbw5Xg?=
 =?iso-8859-1?Q?AtPKDB3WS93Vq7AIVhPTw/Dt7zy0qCUNmtS6buHKdTA5xGwDCn7vUwPLcm?=
 =?iso-8859-1?Q?ntdfqtvf13t9MouH8Vfuy1WHxfI5z6oaNGXeI5eqQzpmfxaEVs8KDAwWDH?=
 =?iso-8859-1?Q?RoOuedGZK12H+4zQhhAjtxgZwKIlcq9gDYc9F+oXc8LWdElpc/HgOGf5Xc?=
 =?iso-8859-1?Q?SRKrYDvMlH0GbREvjmbGC7ozyvLPefB+Py8PeuL6+Sf4dMFWrFoFRP0X9a?=
 =?iso-8859-1?Q?Rx1320fgXmVBSyvgtzJYlR5XwSi3Zfihbsh/Ka+q0Od6W5w57kN9vHShcU?=
 =?iso-8859-1?Q?FdUmZmaH5bNckJPAI1VkDyHCIU+sTPG7DGU/BNWczGRrJpy+udS7a6TanJ?=
 =?iso-8859-1?Q?D580dbEMmY2nVjT7lzeM1+bPVo+CkIa7K4vChQoo5QXNqcFJL5y+Am0FPQ?=
 =?iso-8859-1?Q?IFjUuLJJyLWbMAK8jbQAkYvIY39090DjEh3fNHKHgf6Ai6L/SGR1zSkGto?=
 =?iso-8859-1?Q?WexKXiG4+e6Yqbi1sv/8rdMFsXNNtKHgqP47f1ddK9nr7AdZleKbQllSC1?=
 =?iso-8859-1?Q?75q2NSjg16qHWZ+X3iWSotrFz/C9GbQeicxmdZiRSvm3kVGky4m/d/UjFw?=
 =?iso-8859-1?Q?qsdx0Jt02Wxmt2buRLCC1akJHHBjDM9Bg00ujPm6QHLF7zkKx+fgDhRMYz?=
 =?iso-8859-1?Q?uBzzs1+hoO545NqK4I7QjCFCa46CVnxwvmDa/B4B6BZfR5j/3ngWQIpYFH?=
 =?iso-8859-1?Q?mrBHAwMpchJKlqh9L7vfCR1T92/ghq49JDWMVqhz57ZiurT1pFsHGztIp2?=
 =?iso-8859-1?Q?4SxEtUxhS7xES55Is0W9BYHQ9JlAWxGWraNdwz9ckgJRQmnZZ/xBj71lkj?=
 =?iso-8859-1?Q?BphDqUtV30tVUaKsgGhlHnm7D1BEQOERm9323AZPBs+856VH9w8dSoXISG?=
 =?iso-8859-1?Q?oLppAZk3dy/V28sFX5EzB/in4Vr0BZr4gfwaZAFwjqWyDyLVkZHmLyZKTF?=
 =?iso-8859-1?Q?VMuYkJ1SW+7xJL7Lz2HmvRoLJ4H/PRzCEUmaFEyaQrf5JF8DzFzWXuuyxQ?=
 =?iso-8859-1?Q?iAApW9erHLVYXHSTclfoRzatXsP1z0CWyaW6wauzljuxXEbPo5SOOielKs?=
 =?iso-8859-1?Q?M1pL41G+ajkmlFqKruTkPKiUJuxyRkooiCA6Vf1LStL688iVd3SrTLx5tj?=
 =?iso-8859-1?Q?hRwrI9/AnWGHjo0v3RallXSNPExdYr2+IfSqDan5HjOsD2+fWxgZGplS0J?=
 =?iso-8859-1?Q?SIP+ytZhPsNRnYutOoMJToxyWobsL133wSWj3t1iWBvzKX8uCUM3pHh39U?=
 =?iso-8859-1?Q?N41yWb2ETuUkShGkKSixEpI3Wa20DXjYhNWdNMlFE0hL59vgtiRKUx3ELd?=
 =?iso-8859-1?Q?GXPaOP5BjsPRkN6mqPytBqvuJfsVPq07/4vwb2kUnvqYVz5fpvG8ifRg2N?=
 =?iso-8859-1?Q?PgBVuGHqSNFyj7wCPGD9g5TzEE8MkaHhl7BEGty05vovwlLRieoozaFw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998bad44-4bbe-42fb-da7e-08dd6cca33b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:56:26.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYFjjav879Shy75GnVDc+VXKVJPpzhr1FpIQjXJltVNw+L/4nSEmYrz98Uxxp3Mo8OMIuMvc3RvnQOpxY7zeDc9sTgQmFt5grybrH4c4A4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8363


Hi Andrew,

Andrew Cooper <andrew.cooper3@citrix.com> writes:

> The switch() statement is over bits 24:25 (unshifted) of the guest provid=
ed
> value.  This makes case 0x3: dead, and not an implementation of the 4th
> possible state.
>
> A guest which writes (3<<24)|(ff<<16) to this register will skip the earl=
y
> exit, then enter bitmap_for_each() with targets not bound by nr_vcpus.
>
> If the guest has fewer than 8 vCPUs, bitmap_for_each() will read off the =
end
> of d->vcpu[] and use the resulting vcpu pointer to ultimately derive irq,=
 and
> perform an out-of-bounds write.
>
> Fix this by changing case 0x3 to default.
>
> Fixes: 08c688ca6422 ("ARM: new VGIC: Add SGIR register handler")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
>
> This vgic driver is explicity not security supported, hence no XSA.
> ---
>  xen/arch/arm/vgic/vgic-mmio-v2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mm=
io-v2.c
> index 670b335db2c3..7d1391ac9b48 100644
> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> @@ -104,7 +104,8 @@ static void vgic_mmio_write_sgir(struct vcpu *source_=
vcpu,
>      case GICD_SGI_TARGET_SELF:                    /* this very vCPU only=
 */
>          targets =3D (1U << source_vcpu->vcpu_id);
>          break;
> -    case 0x3:                                     /* reserved */
> +
> +    default:
>          return;
>      }

--=20
WBR, Volodymyr=

