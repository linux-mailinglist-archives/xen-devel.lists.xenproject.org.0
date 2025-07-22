Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA496B0D873
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052280.1420910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNU-0002v7-7l; Tue, 22 Jul 2025 11:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052280.1420910; Tue, 22 Jul 2025 11:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNU-0002t0-2W; Tue, 22 Jul 2025 11:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1052280;
 Tue, 22 Jul 2025 11:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNS-0002RD-20
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:46 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b9e445-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:44 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:38 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:38 +0000
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
X-Inumbo-ID: d7b9e445-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMy1hF6v52+JukGYJK/pN/V/TnDN8CibHvoR8T55Pscf0jlcUMq4y5hLTMixym3/5H8ukcTRJmhlbEWyIKzpbFZ8OTxUsjwgAxyr6jIuilgs0DzKIIvEH1PZRSPffPafYKt8f2tRwbUlDkEdJQjZqUQMfLIbJwrK+dQuNrVrVu3ZhR4D04TQhIH0Q6Bjqa+qxbYnwCex+Q8R0MvJQN4wAU0lhQDkMjZLchStYaSaUhP2/SPobmOkavQvf+jJcyWUCpCNVALxlwHAxqp0XdPGkRIMdNfp2aq+dqA/hmbWTxZljUfi9+9wEx5YJvG9Oc8mw9Z3Ayi4Xfr8WeqZTKfSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS5nd8+7GCnypH2t7jFX8XPLarALP1JqJw5pW0mZNOg=;
 b=jjXICJ+vuD+fW7TWLYsYS9jlacSeQvmZH+3g9iIldiCMUm23mh58t5mKj/gcQ3QTnCBR/DInvQqA0a9J3nrmDy/6JqHNZ7fY5M+FiaNzl3pM8VbtmuZ2ISiYsVfrhBvSSmqT6kCqztTh5xMBIPLjUtJdomY11QUXZ0m6zOu/DEIB9fW/fvudx8FENyGs7xbXDAwJO+y4NR3/0G/nhMLT1Z5ZEeOmKLn8XHHbliO9qvO66jMxN0FrUwBmoxpSmKyWDTTbAXOXbViQluCwN/Er0J/Gg7w1nyQJvr1Qt9glOOx+3twruZFgtVlBECmDii33FMQ1VwnsZf49zmMRkNrMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS5nd8+7GCnypH2t7jFX8XPLarALP1JqJw5pW0mZNOg=;
 b=uhz36tR+l/scGeQwjf0qj1dubbu+KwZu3H4lXPAQH9k6R12KOOPRgok53IFxgOs4z67Yk3/TtdW9CIu+TtXRPCMirpWqQMWn5N8ne0Ix5K4Ci7v73bhSvP5AyAnXxpKVcsaRQPSMPyqD9xmu0pKHrU8mm40VRK4wpfsKpBKLAOlcvplcCXfVWFhUt6seJBXBN8/CAyHBcuXwSp4nTf9zIXumq+Vq5hvD5tKjSy2UUM9aHiUbdKeXn1RBo48LOqqLtrwuM43wBESCc0iVAdDTFGMqe75zdlw/g77aZi2EL4FQWfG6iYlVrDItIYv0t+kTY1cAgqpeoEqAUiOq8c3DGQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Index: AQHb+v2VN6PNmY5o9E6echLDtYWg4w==
