Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7227BFC524
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148086.1480299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKN-0007tP-IF; Wed, 22 Oct 2025 13:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148086.1480299; Wed, 22 Oct 2025 13:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKN-0007ra-EQ; Wed, 22 Oct 2025 13:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1148086;
 Wed, 22 Oct 2025 13:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKL-0007mO-EH
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:33 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e577b97c-af4e-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 15:56:28 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AS4PR03MB8460.eurprd03.prod.outlook.com
 (2603:10a6:20b:51b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 13:56:21 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:21 +0000
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
X-Inumbo-ID: e577b97c-af4e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq39xh+0o529LpXRQagL6R6WJNUkeoj8wFO9UybDk+IQhwi0/EFprmxTTbmKAyZmpedB7C0Wp2+zNn8vuOhtFQq8Ir2OgDKvnPKmH1WrGkPAjEh/rGD+ygAdY+5d90thAUdHBCLTjTpOgXBnGV22BQqTsrRXxc8TAo2EQfqu058qnlYEG3JOaT06bXke3v/ABFepGdCPajqLNM0SwjOfaPpN9JFOTu7sGdGvhQW93hmt4DTbob5n+0Dv9gU+Qflyt+WyWLT6tM1yxI4UmvInqDxJbCNtzt/3IbakNOX2jUNevdSBA076MYCChaYqP6KDBhNJMV1mGbQHuCBuPHspFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz2SKUXhyaOpFrevDBWiPXtPPwhCIt/eOQsWqUwGY/w=;
 b=mkRQDJJzWBJAgzIWZ6RSiDETO9T34vg67HUgb8StdfVQVg+vtP9GnsSLf0jqOBUBoJJ3LJ0H/tGC55j07oh2IvbSK3TMRqd16IjlK2gVql7o0H43MLUDslWA8lIy5YsDl9D+4t4ZL5km2RNIc5rPjC9gjgn3cg4lsHx091X/lnnR0nrNIKLJiKEKK/RlU2hGvMgD1R4dSf11uZTgVCqeEzxPeYyv+GwOBIpJ+4G+s3obufNxeMUvTyt2d9hwMXDbUfobq6KImUvyKOP7P+X6vqKb6JCviDZXs6K/FNvmsdIxQBxtcQQzMXwYsNJ7V1YwFP2yHvs9BLYHvj6ir8k1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz2SKUXhyaOpFrevDBWiPXtPPwhCIt/eOQsWqUwGY/w=;
 b=A2m47NCHLiG/Gwb2hKPZxv76vSRDb7m+JM86V8uALO61xqQUhzChkuLDCMgrUEi9Uxs5E7Ku6n+L1Z81doLHt6mi/b+gZbkb/rT1zmwMl7mJb0q2XNNJ7LybU+cqGAHI8NS6nQ4ICZJWBqclZlHotxJclSE71D5N5vHk2LRIKGL8mGOlHG48mNEML1s6+T0s0T4n4SlbbrMI5Pisbg3pzQePkwBYqzbQ4UNfvDqQs4Rl1Gf0K5Cr+GFedozw2Z0Xaw/snf9DgVNI7fB3nb2wSh4HJg2CL1e5Pn2Gjqnwimt6Zerm1sYBKiVcGhTYwQmFLTVxGvhcXgL6FWafG76Scw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 5/7] xen/pci: initialize BARs
Thread-Topic: [PATCH v2 5/7] xen/pci: initialize BARs
Thread-Index: AQHcQ1ukkPUeQeZ06UaWcrHqayzGmQ==
Date: Wed, 22 Oct 2025 13:56:20 +0000
Message-ID:
 <0abec6521491db737f2fa061ddc748eb70f259b3.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AS4PR03MB8460:EE_
