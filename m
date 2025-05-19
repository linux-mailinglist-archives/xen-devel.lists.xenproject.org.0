Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9505ABC317
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989966.1373976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2li-0006Zz-GE; Mon, 19 May 2025 15:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989966.1373976; Mon, 19 May 2025 15:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2li-0006TK-9s; Mon, 19 May 2025 15:51:10 +0000
Received: by outflank-mailman (input) for mailman id 989966;
 Mon, 19 May 2025 15:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2lg-00055d-Iw
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:08 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1385b636-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:07 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:59 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:58 +0000
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
X-Inumbo-ID: 1385b636-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StCd4X8kFsxYQtaujbffGTSrnSTEnadfSHwI4OmQ7ww6FxCGDZTHkMdLmB8K5eypiTUcjJ9qniD3c0TE2Qtt9abdIX/DcGBKqEmVlQ/H02E9KO+veZofJ5bZE241fDDbf+Xhb3Pct7yG+zIFMVjudFtgdBU4Nwrzxle+OyOTde7Gq1YWs6nhdT2d7/thA6YW6LYJ/wKROBPZRRVJwzrZBkcqAqE/dWh/Qmpx3TAuHM3Pqflh7i3mMrQpqd6vK80SYduKu6H4edhUTwFuzVPD3JkW9/TdMIpS8y0IFbe35QwnxRjJCCRgCV4pqnFZ8zRj/g11vpE0kOQaymmmq8uRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiZyyBp5vPFXU/i3NtVXScDoBYnysWozlVWCFXbrvnU=;
 b=jvUvPb78x1PItVx+bvFurzUIwZVo3XEo4IBObdpx6cO/8QjvjCbMERmozz4/HwXOAiqlWdcuSTU6Q240XRywnAfBFSiJU9L7+BE5IpwNHGVyXuYsClSJfJ3VA7xfv5icdH2Qt84E8mqz85i0AXfO/KhilgWJiQN1sNmSJel1NzTPKcPyDWgmcYeEAE0o+mwiYhV1RIJ8fRFhjKl1lPRZMBkC4j2+tJan6xfRePtD6wsBi7SNmywztgHyS0rHY2XW/q72EJiGsGHOaRC+hbjNZI/hU+ZYBIq/b67CEK5c7wbUi7QIEwccG0U14zz3Tih7ES+eOK36XWY+aZc/XOTwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiZyyBp5vPFXU/i3NtVXScDoBYnysWozlVWCFXbrvnU=;
 b=axrUxhiRF3zrqy+P2YNW8D8J7duPfECqhjQD5uYhtjFy8wlQAfq8AsjTxEHdYTGcgnSnpHOs4CrGg4eR4oILxtLFg+MZNvAw7IhXidoaswMCHKZjYy0EFDotL7YwxSqohuBNzHtqSOWX33KiSgN1dIA9W9PVhdH1UYLjWhpFysdGCgmaLRNwMUsuhdDvWOGNUcZQ45e5JM5P0bXPOZ21bvnk+o9klvUfTAJstTM2ISWC2GymcIqGrIS31PBsvXRT1stlrZju0EqZTyRG7OE/WmSm1pykXSFCI+GtqIEdNRmDyYdgi/f3Chy19stE5XrpsE+JJneTmPiz4v60lPSoYg==
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
Subject: [RFC PATCH v4 7/8] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Topic: [RFC PATCH v4 7/8] docs: arm: add SCI SCMI SMC multi-agent
 driver docs
