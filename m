Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B280C260FF
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 17:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154454.1484454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEroj-0002ei-E2; Fri, 31 Oct 2025 16:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154454.1484454; Fri, 31 Oct 2025 16:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEroj-0002c5-Aa; Fri, 31 Oct 2025 16:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1154454;
 Fri, 31 Oct 2025 16:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2XW=5I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEroh-0002bz-UY
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 16:17:32 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 143da10d-b675-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 17:17:21 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB8PR03MB6188.eurprd03.prod.outlook.com (2603:10a6:10:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 16:17:17 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:17:17 +0000
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
X-Inumbo-ID: 143da10d-b675-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+QGr1ZyAxhAmlxvavuzCiac1FpCc7zemT7K1wczXSMRHUOWl075PZIekOXPTeaTOa9pIkewNO2hCzFxLA9l7FgIPFl2N2sS8sErUBOKi3jtFLQRIeERZBLzglOHOyAD++kkcqqnaiHfVuHjOfV/ZO/2YmotjU9nfPqjxdPHwQog4oOmKlEexx8/vfFnEwUXHyUG90rNS7EaJSoZJoRmSvvoJUe5La8t0wzf3YrdbvzMVToQRREtbKiK3D4g/dFqaztIpQpYhgAv8/1aZTg0bzTEUy/Ux7J4Jqv3bRPzU8yyjxsQ7xzVYXYWqzIojBDPpN/OVXXfXO0GXghzD/bxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhKT+mZs3AAz2letv5bmFLC4ktQfwIcqRQN5dWmiYHY=;
 b=Vvn1Uv4RNHRRlUhxPYj67yvxdYh+XfEYe8xscjLYQYXDE41Y4rl/zg1kcmNc53Lddsi4c7Dxd1iD0auN7Xnsz/B4n7OfSJRYPbK9ycsNI1LY0YnbM6uEYSqdzSOrVVjB1yA2tI8koOOJRS88Ic11zm+oNRt/Iqh5YtDqKhIKWzjy5sCKOyctBOU7hgrhw0psvnVfQsDpVtUAequfDyt7hF3YM+dYHl4x5E0AjYSOXYTEXqZfAAU5f2lKauVcCv6O4F4PW9HCooqTGAe+gVq7qPBllhpe7niAoppzbA6F1dykHAnLlcH91p06NhvJJ8AY2FoJLbNT31NPbqpN9TsMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhKT+mZs3AAz2letv5bmFLC4ktQfwIcqRQN5dWmiYHY=;
 b=R8pPwYMM3FbgIl0ugkcxoe9aY2PwGYPg4gjLQFkb31XTnCB3erEfvCaLgtW8YTMyISEn6dNacMPQamA+gzRxAdz7g3R2/1egbIe6COYQ8PIWawgQmxq5ZBLlAboISmdFhs2PFQcvdVGK87TTl5ciJ02TscidXziUMIhpF1m+nQv5JfNA1y3moQX0aVYvyi982/aypXEUq3VO8NC1PrIBT8dF/nrF3e5pTgGd0dQWs34XLwgbtq1+6ZItsvX2PDYPOJu89NtqumEuTuUVMDX/PMT90p+2j5u5uJKr6BuwowvGpFRrmLYUnuYqeb0O+hSUIeZuqtjFx3ojY1KzltzzZw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH v7] x86: make Viridian support optional