x-ms-office365-filtering-correlation-id: 5d55bda9-377b-4eb0-c8d7-08de1172c7f2
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LzabkyO5cWiiqZQyKTEUwPY8L64t5GPJWlrcnAv1BIoyM9yi+/GTZX0ZzJ?=
 =?iso-8859-1?Q?nyBHVqRV9ZNX/pXwvCSEIL9zexvC/7huP8bXGCtt7DqIA/9x38vs8wpb6T?=
 =?iso-8859-1?Q?3gFtKaZp6pz9up4Bx8wtaz33Ptcguv9uLU1MfPIQyQmrEl+aOSMBbC/HIu?=
 =?iso-8859-1?Q?MY3O6K0/FT1CkrDv5V80vZMWdTrmP6V1IK4xq/E05d5BykhnlSy7ZgwhKX?=
 =?iso-8859-1?Q?8RejKoR+PU4s67Fm0TcdKboBLBak+YajScHgi3KMNU5++yQh7Kq4KAMVx6?=
 =?iso-8859-1?Q?WgghaMeikud064CJstE1oQgqfQgcdYt2tYU1NqeFYiOIXQMe8JYCwITn+w?=
 =?iso-8859-1?Q?3jXNZwvVmp3VqOJ83t7v3MLn2AQG0VyctM/fx8afzw/aTQ0pugGAtQ7cRV?=
 =?iso-8859-1?Q?rOEMBKmA/C0GC7kfqRiGgSyTlLwt6ztaD5EG6Cn99Vag7y+gdDf331ZPaI?=
 =?iso-8859-1?Q?2NesYlDpw1T7pqJ2bmQVaO7mjvmdxWr7hH9K4unAVm2rT7FybdxnrltSMK?=
 =?iso-8859-1?Q?Rf7jxWzfMCq84hHs+gMv9bboGccRp77AkxmPdfQ2S2g/c/G+G9Uunebqpw?=
 =?iso-8859-1?Q?KFAtFBN9ZntUgViNl+SBPfrRBDfgTURew7NX2sf/bQU6FsYQ1cFRJZrtXK?=
 =?iso-8859-1?Q?5DHgdR1c9Gtwtz0EMMrjf6GS1tDWD0/pRb9MOAW6EIgwN9CNJpvLkK4IF9?=
 =?iso-8859-1?Q?KlG0YIEpSVfLPh90/tj8YaEjoZT9XXZQj798oGGlupU2UFgHor3Z4pzLbB?=
 =?iso-8859-1?Q?hsPQYoB/X7uZSNSs/mfkHzWG5/masuBETTfiYVWjbqNgC5ylfnOgn5loP3?=
 =?iso-8859-1?Q?5l9QpPyY55lQUQN0DSMX12wQFPMnAnXSYxXP51xXfGguToa7OSuxuAMC7t?=
 =?iso-8859-1?Q?RgvOx+coczYIFJWxHePtHWnRYT1+qWV4du5zecNiLrKJIiV9irlhBvJ96X?=
 =?iso-8859-1?Q?zsSbmDPgsLGZ9cTMnfG8tJ++JhszYQI47IlIbE8JtoA/kr+EzfFBZcgPgB?=
 =?iso-8859-1?Q?BKRVizPlJhVfc/W0vlrsam2144IzE9EZAntb8JanmHwStZ9FJcDQTOyn+q?=
 =?iso-8859-1?Q?NzISsImg3eNo4dFiq4IGA9TZIU1YVgolFAp3gTMMW+ZgTOuH8kiZBmXsJe?=
 =?iso-8859-1?Q?nx68wQ+GVIruN6TYwVLd2Q2fu7nz28tpWrdLbPdHzGswobfH5vbfXNrzse?=
 =?iso-8859-1?Q?worWs2g8EYIUrajg+XckEAyhcGDDQCqwbF9O0mvyJQDEn+owUSdBcyd+sz?=
 =?iso-8859-1?Q?S4rCO+v7LaiCUbda4Qc/eqnOcD3tGsqw3vMnWwoiyr+t55kfUbKjmPKue/?=
 =?iso-8859-1?Q?28hEAjQulakT6/Z0ucu5dkZVJdNeOKPQ3zw+xx/OW8j58FDw0mHnFIsPcd?=
 =?iso-8859-1?Q?69Xd5IO2tlhQriItS//pQsSm+ObAJWxzQtgZmZovE8yG5kSnW6FrCrwbOa?=
 =?iso-8859-1?Q?GtzCUfX1bUkjzMmpMv5eoNAC03DexUFZ87yRHCNQ6WvLSxXq+3C8bzVStK?=
 =?iso-8859-1?Q?PZrjN1eK6bhCAKUVSKOThwiU2XQ5liXIqrHe3KhKpxB8rj7dKBWVFKOOhU?=
 =?iso-8859-1?Q?ZZKcY2MOcx8g+kBHr0KVQV3myXU3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aZhTFyZRffVMDnBhR4ZPtfjxsRYRAtNJkK94KedUOKX2rx+zKGkjjGLw2K?=
 =?iso-8859-1?Q?oSj8fs6JT6yxUfKPRDuZm1Zp9z1Rx0Q8nNBdYJQaC5Jnh6FKzfOnF1fHg1?=
 =?iso-8859-1?Q?yxPwqZ9mzVl8ZGf3exRWNgUMJDZz6+j4QBRLK2wdEsFTlxH2G5l3HnV0Bd?=
 =?iso-8859-1?Q?lzb/e5ipZ1kNJ6roP2zTxEq4Pt8SRydnQmOVoKC+WvHQfwrY8t2NANYCXy?=
 =?iso-8859-1?Q?qLbBkHxY0H2ypJQpFj61h/oSq0zN/WX8QCne8DA0Fx5kRxKlS0tlBWkiOG?=
 =?iso-8859-1?Q?D5gZ6VNGI5hcfHzDSR0DZpyt5kTn+kY6ysDLMKYmH1vneWtPxnS1GQzb0q?=
 =?iso-8859-1?Q?erJIAAcrwsgvifEQJ+AK7lNBg30n3+A66rjXb/OZptg3/m5c9ZrWR7WN0M?=
 =?iso-8859-1?Q?MeVJVEl2TM2kKAUic6Q4Cr9Ok/YnpxmgA0wFmOeX2LIZ0VoVOS+ktuME5r?=
 =?iso-8859-1?Q?cVHj1GWCld3oPc1a4Qa7HS/Up5oE5SaHzOGyQL58bAK03xd7eL5n+YW5q0?=
 =?iso-8859-1?Q?ZruFTZ+Vb7fhehSrKbiUmfV2wu7DjVGwHiErMqM8Jlddz8nW6HxITmr2zn?=
 =?iso-8859-1?Q?V/sZHGIJLUukCJsDh5PYMg/G5n1Ww78WjXZm74cqBVKhHSJTGZJgMw1wbw?=
 =?iso-8859-1?Q?NIOmVYfT9nYmVeYuZVxHLWSxPKnLuEAqaLm2OxLgRO3Yt5a0DEexWC5+v9?=
 =?iso-8859-1?Q?33GBF0tg7kePzZomCDiJjbMmxQ520C5ecra0Hvz2uu69moQi/gqe0GgHu4?=
 =?iso-8859-1?Q?BD73QNKuv0xFB6aU+PYEnfu5H/qT3mHS5Btr98z1KSpWE53GaKpcqE+IoM?=
 =?iso-8859-1?Q?TUwXSkXTCiAu9hMMVv9A7GGTxN0eN4iqoVMZ6ac5NVx1qJVxWFbUlOK55t?=
 =?iso-8859-1?Q?WkX/+J1WywVFhyiuzO3nGDjN8rQ3tC/MYBbkx6eQqy2UvddI19DjFM2T2g?=
 =?iso-8859-1?Q?Ms3H4sXZXwpXUx+cnLTQXAbbxxkOeBVxldOt5nzZ0Qe+1YYFyLyqIE127V?=
 =?iso-8859-1?Q?rNn0mRV/YfrLpwnGb5peYHwZRrmr2RlIdASkUhf+S7Efd9+8YPQInHlaEi?=
 =?iso-8859-1?Q?UrUdUQKM9XvSONqf6uGpZNQnDhrNMRwPBIHqMyZGWqBrN+gqeYXao0bHEL?=
 =?iso-8859-1?Q?KVAWOBsu4V4LUw3YFIkmgXothuBB8xQFjgC27LmiqnzhWYAdqLjI3BqrHj?=
 =?iso-8859-1?Q?41JnHTB5vQwrz/Ce/s4dSf5YEsT7b/DIia98UGi/ffUXKiP417FYrFvUwR?=
 =?iso-8859-1?Q?CfLHsCAl9xQu3RRGTJZVovWT0yuWWS26uyGE2cO0eoBvjVv6+z3k8xb8XN?=
 =?iso-8859-1?Q?sOzR3FVuI+GO9ss7o8aV/SWujNEtsmltKEUjwr2TiVPbyRK/kME+XeaP37?=
 =?iso-8859-1?Q?K6uabLs9KCuGL5woJhBsPVoj6s2ycVRNgOxMhvk5iH82APU/HQelVF7St6?=
 =?iso-8859-1?Q?kqnFo0q/TNbX0snCPS2tZcMJ0xLQG+FFN6rbMVa8rLBQTHWAcT0SGyvZQS?=
 =?iso-8859-1?Q?FU18kKgE4WEm3bbLiHhk1Z4I3eCuZH3fxJDIVahpeJiQaDX4retLW6pR/s?=
 =?iso-8859-1?Q?dGAYiMbbWxXe1q1k4W2Iw6VNGEvRYDswTOCeNXbe5obDmLKESTIByQJBXx?=
 =?iso-8859-1?Q?chhoStnJrtkF4ZiziY9HI1+EXcYlRweHH/s03FMwbl3bGxnFmvnBICOA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d55bda9-377b-4eb0-c8d7-08de1172c7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:20.3621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvTnXXczehpBNzTogJNnoqejM7sKPXrSk8u3+luxLSd3MT6RxpSUJbfyLPMN2L9cONPA8dtwFBTO4g7LHwEcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8460

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

