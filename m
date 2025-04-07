Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC54EA7F06B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 00:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941216.1340765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8w-0007RC-1S; Mon, 07 Apr 2025 22:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941216.1340765; Mon, 07 Apr 2025 22:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8v-0007KD-Tm; Mon, 07 Apr 2025 22:40:37 +0000
Received: by outflank-mailman (input) for mailman id 941216;
 Mon, 07 Apr 2025 22:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1v8u-0006OT-Ux
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 22:40:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2607::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 520ed6f4-1401-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 00:40:35 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10914.eurprd03.prod.outlook.com
 (2603:10a6:102:48a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 22:40:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:40:29 +0000
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
X-Inumbo-ID: 520ed6f4-1401-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE7gybsGsogEl0uXSFDarZgloYGlBOdulJlo088AhOE0EIG+faPALcSzbidniWdpO+X46G8R29qtu3CvXh9f5SIqPMGRX3hjOTs7mjU684aeHBxpehx/m0nuSl0v2cIwt8PsEJ6/oTdxaC+nkJYIp2nVE4EFmZg+92v1l/pTskRwD03vwvo7LgZgth9esri2OTX9bHraXaiskwsPo9FetODuXvuLy6UFvxsWnGBQRdZz6WuAT3F0WSToZV2vgJQJtQghhvh+NR3fBJlqyfmZFjOsnk2jSyije5UJREdX1O/GKGF/b1VMDgEx/CeD5H9mfpn7M79oYWMypI//jyj/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjV3Ix0lRqsYcfZ9MZ3oHVWnpUgcHjwvqWZ+xmEudlA=;
 b=bkIZ4z+u6qbkUz00VEngaWvew8I8uwGlI6MlKxY22vk/4icxIau7K+PBQGWk8oqyI/56fNC0wrMTuYEwlhknQoAV0H+dLldJwaz5ZHomwt0KE797RWgsAbr7dUjIoaS/W7JKbD3C6wARdZhWQsT35igDqrwAyZCN/hmUccUqQDLuMz3LxUZVCJdwLmP4yMniQa2o9pt7uR6M3TmoPBH25rvFW0w4KXHYn5uECiFpyUBg6wDjbyl0LJcz2Ev4rRwm2qsH3ysWHevSPIh0hIMvjDXS3oaK7YaWnRSI9MNSTFJQGO6kA808tMP+/yi+1zSzQ4qi7CgjAv1vtHUnM7ceTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjV3Ix0lRqsYcfZ9MZ3oHVWnpUgcHjwvqWZ+xmEudlA=;
 b=UfTvoMRFLSs3H0jHYdMa2ansjgnE0U7hJn4SKbUOulMF/QUXoQuBMU7eeGMa/Kkv737yHfZPpjhHH4N3VhUauRVpPrcTCPgFdAwZVdRRrZMoHtbF+w9xH8kkFzi6Phm420De6LSjJJRPUUXikhXXL1sebl+dtkI/xyl9nEBY0Np2UY2pNLORbbJgG8le5WU+YpqpGN4n1bp9LcrK4AFGNa1hkpCHwehL3xUG+DoUoe+KfVMVI7S7oyS1Jycz/ghBnrfYF1xRwbYKC0sF+B5dY8EwaY9zSIzy9XYcFbqUlYcT7xMY9KZVNY7Injf83vDXB0bz2TBOd9i3f9sGMjWLTg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 2/3] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v8 2/3] xen: arm: enable stack protector feature
