Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59777A347C7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887824.1297271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHw-00086b-2W; Thu, 13 Feb 2025 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887824.1297271; Thu, 13 Feb 2025 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHv-000859-VR; Thu, 13 Feb 2025 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 887824;
 Thu, 13 Feb 2025 15:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tibHv-000853-7n
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:38:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2614::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81bfc045-ea20-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 16:38:01 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7030.eurprd03.prod.outlook.com
 (2603:10a6:20b:295::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Thu, 13 Feb
 2025 15:37:59 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 15:37:59 +0000
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
X-Inumbo-ID: 81bfc045-ea20-11ef-abfc-e33de0ed8607
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSAJN0lHYlVq8OiW0kbSZ3GLKK0TFQQqFVpFoLDLcm/jACyA2w0iWzrWODweFSMM68YG0fLu/qPTUX3jDu4Hw3MAHEIhffmbBhwQITQ8te7QdoFIABc/TwzTYMJQ9MjDFXoUsms+l2e5mpRGA4jt41946+9bd4TiYHxkoQ0mLB6kQvEBA4H88qkXpLXbyr6xV3bkO/3zOXCJ5lNtGdR+VZldKn0SSLgK/k14Fd5VBvZDrZXc/Qm7kosUqtx41ajDpGGBiHLKl79wQ8Qh2szg7GvqqH4u6UwXmkf7ZzQKqYfLI4sesiFG8NgtaBd9kF6UaJX6lFAK9HdBScz/MyTqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dxQkqz6IteHjS+Vk9HyCGR6dBrUE8NGLox/Z/hxaYQ=;
 b=EcZyvBbd4kGDFvcu4JGh29EZHYQjjN4vQ8RS+7vSqDgPvuXOMZnH9Lekp0kvofBz5tZ55wdgJCB/yHtbOaLrIQMeC18WUBZE32b2YnPvNeEFgcNGNc7ZsGyTQMnXFHP3/ASl9eSywdugZN95Oh8oLQCV9vDc7UbF/9z2xdcGmeYzCUXSVqfZvy10PuNjIEtJlQ3AHoUp/jp25Rl3W6T+PUc2RDFVAXg5c2CpWa1tyNTo0/K6Ivx5pZ0+/TdTAaUiasIsp6rbB8Y+QN+NGBotA+rq2q2rxzPxT1Q7w27aMi2pJWQIT5pxoBnV1hkodqiAYLY9VKKDJCZtBIkO0DhoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dxQkqz6IteHjS+Vk9HyCGR6dBrUE8NGLox/Z/hxaYQ=;
 b=G7RlaD51lQZ35+4+R1oZ7dHuJ+gPYCRorhJQSFOjwn5M/h0AQwf/MTlrLzpuPaD6IooE7tYyNfI03goNqLwwpXqIhVtc05mAlYBdWthvqV+BQOiKEved/GYn2v8lDDijCt+GNWlAkxuVXzCiZzC8jKRlvi4aoJbGCygCohtY9bd+vglVlIpW+z8QcQcPvAWw/gvfY+u/oXl7RzGte180fvw8bidKJ9FOb+UPqi7TBrV9diO96GChZqnKeVyI1ui2D4DGb64Me/24h+CbCvCf9ZF4h2QoJeJbbooVQvTD3tTUf9mGRwpB1MWrgAjjZ0PbYCjOskbfEqefi4GTg72s0g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] arch: arm64: always set IL=1 when injecting an abort
 exception
Thread-Topic: [PATCH v2 2/2] arch: arm64: always set IL=1 when injecting an
 abort exception