A PCI device must have valid BARs in order to assign it to a domain.  On
ARM, firmware is unlikely to have initialized the BARs, so we must do
this in Xen. During setup_hwdom_pci_devices(), check if each BAR is
valid. If the BAR happens to already be valid, remove the BAR range from
a rangeset of valid PCI ranges so as to avoid overlap when reserving a
new BAR. If not valid, reserve a new BAR address from the rangeset and
write it to the device.

Avaliable ranges are read from DT during init and stored in distinct
rangesets.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* move hwdom_uses_vpci to this patch
* fixup error reporting
---
 xen/arch/arm/include/asm/pci.h     |  7 +++
 xen/arch/arm/pci/pci-host-common.c | 76 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/pci.h     | 20 ++++++++
 xen/common/rangeset.c              | 35 +++++++++++++
 xen/drivers/passthrough/pci.c      | 79 ++++++++++++++++++++++++++++++
 xen/include/xen/rangeset.h         |  6 ++-
 6 files changed, 222 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7db36e7bc3..46bdc7713b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -74,6 +74,8 @@ struct pci_host_bridge {
     struct pci_config_window *child_cfg;
     const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
+    struct rangeset *bar_ranges;
+    struct rangeset *bar_ranges_prefetch;
 };
=20
 struct pci_ops {
@@ -154,6 +156,11 @@ void pci_generic_init_bus_range_child(struct dt_device=
_node *dev,
=20
 bool arch_pci_device_physdevop(void);
=20
+uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
+                              bool is_64bit, bool prefetch);
+int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
+                          uint64_t size, bool prefetch);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 67447d8696..86467e7cf6 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -21,6 +21,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
+#include <xen/resource.h>
=20
 #include <asm/setup.h>
