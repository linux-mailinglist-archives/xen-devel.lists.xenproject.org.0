Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4796FB3675F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094537.1449881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ5-0008TT-1q; Tue, 26 Aug 2025 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094537.1449881; Tue, 26 Aug 2025 14:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ4-0008Li-L0; Tue, 26 Aug 2025 14:05:50 +0000
Received: by outflank-mailman (input) for mailman id 1094537;
 Tue, 26 Aug 2025 14:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ1-00072q-9y
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:47 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ffb805-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:46 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:39 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:39 +0000
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
X-Inumbo-ID: c2ffb805-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaHgdlPguRU9C87DUCb6s/8F8pdRmUNM/8Pubolo5sqW4MDPmVhKn8xZfe3bj3dBl8Ez0BNzbtyyrNlkA75g+mnH3KFi5d7jpPNBK0qBaJoJDGd+VIU5HlqdKMcf5UpiJZjFbIJ4GbEUQW/L+2nJKCmOYg8lDT77MrXiuDpgNhEGoHFa/D/5gWFIKo1IEIbcoNkM2oiwDZSo3h6cUBKkoSS3yQ/oFXPdaz+lg/l9VPPXzvRrh24nm1IqQg6X2J7gDRYKKThuUst9iZSkw1Vd4sRcykCMIaEGH/58eX5KIOMMRr8JyK+q8na7iiNx5WCqs7I22LXO4JN4QBovTpEPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX7nLebZ8PQGUT4u/FJa28mU8IREh10GNv8tOdVik58=;
 b=eT2WvuMJ8xxbdNHE9eYojf9gR52E07xxqxatc3FN6y+kCZJ7pHOsxQa7U86yTHWhwASefTHTMQBbMOADoJ9A+klCHkBl9zV6J4JAjpZn9BZ09AhYrXQKUPxy7o1XwBjFgGXr9l/nQRWG27qlghL0NvZiG0hwiFeAxRfWHK3ZMTnP2AiPAYbQ2iAuRXELxu9hxVbKuEMcASZZ3yX0lhmX/VPl/lnucxBiTpVbg2+HAlF3CYfh3a/6aEZP5oB9+leaISi1ZgyZu4vDwPh+tFqQN4ktUDi8DbNzWbKrDANoNV6zKyZqntFJmjj3TAUDRf6KkJQ+HCHI3WSHGVivRvs/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX7nLebZ8PQGUT4u/FJa28mU8IREh10GNv8tOdVik58=;
 b=j3zotHn+F+NxmC5/gHIKVG6yg1dis3uaNZIzJytHvKSFBkr41O3g783m1WvWR0+47MrGRr2xMgHSejxwVbT5JahAeLsMoBc62xTI+zkmVSExpb+TISu7MihCiei2SprGYZu/+cl9dCpWJz+eA0XY5uOaZx5cjiMFAkWVz5y5uNsl0ixSDF79rkvJ9wwhRXc6qhLkepq49zgX5hcpU+dIwvE4MxNi3J0xpnwkCWX9gJQUwf0d9nT9Jaf8AApIsMrkqRd3U02OxrEAvTCnhuGbDeLfTRL80mRRsPG6md5FYEAg90C8IVbgbAX+aSedOGVgYzukuoNLN7MC1s5GCZxO9w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 07/11] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v3 07/11] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcFpKAYFxN4fU1Wk6sdm7zcMlbgA==
