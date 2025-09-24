Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F83B98B78
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129038.1469236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPX-0001M9-I0; Wed, 24 Sep 2025 07:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129038.1469236; Wed, 24 Sep 2025 07:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPX-0001Hy-ET; Wed, 24 Sep 2025 07:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1129038;
 Wed, 24 Sep 2025 07:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPV-0007np-08
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:33 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ecb384-991c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:59:31 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8118.eurprd03.prod.outlook.com
 (2603:10a6:20b:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:21 +0000
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
X-Inumbo-ID: 66ecb384-991c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU+OmY1zCbjTPrNSM81LjG5rGveBcVa7iVJ9dfyDng7btMmMZYtMllGrlawo81fC8K6zgjlu74dLwAGOQJYZH9rSftn/nOl2xvS/Zhy9/XzjADIH7xjIboVCN7crfyZLTtWmKFjXf7yN/CeVgHdjP5OhSDQ8EM0pzS4BrX/5yhrcPAu4t3VC4HEG34ygtHHbCW6DBuBKEnVZumRJFg1VummUhLNzDutbiTQA9WDbeNrx8T6cwRe87LV2inSon/6l73gM/5I6zxJRwnp1sWk0bLv9iv50EZdWofR8Ucwf7zGW4M8X0tKId+0zGkJ/ns9XlcsxG/cZTwHpiOngz63R6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aM5rnffTBG1FpJH3fZkryHS/mhGD1pkq5OAg1z03Yo=;
 b=Kme1/Wo5OdmjA+O+8HEELmR+rj0hmMT7Psn0KUcmcHgPJPzfKikUuiY9K37F4xTS/uYyZutqFTigIF0JJ4BIbd9MYQWgw4b2gLFHDp8eH/4iS3OU2y/AtmEISanZ77f80mJW4aVRTND6HwD1leYB0D6djzl51najDmc1RB8FAEAJC3UCTTDzxobPJQ9OM2OPtFbzzuk8Fcnncf3i8ZivzsiVpymCnpP64pVvSza1HLiwYWv/O7caP40xuwoJYbGXUws2JbgP4CV50iHGOz7gBL8e5hG4stJmGTwExTwySOMfeiFNeo6s7JJFC4ueHX6dC8644S/f+kXq1lt4J/KzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aM5rnffTBG1FpJH3fZkryHS/mhGD1pkq5OAg1z03Yo=;
 b=V9z3IWBGPm5jCoIdiFQ0JmvceqHK0aBpMACH0cakUgEiC5QFOGRemvoVkhs/4Iy+N8dUlpr4zXLcYBzIZ2Wtx4RpK06TQlORQxKAbHCNJDaayTGZcYVSbAHfEfsL/BD3AFDQzjkNt9p3r5fe6zuMmsu41nfzsmZrnsaIPdHVGPMu5WNoBkm0919tRoDCX2pyGTtTK9ZA9w5xBZmNq5YAIHKvLkhiGllExX6eu3lWXXQhqZaUSp/WKOV89Zz+on93KsZLxy6zFwH5JJirpmyWYiLhzuJ4/YMwp/5i6o9VQ6qZLjL/Imbyn+STBWcXlpndR+uSQqXm2+VARUGg0QyqdA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 2/8] xen/dt: pass flags to callback in dt_for_each_range()
Thread-Topic: [PATCH v1 2/8] xen/dt: pass flags to callback in
 dt_for_each_range()
Thread-Index: AQHcLSkipAtIZfzr6k2Dq8DXInWg0g==
Date: Wed, 24 Sep 2025 07:59:21 +0000
Message-ID:
 <fc2a0bc9a5bb79bc8689dd5a50ddc050837de17c.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8118:EE_
