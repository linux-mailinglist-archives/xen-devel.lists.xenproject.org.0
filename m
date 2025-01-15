Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EFA11D69
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872256.1283219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzav-0003RQ-3w; Wed, 15 Jan 2025 09:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872256.1283219; Wed, 15 Jan 2025 09:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzau-0003NU-Vl; Wed, 15 Jan 2025 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 872256;
 Wed, 15 Jan 2025 09:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbvD=UH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tXzat-0003Ki-N5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 09:21:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2460b1c2-d322-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 10:21:46 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB6795.eurprd03.prod.outlook.com
 (2603:10a6:10:208::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 09:21:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 09:21:44 +0000
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
X-Inumbo-ID: 2460b1c2-d322-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y47soDzYjxppb1ccVqFExjnQnp1jsBg/bqv5UW3iEezZfPQxrhzUrn0FN/SxDNtsjuzqXY9J/ZfLKCGzOe5xaMnuGzHlUm/d5axwMXZs4WIKcYSOMXKAW9U52yns67kjflM9tO+5rBe1/CFUGdpd+n7O8nauNBnPdWy8lZ2C9cmTDt9wVCp8Ao3hNExq48tDh4lhLdP2fH9SV316jZhGOvclUC3sCsVNkwX5l/FHFxmOysyritu86TQDu3GJGUvtSRZkv1wowmdw9sdgkqpFdv6Gz3090Iz1aUXcrGbzwm0buxv8iguBZ4Y2dCbOhg6JGgsiqBnAWHWNQFflqIQUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFrATFgoRJ6d7ziVWdmSYdnPpEDIZasMI6cQcXBIx4o=;
 b=n8tX68oIpvHYg1ZCeflSG70/qtgvEZmRo6H+JiUysS+rSQe+fLD2Yk4tmjKz+BcxbfzDOBEZiEB8lvhfDoSA+gC0jTNCaNf4zHgyqVXrfRzr8gZhG2VrMZUcf+SyVr02Gf4dWdRrHdqzIUrrfJmxszE3OkfNO+oOh/1pdhunJy2hwtxkg5hvKjaWq708Srkl7SZvamZ+ZZV7GECuZ2xcT5UCcRQqiYlR6iJZAN7LlvsW6EXmCOtRIDoismMSav90IeQvPTrXxFLWc+4kMPlzylMOT7JlHiM4s89n51qKUpASr54X9ZgVrE+hIm6+VyKdEBY6zeE/jGKG54+7RAKpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFrATFgoRJ6d7ziVWdmSYdnPpEDIZasMI6cQcXBIx4o=;
 b=a4Md77JYkJk3gAFLISq0ArsCsviQXa6q1QgekP8VEum32pAsqRMeYVBHJNCC46193s23uCTZe2HlG/3CPlgSI5zv0WD2c1JMZ5WVcKCgCLQ71nfZQRhIxrRGsYrcMp3Bm19vKjrY4UXMyykQAmhlbWvzSrweii2QLFIq2vNtfTF51ELpKQ8t4wrZeyJWyOUPGKEdm41kUqRQrVy+I07dKdv8wzVED9Jozpgkw96QxhvABAVkwH2j4lQCSwkkWTah27TShEyD5OfVciW6iVGIrzIDF6n2ky+P3IzvGWduEM03efNDG8o0kfnXNzkj7WjIdV0neL8j8vw/BjCm0NxLwA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Topic: [PATCH v3 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Index: AQHbZy7k98WxcNwle0+yx5zuTI6nBw==
Date: Wed, 15 Jan 2025 09:21:43 +0000
Message-ID:
 <c09059f745c33b1f10f0d1b6cb790a50b1126392.1736931052.git.mykyta_poturai@epam.com>
References: <cover.1736931052.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1736931052.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB6795:EE_
x-ms-office365-filtering-correlation-id: bfd9ba29-8dc3-4963-73ca-08dd35460728
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kDMEFbZCFZaEHvJJ9jpECctJXAxFOFJReT12kZ8k4X/BuO25Yhac7Kyk3N?=
 =?iso-8859-1?Q?GgecFmsfDDLIz6+y0mJjiEp3Uy8wP28m87bFoR7Wt6P8qWLDTbItIsNumF?=
 =?iso-8859-1?Q?3PiyvLiQpZfVNaf3RKe+pTbxcPjsQHEzpR3rLMkV1KPo+4mUlMDTiBI7XK?=
 =?iso-8859-1?Q?6HAlsyK9+w/qImNfpsiG1mZ3vtphfk1uzEigC5Ey9vBBlRQO4gE+jTNFkt?=
 =?iso-8859-1?Q?qvHTOu5j2xYFJl2BQ7KEwSLI7tuoVyh0iqxuSTzIHYXjx8+Z8HTnMrjso6?=
 =?iso-8859-1?Q?UasYhWIZEhXbuxdpH2k1fQ1Mm1U6U9WFTjw720dExh5SCGvyQ5wQnYVnYG?=
 =?iso-8859-1?Q?D21ofsA2Uqi/C46Onhk3hwivR00WepO6C4CS8OPaBKqJDyrc+eb3bEflbs?=
 =?iso-8859-1?Q?VFUXy3DRuX84kXRxo6uV7tgKyv5V4mtyywQk0QCAsQGfwhEuli3N+1F4XO?=
 =?iso-8859-1?Q?vN04O7UDigRhaptf1wNFi50mphF2ySWtlg5sx+GYtzxBE8BlQVAlvpfEi3?=
 =?iso-8859-1?Q?ajXcTlLMj4XllY72VCQwsJ4AURdarwz8ZAecbAjeX4OnGvIwyi2WI1tyBg?=
 =?iso-8859-1?Q?Spxk2G1udSF2lARKzPvrKoviCqRuDBZz7uQURV+R7laVITI1rDpF8rc4O+?=
 =?iso-8859-1?Q?2f8s5li9CmKDnJXoGz4oMpesklMbIZfZWVqQyv6qhmFfipTgPDeC+xMMaM?=
 =?iso-8859-1?Q?WrW4gz4mpNkAERMcNc5yMXwqvUpXbPtFodBXdyxDVwiUPk2Fj8Z93PV/lN?=
 =?iso-8859-1?Q?GQB4FhYYZcqNci2d0u3lU643Og4/A0Dw3i6gPkIE13ALgHt+KQ3V8QDBWC?=
 =?iso-8859-1?Q?hDafspIy4mPBJNSwCu74wGCwAqWXZMpWu19Qn20gxvEa+crwH605jkUktc?=
 =?iso-8859-1?Q?Z6hF2OmhSIKiOrVshvQk9rgKpdEPNWURtj/xoQpv4kUbbQa1vUvFOxPTo0?=
 =?iso-8859-1?Q?mZ834ZXfFbDieSeCx2ucihgfdMD7BNUrQ11XYrO3S0c2RXHF89M3G2pcov?=
 =?iso-8859-1?Q?HSQjXxv07+sWUEwEaU0/uWS9CkRRcWyeOaJUUDUXwqvoA0Wh4JEWvZrp0Z?=
 =?iso-8859-1?Q?HPpuuor4n2tdaFGD3HwVuz59GnLeEhXzG41tunDglj7kKQ/dOllMpkNSS4?=
 =?iso-8859-1?Q?qRYPmyetetqEsn35JUQ4ap7OjaJZ/BXcWr0QniPz6IVEWelP0ayFsFSfTO?=
 =?iso-8859-1?Q?hZZroiTIapDM6mEO6opIEzKWz789xFwz3j9tvKzBEnlCZQO5vrWIO7bef0?=
 =?iso-8859-1?Q?KdYI56PJ/8IzW1bAPk68oFB+4DmJ2w3+xZRGQ7cjF6b+i6WhIhy3bD2oiW?=
 =?iso-8859-1?Q?2Cg3Sy/DxAHkOXGg/LD6SyHtb/VAOU2Zg2D19IGsAxpcoIFE4V8b1On/8O?=
 =?iso-8859-1?Q?bfkXGNE8dTQuvl6HuCkLGibZn+njHj8LLv5nv3eihhEtyPwi1yRLFv0eAK?=
 =?iso-8859-1?Q?oLhypUmMKAzHuapJuXzemG3/nQtTWAmaWbp9BX99O7HwyrC5m1ti+gSxBM?=
 =?iso-8859-1?Q?lH/zQL1MVPX/RsBIGyGw+C?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0WKYk7reOnB9XnzDolECMk8r9zw0OFW6Tth3nY6MOMB7ANo+d9yjduMWIr?=
 =?iso-8859-1?Q?eIWQRRCF6cr6YiO1YEY8qs8oUwW4IoEm2EG5SalAollhyD1TUpUWUcNYYO?=
 =?iso-8859-1?Q?v/7V/Z+t2nYsLWv1cpiN6EpDrhjZPKEXkNSjJNOnGmjgh3ege8QXw7s1Ay?=
 =?iso-8859-1?Q?Obr/1eF5vYoSj9iJRlmLXaMR98jlGlL5+Yoyl66gxeRXayNcXOJL5yoprX?=
 =?iso-8859-1?Q?t2sfWUuVhz8fa+5VEWpBACNwLtyxf8JgaJUdtPZA9afKgb09wj7lew2xbS?=
 =?iso-8859-1?Q?4HwrgYWwe05mlDtsG15MJN3vyyAiK1YcaSA1ckJ1U4M9q9a5DlXDxIfQ5a?=
 =?iso-8859-1?Q?6VCxR8Pok1hBt7hgYzdyKFS3DuYICrV6uRWDszQW0MUKgN3R3grXP2TeL/?=
 =?iso-8859-1?Q?gjHJMi/OQgigjpRs/k4ab2FuBTZ2HxKDn91v0hfvtEK8Vi7hYAwurQN+Na?=
 =?iso-8859-1?Q?Vm6vRu89tq1vMHDz9EK1e6982lwk8bbF3Yb6gjOW07MaNjuNR51KRWi5yt?=
 =?iso-8859-1?Q?yeHBa80Am/eCO134G8WlrxGZBwnQChbXtu45V/njX3vfZtnmNM3cpxut5s?=
 =?iso-8859-1?Q?JjoozfgIfLlXkm8Aq2MhsCszKRHtDfCUu1i62AT83h1+jHEJ6xojrC293b?=
 =?iso-8859-1?Q?zdYwK4GoTRIW+64pjAMQu6rRCgUYENGp8NTgW49vFr72IXYaITcWBPUpoo?=
 =?iso-8859-1?Q?eHMhB+5XmfjcQX8yKgaJbyogAZ2bPkNkkg4qV8Ta6IKll9aVgJhJw8dm7K?=
 =?iso-8859-1?Q?8IdNJr503yHe/a9sUBHI+pXi7XPVVnv91Sq1E5RUzoE83LNyDjJxkuNt9N?=
 =?iso-8859-1?Q?4TgN6yIhZD+TgXZm2HELb+1Jb1pfuHm8omIDB7YcIpKngEhfmSVPLMU8Jw?=
 =?iso-8859-1?Q?V5zwFxv5r1y9UwBh4yZps/JrjR+R+VG2OkrqB7C0vQxs8FIAlY7s6bQdjz?=
 =?iso-8859-1?Q?NQLU3q4QXcCFgLycb7HYPLnf6m7lzZmuLTS92TcokcfplcTX5Zod7D3mfI?=
 =?iso-8859-1?Q?rriPRK9b2qdn1EXO7pkaFUJCVuGKqhRybBIAuQWQ40rh9AcJSV8y8duCc6?=
 =?iso-8859-1?Q?ZshjsfIjjiml+lMUEiPqqpDFPavKGbgW9AOgRJoU9P9K0D2mqxlOvVujMa?=
 =?iso-8859-1?Q?OIzDGpbw/jWYXEP2Np4vpol20kiNBXRwvGnJWS7gfk2FMZa5Nzhk4NxgyM?=
 =?iso-8859-1?Q?JkwSz+GVeSVsR+L9AOITSMVQ17ybznmtz0/sa40TSXOVVl625ofGRayHOC?=
 =?iso-8859-1?Q?msb+ha5VbY81YLWfkZe/f10Sn0N+aOBu68fD/M0+zsnBjJKWudLvFYFIxr?=
 =?iso-8859-1?Q?54IGYQInc3iVQ63GsFHW8S9ijmdlvOj68QcW6vxIbqjEtKabxzKEUSAGlD?=
 =?iso-8859-1?Q?fqiV8x+N0sH86TbAQC3Su7J6GZmyafA65IR3gNBm7b7L7cfvw78s7ziBBt?=
 =?iso-8859-1?Q?ifAjwsMr+/XDuWQuEhFTmrZmdM0FEVJ7o9zBNKmuvnLpg6hRumuyt5zEwD?=
 =?iso-8859-1?Q?2Z/f0AkgYvYe8GhgwRja+iua9Qq+s1SLH4Hiww+velvBeD0ArsJDBa6iNu?=
 =?iso-8859-1?Q?aD/bNZ8r/iv7xY03YKFOOLXNrdbSrsG6vPvz8m+3UdQcE3tAObdqr27KkG?=
 =?iso-8859-1?Q?N80X85Hx93sN5KV71xIbwaFqQ+03c6TraDX6ZtvTwBlpycb3jI4ndzJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd9ba29-8dc3-4963-73ca-08dd35460728
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 09:21:44.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NvNJHuS3oYckyXUhF82nt2Zf5CVB/NyzqGkoBYYPu+/bN7F486AE+99yjF+MztAVdGo0hKqoWcfN3qHxbMHGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6795

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add Rcar Gen4 platform choice to Kconfig to select all required
drivers automatically.

Changelog:
v1 -> v2:
- Added RB from Stefano Stabellini

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/platforms/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g
index 02322c259c..8785c168bd 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -29,6 +29,15 @@ config RCAR3
 	help
 	Enable all the required drivers for Renesas RCar3
=20
+config RCAR4
+	bool "Renesas RCar4 support"
+	depends on ARM_64
+	select HAS_SCIF
+	select HAS_ITS
+	select IPMMU_VMSA
+	help
+	Enable all the required drivers for Renesas RCar4
+
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
 	depends on ARM_64
@@ -55,4 +64,3 @@ config ALL32_PLAT
 config MPSOC_PLATFORM
 	bool
 	default (ALL64_PLAT || MPSOC)
-
--=20
2.34.1

