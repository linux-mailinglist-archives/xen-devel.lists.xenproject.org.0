Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DDB420EE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 15:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108273.1458456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOD-0001pK-GD; Wed, 03 Sep 2025 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108273.1458456; Wed, 03 Sep 2025 13:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOD-0001ky-BU; Wed, 03 Sep 2025 13:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1108273;
 Wed, 03 Sep 2025 13:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wznA=3O=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1utnOC-0001dc-7i
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 13:19:04 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea87dd5-88c8-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 15:19:01 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8120.eurprd03.prod.outlook.com (2603:10a6:20b:447::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 13:18:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 3 Sep 2025
 13:18:58 +0000
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
X-Inumbo-ID: 8ea87dd5-88c8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqzE9p9l4Yf4BnX4rW+Qr+fzZCR5pOrImJ8vbD5zmkMR5/JZIzXeuweqSO7Qzrx+Fc3GmtvXTHfwS76leUtwhqB0n2mi0t6UFR0dzxVfVbvN+x2jFr9bgo7jor9OnaWzszcSuPwaZQw8x23MuNYmgY8uoOCtAx3J7UawqZcFYiIxxEsB+coa5Atm5FEwlUH9YZZMq7X8v8GYxLIYnORWisY/rvVAK7vueUlc66zhGcKleZSNs56M/r4YzQFqAEuahUVYWcsJmfgnoTb35/mGEHukGs/9hAswF8oqz6rqsN+Wm+JBrcSO+QAkeFE4Cb4ANU+C3/DlZV1m0wZxFJyPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RZ6TN9xlD23qNyo1sphiT2FyZ4D2fga5HP3rU8xy+M=;
 b=SgOSxJb6wzKgQWHYAYmc1FKFU0gIqXyRmCSvftr4u/aGD/jlA2W4y3QW+qP5dfX+bN8xQoyPKM3IswuQnKKl35rQ3/GXtpLT0whxr+RTA+Ul4hWC7OQ9LXWWh2hhdY2FdlvoqfyphsQVi0H6O49JZqFWwFrbjphEPwdCuO86MZdAotANA8kIlZVn0QpT582Y/Rd4bS6JYMRzE+eGAvC6+Q/ZNLDME8bra+uNc5PyiCpKNUxu9l/3pHYOwSOepLPv6IE+AzNgKnBGRnwc4tcZ8OlbGUws5Aj6Ab3DX58uusJLRPot8AJINggt1n9eLG4+W2qGwatJmUXvXnVqw7u3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RZ6TN9xlD23qNyo1sphiT2FyZ4D2fga5HP3rU8xy+M=;
 b=j52uIPUGypqi2TDJq/GWuN6RA1UH+IeSeNCX90QJganP917CYcvT4AF7TazfYegsgO8L6U5nEgp66sIzeu4G+fvdzOQwqWCMwaCqVaZdp02d93cstcuFo8VSU+qUTi2EavHyXOIffSlABl7vxA4HON/ZaKIOmR8VRTjYjC+NF94IkwBV+V6l4Qa8LqqJ9F0KTnrD2Z25RNXolvXrWIuwwIVE0NPHpYGueJFHN98oEbn9cTkweAiiOrBLJ5OEqM8rYuHHlsVEXf8av0gYAlcX3fFKd2p/T4qmOItcZfwfwMx7aaKnXrNd8ZdRZi2efTe6sKnTd4DoByunE2YSQ9srDw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [PATCH v8 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Index: AQHcHNVMsMXwm1Cux0SKgbROukIRhQ==
Date: Wed, 3 Sep 2025 13:18:55 +0000
Message-ID:
 <99c2a98ec8ed09e1a5ea44ef515cb1bbd057410d.1756905487.git.oleksii_moisieiev@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8120:EE_
x-ms-office365-filtering-correlation-id: f79f96b9-916b-4655-4bc2-08ddeaec70ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Emh1xVcXqSdwEJpkWPdwX+jELrLSEPJ2etOwe/G7qzdc/9LaTJZl5kTsIy?=
 =?iso-8859-1?Q?yEufNW+Lz4ap65mDB6aiTwzGFPfCMUhduD+f7PORVbs6bMvsFxVK0nH/yr?=
 =?iso-8859-1?Q?ZnPhXOqwy6Ccbew6NJXnBa/kAXSvMJE/TDoNI6va+44BoGaiKsE5XEmLaM?=
 =?iso-8859-1?Q?xzEuSAo9ebgtO0Sr3phrhFlOG/Uiv4wRsgqDeWODrqO/k0J3zDRq3cacAW?=
 =?iso-8859-1?Q?l62pHYkwwyBqqcOWHUuniQzQZJNXeO7bFMyE8DCd6V57bsJmouzymCBb3m?=
 =?iso-8859-1?Q?64b65Q4krryT2bjQbMRfSG4XZzYEBu2rdlR8yYBmqfr3IJVpbOQrV7Hrxk?=
 =?iso-8859-1?Q?bqh4tpeoiSQzzcQPDSfNj2P2jFUnmdRlp+3VTUuLXAAtwIoDD5mIIJrkpP?=
 =?iso-8859-1?Q?cIJKhio2yCXhl0w5TZ/6n1YkkwBYKHWvuUNN+QRXq+6hrrBdyXMXNy7nPg?=
 =?iso-8859-1?Q?CLy5M31A3Kpiv+P9pdDFWE0eMRDBd4zgaZ9HsPaVpHkWy918a7C2I5SX2R?=
 =?iso-8859-1?Q?M9CSsLrdSXPYFEJJ+ZctgasSeKjuRqlIBa1crPR+n4134sSZssMOod9KRe?=
 =?iso-8859-1?Q?ol2uStK8Iy0Ay+tyFMfx80HxRpon9bsSraTFiw7NSGlruWwvjuu/iL54c9?=
 =?iso-8859-1?Q?E1m9DMxuet5B4l3UP9PuI+/j07Xsg5kI0cYZAgyhQxh5PTuu2ovaIai+Hr?=
 =?iso-8859-1?Q?bbetZpO3hmKnIWQFbOxmLoWt8LMYSvSCbXEaN34Ykxw7gelJKBDqKH0H+m?=
 =?iso-8859-1?Q?gIuUusbQmygdodyNTq0VQ3pmpErzyQspnynF0wd25rwUmMEs9yergRNw47?=
 =?iso-8859-1?Q?RAqxOTneQucw+9l/S0img7SWF7//jXSULlf1kxPSxqDoEXz4KodpDzXLDp?=
 =?iso-8859-1?Q?wWsct7Rkwm6uL5Rf1ztTbLNUY67sFAUCPT4Qwd/SvwbGBgWduMD03+tEEP?=
 =?iso-8859-1?Q?78oAHLuPg0/ADMYLji/kBg0Wq2gB+gCbXONl0N+Vh26x8oa/UcBFi4nFgZ?=
 =?iso-8859-1?Q?ghPO8wOfIOdEhzoYpxn6wLkuTuzxHLFqpnj7M1goL2sdADUCpcT0AXcapf?=
 =?iso-8859-1?Q?Od2AOo4euD9Hj9ql6RWAnN9rzGe1csUePeuYwawyUl+DRKgvjB8xttpaJY?=
 =?iso-8859-1?Q?5UAiFSnp48+vT/DEYI/wfl1bY1g380SjVvve6nvSeMyuBFRX4JFluaCTdB?=
 =?iso-8859-1?Q?tphas+ioIT+FjFJUUEff5cMl74/nAw4/FxB0EPJYKEVtOEh8PY0gQ651d3?=
 =?iso-8859-1?Q?SUAyGoUFRbTv/xmJ5yQHq8puB3TUmfEPAR6xTHCwcEfUTVkSnJzl6ZlxOn?=
 =?iso-8859-1?Q?Iz49qnQJtT664vz3R85xuX6xHwzedolQdfuU+asldA5XFRdZDLwzn4pHn8?=
 =?iso-8859-1?Q?P6CJ+SAJlGH2IuwD/pscXdaW2/lXWsJlaOlHTp/REBW4GAwY1PhbSafNgV?=
 =?iso-8859-1?Q?LFVOsk3CR/OtegNJeA86LjYl57Nu3vCMFAa0dWoGuX4Gsef8t8WLTiHA7F?=
 =?iso-8859-1?Q?vfuSD67yRretawpNGVruij8HrUuo/i/CeLKmft9KZDgw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZkjXK3B+WzfT5bOCPe0to5gj97c+qOVtIRBSJytpYeF4i+m25k4i0O4JWq?=
 =?iso-8859-1?Q?OH1ROC0iYZfKWy+hpp7CNQ/RKTOLDazoKBm4yE8DbmEm+zzM7N3V/WA1yV?=
 =?iso-8859-1?Q?1xDo7r1g8tJvtpGJrWQBbCBx3uu2JQfy9EvHmkIRHrFVQD4tDjLZ6nsNAA?=
 =?iso-8859-1?Q?uJw1lPxXIE7DfWapjLC6pIRKZRWy0GDxddu1KK7IgjFrul2P3kEAEtCOch?=
 =?iso-8859-1?Q?tDQ5FlE3tMdutL8diXprF0CZkGsoK2eJtTFf13ym5uOeKycpGzFQKQwAoC?=
 =?iso-8859-1?Q?fCghFgiio9fRtQRlUpxHl7s6ZExxkbUSM5pK2/0m8Y8XZj0jHLBJOSxSNa?=
 =?iso-8859-1?Q?y58fw9GgiUDHtqZGqvILiuojbU+MMQyrATT7FeMZeyHE6B1BU8LFsnGS1Z?=
 =?iso-8859-1?Q?N04IlM7kQbMJetQLDU7N9HnwSyfr85+g8SvfpiOcMV6lTd8/9n8KUyu8Nk?=
 =?iso-8859-1?Q?KjIznD+b499tQ+JDFRKdD4FRtx+2BjZVNgz01s9CQo2u8HFi/FlLlyRnN2?=
 =?iso-8859-1?Q?bXcyysC6VjTtsqsGr0TFK7Lw1J6UY2o/NDoCfao4/aL2oNZsAnVo65X8Bj?=
 =?iso-8859-1?Q?VtmLyH6YhId5ysaJnH1395jyv6CMmZcx7ThLvfpcvo7zwHODZsWnMyMD2y?=
 =?iso-8859-1?Q?ilbjwes8py1OzzJBUGoSqeEcNuEp1ZgsiGQj6+2ZNG2XcQWoazF0KXhErO?=
 =?iso-8859-1?Q?cQSyd7nsuQQ3pePYpFeZ3h0pLRcRBrHvCvvljnCUOQvElYMlYRmI5wx1MZ?=
 =?iso-8859-1?Q?OJ+SjpieUODZj2RwdC/3Ch4s1qFFQ2J3dSUgU7YoCEzAD97Jbww6kZS2Us?=
 =?iso-8859-1?Q?VfWUN+OHMGZSO2TOrMjfg86/s0VsDMHpVP+ds8psSiP6zI7ekcT7J1LLZA?=
 =?iso-8859-1?Q?k5S/2znpBXxNe7SS7TyUo2XEBYuJJyPxYgt3f1PktEIryhwuvubU8uDadK?=
 =?iso-8859-1?Q?pDWMLgLIUUGKKXvoeSz+r0KWcOuIPsoSSPrB52X0irvfYzjkIrC85+Lh7e?=
 =?iso-8859-1?Q?Hia4pSoI0+r0DIIBN5NwDCnKRRvaqQtZIK4ysRdslWkZyRYeNdAT3T+A5s?=
 =?iso-8859-1?Q?hKtpB195BZrkyWiPeMvKS4H/oyni7gAbTY5M8TQo5C1NGNlnO03l119X+j?=
 =?iso-8859-1?Q?4/bcITTWAI1HbBcatTaUl9L/cPFzbTw3w4+6Eo3mVSindpl3c14o16I9+A?=
 =?iso-8859-1?Q?CreONkRd5ZheR/ltcxo/2eYiZXhMWhGU0J/y1nl1MzbrO+CJMToVulp3Pd?=
 =?iso-8859-1?Q?0DiO9S5C0c+OiSfnf2ndXadbMzozX7eaRVxV1V5Onnx6m+/OLVarjU7Phz?=
 =?iso-8859-1?Q?bwtzoLVQm0SajgvNg0RqiZvLIezo38MMKyHRs+M9pRPhX+OkcRlSFlxOS3?=
 =?iso-8859-1?Q?mujzePMPsXUrMiogN6dEh2wKu3tFuFwHZ1YJqnQqVGOy9oFtdzr/JH3JsB?=
 =?iso-8859-1?Q?bACMGpOCi58cSpuYVtBaq5tismtWqvpYmLl/pSqRkZRNFg/KJKaLcICZ3a?=
 =?iso-8859-1?Q?14es9zb/TUxSBl5gZXCsV9FwXvc06D1X5M6WGig8Qxdj06sOWs0uU+sL/T?=
 =?iso-8859-1?Q?r5UEpt5GqQqVYuSNPQEEgSu/aWVVW56ZLaGZeF+Kx6+VfePA/WxTo00aV5?=
 =?iso-8859-1?Q?tkIH60KbjZ/lTztvYwku7dDWdco8KvkRJsigpJBcTkX55vjnLjukzvdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79f96b9-916b-4655-4bc2-08ddeaec70ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 13:18:55.0858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vy8NGZJI9xOzRU1zHIX0hhBHNwm+1isZt3qvqhcsk56Bhpa7W7q/DNzjjg3/aOkmjf4NlTOfEiGGdqWyiGKYKpZo85jcK98W5qTWWb+9t6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8120

From: Grygorii Strashko <grygorii_strashko@epam.com>

The introduced SCI (System Control Interface) subsystem provides unified
interface to integrate in Xen SCI drivers which adds support for ARM
firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
system management. The SCI subsystem allows to add drivers for different FW
interfaces or have different drivers for the same FW interface (for example=
,
SCMI with different transports).

This patch updates SCMI over SMC calls handling layer, introduced by
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"), to be SCI driver:
- convert to DT device;
- convert to SCI Xen interface.

There are no functional changes in general, the driver is just adopted
to the SCI interface.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v7)

Changes in v7:
- sort headers in scmi-smc.c file

Changes in v6:
- add R-b tag

 xen/arch/arm/firmware/Kconfig                | 13 ++-
 xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
 xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
 xen/arch/arm/vsmc.c                          |  3 +-
 xen/include/public/arch-arm.h                |  1 +
 5 files changed, 64 insertions(+), 87 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index fc7918c7fc..bbf88fbb9a 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -8,9 +8,18 @@ config ARM_SCI
=20
 menu "Firmware Drivers"
=20
+choice
+	prompt "ARM SCI driver type"
+	default SCMI_SMC
+	help
+	Choose which ARM SCI driver to enable.
+
+config ARM_SCI_NONE
+	bool "none"
+
 config SCMI_SMC
 	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
-	default y
+	select ARM_SCI
 	help
 	  This option enables basic awareness for SCMI calls using SMC as
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
@@ -18,4 +27,6 @@ config SCMI_SMC
 	  firmware node is used to trap and forward corresponding SCMI SMCs
 	  to firmware running at EL3, for calls coming from the hardware domain.
=20
+endchoice
+
 endmenu
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 33473c04b1..4c5df714c2 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -16,12 +16,12 @@
 #include <xen/sched.h>
 #include <xen/types.h>
=20
+#include <asm/device.h>
+#include <asm/firmware/sci.h>
 #include <asm/smccc.h>
-#include <asm/firmware/scmi-smc.h>
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
-static bool __ro_after_init scmi_enabled;
 static uint32_t __ro_after_init scmi_smc_id;
=20
 /*
@@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
  *
  * Returns true if SMC was handled (regardless of response), false otherwi=
se.
  */
-bool scmi_handle_smc(struct cpu_user_regs *regs)
+static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;
=20
-    if ( !scmi_enabled )
-        return false;
-
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
=20
@@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
-static int __init scmi_check_smccc_ver(void)
+static int scmi_smc_domain_init(struct domain *d,
+                                struct xen_domctl_createdomain *config)
 {
-    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
-    {
-        printk(XENLOG_WARNING
-               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
-        return -ENOSYS;
-    }
+    if ( !is_hardware_domain(d) )
+        return 0;
=20
+    d->arch.sci_enabled =3D true;
+    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
 }
=20
-static int __init scmi_dt_init_smccc(void)
+static void scmi_smc_domain_destroy(struct domain *d)
 {
-    static const struct dt_device_match scmi_ids[] __initconst =3D
-    {
-        /* We only support "arm,scmi-smc" binding for now */
-        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
-        { /* sentinel */ },
-    };
-    const struct dt_device_node *scmi_node;
-    int ret;
+    if ( !is_hardware_domain(d) )
+        return;
=20
-    /* If no SCMI firmware node found, fail silently as it's not mandatory=
 */
-    scmi_node =3D dt_find_matching_node(NULL, scmi_ids);
-    if ( !scmi_node )
-        return -EOPNOTSUPP;
+    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
+}
=20
-    ret =3D dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id=
);
-    if ( !ret )
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
     {
-        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
-               SCMI_SMC_ID_PROP, scmi_node->full_name);
-        return -ENOENT;
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
     }
