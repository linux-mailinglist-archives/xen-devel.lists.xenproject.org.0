Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD42BA8739
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132650.1470951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZJ-0007YF-0o; Mon, 29 Sep 2025 08:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132650.1470951; Mon, 29 Sep 2025 08:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZI-0007UL-T1; Mon, 29 Sep 2025 08:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1132650;
 Mon, 29 Sep 2025 08:49:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbRY=4I=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v39ZH-0006Tl-4n
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:49:11 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a6f8688-9d11-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:49:10 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8109.eurprd03.prod.outlook.com
 (2603:10a6:150:20::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:48:58 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:48:58 +0000
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
X-Inumbo-ID: 2a6f8688-9d11-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIC+SMUpVpFQ058+MlrQHlpAUnkPsV1YrrhOpSTpVa/SCJbhlTZMOnDLallxXOoF+w2K8BsKlf02nw0wvurxViR6GYCMMZs/IZ0Sz5AR0M0aX2BLjmd7VTutcJXB/rh04uf9NqahQ19+/pKxBixU+z4pSc3MBUhNlZ+YP2O8JkxUPsQOgCmPwHmRTyavv52VtNtu8i9Nxb+osKjslMceNYF4iP9yN8Ip9t2wyAoeRYf2UA7YV3/fZ12ZolGIcxsyedOacm0Xqxfu4rc5/ygHhNeyHUbzvEhRchGFiuAqiaWyqytmW83RJPZ+T/sL/XMEW/I1aH9nlzllFTSaeRPBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlvqfIOXll0zV3I3wUz5HKPWnEIvUQVemZQu4pOgnbA=;
 b=VqXbYCWmzviurdsXdwZhKCqWv4ea4Eiy09mL73fdZgUOTbQP2Ci+LND+x9GNMiI/Wyr+f9cC9hCpjk3e5BzbpksoHm1R65vKF6NEftgiScVjAZ7l3ZLoW+7NHspmeVMEaxqXnEonSp/fZLFqcnfy7gXdu5xMdCNjZvysYHFhL5On2HWQg7tqaOARbweO6h6Pk0eDKk1A19I8D9bFlJewvbaoxQW701dRxws6EgC1vo50yNIJPqVF8skqrLcQ3w4wXJcjIsCmL3q5RMEIWrGXvLWA9qVT5LHRlphSAwo+UhzNmL9e5ntrVr+GvuCT/T38w0Wc7c8hXHEW0uDktlDQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlvqfIOXll0zV3I3wUz5HKPWnEIvUQVemZQu4pOgnbA=;
 b=uM9Kisbeqakx17oToteKvN+R2QjL9NGZAhtzqEVEMyN9vU58s+2rvt4B02hL0pYDFa7CiZSu67arjVdpPy74p3iI+Hby+A2cSZo2P091hcq8/9YfomvzGr5KJEWR+R0hqr9UHwT9BhVkmgFaiM7P/uqU5XiMjPFjlinGXhLpbewFpIT4ycz0mwTXKfbsTstNY+Yo4v/6nevyDrzufONhhYuTahejZlTXKTOU1n9L5z61jxllB/crrKhk2Eg3NPjDv9IKBtwDUeNoxR2RZKFmdLRGAZvib/a9sWgvQwoEUg9VcLZWUvvn3MCNg6kMVYs1AwCtj15C7wPcUb/RL2V8Vg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] arm/time: Use static irqaction
Thread-Topic: [PATCH v2 1/4] arm/time: Use static irqaction
Thread-Index: AQHcMR3lJIHu++c/a0W9h9fGVQkb6w==
Date: Mon, 29 Sep 2025 08:48:58 +0000
Message-ID:
 <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1759135193.git.mykyta_poturai@epam.com>