x-ms-office365-filtering-correlation-id: 040f4619-f7bc-4b83-34fc-08ddfb404521
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JsjPOgEkaSmvFo6VZQuZopEsmMay6duMLV1FZhmZBkog5RoMfMThYtJkZJ?=
 =?iso-8859-1?Q?YKhXvtkp80pGo2IqYc5WUGWlOrUaUvrSXhLWCd739vcTz9u0yNJuuIldL6?=
 =?iso-8859-1?Q?TN8PSGQL4TxMOusfezLC34AO622epYS6hFZiL54EJPYIE0bnBtjoJ9K65j?=
 =?iso-8859-1?Q?7+sUhWhvhKrceJB0gE4d+R/4KXJZuFgvKQIhzAoxugxNomOVwOM9wWacb/?=
 =?iso-8859-1?Q?EDLZMULw3VwwmSYafxcBC+xsZebJRC6Bmwus1i22l7sPCAaAvG67/606NZ?=
 =?iso-8859-1?Q?ED0HnLewYBSYuwpZ0oeD8kK088lW8qzMJb6sV3Tp4m6OrNswpbHCytigfI?=
 =?iso-8859-1?Q?dOoMuUwjwH1FN7p8iyDOr6i3Av+3ooubrXmCN4zye3+K/zgWgorHhlV7FS?=
 =?iso-8859-1?Q?UMrhC/9IS626ALXSJwPsVctjEbNO55exN0pB6BU+6stG9gVsOPS+IfBPP+?=
 =?iso-8859-1?Q?MkqSOxbg0FGchXFkg6Gz6EpUFzB04ws+lswlQdUQU7Hv4GyQ8UBEnM0X6o?=
 =?iso-8859-1?Q?fAFsqUHCbY/gk0Q7wIshknhgdnoUPrO3mFPH6H8UQzf5a4N6NLeMOAeuJn?=
 =?iso-8859-1?Q?bkdbqmlqd0FGKT/Y2umDj/CML/6s6sNASeQgBIZQJKgXl3JTwszAGvUaAE?=
 =?iso-8859-1?Q?H9iBe2GgpnnTO++kbqF/felp5ay7PilBofy51fL+Z7lYynr0vxhhRekfjH?=
 =?iso-8859-1?Q?0BsFYLnzoMY5VXfH4K9y4gskKK5qhsEzFEgLRWo6F407e6l6jUDEWNUKvI?=
 =?iso-8859-1?Q?tcyS+QlbOXoGszA8d05RHFMmfaJw2hYTi/SA+YFCDEsq/jQM3OHVhOtlf1?=
 =?iso-8859-1?Q?o9iffsegbmNg4Izu1bFFYeNej86bQy1dT9DYT0kV0S8AyBUJRtYV5ckhmC?=
 =?iso-8859-1?Q?1KpC9VbEVL8FTt8l5DbQx2MTiutsr1b+C2k+obb7f2PGK/eXAKpJoj85uY?=
 =?iso-8859-1?Q?ayg5Tf4El336cwCBvdXksMKMfQNv0ojo8FFmYDWgWR5HKTa4TKCzC7Rrv+?=
 =?iso-8859-1?Q?XiPm0UOvciriBYB0wYcMQTCUSv2ntGZYnPgUyhyrGG0Kf6TXoxarVkjFAf?=
 =?iso-8859-1?Q?zqR6+8aTEjHrQzGvf5/6BwdKUdXu1PTsNg43kvZ2D73l+ffPw3wy005clu?=
 =?iso-8859-1?Q?qsaveL3gqPJHvt3f2BDEq1gWG/EmgNI4ell6720TQUAMA6YmFWQRGYGgHA?=
 =?iso-8859-1?Q?nxq/UQw4xnvyDgAct3A+KzQswoOP9rOIrrU05UY1C5+m5GpEcG64UFsXO1?=
 =?iso-8859-1?Q?yZKkrS5e6JichrIHjxNZsisflMHViFfKgl5hCQMsEHxcZOobgDmznHhh8h?=
 =?iso-8859-1?Q?3qp4NqiegodtybRVra0GqIyCJ3iFgM1D9LiZufIzygfnFyImdKZzrYisfe?=
 =?iso-8859-1?Q?aOOoP8jFZli9iJA0olPktQX0lL+XU43T72fClLek0aRsgor+LW40aj57zs?=
 =?iso-8859-1?Q?spkyjqbIEM8IrHlC1zM5t8vtRyVaNenfvmZx7UI8iA2fZaFgJ+beShgQAw?=
 =?iso-8859-1?Q?OG+XYXXB8GM0VL94j/KT6H35Ndc/bAWVxI24haF1LUgArwRFtzw1LXRZEs?=
 =?iso-8859-1?Q?t7W/quY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fvzkgSuRFe21nR60IkFM8ju/OVR4njXDVIJF+Aw7HsKUs8RQzBXf63GfNf?=
 =?iso-8859-1?Q?z9E+B73diODEw9Zb+44j0fX1TlBU+6Fz5+f1FRvrM2nyMaWyahgzx6uns1?=
 =?iso-8859-1?Q?KVmEnt8IeP2eGRlVS6028pgsX7uXGtdqUzajurSdDHD0dmma6K5tLzYGLf?=
 =?iso-8859-1?Q?h83yt5dR/Ssxf33KqMpz074fwb/bPqy8pjwjs1OWusYDqIXVvOTEmL+ij4?=
 =?iso-8859-1?Q?BfifzI1LT9PVeK71NaWT/4lB011dNwhteywjMWbebGGu2CFFeLXGw1VNql?=
 =?iso-8859-1?Q?F+lZrmV6gVe0R+X/YdvxFTEmNtmwduIlKNgMp26fSuIgplgXB7qROEN5Gd?=
 =?iso-8859-1?Q?cGuWW8AkK+E6FXLEWbudGE9H1kpVsm2LSekLrF6B5hWpEVUfai95F2S+7r?=
 =?iso-8859-1?Q?5lnXARHo6ZCgosIHA9H4eIx2PER1+brhJRqkXhXZb7qDsdZOmtGyFpr1YI?=
 =?iso-8859-1?Q?GSSuOhKMU20dmM7Xe3uOe95xuGFmnE3/uNFg7DY+J/XKuYSRkplqJ9fKAb?=
 =?iso-8859-1?Q?e/+2q/gTBwymgBXAJAx0+alE+O9MADeicvjQ2xOo5CBgVzyYP1bnCGdCEj?=
 =?iso-8859-1?Q?JGBJ66G3ud4pWx0zwRucTbNB8CV2XkDOkWAufdFXqoi7KddVfJhv4lYP3x?=
 =?iso-8859-1?Q?Oh87rajPD8VROfkZfgYI1DOA5y1IpST51CrwNWJqzbLXnkpEZyRUwA4gmE?=
 =?iso-8859-1?Q?oPxse3RjhlevHJyuuHeRDevLFRvma7dU32xHtuGjUN1vGSwmSyrrTpvEBw?=
 =?iso-8859-1?Q?fen6JQfWqhACZDlKqONR+SyjCB6XUDThMvxNH5RjzlZv6Os4tZaMG368Qf?=
 =?iso-8859-1?Q?uKdaToc2F0HYKvuSro8Pso9GMUXz0KEZ+cGcpBXsvRblY3WUJ7QWpn7fxA?=
 =?iso-8859-1?Q?y1AgRwaIpFLQojKUenX/FLhZlaLuC1g/k+Ty0lPAm4b6N1cm//4hT47OSB?=
 =?iso-8859-1?Q?2sCFjUfgRtZzyq+Tl3yXcMxu+hZCLgMXxSBIpfW25AwS/NcSLsl1hFn/+d?=
 =?iso-8859-1?Q?rxmvN63Q+pNYxcY9okWMtVuF/PlZuyl+elX4gcraJXWHHAc2xzzLGFX7lC?=
 =?iso-8859-1?Q?FcpdFvckCsCNMQMUdRA+28Jnpb65ZFL404P7W80cLp0RjZluAARwZFwlgG?=
 =?iso-8859-1?Q?ihPxVCejln9v5jnyPvOiCPoNijqSYYsgqt1CBsBrPXxG4sEGycne8r6Lme?=
 =?iso-8859-1?Q?txnuhWnjr+zhIHfMXjIyKKVWjk5nDOZc5fEVoG/iLAA4FLaLBE3tAbDLBY?=
 =?iso-8859-1?Q?15Vu0Rnyt3SLXjPJZ1NJmJiDH6ua4y1MdlCrqokS+tlkhUXohumrLWXjaS?=
 =?iso-8859-1?Q?EjOualmOnTFb0g5P7bhjoFBrR+Z9TBlNBLgqZ1StnmAERR0zZ1yjZo3XJA?=
 =?iso-8859-1?Q?wkYZKv6Witm0PisFoLlP7boGbt+UViDj9trs8f0LzsebWeqnc/VihKuwY5?=
 =?iso-8859-1?Q?bRH9OIRD221fSTF6VcpSe190opMvcEj1RDGGKDTpnFBxAjBWoiZc701jTW?=
 =?iso-8859-1?Q?EKlty4pGYvykJFOOvim7M7nwkblAspU137C2b4k2h5BcOIMFXseVqxnymM?=
 =?iso-8859-1?Q?ASghpEEksRo26WxEO1w54zPKT3jm7r9P0kkD/ZsJAIL1nL75l0WcROquYj?=
 =?iso-8859-1?Q?LaBnMlamhVpjWcXqcjX697OmkyjTotOVImW8dPecmoB4J3/BOo2KM9Pw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040f4619-f7bc-4b83-34fc-08ddfb404521
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:21.2187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iElgvWhH+3QLrGswYf9SVlfZx/JVquEc0mis8MLqvlBgtU5lHs0wSbDJHs+TPppekQWDhSPEoeU7bK7sujNGhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8118

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

