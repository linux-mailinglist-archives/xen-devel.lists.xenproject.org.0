Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8AB1C3C9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071505.1434955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-0000HI-Vs; Wed, 06 Aug 2025 09:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071505.1434955; Wed, 06 Aug 2025 09:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-0000Bh-Qd; Wed, 06 Aug 2025 09:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1071505;
 Wed, 06 Aug 2025 09:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujamJ-0008SJ-D3
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:49:47 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af7dc29b-72aa-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 11:49:46 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU4PR03MB10887.eurprd03.prod.outlook.com (2603:10a6:10:592::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:49:43 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:49:43 +0000
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
X-Inumbo-ID: af7dc29b-72aa-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UB3py3/6pYteWacxEyPqfEeAzvX9+wMAJ84x2yHofa331tpRfmaP6Ji9ZwruLAwnjGLPnkO9R9oI9LJiBAjPACAuK6IT+swqWwFZjPOzLut0AqSIIBK5nKvu4hhWqwme9TVdk0Lh5QQdeZILkvMW6F0F6rmqBL9AxSBkXQB8bCDG1mTG1WYQRGsB8RMFflvTjJO70Btj4cgJlZYq2TpwUMYMBdSWws0FZ43Hb7FDTAu/ACwEKE4Nd5IDjphDv4X3VjYB83UAYlNyYDyA4rSCaHzozQ4iG4RgfCeUt7fIaBFeBoTSLMJBMMI11GGJTvh35ers3nBQVhKGJ/wReExiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maCQNRAr+aVhMoLtetRBiAFVXGNI9y893mojMXhQf/s=;
 b=EnMHtPBU43wZ0ERUwkYHK0cmSrgNemZ8NfvmzNyBfCU68fXyTu6jGRfDsUcocqswfc4eLQVn7dM/Yjb1Z9eJpaaMHNrlWYvtJriBr6NpcXjp1woXXvCRHLG/zGJwZm3QA/rnBTRLIF+ZHVhu4PY4MTTj2oW3Cu7eSoPyHKI9A9rU4ab3TElY5prpq6kEkAqlZyx1bGqOX84Lhb6hd2IR9sJYYLyZB266lRDRV8J2+G4lelxZ9hhVOURGm/tZOx6OlGH3SiG7mEM4Wn9lkfGgDvDyCmv/Z+ZtNg7Nw7HQ2otwR4V4KUCa5Gfhocf0O+gFGFWpMXrvplt/BrHn4UnriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maCQNRAr+aVhMoLtetRBiAFVXGNI9y893mojMXhQf/s=;
 b=G4OFy5yOHx4MbgV8McSG11hptacPeXuTvsyw8H9GELWht2mmMkNdT+SOBQtiJqVM1JZOg4ONd8IhWo392ezMnHEAspi/VHfs7h6krrOmgCUFO9u5JrNYWGH6+oAlx+kUj10y5vzdDFS0f+9pX5gY0/85EQgER+fHx++8js6Y309V2lx3XcY2//BYuvGTfceZbkwsnfglLQezvH6c0kLqDNfTCKruGncuF3eOsGXhShuHKc93BaXKPyI3A0kK/Ij2NEHIH8HRFY/qEFuTWu88CT9qBJWXt0l43A15C3GtFOjIZ8JXMxTNQVAQpDXSDoxQMgWVT+8yZuUY8XmmKr3NJQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Topic: [PATCH v2 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Index: AQHcBrdv2s0zI2oDRk+In2fNZ0HqKA==
Date: Wed, 6 Aug 2025 09:49:42 +0000
Message-ID: <20250806094929.293658-3-grygorii_strashko@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU4PR03MB10887:EE_
x-ms-office365-filtering-correlation-id: f019145d-935e-446f-2356-08ddd4ce9230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7ZV7A4pWhF0bZe8LQt+TcJcSr+Wqu+TfvKTOykh23jTIZ1lEfNn/s6BQwp?=
 =?iso-8859-1?Q?2rNvBEMOOrAfcQoSpuJJCz3gJuA8/wqnBAzQd2lCR5AuNTASkBm10XYYsj?=
 =?iso-8859-1?Q?aalW188cTwi6i2Y7LuZBRQLAL1qDAs/gka8ZRy3aszIqfVmFBlcGdYPT6e?=
 =?iso-8859-1?Q?aX4ZdX9x7E3fiUyKKg+m9cnI7Jhs0UR/0Np960niAoArSdxoKa6j8I0dgF?=
 =?iso-8859-1?Q?PKpskkDUh64VstqpgO3aL4twR9xc6i+EDUX/JDFMo7w2p0j5wCleLxQsbi?=
 =?iso-8859-1?Q?Z+Ic1qCNuM3gWBriLcnQ6D0b+SiMYUAC0eP//AZQEfsV8QKuvuCp0KLNs3?=
 =?iso-8859-1?Q?1hoFr4+yIbPdxdEWTPB3LObaDYsNWC91pvCVWHgTz25HTK2QE9vcZFNUEy?=
 =?iso-8859-1?Q?cSIyIXaCHnReNeiwbu8QnYfldKSZa8xdycwDIR3wM7Cvnhucf41RBCutZP?=
 =?iso-8859-1?Q?i+arSGAF9dMC5En2zfweT3At8heAOK3F1KJDOuMTAOyvOZFp2ybeV/b5sH?=
 =?iso-8859-1?Q?AuUJHkQSlRax/fd2EQ7QjdA7FCXZvTXd8NgfCIDK0YYd1e7V+nEMsKOPDT?=
 =?iso-8859-1?Q?p+gpUJB5XfY/fzYWOILn4fas0NTN5nUCbB30jviWc+N5dDUpCBarF6ciuX?=
 =?iso-8859-1?Q?wVTPS3K5Lau/qBt+etJZCFnM98dU+TVt2ZfqMZDEzaBTk4Y8B4QGb3VGaV?=
 =?iso-8859-1?Q?kt7rpoKzJxjVVO4awd6BDd7iqar8djdtL+V3wZtMv1km1a3L0VrI8tdRIH?=
 =?iso-8859-1?Q?0gPCksWq0czUbWbWmgSy8CIlll0ojpz/CXBurYMCmpn+oDwL8LdjzU6muH?=
 =?iso-8859-1?Q?DhNAlZvaQiGjEcFfMxD1vlC4nJJyULOZY3oZuyN3TjlBZIKnLDt2+BXZ28?=
 =?iso-8859-1?Q?l5n2craem/deEQ4V+rcMsKEfnqUG0TMGJEIWSKddVIKGX4EOD/vMWgKhy8?=
 =?iso-8859-1?Q?xJKwfjQ/Osq7ds0ClZOujFjeavzg6ajNWCKC/kFJRvplHnTS5v/QVq9aG9?=
 =?iso-8859-1?Q?H5QCPre4Q4dKYPv1X+YWAi8ehKZFlE7fe2USIPfkTr9xhXiX0n57VzT7ar?=
 =?iso-8859-1?Q?/cSMr5o91zikEFZ0Xouz3DtHEg1C1F129vl0CJqVvF+b+cJPkvw0T1f8Y3?=
 =?iso-8859-1?Q?3R+4MroEgAxminp+l7adtrxnUXrw0IpFKwwf5L7pvcmCxwVNONvlf9lhc1?=
 =?iso-8859-1?Q?a+GGZw6dfC38vSdZ1vVrYBmneh4EUfbd+x9+HOiYGasczmuxHvnB3g32Qs?=
 =?iso-8859-1?Q?GJJaEo6da77om6cwZOAs4E3ml89tYj4WTHY2DBs/fDgGsGP+MiG2jkYymO?=
 =?iso-8859-1?Q?DkQeCNIt4JNpILAtBCtO4KJL1C5umATkoDHHENwEUKkeD348pxJ1j1hj2Z?=
 =?iso-8859-1?Q?OXiSML2cGWlQbMIo2fzDDlVnyduIFCM6lyWLnBVfCYSi+/aX/Bq19mBiuL?=
 =?iso-8859-1?Q?eMQpD/aQjUw0BhvgFvEIQ3YgnRT9+4wk5Mp5j9E2thvMb3Dc7IWfBMpqwu?=
 =?iso-8859-1?Q?fyA834lQs5vY1iB0ovewBXW7T9nQvc1KKeretTXEq7qg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5krd/1M7RozE7Pg6JQE+0bcxSFXCKbGCeIBI6xkFj4PwuF7bKqXQRbPzSW?=
 =?iso-8859-1?Q?MRrGUpUsM/R7uzxQwtw7PGDN2nbs2mXr4nqNmu1AAtn8tmuOEbEL8eVROK?=
 =?iso-8859-1?Q?tZ2t8vpu8EMmB1AArNFe4PHir1Y7TuOulyjQI8y2ZHUcoMOGgwDIgC+mDR?=
 =?iso-8859-1?Q?sakff/GqOmO36pg7dUikphL7hT/U6noUkU8msCqMAMDms3q44m/69JXxF6?=
 =?iso-8859-1?Q?ZuyEYwhfz1iQDI4sRSm9ZHZZtcDOHebhAQn9F8j4K2j+032TxMch/SyBRU?=
 =?iso-8859-1?Q?mYTu2B7aHftMqB8aTaitdefzjn2z3oEHVfcpbnCF/hScj3Kp/YiwQVZRqo?=
 =?iso-8859-1?Q?M12/6gqHHnw5jn9rc6XJ31rNnKjrwJmDsk7GaFyTEaXSej6iScm0p07avq?=
 =?iso-8859-1?Q?B3zLHwlthmMDJxUCNhAGFRXpIzBQWERCbNo1+7b6X330M6OM1YZnh/kOWH?=
 =?iso-8859-1?Q?EwAAmo+pvad4ny0ktUvloypwYXbZjZYGFcBQD9B6+4ogkzuH9pf+ZE5IQ9?=
 =?iso-8859-1?Q?7G81lQgzb/QzokdCava8QfwAfAf8QdM/HEbwQqcrkZJlIQarkreQ18krnW?=
 =?iso-8859-1?Q?lA7UO93keLUm2NjuaM/8t2yelFkXlifGRIIj9KantPKbvd40hlfr+ltOHb?=
 =?iso-8859-1?Q?NLXUsmnsu6JN3COIBALPUZCKionQWFsPe5/syB6e2YQ+keT7jCUZeXBvS0?=
 =?iso-8859-1?Q?uerbYocbDN99/hJ7K2hwGcRzM+RqnNzH4+vlfB9d5cIdbkfAANjT1Rdywy?=
 =?iso-8859-1?Q?ZYnc7VhBkdSpX6En72kL0Xi9mFdUdKYCrnRpTCRkaPAKpPruQzjy/G6dXv?=
 =?iso-8859-1?Q?diTEFMu2ATkAsNvxW9eVR7QKjMEgwvjmPackdfVmQZJ0l5ULBZDQoT/pCM?=
 =?iso-8859-1?Q?YrbX4QbxFYKp987hi2mYHJj2oCeEodvoXyyMuHa8AP/HAEinA8JpW1xvZY?=
 =?iso-8859-1?Q?u/JeVlHlFqv0wjB+AD7vLf5d+mF/bSbHvE7Kp5aCUf0WXhvcxO5O/chOIp?=
 =?iso-8859-1?Q?6PUVTrxIJ3IbISr69GOcBNPmgSYvJbPUnovjY2sl0Sox1+gCeOFWHnYUbW?=
 =?iso-8859-1?Q?s0vxS+LwwO1sGnMMqBURXUx4xhTIUwVrOgNKMSclhZ+Kju6akn/sysnpn3?=
 =?iso-8859-1?Q?SjaYa61joqUl6ehS9gD8XjtyA14zuuIHCtohqHwfC6MKFkvAzt7G0flCBa?=
 =?iso-8859-1?Q?5XLHuTkr50IBpuMwzd+qYd8JbcLehPLoHEdnhKbcQpHan3oxgD5oMJi0QO?=
 =?iso-8859-1?Q?mFRyPPydJDLj631NaS33hqK4H8B3/XeDPOgourLNfc8jXH3/NBLo5PR0xe?=
 =?iso-8859-1?Q?73si2m+35+U8pSNhOcmGRaz+5Ps+LCliG0v1HLaZ8WSER2SGbZbNNEk4E0?=
 =?iso-8859-1?Q?6Kknk25qMvNplbeCIIbkq8Xl0TaSrltNdkcvxiZ0WW2rfUro39cC8aDBQs?=
 =?iso-8859-1?Q?GMxR285wYo+RO4O0FCZuWtFxVn0KMrRJvv8PouTq848fkk7R54hDJIaeoV?=
 =?iso-8859-1?Q?YeO7eiWtmlPVU4c54CVwJYrsn6vQo1hpypzyj1QVhIkr4H64DhsYfwyezV?=
 =?iso-8859-1?Q?/IiLToEe7QPxB8Aw/q7+9HM2L2zaydSXJnAoh4pQkOU8WZrwKFKh4BJD1T?=
 =?iso-8859-1?Q?/jOszp0bmt6PsNkOZQfXifE+QA9NKXVjjromFwWMLEXsCd84LZiFOqtA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f019145d-935e-446f-2356-08ddd4ce9230
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:49:42.6498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tms3Q2PwycUcYmsiQC23Gay6DWCqfl/ZjqL/hgyVrLqg2e3lrYCzWsk2zgpqpLplDuhUxguEc7Cq/Nm7XYgwNxgUs0EuOOsObr2Q+pqENCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10887

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split is_32bit/64bit_domain() macro implementations between arm64/arm32.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
v2:
- fix comments related to macro parameters evaluation issues

 xen/arch/arm/include/asm/arm32/domain.h | 20 +++++++++++++++++
 xen/arch/arm/include/asm/arm64/domain.h | 29 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  7 +++---
 3 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
 create mode 100644 xen/arch/arm/include/asm/arm64/domain.h

diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
new file mode 100644
index 000000000000..1bd0735c9194
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM32_DOMAIN_H
+#define ARM_ARM32_DOMAIN_H
+
+/* Arm32 always runs guests in AArch32 mode */
+
+#define is_32bit_domain(d) ((void)(d), 1)
+#define is_64bit_domain(d) ((void)(d), 0)
+
+#endif /* ARM_ARM32_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
new file mode 100644
index 000000000000..1a2d73950bf0
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM64_DOMAIN_H
+#define ARM_ARM64_DOMAIN_H
+
+/*
+ * Returns true if guest execution state is AArch32
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
+
+/*
+ * Returns true if guest execution state is AArch64
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
+#endif /* ARM_ARM64_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca71303..dde48178b857 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -22,11 +22,10 @@ enum domain_type {
     DOMAIN_32BIT,
     DOMAIN_64BIT,
 };
-#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
-#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
+# include <asm/arm64/domain.h>
 #else
-#define is_32bit_domain(d) (1)
-#define is_64bit_domain(d) (0)
+# include <asm/arm32/domain.h>
 #endif
=20
 /*
--=20
2.34.1

