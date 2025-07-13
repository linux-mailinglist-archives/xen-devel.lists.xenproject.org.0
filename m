Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A15B031B8
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jul 2025 17:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042326.1412501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uayXY-0008Mj-Vh; Sun, 13 Jul 2025 15:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042326.1412501; Sun, 13 Jul 2025 15:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uayXY-0008Km-Si; Sun, 13 Jul 2025 15:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1042326;
 Sun, 13 Jul 2025 15:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8I2=Z2=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1uayXX-0008Kg-8K
 for xen-devel@lists.xenproject.org; Sun, 13 Jul 2025 15:22:55 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on062b.outbound.protection.office365.us
 [2001:489a:2202:d::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bfbadbe-5ffd-11f0-b894-0df219b8e170;
 Sun, 13 Jul 2025 17:22:50 +0200 (CEST)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by BN2P110MB1206.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sun, 13 Jul
 2025 15:22:43 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%5]) with mapi id 15.20.8922.025; Sun, 13 Jul 2025
 15:22:43 +0000
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
X-Inumbo-ID: 3bfbadbe-5ffd-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=y3z+Lk45CE/nz1at5KSQllikukgux8ursfz/miWdPbqP3qzgX8ihe9GQT9rtAtyvTMdgwccfjujyHLeN5D1so5FOpqEQ7vUbgJlmME0J3YV+7KbLCAmNz6fTUjhdiuinj6HxDwCy6+HA/+nKc83kGgWo0XXLumPfd2cxD9KEGUtnMLVu8kpVzJhsiO+agoRyfWg44h5d6Ccf0xkRhNfCaRpextdqGYfiQnwP5ft+j7lSulEUDh43jQfNiT9MBlg9CswNVexR+pglHgjI0rei1Z8wk3q55JC0jrcFgguRyacY8J7ddBq79H7Rugi567X5zmm1833hyWBGyMLvMxLrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mlElecGK7g1+2Tw45p+uwIPUv49n2g4UoyH+Mgs2Ds=;
 b=RM+w4/psks0tN8J1k0KrikuPjns46GSLOtwIiSAPofA7fcKEzgcCBStPqDSW5Un8CPnYSRHGVj6wzbmMyM+yEzQamNdTIjjtRcj/W9YNbX+Lfj84DfibX0yivHg8/sxIfTQVyzU6DlsXgZs8/ginsmTvFWJhwZ6100D1PvEJfw4exCuJYd4kZoWfwRfewAw/ErAouLrwEsNBXYYQhxRfDyhQzcPi0gs3VHm6goRZ3wtrbCht8qVif8Ukgzv/MCCz0p0uTRsfxGqyb+4ne9DQEZrc3vulSG6OrLyTLmWKLaFul98eMlX5TVKovwgDYh7p6kwS4Dlao4xttdbYjQYZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mlElecGK7g1+2Tw45p+uwIPUv49n2g4UoyH+Mgs2Ds=;
 b=UPjf/+CkyVOi+qf4AD8VXprf9ZRp4n/8sSahkVCZ/MxTKMdpvVlUKfJNvY8cOJWC3g1yXx8XEs1GBCeBve//EYR9GZGt760nrKNeHGoYgK14r50ApIlkl9kzWtcnayDSna+PTlgNJT3Rz9VjLTCCQc4f2Bx8C2o808rF1UgocTqb3qsZNmheArgD9f+LaZY0hUR+S22r5DXotYt7fLeHJqQw3p9Ux6cpubwXiJ8cqFRy7QrdW5yuHlJ/VB8JmjtM70hPhjMOPmzxgW3qMIqJO8/RhnqWocL27T4KuADT0z17445g+PWXH9nMrdDV4wChqyN4fMbA/H2OktLAK1ClTw==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>, "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>, "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>, Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9AACLJK7AAqtXngA==
Date: Sun, 13 Jul 2025 15:22:42 +0000
Message-ID:
 <SA1P110MB1629FBC51EF4E46B99958A83F455A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|BN2P110MB1206:EE_