PCI ranges have prefetchable / non-prefetchable flags that will be
needed in the callback. Pass the flags to the callback.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/device.c                | 4 ++--
 xen/arch/arm/domain_build.c          | 3 ++-
 xen/arch/arm/include/asm/setup.h     | 2 +-
 xen/arch/arm/pci/pci-host-common.c   | 4 ++--
 xen/common/device-tree/device-tree.c | 5 +++--
 xen/include/xen/device_tree.h        | 2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 74b54cad34..cc0759023e 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -50,7 +50,7 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 }
=20
 int map_range_to_domain(const struct dt_device_node *dev,
-                        uint64_t addr, uint64_t len, void *data)
+                        uint32_t flags, uint64_t addr, uint64_t len, void =
*data)
 {
     struct map_range_data *mr_data =3D data;
     struct domain *d =3D mr_data->d;
@@ -325,7 +325,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
             return res;
         }
=20
-        res =3D map_range_to_domain(dev, addr, size, &mr_data);
+        res =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..4bbffdf535 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -762,7 +762,8 @@ int __init add_ext_regions(unsigned long s_gfn, unsigne=
d long e_gfn,
 }
=20
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   uint64_t addr, uint64_t len, void *data=
)
+                                   uint32_t flags, uint64_t addr, uint64_t=
 len,