Thread-Index: AQHbyNXP28/MAaIPLEugDxuikDXW5w==
Date: Mon, 19 May 2025 15:50:57 +0000
Message-ID:
 <6778db411b06a1f30d3983d94f3f23fc579b8382.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: c3e4958e-2404-4873-2ad9-08dd96ecf2f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yowmkBXagC67KWTAHUfQduceAFzhvkfvgEkzuxd52zQe3LEib/txx9CMq5?=
 =?iso-8859-1?Q?heggBHKKI91ADDvwbeHuzvQgnX/ms6QUNQcXAi3XSKTYsWdjN86r1FoH00?=
 =?iso-8859-1?Q?j7R1Vnp1rbaOV41JiatcLc4YTLXG9297GzB2H7Y8HsjGiJS6h46ehoxY4L?=
 =?iso-8859-1?Q?ilBld8h5KW8EX9KRuEqhUhSNJZu2TXW4jtlwRhg0tfINP1w8t9qS2bPfN0?=
 =?iso-8859-1?Q?W6T1qr7rIdikY2JG1EilwjEUKtLs6z7hO5IMAl3Mn9lNpAw1kTBp1TVIlK?=
 =?iso-8859-1?Q?PMKet5ltAbDXyJqBTa0eJEZ5T+SIaEaJWWOXtQG1/lAAh/dMttkS4+fBJ2?=
 =?iso-8859-1?Q?dK983PacyKXFVtI8zcQaWlNG3QGWfVRrbkq62DIAOVfOzJ0UrZGHYESKyO?=
 =?iso-8859-1?Q?o898+e2tzbqZetdhs9F8XIq4KRPb3E8Elw2UjgUlp0e+OoINXi+cSW7aBY?=
 =?iso-8859-1?Q?9QBuXVJaxCj4+d2UlhHYk7NojSr6wxGzLXjGSrC7C9cGwRkp2MIGQ8bbM1?=
 =?iso-8859-1?Q?v2Y1nX7+OwTqeqIxudp9Eynh95EJ79SGF/T+bxztK5JKYMlKduLqY5PHUx?=
 =?iso-8859-1?Q?2+N0PUYPka93arQdu2ZcBD6dmboflIWlJETKa3wCdNeNCZ+x0wBZtvNqxG?=
 =?iso-8859-1?Q?D87xQtWEWgXGsDPaX2jG6FJ9HRcBmt/RyctlsbKkaxWOrlAQrnAO1eqBHO?=
 =?iso-8859-1?Q?LIfV3lksMgOHnK9MW/poipRYfuUN8XqGzmYMQGWPPRrUUY9eS4dURJ4eDQ?=
 =?iso-8859-1?Q?mYNohjTB4xk3NkK6QPvRwfmTpWIkgj5nrCDxux0JzpVcSxZYPBw+bEixAO?=
 =?iso-8859-1?Q?HTy8dA24WuPpxwLRXR/7FIdZ8Xpc40kerdIHH/7ZARPPknkag8edvpqeIl?=
 =?iso-8859-1?Q?FqBa4fU1JOCVvR8s4jdI67a0OPMmXNmTlZKwje/DLXQj7O3FNQVHLtlY19?=
 =?iso-8859-1?Q?Cx+DU0iY1FFNLva9U9z4P6apE9RJrxGnAZMPmp3LCskT0v7sbTFa/sAyoF?=
 =?iso-8859-1?Q?K5xKJhqutH4qc902QBeoIw/Qc+PjMfW2xHsDzJXP9+LADrJVhgAV3eX+uR?=
 =?iso-8859-1?Q?Pjvp3Xik5lFJMfaACgwQ6pAQFJ6t7Wj+hDIK9M/X3ggkFUGgGtRUo21CVM?=
 =?iso-8859-1?Q?hrcJEiJM852ujqGRVaE1mCfcG2vFYs5hN2FZkg0QHKDllOqyYc0vEl87MT?=
 =?iso-8859-1?Q?hyxekiBwBurCUMGYC+ymLCTy5YUZm+01fjZyNOITjxZ4x/roCIqTGgCnJG?=
 =?iso-8859-1?Q?xO73l11HltCOaI5ni3PAvCDONhlJXqLi76UCFlunIoB7tGJ5aa+cIbbPf5?=
 =?iso-8859-1?Q?1MaTeRVelTeTRV/7/TzN5mx/JJAtL1IDSYl0TnWdu9GOQ+Nu6EekVtOaTn?=
 =?iso-8859-1?Q?mrJIxkNbxDCGV4SY7agpRZiSFUfh0q59NNhlwxi4Vt5m9OwsrLcLT2T4mU?=
 =?iso-8859-1?Q?1nTgR5lCI9xjjLPo3S89sEBQSuAd3KC7wi4xDAgQEj2HXoEsagGHzM80cx?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UvP9iTv7vK8tZ6wl8fMtxVUOzrDm9lRuprtENu4msawNAO8VqhifFRsdH7?=
 =?iso-8859-1?Q?HXconBvLEPvbs0cKPxfHQIdDePljuIP//2VYpcMaovlXNBKAIxnvWfGrRy?=
 =?iso-8859-1?Q?/vBv8BO42wvoJVso86gPFFFbEMbKTv1r8oZLTounabAnYKe8zzC98MAM5k?=
 =?iso-8859-1?Q?XpEeCz9XqsQwvU++mT06G5aQ/527Zwz29XaVbu/xJgUV08hrvnMEPc8Jot?=
 =?iso-8859-1?Q?sL/14+c7WbZINCd29W5dLLC9vF2oIjY1++fY/QB9gLDVe0ZM9jIBGUXgRa?=
 =?iso-8859-1?Q?C94lZUBZbYF7kWa0nk8EOjWgiS+8g4c8lInaYNnFFi7gIicnfKViLT0iPG?=
 =?iso-8859-1?Q?BI0qPVg+fy63so52MmxF/o1ggfkYY3DQj4v9dE3Hm0675N86gI1Wmu0Cen?=
 =?iso-8859-1?Q?CNMChrJqASi43b7lbqo6hlS16TDGB+Gj90BxRlG3rjcksmthjyUdAwap5L?=
 =?iso-8859-1?Q?Te30raPpuP6i44zTlBZ7Ri3QzSqOu2Friq8kuN9UkmwKRXBkbYxZP+7NOd?=
 =?iso-8859-1?Q?i137+Bv/fu42LO2EmXQClwQksZNLmTozpETnjFsyWbSz/K4nA6Pn0U2rYA?=
 =?iso-8859-1?Q?faCXKZLz4orp+DEahAP+vVuNx1Ag0h/V9SCWv4wDggGNg0Wk1WmUm4wt+d?=
 =?iso-8859-1?Q?t3q0RXbp39Gd/TCipTptpi/LuDknn05I4CFJHcvFlcY1h1kH0LQRYyxTwd?=
 =?iso-8859-1?Q?FzXgxYnlM3PpCN2+VhYoWdk7hahkZFMoKsrwjX+1OyCC5+rvlJHmAO4bb0?=
 =?iso-8859-1?Q?jBJBlGWLBhnFxgEX9i71kaos68ONI3Agwk0tcJzNYdz+zxfs2/OlJ+Fim+?=
 =?iso-8859-1?Q?V3deAtCI0jaLHUXiBMEssPmqflvRIgC73yM3CT23RiFz1yNkAPHs8UriPL?=
 =?iso-8859-1?Q?mUBYRyewKvhUtIkyPN/5apgRArfLmzx/VuDiuFT1JfiZ3mOsk9nvs0cv+F?=
 =?iso-8859-1?Q?4bW1RM0GuS9AZE1ImPxZywSWdrJS5L5U279l4ylqrfmEeh3MBkVN1pdMtX?=
 =?iso-8859-1?Q?vLEUdEGKYZV9ESlV8Ptj9oeUPVUrM24Nue0sWutnBWC/lf2tqFEL6jwU0J?=
 =?iso-8859-1?Q?IUagWFRsIyMsrg6auFsG2HjWszMUtH9iV19gqiws9Q0c5/w+8GBX+LfPZp?=
 =?iso-8859-1?Q?Zw/6siRlD0hlN8bLWaA02JnaI8Nj9Ag0bVkIyCzmom9H0qe7aPcR9LVBKX?=
 =?iso-8859-1?Q?tfKWfRHoXxZsOSK8CxgtbvHAiL5SbseSA87W3qn0/ywxOWGKy4JpSazbHc?=
 =?iso-8859-1?Q?vlT+CBgy/ZZgH8JijEEMI1hnU5uwoHapFKBFbh714oDU5Usm+81AxHSem3?=
 =?iso-8859-1?Q?1j5D49wPZuoNv6n0zooowHesK6+v1cb3zYg1127Fv/BXIXAR3Y0IubgG1n?=
 =?iso-8859-1?Q?CGcOaa+jigCofky7naeDYw2MCHKBPIUtMC4P77+81upoVG8n9zioay6Vfm?=
 =?iso-8859-1?Q?OktcYmNKMN90neqzgy9/JJvapk4TrQskOE201VfQHBTVYlwXyXTyeSx56Q?=
 =?iso-8859-1?Q?ktcH36SgB1WxMSkCgkOqWZSpGoKeNRbkhUWN7YdFD7Zqzrm7O6YLWc+it8?=
 =?iso-8859-1?Q?41fNA1P0tjMetkwjFMFacUtboCAnrcIWZmpwQ7JQzXQIBvpq2jNaunGqD7?=
 =?iso-8859-1?Q?ee3JFLpGJmSxKQWuyu2mTBmQsfyFZlP280QF/dVIiu07/936yD8D5DHA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e4958e-2404-4873-2ad9-08dd96ecf2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:57.9840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pKRg4yWK8CR6vkhNzANJvjOsloh9hdyiX/MotpzML1fjiGG+2LLTyLEWRs3ABglBkzd1SeI4AW3BNXI+EVW+Y3xaWWXqHODz5d6sgfDypvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 .../arm/firmware/arm-scmi.rst                 | 267 +++++++++++++++++-
 1 file changed, 266 insertions(+), 1 deletion(-)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index bf6a458a6a..27739015d5 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -31,7 +31,10 @@ domain serving as Driver domain).
