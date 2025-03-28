Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A94A749B3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 13:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930545.1333162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gJ-0006Lv-Uc; Fri, 28 Mar 2025 12:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930545.1333162; Fri, 28 Mar 2025 12:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gJ-0006FC-RS; Fri, 28 Mar 2025 12:19:27 +0000
Received: by outflank-mailman (input) for mailman id 930545;
 Fri, 28 Mar 2025 12:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gne4=WP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ty8gI-0006CK-E7
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 12:19:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3046702-0bce-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 13:19:24 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7313.eurprd03.prod.outlook.com
 (2603:10a6:20b:273::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 12:19:18 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:19:18 +0000
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
X-Inumbo-ID: e3046702-0bce-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atEi1cSqRIq5ZG78J0b77npNYHfcmpxzltUjVX7izPHGSsuAcAl41E/7naP7QcBBwgP9GMNJ0jc8NEdY84kn5L63kf4YSYWb2ZqPa571dbY3MGOJIQjxsAuqVbMbq/piRmEkJ+YPczTWxLo8AxqHioskTzIdNHs+ec0WMFEZc1QVFPZGi9vE+reQlvt4KmtdqanwVg3zeOr9gcdEZUYHWib8wIn2AL9EnZCy47BVpKA87bPH4SN3PFZjNQ6Jv1JIGDsdM683l+erXcrdWL8sLMGqwDLAh3zp8klav/XvBF88yGldsnCweEMbMpe06uPQ5NamTpQVi/esAL7Kz960zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0upPpwIxs+JKj3yDtOMkpReSwzfOW7SVhzWJjrE9z4=;
 b=W2s0PMHZyz+7r4LCt9tQgh3QoL1S12YQUGOD57ttqrPUs26DGYMVYiDIztfsPTX7EnMiHkLJ43QUOsKGdvTEQEiDsOQGd76Vxf5x6hWQLg1WBmqpl7u7wM2vFX8kCEOsHgM+8ataFMn83JyKLRBzE7gQ6+tKnnaxGI8QvinEv5LGUMLknE8ltVr0ZBUQhsftY0KqF2nQbMeoZ/Vw5T8Udzwp8bntJlZC5TyF03voclF40nLPFnmMDbx8rurr1veu0A0O4UbOxi3KYP/hCEWGatXhyZpHPFF5+ywQiKMut7lLIDAX15vWwCaE+Yhx05CvQP/fb6T+eWnumA0nDPUOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0upPpwIxs+JKj3yDtOMkpReSwzfOW7SVhzWJjrE9z4=;
 b=G0Ap0pX6Zg0cnD7jNBmnDjztiZ561yuX/V0rH8jE7Pko4SOPoIGiURza6MNt8ZbaQ466P/HoH+933S+6Dlb/R6q9gZR4EMUUcwGN2F8Crb9R62j02UmbyVSk86tLuHKxnnvGr/VN/xzGwO2zv1scydn9MNmnvBPxSY2VPlEVBP+zsnnkAT6nzY1aWvJI/EfycgSJt+QKGX2TCqZM6+MXbjiZpYWZ4B5HJMQik4S2h8GOjMCrZfQzWnFuPRXMHWI+QOTDlLS4tM7+9AegxyJ/2IZrx3XwhTVRQc3q3q2Cpu+occUJAuYrMiNwSmVglhJr59rynfIQvSKbOh4AIwJTHQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] xen: gcov: add support for gcc 14
