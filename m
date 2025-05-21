Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75873ABF43E
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991774.1375600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS5-0008RU-7F; Wed, 21 May 2025 12:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991774.1375600; Wed, 21 May 2025 12:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS5-0008PE-23; Wed, 21 May 2025 12:21:41 +0000
Received: by outflank-mailman (input) for mailman id 991774;
 Wed, 21 May 2025 12:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic9M=YF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uHiS3-0008BY-7V
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:21:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2606::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24805530-363e-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 14:21:37 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9644.eurprd03.prod.outlook.com
 (2603:10a6:102:2e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:21:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:21:32 +0000
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
X-Inumbo-ID: 24805530-363e-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahQnGVS3v3W8Zf/DTrXaCj2pIIENBchqPEjo+YUBoh/pg1E+tXIdnHQy7ECgD0dIYzJj+WDx9HCnMW0Fe7O/yuZUwxR4b29hrUK4G/PbIDArojcY6Txkl9gp5drwybAwq+x/lJPGJnjroT/OOb4UlR96CytAdsGdzhfhbiJRpXJk7TK9FcwTLqJOmLvIb9AwFjzzZp0cTtt2r8T5sblXSnDEL5Le1bZyEvwCW6EuDwgZYIGC+sVKYFt/nJc0LcljdXyvbKnkpJoiMVs/pJT/LTMpMEVMCTwHz/aCKBQWrHT3GdQcKrQjoZ/7b6IAB6uGdYOPcDYnfQTsPA+c5KEAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD+lXGFVxLsdJe/Wp7M37E7pZVi1Gm7YGU5N4kr6VvE=;
 b=XVKNRo7tbc2bQN97YUvsl0BfTjmHmvpX8KpkBovwE0duNTD5hQS4V2KhBUBk9D3dwnIjeKdjYkZQK0yRjlOp9+bmXT0jOEkqEUBHeFNvpiy8mpvgOeN819Otfi52wPLEYpCPTdRaXXnHXDdL7fSR5PtVX2L61qhf5NvgByXVV4+rd4QRgLIQPGPzwqRoL2GUyuTJgjXGGvNpbvDpDGUYLTi4sZtRXweFSuBR8+nt2EM3NziUFLHCZexnsgc5XMtWwdFO4xuTTFuvMQ2dR46doMv7gpcl3NXB3K9Z8hjahelsbWygO9O9HLzu6ab6kR5jBtIRS4YBcKK4Res04E3/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD+lXGFVxLsdJe/Wp7M37E7pZVi1Gm7YGU5N4kr6VvE=;
 b=O6VsuQts7ZMw0K9+auXhDPA/rA+M99xzYXYztugGim42oS3+uhCtMO5tbI7QSaclq0PjGTyMSSWz/TrqRR7ToLnqRby0cmodBEr3F8Yfqca/HWwiJpEvjTtWddBk1icSmwhMzXjBz0tGCmj++4DOPnNuDfN9sdSc6XV3xPhpZmU4UfwSbQHoNet92ZbxbyKIOojT4eTzaVizquGIxlkkfja/QpSpwVzhqnc4QaTxeIc5Db8Zms+egtFJtryIh8rePNuwHvHu/LLaCd4P1y/fo7dZ04KFksdSt8pvYg+xRgAzN3NGvTRZP2XYBDBaWyFGg4WC5XyXBUmxyEJWEQBpxg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v5 1/4] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH v5 1/4] xen/arm: allow PCI host bridge to have private
 data
Thread-Index: AQHbykrilqxIORNGzEKIDfmnR2QzLw==
Date: Wed, 21 May 2025 12:21:32 +0000
Message-ID:
 <f927ccd6cf048d2d9d3a7c0f0702697f511e9992.1747820844.git.mykyta_poturai@epam.com>