Date: Tue, 26 Aug 2025 14:05:38 +0000
Message-ID:
 <20a8af6879ef06af92d3cd1e0519c406792ca088.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: c54770ce-43c7-4c5d-1055-08dde4a9a2f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lOq8zA6uCyhiLuua+tUOwXUgMvB6KavkQlT3dY7kgIrFxUyZXY9sAgcoem?=
 =?iso-8859-1?Q?wPjumgQSMZTZJFlw8efOPXv8WeS5qeiMYY7ezWkNRtNbSqdUjsj0FXvYl+?=
 =?iso-8859-1?Q?HbvxiMn3I1CanVXzxYhJuzmduZiuj3VaHaYG0b8bl7Hh+Vr4bcXb4wUKFY?=
 =?iso-8859-1?Q?63LoY9b4gvNHEIK4G8fy9gdHNbpYaQF8W8YeDbAvxcbnZNUqN9Kdl1T7Sc?=
 =?iso-8859-1?Q?9vCLYjKU/4jOSfArYea6UIYMKBTldthODZkDbvMNNMfTnuHXJ9j118AiZB?=
 =?iso-8859-1?Q?hjmyAqIfylz3TXyrf/KvNL8XvSbHiPZbEDvJKvSPRnp9jTvaJ+NfgfF25h?=
 =?iso-8859-1?Q?Vg6LdGy5Ax1UgKSlfzAHOh6iAr+4Qcj1NdrVPu9/qk8V1xzAJekNMTMzd/?=
 =?iso-8859-1?Q?0TI4Fc/YpOuGBxEcllVHrm4tHRuPKwioQ/YwXkp/P0Tkrh6EWUSCgtXA4H?=
 =?iso-8859-1?Q?J7B7CTCNW3LyHXhCDckqu5PqzhVDdrLSiuuULIz7uEcLYwhy1penqjs7SX?=
 =?iso-8859-1?Q?rDybW9IGJvFJyILXJ7J2IcRyM6cTeGzg0zeoI8m8XSogqTfszzdXzUafce?=
 =?iso-8859-1?Q?bbeyvxxtr7P+UsrGpPP70VpWVJBg8Ym1DpnaIFzMTe/Sd+DBVT3tmjgwQ0?=
 =?iso-8859-1?Q?89Sox72xYnYQWaBUNxfs+ttPhFZ5KBlBbiuiQgdVh7glIhyQVKHzI2fspC?=
 =?iso-8859-1?Q?5BVU9D2b7LtRYfN2z7cCktKPq98OwgBqGfcj3avXL3MIgCpJdOgk7C8QXJ?=
 =?iso-8859-1?Q?si4Q7d8L72gPfg9xjekNaXGYg6abtAfF738Gjf0T41c22dpp3v1GKq/AA5?=
 =?iso-8859-1?Q?Tf39/0qrAPBAHbH9lgKziZp9ZHWMEG5l6FCPtMUxqki5jbwRcvD9VJEKxU?=
 =?iso-8859-1?Q?O+Qd4Iq/C7eqLgJ/mKt/bvAW6bibq9HDDVuKy+lS/wpB5QLSPAj2G0fpMw?=
 =?iso-8859-1?Q?WJK7CgtSEVrZfS0AT9IonxdSvViluzTpd2y1Gfv3UPI1vIXlOQLMSfO146?=
 =?iso-8859-1?Q?1BhykjYLeGfxrgvB53EDjMucRUylSUrCWD2rDWeVrtp5BNduKoypuqfF2G?=
 =?iso-8859-1?Q?h96ljXqTd4CH1J3u1v7XVrnVoMvQC5tAKBw3DcFqFZZrJyHDOoV11X5i6z?=
 =?iso-8859-1?Q?QkIML5m+NwBeklshHzOWMwsQdAwT0qy64vsXB4XwdCjXgJEliKUIAhoL7S?=
 =?iso-8859-1?Q?iCSodD8bsOmRE8qvYQNVbMeO0a0QRVRZp8mmRuzHC6S0T19sFR6zBH1hVb?=
 =?iso-8859-1?Q?CcD745rSx+426NwKLT0UglXxos894JbeAJH0nbZpYDAHA9qbiCQANUBSWb?=
 =?iso-8859-1?Q?io+QlJjFWogDuyh8PtOuxhDTlZ2oyRyH8zw2ThuEcwoYO5to20rg+zcZNM?=
 =?iso-8859-1?Q?dlDzJkTauDA9lBdh5Ifgli0aB/fxL9vRxLYnItIUKRlYl/r8YrXc1J9j1h?=
 =?iso-8859-1?Q?WPhrRL2r8Q3YEpIGNQ0quK4HWIfnjg1QqU5/bIfA+uDtm1lyNTPJi9CPp1?=
 =?iso-8859-1?Q?U7275sSJpWDHk0fN4ZONcPSoe7OY5Wgu6TXsVIGJ9Sgg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Spuhy87NnXbEcKkmcQyqeuxvtYgJtht7U5o2Ls2PO6HHHFSuJIo5ipESQI?=
 =?iso-8859-1?Q?j2sDenoqG2CRcSUgkwRpxp7NJOAklmZAhT6xpmVrkOWLtaVaA+TpuAah4U?=
 =?iso-8859-1?Q?jtHld9M/PNCGePbUTv73vEpfAwuHL/MzS/zaDT4PYR3/GrRKpSx36YbroP?=
 =?iso-8859-1?Q?dwta7YUTlu77O7N4zlUbu05H+f+vn+Ud9XFU+Es3fGE0k/haMMXvUF8dIp?=
 =?iso-8859-1?Q?7Thx6VFpsy6v8MMTtXThlUEq5fRUptq+lcUQPbAe0PeI/p06McfhTx27Wd?=
 =?iso-8859-1?Q?d+0dB5WcNfksTXvyUhca6Tu0fcfI6W+dFAjrOEK8yjuNaVZXrNqkV1ZadT?=
 =?iso-8859-1?Q?4/0N72DCK09fVpKZR80rkjQ7RrSGRPMGEfJEZkgbvi2rt+QMya69WBV9Sa?=
 =?iso-8859-1?Q?O7ffaWVUUNQNFc+uZsNuEtx6YDbZNlmLCAYsQ0norktBdY1wWZQNaKMvwq?=
 =?iso-8859-1?Q?wgJw/UCh903j+pDFAb+9eF3juZIkEqwFbN9M4AW5KsGCfhIa1buFwk92t6?=
 =?iso-8859-1?Q?ILVP3KRUYCEBALgbjdevQYNfQA8Z/icb/IojcipLIXVpzQz0bjqFlMa6MX?=
 =?iso-8859-1?Q?mQMJWyA0PKXihpEkrPFMtixAfvP6GiIw89P6nHnIbAaxg28NGDCGLWWPiT?=
 =?iso-8859-1?Q?/RtTkRmLM1E3Ta+h+7TFUadYd6DRq18aogCJuRuWWvNx/Ikcyu+XfEQylZ?=
 =?iso-8859-1?Q?OFzlmaHcJirZyFsMdBmIlDtk1w7g2yEuZoymnKyKIj1dlX9IVkkqUFUs/n?=
 =?iso-8859-1?Q?IUesprvmSM66tR/45n4bJPImBylLEB2lt7Y3I819So1TuqrvUo5JTa9jG9?=
 =?iso-8859-1?Q?YCVjaGdJMnSco65X04ROYb48aIlEVfGR+Ssc+NuDjxIIEP7e++ERcXLlk1?=
 =?iso-8859-1?Q?dPGpt7u4YfI96RWEN9KKOAIj7jgvwG4kiqIQM6Hgn9jYBYAztuHA5kghlG?=
 =?iso-8859-1?Q?NHG/bYDzLV3RILIPyJDwA6aFvyDRiuoVR1yQkiq5yEbgfnYtKxQinI7GZx?=
 =?iso-8859-1?Q?uNECvXjhTUNfQ+zmvPsjwwmByloGAd0x1+GSze2rtr2N5X4QftdcbY6E90?=
 =?iso-8859-1?Q?x2c55PSmKO7Cz0M0M6+Rj1Okifti52a2aEb8xnboDkUpwRYBJWHpmnkwKq?=
 =?iso-8859-1?Q?Ein2dcCDxHgrYOKcUZfMvxwmzQSl84bizX826GxZ6XSQkYYxPf92e6B4c+?=
 =?iso-8859-1?Q?PNujNSfzbgNGm26gDj3FYG8IiwHhwv9P/zTy8bg9sDLfZhCI1teKqToZ6i?=
 =?iso-8859-1?Q?acKywDwE3XA2OylXHbd5UXzHL7lOyYbVwoZDoNdY2A3kLwFftRUDLsH9SZ?=
 =?iso-8859-1?Q?naS/giZ/ZT65nGE3SPb7TDG1KEtDSu9niKpkZOBECBc9eSSAuckLxAWmeP?=
 =?iso-8859-1?Q?5s8ta7JpX/EWVMwlRIJrQCctLRtyXvsjKGbrLRXiqYbD2coEGytMn7h9FZ?=
 =?iso-8859-1?Q?JgUVaGUHiBgdGEXvorAE+KAK8AdNGjkF4kNj04sZG8BvvNuhRFOpotrGp8?=
 =?iso-8859-1?Q?/QPO8bf5yQeX5YcxZgFLmusVt1aL+/wstqVhvkw/HD2JJXzr6RWQGEoMbG?=
 =?iso-8859-1?Q?V18uG7vpVh6wc0W2ol1m2bzI7yTGr/afHoJjBDmVekmM9lCbPbcpMJVr/1?=
 =?iso-8859-1?Q?7mqbNPOMsKktUvHi2MLmz9N1NTKKuvVcJtUUjRxiWeiO/QZp8mxLRHRtU4?=
 =?iso-8859-1?Q?7RGGd2M3zsrvEqv3XsI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54770ce-43c7-4c5d-1055-08dde4a9a2f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:38.3125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaGRStg1yi/AGaRC7np//8+zDNX0FQYGx5TEKOuA6gFMiulDtp5ygdgH23yBZWpG1iG428aPS/cDFjTlKzSNVHb0a9TqTDJb7J2jHx+ZPn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

To properly deactivate guest interrupts and allow them to be retriggered
after the initial trigger, the LR needs to be updated. The current
implementation ignores interrupts outside the range specified by the mask
0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
eSPI interrupts, this patch updates the mask to 0x13FF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard

Changes in V3:
- no changes
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index d38a3d08c7..ca403131bd 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -207,7 +207,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x13ff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

