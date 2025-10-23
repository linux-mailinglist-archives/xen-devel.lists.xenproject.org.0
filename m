Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83407C01FAE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149263.1480939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwsx-0001XX-Rk; Thu, 23 Oct 2025 15:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149263.1480939; Thu, 23 Oct 2025 15:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwsx-0001VC-Oz; Thu, 23 Oct 2025 15:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1149263;
 Thu, 23 Oct 2025 15:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hDG=5A=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBwsw-0001V1-HE
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:05:50 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c01f3743-b021-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:05:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8116.eurprd03.prod.outlook.com (2603:10a6:102:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:05:42 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:05:42 +0000
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
X-Inumbo-ID: c01f3743-b021-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnr6GZW0N3nlTUb+Yg+BT7druvtoZYYh2dkycahnWneiPaDiV4fMo3OUnzGuaIPafAbSCxgGSWWwSDW6ln/Qh3kmrmC6NE6EDNJCBw/nhbPqMYXn1p0xR6adrKeNm+BGevvz+ktK1+o44OuAHi6TGt2VfM48Dv1W+qGOnJXY71Hjj6KV/5Ho1lZYXI/YSgVY5j9C3M7iDmLqV342q+QM+mcH7pUJyEuqD2tG9jGvgu4LJSc6pREO2X0k3Jh/LLHavz/FaxxBmKp5HRm8wmmfsPSjzD8O8vl1b30H7ubbzDcEe0egAxy+MhlbQruvcBsICqiSlPp65eizBpGC2Q1qlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiiPwJEfsr6ungBjjkhX8zH549PdnKWpiqjw1o9TYKo=;
 b=kuiVX2T0ia8CPQqRne1dUmVQMErV3D1VyeqpWsbec2ERJbUvHU8buD9gtM4vGGtMAb4Gz34fdsIwCUuCtyTfAqPTK0jQ/ALzESi2fIcfpDUMV4O7PA+Npis+F3I2eaI2vUBzIzcE7CCYx8/QiuygFgqQk5xBhUwntwz+A1fI3LRUIeG48IZUftf4DLR/Okp7c6aZOr/W3E20pRCSpL1LY9XrtlAs7OZcUzqQFnRcIpanD7wr4AcuSektbQLXK/Lf7UZJuMwH5NX8lavMUk25APLnq9vS4OLkMHm+utjdtGG3YQjK2ij807xjStAZvKjn67mzo+ZB26OFqtkWYpomyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiiPwJEfsr6ungBjjkhX8zH549PdnKWpiqjw1o9TYKo=;
 b=js1PVwZE1gIIENbx71A/zgDweUWVBhfELSiKye1xh7WQNdNPhsVJ31jevNS5kceFUhSIHOrbkJ03ZpfN68KjbhS/TAmnzg9zoNJkvJe6Ie8fi2I7I15jWjMktmbuxu7m9FpfA3hw0TQ4IEJOzfyPm5x1Av+KNJYyb1UfPr+HR/f6GD3NSGraTz4ERhLnpklWT1/kt4ns9sCiyfu6Z23mEuvN6TKYX9uUIyn57+Jrof4u3D+xvE+6U9HOAqJlCoWel6aG8GDyd08F+nhNIMUQ+RynPG2HOHRIn7fRhPU5MVMlWhBUGZ4ClcvWnYUXQzPswKWLZyBlNx21Fc25MCGqtA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH] x86/hvm: vpt: make hvm_set_guest_time() static
