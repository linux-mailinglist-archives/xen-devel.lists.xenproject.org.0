Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81EB1D7F2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072933.1435928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoY-0003Mi-Ny; Thu, 07 Aug 2025 12:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072933.1435928; Thu, 07 Aug 2025 12:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoY-0003Ib-9h; Thu, 07 Aug 2025 12:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1072933;
 Thu, 07 Aug 2025 12:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoV-0002xP-D6
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:43 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c085f846-738a-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 14:33:42 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:33 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:33 +0000
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
X-Inumbo-ID: c085f846-738a-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXigvCrHu7/zvi5d5U5Vv8rg0X35/CukEm8lAJh8tebdW6XVx2Pd+6zJEwPgwQcJNuWvuqi9ID1rbFyIgcOAOKmSGNIBWOerqwRFKGI/7zxdT+1FcprQfHmHChUINzbYCtm73Bi0Fu4X8t5q8HX8wqaZVXd7/vOVAOM/sc+WUf1kVCk0fP0bqtnw05KUfr165SW+ExZw2PuIBS+Axy+R6l1lUwFFQWSIOEvqUQfc/58mHd3yYZhYvf/QUH/VkeZWmY1yXQHzCoJrRQUnKAsdwL3G5DncZ055gYTd6QU+ltq963TDqCUjeo7HVA8OMV+LLjERpg2/15/9GOa7wchJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6mmEA9bHBX6D34Is5x+px4HirCrkSiiECL5U3Jl6Vc=;
 b=u8nSUOESQJFzuH5064QYk3OQCrecLhvjEaAFJvHvob4ZF4piiQrj5qOFyMrMG4FKjbTNEyvnp7gPQIQpiG5azNRcYiAkZQOzpkFwiPdvaBbMvgTndEoCyaxO4zIyFGHC5y4AdJ1dcmxDcNrnO5E0h7W/CHTslISTucsUlgAd1fmKFvZgzjcJDOofja6IrTBIoOL1b3Y+pWPcILKD6wAW6ZvRms9qaaPOl7iFbDsNHYLlfWD07trxVhe7ZPqnO5JjjTvpz4mEPUBlRvdEr6lBFqy13+VRSmGvH86ApKElsualSBbHxJzee7y+k1MXBa4G1S8pLXKbnN52aaDX6PjisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6mmEA9bHBX6D34Is5x+px4HirCrkSiiECL5U3Jl6Vc=;
 b=LSxWPr1Cr9QhvQ0pwxF4K+7MpUolp22ZkyanOzNyrlizHiAkkka6hI7sGnoxPhTVdgMYksYx2N9cVyJOpC3myG6NuX42jcY0x4xr+hUSst/HoJpA9ThLvstDEvLIEms8mpwn5s9ppR+jdGJeTs139hSS8rc9hvno/t6/llpRxpGUp8gv409EmFiC0DJQ+GPxTSB3LuPodMTvWmrIH7VHcfXq9rF2jLOuVFiCeTgjiPBl4ZxZp8ZgksMvlURwGjNkAk2yA2tcQKAJZTWSmxhkiJ1vHJdnCvAOaf7lkrWU+kGHny3j03Jt0IR+KONfeaiObU9mMBI1qsMC3a1fP5LibA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH v2 06/10] xen/arm/irq: allow eSPI processing in the
 do_IRQ function