Date: Tue, 22 Jul 2025 11:41:38 +0000
Message-ID:
 <a6a538ca4c02483e745f18db4f74504dad525fe6.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: fbec80d1-b1ae-4b0e-f1c9-08ddc914b85e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9nYOZAiX/07dRFKEbnlpzJrqHRh0n89ZD2Ylt/HHOZ9SPmj1WqbMzRwNFp?=
 =?iso-8859-1?Q?PVVspBbZy5JAhRMlHyDYeNIgTmCcJv0bpowH3djBLtIqcz23rFFKjvAoZb?=
 =?iso-8859-1?Q?j2j7cI+opczRlQiI3gV27dz3Flapmpm5zTbU2f3nYb1Ig7KImKSxrIVXss?=
 =?iso-8859-1?Q?IxJ4dylQziJ7VuOS215ggUYnhZ16tuH/cfN/yCf1oIjgs28JkXofBssGLb?=
 =?iso-8859-1?Q?BBgxRkxW8gpqVeLrI3XPaMPZ/+N3g3gWCPbSyDmVsfyDLFeVDoySq6luct?=
 =?iso-8859-1?Q?iuB3UfNj4Z26p0/ky7uS/DRdx2TuATA+fGhxbOk2jgllllKVk/E9z5QQqb?=
 =?iso-8859-1?Q?02AneZYtmpGRgzSt9IYWMpM2jMPTsO8A5Fb2pLrTgUiLt9AD6MqK4ZpH8i?=
 =?iso-8859-1?Q?IMCGsSI8HYNFQkS6GO4s0S173UdFlkkP2QCkymXTUiJ9gUFzpVq1c2GyS3?=
 =?iso-8859-1?Q?KW8Fin7RdsIkUvKin03UxH1BRMHv1ep7GjmGGpP93d88plcwIK4VGGsP9w?=
 =?iso-8859-1?Q?TCaAMUXYCttFWIAQ1tJe+C5yLshv5AvgwDLvZcnGn2/nBWk0J5sYrZvvDa?=
 =?iso-8859-1?Q?XUjYXoynjZyBKzLrMCS5Odepyj8zVcFHaX69JP2YZEoP1PomBdMMRMMXER?=
 =?iso-8859-1?Q?hY/1hOxYEBG55SLmbkthn0Jq4o7QQGoJ5BZnFL/2zJkoIoU/CuJMMESYP3?=
 =?iso-8859-1?Q?LJMZVx6yHDrPND4PT8KkaWwDT6gzxyJ00ixvaWEPurncD/O9KfYoV9lmEo?=
 =?iso-8859-1?Q?pSm7yE+Gr0qT9RXMFWJ3Gs87IcSBE4e48PAq22TK9awWF9IZ9YgUhJdzzC?=
 =?iso-8859-1?Q?APfZphHMAAQ+0JnYNfQPfw6PtKbxXJ8gz73lnxXf88FEdJimAlXM+++4nj?=
 =?iso-8859-1?Q?vA/TyVBifXrADjQHCMqQ0IVcNTZNtpk3BEpJLZeoudT7QRgZ5ltXn+9lLa?=
 =?iso-8859-1?Q?7QIIEqlbsl+gQNGMT7ZZVcgzyzGA8VozN06hFPeez3dAOaCAbVi0g+HcT2?=
 =?iso-8859-1?Q?nEVQSuQkEos2/MVkmkp39W7qnVGZsMVUnECDmyE0W4fKXqYDB9ERRJlRX7?=
 =?iso-8859-1?Q?ND88aCEJHLM/zARfhC6AjWyCsBMnuGUnvA3OHpj5XexgTSnO/IS+kqOoVY?=
 =?iso-8859-1?Q?d7YnlUxlLDlBUneVr5RApZSq+jnnVg0aflxeR5dWHfVacDmA3aqCS5aiym?=
 =?iso-8859-1?Q?jD/ayPfZtjJtIoYmkHpVDN5br6t09Y6HtjOOdaXLIRspgxc8+SLdAwwF0X?=
 =?iso-8859-1?Q?bB7vLS9DqftRHzWRcOVlvY94S1cnTF9NA9/R5PnoEuplJDVAysAellmNYq?=
 =?iso-8859-1?Q?INZTk5P8DQiHp1q/NMN4wY1OO9n2gTYaoZrdKYPUAA0acH9Y/0VHtypLMe?=
 =?iso-8859-1?Q?i8z2Aq0VsISJ4+DlD+vZzRLLTK1dGtdrMmvTMWDrd/uJ99341fIwP6U19H?=
 =?iso-8859-1?Q?NuZ4uck4P7/HHlFPIDQpplvMXXuBm7sgr5iu+OdHOmzJT9eUM0470JQBhn?=
 =?iso-8859-1?Q?ruqZUFMbTmnrvYpMPSNz6o362lKFrm5xttwS6qOAigSw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bhssojWqyorBc3XyC8ulsG7NMm3Jw30T0q3UCWjuZMuzhQn9+2ZvQRWpU7?=
 =?iso-8859-1?Q?OSHIT6L9kyVnVKzorontUgEDhXKGnkRdQZMk3nhhLHluksa7NbzpdCTbeW?=
 =?iso-8859-1?Q?wDBl2G8i3t9zOCNT9ooo+4GjnYVyHU6Xcic2d/lDy5fbR3FPjeRGDvZ4FO?=
 =?iso-8859-1?Q?2ojJTYtMTMKHCVidgLklDsRKPDToNWibm6AruM5/4GuUC8zoK7JRLeIv2b?=
 =?iso-8859-1?Q?CUUXFoouEUiAxWc6FSPJL1J2wqxkmHSP0il3CGxqPqCpg/awvN2J0LwT+2?=
 =?iso-8859-1?Q?ivFKI/GY5a8KblwBuSImLcgZiU113lVTNPA0QV7zT7r/IYUhSqFLGQoYXS?=
 =?iso-8859-1?Q?99SXJunXAcfmAJXgCrLjt1N5tafsTZwNKYW1RoFfyq6xDF7kJ4f22tl2d4?=
 =?iso-8859-1?Q?NitVoCl45W0J4VW6/YxERHfJlqBmQ9p72DDPA8gHguBMaTESiL1hYVmwyO?=
 =?iso-8859-1?Q?5nIPybeVNUQBggO2OSAOOByMvxmXypVixBqgxDzSqeTEZtWgeNhWst5EKD?=
 =?iso-8859-1?Q?e/443lhOw4xRZb1wXUWgLVq4Y6NV3zYfEDrHnB35wc5lpCWW5ln++vA5Ex?=
 =?iso-8859-1?Q?AqfwB8STsYW6ASKPftlcPMJOeFuw4zvMWHtMFaFxK2vOQf1V3ClEItiTDj?=
 =?iso-8859-1?Q?e6uuHKSY5aMPA3tVUpAtWdUcvkR7GiMRqVj1h6GKwlp3Fs0X136w+qE3bz?=
 =?iso-8859-1?Q?sxrFPnRus68N2hjmaN0BYsZyDQIJER8RuOpGcRljJbg2RoOUH+mav9ml/t?=
 =?iso-8859-1?Q?ic46HuWE/2Rd3zm4pxiJKdyhmFMXI8yq5bLzKpqh55J2KPEUJQowxZxM3W?=
 =?iso-8859-1?Q?ek5WhYIMbXuuthFAy+TAuZDDFOPApZjNICGtO9L/KTr092Xu6+YjUK5C5R?=
 =?iso-8859-1?Q?88XenHncQXi9eiNOjq8535PGWmWfFE97Bor9Zrp76k94SenRrIalxXEK3Z?=
 =?iso-8859-1?Q?AYeW3yIXN2pprH/0crhUSqFX5N5Mhe2RZfbzxVaQpQyWRAd+8Ink5079Bw?=
 =?iso-8859-1?Q?oyqtwxkmoZ4GqTxthLYBCxicEcmls87oU0LizadQ25bhM4b8jG3/jNY76d?=
 =?iso-8859-1?Q?FTCjZfDyMhA4OUY7N2/7CbEUaEvyDMGbSbR4+mDN42A2FbBVy9Vvaq648p?=
 =?iso-8859-1?Q?sz/l8R2of7hxl4W/burimgu+jweptTQXOIHqEnVN2Ljc7dQwShuucVpvZV?=
 =?iso-8859-1?Q?uTXBBHsLYqYDU3tHkdC91qBLj0N032oz+71Rfcr0jeEqTjRdPQFKcqzjEK?=
 =?iso-8859-1?Q?sQ64X8TWxv/V7+Jc13WyGJJeV285LIuRfKusHxrXe8IzbljzZ05rbZhkSZ?=
 =?iso-8859-1?Q?aesCxwzb6k+TtyVdgkzwjVPwRWUHNNDgqo6445iq9DhtXhet2ZJ1+bJXn/?=
 =?iso-8859-1?Q?AAU16l5Y7IdwiYWEjYooVceLYa8awko1OyV5ZVf4ivOOZAQNRQ7rrtQhfq?=
 =?iso-8859-1?Q?x1/EX6NlsdmuYvp5+a2Vk3Az6I+ZxtcOG2G0+MkKKO6WRaQg9zH7Na2KC1?=
 =?iso-8859-1?Q?8Pr4IgAk+nPiG325t9gxjOs/rOdODRmUuuqkbDw36wH8Tzh6RZVkU+/eSH?=
 =?iso-8859-1?Q?c6oDQ84xuGo0eJsrGjm2wdWZwL5kalLCLPXM+mA/1ueUdZdttJgsEInB+4?=
 =?iso-8859-1?Q?LYU916nozku8AuPkCrgrI/bYt1aAX6dYemVYNigu1Ad+0UW7RwnoEcpg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbec80d1-b1ae-4b0e-f1c9-08ddc914b85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:38.5966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTBm2wtoWCmKdv+jGI1Y8VB2EvIrYLip/b+gWDkVgeVOc8UmdrIKhMjNFRroUqNkKMffOCjaT6Uc3qiAyjlIMZSJKyjiP9NTaZNV9F2Mypo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

