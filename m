Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9194C625D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 06:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280087.477964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKd-0005B9-AQ; Mon, 28 Feb 2022 05:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280087.477964; Mon, 28 Feb 2022 05:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKd-00055l-3C; Mon, 28 Feb 2022 05:12:23 +0000
Received: by outflank-mailman (input) for mailman id 280087;
 Mon, 28 Feb 2022 00:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLaL=TL=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOTsq-0007Sm-O5
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 00:27:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329673d4-982d-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 01:27:23 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6460.eurprd04.prod.outlook.com (2603:10a6:10:10f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 00:27:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 00:27:21 +0000
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
X-Inumbo-ID: 329673d4-982d-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSfyKXEm88+iJ7OIfLAfKPjFKy6RT5jXGQrj3rrU4e1e6zsWPs+qo/1lWctfGLczFqStJdiZVAGZmRNYR4SSm1s8XbuGCo8UzfDFL0C+jP9AHRH8UVS9acrR8Pm52Y+Xtpn9+rBWcdP0vJG3Pkgd7EQHZUuWIAe2Ufp0sPRAKh2vcCdCBp5BDolmNVVfluL6uKk/tKleQJTdZyoL6PuB1xwZPzVsHtQztlYplQccPYwBde8E7E41mD/S6JbE3cvKxsQcuD67s1JygD5XqSKI4PWg8NouI1ujmPa5MCbPQ+5JcU/Yq3rwTzPH+MOYDf/+juL5WHabtlj8hw3C1+OJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQTF4tiGiA6bqr8wGDrApHkfcsxMIqMshDIrr4CmuTU=;
 b=Ok9F2B6SgOKau2+gFivh8Nj97bBBDFK1K+TzC/pedVZbh+YfjAoplkZYXQkg09I+X3bgr9eyWCHQFYNZezPHFt1keART70YDQWjDud3ypu8XaA5H5xxLuG5qJU3R8OixD5V47Q8Ua+1zqn7ZcdLevjQrkqSiQb4Oms2Cy6jw47cl7bXFoTnrhZyiJigLYpVgls83dWT5I4o7Q5H+GPFhnFJ17EFoA7gj9wmAVRnfDW9VzlRX9qVtc/3cE6/AXvUAPbilL9uV+7kgaoifHOBeBMbavp5eHs/O8i9RrSvRD7hXV1ltKJaOhlhMaM8fn4O9yH/wzpXlAjPtQtkA7gHB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQTF4tiGiA6bqr8wGDrApHkfcsxMIqMshDIrr4CmuTU=;
 b=mPFwL/knohds/yZ6cjH9EZfWgPMgztle4PWcW/4akid82CmmafCb66jBQUZTAlwikDYvJdBw3xZO3qHNzXEYqI36Fl5KUlC4Vbxt+23YuA1C+JbnBB4r+MmTkJIK4kksKS5js+lKlQBsNVrLr79D4CDy0td336lw/djVXew881o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	wl@xen.org,
	xen-devel@lists.xenproject.org,
	van.freenix@gmail.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/3] xen/arm: Add i.MX lpuart early printk support