References: <cover.1759135193.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1759135193.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8109:EE_
x-ms-office365-filtering-correlation-id: ad39107b-f94d-4496-eb9f-08ddff3507f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xVjwIQyu++sDU8svLTgPqkUBE7lcE9mPqp3LjxdI7v7ikXaUv5D+Rbv0az?=
 =?iso-8859-1?Q?w3c8aT4bWQPpyu9x3j23YR1s3/DgmXtKkIyQZ8dJkw+2vAYJa1LF0sveWU?=
 =?iso-8859-1?Q?paS7MB8JJ3tV9+0y/TmErTZT9szWPVjUsTENa4pEYygNfXqTIaig16YP88?=
 =?iso-8859-1?Q?Rp+F+JNBJG9GupE22sRbEHwkkUxvPg2638Tx6HowdnxF1wT4p/HRL30B2e?=
 =?iso-8859-1?Q?rvm0XJuVmBtjgIKosrBZS+7jXpYP+1CEegoHCt91AsYr6dPbZfJdBFuik1?=
 =?iso-8859-1?Q?QYQ+8dVx/mUnI9iseE5DQDeaGM3P6fhH32Pg66LGkYIjxsVyOlnSdYg2nP?=
 =?iso-8859-1?Q?XKqZRH0Wy/8ZMo+lZ4uJKzV6+QJ5r/KCYZYQodLl2HjS0t63arsXDLlrk6?=
 =?iso-8859-1?Q?Ui/2YoyJUkZklas6sCuebVCjLcUDytJHuQT9PV2/dfJeZxF8pZlmCd12QF?=
 =?iso-8859-1?Q?p3P2dYlRudrdhCsTYXODYd43o+MO3ePT4P2MgqsOt8+lSsbXIhcHA9iVCC?=
 =?iso-8859-1?Q?AO8++bpZjFr6Mq3lOCLoHNHfhV64rb3Yp5u5L/24N5dTnb72Bgs+dZUyep?=
 =?iso-8859-1?Q?TMxdf2c8igDNH8+6FiFFO7ZPo0zzr0U1n+ORn0Byg0e2mlsBwd6tyJRyzG?=
 =?iso-8859-1?Q?nfDvJDYXpcCc+WhwGbf0r7vtqonltog7tFg8pOn+dvrWzipQJw0YFWc7PR?=
 =?iso-8859-1?Q?UN/dSKK8/UIWuE4zS+XvvGqXrWjdEbiP5jdJkDKLkviXJUJTDwdiO8P93F?=
 =?iso-8859-1?Q?HNdfpYGtNJz63yTjRZN+i4DKWKenGLX4aJrPKeVn4Fay9ApdeYftqImUXX?=
 =?iso-8859-1?Q?UhwGHjmrrEQZBIwvBZI2yASaHrz0eppveL3Jaao/YtK+XLJykoCUQ14w4J?=
 =?iso-8859-1?Q?jh3+WQgHomp4ipXUTpRC3s+fehEJd9+VKaS4VGss1OJjkQDuJrTnZcRixI?=
 =?iso-8859-1?Q?NdSzxQvm8UaJUlm/L85W4Ak02T3+QOK2mcJtzAiDp8IuIJ8AHToOCnLmI3?=
 =?iso-8859-1?Q?rOgrjMA2lt9xeZpAva9WnGvTxCDU3L3bOQ16P2rlhmEdBYYHSt1JY9r+0a?=
 =?iso-8859-1?Q?fKMZ28V84Nr3XjmLYRq4zXXojUvAvg3vtNIRUUuxdQzbCJP3zaKvvYuSFz?=
 =?iso-8859-1?Q?zykm7+FQ4MvFSsQ5ATv1bub/uxtgKwkxpE6PdIXttttC9i6E3iDVsq1AVj?=
 =?iso-8859-1?Q?mBzhdxLI2X3cQ9WKUPm8/jSEZ9LItIqnvWmQG/8fPoBLK5MlBCLR6BRDS4?=
 =?iso-8859-1?Q?PwHPeDBWyK6w4NL6b3Yy2mY09h6bOxIEY93tOsLo6srS2M2NiXvjKcGhKG?=
 =?iso-8859-1?Q?9n2fff62ND0TeBqHmBLjK8XM8mfAPjuGCXWr4+j6qXeKNK64ZJ6P+hULpb?=
 =?iso-8859-1?Q?adnWhO0chZIURiO4aqIumZysyG8VYo16XarB85IuMLsRj/HGc0QfAQS8xd?=
 =?iso-8859-1?Q?HhsRlYAVRmR2wcpEBn7InJvGZtgF8X2X4MeMqHic7u63gWg+XOmbgwdoDf?=
 =?iso-8859-1?Q?Y8CgfeJ+u7+xD/PmbyUNnOgcHJQeauRT9Ys1yiLpmX1eeOKITbcoV5ok8/?=
 =?iso-8859-1?Q?Nbay4kWteivVjRLmZAGfeS0g7rPh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Dnx/E+hnqVqsLDZR4JARDSkjz8rRSnFtE63ub3RNBp1BxlRJm4PJeQogEF?=
 =?iso-8859-1?Q?qzVfOYzY2UlEDnqVbgIX0NUWQokkZSJ3goapXdZOCJLtNo92wL+V+yBVL+?=
 =?iso-8859-1?Q?jL2jZ9350OEGNcFB9w5iDkPP7b1etanbDv7AvtMhewN1iJNrsLcQ54G9Q4?=
 =?iso-8859-1?Q?NNbpJ0ZjGRQF9BKcdMqcY1cNfWJlxF1IW2nxH2gfNZFOG2CvI06ypr0vt8?=
 =?iso-8859-1?Q?Lm6fesmFn3XIvkaMlgvqiQi4wFLYwLRaQYl3R/zseW1f/GkIARoCFtdP08?=
 =?iso-8859-1?Q?Ad5vk3KQWtJaXTmJ8oTpPTJI6FXyXnjwujR409t7fRKqWXQs8S5yoL+9hJ?=
 =?iso-8859-1?Q?z7R4BpRJTw5Z2SUt0dWOKSohWIEsniiAlToxHamP5VV+SYuoePrrM9U6vL?=
 =?iso-8859-1?Q?6FQK2mcH6RStSF0N0npk5cuoFak3kCt1VsL7U9dv+oAvPgWhnpniN4+vFd?=
 =?iso-8859-1?Q?bGgvaMTVKAIPVjB463TqoOave+sQgSWeooYP2iALdJCW7rnvUo82Ew55by?=
 =?iso-8859-1?Q?2boYv+4l+OIcgcmgs/R7ZzBsIh306k6EA0MwZabemdCYR2J1vApMnx7VCs?=
 =?iso-8859-1?Q?pnDyVYPdoeRTwP88lzguB8c1aYBExehO+ZNj9IbqUyJQcCAJND8lQi64Zt?=
 =?iso-8859-1?Q?LjKRy0Dbglv6ilfnuBQw+of/ee18otBifDdphp3a/LZYxbfyrq6cHCnv7b?=
 =?iso-8859-1?Q?fqKgTH69RAJ/UgpMfvgSMFDi0tWW65NDRMVtL+OtveAwSNh4zCHnC/zbRz?=
 =?iso-8859-1?Q?Ny/dqEAIXsMYOaycluMIQmSJ+jRhAE+vQsQC8i+5/PsOmkYLJccYbgdRIg?=
 =?iso-8859-1?Q?6wPJjAMX3BKpNmGIeGdKQXyHdWMtaHcKA6mo/b7SoJyt9zxaR0bYESiSUs?=
 =?iso-8859-1?Q?U3s4RbS6kiJCJTshLSQ/G6K579U5YPiecHy0JbOcYvPihtvMQy+TH00Yy3?=
 =?iso-8859-1?Q?TheNOeqVe/Nha/NuNRK3UEXmZ9NEj4yXxHLuCrEdtL2PlBkdch9vwGVdM8?=
 =?iso-8859-1?Q?9vcE/QpqqkXQwEC0urRXu/S2c6+buFYUB3XD3beVkQv01fDdLZnRvN6srb?=
 =?iso-8859-1?Q?B/5ZbI0kyBmvXH44wS0qi8nI98Xr3cfcKIZmikMN6tR4vPBi5kIbGD8wki?=
 =?iso-8859-1?Q?yqBeARPi1ZbjhgCHi/8gMi0ZJ1pQibtTeMZSssngZKpjwTjzwyRbc9CHB0?=
 =?iso-8859-1?Q?9cqo3YGAvQAB4rX79+C2hD5bo7UwJW94hbAwvJ3wDZI5R+z/vK1yEqJZyR?=
 =?iso-8859-1?Q?kwL/ti4kg2BT9NQjimmgKP0/9pXDBUL7C2yc2ABAtRkxx6c61ati9GfV1Q?=
 =?iso-8859-1?Q?vI5o1+/1BEyE9D7hMJ3YXhBrYJb6TwGNzg40k0SqYo21jqJd9pSoXs5oSL?=
 =?iso-8859-1?Q?h479tAVIqjfsEx0D2CkeDoh69H6czO69LRAN5wDJOoNpuXos1nUFwZaPgZ?=
 =?iso-8859-1?Q?QxxH2aQ9tSri6eQgmwUa+8uAsgkCJ2E4P+81K1P8IAY2Yh7nQm/hb/9+pw?=
 =?iso-8859-1?Q?crgoe9hmoQU+INkGJ3ncxLf76EZyAvMkyqAR7fkhxQgdeN3IqK5aZtX3JW?=
 =?iso-8859-1?Q?mZ8dqC8agR7EfhZ8Y46ztPP052YNCpJUXRXlhQPqMqcXBerkTyQB9g+b/k?=
 =?iso-8859-1?Q?u60KP/JwXzvDMak7S5ydvvP5AlHktub+acMqtVz5oe4Ox5zWgdkKIuaA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad39107b-f94d-4496-eb9f-08ddff3507f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:48:58.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QcnLRyvRJN7sVDCidvQasH3mvcnHKyoxO09wEwZK47inFpF6+29OluyfpZqyE0Ytcpot9CZzUkXjk7necmP0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8109