From: Grygorii Strashko <grygorii_strashko@epam.com>

The introduced SCI (System Control Interface) subsystem provides unified
interface to integrate in Xen SCI drivers which adds support for ARM
firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
system management. The SCI subsystem allows to add drivers for different FW
interfaces or have different drivers for the same FW interface (for example=
,
SCMI with different transports).

This patch updates SCMI over SMC calls handling layer, introduced by
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"), to be SCI driver:
- convert to DT device;
- convert to SCI Xen interface.

There are no functional changes in general, the driver is just adopted
to the SCI interface.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/firmware/Kconfig                | 13 ++-
 xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
 xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
 xen/arch/arm/vsmc.c                          |  5 +-
 xen/include/public/arch-arm.h                |  1 +
 5 files changed, 64 insertions(+), 89 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index fc7918c7fc..bbf88fbb9a 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -8,9 +8,18 @@ config ARM_SCI
=20
 menu "Firmware Drivers"
=20
+choice
+	prompt "ARM SCI driver type"
+	default SCMI_SMC
+	help
+	Choose which ARM SCI driver to enable.
+
+config ARM_SCI_NONE
+	bool "none"
+
 config SCMI_SMC
 	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
-	default y
+	select ARM_SCI
 	help
 	  This option enables basic awareness for SCMI calls using SMC as
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
@@ -18,4 +27,6 @@ config SCMI_SMC
 	  firmware node is used to trap and forward corresponding SCMI SMCs
 	  to firmware running at EL3, for calls coming from the hardware domain.
