Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E444EA2E972
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884566.1294329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR4A-0005oC-23; Mon, 10 Feb 2025 10:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884566.1294329; Mon, 10 Feb 2025 10:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR49-0005g6-M0; Mon, 10 Feb 2025 10:31:01 +0000
Received: by outflank-mailman (input) for mailman id 884566;
 Mon, 10 Feb 2025 10:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR48-0004Pl-55
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:31:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2607::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e01d3ee-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:58 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB8977.eurprd03.prod.outlook.com
 (2603:10a6:20b:5f5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 10:30:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:45 +0000
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
X-Inumbo-ID: 1e01d3ee-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAzEGYMVo+n/lgBGCaB8GGScLGEPrsKK2a1p50UWl34uVAwp49sUOKKnC6iXA7r+sABEi1wG1GdL6sU6L/Pltf5qyiHjDb1z1v4ekfUzAIWqxQtED/q9ziFmJzdXuI6+PvnHat1SzMv3XxLctLzbidbihA+jlmUdXZMW2pGx/8QM5Rx7IBv+XHJP5JteMXDmof91FCFC6+88a+RI4qjZiwv6g941G9URkVcB1i9HOvchYPaz+LJ/bDgWicu8ZCBZKu5Tf+MwvfkFng6OT54h4yPZpFrgfYl19v5POWxlVdVMZ7gNOHlJA0vOxHTS/ZJJ2gC4PWA5FHlaQOwWrhXDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60nnA6HGaGxV4w+j+k1w+tAaB6L5I+A7oLDZirmwzsw=;
 b=qr28qa7rEn0ZF+OoRMxNjrrJ+y1ES2e47c1fwTwUiq/2Iiwn2kyH5givQXjIJPvEURHNxdt5JljEnbNmqjK7ON63q4i3+AsPChyB4qtXYqmZt5k9TzH8RFY3aC/61sswcnVviWWW7jpN+LUebj5jyNvjaed9YMq7gBa9p0lgeGES8CQl08/HK3GOJadEUKupuaS3q+YQqCzxHYasOvkj8zGTIALOKzJr7PzAz5Zh2TmFQvH+cHN7S7WiJ70VPBBEBw/Y6jwIDtF47rZX5NUIoP8Wfa+lTaBbvYSzPGjDkluXcFohFqrYJrXKgizkJmA2tWM/lXvaZrfDsD8az2Ft6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60nnA6HGaGxV4w+j+k1w+tAaB6L5I+A7oLDZirmwzsw=;
 b=ARryWQVewE0fJIEMQ3NNli4ZazKWp+eb9GV0i3AY5jcmWdJA5THER6pupjaW+S/UewKutq/aVbAicScAMJgyElyO4Sx9F4iH9yib8wq2f2FoPPv0LkenKg9qJ/alyeKvb3r6lW3WOUj4lfVcqFgtTwqPpLbc1999lve3nloMKdTK0hyGwUAKkJXYITDa8CupBhbmSgl989+iVO2HlkDR7g++zyyUScdBRYZ1UGtqzqaGt8IJURqrkPukPoF7Aq4bRgInBxWFCRJe10ozDk2yj4pm53R5sJSGtia3RRBo+aTuPbyDDZiH8g6NiBnXXcm4KTIhSWCxeLPXnqXA07nSmw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v8 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHbe6bYpih0g1hVFU+mNaS3PRj2Mg==
Date: Mon, 10 Feb 2025 10:30:45 +0000
Message-ID:
 <df3360d212b093852e07afbc80a72c4f37ba8ab3.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB8977:EE_
x-ms-office365-filtering-correlation-id: 88f718a0-b652-43bf-4165-08dd49bdfa9d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dM6lsAe/IQXcVfZ+80dmsRgajtp2IMqp5pLN9CKQ7hoLcuOZT1w1gGErDs?=
 =?iso-8859-1?Q?ISlhKFpiBiyklQIY/BFDILdkH22WZmOiHVrtmbM5aIhsemvMIqHtRl/U9P?=
 =?iso-8859-1?Q?btvFimqsf4KtdB6oLZSfzJbPcDxwY8hQOaSnSMACOm48AKzH/f0CXSg/eX?=
 =?iso-8859-1?Q?lc6mnp1xI3F6CAOD6yLPf11v6DzktG98Orfq2P2EVYDYuv4XL1iitZXuq0?=
 =?iso-8859-1?Q?lBVme/EfPFqN8OlxoqW90DRdhYFeAHU1ZJPOfQd+kyxxGM+EBbm/zzxDuL?=
 =?iso-8859-1?Q?LJ5a6IVhvZfLEC5d9C2KN0AGeRgaXElKHGLyJ9w2bP3TBeWDAVdk5kvTto?=
 =?iso-8859-1?Q?GkAZakc7mCdHU42XNBxfgUE/Cs3DPGaJ4Y5GgPpgp0/IzVc3mjG3iZeF/a?=
 =?iso-8859-1?Q?SuUaHjMhjegIUgkDXHf6p+1lfYKwX+ahe8k+r0Ok3zhio0tVo04fG/iRKC?=
 =?iso-8859-1?Q?MnxGH8BVcy9TFHyTmjmvhb06y+sLjC4CDVnI+HUUOJavgP1dzgrnALpobO?=
 =?iso-8859-1?Q?8/Qbgc5kNKfabnLjH8YBj7N7g93QQua8C8CjfedpcQQXiQoqOaz+kvG5vZ?=
 =?iso-8859-1?Q?FX4hLD/V5KnBxsiYNS/AtdOlME6WxrMJJphwCvc1b/pSw/kpYH8a4N8YEE?=
 =?iso-8859-1?Q?w/162ak6YqDH/UWHTv0MVs0FfKNnyyfKMaCdkdnpZtmTdHeSaNdBdBlULz?=
 =?iso-8859-1?Q?O78LBtbdfZt+RnnDkRtI3u8IOcoZ36+rbU2vy0NzsQGUxgZdSsfKNv+U1F?=
 =?iso-8859-1?Q?JRITmRJeIp4HQX4RzktG3w9/ob0ZdaSYF0v7ZuZkqxz/r64puLQ+5tnaco?=
 =?iso-8859-1?Q?W7jt90f0mMH+YtGtYjrLDj91MaloZk/t+B7wB7NiHgu/7JAqH5fDuWERap?=
 =?iso-8859-1?Q?2O0JlCXe3ZeDTHNwbnz292AXocD6sUXWM71fhWGNzI8VRk5jPXTBelxj0S?=
 =?iso-8859-1?Q?eb4wOxGdiexrHkXTZFnkOZP9HYdZOYB41yS02gxlers6eLgGwHzey17ROv?=
 =?iso-8859-1?Q?acvMMlp7iwYIhvyX+KQiw2ij+/6yNawIKgt/GsLyFYO872+lVhLz9ZQslV?=
 =?iso-8859-1?Q?c1E0dxoMlc/cx6E/rzikI2hNAjmPQOvdGaLpWt/mHuYkhnoPXeQF/Ioqg2?=
 =?iso-8859-1?Q?t9CPKSpVcwksjWMz1wTzvx4wTarbFfATLd4N2yXPtSIF69TOFpad66V5ct?=
 =?iso-8859-1?Q?lQFcsiQ2oD0LX6bKOX/KNsyopPMQr5uEuw6/4T6GbZn8+GaZSnSMWOfm0+?=
 =?iso-8859-1?Q?yip23eEdV6igOrsY0wFQLAkmDA6QLGh1DGivYu5SIArzKqn6vo5vViDajw?=
 =?iso-8859-1?Q?YmPAgQzMk+O6OldFfPgDnjWxpTY9Y7/Sl3lWpvFzl7nJ+po3sXOD80Bc8R?=
 =?iso-8859-1?Q?US4DhVBVGRRIvPgX/fUbHIJksPiPoSvW7gz3MzYjET811CML6BWVFFPY4B?=
 =?iso-8859-1?Q?eYPgd/dNepkarjov/C/g1v7fZEGJoUsQ8oQ9SA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cQlrJlILoER6hNBB4CFcc7CY7gM0wyJ+xKhNrb643i7el2x8MTj/l786JE?=
 =?iso-8859-1?Q?xB1KEWgdmjcJR/wo5VBlaLleFykYoyLRuFlWgsZV3W9qMmj6K/+acv8CVw?=
 =?iso-8859-1?Q?WZldr16jvQrcnHyyrTc5dFBmoYyiM9rKQxb/TbWl3mhrKsDPMn41ZqQVop?=
 =?iso-8859-1?Q?KDE9d6lnwy8t29hBnmHfXdrJY8IuanzZFDAN9YAOAgTImHmWzL/rXqXeJ0?=
 =?iso-8859-1?Q?/nF0e2+b9WcaGZAZlgGk+2Ul89WDPz3vzvTlEyGp/0F+CUj3sANy7cuzmJ?=
 =?iso-8859-1?Q?qTPkTTbRJSr7cL0aoDwNbhJx8c8aN+yoqNzamK8mZiOASKmzfVanqCXQbF?=
 =?iso-8859-1?Q?QX7X47tXUiopBi9VOJ4w2NKrapFL7q0/feSQG3SOiteRbkxmoz1ExsdGPb?=
 =?iso-8859-1?Q?AqZpAjQuOrBq3DMRUqC5q27NoA1NXzzXCx38veeZ/WVGaOkyqVx3raJk3n?=
 =?iso-8859-1?Q?xwBpCgZSzIx1FPENOIETIkzWZoLmfMca5uXCT1ZAR3RyMwHxQ/GsuTk1Ii?=
 =?iso-8859-1?Q?24UvCre7PPaNbRjM0tGxSmseB3jG8Ul/emO5FIWJO5AaILE3FPfYOrma4M?=
 =?iso-8859-1?Q?8hT6Ie+nxFHCcTWSWGZi7FMgIaiCXTG9jmKOrNCMiNAaiyaD1sKkM2zmvQ?=
 =?iso-8859-1?Q?EhXGg8ROMjzrW+V3t/ScY6XF9FMKMZGoIIqadf6/THuM43oEKc63pnUqQ2?=
 =?iso-8859-1?Q?dbH9BI/sYYpsU7u4ULcsl5T3yom/hKZGsMBtlf/8QP92WFjsUBUs4eyc0U?=
 =?iso-8859-1?Q?Uge+yZ+GOI98X86UA5/CcK3a6MqmT/cjd7xNOfV/uNk9U9fXKSq37+x5FT?=
 =?iso-8859-1?Q?+mqmpCmtT6M6NpMbandRgRFfr9m+EUl0VmpVc2OhczmU14PAi53IeRBfR6?=
 =?iso-8859-1?Q?e/znVo6kv5QtPzf/TJa5m3CF3z6VOZ3J7ioz+nUXYYFBRh34BbqMVrDJ4j?=
 =?iso-8859-1?Q?6/pOIMo/CyHRnZpFx8shkVSGWo+g6zHfD0U3MHP56vdXLzo9BuJR4wWOlE?=
 =?iso-8859-1?Q?+Z96g5J6/8eWKLr0jIndCbb2fSkAEOYNIIlBTUUcXgKtQuYpGhu7gq2pAJ?=
 =?iso-8859-1?Q?XWax+KQ6JNj1sj2X9PfdtbctjPc5x6WWJnCbBBipSXaXnC8dQFDwsB9g8J?=
 =?iso-8859-1?Q?zSQAziJZesj//yipcxpd6A14CDpHSQjpGB7w8L9F8S4bdbxiF+7maP9yuk?=
 =?iso-8859-1?Q?2qziYmGUT+6pIfoAi1SJ74uCo5Gxaef8imATvTuAvN59dfT0QGpY7YwgfU?=
 =?iso-8859-1?Q?4bvlcoHNMHdsssSGTQdeCbcxQZp6AQ8Z+1ZpkK0KcLkIoM06eSGqvdGPNi?=
 =?iso-8859-1?Q?Z2VmjQcqQwAnC+wiDgCSDfRt6JN5Ad1WgmsT3UW3veC70LeS+3lXA2XRGB?=
 =?iso-8859-1?Q?sSKT6TNEF3ZM4lbPMmKcrYhTlS1kqhlBU4cNqDOGEfqkSdKi8ymUZVDW68?=
 =?iso-8859-1?Q?cLSaimNpgChSxF0qDXWvI+CyYQljkG7q9OPSOfjqMUrcCsxPE5XAN5ymXw?=
 =?iso-8859-1?Q?J71F7nsV6SRdnEzfZY0ZQSuAUm6tVmL7iBwB5QtvvKIr+egj3DpvK9d4/5?=
 =?iso-8859-1?Q?/upnmaAxI+cCaQZk+hRFHwZ2u74Mk+q+tp8S1zXKJRTu4LzFJYMz7uOH8Q?=
 =?iso-8859-1?Q?0lSp8fkBACioQk8RhYgtzumUsERU5fDIbvj1i5t1j3P5h/T1chD7k6yA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f718a0-b652-43bf-4165-08dd49bdfa9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:45.7704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ga32N/RPANqKlCb7Vq3oqSdXgMm9JgPwPw6hYEc1lffvDvvu4lFDe+bFlQ89ti61iBMp5K/X7D09fODYevpRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

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
index 5610cddcba..25847d60ee 100644
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

