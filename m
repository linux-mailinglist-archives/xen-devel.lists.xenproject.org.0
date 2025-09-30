Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B7BAE661
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 21:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134417.1472307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ffg-0006x4-SF; Tue, 30 Sep 2025 19:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134417.1472307; Tue, 30 Sep 2025 19:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ffg-0006ud-OA; Tue, 30 Sep 2025 19:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1134417;
 Tue, 30 Sep 2025 19:05:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7R3=4J=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v3fff-0006uV-L4
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 19:05:55 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d24f4af-9e30-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 21:05:54 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7239.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 19:05:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 19:05:51 +0000
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
X-Inumbo-ID: 7d24f4af-9e30-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdyKFbaiCe0PIlGq5XH8wlOdti9Gl2Bmb5YcLAfM3O1QVRmOMlahVU0qevf3eT/vmw4SLRiS6U36zUVLWhhZnVwAHEimtPPX5X4APVhAg51gzQC45xK7XTFjOdQYXzMQ6OwiiTt52pFlps/aHQbpxZEV8xUDlPaxKPBvXXoTPr92plMV0fywVuF63ux2UzkT7yk/g8uIGz0rDDC+F9JpChnRHqydlZ3vy5q7iu6AVqGnlgw72UjtOM7AvSoc9t2WVimghNTv79861I5o++bMC6Ari7NNWbVIA+Hrr0bsVOiXholeGSjHFcxanLDILPM3npsKQwjhvoaQn11wXcf1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkjywitQPGHlxL5NC+7pvJYzTtJ5iqsyPdqmyOf2JRI=;
 b=nD51BzQC0TrhQxJIlSY2wFa0gpmtjBJzCS0JN6C5osfJeZeHqvH7Ys9JfRLWnj5UZ0mFz639qmxa6KhMScCwct3J4fPL0LGKzUfsya0cBX/7b5TLWHzcxpnHUTldl+XaR7gLu2Mr6djihnJPl82M9l9uMFkZYRYFnSU6L81WH6PE2K6KtudWM+eHWQ1m7fvK5PCNWxHvIFRezQDPQ9q7chK4Zyler+eZDeXp3ef6oNwtmSKuIBHqeOYTQR2ymnmWNnQ25K58LxSE619ftRaFEMvxSxYNnELQgvD8RmGMYNDxarKTS3V7psEs8s0esBgwgKGmFYaemqX8JVQgjp73lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkjywitQPGHlxL5NC+7pvJYzTtJ5iqsyPdqmyOf2JRI=;
 b=Pyd5yYZUdQsq/gN6986qhAn1+fFkpl2GDhpJkFSwgsGvSoqnKskvE1gDQ4pdnd2Or7Ic2RmTKpTaFJze7YddiP/+rxQnWy5oHPrWwFSqTp/CR4PhqvYB7StmF94tGhm4YFEruLk42LEiDe7Q5EcGcYejoxiRsR8YrxgytmO3Gh2n/6Z5Fe09r04DULQWRSnXBwTKJI8MqVpJv9iZqQ++v/QQL1E4Ce/RpxhBDSwbdNRwwFb+LqLLLmEJ6NkvzlOWsV84i2DLX3Ar8JFpx+K63y+5cPpr7kVa9IhVD5wdn1A6Ebw3LCAvj4uPn3SZqHGFMyQ8tfSKifKmqVIXnmdowQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