=20
+endchoice
+
 endmenu
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 33473c04b1..13d1137592 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -9,6 +9,7 @@
  * Copyright 2024 NXP
  */
=20
+#include <asm/device.h>
 #include <xen/acpi.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
@@ -16,12 +17,11 @@
 #include <xen/sched.h>
 #include <xen/types.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/smccc.h>
-#include <asm/firmware/scmi-smc.h>
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
-static bool __ro_after_init scmi_enabled;
 static uint32_t __ro_after_init scmi_smc_id;
=20
 /*
@@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
  *
  * Returns true if SMC was handled (regardless of response), false otherwi=
se.
  */
-bool scmi_handle_smc(struct cpu_user_regs *regs)
+static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;
=20
-    if ( !scmi_enabled )
-        return false;
-
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
=20
@@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
-static int __init scmi_check_smccc_ver(void)
+static int scmi_smc_domain_init(struct domain *d,
+                                struct xen_domctl_createdomain *config)
 {
-    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
-    {
-        printk(XENLOG_WARNING
-               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
-        return -ENOSYS;
-    }
+    if ( !is_hardware_domain(d) )
+        return 0;
=20
+    d->arch.sci_enabled =3D true;
+    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
 }
=20
-static int __init scmi_dt_init_smccc(void)
+static void scmi_smc_domain_destroy(struct domain *d)
 {
-    static const struct dt_device_match scmi_ids[] __initconst =3D
-    {
-        /* We only support "arm,scmi-smc" binding for now */
-        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
-        { /* sentinel */ },
-    };
-    const struct dt_device_node *scmi_node;
-    int ret;
+    if ( !is_hardware_domain(d) )
+        return;
=20
-    /* If no SCMI firmware node found, fail silently as it's not mandatory=
 */
-    scmi_node =3D dt_find_matching_node(NULL, scmi_ids);
-    if ( !scmi_node )
-        return -EOPNOTSUPP;
+    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
+}
=20
-    ret =3D dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id=
);
-    if ( !ret )
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
     {
-        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
-               SCMI_SMC_ID_PROP, scmi_node->full_name);
-        return -ENOENT;
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
     }