=20
@@ -232,6 +233,21 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
+static int add_bar_range(const struct dt_device_node *dev, uint32_t flags,
+                         uint64_t addr, uint64_t len, void *data)
+{
+    struct pci_host_bridge *bridge =3D data;
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( flags & IORESOURCE_PREFETCH )
+        return rangeset_add_range(bridge->bar_ranges_prefetch, addr,
+                                  addr + len - 1);
+    else
+        return rangeset_add_range(bridge->bar_ranges, addr, addr + len - 1=
);
+}
+
 struct pci_host_bridge *
 pci_host_common_probe(struct dt_device_node *dev,
                       const struct pci_ecam_ops *ops,
@@ -286,6 +302,14 @@ pci_host_common_probe(struct dt_device_node *dev,
     pci_add_host_bridge(bridge);
     pci_add_segment(bridge->segment);
=20
+    bridge->bar_ranges =3D rangeset_new(NULL, "BAR ranges",
+                                      RANGESETF_prettyprint_hex);
+    bridge->bar_ranges_prefetch =3D rangeset_new(NULL,
+                                               "BAR ranges (prefetchable)"=
,
+                                               RANGESETF_prettyprint_hex);
+    if ( bridge->bar_ranges && bridge->bar_ranges_prefetch )
+        dt_for_each_range(bridge->dt_node, add_bar_range, bridge);
+
     return bridge;
=20
 err_child:
@@ -476,6 +500,58 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t s=
tart, mfn_t end)
=20
     return bar_data.is_valid;
 }
