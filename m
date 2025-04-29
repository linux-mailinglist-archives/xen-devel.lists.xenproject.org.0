Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF5AA0AC2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972143.1360611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVb-00015s-Tq; Tue, 29 Apr 2025 11:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972143.1360611; Tue, 29 Apr 2025 11:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVb-0000wH-Kp; Tue, 29 Apr 2025 11:52:19 +0000
Received: by outflank-mailman (input) for mailman id 972143;
 Tue, 29 Apr 2025 11:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVZ-0008D2-Fe
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:17 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6512c97b-24f0-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:52:15 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 11:52:10 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:10 +0000
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
X-Inumbo-ID: 6512c97b-24f0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yvu+grspmGk5NrikJD4CTRXT9bVrCnfgXSGhCTNxCW4tWYLZlYxT0YGYR92x41blqudHIDc/6Ef/LXxmVVaHIfr4vabop6yPlbrj1CIk0DAfJAzkDBeyUgRcnixLZj9GixpKISBvLOWl8st2uw0RcnOmEs4quJC2j7GXQ+BbDbpoaxmue60q9Gtc65sGz/LhtF6AY+Wb9ckXvep+s/hjVlVHa/qzXomNzcyO9Qcjrx+yr7QNImi7CAPg1NPKgUpz0yyiR1BSZUm63dZYG2hmJlEe9ulEHNguu/XTcYWovx6E8Fa6Ea0F8a7gnJeoRgt8LrMbPsFVkAlYhiO7kBRE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9uJ62LiIUebfjmXvSn7Ffx03Ltqv8K5A3eIk0fgEV4=;
 b=IyMAkHF5AsEmboehvmFMAbEw4b/U8qA++Yab48sz+ceGNOV5mnSlKklZEmOT8VLzYnRQyMLdTy2ctGA2MWjB9PekRxtyw6zguAKnuSlBrT2VahBW6rWo9rcr4hmqo1G6pnl/cvnhxPZrq1g/Uu1X6BG6kmCRmWRRHxhL5Q3oj38CK/SiHbWsYPUQOaZIUpLVb0CR6LAhdloqgwmoHYqFeqZiVrIE/x6d+cJBrH4Z72z2iTLx+87/yZtNiUKMD/lrPxk6CpY7HhF+AtMPlSsy6OEX57Jd71csp81JPlQJMPmFGuYoBBd3i/q9/WwgMoGqJ03YopMEGAAVTzgH18ALNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9uJ62LiIUebfjmXvSn7Ffx03Ltqv8K5A3eIk0fgEV4=;
 b=YsQYmEOIXeW2TPYz9m496Uigbx48+A0Sin9H9kpLLWVfi2EypoueNPLZSqoxsBgZUyg7Pa5yJ7RxBdUcxm55mp2rqJ+ngu3w5ZKuVtjlEaIoZ+pYTnjisoF9RnFNpGwtftdCojRzbbt49hbK8u7MqQgUNkaNdeB3htmlWGdn1Uip0RNo4Ywsq4WKKF+liVajIw8FcVsyUoCjcTb0KHQdjQuEfNBZQDqCRMleiVa1LdcsS4wkO96bs9bt+VJ139SGhRG8glrk/IKxcH3h3zFF8Pt5s2gnxNMtJgOhvOCshMdJpfWMUWrlrXA7LpsOEs0FXzbBDs2F66ZsMTioFtzE0g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v10 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHbuP0jWajlCsZZMkaNMgMdfvsIkQ==
Date: Tue, 29 Apr 2025 11:52:10 +0000
Message-ID:
 <bddde6fdccf7921e90b116edc53c6d57e1adad62.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI2PR03MB10907:EE_