=20
-    scmi_enabled =3D true;
-
     return 0;
 }
=20
+static const struct sci_mediator_ops scmi_smc_ops =3D {
+    .handle_call =3D scmi_handle_smc,
+    .domain_init =3D scmi_smc_domain_init,
+    .domain_destroy =3D scmi_smc_domain_destroy,
+};
+
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-static int __init scmi_init(void)
+static int __init scmi_dom0_init(struct dt_device_node *dev, const void *d=
ata)
 {
     int ret;
=20
@@ -134,22 +127,36 @@ static int __init scmi_init(void)
     if ( ret )
         return ret;
=20
-    ret =3D scmi_dt_init_smccc();
-    if ( ret =3D=3D -EOPNOTSUPP )
-        return ret;
+    ret =3D dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
+               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
+        return -ENOENT;
+    }
+
+    ret =3D sci_register(&scmi_smc_ops);
     if ( ret )
-        goto err;
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
=20
     printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
=20
     return 0;
-
- err:
-    printk(XENLOG_ERR "SCMI: Initialization failed (ret =3D %d)\n", ret);
-    return ret;
 }
=20
-__initcall(scmi_init);
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
+    .dt_match =3D scmi_smc_match,
+    .init =3D scmi_dom0_init,
+DT_DEVICE_END
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/in=
clude/asm/firmware/scmi-smc.h
deleted file mode 100644
index 6b1a164a40..0000000000
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * xen/arch/arm/include/asm/firmware/scmi-smc.h
- *
- * ARM System Control and Management Interface (SCMI) over SMC
- * Generic handling layer
- *
- * Andrei Cherechesu <andrei.cherechesu@nxp.com>
- * Copyright 2024 NXP
- */
-
-#ifndef __ASM_SCMI_SMC_H__
-#define __ASM_SCMI_SMC_H__
-
-#include <xen/types.h>
-
-struct cpu_user_regs;
-
-#ifdef CONFIG_SCMI_SMC
-
-bool scmi_handle_smc(struct cpu_user_regs *regs);
-
-#else
-
-static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif /* CONFIG_SCMI_SMC */
-
-#endif /* __ASM_SCMI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 2469738fcc..78d5bdf56f 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -21,7 +21,6 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
-#include <asm/firmware/scmi-smc.h>
=20
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return scmi_handle_smc(regs);
+    return sci_handle_call(regs);
 }
=20
 /*
@@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled =3D handle_sip(regs);
-            if ( !handled )
-                handled =3D sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 55eed9992c..095b1a23e3 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.34.1