+
+uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
+                              bool is_64bit, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+    uint64_t addr;
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    if ( size < PAGE_SIZE )
+        size =3D PAGE_SIZE;
+
+    if ( is_64bit && !rangeset_find_aligned_range(range, size, GB(4), &add=
r) )
+    {
+        if ( rangeset_remove_range(range, addr, addr + size - 1) )
+            printk(XENLOG_ERR "Failed to remove BAR range %lx-%lx from ran=
geset\n",
+                   addr, addr + size - 1);
+        return addr;
+    }
+    if ( !rangeset_find_aligned_range(range, size, 0, &addr) )
+    {
+        if ( !is_64bit && addr >=3D GB(4) )
+            return 0;
+        if ( rangeset_remove_range(range, addr, addr + size - 1) )
+            printk(XENLOG_ERR "Failed to remove BAR range %lx-%lx from ran=
geset\n",
+                   addr, addr + size - 1);
+        return addr;
+    }
+
+    return 0;
+}
+
+int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
+                          uint64_t size, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    return rangeset_remove_range(range, addr, addr + size - 1);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index 0b98081aea..4cc3f2e853 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -76,4 +76,24 @@ int pci_sanitize_bar_memory(struct rangeset *r);
=20
 void pci_setup(void);
=20
+/* Unlike ARM, HW domain alyways uses vpci for x86 */
+static inline bool hwdom_uses_vpci(void)
+{
+    return true;
+}
+
+static inline uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev,
+                                            uint64_t size, bool is_64bit,
+                                            bool prefetch)
+{
+    return 0;
+}
+
+static inline int pci_reserve_bar_range(const struct pci_dev *pdev,
+                                        uint64_t addr, uint64_t size,
+                                        bool prefetch)
+{
+    return 0;
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0e3b9acd35..c1c6f8610c 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -357,6 +357,41 @@ int rangeset_claim_range(struct rangeset *r, unsigned =
long size,
     return 0;
 }
=20
+int rangeset_find_aligned_range(struct rangeset *r, unsigned long size,
+                                unsigned long min, unsigned long *s)
+{
+    struct range *x;
+
+    /* Power of 2 check */
+    if ( (size & (size - 1)) !=3D 0 )
+    {
+        *s =3D 0;
+        return -EINVAL;
+    }
+
+    read_lock(&r->lock);
+
+    for ( x =3D first_range(r); x; x =3D next_range(r, x) )
+    {
+        /* Assumes size is a power of 2 */
+        unsigned long start_aligned =3D (x->s + size - 1) & ~(size - 1);
+
+        if ( x->e > start_aligned &&
+             (x->e - start_aligned) >=3D size &&
+             start_aligned >=3D min )
+        {
+            read_unlock(&r->lock);
+            *s =3D start_aligned;
+            return 0;
+        }
+    }
+
+    read_unlock(&r->lock);
+    *s =3D 0;
+
+    return -ENOSPC;
+}
+
 int rangeset_consume_ranges(struct rangeset *r,
                             int (*cb)(unsigned long s, unsigned long e,
                                       void *ctxt, unsigned long *c),
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..4f5de9a542 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1172,6 +1172,80 @@ int __init scan_pci_devices(void)
     return ret;
 }
=20
+static void __init cf_check reserve_bar_range(struct pci_dev *pdev, uint8_=
t reg,
+                                              uint64_t addr, uint64_t size=
,
+                                              bool is_64bit, bool prefetch=
)
+{
+    if ( pci_check_bar(pdev, maddr_to_mfn(addr),
+                       maddr_to_mfn(addr + size - 1)) )
+        pci_reserve_bar_range(pdev, addr, size, prefetch);
+}
+
+static void __init cf_check get_new_bar_addr(struct pci_dev *pdev, uint8_t=
 reg,
+                                             uint64_t addr, uint64_t size,
+                                             bool is_64bit, bool prefetch)
+{
+    if ( !pci_check_bar(pdev, maddr_to_mfn(addr),
+                        maddr_to_mfn(addr + size - 1)) )
+    {
+        uint16_t cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+
+        addr =3D pci_get_new_bar_addr(pdev, size, is_64bit, prefetch);
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND,
+                         cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO));
+
+        pci_conf_write32(pdev->sbdf, reg,
+                         (addr & GENMASK(31, 0)) |
+                         (is_64bit ? PCI_BASE_ADDRESS_MEM_TYPE_64 : 0));
+
+        if ( is_64bit )
+            pci_conf_write32(pdev->sbdf, reg + 4, addr >> 32);
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    }
+}
+
+static int __init cf_check bars_iterate(struct pci_seg *pseg, void *arg)
+{
+    struct pci_dev *pdev;
+    unsigned int i, ret, num_bars =3D PCI_HEADER_NORMAL_NR_BARS;
+    uint64_t addr, size;
+    void (*cb)(struct pci_dev *, uint8_t, uint64_t, uint64_t, bool, bool) =
=3D arg;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        if ( (pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f) =3D=3D
+             PCI_HEADER_TYPE_NORMAL )
+        {
+            for ( i =3D 0; i < num_bars; i +=3D ret )
+            {
+                uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
+                bool prefetch;
+
+                if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_=
SPACE)
+                     =3D=3D PCI_BASE_ADDRESS_SPACE_IO )
+                {
+                    ret =3D 1;
+                    continue;
+                }
+
+                ret =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                                      (i =3D=3D num_bars - 1) ? PCI_BAR_LA=
ST : 0);
+
+                if ( !size )
+                    continue;
+                prefetch =3D !!(pci_conf_read32(pdev->sbdf, reg) &
+                              PCI_BASE_ADDRESS_MEM_PREFETCH);
+
+                cb(pdev, reg, addr, size, ret =3D=3D 2, prefetch);
+            }
+        }
+    }
+
+    return 0;
+}
+
 struct setup_hwdom {
     struct domain *d;
     int (*handler)(uint8_t devfn, struct pci_dev *pdev);
@@ -1263,6 +1337,11 @@ void __hwdom_init setup_hwdom_pci_devices(
     struct setup_hwdom ctxt =3D { .d =3D d, .handler =3D handler };
=20
     pcidevs_lock();
+    if ( hwdom_uses_vpci() )
+    {
+        pci_segments_iterate(bars_iterate, reserve_bar_range);
+        pci_segments_iterate(bars_iterate, get_new_bar_addr);
+    }
     pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
     pcidevs_unlock();
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf..e71e810f82 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,11 +56,15 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
=20
-/* Add/claim/remove/query/purge a numeric range. */
+/* Add/claim/find/remove/query/purge a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long si=
ze,
                                       unsigned long *s);
+int __must_check rangeset_find_aligned_range(struct rangeset *r,
+                                             unsigned long size,
+                                             unsigned long min,
+                                             unsigned long *s);
 int __must_check rangeset_remove_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 bool __must_check rangeset_contains_range(
--=20
2.34.1