Date: Mon, 28 Feb 2022 09:07:10 +0800
Message-Id: <20220228010711.11566-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20220228010711.11566-1-peng.fan@oss.nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c43f520-0d5a-4339-c7f7-08d9fa5115cc
X-MS-TrafficTypeDiagnostic: DB8PR04MB6460:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6460E824D623CF2499BDE905C9019@DB8PR04MB6460.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJ6oA1A33nHN2+3zo9pJwh5y2Y+PfNAZxMIAlUhF6wmiHrXftDIFkofJprp1nVz+WNAPQ9DlnEM09NuOKnJpFbZ//Pk12lh/LycCskzwTQ94skEcmdYQx9GV80qP25I6YzxSD1x3FlL7A70auw95a+qUH3LJ+58Uim4FHBW4Fk9hyeIKRD16tCCWlpFxF0ubfo+X5qyvBO4vm6clGJkkkJzzsg5ZSzYUb5LkhvgTPOVX8HgRNVG8la/hWeO7bS9TURevvIAKqS5dH3bLxKYcosOHKAm9A8NPcL3UpSblFISwKsQl+cAmI/SsJ0yQGhHxD5A7Q3Xw+6szWi0PQ8u9q8xqz7mVuNXY4GARx49C9nH/K5VOx82vc5o7XJXmdOOwC5oXdb5BwPpGJX07nVPBgRHI/VA3rNu4jahEhyQAUjP/RH0hD9LFSjgykKm5VhhQdHV/8HX2pZ0cYhUE02sR4C0JZYxl8jfFh+hjx8fdcM1ori/SEIfBalfIVkU01jYg53hC9Y/SGUKntN/9h0EGQPWPi1iPhbBRJS17b3cp+t2JRckqShWXiQ1WHZCmtiYFaxPFf5hf383QjS52MSfnzSav/GsO7rNMWUmc6oBX3eLMcR5Y1xIsWUa8HtiOjAFUmnL+gXzZw0T7bM/aKAT6M80/wABaEGHRQ/dcGWyrYqBEOkWYWQZyI0ol/41rQDLUbmogTgkSlyudnXEvUHvBd6yr93pHOotuqK4aMlPmYIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6512007)(6506007)(6666004)(316002)(4326008)(8676002)(52116002)(2906002)(2616005)(1076003)(86362001)(26005)(186003)(5660300002)(6486002)(38350700002)(38100700002)(8936002)(7416002)(508600001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ox3s7WlQfZ+VfDVreq/oshTEe6eoZyEWMJ/7hudbrfqrZ1RhIf03X1uOkNhL?=
 =?us-ascii?Q?r3jU2UTYSQMIGmA/vN6RyEjf92I9Xv6LADRUlIQfNILnOzCf9dDEpiKI2+Gz?=
 =?us-ascii?Q?0HAWfZe89GkPE67OaeJQhr1PAFsquIRx99FWp+7wm4TL9d03UE+ubR9/ZY1M?=
 =?us-ascii?Q?D34M+SU1+NtYxGt/ZQMiT7hpM2jDeN1QVczwGd63ApGvDJraxk4dJu8YQ6z3?=
 =?us-ascii?Q?v1xKoAahTwz/BLqmhEk4OSnsXLoGSe9fFByDMGKWaAR7k5fD60zDc7PBi1f3?=
 =?us-ascii?Q?LmdrD8oSqRUeBr/KMQ1lhg1wfIqo2oa7mbA293/MTp+jyiYZXbHj1hmlLMw0?=
 =?us-ascii?Q?tVVVuj9MWunDXFQ/Fubzh85EB8R9pmT+fd6EXYoGlXBUi1JkQFmX7fxL6AB/?=
 =?us-ascii?Q?Bsm0LYfLVCesTCcxTNJMeW6+GdQ9ZcWvTehunVAlnz9AOe8KCexiBbK8w+hU?=
 =?us-ascii?Q?DckZBrPUPqS//hTh+5KOBKV9rk16B9i4SM/UE9Bs8TIu36JsDEFIj1ykCkU+?=
 =?us-ascii?Q?zVuCJenXUbMLS5uFnfJUZtGJZwRr1UaCBnyR7nB+lTn0HTu3Gqk058qnK4Bd?=
 =?us-ascii?Q?RB9BSsI9CF+HuXuumzft8hY6PTQm9r4lMQC7sONn+tMs1eMHfhbPm2EdustL?=
 =?us-ascii?Q?U1eZDQdWl3arb39q4PqO9tCGiteuR8evkT0L8pfmO0gxLi6GJB4pBuqugzes?=
 =?us-ascii?Q?xLZQMjwYgF6IhNe1Vxeby2Uz89UXu2DIdNXCyNQcCPVMYzOarGpwVrlKxZVd?=
 =?us-ascii?Q?hIhEH9h/ufZdZvblvUriDOhEvgRTqbiVGzaPkPPz8cRNhRjuXKMwbIDIh8Li?=
 =?us-ascii?Q?lXW1FaQg9oM7jeJFDF4A1fz+T1XFb1XtG6zNNDeLXF1vhBlFzgNIHaHgTsej?=
 =?us-ascii?Q?0nHmHqmfV2BgRTePlqRcd1wuLarA4T1YtbyHVwFq29mPmfswfAykh70lUvQl?=
 =?us-ascii?Q?pta5k1HjNAcZFEtju7Ov/9GQr8ASWmgI7V8ulXu4lzTFx9bpFhnDY/7hRV+L?=
 =?us-ascii?Q?+9PEn+faV0fR3kBjwFoz2IdVECHxi9kLG6yKy9A8C+1oHco76G79g1Ic6M2B?=
 =?us-ascii?Q?xBHGqgepqTa2gfNf9EKTQTTmu0J6Wb8QLgt4nqGpc+IA6/wr2f378FGPeREy?=
 =?us-ascii?Q?j/8hVxUcXSByCroi/Vbc8/LXnv2diz2/sUEHjxnNTGk8zO2BWmgfE3JEqsTj?=
 =?us-ascii?Q?U3ih+ba6u/GTlS8VhFz7T9N0276v9Uc0FUqm6SXbH5W0OOt5/Y58U0A4mz0V?=
 =?us-ascii?Q?j2FYUN4EJmdgquCgtFDIcLWUxhsIrSyCK4IlGC0EZvzhQ6lJsDQmzBhITFFS?=
 =?us-ascii?Q?718Q2404oyNz6wKubXKrGrhSgNtRWeRc97IIbDETCm6DIapcAnnb5kTZKLJk?=
 =?us-ascii?Q?uADE45L2pYEkvEn4f4lJdK3Aju8m2nnzPCr6RniEJ42zAYsqX1NJOZyeABxA?=
 =?us-ascii?Q?FzARX5ksPipfLPQYfcXKvYHBhu6sO7hkwQgTtSMvzPA+QR/WtFV5wCEgmM3A?=
 =?us-ascii?Q?Oy2Z2VwlY9XQhR+fy+VV9ScxRlFX6+pXoX7HqxmCr4ustgB9ekxc3Zp3pKAM?=
 =?us-ascii?Q?JdiliP0aUMuPfY9rc4IVg1s7cZI7ab+m2JuRgRztsSrMzxyAr/pPOtrbRnTE?=
 =?us-ascii?Q?FEpZfntLRfRObnEbhbHXu6I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c43f520-0d5a-4339-c7f7-08d9fa5115cc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:27:21.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQDVnKWb2+ruoBIbLr+n6Kvrranrf1p0OwVzodIRM8BZZe/BTHabB8by4SBJ/8kLJ2rrR6OE+ikFJRRuq0+D5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6460

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/Kconfig.debug              | 18 ++++++++++
 xen/arch/arm/arm64/debug-imx-lpuart.inc | 48 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 35ccd13273..9ecb446b3a 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -55,6 +55,20 @@ choice
 			selecting one of the platform specific options below if
 			you know the parameters for the port.
 
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_IMX_LPUART
+		select EARLY_UART_IMX_LPUART
+		depends on ARM_64
+		bool "Early printk via i.MX LPUART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a i.MX LPUART. You can use this option to
+			provide the parameters for the i.MX LPUART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
 			This option is preferred over the platform specific
 			options; the platform specific options are deprecated
 			and will soon be removed.
