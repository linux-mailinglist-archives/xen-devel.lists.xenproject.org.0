Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A630362F3F9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 12:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445629.700908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzq4-0002l8-BN; Fri, 18 Nov 2022 11:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445629.700908; Fri, 18 Nov 2022 11:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzq4-0002jJ-8K; Fri, 18 Nov 2022 11:47:20 +0000
Received: by outflank-mailman (input) for mailman id 445629;
 Fri, 18 Nov 2022 11:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovzq2-0000xU-Oh
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 11:47:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eab::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf4cae0c-6736-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 12:47:17 +0100 (CET)
Received: from BN0PR04CA0167.namprd04.prod.outlook.com (2603:10b6:408:eb::22)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:47:14 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::1e) by BN0PR04CA0167.outlook.office365.com
 (2603:10b6:408:eb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 11:47:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 11:47:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:41 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 18 Nov 2022 05:46:40 -0600
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
X-Inumbo-ID: bf4cae0c-6736-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNslExaHwLxCIlRRrIFAKZ+bOJn4Hpf+eBD+YsBKEhvDji2q7K+u2l9ita1Ndex5n1KBttfFkWKisg2Mzpqbj1jzoOwog2xXNTDC6rQ+wid/pJpUa6plE2V281Kbk6+IAXFFooD23WC/CcX+6Q+KB3hdZI3Y70a+vWsWX67fe5nXHOWdo1+rKQhBEngnsr2eE8xG8GejgRFTjEuTcWAnakdf/DKjbM7DVJKJQHexm4jijAtl6+lwReCKIJRJC03lkwheYL42b96DvIGUvtOjht3FIDca4KXFJinOzeLjpEqfHawSnPfEAOOymGgnLKR9o+UsH/3YFKvSB3bb1FFjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLyLFkVOT6VDwHO40q+5e8h3AFqIk0VudNJgD0mykWM=;
 b=XZuUah50qEbm4QeldakUYzzKCQqa56wNge18j0Bb5/nYQqXWr3KszLEdTcF2bUsDbTqw+ODTig8liViSWl+51xtg+fjB9WhdA63ZxVCjQrvD3rPUOdqKlUl4rcjUMWVv6aKs1293ilWVuA8/byh8STC7fzlSdopHkdX6eICBJVPKdyAJW0jTA0aBxMNPFDciA/nr8QOeeoZ4eNyqgy/FADoAJPBOuSC2J9uRRSK+opotKZzjoMpWZDcHar8VikRgXNFyjt2m28P47dJyGy0BZDo4rFOcUR4KSs6IcDlNI9cUcACCTTaQ3Yq0zziPmQCV2RHP2sgnSPxfnaia8cN0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLyLFkVOT6VDwHO40q+5e8h3AFqIk0VudNJgD0mykWM=;
 b=T8dZRVKMp/Sy1P5Mb0g3zDY2qYxxoD/zzHc2shJLTLiF8AZxfndRIKEBKAKdTNTQgqxwO9khZ/ecZ8isi8LqJYSnemYefhKCHUKjJ52FuITt7P+PBP0aclSFIOmhfFXr44TnkdZUzngL7T5Rj0AUoSZJclinXSSfkLDEsQbnU2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: Define WLEN_8 macro and use it in debug-pl011
Date: Fri, 18 Nov 2022 12:46:18 +0100
Message-ID: <20221118114618.20754-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118114618.20754-1-michal.orzel@amd.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|BL1PR12MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 85675678-a091-4d4a-4e0d-08dac95aa2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pNksFMQiXPYjvVMFm33YJBM7/WKHf8VoBaEal+lXK6vZ1h9PHbeSs+xTVZ+U1+CfnwYBpkccvRw3nLx9yd9I/ieHA9NHtIcsF8tBuIOPjZpTt0Cz5qN/H84JnTWDt3OSR5GxShWZ/VLEsunKeSUNLtXL+ho/gdT0DtXDIs7sY2bE0FyQby2AxV27lgDjNyxCORd1pL06a741OBgONz/JZOhLH6jTe47S7BL85gnV0+6KPCs+u/vQHNjwVhSDThD2c7KKZ2QrIVhAMltwTjXXTBNIY9IMQOY8sVOkwIojGOtO6VdEv1zKS//uxYHwwDeRQX0I+UzGDovrpxozZMMNUbWn95lYWC2N/xPGApDvXTmNNpnC9PSWwHGAHn9mutjOOhu2c4L0K12+fv1G23TXtB7aYKog41USGwIHC268GVCfZVD6NBUNpRsJ4gfncfI7271mcg5gbBHgQuFNUDxWdwtWNoP0fcoJZBjnmZADcyZXVPQQqoxAONIqgAEQpEyALW5zjc9Tgbgcf/E1q1sdSxrAd3l53OyFs8fgOV8F4/RdibCvzbpfd2QzTL8lD93yC7VPfHOlCSE0TmtS6wmZh+9r1OfrvXntzHRl3UTDSjzyqhNkXPVrea92In0aurIy/p0pH+JcRlL9OoyEOSIiwX48zy0JVgoT1/SoDAkmn2p2cwdHOE2XBb/q8CRglyS6REK+MHY8R/dIA90gEQwC6rgQsQQxZ+P16laihcD+06E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(36756003)(2616005)(36860700001)(1076003)(86362001)(2906002)(5660300002)(44832011)(336012)(426003)(83380400001)(186003)(8936002)(82740400003)(40460700003)(82310400005)(40480700001)(356005)(81166007)(47076005)(26005)(316002)(54906003)(6916009)(478600001)(6666004)(70586007)(70206006)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:47:13.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85675678-a091-4d4a-4e0d-08dac95aa2a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126

At the moment, early printk code for pl011 uses a hardcoded value
for 8n1 LCR configuration. Define and use macro WLEN_8 for that purpose
(no parity and 1 stop bit are defined as 0).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm32/debug-pl011.inc    | 2 +-
 xen/arch/arm/arm64/debug-pl011.inc    | 2 +-
 xen/arch/arm/include/asm/pl011-uart.h | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
index 214f68dc95bd..c527f1d4424d 100644
--- a/xen/arch/arm/arm32/debug-pl011.inc
+++ b/xen/arch/arm/arm32/debug-pl011.inc
@@ -29,7 +29,7 @@
         str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
         mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
         str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
-        mov   \rc, #0x60            /* 8n1 */
+        mov   \rc, #WLEN_8          /* 8n1 */
         str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
         ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
         str   \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index d82f2f1de197..6d60e78c8ba3 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -28,7 +28,7 @@
         strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
         strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
-        mov   x\c, #0x60             /* 8n1 */
+        mov   x\c, #WLEN_8           /* 8n1 */
         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
         ldr   x\c, =(RXE | TXE | UARTEN)
         str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
diff --git a/xen/arch/arm/include/asm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
index 57e9ec73ac19..5bb563ec0814 100644
--- a/xen/arch/arm/include/asm/pl011-uart.h
+++ b/xen/arch/arm/include/asm/pl011-uart.h
@@ -55,6 +55,7 @@
 
 /* LCR_H bits */
 #define SPS    (1<<7) /* Stick parity select */
+#define WLEN_8 (_AC(0x3, U) << 5) /* 8 bits word length */
 #define FEN    (1<<4) /* FIFO enable */
 #define STP2   (1<<3) /* Two stop bits select */
 #define EPS    (1<<2) /* Even parity select */
-- 
2.25.1


