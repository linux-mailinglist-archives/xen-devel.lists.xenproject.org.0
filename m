Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B2609E88
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428802.679318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuL3-0004MT-Su; Mon, 24 Oct 2022 10:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428802.679318; Mon, 24 Oct 2022 10:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuL3-0004Jn-Q2; Mon, 24 Oct 2022 10:05:45 +0000
Received: by outflank-mailman (input) for mailman id 428802;
 Mon, 24 Oct 2022 10:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omuL2-0004Jg-Dt
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:05:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b072a1d-5383-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 12:05:42 +0200 (CEST)
Received: from DM6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:5:80::48) by
 PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 10:05:39 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::3b) by DM6PR08CA0035.outlook.office365.com
 (2603:10b6:5:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 24 Oct 2022 10:05:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 10:05:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 05:05:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 03:05:37 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 05:05:36 -0500
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
X-Inumbo-ID: 6b072a1d-5383-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giqtVBAxTHKspMB9wB24mQFQHYWe45oZpxMLgvyzz62TILr+sxlRpbJA1odjxhvukp5sUX0N1wugKuCUJkG2Cj5f0x8cWpE/GJwmNLs+oy1nNXBdV1Mc0V6m8NG7r9IXjqcrQsVYQI8fJtKNDYzvBGa7nYQThAp4HpN7aedp7ivPSIYbMDJ0DVKbe2KSQTUGYjDR9F83K8QRwwpX1eS15syZlMc/mI/13Vi1mNCdEn7Zu45SYau7irfF+6TB/OW8CfnP6fhpduMDPYRYuuylnkM1sT+KHfq9KhjQLQDKDfb1tu+68kqNbBiR973gtV8Dl0/lFnkC0NXm0f5FPRQZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxdh7z1RpU2y6bgq109Srd+Y2p8XscsWMuLz0iwZ6eg=;
 b=ENoswiOFlTQ+V5LeUWuR7Wk/XbRR2pij47eyCHmsNC1rlFfS08rUD6kSxZG7Yz/IB4R9dYyRBXPUWqy6oK2JNeRkiv6j3P4m6JsSSGV69soeXdYVYN6O4JU/683IGiO0IUYGcDl3B8Ff/8TalqlelTSU3ymfE0NozLKEE+o/T2q/x6C/KZdT/9LhQzmaF6Tk4qB/eE1O5U6PKfnQUu34GkEYqr4xenOVdVwlp+whlM9FUG+uQfYQIjKVsne9vpYfmWQHwQWSeVgOQoJLnPmprY01p5lfPpPfMDH8mRg2gOXQx3Rgi3Adg0XgDvijjkMzJwJdwWuqMZQTb7tmgblcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxdh7z1RpU2y6bgq109Srd+Y2p8XscsWMuLz0iwZ6eg=;
 b=gfEFl4PwNtNG+CXAtAnQQLjFdjAjRepfsZ6cIurVOQjh2RrTRFzlqoIfSrXos9GaGTmjxTYPk8+7HrUd0cxnX+SAtEe3UkHrOfz6/74HU81TZXVikxSi1y8AcIBMMc08fPuekjSRW7cJwKVpxM+yPRiY/607prLs/ykDii0Ay/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded values
Date: Mon, 24 Oct 2022 12:05:36 +0200
Message-ID: <20221024100536.12874-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|PH7PR12MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf20d81-8ef9-4d19-49ea-08dab5a74d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJBDclfRBPaEZWBbmS+LjwexHEv6CakCJApyTZR9HAmPE6zwu4ViFc41EMXvJNFkvs9uGNHLsuib6ojWwIpxsKavSexe94qY6c7mpjsRabVKMvkS5/h1aVao4oxb+hmROR4m1dKjVBNQF1r9S11b5A8m1VrRV+VZJ/MVij+GcUTxyEJtQuqt2Np8qOKCCr9OWqW1kYHl0HLsOHpaY2eTN8mPaiZvXLuHjKJPu2kpzKwLgWotRcyBUmytT+0SKUJuLjyo5Y2W7rWWcsjROzeq3DE2CiK1AM/HJd6c/t6RP8FYGPuVLfK0knji3Rp6h0UcYoF/W1SN979et4XWZvbncXsFjL6LEfGjC8hxONUz+zm//1GASwQCvigF3kr2A2F8mxTP3T+K5JcPvbqyFkrlJIuc5paVs5HeWI4TjjY1Dy6y9izrrPboQmXWLuesPIPBeXvQ/0ChbBGuISBEMp9lgSE02ShPpkTxhJHgnpquJWHtBpJb0872hKoEOj9RLkhHlaCh3AjckByi8+r3HbH0Z0J6PRbmeY7+s7hF0PqWf1BVaGlonpBdeR/0QX83930naa9CCXJcALUZc+ZIzE8w7mwpK8PpTJHm4lDfeQbcowzt56LupReFoGOSL7xFuNtIE7TBpvLEmOYUQl66oVbQeUwPWudF4KFcbfzS0WLMZifvEoEYkv4RfVNqR2+B9UAfA4v7GsnTx5iznRSI1zTcScKVTNHmlWBUhd5NOK15uH9t6ziuUHQl+1kJwma4bhqYz+YMoi0ADUSleWNuPY1O+6HsY4SUj7eNVOirTFYYDEZrHAYz42WOgo+lgvhJG9s9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(186003)(2616005)(5660300002)(47076005)(83380400001)(81166007)(356005)(86362001)(336012)(41300700001)(36860700001)(426003)(1076003)(82740400003)(40460700003)(2906002)(44832011)(54906003)(82310400005)(8936002)(26005)(6916009)(40480700001)(70586007)(8676002)(478600001)(4326008)(316002)(70206006)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:05:39.0836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf20d81-8ef9-4d19-49ea-08dab5a74d8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954

Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
the values. Also, take the opportunity to fix the file extension in a
top-level comment.

No functional change intended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 1928a2e3ffbb..d82f2f1de197 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -1,5 +1,5 @@
 /*
- * xen/arch/arm/arm64/debug-pl011.S
+ * xen/arch/arm/arm64/debug-pl011.inc
  *
  * PL011 specific debug code
  *
@@ -16,6 +16,8 @@
  * GNU General Public License for more details.
  */
 
+ #include <asm/pl011-uart.h>
+
 /*
  * PL011 UART initialization
  * xb: register which containts the UART base address
@@ -23,13 +25,13 @@
  */
 .macro early_uart_init xb, c
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
+        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
+        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #0x60             /* 8n1 */
-        str   w\c, [\xb, #0x2C]      /* -> UARTLCR_H (Line control) */
-        ldr   x\c, =0x00000301       /* RXE | TXE | UARTEN */
-        str   w\c, [\xb, #0x30]      /* -> UARTCR (Control Register) */
+        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        ldr   x\c, =(RXE | TXE | UARTEN)
+        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
 .endm
 
 /*
@@ -39,8 +41,8 @@
  */
 .macro early_uart_ready xb, c
 1:
-        ldrh  w\c, [\xb, #0x18]      /* <- UARTFR (Flag register) */
-        tst   w\c, #0x8              /* Check BUSY bit */
+        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
+        tst   w\c, #BUSY             /* Check BUSY bit */
         b.ne  1b                     /* Wait for the UART to be ready */
 .endm
 
@@ -50,7 +52,7 @@
  * wt: register which contains the character to transmit
  */
 .macro early_uart_transmit xb, wt
-        strb  \wt, [\xb]             /* -> UARTDR (Data Register) */
+        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
 .endm
 
 /*
-- 
2.25.1


