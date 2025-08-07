Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B4B1D7F9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072930.1435896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoT-0002UJ-GB; Thu, 07 Aug 2025 12:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072930.1435896; Thu, 07 Aug 2025 12:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoT-0002O7-8l; Thu, 07 Aug 2025 12:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1072930;
 Thu, 07 Aug 2025 12:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoS-0001m4-As
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:40 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be87e491-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:38 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:32 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:32 +0000
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
X-Inumbo-ID: be87e491-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7OIwZb+o+SNf0BMh6YC1qj8TQctNNg8bgkos9wlci/jYK1BsbSuXHeR7jkn3dEYWEHN+sQ/OFwUU3xEzmyCUycuF/Rr8gKZbNbzsukvJ/hFBORezKMUU6ICv3en1hIADdcKs4FwLpg8QxMwd4a4IWxbHGrjHXLaa0qqCmA2PT6xt771CFqLDK2677LEAEfYTEFiyuhJFzrBzVsp4cL9aiNYLvBoxVGXN0Aka7PZAZ3RH+jnvUL+fkm2d1P3yY0Lu9yKnIXrZVPjj5w/kZwQc6VxRlMXMPgrw3OLp4hrrcQeGTxr1m+X+KeJUrkfSTRDD16Sfn2qQfhPsbTUM0N+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndn1QbTEwq7xU/jk0TW7t9iCUpFy88XOtrCYu9WTHoo=;
 b=iusMwHEF+h4cLbwpQLbiB8Vuwp8XOWYuJaJ6619t2jLyBAvVaeW464wi02ejB+BTezBrdf41HIpSGEKqAY8/yWtqzsTGc77gNO/KrvNgiBYq5zN8RCqix+GIhV9SMKL2uKu2fmPyFt0yM/7m3lmjuJynzzD+MhXS/52Bb/Cemx49+2YlI4T2EjwrcCsbIQYzEJLYy4a/eStBa1BsIBXq9C2mJpR4xlb/yk929vBHRPjSwImVqTnlE+JV7ktfC+XpGAjAb3YEyTg5yl5PyL386tToXpKCJymm5HZ4SHiHqRhz9NMao9m8GxUZ/SGan8f+fWN0CgZgRWwXEGlxq73KaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndn1QbTEwq7xU/jk0TW7t9iCUpFy88XOtrCYu9WTHoo=;
 b=OZympmzkP5gZgd/tLesokpbai1tfiatXBFSMlZF7vXKC1lQ58hPpHCJvf4D5Fxtu5jfXMxBoIP/Pq1h0CDeHYDTT7Wp+KkxOz+JAR8uGP3xHuHTIioZwFDeYb/tyXYygyF9VFiOAH7t273DUaK9DSsPB292u44WDoXlu1CHlwixb6Y66RbVmRB/CmcyiSIVTbLsYxgdOMunS4EEW6Cl9Q8DNJKa0u5A9z5t+maQH2SprfrXpBU4bGVitxXMQGQnbRtcAf5vxrgkfvmPe6YCTFI0biXv0+u5lw+hJ6x6H9Fp0X1hJ4HOEE3xrxYq6CMtI/Lfj340/RhZXiF75EtOYsQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcB5d7kgaRrTB4eUK2JDUmO9y7Hw==