=20
-    scmi_enabled =3D true;
-
     return 0;
 }
=20
+static const struct sci_mediator_ops scmi_smc_ops =3D {
+    .handle_call =3D scmi_handle_smc,
+    .domain_init =3D scmi_smc_domain_init,
+    .domain_destroy =3D scmi_smc_domain_destroy,
+};
+
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-static int __init scmi_init(void)
+static int __init scmi_dom0_init(struct dt_device_node *dev, const void *d=
ata)
 {
     int ret;
=20
@@ -134,22 +127,36 @@ static int __init scmi_init(void)
     if ( ret )
         return ret;
=20
-    ret =3D scmi_dt_init_smccc();
-    if ( ret =3D=3D -EOPNOTSUPP )
-        return ret;
+    ret =3D dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
+               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
+        return -ENOENT;
+    }
+
+    ret =3D sci_register(&scmi_smc_ops);
     if ( ret )
-        goto err;
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
=20
     printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
=20
     return 0;
-
- err:
-    printk(XENLOG_ERR "SCMI: Initialization failed (ret =3D %d)\n", ret);
-    return ret;
 }
=20
-__initcall(scmi_init);
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
+    .dt_match =3D scmi_smc_match,
+    .init =3D scmi_dom0_init,
+DT_DEVICE_END
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/in=
clude/asm/firmware/scmi-smc.h
deleted file mode 100644
index 6b1a164a40..0000000000
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * xen/arch/arm/include/asm/firmware/scmi-smc.h
- *
- * ARM System Control and Management Interface (SCMI) over SMC
- * Generic handling layer
- *
- * Andrei Cherechesu <andrei.cherechesu@nxp.com>
- * Copyright 2024 NXP
- */
-
-#ifndef __ASM_SCMI_SMC_H__
-#define __ASM_SCMI_SMC_H__
-
-#include <xen/types.h>
-
-struct cpu_user_regs;
-
-#ifdef CONFIG_SCMI_SMC
-
-bool scmi_handle_smc(struct cpu_user_regs *regs);
-
-#else
-
-static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif /* CONFIG_SCMI_SMC */
-
-#endif /* __ASM_SCMI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 4095171533..78d5bdf56f 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -21,7 +21,6 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
-#include <asm/firmware/scmi-smc.h>
=20
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
+    return sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e7a17ede3e..b31324f8d4 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.34.1