When stopping a core deinit_timer_interrupt is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v1->v2:
* Use percpu actions
---
 xen/arch/arm/time.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..59349467de 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -303,9 +303,15 @@ static void check_timer_irq_cfg(unsigned int irq, cons=
t char *which)
            "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq=
);
 }
=20
+DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
+DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
+    struct irqaction *hyp_action =3D &this_cpu(irq_hyp);
+    struct irqaction *virt_action =3D &this_cpu(irq_virt);
+
     /* Sensible defaults */
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physic=
al counter */
@@ -314,10 +320,17 @@ void init_timer_interrupt(void)
     WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
=20
-    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
-                "hyptimer", NULL);
-    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
-                   "virtimer", NULL);
+    hyp_action->name =3D "hyptimer";
+    hyp_action->handler =3D htimer_interrupt;
+    hyp_action->dev_id =3D NULL;
+    hyp_action->free_on_release =3D 0;
+    setup_irq(timer_irq[TIMER_HYP_PPI], 0, hyp_action);
+
+    virt_action->name =3D "virtimer";
+    virt_action->handler =3D vtimer_interrupt;
+    virt_action->dev_id =3D NULL;
+    virt_action->free_on_release =3D 0;
+    setup_irq(timer_irq[TIMER_VIRT_PPI], 0, virt_action);
=20
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
--=20
2.34.1