Thread-Index: AQHbfi1Am1l4vN4jQUCNGyHDqcpHNw==
Date: Thu, 13 Feb 2025 15:37:55 +0000
Message-ID: <20250213153748.2869989-3-volodymyr_babchuk@epam.com>
References: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7030:EE_
x-ms-office365-filtering-correlation-id: 2f949f63-ad6c-4a16-6b26-08dd4c4464d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kBYQPnAkIzBGwdDEw5VUShdV2zC+LPSpmcP6UqTIxFR4I8JSfMXlJRpMvT?=
 =?iso-8859-1?Q?hnUg7NW6PALatjxFTuIBxuRCGrywDT1z44A9Dby58s+l291mAdz10iOZYz?=
 =?iso-8859-1?Q?iJcsiNQHQRSd2Mg0qJGcMoXhLkUTF4aUGbvGtGU7lT83AG6oq3oevIeup9?=
 =?iso-8859-1?Q?415cnjp/yvSimi4esb69WxzvkAmBMZJE5nxHaL30yQdJJjYoiV0rb5a/aC?=
 =?iso-8859-1?Q?lUpKXl8UIGyPamw6jGno/MrjXllxUZZC+MTR9OX6zUJL7g5MkFJJn7kO+U?=
 =?iso-8859-1?Q?65bXEnIhWHrRRoy0zUYpsxQ3PZGpTGHe0vMl4tnXfh9Geg92DwZ2yVQEeC?=
 =?iso-8859-1?Q?dEvUD4EEk4BkPgGLSTA0AH6cx2TaaTaKmhV307t32Z9JuXCyrAVRMpyd5j?=
 =?iso-8859-1?Q?3+RKOl/a2SGYmt9jGHVXVQvAe7JfaO6qGYZ8UAYtC4G+hAsVfRfPtleys8?=
 =?iso-8859-1?Q?Ef8DkzLiL11k98eI9gtYKn/Ri/HHdYDwQq37zd5Cmn4tYlvQ9i2fgbMlyf?=
 =?iso-8859-1?Q?2uV9mcGHq0wAxdNQXhe0/4mq24UFMORvWirtWBMqOebSIyjzfEVUC08vrR?=
 =?iso-8859-1?Q?vHhyiG16vYQEO3tEjRa2W8ChG6xEfqgcmUlSLBg0G4tgcvglE8ltzIPpmS?=
 =?iso-8859-1?Q?Hhbni3jbPyQtCNt3Xfk6/fqZWMJysRFZuOhEaTBRCvit3hi/qN1DDyzzi+?=
 =?iso-8859-1?Q?a5GO3Xj/S8s3NjpdRxg2Rv7ZOCX/sFhtBBbX2Nv/PWNAJp5StjQZlCwJRI?=
 =?iso-8859-1?Q?0RG0Ab61HuuYWN8Yj09Ncm7WAPKo1NwlgDsIW+j/MSHhF8n4CVBRS+r8n4?=
 =?iso-8859-1?Q?CDAXoQ8wG5xD6jeu1YcZuJEdsEy3OVJbnEVcaniSiP4skwnYC02o5h1BYo?=
 =?iso-8859-1?Q?J52euedlx8y4kHF2ofzxWxgSgPQdpYvFcQDwH4MjH3usBs3laS5uyTpYPF?=
 =?iso-8859-1?Q?XnXTuxLipjYEMociyW+SOEGzg0oMb3oQMwku6bxgOpjtchu0GuRXaN7Iw3?=
 =?iso-8859-1?Q?tq/8arC5SMztbOEuAQ3v+u/T/5uUIo5wwxea1r3JQFD37eLXKuT5BaunTr?=
 =?iso-8859-1?Q?prtlqND9PLbQu5NvBqx5FqETTLLelN+zb50Aq1/3s9xp1HU4zTJAgT+M6P?=
 =?iso-8859-1?Q?b2/cHdMqPmK3QQbNjfKp3ldMvTzWBMlaQMhAPyYhypShE0BpCT/9RczR9Z?=
 =?iso-8859-1?Q?F++qKefXKnxwYMGxtZZod4PRsmYCSNHe/dpqhkXdWdo89rGBTZwuLzeTDP?=
 =?iso-8859-1?Q?MVhaoJ956sKdZcxB0tFmMjNkyMXRFP3C/ubXe3Ul9rUnq351TqZmWr6PJB?=
 =?iso-8859-1?Q?+znnPozDcjIYHZxUBw0cPvrMizT3sUwQIXsJvdB9bgRiai0WWQLuO6TLkE?=
 =?iso-8859-1?Q?Rlg3VBaOvR4k7LNj3RXGW1Q6WMssBNU8T8/JPH058Y2wPIg9vp4f7z5Zux?=
 =?iso-8859-1?Q?ygUpjvjCEsy5bFCYTfqyTvPvs8TgfZYkebFlPksPVGnzZLuchUAp2/Zwgq?=
 =?iso-8859-1?Q?AadnxZRPQrgiXW+IQQkkds?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?p1UJ2QfhCBjQB12choM9mEroKNLVr9r5x9tOAhOScTVHqVdgRYrgzUDcq+?=
 =?iso-8859-1?Q?h3I1Wr4+uMoW/+yDndc2pGziia1pu1rALdQpgS1olxsaVX0PHCkjTKeje7?=
 =?iso-8859-1?Q?A91U25UmGcF+CbbKpkbOLdIjt8SXBoFx+stUG8MGmujcv3OP+EKiUlNjdx?=
 =?iso-8859-1?Q?Y9ExETDkIHk52htAnWXBt/GjIC7no1wmqrHfNI+xxJE5Xb+Jby4szmE+e5?=
 =?iso-8859-1?Q?S9qO9pYnow9MVe9/ryM+7egGvXlGoNu8Nc9cmdSrY/hlr+btKgCG8uBkpn?=
 =?iso-8859-1?Q?0vxiGjlT+xQnwD5+f0oKcIhQG/WEKQvIejFQk0sFvB53AYvdK67yBIEPZb?=
 =?iso-8859-1?Q?nrzCXxU0FtCnA+7V4GFr1I+y+eCwS3ZSmIh5jOhPKa96pJYGcXoEVikgaB?=
 =?iso-8859-1?Q?5jl5sagHtqYvt2QvZH/5XvqlCy4yntYBVMCAN1X+5RA+as2mmeL3r2/gzD?=
 =?iso-8859-1?Q?v5QlcP0qlzGgQuVZruP6AUluChIUFoJMvzGstUb0yPxKL4UYvc3gJK9aUD?=
 =?iso-8859-1?Q?c4Gn1vEcrBw1lWnwX8oTRM6B1Z0sfOSzrcRnSRPrqQ64NRUCwDk/Kp+Mpn?=
 =?iso-8859-1?Q?cmUJnerqlfONSQJ4l3RW3ViwH11zHgaojHH9sM4TyrQm5JZ9wpEAhcdkfi?=
 =?iso-8859-1?Q?mG+O1W0ZdRqPlhOe2AWvsLp2EYp9PCupIE+zXPprc3jwYCJTOuaGEVMO3a?=
 =?iso-8859-1?Q?3+Hj754ulUFdbHz3PdRFx7MxTsxQcs4cABxbm+OaUwYuo4S3vZBmki7xjG?=
 =?iso-8859-1?Q?A3dtCtAgufmaCNTNMEo817rtB2Tz2QdBSkGUc9fz72sL3pvzpEK63sbNN1?=
 =?iso-8859-1?Q?LisYNRrBeXcfKWOw0S6JXmkMBl4WrNgLFPn6hIOqrv8CuBYDCggVnRhWSQ?=
 =?iso-8859-1?Q?Fubrq/1XKZo3mc6NUwNUvSme6JW2Yt5AOdC8FpRwdzvb4hNyrZO1ZS+dGy?=
 =?iso-8859-1?Q?15vF5Wq1FBO7o//cUeOLi8cjSchF7ME0aG/N1yIinT+jpaWWnQN1XaCGAK?=
 =?iso-8859-1?Q?chXpg47j3tfTHpCiQ24aA8Imcs7/h4syD4YZaFnI8PfZWe/hpaImibFwqq?=
 =?iso-8859-1?Q?H9cllzwjByPkIWyFwbt/4OKM0BP32cTjm0zucitUBPrMrYlDdvrD7xXX3s?=
 =?iso-8859-1?Q?OZ71uUYWiQzqso7gBI1L3/Fh01qKTSOE8p1p8SjH9A1ZaLZPLJjgrB6UOz?=
 =?iso-8859-1?Q?7+UmQfoNbYwyNtxg0Tth31nnCr2br1I8M4waGwNjGKby62KwBKf90rvl2n?=
 =?iso-8859-1?Q?22Q8QtdmmujiUAE5LI8EuNkxerIUI+jJEo53pHb79wO0QCIecXhHjFVSSw?=
 =?iso-8859-1?Q?311yw6168ySmkVtS5QOi1zHXb5/Dd5Qe1EjaIt2MJuZKj/z7fmGsGtFXx1?=
 =?iso-8859-1?Q?c+WFw3z7xvWqdTe7GaqbvJK5KGMc7Rmb2V0KFpprFsfzB419p02klkC0dZ?=
 =?iso-8859-1?Q?v4NPGIKpK7E9FWFGgeVexp7sWlFEoaYjg93YFDCNl5bY75EQa+rQviqZ7t?=
 =?iso-8859-1?Q?5xjef9hqTc55YC6Z3Fl1u6uQ0lj/8AIVG/gujsbYGqGSGeQOR4AdGfxObk?=
 =?iso-8859-1?Q?BIxxKqU5imyQ4dvUd8na41mZJdyKCnNKKMXUyqn3c8APLO5NLhaRAcocwj?=
 =?iso-8859-1?Q?6t+UAZdHppti+LCnc+EPw7JUZS96avWJ8uxt2lpkVgoGFUJLw9L5Zb7A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f949f63-ad6c-4a16-6b26-08dd4c4464d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 15:37:55.1185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQdmCIocS5Hgt20jah0EKofsUBta+sA4uih3Mjh33UvhqKbev4zZIFNPPdV7P6xmyGT9P+231bs6IRPzqk0svnDn4H1ln64CelQRO3cavLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7030