Thread-Topic: [PATCH v2 1/3] xen: gcov: add support for gcc 14
Thread-Index: AQHbn9ugQ0dEnnHnb0a6KEmZuR8Mhg==
Date: Fri, 28 Mar 2025 12:19:18 +0000
Message-ID: <20250328121902.2134020-2-volodymyr_babchuk@epam.com>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7313:EE_
x-ms-office365-filtering-correlation-id: e76ef8ee-0405-4921-b969-08dd6df2c378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2NPCGPsSqjSnOHLyQy0SLWvcryCFI1iot7tObBsr2aJ+Sw3V8+iNWEekAk?=
 =?iso-8859-1?Q?8O7vHr7Mrlm+3MRGtCiDLe5IolSh8MOOXwVF1Cmp8QuOdlqlWs4Gpzp3/w?=
 =?iso-8859-1?Q?kYYwOXllXoFgwwW60AaBganFje+lA7NcaFTLJbQ1LHvh+66j6rvG9zny2S?=
 =?iso-8859-1?Q?Aiz0QVLrPpygIOknLhOYrSQI38KTkWy9aHqx9xzZuXN+AphUSguLRCewJN?=
 =?iso-8859-1?Q?OMvZfwUKYBDCMM+LEG4F9tnE2sUdxeqBXsWbCl6cmKuGkLAjMdSYNmLbuz?=
 =?iso-8859-1?Q?GXfpDoYy2XfKAKwUc5+JAUwgk/ge4Q2dqw9IY60feJehdW+4zxEDSEVb3k?=
 =?iso-8859-1?Q?lP3l+9XRE6w2jbAIJqbXLv5cSekdELKFYmgpyjDbpZAlqK8GsUg7wK/fZ4?=
 =?iso-8859-1?Q?WdzS0jYkqSU7GJHet0hlWhStRpXbRB70xaR5T8cPGMEWXs1tSfBY/ddqGJ?=
 =?iso-8859-1?Q?IFfMW/qKB/Zm5676r/ocQ/shI50QYdSR91ostsaxqdXyuyfWNqiceOOi/f?=
 =?iso-8859-1?Q?55HkGb1o5WWUfLdPmUrQ5YogJKE+h1Z0SaR/THzjoZ40gV3aA724dTrAeX?=
 =?iso-8859-1?Q?QEgZkPJXg7ZCEdsV3DMY68gvnxyaHEIpSsqB8ydkwm2t6QVxshVJxn5Tl+?=
 =?iso-8859-1?Q?8ybAxL/HNVIbUtOTmhYh6b9QiZ91OWeI8cUBSxoVMFjo/cGVgVwiS1O45r?=
 =?iso-8859-1?Q?TKbdCDgEFM1K408zojokT6O3RqsONgrN8ZTRwT/xU9UwjMsPr4Nl63MqxT?=
 =?iso-8859-1?Q?vzPA0UW0ZOFop2URKtsGutwRMV+WvWM4fPASbZUBfkbNhCrM7+yL33q4N6?=
 =?iso-8859-1?Q?I0Xje6fEKyCF+iuPFyVEAWXZwAD1Q9fOslGYfLDuQdKXAZbQ4gxe48fR8y?=
 =?iso-8859-1?Q?IFU6Yoz/+NH9g2DySz0i5cuOCvzRz/AuqYi/biYsEyMFkndHd/fD6Cmktw?=
 =?iso-8859-1?Q?U2rbOjuvnJLTHr6/hPoIrxCWomaRjS7gJp4ZHLebF4U05lBPfbPKMh5Xoo?=
 =?iso-8859-1?Q?hqIXKKjNaKyAPsRiwm5SpllNKhQZoHD6h5aE60WU90KCMaTZsKYlEFlsf3?=
 =?iso-8859-1?Q?eLA69aaR00LYfBoWrpUMRsqZ56xiXbjPzJdo/X2AKZm7lkq0E18f6kM+dv?=
 =?iso-8859-1?Q?rTbIkPoglm7dAz4M8ls7osthJrsz/iqqE6eZrLE3pDcIxRmpR/RRS4zEWn?=
 =?iso-8859-1?Q?oIaJ3+8lJ7dRe+6JS5wYQ0iuxbVQ4G2ksRFnrYF/hn3Jc2ErfBM6i9lCqn?=
 =?iso-8859-1?Q?ipeoalT4PbGa5Vzy8ZENJZ2+cTUbhg24caQllewXlLdrvQ1XBD+5qrDsEl?=
 =?iso-8859-1?Q?YgoB55nCF8rletvDxQV89Xpxn6UbInjfOSAgaizaCjdvxb+/fe/Fgd+JcO?=
 =?iso-8859-1?Q?z3w6210svnaogo9n0Puy2R+5ueiJSrWVSn2zpdkdT6UcGF+JNIs+zGhxyw?=
 =?iso-8859-1?Q?J0TsciwRGNM5SvL5YEHmbahQzx6Y1HNVuYn8bm5Vfce1wan6CilE373xQh?=
 =?iso-8859-1?Q?MnMermmkyOrv1COBESWCw8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?02jkxD28GYz/0KYMIfeshjXiwq3yHgFYVKB579NzB60zPlz8IMWico4po6?=
 =?iso-8859-1?Q?SQMjUmYW7BwsFYMKjb5RKLjd66X34npNit1SeXOZZWlekU+N6VcWmlAA+o?=
 =?iso-8859-1?Q?0O8xEKtK+hFMwyvm+usC2Hc0TemwUHD9p6yU73K/1QjJWF/OZ8c4LpUTWq?=
 =?iso-8859-1?Q?eHMSTuiWN29JbPvydAGVn7K5McUEAtEjqfLqScq3XgUjVfHS2glyZJfDlN?=
 =?iso-8859-1?Q?uU7oKGZYfERtPvKbyjK1gllxBK3C3HZsA8LcHjQlC5CuTbLtKTvLbLcS1Q?=
 =?iso-8859-1?Q?La6tNGKD0LPRerBcKZiQ+pgqfA9kqd4WI4XeG0ir2Ow3uZ6y1nc8BlD+tr?=
 =?iso-8859-1?Q?2vCuzZSnhLOuFhSOL607BCaSVH96p1/pADWrWREX4W4MWAqOsZHMDLGt1Q?=
 =?iso-8859-1?Q?jehw9bjh+aOoMt09WINJf/X7VdNWxJpLvUsSGeU2xTkrZ3t9oKq8s9foZI?=
 =?iso-8859-1?Q?JqsTNhGKJxml1zur004GOta3XHTBD0vwhphkYxqc2GnTxsgFKMCp3lY9dh?=
 =?iso-8859-1?Q?0orzhhNce+ZUxiBugkxW6RTwvSrNXJ7IISLFYvraEZFtnejckmu5k4r48c?=
 =?iso-8859-1?Q?FchEIZH0J+GZXIHQYZVWBHLnk01OlGihM9G1I78ZzJDjEoX2W2GT4L+qkq?=
 =?iso-8859-1?Q?3/JhXTjw4R6nE6WSLmbEx6GLOeewwY94prvc1H9kWwRGJca6r20+JDcDdO?=
 =?iso-8859-1?Q?gILNTvThLK5CQABHjsFkCsrfTmjiVcgN04hAsLLZ08vEjvJjnjP51jW8TT?=
 =?iso-8859-1?Q?jLvy4yi498iI27iaeizquhcKLAz6PsNL/vtEIodzXS7HrfKHFXrr3kJg10?=
 =?iso-8859-1?Q?kPw+K7fX9ZdwJbu23PlCICpO31CBTkp5aqODGIT18o/CNt4HrYwPpE49MM?=
 =?iso-8859-1?Q?9rIq70RhM6fiJn43Yc2t2tt8+mh3qJ1MNnABasfZrkN+5Ix5I/7fEy80Yk?=
 =?iso-8859-1?Q?JXKCqB9Qjs2WVC/I43ZvEYUC6EbhGMk4rBFev0dRsICJbZanj6pecuCgUp?=
 =?iso-8859-1?Q?2YjG6uLqAq7JmyBheEauDjWWmkxgMQF7ZVIAhwgFd8Gbpb7YyBeQzRzMb/?=
 =?iso-8859-1?Q?k7qyBclWizgYqWOfu+hldTr9Q+MKjcsCGfw/bZlNf7A2M5B1QGUuMQ48t/?=
 =?iso-8859-1?Q?L//oaq+lEkEcE8EbB8bSKSp+hcwsFKkhS96Ukjb2kKh0s/3kkuU68q8pCE?=
 =?iso-8859-1?Q?pCaahULputQQZpIaPSNdERjsT82+uj6yn+Q/mMySteFVDJythMEy4Sg54f?=
 =?iso-8859-1?Q?nBMeCdp+wIUJGgtnYIPoc7DdBSbWvGHBPjKHigS+5cLIzIJDk/iRczXCOb?=
 =?iso-8859-1?Q?DlhW12CuQF+xu2AfzEzyyjCkRslaQDTE6O0vEVTEQ70/pbCat+tAaj4d1O?=
 =?iso-8859-1?Q?u0fKBBoSdaApWGhK6/tUIpwJcjO/qDtzMt2NahUZ7rC6Cbn6wdq98xSrGE?=
 =?iso-8859-1?Q?musAt79BWGJdJUsM0bmFXfNZDg6Wqe5slSRwGvyJ1OxWcSdKFV1S/RznX8?=
 =?iso-8859-1?Q?1GXdrGysYO45rsMqhbHQLzANLUYrWfhLatPge0K0VolTKyUjOAjJ+rMzdd?=
 =?iso-8859-1?Q?VJpDSYDzKyxpu5lp3RqVage7SWC3zb0sP7Ye35I580Dw8lA2e8+JycvSDQ?=
 =?iso-8859-1?Q?kaiET/NNiI2AanS3x9p+o//J1bv2+rQug2qRi5YnuMOnB2eBXQnAj9UQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76ef8ee-0405-4921-b969-08dd6df2c378
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:19:18.3732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnGfxI9hDuxi1NjEREQ9BHCccji9q5oGc0UJoAs9vBGl+1AtYD7jck9PRpD3c24cv4nvGuS+bTll9oB7d3N+FqFA8Jr/oKZlRWDyWMJyHSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7313