Thread-Index: AQHcB5d86f8hb7ZHKUC0loGFpjDKxw==
Date: Thu, 7 Aug 2025 12:33:32 +0000
Message-ID:
 <3a434b2581a7b6dbed950773f1a471515c68c406.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: de084be2-96be-469c-b9f2-08ddd5ae9f4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kw1cKDIDyLZtCxUqU09roxlNt3MDIIjSOzOCe7G+FpdG+sZM6e3jd/Xhdb?=
 =?iso-8859-1?Q?qAJIz5PIeccRk+KbcZtDZ2wQul2fFuUeW++lrf9hzvwz1DllUWCpc81Yq2?=
 =?iso-8859-1?Q?RRQxHyHa06152ayJItFJKdHE7MjEBgUgIJ4uHTXxELOihJKTmSU7CrPK/N?=
 =?iso-8859-1?Q?whlhf9i2z8Mh8d9ci2KzJwafGHJXsc39cICpn4Ytw5DhWadz4hIIuUcAPG?=
 =?iso-8859-1?Q?P7IVAl/CiItIujJWQNr118er+sKIMEcvqK72yPse/er55ajGX8PGqmBmEM?=
 =?iso-8859-1?Q?MuOHSGzidZV6kJ8khjjpu8H3m5UynkY7vhSQHu+XQ+vrRpL2fptrhNGODa?=
 =?iso-8859-1?Q?aj6llkasDJBrkD2Rq7GWI5woaHjY/L5m7Yi+L9CbuslFeoLfYlzT2Sh+91?=
 =?iso-8859-1?Q?0WWLh4d5Djs8b6mOepEqDUtOG1C0gj037doh2TfTrcB1OrRQwjJTmR97Ll?=
 =?iso-8859-1?Q?J+iCKySRHJuNR8GH7P8DCZVLj5hHxtpNe1uBqUH1E9ppF2i0IpgS2n3Q1Y?=
 =?iso-8859-1?Q?B0CBs5Jfqou4Nl9ts9y5Y0l+Ee3z+inaw627uB5MYy4LUktzee51MSpL/T?=
 =?iso-8859-1?Q?6zURE7zikMJmkzn4H0YWmp/o6NMoEdIpFYNvUJqw2CVTf02CnLSa3RaBrt?=
 =?iso-8859-1?Q?p0qSdTPBiCHe83pZ5FrE7ICAGLqxUDnj2tJlAn5XWW+FtHbAKEVUNUH11i?=
 =?iso-8859-1?Q?VTKplnfzl4Gs1gVqciAg8rD0ylmncJ5TOYDJ6ZE4IpRrQUzGikDKf6gc9j?=
 =?iso-8859-1?Q?An5Mo0eyRhSOLGp6mxW2RlpF11w/GTL4Wvhq26uXqjusJ3VWLo+FafD18D?=
 =?iso-8859-1?Q?qs4IpygrvZtQnsvT7IsttVLSddVv8lyngdtTKI2aXZxbstB0c/V3FMISna?=
 =?iso-8859-1?Q?NUdB89ZzsuyL5Yt/TZMXQUkj7IfXzTfZETs4KX6jE/XC2D687NqOXP1/Vx?=
 =?iso-8859-1?Q?jgHe4wyp6eObsr9A3ukNra93JvsJEcSLhAgHXoTbM2R6OVJfIq0i5QcpEG?=
 =?iso-8859-1?Q?uqylLdIOYqIVK2tbhq4HN2CO7ladOKBRD7xtBBPnYV2TOn/h+wENX4hrIr?=
 =?iso-8859-1?Q?g6IsFSNBRSSdZap9c87KV1k5vtL8EPZmCzBuyxBWjHqQ8VNX+8iQNZQ7oQ?=
 =?iso-8859-1?Q?Gg8NMgxkew/lDsDQnfYyoE6IJ47e31xzTQJyerUFxSrfZ3/c62urw3tOCj?=
 =?iso-8859-1?Q?4bm9zacvhE/9LGaaAChoT/TSR52bHZ4Ur1JTBBlBmrta0e6JF/uorW0RHl?=
 =?iso-8859-1?Q?6HJ9y7dCr7MmVFWbInIO5UqJmCZP226IkWmQmvJUb4DMSCMV+CfoSZI5uj?=
 =?iso-8859-1?Q?xWtsEkYZHo/6eMzLBlKt0DDU1unuq68ARSH2Euv1xggh/jFBoihL/Vlw1C?=
 =?iso-8859-1?Q?qgbIepPSROL9U68LLcFhPd1Hmx/Wln/ysTHMbPL9WmydW79+sqXy/bw3Zw?=
 =?iso-8859-1?Q?ukmK61VA5rn8vxMo5lytlT7Odx8GBALPNbbSuE5maq8drbupfoVpM3PGk+?=
 =?iso-8859-1?Q?209YVe59OT3IHaeiXwt60RliaqmHVOp6Wu1QLm3IxsLQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f/XWOe/jH36GJez8MQMs8bhbR3eL/fJl+yXSI153A/AAaE3alKnV+WaPI+?=
 =?iso-8859-1?Q?Utuj89irr+h+N8sJtwpP78uRksElPoS9ufMsp+QRqUG24NGwI9mVXjxFbq?=
 =?iso-8859-1?Q?3WJg14DiRunNrC7HLQOGrXFHg5gdXLv6IaOuR+geUVMZgxfJLmW0ZTpQ1N?=
 =?iso-8859-1?Q?xPg2z2nhnivH9bTsnhmK4XXohGyvtd1d4eoElkug0ymWHqeLAjwrZv/Qpy?=
 =?iso-8859-1?Q?AwS/NdkDkJXkbhwrW/yPocW2vREe129fO912EyX0i3dDEEIMmg6gqNIG75?=
 =?iso-8859-1?Q?twcGNn1hGV6iDzTtmR/gGd+/GYIkehakJDkjTtcmliNfymJgX5sJYBwlm6?=
 =?iso-8859-1?Q?ueElC+HnuGcclxxwrD2fILFKjuen5ozsMg4KHcDkg8vRksFVj2QgsOh48v?=
 =?iso-8859-1?Q?IdHUPTP3T64s1PecW2F/a04nUy8LEIU6qYCf9nEHuE/KQK2wcul7Jy39fa?=
 =?iso-8859-1?Q?H9L2MOP68lki412VrZycPx1i+FuJaL5vX5LPgGfaNcAhXvY6wK6B8qDKAc?=
 =?iso-8859-1?Q?VpfJXHCdohLBFBag6RGAacLk9dTq2nE1XZHHrJ+DibrNbkg5OLC5wRvyFZ?=
 =?iso-8859-1?Q?0wLQbxEppkNzcHqXxRhs2dVcx8eFIqlBWhtJBxYzSfE3kbRgdKhLjEWNO7?=
 =?iso-8859-1?Q?YmR+7VwW4BEdjloOvqjPmW9nZzcAtG1U+SPgQ4IThobPCzxaZmOrwvSeTj?=
 =?iso-8859-1?Q?uZHE3+rVHtMbIIWOI+/Jk5E4MwYtF/Nb10VGig4rA2TKxt6r7hXmGU0XPw?=
 =?iso-8859-1?Q?mSye7iDmMeTRmGdnzpKKfyNqEjoyHBgWr/IzaaRhE/0UFuwxjsPJA2wwUt?=
 =?iso-8859-1?Q?b8BIN3BEr3+i9jrwFnTKa7O3bmKTKmAYZbxr+ZS+2hpExavGdWESJjMqTm?=
 =?iso-8859-1?Q?ZLtlYJuvdI+4Vz/dnwJwAcz49ZawjVNFtBWBCkDm8+4N+yhNkYD+BUO6Mt?=
 =?iso-8859-1?Q?9yn/i2bXI08uQCLEKMr0dt48BDD0RDUFZAXoRBeie3VOiTatu3p7zCKQoq?=
 =?iso-8859-1?Q?wq66S0ETRLQMAKd1DtwUrhiZcgkhBPUzmqSX+eWWe7jSbEh0PkmXu3CkL9?=
 =?iso-8859-1?Q?UfoqTpu3gO1MzkfoHt7zoKYAiqq6LEy80/6Nm15RgL+zd+lQ1LwFxpxkNO?=
 =?iso-8859-1?Q?EYv6fYybKgGCVteFd5hWSxO26oGnEoaoarEX4PW4ZsJ2jDG1zcGpODYPvN?=
 =?iso-8859-1?Q?AnINY3U1yXAXJcJb8Xxu2qb0YVurHXdE6hs7yjLAhj4gZcGXEiGVkFDbX6?=
 =?iso-8859-1?Q?t6beCQ09vr9Hmefe3ov2wFpDE5pipDKp7uTvx0cRGMMpCZ2EU82Kh2CDgO?=
 =?iso-8859-1?Q?PqWzOT9uM1LY7majMRXo66uZnOgXjGMtWgYNGGhebLZKF9AYSTY9rnd/aB?=
 =?iso-8859-1?Q?z6LDB3DhxEuzDRrklU3gn/JykYqABcilzaFNPSQiyfOrHQdPYCocIVj60O?=
 =?iso-8859-1?Q?fRvKd/LjoQ+RyxDdK/iFMisDDOm4B3+BkBx9uNOZqLUX4gDY/OVNGtH0hV?=
 =?iso-8859-1?Q?EGPZXFVZM3dVXxgYr2xeL0IhJeicTAu7o7GO1cArpr5EReUronw5YIX4o4?=
 =?iso-8859-1?Q?dzmuFrlxyiNuNivJYHhVXYiQ5vqzl5f+FOIc57c4MBhVbsHaiSoTztSUD5?=
 =?iso-8859-1?Q?eBk8bGByen7mg1rDZGAe3RtujFPg4WItMwlhlfAqX35oC8ec5Ue1kdAQv0?=
 =?iso-8859-1?Q?pkXoXP9D5glvgIyyB4c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de084be2-96be-469c-b9f2-08ddd5ae9f4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:32.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VmCtgzAmIjsw9qtISyOpQKgRaklIVOBC/YYaGTqtZXhZzCFDKbrmicOgree2JnMaXlGoUw7IUNi8ZOi/Mp7sTKH+9aV5Qizv+2IuYUOdrxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

The do_IRQ() function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1024. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- no changes
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 47fccf21d8..7186c3d40a 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -341,7 +341,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_f=
iq)
         /* Reading IRQ will ACK it */
         irq =3D gic_hw_ops->read_irq();
=20
-        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) )
+        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(=
irq) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
--=20
2.34.1