Thread-Topic: [XEN][PATCH v7] x86: make Viridian support optional
Thread-Index: AQHcSoHT/Gqh33APC0u51pW4R1+spA==
Date: Fri, 31 Oct 2025 16:17:17 +0000
Message-ID: <20251031161716.1222956-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DB8PR03MB6188:EE_
x-ms-office365-filtering-correlation-id: 1f9fc50c-fb70-430c-a7d3-08de1898f5d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LtnkyqE+XeU7WZBW33fch3aNeo5yXs6rhoy1z5m1ZbVM4FaWj3MsQ0RZzs?=
 =?iso-8859-1?Q?d1JYaEAm4d1k8UHcUia7+EOQJak/Frvi34MEVaPX1ApEekI1/84QeY4oOB?=
 =?iso-8859-1?Q?Q54YioHAOnD/5ABZioCGirDJvjY04oQqkCMzNYCeaGUBdaLV1RCj4lC/ke?=
 =?iso-8859-1?Q?stuRHSpSIq1B3T/EVYqR5CkBwBMYZrUWmW6tnWBlZc0buLfeDEUiJOR+xC?=
 =?iso-8859-1?Q?3ZIcL9vOyM1Ih7ppGlt/exHxRPRpC0r0nTuI15ZXc5bIXtq5Oum45V66Pj?=
 =?iso-8859-1?Q?12B1nUC7s4b8PYkqfpa7nSG1RY4X6+1a0fF186Y5fxIGCkNMniienGRbFg?=
 =?iso-8859-1?Q?eBl+D7QbSNfLxl0JV6dssVGgRaBRuzJ8t8ArEY/RRAiKazd3PubtTFJRaB?=
 =?iso-8859-1?Q?stl0+RYHFrsK+lXNd6mI/L6eRcOWY1hzlZLEyND8AinlHU0vEEK77YzgmW?=
 =?iso-8859-1?Q?ErGjH/v0zQEwP8SZviHZE7vkkC7LnCC/9twhW1PRXQlM+UmgbQhC47jH53?=
 =?iso-8859-1?Q?ICf7hIHtnQ1VjuGDqm/Bn68m18SSQxEDjEM730bGLbZxUpWtY+MFmfGktH?=
 =?iso-8859-1?Q?WvTCIb6mQxBeQsVIEgtvDdwjqJYiSVl9I15vLR7TDDehQvtntW8sgC0E6p?=
 =?iso-8859-1?Q?8RRNfX84mscP32TEaerlnIWGwD1N2x6Nj74x0Ft0TVjMBnnfRQDCg04ojE?=
 =?iso-8859-1?Q?5Q5l2BAOxt8OX/y8jjvmgX2XGlsM9xIFgrHv1Ci/LGpKsKk3tDxYAxXyYF?=
 =?iso-8859-1?Q?NVRi49yo9CamZR5nuCvNBd5LPWKkVi4uF60JVabYZ7EgbRrV3u2+SJSPWp?=
 =?iso-8859-1?Q?cufbR4ywoExfTM0Eu0h4Ava4d3plZmykeOgpYfOUfIan6ewcRxbTffNH2X?=
 =?iso-8859-1?Q?cXw1R/Ct+We8YXXdyCox+WjYgiL+xRJzCjTrHLuOW5UKIVZSrIvgab4XkL?=
 =?iso-8859-1?Q?fLlHR5SMr2ZlQE/DffQlhE1I7i9VygkMP5XCYZE2sSO+AQsTWVaBT6q9XJ?=
 =?iso-8859-1?Q?YvVGh2ZA91yrL4bi51kpljoZEoEiQlad8OXjjcb7aDLTLJCBX1E36rhaDv?=
 =?iso-8859-1?Q?eWN7BojwG/LZYwTVPdDlWbrxXQFW8bV1nqn9/C/Y3L1KV3BLZL2fi3pJ4e?=
 =?iso-8859-1?Q?cRJZfGnzE2ThI00Acm4KXgqwaEMXMX04qM3CW6aWQNbrs+MbdqYG+SgeiH?=
 =?iso-8859-1?Q?emJiBqrRXKnddRAYQbTseITiH95ciZLv+WDP9Te/O0sH+EX9tH5/VYhKII?=
 =?iso-8859-1?Q?wmUJNyiOo50X7ZXOT1QrskTAe/ndA+aEBqb5ZQX9Iur4etzlzQlCvELF/t?=
 =?iso-8859-1?Q?0p1o3vDAAqfWb4BXvaTJBrpug7mo3i9eTcn1iiOBaH3E5WJHt8Cd3uZKmb?=
 =?iso-8859-1?Q?PExZZ2eDeUgQs7GWc07jvcPBiAcmYGWvGGbFQS9NNIeSVtaMKKmN/1JbQ4?=
 =?iso-8859-1?Q?1YYXSd2hdJ9M21cVJp5aJFEOVuQ2MBnEbnavNLLCRzZztnGJKRg4lHCRgx?=
 =?iso-8859-1?Q?kxUDtjWQPCLu9ekCmhLfKQ3voLQ+xyEqjsH/pU8AzQ/Icaufxchi3Uz/2I?=
 =?iso-8859-1?Q?OsuSXKn1aWkBaAF2ZzPu+b0OAzSU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ch9UhyCuMFIoY32nUwvUlYjmIWtYQbH5iyubuEcnCIMhzXSN2G82yitWuQ?=
 =?iso-8859-1?Q?tKHMXm0N27+hCuGlpn7XIOsxj2QF7ZI0HUWi/cQ2Y2ifeyhmoMopjUM4eE?=
 =?iso-8859-1?Q?XRLD/670T1gt6yKgFxscMDmcSmA/RDmF8LgL9DEUfOW2XfG7hyHL0J0o3l?=
 =?iso-8859-1?Q?muG1XWjP4x95vFTJ/yiEjGAGYWy2kfZYwMgyRqfrBKvZtvaxnR7VydyZkA?=
 =?iso-8859-1?Q?X4VDGrw1X5n0MvBwXvRrJiLQjgNGzhrTpKjaEC4AWBzyc/4VI4ZiEFh7ka?=
 =?iso-8859-1?Q?PIPgWEIwlkPNfQGndDZ55caX9Ur9umVK8dGD5FESjrUXENI3rB53PUoVrn?=
 =?iso-8859-1?Q?3VTcQtjvQt05qOsEjdaimTAWdNriHttN+r9z2xRvUlq4FKbcQ3YEzfaSsG?=
 =?iso-8859-1?Q?m0gXMoFf8TkB/g48N5jAb5etEOudjCJ6huepSdNlqgGfzG+972C5Jbpkze?=
 =?iso-8859-1?Q?3pBpGLM3V1ZWCTQVsTVxJnOzRzrIjIYVy4mGlLsQimWo09P5skEAzqGkmX?=
 =?iso-8859-1?Q?kK3M+EdL6tPw9jCitcD7ab6Y3umxTdMJF2BhQvHwlHHDTZJN1ea4uxIf78?=
 =?iso-8859-1?Q?LKUmVQb62zo6xMqUrjSp3vZQZg2PRAopc7CSt7E5aG6EgnusebYx19Jwtq?=
 =?iso-8859-1?Q?L7uwZq8Gjrl6bDhARAY2oSqVjT3anyIACi1M44gjlyzVw6aruDQ9SwsgyF?=
 =?iso-8859-1?Q?BkBhZ7dNQs2QNNb/K75AB/MBMrj9ySEXiu7Zb8UsDVrPH4HExxF8Ib8UM4?=
 =?iso-8859-1?Q?RXy60bD3SpW5eSKjEf3QPFsonwc/pesEcyoZxKVmcKQnwp56jwN4S8ok0i?=
 =?iso-8859-1?Q?MP8Fh6mkQ0RDohbmZjTSXyMz/8Y4yMXtarY5n4kthQuUkmANNjX5j/fJqe?=
 =?iso-8859-1?Q?kbn9jDLg7vEz/nqt2QCp0SGZKYSrTHT4bAgrv5B2lEYXIeCfcjsY1B7+q5?=
 =?iso-8859-1?Q?Z/cOMXmjzlMZCfX0GbnPZ/9l21lpiRhErwLHnm3jZLsrwnPRfA8G5D/IqM?=
 =?iso-8859-1?Q?/YZgDi1jm6otXfyYJgRikrcdR7uahfNye09B7khXoeHOYqKvyvWFy6FaWf?=
 =?iso-8859-1?Q?AHDDj7bk0SAO4vL9MH2Uqb1uOF9hQA9QY4r8wB4BQalnHj1lLR6XCr5uVm?=
 =?iso-8859-1?Q?ZzDrJ54BYOEzVkVaMqrcFb3bKXTDljaD5l2VVzo/NCfsZVIKIBXD86Plf7?=
 =?iso-8859-1?Q?sdcTMSXNGuss0wXbZRYcM4EpmND65Ze8kvxLMPdSAE0m7782HQbNUqkU8b?=
 =?iso-8859-1?Q?MFihZ9Syx4uIEcOscydsMAXMYu3o+F7ust35kgjFqP7eEgJLtWVRNd2C2N?=
 =?iso-8859-1?Q?2woetT3FB5NSir6MtgnDeKJwOG1sSs0Q5nnpFR+gvfm9Df/n1jy57BImGo?=
 =?iso-8859-1?Q?Q1eszxTHgGg9SEL1oiXfK3YhsbHxgK4zP2kLPAnZDhpnVN2HA+J0ayCrfD?=
 =?iso-8859-1?Q?/A/g1Dc6GwQmoUGQOS57xvijAXrn2vcZaHgH0rpoYxCxlVijaMw/QEAYCT?=
 =?iso-8859-1?Q?cZb3diSDW8uCKHHz3fMh3lJU93oo99j610AZSdluY963WKnce3XtWDfdyo?=
 =?iso-8859-1?Q?nEfEt55RLbhhjV4MdI4fj42PV9YKaoQ0xEjmXO3q/xfVF7OIjwvvnM9iWN?=
 =?iso-8859-1?Q?RJIjqRmYsx5fF/pEkQYYFGREUvkesoUh52HHtQGRcLpxnHhzd/VoY/vg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9fc50c-fb70-430c-a7d3-08de1898f5d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 16:17:17.1666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJSRMCY2jsDP7sap9h7Sg2bZSfgRZY8/+rsF8MocPeFrQep/fZgPB8Q+8mkZP9/JbLhJsoZAG4ZiYJI+Q0TXSlxW/VFpb8CgR2NAUkVN3aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6188

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Add config option VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