gcc 14 (with patch "Add condition coverage (MC/DC)") introduced 9th
gcov counter. Also this version can call new merge function
__gcov_merge_ior(), so we need a new stub for it.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes is v2:
 - Check for gcc 14, not gcc 14.1
---
 xen/common/coverage/gcc_4_7.c   | 4 +++-
 xen/common/coverage/gcov_base.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 1c20e35ee5..f4c1802303 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -28,8 +28,10 @@
 #define GCOV_COUNTERS 10
 #elif GCC_VERSION < 100000
 #define GCOV_COUNTERS 9
-#else
+#elif GCC_VERSION < 140000
 #define GCOV_COUNTERS 8
+#else
+#define GCOV_COUNTERS 9
 #endif
=20
 #define GCOV_TAG_FUNCTION_LENGTH        3
diff --git a/xen/common/coverage/gcov_base.c b/xen/common/coverage/gcov_bas=
e.c
index d0c6d0a3f9..742034e039 100644
--- a/xen/common/coverage/gcov_base.c
+++ b/xen/common/coverage/gcov_base.c
@@ -56,6 +56,11 @@ void __gcov_merge_delta(gcov_type *counters, unsigned in=
t n_counters)
     /* Unused. */
 }
=20
+void __gcov_merge_ior(gcov_type *counters, unsigned int n_counters)
+{
+    /* Unused. */
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.48.1