x-ms-office365-filtering-correlation-id: 3d371cdf-bf66-4bab-fad0-08dd87144684
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Mfc/s7ntL55RrDxs7YuuB/7i7U5mgmJeWw/iz4hALAkHJ+thYwlC/X8zgH?=
 =?iso-8859-1?Q?bW4PKNRG31qkARv6YIdAHAAHbJAyfYQuoroMMkvP5t/N3fWu9y1HiWPU0q?=
 =?iso-8859-1?Q?GFmrUvCy+nQ6V1PHsDHGVrVB9eGj49awzIL15oWG6BIDYRfHtPvQ4I0Xzv?=
 =?iso-8859-1?Q?9SKqZ9GdOFDKQKYdP6dOxcjz7C+W6+ymAmvxAOGg+9slqvwHM+XLNtFvpn?=
 =?iso-8859-1?Q?cIzSxAHLYgNljHuVgUrkv/z7iCD74X3O7RPqXDwNXICItM4ePuz1IXQolc?=
 =?iso-8859-1?Q?QkfAOEM4diqZc0kYBfO64JScmx+5JMgbi2h9mP6uHmgCOxKwhW0yF0QwEL?=
 =?iso-8859-1?Q?0F2BX3MTBMw0q0KFvVJERpWc3aKIEWKNQKuff4OXHv5pt68oHPHJQDtiiL?=
 =?iso-8859-1?Q?mKmd+98c7d6ULuK8uIDvGLnaJT0UBQrqeVNFip2omOSq1dpl5YzW8c+LlQ?=
 =?iso-8859-1?Q?3mJyz5JA0brsVNniVt8Y1atRTMsEAXKcMq1JktjtBIddckDcgN84vfGZnr?=
 =?iso-8859-1?Q?smR9JaN98mYw8tHKpFZroWXX9inZfee/ulKaRBG+EQJ9K1utN8GEdOqwfN?=
 =?iso-8859-1?Q?Q79Hp5YzEjPp4BLAhLjqrIphq7JAmkOlRyCErSQ7CimcS5MbvSK9T2+CMY?=
 =?iso-8859-1?Q?ia9OWJOAcg7L0JOhqn0BFsmNCWzbnmbRdW+pognT+PqOcdZqGWjDm4+m5p?=
 =?iso-8859-1?Q?mS6V+8fGT1oVTyItCsvEIEwiLQA+BK/o/joaEyDkLqEBhcXSWqw//BjIgZ?=
 =?iso-8859-1?Q?NeIPXN/cPxI2N+4HapbDtd1Vp91UhdTeQDpY3jS3UggG0lSi+rp4rlvnPO?=
 =?iso-8859-1?Q?xOjZEXDU8c1/qm910MH6rPyXL8G4xWNM+dXt7bIyddra6rr1l1d792wJ+3?=
 =?iso-8859-1?Q?DbyDWQsL68lanN+avmU032W4iF1x1fVU9Vi+fmI/XOaru1o/ab6M2snBy3?=
 =?iso-8859-1?Q?++eW/hPaVZ/rnH6cKAGk2BMimHhrCbe3EFw/ZjlaUNzA+4WyhmiOq2pUj3?=
 =?iso-8859-1?Q?XnSI5R4yhseu8bpPXH300MCm+vs59czDLECx6EVDkxnIB5zXqKAAZnjx4p?=
 =?iso-8859-1?Q?jDiBajR3iCTYbGrJ9VoTtB+7jDK7sx+OFOvgTxKoOXva+TaK/yopy/88dB?=
 =?iso-8859-1?Q?hW49M+vlYW4n1J7fVv4fLomuu2uTsiuxDuZpsu+g3a7d6ATr5u5c3wBY6a?=
 =?iso-8859-1?Q?O4JX9OLDmXtIuZzyxXXu3fZLrPapGo31r0s0YIAfB1R+HLxl/xYTi4WJ4c?=
 =?iso-8859-1?Q?n+R1kVNVq3JBKoqzQLMS/A+fR2ZvM1Q254v52QUq48Zo29Z8T8kObNkPmQ?=
 =?iso-8859-1?Q?ZenCysbiV5BXdSmTYXRyIwYvW+QMan5X2pH3/0aDq9zWOEirP4Opi7L+9P?=
 =?iso-8859-1?Q?1+No6ppZJ2LD5roL/Sk6KC6lIc3Yb2mkNzvnJidwhVig7x6qHRAJTEQwGC?=
 =?iso-8859-1?Q?yJE0udc/wHjYr4zi6uP4HgTeoYUVI1db2cjcCCwR6rK4EeMPAcjjdl640a?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3oaxvxop5igNHiVmAbRqcKvDLupcg/nS+7NFpNVEKWngHRoPhEFMMc20AO?=
 =?iso-8859-1?Q?Ackw6KqrDrVZkkIvQvj+gGhc7qQCR+UYbtrX3T2jP1k3OEGjggRan1bMJa?=
 =?iso-8859-1?Q?MXQpMtVtYjNOFPPuxxdDEtXpuDtduck+wqA28/asVXqUv0HKeTblWzQk6s?=
 =?iso-8859-1?Q?tf4+C7HF4eeLQnOwqr71I8EODFlFay2rsmLSTOIPYCSNBBn87aGuMeYAxM?=
 =?iso-8859-1?Q?knYXoXBWXFWSH6n+Eix1p7qr/efFcRfl+XC0T01Bn129nYH1UIzcOMDuxE?=
 =?iso-8859-1?Q?SX41czFoSK2VSlCAYOtYicfinSGiItOSdqZnY8i7LysxteE33PKXMUOVST?=
 =?iso-8859-1?Q?vNSvoiiGKvGo568OoG/Ft/yLloM3B3Y4x9JriBkpNlwePJ3mOp8MEbtOOq?=
 =?iso-8859-1?Q?0z1oNvk1jSxrb1oatQhJBZQVMay7ghZaStmvtNORNS8b+76y5JHWUlivFJ?=
 =?iso-8859-1?Q?UFBoNzMpV8lhPPYVMpePonAJXKetlFzZHgacWJ7KnjhK+DLR5uctn3G+xj?=
 =?iso-8859-1?Q?fnitcSpcRtj+9mXO4J17B57QRa24xrruN4ml4/KXfoYgLlHY1g/e0VeiKs?=
 =?iso-8859-1?Q?zGcSxzM5AZa+66VHm7J1Da9T1EJp80mdPp9AKy9E2cGvNkiHd6Xt8skMvk?=
 =?iso-8859-1?Q?S1hCI4A+Li2x9FPQFc1S0NPzqo/l047U458uJvhWAgybR2PcxxL9WwYKSV?=
 =?iso-8859-1?Q?gh2KddV6DGoDqyMbEURg/5+AQnrFpS2vVNyIuFw49LbQu9/3Gb5PL4DyHf?=
 =?iso-8859-1?Q?CyTH77xkmrQqSVxBiB59K6E8V0M/bNrwy5EAyOko1rIZsHFTJNwt1KhM1S?=
 =?iso-8859-1?Q?TomNu0vHJXzqLrwL14T/8AxWtmg2ktrN2RHAhQxwxLdgWnMnb04Mgx7/Tv?=
 =?iso-8859-1?Q?oYJ4gR65bivpRsVZcOI59M/L2cO6ojrys3j5YkRxdOivHCWiuQAMOa3jqW?=
 =?iso-8859-1?Q?PQkvb3exzF9AQJAEW4u2AYEv3jadM7N3bXK3aYtks/gSHdDRasZ/uNp5UQ?=
 =?iso-8859-1?Q?9E/mGAIfdWXVkRR3G5YLlKK3ZiQZ2vDLlnXKDjlAZFPmTm4G+qy5pjkQT6?=
 =?iso-8859-1?Q?uqIKlBN4NIFBO3g1qD7oqiBGKn355NogabN5A0ylBiAID7nyRDm9Jpu8qp?=
 =?iso-8859-1?Q?W/CJ3uTfBu8eWOGc/eSiXoAhpfMzwuTfFb4pUdfiCUX5TK3M8F1YwRPjB2?=
 =?iso-8859-1?Q?T0eQSjGEL9v9szUk+SLqLEsfiOhfL5+zalpGGwvvGRcU5CznjeFzUTFT4F?=
 =?iso-8859-1?Q?oA/48ym2o8R8mjPK1OV0uPvj0tZWOtaqSg7RRX7lVsyKyv7yTGOVx2iP0O?=
 =?iso-8859-1?Q?We1fcUQJozJ4e6wAklf5UEHyZ/ymYjBEyfsrQqRXnd2I/zuMExIQgid5I5?=
 =?iso-8859-1?Q?8TadM1uuUl8PxI8Rq24aPx+PCgYLEhwzSoZaQqjmro5XdKZcF8AD2029FK?=
 =?iso-8859-1?Q?GC/tGq5v6nhgAoC8hwFh6+J+sOQH6q0x3qTMnhZ6XOi1+t3ewUPlGSesKQ?=
 =?iso-8859-1?Q?o8Y1L7WLFBNpngB4+8KWANSwiJl7sRvkEkVo6hr+EIBbADCBmTGSrgwajB?=
 =?iso-8859-1?Q?vG+ZFrU9OvW2YJrUtdNcngYQRlUY1YYXxb+9nLY8Cv1yCkRg1QsgLTAr/m?=
 =?iso-8859-1?Q?WGzu7A81LndoSo4i/t8ndAGMdQV5uogipRALtvcqTJ4deKF7AO2MPPYA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d371cdf-bf66-4bab-fad0-08dd87144684
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:10.8140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FagB5fBgoS8ZD0hczyJsI+lzhMoDQyMAYI90x9BWVGggDb9asw+77fYmysRQ9J48lGx7k/nsPziTnHxcHP0NHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch was originally picked up from [1]
v9->v10:
* no change

v8->v9:
* no change

v7->v8:
* no change

v6->v7:
* add Julien's A-b

v5->v6:
* drop unrelated change in xen/arch/arm/domain_build.c:handle_linux_pci_dom=
ain()

v4->v5:
* new patch

changes since picking up from [1]:
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_P=
CI)
  instead of removing

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5e1c1cc326..11523750ae 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -268,7 +268,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
         .d =3D d,
         .p2mt =3D p2mt,
         .skip_mapping =3D !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) =3D=3D DEVICE_PCI_HOSTBRIDG=
E)),
         .iomem_ranges =3D iomem_ranges,
         .irq_ranges =3D irq_ranges
--=20
2.34.1

