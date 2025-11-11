Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10582C4F546
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159199.1487593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZT-0000sb-8B; Tue, 11 Nov 2025 17:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159199.1487593; Tue, 11 Nov 2025 17:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZT-0000pz-1B; Tue, 11 Nov 2025 17:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1159199;
 Tue, 11 Nov 2025 17:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZR-0000bw-1j
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:21 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72cf042c-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:20 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PAXPR03MB8249.eurprd03.prod.outlook.com
 (2603:10a6:102:24f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:17 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:16 +0000
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
X-Inumbo-ID: 72cf042c-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHhEwRrhOcnYNZO7yUFauQxVDiyfQGA+yT0cQwAYLaE9DIXULWqt3lH8UVpZfIe3ASs36KpjVVDWjtlZ/YlnplVumTQQWj7GMs+RJp1p5vxYTRQep2+KslcKWJoHafkTo3RZXObRxWmMv2PXtIb8dctfLBp0fQmXiq4mFx5IxJwV3cETn5sYea4nQfPi0/8ZrDCm6P+4h5AM0sK6Uw4fpP7WijA+KhMPjAIv8FQXFSfXQybyNv7C8F081tDMc8hkNGIkQN5N/9JofPztn7adChmX8CdaeKZm8tqUYWpIKtTD7frs/o4E/hnPGksk4LkHoYL5QQQUTOPeMtsAMjvITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyLj4uxco1utI0YM423aHw7wHV4ljQvVnpBhYG6PylI=;
 b=CN9g99Gw6LaILTevmA6+8FN0zMJhymC/U6rU9/DfLKf8h9d1v8ibN9fNtgF4zpzrwnOLwdlH0hn+yW2TG1EvfIsIOqMEAr361x3fyCUwX/YB9cYITddvF2gkcjJcjY52WGkYSk0mo5m5t1xvboyhUUOrSRshz9q8zfTAMQwgemDsEi07j8aWKMDN8UdhK6KoIc+Gwe/rVLVZtbsW6jEBqDg5xr65htCzHGMwyVouNnQ0d2V5dmFg4fS6k3kkMY5gf/uAm9v9tDZJeS+HAbqdWjtwg/4QVgw5rSMlcdpHoBvpvblTWm2KGkQzmv/g5M7pFhq8P/l5niEbbgTepy2PZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyLj4uxco1utI0YM423aHw7wHV4ljQvVnpBhYG6PylI=;
 b=oohJHfE+1b55VgS0aRBRfMn6hzW+JVC5U1NOZ+5ZwYkuHnIN/+WWNekmCDj/hnM4c9cK/txy3qLfKc755v9PGCoROHDCMHovpZxcy8K+HYQ/mtIlDA1XeX5a2ie7+TT5jN7hIEs2r0/sAiwsGcV+WfK0C4x8Hoesk9d1oL7Omm/+S8AfeJQpy65f5qHaUGiu9mTEqlgS6azqMG62hEDyZtewH3gk1OSWgX+Y3oKzKlO94UCbC4HTQZnBZMevNhy5kKf7bDA/gcHI9W4VlZo8V9THX9QQ8zR5Spy7vAE77kKyEsbePl/8hNP8BRY7zzWBOA609G2YB3W2XSZE8Qvozg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH 1/5] x86: hvm: dm: factor out compat code under ifdefs
Thread-Topic: [XEN][PATCH 1/5] x86: hvm: dm: factor out compat code under
 ifdefs