+                                   void *data)
 {
     struct rangeset *mem_holes =3D data;
     paddr_t start, end;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/se=
tup.h
index 1eaf13bd66..97bc5f90a1 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -62,7 +62,7 @@ int map_device_irqs_to_domain(struct domain *d, struct dt=
_device_node *dev,
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
=20
-int map_range_to_domain(const struct dt_device_node *dev,
+int map_range_to_domain(const struct dt_device_node *dev, uint32_t flags,
                         uint64_t addr, uint64_t len, void *data);
=20
 struct init_info
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index d3481b05eb..67447d8696 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -418,7 +418,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
                     bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
             if ( need_mapping )
             {
-                err =3D map_range_to_domain(dev, addr, size, &mr_data);
+                err =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
                 if ( err )
                     return err;
             }
@@ -434,7 +434,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
  * right place for alignment check.
  */
 static int is_bar_valid(const struct dt_device_node *dev,
-                        uint64_t addr, uint64_t len, void *data)
+                        uint32_t flags, uint64_t addr, uint64_t len, void =
*data)
 {
     struct pdev_bar_check *bar_data =3D data;
     paddr_t s =3D bar_data->start;
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 0b5375f151..5ee1fa4eb1 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -976,7 +976,7 @@ int dt_device_get_paddr(const struct dt_device_node *de=
v, unsigned int index,
=20
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data)
 {
@@ -1041,13 +1041,14 @@ int dt_for_each_range(const struct dt_device_node *=
dev,
     {
         uint64_t a, s;
         int ret;
+        uint32_t flags =3D bus->get_flags(ranges);
=20
         memcpy(addr, ranges + na, 4 * pna);
=20
         a =3D __dt_translate_address(dev, addr, "ranges");
         s =3D dt_read_number(ranges + na + pna, ns);
=20
-        ret =3D cb(dev, a, s, data);
+        ret =3D cb(dev, flags, a, s, data);
         if ( ret )
         {
             dt_dprintk(" -> callback failed=3D%d\n", ret);
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..1091e34a10 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -667,7 +667,7 @@ int dt_for_each_irq_map(const struct dt_device_node *de=
v,
  */
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data);
=20
--=20
2.34.1