Subject: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
Thread-Topic: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
Thread-Index: AQHcMj09noDu3viL50aVl0iuVQpwow==
Date: Tue, 30 Sep 2025 19:05:51 +0000
Message-ID: <20250930190550.1166875-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB7239:EE_
x-ms-office365-filtering-correlation-id: 8545e7b3-2dcb-4ae4-9b7b-08de00545fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RmdCp1QKrbh2UkhvT+jFW9yfqoSBgQM/2YOwvIXkT0xO6C3BnTkOF+lXjM?=
 =?iso-8859-1?Q?Mv5Ni/FuqMwydhkEUyMk/T6syITraGV8su/BlA6ltVs0InKu/ZGpiBwo1K?=
 =?iso-8859-1?Q?ry4WtgF3fkUk1TEwtDml0tL8KPRA46F4N3upVn1+ODerPWmYOaufMZgwpZ?=
 =?iso-8859-1?Q?YWlYc2UR99M5KwzDv5w0eb1ZYlLDhipIGKS7x+PzYEddIuJKFeTPb05pqu?=
 =?iso-8859-1?Q?A6eoKQoHXXSHniX6CV29dwlmfQf97eZOu+3jrmVSlcun6EFVVMbXMvlpgZ?=
 =?iso-8859-1?Q?yUJT+A9dSgJdWdBHzHRw3HDtDjC0STxT8TvEsVVkYTQficHoUdaZvTBnH8?=
 =?iso-8859-1?Q?sQGLOxTwPQ5Pfm2JAo0OPql8TEIhsnSrelFo3+aSHheswD7TRudNN1yVBc?=
 =?iso-8859-1?Q?DtMNWP+f228Jt6Q45EykpYO2TF9NVT0lHVOFA7SolKmYGtrA8i2rDxupui?=
 =?iso-8859-1?Q?c8bBTtpkboot4r3LK7MjpKSXwmRPdgmgwA2gUJ8HG97t1wq8dP+DbnLfEv?=
 =?iso-8859-1?Q?3qP64OlBHOHThnruEfhLObTixrVbce6TTiWbPegLiHjvvR8Da9OI5AWqdb?=
 =?iso-8859-1?Q?3Rw1u1LieMr2kzAU/tKWCRBDBmAEeRAuWKUe9H5P0R96gQ5ChjcAsrPkS2?=
 =?iso-8859-1?Q?z2lPk4iOnXkBtVEeCKlAktta22x9S/VKLvq9ZUFaQ1A8FJ6zWH1ajc/C/p?=
 =?iso-8859-1?Q?htjsOwp8MrlYy+tonp1kgBa+vIumlvQGwY135P+f8WWFDnedFGLKUU0H31?=
 =?iso-8859-1?Q?Pxjuu/f0TFaNlyic2GzObAq/7goBH47XLFWf3TeATO3rsM9M1jlSbfW/ZX?=
 =?iso-8859-1?Q?mECuurcfkQsXmQuUkzm+nzVxLma6YpamTpR7uRyO23ZtNfkepERjM/t2xR?=
 =?iso-8859-1?Q?K38eIE2KPCpybul5udUgmIFaedH9vQB5ZwTSUpwlO+SxuDmMWRMGivls7c?=
 =?iso-8859-1?Q?Hx0n4tq2wtMWfKoNmCXzIcz/cFN8M4b75yngGxIT1qR+OnQ6rpHHWTkrr+?=
 =?iso-8859-1?Q?MrkyXhXzWXGkEAsIo4Tsafg4JH17i35MHDV5RgE3cMxHQH5HyLEfI80z5e?=
 =?iso-8859-1?Q?Rmw2XDzIMDWriUqdLg4QcmYiCaLDTsm/mxX9kduCCOsgZiYFwWFQsH4Ja+?=
 =?iso-8859-1?Q?as2jVzSUzJnwmpQaPdksnyAZQ417wh77ob8lQzoJMGMV9m2kY9qRqQYN+u?=
 =?iso-8859-1?Q?IkpoPLeBeh51iFPhJQcwQ8hQYqw+vJolDkfAlPcmhoaRiw1rtQ5lySaG3+?=
 =?iso-8859-1?Q?op5ZWqpPegwkWq66t+wTS4J1BDtcRCTImj9FTOlGuGh/KEkOB+TTh11cuT?=
 =?iso-8859-1?Q?9oqLLJstCbCcZMrDAzYbm4e7FgVI0duVdLQYzoHZlrXr8yanF9QGeACQe1?=
 =?iso-8859-1?Q?kaaUalyTYfxBxwd2kYUKTMnCJ4WeXobEImO0POabuHGNiAu/nWGKuqe6gj?=
 =?iso-8859-1?Q?SzAGUPKYytebCqAp2h7aUUtcys2wAjgaayRh3OYz6IPhdmcLPh0VqNmUqN?=
 =?iso-8859-1?Q?8Tc7ls2GUL9MhlOMBSa1/RR2BJmRhuSV72TXY/aYgKTA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/uouuOS1Wbo5nZ6iWwgsaE4f7pAFBpyIQ4LdmNGaGSlB/GSR6NPISRGR+g?=
 =?iso-8859-1?Q?5MdWC+fvecEEjo18DCIcgrH0lZ9xHHxaxtJqf/A4h35z42p6PklHeBtRpV?=
 =?iso-8859-1?Q?9uO3DpzW+XY8oo3JlCP4OYuqdFDaJRZaCvSo9HcP/AZlf+tPkGq3hXGuDm?=
 =?iso-8859-1?Q?2JozDjU5Rrd3p9gFynW/wJ8CkqFjoj/3/Ibg0fXFm5hTO8r02BQi14Bo7s?=
 =?iso-8859-1?Q?/zcpjHWscjBwcfL1lbNt0HNFkJEMMLrAlqboJdsJRzDKxEE6eZ5bkZY1Hh?=
 =?iso-8859-1?Q?a5AaZmpIPPYFTUGNd4qhAQXxe+Gf2WzGB36wAEfuwaqZptU6ShljPek+IY?=
 =?iso-8859-1?Q?bJ5vjsat6CTcvbQXr0a+OE2kc6gTgWf3hAKXxz1aApHceZ8dE50mawv61d?=
 =?iso-8859-1?Q?H0KCgD3tjU0sVqbKXSmEXSkabYrLkXcljz94XNvFkKhn3ba+hd1cPtv597?=
 =?iso-8859-1?Q?byAdT/21ExdKaEwcZB1x+yL7sP1oY6bWrbQY0ajprSm3XayXUDkg1BVz2o?=
 =?iso-8859-1?Q?JvfOFss9TCNtPzXCcu+drHTkC6TrvL17ggWPooerl+AUgP1VI1spRGLmYa?=
 =?iso-8859-1?Q?4zGdPDPCE2HbJTdsvJ+XkVgy0CdisQ+gAvpIzMSHYindiRtXba2nqFLkCV?=
 =?iso-8859-1?Q?N88sQLb3c9+w+7/gnrQG4fwIbN0TTCU2eeHz3OyAKjn/Xx9p/yOP6no6cl?=
 =?iso-8859-1?Q?pSk+Mg9WjqoMx91uI0WNnANqJZQwHmEZ83h6E2KegWxcfEDX1NoIRONuyH?=
 =?iso-8859-1?Q?fm1NC6LPEOY3ydqy3yrc3SQ2ydKzHuNmEQTQb5qFe274KtXVy/C2xkNYap?=
 =?iso-8859-1?Q?CJW3TaTOEpXYQDqu8hCnjKmO5MHILiNCKnnqLqQPed8z8HzOa0Uxll8jcD?=
 =?iso-8859-1?Q?zJlrbvmqEqrGrNABAAsdDRZ3BTOZ5B9ibtLBYNxdTgSixvgLeEEE5hnVR1?=
 =?iso-8859-1?Q?cDyIABZ3livoIUCUvAl9GXotsE4vqm+9C+twq/kv/aokOiNw+wgV6Erv7f?=
 =?iso-8859-1?Q?6cjMHqH5JzKiHovA3qSRiaisLCaqwJwZKn/lutsXXleP+Qy0Tn0dGKLpHl?=
 =?iso-8859-1?Q?WXflm1DonlAwSMNmBDxZz2/0575F9s9gi2LsKjsDBeXkjHUjnWY+jQfADO?=
 =?iso-8859-1?Q?YJnbhmP9ATdoWb9YuVmMKBWjjr4YDJ0+3g9nYuZuTazve6+9kuLhFvPXU+?=
 =?iso-8859-1?Q?ha6DIRTKJfvp4gHAw85e6zkTe7OS6MhEhehIGM0eZy5w6yWkOyZP7iEaiE?=
 =?iso-8859-1?Q?OGyobhD1qrW+FKUI4JfhXPGIOdt+0WqA/Qvam5L07f/0KZ5dDUe4s+PZKF?=
 =?iso-8859-1?Q?Cc0iGAE3PgM5WQDPEjPmRnjNo38XhI7uFV8sXn2hFJq7V63QeeDMPDqNwK?=
 =?iso-8859-1?Q?kSKM4x/zexSX5n9iJCn5PBpHk2zjDWWhuOdJbAtLKoMZm7EJ4BQrqTOkI3?=
 =?iso-8859-1?Q?0/stpN67MXDm996mMNkVQ+awWoXGXjkJF7J2SINXRc9jhzsItZBLXBH2z4?=
 =?iso-8859-1?Q?joj88v3o2wrbGu57x8bxbGacOdi/zgeexJUo6axeMKPrkE/j8a3eNhx9fl?=
 =?iso-8859-1?Q?vVxgNkpYSfXqhouPXRO+nQlhG35LcLw6xoHdVwxoeRb+gbhSz5QBJN+P83?=
 =?iso-8859-1?Q?HNy3Z7F+jl06Xq6OLMfC3Pa7QdeF8K7JWIPn69wJolXFxbAoWdUnyAtg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8545e7b3-2dcb-4ae4-9b7b-08de00545fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 19:05:51.4605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRH3kv/RY9DGJUseVbWWt+UwzGGxEGrdcXW9fbetR+tNlzKtDS8eBITgrhnvbWXrEwgJ44KALctSg/DrWSvz94YR9ALYi8Y086D7WBUN9IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7239