Thread-Index: AQHbqA4PPDkWtASJxk+dJciG8QkunA==
Date: Mon, 7 Apr 2025 22:40:27 +0000
Message-ID: <20250407224009.2577560-3-volodymyr_babchuk@epam.com>
References: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10914:EE_
x-ms-office365-filtering-correlation-id: 6893f7bb-b108-46c3-9480-08dd762532ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K6UpvI6hRHc4TDBRIr51QBiAJa1HgmXP3//TpWzJi+YJxjTz9G41r6I9Xm?=
 =?iso-8859-1?Q?0J3biEaNRcjapGNeUT/o8driGpa2SPLM3ocWoaWmfqfJIjEXa6PBkDB/5R?=
 =?iso-8859-1?Q?fP6mqLDMaqYs3kGDb6mLzBUzPoHqI2cP7TAkobiGbxLQq0jMH/qD8PtrTG?=
 =?iso-8859-1?Q?ha5SLKKNYIxYbV6/1ygWHW3tRQIgi/p2S95ZsfHO7TlFtfgdLqOVlKIsri?=
 =?iso-8859-1?Q?5unz5+8q4ve2LYG5GgLEklK0XgOZZeDXTdznGUQHSrbwL1vknhLzQn47/n?=
 =?iso-8859-1?Q?kzVZDT1EGnTtLv3MEyDUwHQO/XOy5/yjE7Sa6gjCdekmZSh3zy/+48DZBB?=
 =?iso-8859-1?Q?ZGfy7IZV4HUHTtTy2fPpzN7VTMcDowfmqVd/g6l8Z25SVvjcDnZGVdLXvl?=
 =?iso-8859-1?Q?hQve5hQuDK8MwhwnXbq2bBCkRFQ/c7IlGjFgtXSNz4pXLeVRB8R5tBV2h+?=
 =?iso-8859-1?Q?tC7kbUEh2EOmPYu8eEbBkGIXHGSyaPR+9hK/hYhVShP6rFlZIbe1fKFZgq?=
 =?iso-8859-1?Q?8z/vZ05DRze7I5fXZmQEz7Gfow2z+D6pxlQsnorZr08fO4rGkb/aLVMbFF?=
 =?iso-8859-1?Q?I0FOFw49+0tRxh5hzfIvdGshO2MiTI9e11R/gNsNdFtaKKA8FdCZdz3SWW?=
 =?iso-8859-1?Q?2KFeAEG0ld58xh5IdQykwQxjV8wx3XjH04elbKgthOwY/vLh9mhHm1V6hm?=
 =?iso-8859-1?Q?e0atbEGtflvD9WqbOaYvc/Nwb5n8RldZ8nT/DCoJh/zlM06fa1NmXwiCpW?=
 =?iso-8859-1?Q?k3cR7P7W9K13J5F/gEFiCjWp927/E7mDQ6USTaWrvIzxNjI/pz/Mr14srC?=
 =?iso-8859-1?Q?bLK6lez5JFlKagKmvtlysKZQNtpMoFcTl6Yqq8d6j77jx0uPoU6UIJqzrd?=
 =?iso-8859-1?Q?D4FZANVHd71P9JkwPSxZ7+O4u07bDle09YYJsEqU44rPzbWRWv+LSijwik?=
 =?iso-8859-1?Q?zbDabQXGrEUGvjA7KD7xAKayOLC5kwXWYJTWklYZdhmzvE3+ILj4hqmkQZ?=
 =?iso-8859-1?Q?5SmWnLL+kR670MD3ZIR7oVDsVU3+1A3+dcWImyA/oEbemvKqNxGC43KQU8?=
 =?iso-8859-1?Q?VAuZaGVRprYvRC2iNQUaD+Z/YTDGyObEwN8wv7PH2lzmDYnsyRTQCVUhel?=
 =?iso-8859-1?Q?XPvGnkzCv1vMAdmZSwPLKi+/xf+oAsSC3k+XwBQKrLBZNmlOd/cewM4SSF?=
 =?iso-8859-1?Q?XqrTfbAB8ZJJLigu/ojcRMYpZUKanto65Cf9uZbwL8kYUygXuNqDgBAkoZ?=
 =?iso-8859-1?Q?CHL9BNFuBRSNdiMmIcO7OJLT/GQjL/Kmo3fPNU7u5o0Lp7yalTVg0pUj1H?=
 =?iso-8859-1?Q?CCPN29RZffXRzjZ6Aj0MH7pVQd7x9D9YvCyhlnwe1Dvf2AjtH/KO4NPIWk?=
 =?iso-8859-1?Q?uIqdb1o6QOxtYm12c9iK328jICA6Z/vmozFdIRuRsoSlXqAcejR8Egpi5e?=
 =?iso-8859-1?Q?98UJayR0cuOtFQtdn611WT588hPPbfZulD7u5NJOSzrxcCRWZaYF2PZLfj?=
 =?iso-8859-1?Q?7HKXa9CF83U1hn1z+n++ie?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0f4GxzvFto9CI5lHs/1dFvhl3KDwkpQnIwZVRTAcXWEYwtx1DWDmM8ZkzX?=
 =?iso-8859-1?Q?o1WUYCTNEVyvS8/fUvFI7DkZA4nWt7tH8N8ih6NgVy0zLA5ve7Og16PglT?=
 =?iso-8859-1?Q?qn3SHHtgW/g/lUpYxEVlVSuD8MEI59dOWEjmbMrLXLe/HD/gwAyokaQ0HG?=
 =?iso-8859-1?Q?k7rx3ai7uYM2GFYXvHT1X8PovIHOWztYRtAe02Pk9vcr613wjASjRneaDf?=
 =?iso-8859-1?Q?hr4Knkuhn2VdIwrJj4kn8t+Bi/v5AHH8C4xriKXsW0mlcZwZ86EJa4gruV?=
 =?iso-8859-1?Q?6cTy4cnhMFV+UKnAVIgFT/i/VyajvYdQ5LIIz0tDRKp7hpQfbF1zvsiX5w?=
 =?iso-8859-1?Q?79sLhUiVjAIeFTnwz3vg3O2K7d8woZhvXMt6UmI3EU2WVAzjL8xm1IPuFp?=
 =?iso-8859-1?Q?zknsqn0vga50tcFXVK8JKLBMh5LbQpVuesZB97fc9U226ioU9fIKMZ5sFp?=
 =?iso-8859-1?Q?3lndG9K0qZLYuXlRJU1zK8gg4iY8eZjPv8AYEBazvdjUM5s85fuGUoT5ep?=
 =?iso-8859-1?Q?il/ckuaWiMUx/2B4GQ2x6ukOmEqr3qkAAJ4TiVg1qun1FTXKwyeEJ+pdEO?=
 =?iso-8859-1?Q?o5fT3TbPOu2qO3o9Al6rJokXXZXPiSpT5iDfQ4SZFMU/xjwBXM50OAEO9S?=
 =?iso-8859-1?Q?O6avRIKhdMlKkFiqXrJn+y0szbepHhQrc0h1GtoRequSX/1FB4nSj8gi75?=
 =?iso-8859-1?Q?qxkq9FQAzq3NtR99gmzlA+o69eFp4h1bREaFbLyFsOWpBWU6KGKIzoZkYp?=
 =?iso-8859-1?Q?/xVHSpbFoYoUIlDCHGnizHA5W5omKSDkPVmyhMF5z8qTprz2OkNoOZTdpz?=
 =?iso-8859-1?Q?LL+WbngDYoqtaV3KkMAJF76fi/CCbdf4n9YRI0df+NwIgORyzN5TZ6QDXx?=
 =?iso-8859-1?Q?J+deyNK6x3SIgpayOMgUw9BY4oe24PISPn7IXu6LviiQX4cFLK0xpvVK4C?=
 =?iso-8859-1?Q?UE2yfbAld4eu7xfMTCFlZ/ZwhJr1eW9CFAPZVk6xaohAQwYKG1KVKfjkZd?=
 =?iso-8859-1?Q?KRgjdedHDbOTdZz+tCRJBeHIuL+4lX5/+Xjj9xBZzU92t7Ix0w9yR+Psa8?=
 =?iso-8859-1?Q?Go1nuxZyRMbWMcsd5vhxqXxMaKemF33O5DxzIImrGtYL2v7M7EyzUgpHkk?=
 =?iso-8859-1?Q?GC/DCo8ecHfFdzNnKr/Tq/uaNn03dkSrGCkL9DM5/genA0SSgVnqRpYstT?=
 =?iso-8859-1?Q?wE6IIhJ4STgrXmZ9nq5TaG0VLKNJeWKgX1rNVdf65u64AbNfNF+6p4rEgn?=
 =?iso-8859-1?Q?9xI6zIDHqfiS7p964/0eHdNSCVX+AkO4Rfo2AIs7wvTs7ph2KHpe2h9Y35?=
 =?iso-8859-1?Q?6mgpEPZo/nGzJgKhQUdSYiaY3sv1QgOogPEdqDJV7lujmvFyDW6qLZ/x1A?=
 =?iso-8859-1?Q?8vGeYmalC27Mnd5NalaAiV37Kf83TasO5/FIIMJ7YmNq9pQeikPD82ocl/?=
 =?iso-8859-1?Q?xh77Dm9vUk4sWgI+0W0Bhr5hoqTSlebjTUWzp2sb8lrQrTCQ42LwY63RB3?=
 =?iso-8859-1?Q?mgCzlh6jkWADWzvuc2Af0couM15TiyLOyuQpHfyM0Hf4Ql5irc7BgYWHQe?=
 =?iso-8859-1?Q?wXLzhmsCKs+/WllwEak2lST8H23KTlldu6kjSStkVEYtEgRCA/B/KDj3UP?=
 =?iso-8859-1?Q?o9CYooUj6whP3fq8UJIObYhZ/Z0E4AD9uty5U9Ry4xWKZeedkSUkWr9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6893f7bb-b108-46c3-9480-08dd762532ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 22:40:28.0205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+r4/tRAhvAUz0jyjKJ5GyK2iQTpSbjXl1Q70rI+G4s+pgF0jh/i3esBiFYd9HG+xznv1g+i8sXWf8M5yGJIF8B7CBVMA8AqJ7OabmvJsgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10914

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Initialize stack protector magic value very early, at the
very beginning of start_xen() function.

We want to do this early because prior to that
boot_stack_chk_guard_setup() call, default stack protector guard value
is used. While it is fine for general development and testing, it does
not provide highest security level, because potential attacker will
know the default value and can alter a payload, so correct stack
guard value will be placed in the correct position.

Apart from that argument, boot_stack_chk_guard_setup() should be
called prior to enabling secondary CPUs to avoid race with them.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---

Changes in v6:

 - Expanded the commit message
 - Added Julien's A-b tag

Changes in v5:

 - Call boot_stack_chk_guard_setup() from start_xen()
   instead of early ASM
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 565f288331..da8a406f5a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
=20
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index bf39d41e9b..07703a15e1 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -30,6 +30,7 @@
 #include <xen/virtual_region.h>
 #include <xen/version.h>
 #include <xen/vmap.h>
+#include <xen/stack-protector.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
@@ -306,6 +307,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
     struct domain *d;
     int rc, i;
=20
+    boot_stack_chk_guard_setup();
+
     dcache_line_bytes =3D read_dcache_line_bytes();
=20
     percpu_init_areas();
--=20
2.48.1