@@ -186,6 +200,9 @@ config EARLY_UART_CADENCE
 config EARLY_UART_EXYNOS4210
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_IMX_LPUART
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_MESON
 	select EARLY_PRINTK
 	bool
@@ -283,6 +300,7 @@ config EARLY_PRINTK_INC
 	default "debug-8250.inc" if EARLY_UART_8250
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
+	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
diff --git a/xen/arch/arm/arm64/debug-imx-lpuart.inc b/xen/arch/arm/arm64/debug-imx-lpuart.inc
new file mode 100644
index 0000000000..7510210d46
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
@@ -0,0 +1,48 @@
+/*
+ * xen/arch/arm/arm64/debug-imx8qm.inc
+ *
+ * i.MX8QM specific debug code
+ *
+ * Peng Fan <peng.fan@nxp.com>
+ * Copyright (C) 2016 Freescale Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/imx-lpuart.h>
+
+.macro early_uart_init wb wc wd
+/* Already initialized in bootloader */
+.endm
+/* i.MX8QM wait LPUART to be ready to transmit
+ * rb: register which contains the UART base address
+ * rc: scratch register
+ */
+.macro early_uart_ready xb, c
+1:
+        ldr   w\c, [\xb, #UARTSTAT]   /* <- Flag register */
+        tst   w\c, #UARTSTAT_TDRE     /* Check FIFO EMPTY bit */
+        beq   1b                      /* Wait for the UART to be ready */
+.endm
+
+/* i.MX8QM LPUART transmit character
+ * rb: register which contains the UART base address
+ * rt: register which contains the character to transmit */
+.macro early_uart_transmit xb, wt
+        str   \wt, [\xb, #UARTDATA]  /* -> Data Register */
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.30.0