x-ms-office365-filtering-correlation-id: efc3b8f3-0451-4b86-71ff-08ddc2211c9f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t2FxJABzYg+hSRsrgCxO2OHNsANCkzplDLDzEdU1GMyBrqonfk0isfq6ev?=
 =?iso-8859-1?Q?Solr1rPlzhMGw8DEsct30zcXCpeTVR1/t3EhtMRtojhI3E3hudDYsL7nZ3?=
 =?iso-8859-1?Q?lgrRwaO2xuzFWKyq6/nW9wuJtOZ8qQNEMeljDZmpZrBeTNBDWzdA9BtpBZ?=
 =?iso-8859-1?Q?+gtDmfNuwy0w2ix6wlzC/kKb5k6BxsDUYMOgfKIWLc+kf76pXAy6he3MJm?=
 =?iso-8859-1?Q?94/L5wPDv+CNq6TsIsyjbn3Knbq2L00xNGFCEgUjzQosrf+OHRhJQwAVVQ?=
 =?iso-8859-1?Q?8Fv4bCVXx1u8sIt92k7guedQm4YacnT0swulsdLkh1RV71Kx1w0lh369dg?=
 =?iso-8859-1?Q?cQ5mR5IEyOTk5Tc5Ae98Kef+jQ4d82MZuMkmbaCm/8eCpu71uKp4FwgQi6?=
 =?iso-8859-1?Q?8sy3SdRMfcWSICRFxbCuhsdTciWKV9hbmoqgiGYMsB/9xJUA0oCSP/Xch/?=
 =?iso-8859-1?Q?UdVCJKpzkKHFRFkB9ImynnwccL3M163eSQTkbEjb3ziXat/nqZwytk934Y?=
 =?iso-8859-1?Q?s/3A8vSHRAVVZH0PBeuC9TLBzxYAxrgSqcRi0T9NZ0S/dUC7awhG+sQ21J?=
 =?iso-8859-1?Q?/FatpvBotn6rRmgqFK22qdAZl8C7cxuSm7hU1ZW7JncxIFTc/pD3yjAXYC?=
 =?iso-8859-1?Q?MuYIrEUagdIH+/q6DzQ0O6JVRcURELB0Yz3s5Vl+sJpdBrmUW3j99FBuJ/?=
 =?iso-8859-1?Q?8YqhLLtcMPAiwjKUtpvIBPrNodHMB1xkOIU12t3KsfpUiT9NaAaNpyq7ix?=
 =?iso-8859-1?Q?C4fM7dvIIvftLPhGMzdFBbIFB2RpOYII/tnXKFj/bYgpymMhoUNT0huwAi?=
 =?iso-8859-1?Q?PQZazjoLHx3aoA5ZiQP7bdEskPNHfJQk4i4wFC+HUL81cq247Vkp9naQgd?=
 =?iso-8859-1?Q?12M9rYA0nswlGcg6h6RTCI4sUjp7NFZ/4JCJ3NjvvzfVSRBeeN6CEzrYo/?=
 =?iso-8859-1?Q?08hts5EOr/LlP7TOXI46cvjYxaTid4q7vuy+nyG8bYs2K+6gcHZLI3yurg?=
 =?iso-8859-1?Q?5M8+WayrOfQmpVt3nwyzwbN7hBgEMGQX7cwfmIlCgOgxcQGkLyS4CrqCTN?=
 =?iso-8859-1?Q?LU4S1MEBMeh7pEtLMY6opTGZ6cef5SDfz+DqofTVNQWWh9bnzslWx67wQY?=
 =?iso-8859-1?Q?rpjAA4Qkzs2TQyASAfDopa2CYITphxTNFNfjXpbgx5UhQbeBETdlL1ZG9Y?=
 =?iso-8859-1?Q?HMxl6gd13aILShIzb7mU+TEuORipAxDsDKLXGwAp91OOmQxO1kDC67mSzb?=
 =?iso-8859-1?Q?R86rqXyS0/ehaAfVScOBh/H0h94gJpx0EGVf/TwIBJW+Ye1yBOcN2ofQhR?=
 =?iso-8859-1?Q?rYiVdHzx+h5e+FcQfANkIp/QGlU+1y3Q2vNkNt6EsSgAI/uGab54UqIyUS?=
 =?iso-8859-1?Q?7d2WNL8SqHSeK0A42N9TCQzQN4wHn1fL4TQA8D2BCvKq7LzusYns4s1e93?=
 =?iso-8859-1?Q?u5zK7tY4aFtiYH32WH8vrTKz8Sv1KSrr9JN5Tst4+GD5qhYNOiYQGBXlBw?=
 =?iso-8859-1?Q?raHtbm/7q38cjC9qdufH/TO43kRs2gIEhvzDPQOYT3HMcx6m8DUWM0F0Xe?=
 =?iso-8859-1?Q?oetGQ5s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Adee4erjtHpv2tuhOkG5E2W6x5/qaQmyj+1FBXIId9l3c9aINE+zXGuNke?=
 =?iso-8859-1?Q?GDqm4ppXHrNqViKg79Vd2MkBJyumIB1TgkZsaBBldR9eo3UauQ4vpXNanp?=
 =?iso-8859-1?Q?l9mxvxwFzP6MrqKkggy2fAVdSVAxPDOAsr8WzblM8iB+TPVbt8K++GeESV?=
 =?iso-8859-1?Q?LacTXOExoUXHHhZ+bZuqtMveWaA8NQ3bkv8P7rZ8VVTNvP0dB74rI+7DYm?=
 =?iso-8859-1?Q?yHIFhrAku1n8YRVV+H5WXQ0INZdCIo3EMWva9fE1KnwbugsvBtGPh9IOVD?=
 =?iso-8859-1?Q?ec7oLzW2mfbzBxBjSvb8SeSp10WUZP2lps7f/SYkGdMi9SC28qi0gglBHR?=
 =?iso-8859-1?Q?fOIUC90QtP8+0r6fXWv7/aHNiBd7B9L5vNWmhJw1AK3jxFmTwC+UICGOf7?=
 =?iso-8859-1?Q?Jsw63Oh0KZN4d5jRvZ397OrHPLlfxOsYLBrtTbuumCefsizDkbBbi/Kts5?=
 =?iso-8859-1?Q?gYY51F8uFuINiayQLZg5n+gpkzmoflCtN2TLki2Np/0BY1jjL5Y7VpOiwo?=
 =?iso-8859-1?Q?0HdwuvIcoal6dsFmgGPgQi9/SukdQ+WXTEQBJpsd7BBQZFKloOsykpjQ5D?=
 =?iso-8859-1?Q?OOe2HTMnn6wZDUj88nIbJPXNk5PpCtAWjRAgcdNRlV0uTPJSPEAnfELiwH?=
 =?iso-8859-1?Q?tKndHF9qEPdQr9i/ng/8iQSs68tEYy278V6v2qsfxFvIsaCjD/pt0k201P?=
 =?iso-8859-1?Q?aQ9hATd1epKd5C6HONVQJXi2DkTznzURhQGLravmYEpy7I/tjTLjDT7QDt?=
 =?iso-8859-1?Q?ceJ8e0KmBuLtiMzCyQCKeF7svtXJfNMekipYCZfaNkLRL4qRena3h834hh?=
 =?iso-8859-1?Q?v74n+yaUZNG8gRK932B4arXLN/8ip3UDvZg2IuC+BHAgXxIhVSvZCrE6DP?=
 =?iso-8859-1?Q?YMfyZ2lv1tnykmCrdE2PZTF0/Xf8Ox3xw9tRFgWuQHyDGWTVOsNP9lbeZs?=
 =?iso-8859-1?Q?LCiyrSdKBy5ByCBzZ2GjsBVzbe2Ab2NQBxBDuGNCKdqF413jVbUvVl+7yn?=
 =?iso-8859-1?Q?NnRP7xHPIGk+ZlSILx99Zc9s+sFpjhjd4wvcRnT+bSZ+wQSTAVH/mVV5CI?=
 =?iso-8859-1?Q?Am/7Vo7pLCBFQsmeFjqqMXkQ/2eQuMxL20dLJCukHtpvFDDKvBljjlxaGq?=
 =?iso-8859-1?Q?0Pfa9Q7QNMam+B8JMQZQqqGngbrTUSdV+L24ELg+g9xEEJRPecKdsGtLAM?=
 =?iso-8859-1?Q?kG9wnorN7ozQHU+BJhARgA8UR/rOpwDzelZYVZcU618H6d2FEm5UPzAoiE?=
 =?iso-8859-1?Q?q3sf2t5hm65w0ngCYte3yMsVQ3APXN3OlsdHCdWdzqr3GAh9xiUZXpNJgu?=
 =?iso-8859-1?Q?s0sNktOA4wX/4Ts7NVS/s59JSyoVU52k8m0dnqizzyruOsnXJ2+psloiBm?=
 =?iso-8859-1?Q?ODeZ8LzMQNoPkUk8ylqLJ490fV64V1c6T4GZSzr7pkLIbgn3/nyWzB0SEW?=
 =?iso-8859-1?Q?ef55frozeYF0KpJHGZact/Su5CxRTpTpDNa4tANKWiPu1WQUAs0GdfqIZs?=
 =?iso-8859-1?Q?sU/YtyFp3eLEsYkT+C7CNfQle5rWCx0AwI2SFd6Yv+6zNszi8qSsFwh8d9?=
 =?iso-8859-1?Q?l4OTQdsuzFCwHABN1QfRdsyB00NL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efc3b8f3-0451-4b86-71ff-08ddc2211c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2025 15:22:42.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1206

On 7/10/25 2:36, Choi, Anderson wrote:

> What would be the next step? Will you submit the patch or should I revise=
 the
> patch I have already submitted with the change you suggested?

I do not have a preference, but since you already have a patch thread start=
ed, it is probably easiest to just have you update that one.  That way you =
will get credit for the patch as well.

As a heads up, since this is a bit of a bigger change then some of the rece=
nt patches, I am working on running a stress test on it, which may take som=
e time.

=A0=A0=A0=A0 Nate