[grygorii_strashko@epam.com: fixed NULL pointer deref in
viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v7:
- s/!is_viridian_vcpu()/!IS_ENABLED(CONFIG_VIRIDIAN) checks in
  viridian_load_vcpu/domain_ctxt(), because it is not
  guaranteed that HVM_PARAM_VIRIDIAN will be loaded before
  viridian_load_vcpu_ctxt() is called (comment from Jason Andryuk)

changes in v6:
- add stubs for viridian_vcpu/domain_init/deinit()
- update Kconfig description
- make set(HVM_PARAM_VIRIDIAN) return -ENODEV
  if (!IS_ENABLED(CONFIG_VIRIDIAN) && value)

changes in v5:
- drop "depends on AMD_SVM || INTEL_VMX"
- return -EILSEQ from viridian_load_x() if !VIRIDIAN

changes in v4:
- s/HVM_VIRIDIAN/VIRIDIAN
- add "depends on AMD_SVM || INTEL_VMX"
- add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_=
load_domain_ctxt

changes in v3:
- fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
  which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridia=
n
  support optional"")

v6: https://patchwork.kernel.org/project/xen-devel/patch/20251023151807.560=
843-1-grygorii_strashko@epam.com/
v5: https://patchwork.kernel.org/project/xen-devel/patch/20250930125215.108=
7214-1-grygorii_strashko@epam.com/
v4: https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.282=
1531-1-grygorii_strashko@epam.com/
v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.221=
4104-1-grygorii_strashko@epam.com/
v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.398=
2645-1-Sergiy_Kibrik@epam.com/

 xen/arch/x86/hvm/Kconfig                | 10 ++++++++++
 xen/arch/x86/hvm/Makefile               |  2 +-
 xen/arch/x86/hvm/hvm.c                  |  5 +++--
 xen/arch/x86/hvm/viridian/viridian.c    | 14 ++++++++++----
 xen/arch/x86/hvm/vlapic.c               | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h   |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h     |  2 ++
 xen/arch/x86/include/asm/hvm/viridian.h | 15 +++++++++++++++
 9 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c323d767e77c..c1a131d1851a 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -63,6 +63,16 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config VIRIDIAN