ARM Architecture Reference Manual states that IL field of ESR_EL1
register should be 1 in some cases, and all these cases are covered by
inject_abt64_exception()

Section D24.2.40, page D24-7337 of ARM DDI 0487L:

  IL, bit [25]
  Instruction Length for synchronous exceptions. Possible values of this bi=
t are:

  [...]

  0b1 - 32-bit instruction trapped.
  This value is also used when the exception is one of the following:
  [...]
   - An Instruction Abort exception.
   - A Data Abort exception for which the value of the ISV bit is 0.
  [...]

inject_abt64_exception() function injects either Instruction Abort or
Data Abort exception. In both cases, ISS is 0, which means that ISV
bit is 0 as well. Thus, IL must be set to 1 unconditionally.

To align code with the specification, set .len field to 1 in
inject_abt64_exception() and remove unneeded third parameter.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Changes in v2:
 - Introduced in v2
---
 xen/arch/arm/traps.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 5338d5c033..3071c38768 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -559,13 +559,12 @@ void inject_undef64_exception(struct cpu_user_regs *r=
egs)
 /* Inject an abort exception into a 64 bit guest */
 static void inject_abt64_exception(struct cpu_user_regs *regs,
                                    int prefetch,
-                                   register_t addr,
-                                   int instr_len)
+                                   register_t addr)
 {
     vaddr_t handler;
     union hsr esr =3D {
         .iss =3D 0,
-        .len =3D instr_len,
+        .len =3D 1,
     };
=20
     if ( regs_mode_is_user(regs) )
@@ -591,17 +590,15 @@ static void inject_abt64_exception(struct cpu_user_re=
gs *regs,
 }
=20
 static void inject_dabt64_exception(struct cpu_user_regs *regs,
-                                   register_t addr,
-                                   int instr_len)
+                                    register_t addr)
 {
-    inject_abt64_exception(regs, 0, addr, instr_len);
+    inject_abt64_exception(regs, 0, addr);
 }