Thread-Index: AQHcUzQyGKgXSqPuKkqMDOUnq/taOw==
Date: Tue, 11 Nov 2025 17:54:16 +0000
Message-ID: <20251111175413.3540690-2-grygorii_strashko@epam.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|PAXPR03MB8249:EE_
x-ms-office365-filtering-correlation-id: 909ad333-eb81-4603-cbe2-08de214b5536
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cLld1Xa9hI3ABbkG2ni5e9b7T4XQN9TcbVhnFgpn7BUlIiBBKnylsyGPAG?=
 =?iso-8859-1?Q?LTG7IOKjivC1yGDRYJ8MRs9mZgKqnJwazYzZhzbL0lw0GW0vETrjVmb+Gx?=
 =?iso-8859-1?Q?YY1CYAqVeC5XYFdiqq9NXadvsQL4cYaSmZURSeXKv1fCICs4ZIgEDy4LkO?=
 =?iso-8859-1?Q?1eEaSKu1lDkjrU8pb//WcR8rLwlhi26qRhhJpPWmymJ+fWglPs1RVQFpPH?=
 =?iso-8859-1?Q?7XNhAoFQc9UmauObyJxxiWBAlbY3Uqb3QV5MwkwH1mC2lgWURMb5jqd7qy?=
 =?iso-8859-1?Q?06iWLxEMhcMC+Xpa8qU/xBZ2AfAgnuI3i3FFLsqs576Cq9x3gG3QAThTrD?=
 =?iso-8859-1?Q?6laaxmbTwpVijgfdCBxyksR10kIyCOpf9tM5UfwF7kMGSofPm+HTOK6cHt?=
 =?iso-8859-1?Q?S1PTTU3qcRVCdQshovkVYxahRFjUmsAY5WZ54uomh2UCTmdoboFGY8Htb9?=
 =?iso-8859-1?Q?j4OoKQwMihTmYkG8Jl8r114mVeed7CMVWvel++Yns4VOfjz2oX11zmmr3L?=
 =?iso-8859-1?Q?lvyaAr0hYUgMkALLG/DP8RsGVFLzEVueld63yDtDU0gfkaeRWjs+lWQi2Y?=
 =?iso-8859-1?Q?Wxdkq/SsxnsBadMvNyQTFq4y9FZ3xP10H/tdrti6qnbrgSgapJmORxQN4F?=
 =?iso-8859-1?Q?z1+XRifdcZlAW4egZjgXrW4hVssW/XaP2AANqEVwcqgWCbgCFwm713Gxkx?=
 =?iso-8859-1?Q?4z1uV7jaYQL05cfSEk3zww8xPwdM/sbuywJkq+RBjezBkf2poaKEts3oLz?=
 =?iso-8859-1?Q?rOQSAK6T647IZQJCHKFp8oQhsqhKUhF03ZvryzCa+i+v6lC0U8/+RDdmJd?=
 =?iso-8859-1?Q?WR3cDDhvNKAuvpSdDTW/siddr+/qiYxehKxK5EcO5COEsxDERqTNYAKeez?=
 =?iso-8859-1?Q?tfNfIX1IaqedFDA4dbeNJqMn9Eaz5ct72L2xBVSu7Lf3QRns62TFe190I9?=
 =?iso-8859-1?Q?ssI+06hFCG3jWbIrMxdteGrM+KOJZBlyBLihZ/PZhXm1FmM+HjU9kXY1MM?=
 =?iso-8859-1?Q?GN8DGA1a8M+mlQpTC30Fom3upRClfYpd38qSrxOs6JHjYsOasQGKXxEhUC?=
 =?iso-8859-1?Q?KTuCBLg5T03NBxUK6YeovO79reSMR/OKlkvJlOeBI4A0tr+HY2xAJJwQPh?=
 =?iso-8859-1?Q?eG1KYY4yIGNHiVpwzuSWVMwtjHDHR84tlX+z9Lkkt8Rmaqmb65eXE1bm+4?=
 =?iso-8859-1?Q?VBunPxp2ncb5TFiJAZauwVnyBm90Cz4aOcDY3UtVpRmUYVnqzxlqicGO2F?=
 =?iso-8859-1?Q?uzXaKGBcOQilvsru1+Vlc8NfkTN2fkPqZrHeQYPgsqIzP7qPratpFNQhjT?=
 =?iso-8859-1?Q?8I4tL5mkQY+FZ4S7z7l5WkR06JG1FT9nTso5m2lt2ZNRyMpk9QBuZ7en+y?=
 =?iso-8859-1?Q?Ce7h/XDYb83SMliGKAFq5bbt82NxidIQwEqmsXa16ARmaWyCJTarspSf0A?=
 =?iso-8859-1?Q?ReNftxg+ABVHO8Ws6u7Ia1gTY46Of5H5JT/yCwUVeugpjY/CiCBR/gVeC0?=
 =?iso-8859-1?Q?bTJaLrVNIXz0OL34fCuQHJE7o5efRpZnnk5Y7wDsh8XBgzD9UDMy8qHtqt?=
 =?iso-8859-1?Q?ZJQf+tWD4x6o7ZsK3BjHw3KbGqeH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JIDXPKYmINsdtXHrNd4E/UlJw+PHTSKApiQ/JOBc5tfuI9vmH/Q7LVrFjm?=
 =?iso-8859-1?Q?Pjk5fOnKMd7kK0Dzyi4LnjmvHG5MmWcACOdwB1ViWzsRJtAt/IcwH+QVC3?=
 =?iso-8859-1?Q?R2hQVYn9R1DElKCXu474OR6zf5mS9XkLGgjCh59QyvchiKTQ8SE0fPkNRw?=
 =?iso-8859-1?Q?EAk3pbnrf7f8i6xcGe0wcclIyP3Di5xiRvX28nPbTJEPznxuy2SqTExsg4?=
 =?iso-8859-1?Q?F4ZWjv+WpUyuj9XyKs7l9IxkU5/Zaex1sxHey1Lx1u7epYtKG2M6XWY9PB?=
 =?iso-8859-1?Q?DuwPE4GS2MEKMPJS8AtV5zPV3hXiTYlfEb0eqdBWu0sfvUWpmwXc60OUkc?=
 =?iso-8859-1?Q?R7TmJVnJTJayidWEfzDoPnetb/iCdYfQxkFbAPN22+gVNOJaEZPrix4oI8?=
 =?iso-8859-1?Q?ldZxN7LFcYdNxoHUAOw9ykOqOyYUzq7U3p/R3jfbgY2CwN/iBMKhqQbRdR?=
 =?iso-8859-1?Q?W0zKMponATZNVq6XPT5kNWObLyyyeNtPd1pvFzhKTUkiKv6s9Y1y7B08Hr?=
 =?iso-8859-1?Q?Za4sbc2BNhlavGqCt+cTadJyuoMg7avO6Ls1oKFYe9bBbV57bfn1WT91Ks?=
 =?iso-8859-1?Q?gBSxtXQ4hsXXdvDprVBFXDopSIzIL5ix/ySSzDSJaJHbJzn4UYKO6ik2IK?=
 =?iso-8859-1?Q?gGRsAzE57uB08l3GKAovOmOlihwY6x+a9KqzoOtjKNNGHsdEysViRQdp1U?=
 =?iso-8859-1?Q?Jlz4KmiAZ46dDsrhogtNEdVAqTOsULeWPbdJqb2U4GG2k2vbAohYBR3IdN?=
 =?iso-8859-1?Q?IixthUBWmPc3NCV9TnwP+smewINuN1Z9AcGp1njQmL42F9lMrsD1A3T6Lj?=
 =?iso-8859-1?Q?SQgIO9nMO5de0rpYeGDQSvQ0EynrgYd4OGORUGQPTQYWZa5EXokbiemQnf?=
 =?iso-8859-1?Q?W2YO7kw3CwtpVjA4z36GEOOFHfVQF+tQOsRwjzuz61xK4FnQDP2VkIm56G?=
 =?iso-8859-1?Q?yFOAv52XOyFOsNp/IPpDQTVrzEq+sH8clbfZy6Q3ycPltF7GaE2/1b/xt9?=
 =?iso-8859-1?Q?fCqJr5qmg4SwtsVUT455SkkNDDqSN/LXd30CKN9tDuGPkyPinaD/94BgNU?=
 =?iso-8859-1?Q?AgmQ/jp/5PDWSuKouiWXobsS2UHLfsECMxkzvbO6aKTJvPyVzADoK3ZSuc?=
 =?iso-8859-1?Q?aUy2SFaPqy2ePAXRwvHYCsOLCgP/GdnmWJEGlsPwQatEOwuHf5v7zpoyZv?=
 =?iso-8859-1?Q?PpPXBGD3iN8yuZ7n9G4dn9Ow9bIyjET7bG+I80CqHdo9HkDkVtCOLtSPD2?=
 =?iso-8859-1?Q?dTRVvPI7hHmxIU7SfkAYxSLdp/lcrsaNwQnU92KaKGmZ8DdjJhB8Wb7ifm?=
 =?iso-8859-1?Q?LzbqU9/5VB28nlt8Svgwi7Sq11eMVX1l++lLahgiuszohIpso2+MO62DYY?=
 =?iso-8859-1?Q?UqrzBrzImgX6QXDGbk60oPCxcZKqrt+kh0bav3Tb4zjaNpljEzrjyIrHJc?=
 =?iso-8859-1?Q?ZGZtgcvHe5hNTaEf909JKqtAPVf8hzhqSwSfVc36jxezMGAptVOdSx5F+w?=
 =?iso-8859-1?Q?yEmYuopav5YsD9bmhnvtqq89XZFJKO41ckHesASLdYayttbRZtahR7pIyb?=
 =?iso-8859-1?Q?oEDl2lboLV2vDJPnCmbV7z/dvyTyS/MM7fPnKavhkosJ3Df69MSiK0YGsp?=
 =?iso-8859-1?Q?Dk0a6Mt1aAznD881Ag+PW05qBK2ItrJOeqXqw7w/3dGVpp0+94/RdqHQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909ad333-eb81-4603-cbe2-08de214b5536
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:16.8562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvB0NPyCHEr5A/92U4eU8GoGgmfmBRnLMoZUxRQpTY6nfOu/IMxLXkZfdSfnDcG5x+qPaeHvrpSj+A2XHCflXgU9hDakW+P9ACdPEuwFonM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8249

From: Grygorii Strashko <grygorii_strashko@epam.com>

Factor out COMPAT HVM DM code under ifdefs in preparation for making HVM
COMPAT code optional.

changes in v2:
 - do not move code, use ifdefs

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0d9..f6dd1634428a 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -623,6 +623,7 @@ int dm_op(const struct dmop_args *op_args)
     return rc;
 }
=20
+#ifdef CONFIG_COMPAT
 #include <compat/hvm/dm_op.h>
=20
 CHECK_dm_op_create_ioreq_server;
@@ -680,6 +681,7 @@ int compat_dm_op(
=20
     return rc;
 }
+#endif /* CONFIG_COMPAT */
=20
 /*
  * Local variables:
--=20
2.34.1