From: Grygorii Strashko <grygorii_strashko@epam.com>

The LAPIC LVTx registers have two RO bits:
- all: Delivery Status (DS) bit 12
- LINT0/LINT1: Remote IRR Flag (RIR) bit 14.

The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
and the IRQ is:
- or accepted at destination and appears as pending
  (vLAPIC Interrupt Request Register (IRR))
- or get rejected immediately.

The Remote IRR Flag (RIR) behavior emulation is not implemented for
LINT0/LINT1 in Xen for now.

The current vLAPIC implementations allows guest to write to these RO bits.

The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
to implement "Write ignore" access type for RO bits by applying masks from
vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
allows writing to RO fields.

Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
fix it by fixing LVTx registers masks in vlapic_lvt_mask[].

In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
to reserved bits should cause #GP exception), but contains no statements
for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
now uses different masks (than vlapic_reg_write()) for checking LVTx
registers values for "Reserved" bit settings, which include RO bits and
do not cause #GP exception.

Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Changes in v2:
- masks fixed in vlapic_lvt_mask[]
- commit msg reworded

v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519=
568-1-grygorii_strashko@epam.com/
 xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..2ecba8163f48 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -44,15 +44,17 @@
 static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =3D
 {
      /* LVTT */
-     LVT_MASK | APIC_TIMER_MODE_MASK,
+     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
      /* LVTTHMR */
-     LVT_MASK | APIC_DM_MASK,
+     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
      /* LVTPC */
-     LVT_MASK | APIC_DM_MASK,
-     /* LVT0-1 */
-     LINT_MASK, LINT_MASK,
+     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
+     /* LVT0 */
+     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
+     /* LVT1 */
+     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
      /* LVTERR */
-     LVT_MASK
+     LVT_MASK & ~APIC_SEND_PENDING,
 };
=20
 #define vlapic_lvtt_period(vlapic)                              \
--=20
2.34.1