=20
 static void inject_iabt64_exception(struct cpu_user_regs *regs,
-                                   register_t addr,
-                                   int instr_len)
+                                    register_t addr)
 {
-    inject_abt64_exception(regs, 1, addr, instr_len);
+    inject_abt64_exception(regs, 1, addr);
 }
=20
 #endif
@@ -617,26 +614,24 @@ void inject_undef_exception(struct cpu_user_regs *reg=
s)
 }
=20
 static void inject_iabt_exception(struct cpu_user_regs *regs,
-                                  register_t addr,
-                                  int instr_len)
+                                  register_t addr)
 {
         if ( is_32bit_domain(current->domain) )
             inject_pabt32_exception(regs, addr);
 #ifdef CONFIG_ARM_64
         else
-            inject_iabt64_exception(regs, addr, instr_len);
+            inject_iabt64_exception(regs, addr);
 #endif
 }
=20
 static void inject_dabt_exception(struct cpu_user_regs *regs,
-                                  register_t addr,
-                                  int instr_len)
+                                  register_t addr)
 {
         if ( is_32bit_domain(current->domain) )
             inject_dabt32_exception(regs, addr);
 #ifdef CONFIG_ARM_64
         else
-            inject_dabt64_exception(regs, addr, instr_len);
+            inject_dabt64_exception(regs, addr);
 #endif
 }
=20
@@ -1965,9 +1960,9 @@ inject_abt:
              "HSR=3D%#"PRIregister" pc=3D%#"PRIregister" gva=3D%#"PRIvaddr=
" gpa=3D%#"PRIpaddr"\n",
              hsr.bits, regs->pc, gva, gpa);
     if ( is_data )
-        inject_dabt_exception(regs, gva, hsr.len);
+        inject_dabt_exception(regs, gva);
     else
-        inject_iabt_exception(regs, gva, hsr.len);
+        inject_iabt_exception(regs, gva);
 }
=20
 static inline bool needs_ssbd_flip(struct vcpu *v)
--=20
2.47.1