=20
 The below sections describe SCMI support options available for Xen.
=20
-[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC/HVC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -175,3 +178,265 @@ enabling SCMI with "arm_sci" xl.cfg option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC/HVC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC/HVC multi-agent driver enables support for ARM EL3 Trusted Fi=
rmware-A (TF-A) which
+provides SCMI interface with multi-agnet support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id0 |        |         |           |
+    agent0  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id1 |  smc-id2|    smc-idX|
+             agent1  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared-=
memory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC/HVC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned** with ma=
pping``p2m_mmio_direct_nc``.
+
+The following SCMI Agents expected to be defined by SCMI FW to enable SCMI=
 multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI SMC/HVC multi-agent driver support, enable Kconfig =
option:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized based on the Host DT SCMI node (only one SCMI =
interface is supported)
+  which describes Xen management agent SCMI interface.
+
+.. code::
+
+    scmi_shm_0 : sram@47ff0000 {
+        compatible =3D "arm,scmi-shmem";
+        reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+    };
+    firmware {
+        scmi: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm, smc - id =3D <0x82000002>; <--- Xen manegement agent smc-=
id
+            \#address-cells =3D < 1>;
+            \#size-cells =3D < 0>;
+            \#access-controller - cells =3D < 1>;
+            shmem =3D <&scmi_shm_0>; <--- Xen manegement agent shmem
+
+            protocol@X{
+            };
+        };
+    };
+
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "xen,scm=
i-secondary-agents"
+  property where first item is SCMI "agent_id", second - "arm,smc-id", and
+  third - "arm,scmi-shmem" phandle for this "agent_id":
+
+.. code::
+
+    chosen {
+      xen,scmi-secondary-agents =3D <
+                    1 0x82000003 &scmi_shm_1
+                    2 0x82000004 &scmi_shm_2
+                    3 0x82000005 &scmi_shm_3
+                    4 0x82000006 &scmi_shm_4>;
+    }
+
+    /{
+            scmi_shm_1: sram@47ff1000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+            };
+            scmi_shm_2: sram@47ff2000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+            };
+            scmi_shm_3: sram@47ff3000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+            };
+            scmi_shm_4: sram@47ff4000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+            };
+    }
+
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC/HVC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC/HVC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+
+The **"dom0_scmi_agent_id=3D<dom0_agent_id>"** Xen command line is used to=
 enable SCMI functionality for
+Dom0. if not provided SCMI will be disabled for Dom0 and all SCMI nodes re=
moved from Dom0 DT.
+
+The driver updates Dom0 DT SCMI node "arm,smc-id" property with value and =
fixes up "shmem" property
+according to the assigned for Dom0 SCMI "agent_id".
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC/HVC multi-agent driver performs "access-controller" provi=
der function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code::
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci_agent_id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci_agent_id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+.. code::
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
--=20
2.34.1