Thread-Topic: [XEN][PATCH] x86/hvm: vpt: make hvm_set_guest_time() static
Thread-Index: AQHcRC5/qP+fMN7O8kOa05GaXy6E0g==
Date: Thu, 23 Oct 2025 15:05:42 +0000
Message-ID: <20251023150541.556368-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8116:EE_
x-ms-office365-filtering-correlation-id: ca4b0565-14b2-4045-ceff-08de1245a281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ahOvi0zPvgKFNzV/4OsIGIA731yuDItQp68TADfQaL/8XtkgVL6J0K09i9?=
 =?iso-8859-1?Q?EcS1tkUIA5CYBVzjX9niZl3xuxpSniO0fNySjQaXTGT6pY8HXiUmqo3pl6?=
 =?iso-8859-1?Q?1kzzo+SZ2KhcktNwj30VI9mBNn5yJOB/XGlk8Onn8ILwQeqlvR8CEtI8Rn?=
 =?iso-8859-1?Q?tvWEysP7LSJWxqmEouTddUgBCFu16MwLwHZdsfWXgE1/eii9pRA0ep0iu0?=
 =?iso-8859-1?Q?wyQQcWJSiwpLRaKEpA4z8XYIR2z1fRZ3Ccxrx9Eb7F15E+YOJzzhTNtmoc?=
 =?iso-8859-1?Q?ID00nUyIVWONlncLmU3tL3qiuc68p6n16VRj/w5ittx9Uo35Edg4pSouys?=
 =?iso-8859-1?Q?TdcvyfE6ZwbPUu6ctIC66csLU0ftLwEiYPePs5pT2X0G/0l+fabp+S6kty?=
 =?iso-8859-1?Q?HHg037kdplBh3heodR2GVIE+4JljVS8ypKnvSsqaJFgTqTXz90jC7nvMO1?=
 =?iso-8859-1?Q?xtR3izWt5rzPRvJH5DjmKGk4HbZyqjONhdSUSah05zXX3gHwIKNeEUeaQl?=
 =?iso-8859-1?Q?FZYBWRUsqYfkXkw9HamVnIayABTq0660N8faOlb1gj9jafkpGKqnNzQDrI?=
 =?iso-8859-1?Q?2YzlnOtJg7DRbt44YvKsgz1gpzURZwD39FbkeG2ubc+O7RGh7rtk93FKJZ?=
 =?iso-8859-1?Q?36WygeJttShXVDdiBgvq9EJ8YlURFkpb19c1Gmd8nP5zeDPpK+GOQznS0B?=
 =?iso-8859-1?Q?upoCPMQAvQMG68qDxDjL84ASAds1Xf79HO3GVCw9WWwZfIsJoHISbHYzyg?=
 =?iso-8859-1?Q?VdbiKK+bfo1fxImw2wdYTttwxsODoMobSQr/hRpaEZd6XvrzCuvhXQdiEt?=
 =?iso-8859-1?Q?FHx6U4C1JuCwVbbaDwKVdstUqx93CEV4F/JDUDx1uHU79WW46KKekMkeYu?=
 =?iso-8859-1?Q?BJ6JBo8Tl32YMj/MQS8VjJmfb3mSzrDHxRgKoiqvdXwo0UPSfOJFOEgs54?=
 =?iso-8859-1?Q?c9Yvm/sZ/YdAeylXRbz7rAnKHuL7tC3TbNKO1/zQO+C2amktcDp6f0B7Ut?=
 =?iso-8859-1?Q?Djd29knrUL+ejkUxUkvZPmqWJLwRQPv/SSUC7tmD+cSdxaeUoZdc1ONBnh?=
 =?iso-8859-1?Q?Twlkp8zQDwMrIu0j2355B5Lx7w2WWLrZsBeitbCt4ABwTkFr/P4nHV0Pqj?=
 =?iso-8859-1?Q?pCWIUTql6sUntE6G70HVDkQwSc2JzGwgPDslwNTc0VMDwOoDpWZ/sGg4xp?=
 =?iso-8859-1?Q?1ysA0a3nuteTR3PgqS9wOurwgftTMl+0AHSZykybCOcskfV6QOwitrRlP/?=
 =?iso-8859-1?Q?7AAGcP8M4ujISrSLXlZ1V85j88cFt+CAeiQiZa9CUGsPSOhPvTruiqVrVR?=
 =?iso-8859-1?Q?pf+0YJZ3+b22dVArIZtnTRS309Ps6087AFTHbOBW6GZzyliwSt0tjtqO0A?=
 =?iso-8859-1?Q?CEG3Wh81mYPA8ispNsLj2QM1S35flUnukcb37BFlX7Ey9EAWf2SuYNmVta?=
 =?iso-8859-1?Q?CSFf4voCpVqslfiiyd3oQp4CToXK/A890ZgEzXZfFUBkRrBBwR8l6tGnRR?=
 =?iso-8859-1?Q?FF0Cs3AboJqimPR/7sF/0/q7B/kzNseaZq0ZPsfw0gncsdvCE9ljW+ckAE?=
 =?iso-8859-1?Q?OMDTWIs7H+MS99GeKlApSNN8uxgE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EwLIgV06PwHuElMTBal3tOP6G5TP9gprkTxO845UKfKeeFAIQGmkZRAoEU?=
 =?iso-8859-1?Q?rf3TlQ4KrpJD+Q4cIxSKhTWzqqFkQ56+mTx+qvoXPue5vpob6syrAsipgM?=
 =?iso-8859-1?Q?sV7gboYrFwDIwyZht+AOICQO3o2+hQZOvERqVceI8FP96fuJPgQvWdxBqW?=
 =?iso-8859-1?Q?afAAwpKoLgdGG7veK/GhgxoKNlufspAL9rkOlTJtchxWsMu1pvGkW/dKE0?=
 =?iso-8859-1?Q?uokQI3s+vDikJoFP8mXF9ZW5+1rhmEqI91/pTBK56Ojvk2BA8hanXXL1Gy?=
 =?iso-8859-1?Q?bnhKTWwckdoRsId9aRmu1LZc+HvierLI/KKd4pRznqFJAMrtMbh0aK8LKY?=
 =?iso-8859-1?Q?wStguGjcFnyzrT2Jnq0T1iFupXiZ8nzZvz1emXQp0jxtK/sltnCWLOVAcF?=
 =?iso-8859-1?Q?HYkA97+00AFMqScnLEFuU6drvPpSvK88kxwZcO6QH0emXFtqQiKBFvX0Vv?=
 =?iso-8859-1?Q?zXF/Z5TNZqLaF0vsvMsFqFi1J2a8MOQXDNXQQReBHWEsoRbvLO6U2GLZgo?=
 =?iso-8859-1?Q?wHvUNIH5qjnahTyBfFOQHgValJuNaQDsbd81r/oLLgh9wmKyPkTG1FFSAz?=
 =?iso-8859-1?Q?7Cp+uqSO8usNwr5mUlLqcsuA1k3mUDYjZVQeEt03coN20UXMN8YQYgQxv1?=
 =?iso-8859-1?Q?5LddwRgx3xLqfjLMlA7lDwUp1vn718Bhz0o9iPOmXQb43kR5FFXEIgwMls?=
 =?iso-8859-1?Q?z0zHRCpLC2flSdXEndDDmP63whKsRFEslzz6kKelN4IrgwG5TMTm/DskGU?=
 =?iso-8859-1?Q?VgFyJ0NbjxsKGJNKizKFWe246yNuEoimjaYMBPQYOyS644qGH7bV+UeML7?=
 =?iso-8859-1?Q?NKHj+aEihAP2OUeHSOA0BsMCE+WoRNoN4OLd0yGXi01lpNqycB/P3AeX+2?=
 =?iso-8859-1?Q?QixlO2C0pmOufJW8xb/0pQPB6yu2rJhXFqZWYlXhr2LK0y8QoVWeiVMxAw?=
 =?iso-8859-1?Q?EU8Ump/UBeeAv51i0t2K4ZLOnszQS2KW8LUUmOTISXyQXvEUc1j63Geovq?=
 =?iso-8859-1?Q?bHB3P8N9T6FPO4f6Q0XQdEN3VT0YnTfwpN+L2INatPmIeXgaaQdMTrxK7k?=
 =?iso-8859-1?Q?Rl153gAtAJuTxS41Cj4rbxenzydOog3n8YqxswLjYclgIB/MEzItpB0dDK?=
 =?iso-8859-1?Q?xsCg+3cZ3ewHuhwnQKhU6qY8Qp+U4JphfjMHWVRTIVGrwo5A965bSAZSzf?=
 =?iso-8859-1?Q?JXtI0X35D4fzi+tulmJbk6KzprLLHNCMIhRBCKtrT+rBvnNvNeO/3R9ovW?=
 =?iso-8859-1?Q?/T/vaYyQZe6ziQ2yepDHdMqsp8KscKOeHd7EmfMU7gS4+Vb1+5X5clLMRt?=
 =?iso-8859-1?Q?SN4nFDZJAb2iTKyM9vrtyuRch+6kD1JwM5/UAaoTKZ/SzJdLdlOzXgJyqD?=
 =?iso-8859-1?Q?B4htMVSq0l4EMpYRExjD5FwOgu7J20+HC4UHuIvlfW5sD1K5yvmoUG6Fqc?=
 =?iso-8859-1?Q?RO68wj7uE2yCtggkiuvz9dKLkXbvEokKt9Na1om6IOHyVjc9m6vG3QMH9X?=
 =?iso-8859-1?Q?UahXFs1VDJ2CkfWg5GH3H4u7inEuCXhCtfvOcL2+UzCZ/E5TtODb0I2qJp?=
 =?iso-8859-1?Q?gnQgp0m9LYt+Q5m95frMw479du0drc4MH75WW2R/kLrmYXcZOxNdZi5ux4?=
 =?iso-8859-1?Q?nGL8hJmXmBdNxLq/s7g/9AC2uBHwZk3oRljBq8VATCHM4JL8+kDmBY7w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b0565-14b2-4045-ceff-08de1245a281
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:05:42.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8CJpp3lqO2tz72jootZ5xjYkgZpjZAOk/eBToNkIPv/ABpEo/i+smgNDJVHfEMhNndRf5DmyD/Ovn3Llb6QcQW5Mr6n5EF7XsIXY+x5nT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8116

From: Grygorii Strashko <grygorii_strashko@epam.com>

The hvm_set_guest_time() is used only inside vpt.c, so make it static.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/vpt.c             | 2 +-
 xen/arch/x86/include/asm/hvm/hvm.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4d8683064479..50ed7389985a 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -48,7 +48,7 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, u=
int64_t at_tsc)
     return now + v->arch.hvm.stime_offset;
 }
=20
-void hvm_set_guest_time(struct vcpu *v, u64 guest_time)
+static void hvm_set_guest_time(struct vcpu *v, u64 guest_time)
 {
     u64 offset =3D guest_time - hvm_get_guest_time(v);
=20
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index f02183691ea6..838ad5b59eb0 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -287,7 +287,6 @@ u64 hvm_scale_tsc(const struct domain *d, u64 tsc);
 u64 hvm_get_tsc_scaling_ratio(u32 gtsc_khz);
=20
 void hvm_init_guest_time(struct domain *d);
-void hvm_set_guest_time(struct vcpu *v, u64 guest_time);
 uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, uint64_t at_tsc);
=20
 int vmsi_deliver(
--=20
2.34.1