References: <cover.1747820844.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1747820844.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9644:EE_
x-ms-office365-filtering-correlation-id: 04e9cafd-fbef-4ba1-89b7-08dd9862056f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sgG8osn7F3EdxqBFqUYB+tKWXzDn+4VSyftuiJXl5TFFOdYJiu8tQXnKFR?=
 =?iso-8859-1?Q?RO243JSAmtSzltRVsYwKhKuUvzUM0cMQQIUKcdNgOwwUTYuiqF2gs0sfjV?=
 =?iso-8859-1?Q?qot8egCooJ0MqKWZgU1OjUn8Zh7bU3uNnfYf7Sya+ovckN6cyuMkoVk8ei?=
 =?iso-8859-1?Q?++Y6ppd0832tTCRlE+L+mvc9J5Oz4QYvoXf5gVj5LeZjFud/g4NhmJIGdg?=
 =?iso-8859-1?Q?KGYTWW4ioTFDphkwYhCBA2L1Rse5y4eH3IGH5a2VfMNwwF+znSRd4J2ifI?=
 =?iso-8859-1?Q?sVqPgKY+QOMvdRgX8OwJFQB4y4dOtGkl7TsSS3iC8j6fJPhjc5zN1I9scp?=
 =?iso-8859-1?Q?+Ot5g+WOb3Z7vien3GptAH5jcOH+yzZQc+Lj4p+nHAZD8xHkYfGk+Z0jQH?=
 =?iso-8859-1?Q?0XOhUODXF8fdBQIp07uPsoHJ1t01gOnrpTIGI+2MpFcRDQy7MzEv56YxrZ?=
 =?iso-8859-1?Q?vaZm+oPWzx36rurOAJ+VHp3lS6FD4oapd4dRM1V5ClUUTiSnlUodLwUMQw?=
 =?iso-8859-1?Q?e+HNnk4sLhUOsYy7h3h5D8N7ujcahDy/n1CH949J1De0dj+zfyFy0RoyuE?=
 =?iso-8859-1?Q?IvbM67WkuVb+HLFT38fVfsf99aauVVD48H5TOM1TvWc+oKw2bZ4Tre05C9?=
 =?iso-8859-1?Q?aWbNZDxVAXrI2f1lJtzdBL9ky1T86RFzaNkKRd+rER8pa5R54m6O47hAe7?=
 =?iso-8859-1?Q?oODw0FxCkeqfQGbTLburGVMEJp+aGEMxsNhuH61qgALBBGEiFrA3/deXPK?=
 =?iso-8859-1?Q?t04ugWthACelne+Dg5FQWorKIQmJbl048U4RcxF5VFtFAOcb0IAjTKkQbB?=
 =?iso-8859-1?Q?DSucn2cauqI+T8L7OH8g1GxlQzSeUs0v5kl77hNHADeKz1EqJElP4vJtCc?=
 =?iso-8859-1?Q?g9mReM7Aqws7egn61UWMiOLxN98f4t5qAWjbgNmyG8uTZQdDuXBq6Bbrx8?=
 =?iso-8859-1?Q?Te7Jm2Q6t2OLe+DIaKZbrW0IDXru5sd5Uri2zycknu6oIr8+0VXWLNg+mB?=
 =?iso-8859-1?Q?NGLf1Gkc2YTdBjoua42LlLls9SRAioOn/CZSQs3P/xWTBCMAcD7najqWot?=
 =?iso-8859-1?Q?4v+TCwrCa/o8IJxAo3M99cWbqO3aq2bVlKNjRBjkgFUKQXJ4DEkKkuAuzA?=
 =?iso-8859-1?Q?wlZx/sOODOf34eRMeOb2i5xEk7FTnEOKHNwj7RLkNpOWb26DycKBaoB4Fj?=
 =?iso-8859-1?Q?NsCMVMOOSAi+Ll6LPvCuM2bYKTJBeM/6u/qmWGJIOmsvN/iU50lW1TXWUc?=
 =?iso-8859-1?Q?3b8WrQ3w5mGhL/JPFF0QUCQQRj93IAIOmS9qM1hSFPhYfq7vVXYtWgBosn?=
 =?iso-8859-1?Q?+uDJ/HxRFEKudLCCRsYJ6yIhy0jlAd6kgqMAw7R8Eq5SYZ80Vkg9OZKaMM?=
 =?iso-8859-1?Q?CvGzVFFi1M0N6/mTL8uXCBoeOSrB+w3xliuWE5x1BG1w7tY69D1Lyx4ndN?=
 =?iso-8859-1?Q?hECXGki+Vdf/XKgOtdjyS9/req3ltQS7g2fABz/dYmpYBUiuL3Lmw9gZnX?=
 =?iso-8859-1?Q?GxCvZEQhey3/Re+AJxqnsHwCK68AToae0piN/Ot3eWgL3Xj5EJvXr5rVm8?=
 =?iso-8859-1?Q?yuQjTOQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vNVHzQHInt3RsuCFjzNmiwITfm2OJQQbSPDHcyEdmFrBohqiATrfEZm9zo?=
 =?iso-8859-1?Q?swTX5zmyF91vUp5HqhBL4RguAPHd3krP5bE2OYLbV2KI/pyZBHbVlPGS+M?=
 =?iso-8859-1?Q?sUnkVEZxNAJlvyuOTcy+Xc+/CLVw92R3b9qco3rSpgWw43CqgoOeCyFKuZ?=
 =?iso-8859-1?Q?C4Uh11hkcFyP1NzDl83ni/PXP0XqwUaD3zWkshdD63YF189gwRr+3Uj9Zh?=
 =?iso-8859-1?Q?e4h9LO7pNprIt7nzz0LBjzku6rrZTrc5oxOfT/I23i6RhLKaKidNtG9SbQ?=
 =?iso-8859-1?Q?nJZgRMvPAE4Z2vQOa2ArWOa4R/wbGuFYyBt+DxMEkNSB1lsg7lzzoql0xl?=
 =?iso-8859-1?Q?F8CVmHZi5Lk/reZZ2Y8Kn29845MkRlu0vU3DmJQIluLVjRY5pDMvKMmQIV?=
 =?iso-8859-1?Q?J6aBtD5/sACC7f7Wxr97FhGtGzGbSTydwV5LU6/fkqan+nEHsFwKgt6ead?=
 =?iso-8859-1?Q?zw2Y5JKzCHuQ6IKKzjF84JBs6qx9l3L+dXXbAcu+OeJgJ/L+ycoQPeKOEH?=
 =?iso-8859-1?Q?0hkny556BwywfyMl20mbX2ZoOW0ys93cxZdNsox3BTyz8On31vqbL/tZ9R?=
 =?iso-8859-1?Q?DHm8AvOhR5XYVQYTUyhrOa/K8ul+jItPPCj1Zn+AezDjZjGNox3eCUsm0v?=
 =?iso-8859-1?Q?+8VRS49OthyPOQWsa98sPA5TI4eLh776z1UL8S3izV+slnJXOzXHHU4SoD?=
 =?iso-8859-1?Q?mo69zF2AGeCfs6Am9KSAGPwibWpOgqUhzLtWRgiAlW1mc86k9AkeTwtY/l?=
 =?iso-8859-1?Q?opu4KX7huch1iUoF7fAeicpr3DVdMenFhf/jfMKRvG3PleRaCkZzNNbZar?=
 =?iso-8859-1?Q?ipopvYSGjWuhYsxfuSV/pCksR17HKOrEahnVT2+d5DAXiUBJo/qsjY7e5K?=
 =?iso-8859-1?Q?ZgUNsp75zXAvAfrBHTGbum79tgiFc7nLOBGpltWOJUbej3Hc/Db3FHlggw?=
 =?iso-8859-1?Q?yGbpXYZTK4luwMEOUM6qMWmYYeLVnmNxJu7LD9PzXvp5s7KV/GpBlxBxbZ?=
 =?iso-8859-1?Q?prPO1il2pFKunK7zOv35yHVtlc+woRso4SB6YFVpEjz9ANpR21LHSWN0/k?=
 =?iso-8859-1?Q?vORtpx8qopwlwU/ux21PHLrBJyzw4csEkAiaM19rIxgwyKaZsUSiQfRZ+4?=
 =?iso-8859-1?Q?1jluA9WvmVgPJmlx5GiEwxOppA3OxbRFsJI6UHACYB6G3Kn6cIqOkoFRSq?=
 =?iso-8859-1?Q?OyrFtDuOMDr68Ky7wUN5ukgQeAU6wu5MpJhAoSvl2PljSA+vpLY7chOkSK?=
 =?iso-8859-1?Q?ehB710dkaiK/LlbYx5C7WGj13l+hvitRMuBrZIOB8naUvJE7+21ZOg+kTI?=
 =?iso-8859-1?Q?ifbxpbtISYTTD3fkmrpl/+InFKlUp0B3c7jumUSHgqmzhkNA8lt6lloUk9?=
 =?iso-8859-1?Q?DQ9VVs1w4kQ8RDPBcEfbsQVGYmrOvUHj3zpZmLkTnxYk1exLrSN8kMkdQB?=
 =?iso-8859-1?Q?tqA6+Wp8B8CL4aGRVUhN8epLKHfeSdEKdaryTBzkgDQZrORh0fZ2bO4dTL?=
 =?iso-8859-1?Q?9XMm5rywGpRfRLdkIXPHldmGRGu+Wr8egX0QYx/SnQ7gFg8vuam18JZJZO?=
 =?iso-8859-1?Q?7/Nx8zx6BdTMVZSFjSLJ1n90/SGpKo8JrzO7DKC8orrJ+sbW05L+I+SJmw?=
 =?iso-8859-1?Q?wY0LmAMTzUbC2wStW2xPdwGvUn8Hb5oZ6WgLQ0Mcb4V7TsW+cfLHzrqA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e9cafd-fbef-4ba1-89b7-08dd9862056f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:21:32.1336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5ofO74kepu3tynzCa9+rME3Ze/Vl6//3i3Sj2Y3vB/TnXhGtBuIFhpvFYvVVAPJg/UpfHT81yoHZENHLoJJ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9644

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Add priv field
to struct pci_host_bridge, so such bridges may populate it with
their private data.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4->v5:
* no change

v3->v4:
* Added Stefano's RB

v2->v3:
* removed priv allocation from common code

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..a87672d834 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    void *priv;                      /* Private data of the bridge. */
 };
=20
 struct pci_ops {
--=20
2.34.1