Date: Thu, 7 Aug 2025 12:33:31 +0000
Message-ID:
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: d5b7f1c5-bf1d-4df5-04b7-08ddd5ae9ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UWwAGIkohS597oOvgfaQx40ocr+E8DX38U+lDYoxhIo5AZzFL2UQMYyAHh?=
 =?iso-8859-1?Q?HwzgDPf/1mwmCun3n3t4tKrwDZcwxuh9oJNua437b2Zcb/7JFmk381tPo8?=
 =?iso-8859-1?Q?4HDnZ7U5SRNorA2M/EX/Ytdmlv80wZoDFm1qw3PVwsfDA+EVtnvdTe4jzb?=
 =?iso-8859-1?Q?rb1XDW1glY4FNaWu1tpl4zoCUbvsUzYM1aGZaWMxVVseUa9/TE7gRvX+ET?=
 =?iso-8859-1?Q?OeoBZdbxT2ToHyjv1H6vqNZJI+E/NDq4W0ESAAz1EKwfy27Dw1tn+JGf3q?=
 =?iso-8859-1?Q?JtF16yEKkGvNVTt5bsy1vCSy+FjBYTKGIdVAGKIYNPF6l1IIwGZnWFce73?=
 =?iso-8859-1?Q?QuRTiJs0UgejzTrtSmGV7n6OJAo2vtzJcuWvlKPBxzZTjD8bG2WHnG+mXz?=
 =?iso-8859-1?Q?+5UbLeSB0IqnIB2UrPRpL3kbxRXn5UqiNPlc4xdDxVe4BAd/y7Ohcn8IoR?=
 =?iso-8859-1?Q?VzeXAufzPmYXDSnnhkX7FlL4mqIxC7+vBUkLp7OrZDHpyquNvzzXMpudrh?=
 =?iso-8859-1?Q?8LEn9gHz2JYrjetgYsW+kzlB3CaRWxakZqfdzgmv8Zcnw+6zjGYM1xOryS?=
 =?iso-8859-1?Q?y1hi84N5QlohNNqlaUrzu+CIU3h92rJ0qcW/n//djeGl5vUIiWiMObpNGr?=
 =?iso-8859-1?Q?RWguWENUYb7cNzE6BarZcS2cUZ2X/3i0jetA+dV3yDIoxdeyh7Ka/3jUaq?=
 =?iso-8859-1?Q?H94s9fcZyFYSYTlJFKvUrUkd5jAmMW2SuI795zGDECYaRLZUESwapjuxKw?=
 =?iso-8859-1?Q?UT9cM+R5V9VrTujD0pWpp3S/mf7gUkplMNTvKDOlwZTsNBhPOKFCeCdaCt?=
 =?iso-8859-1?Q?NV5E9OzZkmnfEQfjjLKRR1Hv2MXViH9AIWpFihnFp9LKpjztSk+Ip6vRUf?=
 =?iso-8859-1?Q?PVbBWj2v3zyphMFqG7zsde6zrLQQl9U3VkuHHd+ekrj4s2zQBXRlwvvYlk?=
 =?iso-8859-1?Q?bapvQskgjhTR4O7VkrveXpsfyReymZH7CQEdS+ppjFUgKu0reGWnnWsM/2?=
 =?iso-8859-1?Q?szUlo5g+zgR138gb5OUrvOS6vq9G6j7Jc1hlReIV1HFAY9HRhcSk8v7yt3?=
 =?iso-8859-1?Q?83mZRz8BouC7AZOSErV1WxXbRZCnej504AcwaHQ7LQWGnNT50yRAgxEV54?=
 =?iso-8859-1?Q?VkJivFcNb6J93YmwQbvKmZiRSDaDwn9ODcCNGz2KghiMH1M5x1vW4oJ4g9?=
 =?iso-8859-1?Q?3mAzKnnYcytgdpGcfFWl+bXZRYvSk7T3edREtetncp3g/dJndJiAM1x0/M?=
 =?iso-8859-1?Q?yLND55Zi3A5di0TBnAG5l9s+cTJPLjF2o4rC/PrpugeTg8ie75Jq8HiIkL?=
 =?iso-8859-1?Q?uolO3JoO8CSWI7dvoO/ahjBlLw/VuVXsZgvb/9ECNouOXZ+LAJOsuW6TnX?=
 =?iso-8859-1?Q?sfeJLJ+wgcw6CGotwAL9axdxCYeQFPTH1RTBVPyWEoVVmXjcAuXb7OOXi5?=
 =?iso-8859-1?Q?6UcqCcKtq9n7WaDfpkUtUYjVfdiThPd/P3Fxld1bTK/GpWQlm+JkHeTJm+?=
 =?iso-8859-1?Q?ApxR1syUs/YeurY6b7knhw5e49KqwY8IBD06JcEWDltA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zkltKMWEWPTfYEWnkldzP4cJzbHz9e9M3m6n9k2sT6sOpb2a7IFDP4aZx/?=
 =?iso-8859-1?Q?Zjpn/VM39zPFD0D42IP1UQvu0FycY6JZQxoCIVsrJYcU1TZswJLKL16q/F?=
 =?iso-8859-1?Q?1Wlfq2kY8TeH7fFwsN82oEwQ+7cn4Z0LZLiUrp4wp3seg0je+aTBqp5m+J?=
 =?iso-8859-1?Q?AUVWZKGEk5wjieGH87lvqVZHt7FQ51A/XLvlj7qLfPv41vU7PZFH+pXW90?=
 =?iso-8859-1?Q?pPjtPucDB6T2YjjEsGqP+bnj2UydHzC96fdoHMQBqYv/6QxxhLsWCig1wH?=
 =?iso-8859-1?Q?Ub8H7TZ9CJ27EPJ8unWrDDVKnK03qkvQyVA0vgMMAhiOQvRmmIhYqtCsis?=
 =?iso-8859-1?Q?2MnbU01jLla8muMvQ/dnTv8qRhcWx8nICK/FUntFiVA4JPzdpIkCZvhoqf?=
 =?iso-8859-1?Q?k1zuJxaXLHUdrOprTJ7jIyFMnSEsqlM51QPILHDkMJd/HKh3zd1+phIRRh?=
 =?iso-8859-1?Q?BVd7PTi6AvXbrfZdRlnJVYLrgygyp7TK04QCTaN9kpzP2PKr2blrgdl8Me?=
 =?iso-8859-1?Q?OhcZBLBCcd8Y9Rjz8bYVvYyC7jUedQ/dRVcAQuuuXvBbcGDoCs+Mr79Kw3?=
 =?iso-8859-1?Q?qbsSOUjsgFThXizCs5iwOpqikr47xSLFLVePmDptS4MAUvXDe+KA/mmu4K?=
 =?iso-8859-1?Q?EE/yO7+Thr22HXQS3Wy6hVLAmKtGzZVV7BNLaYDSz5PaCud1vOB6GZtl1Z?=
 =?iso-8859-1?Q?XsiHhJ/wJOytYhBZFwfFuGT2YUX7cqYEuAkuSAqCbfFjLPIVZ400yE4rgZ?=
 =?iso-8859-1?Q?9NWZsrzoMz8XrBtbCcPNIZNh2BJeYLUZUwSDtrb8tP1ExLFIkeM86bvEvJ?=
 =?iso-8859-1?Q?E0R2vqHQ1GheQmsKcKYYEAUSHIXtKQOtKLutiLNyVaANGUkvvQqKugIhMt?=
 =?iso-8859-1?Q?ZFeAp+gfOLR3G2bshMKZh9uCRamXl2HAaxRIgakcHcZHksH7gu6a7wCblc?=
 =?iso-8859-1?Q?Zmx0TqAGrYLyaMKp4ia+31NOnu8osLoQUWVJ0uIywbdYnruwM4Zk5LZIe9?=
 =?iso-8859-1?Q?U1la8zPefu/EW0t5dFt22TFJBT1Mv2OZB1/CjrBVw8mxIGk13LyI9A6Qu4?=
 =?iso-8859-1?Q?sMGrjHyO6lBI6M72g5TpxZx7HKx6Op/MeiZqDvF5aslOaAzWO13UuHMyyA?=
 =?iso-8859-1?Q?Mu9xnQsiScGIHThnBycDPMv/JvxfQKxurAL1+e1SaILiUT7J23aLgEpxDh?=
 =?iso-8859-1?Q?HYPSRqf0WATUSGxXC2w2gAmkCFoPZAfV2aNqZm2nSCHElMCPG5r0BSp8jt?=
 =?iso-8859-1?Q?yNvmaysH5mFQ5QxP/K6oqTeHa7YBUsLvMBMsuwbF2H5V4R2mPltMKVeZFq?=
 =?iso-8859-1?Q?c5PdcBLykYMAjpx6mBdsKI2gp/S61KSMy/DYKZJZhNFAV/13JYGRsyAeeB?=
 =?iso-8859-1?Q?6k0bLPkwzXY7LUSMwC1QnJJEpmedBv6SaFtaECdgjc7ktASLGdaItd4IGl?=
 =?iso-8859-1?Q?rHEZ41yyVh2U9N+ZvD81irIXMaGLqoqcvRFmF8csvTSwy1+JCrmz0R91Yn?=
 =?iso-8859-1?Q?DAQKOBjJf+boQo1rBHY/WbWx0H/Hc4hkmxxpJWu5kouelAHAn+M1RPNum/?=
 =?iso-8859-1?Q?Wz5q3CAvxesHoLT/PAnLrsPK8QUbb59cvXrFBem+S97JLc3fKckuei7s23?=
 =?iso-8859-1?Q?VAsow2Hvn2o/Rk4+AMRJOV3JaNzbIHa9X8jQMrwPAdyNAgo/uhr3jT8gft?=
 =?iso-8859-1?Q?Z6g0V69KhBsQcHuL+vA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b7f1c5-bf1d-4df5-04b7-08ddd5ae9ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:31.2641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v7jZvVF7WY4WwyNnYcOTxGE6g4RHRDmbuO7v5lFlzQx0XTdxJYh8qtGS0Ak0ZGyYkb3KEwwbgGOJmD2omhGF9cDNEKpswFJLy/L+hcFd4Sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  9 +++++++++
 xen/arch/arm/include/asm/irq.h | 25 +++++++++++++++++++++++++
 xen/arch/arm/irq.c             | 26 ++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..08073ece1f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,15 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	default y
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..acebc3d42f 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,14 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#ifdef CONFIG_GICV3_ESPI
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+
+#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
+#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
+#endif
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +47,15 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * This will also cover the eSPI range, as some critical devices
+ * for booting Xen (e.g., serial) may use this type of interrupts.
+ */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
+#else
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 50e57aaea7..9bc72fbbc9 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,11 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+#ifdef CONFIG_GICV3_ESPI
+const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
+#else
 const unsigned int nr_irqs =3D NR_IRQS;
+#endif
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +50,9 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+static irq_desc_t espi_desc[NR_IRQS];
+#endif
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +60,11 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(irq) )
+        return &espi_desc[ESPI_INTID2IDX(irq)];
+#endif
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,6 +91,20 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+#endif
+
     return 0;
 }
=20
--=20
2.34.1