+	bool "Hyper-V enlightenments for guests" if EXPERT
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as hypercalls, efficient
+	  timers and interrupt handling. This is to improve performance and
+	  compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..736eb3f966e9 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) +=3D svm/
 obj-$(CONFIG_INTEL_VMX) +=3D vmx/
-obj-y +=3D viridian/
+obj-$(CONFIG_VIRIDIAN) +=3D viridian/
=20
 obj-y +=3D asid.o
 obj-y +=3D dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 88ad4100001e..c09fb2ba6873 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t i=
ndex, uint64_t value)
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_VIRIDIAN:
-        if ( (value & ~HVMPV_feature_mask) ||
-             !(value & HVMPV_base_freq) )
+        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
+            rc =3D -ENODEV;
+        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_fr=
eq) )
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index f79cffcb3767..5fb148b2aa15 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1097,14 +1097,14 @@ static int cf_check viridian_save_domain_ctxt(
 {
     const struct domain *d =3D v->domain;
     const struct viridian_domain *vd =3D d->arch.hvm.viridian;
-    struct hvm_viridian_domain_context ctxt =3D {
-        .hypercall_gpa =3D vd->hypercall_gpa.raw,
-        .guest_os_id =3D vd->guest_os_id.raw,
-    };
+    struct hvm_viridian_domain_context ctxt =3D {};
=20
     if ( !is_viridian_domain(d) )
         return 0;
=20
+    ctxt.hypercall_gpa =3D vd->hypercall_gpa.raw;
+    ctxt.guest_os_id =3D vd->guest_os_id.raw,
+
     viridian_time_save_domain_ctxt(d, &ctxt);
     viridian_synic_save_domain_ctxt(d, &ctxt);
=20
@@ -1117,6 +1117,9 @@ static int cf_check viridian_load_domain_ctxt(
     struct viridian_domain *vd =3D d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
=20
+    if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
+        return -EILSEQ;
+
     if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) !=3D 0 )
         return -EINVAL;
=20
@@ -1153,6 +1156,9 @@ static int cf_check viridian_load_vcpu_ctxt(
     struct vcpu *v;
     struct hvm_viridian_vcpu_context ctxt;
=20
+    if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
+        return -EILSEQ;
+
     if ( vcpuid >=3D d->max_vcpus || (v =3D d->vcpu[vcpuid]) =3D=3D NULL )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 4121285daef8..b315e56d3f18 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -447,7 +447,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi =3D viridian_apic_assist_completed(v);
+    bool missed_eoi =3D has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
=20
  again:
@@ -463,7 +464,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
=20
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1375,7 +1376,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
=20
     isr =3D vlapic_find_highest_isr(vlapic);
@@ -1388,7 +1390,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >=3D 0 &&
          (irr & 0xf0) <=3D (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 94d19730b2c1..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -105,7 +105,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
=20
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 340d9d4d5631..ce31401a5d53 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -512,7 +512,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
=20
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_VIRIDIAN) && \
+     is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
=20
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 3cf7a71fd309..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -173,7 +173,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
     struct x86_event     inject_event;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_VCPU_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/viridian.h b/xen/arch/x86/include=
/asm/hvm/viridian.h
index 47c9d13841ac..07ea95d4ae6e 100644
--- a/xen/arch/x86/include/asm/hvm/viridian.h
+++ b/xen/arch/x86/include/asm/hvm/viridian.h
@@ -86,11 +86,26 @@ viridian_hypercall(struct cpu_user_regs *regs);
 void viridian_time_domain_freeze(const struct domain *d);
 void viridian_time_domain_thaw(const struct domain *d);
=20
+#if defined(CONFIG_VIRIDIAN)
 int viridian_vcpu_init(struct vcpu *v);
 int viridian_domain_init(struct domain *d);
=20
 void viridian_vcpu_deinit(struct vcpu *v);
 void viridian_domain_deinit(struct domain *d);
+#else
+static inline int viridian_vcpu_init(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int viridian_domain_init(struct domain *d)
+{
+    return 0;
+}
+
+static inline void viridian_vcpu_deinit(struct vcpu *v) {}
+static inline void viridian_domain_deinit(struct domain *d) {}
+#endif
=20
 void viridian_apic_assist_set(const struct vcpu *v);
 bool viridian_apic_assist_completed(const struct vcpu *v);
--=20
2.34.1

