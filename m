Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AB468EE7A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491722.761007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDI-0006f4-Oq; Wed, 08 Feb 2023 12:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491722.761007; Wed, 08 Feb 2023 12:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDI-0006bl-LP; Wed, 08 Feb 2023 12:06:12 +0000
Received: by outflank-mailman (input) for mailman id 491722;
 Wed, 08 Feb 2023 12:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDH-0006aK-I6
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7c66ada-a7a8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 13:06:08 +0100 (CET)
Received: from BN9PR03CA0810.namprd03.prod.outlook.com (2603:10b6:408:13f::35)
 by BL0PR12MB4945.namprd12.prod.outlook.com (2603:10b6:208:1c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:06:02 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::81) by BN9PR03CA0810.outlook.office365.com
 (2603:10b6:408:13f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:06:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:06:00 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:05:59 -0600
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
X-Inumbo-ID: f7c66ada-a7a8-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoSiBqEi2+4Yk4MIqB0BxRKbboquC7mtftIDBFP+id3WgqxmHoSqqZyEO5sDz4ERohiJO4i2pyvIeg2VRpe8F+b2bUjmohGIYw44VCigl3WwJwy+Iytejl54EpHba2q3zQa/ISA4zu12CR7+lT2hGgyrdPDTZV/3vJrAnUBym1vqTpVQSdtFtdeR4X/6UFPZCOvJaMPU2eCnDIuGXzSGTvV1CgdC2Z3PtI5j0GRID8IcCdM3evDOiFrSUd6cyWBFIQXg+nC+ishSs4OaCJPkU3vqGN7eH+7ybLhtcMyA+SHx1Dps4TI5AFjcREPfGKjtrTUjZA3wMgV2lCuqR+phjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWDdC45h3TzmFMpzP68+i+YB/5cnNKV4V21ZBbTbtAQ=;
 b=QQvgoS5851Ps3UJFxrNHDbY+Y4fteovcy4xvGkgVL6de+to4wzQC6d2xzqhuBBF1cEQcx2uVAuZZegAfEZVp4x/uhV3b9VG01464mqJNwgrB8hEVU79CIk65FqX6myOigPw9W3xEpUHaN11sZcs6SjGXhnkXLhW5SRa8uluovTLaqbrgfIPYVAUJ5DKaHeaGLJUYSGFQfgt3C8Nfhs+joRJGa5RENxgtteWHoIE0MtUAsOsZhPzqEHKb7+2iJkwXP1ZfunHUmDc8zsZKK0/JnmuqMNjp6dH6No0cvnJaLlAfCPgvH0P6nmv/9GBMgTZXaWcRA/2pPpKVqZ/2nSfLHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWDdC45h3TzmFMpzP68+i+YB/5cnNKV4V21ZBbTbtAQ=;
 b=b99biGqvkjHe5Vlvg7uEmB2D+BHLaU0ouL8Hq6jrJ0C7muIiM0sW+VaH5qCJPz2+tBsEQDwmSNmnt1TQ4HEKoAXQwE78w9YIrdeqYapK3UXSZYWefctxKwiNkDejvv2W2oPZ0e6jADYFENRk1SN2HiDTnCkh6BJUQhyvsIpF8Hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 3/9] xen/drivers: ns16550: Use paddr_t for io_base/io_size
Date: Wed, 8 Feb 2023 12:05:23 +0000
Message-ID: <20230208120529.22313-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|BL0PR12MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1095b2-76eb-4466-6ea2-08db09ccd8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/79enLjL8WxVA0/UJrwt8ZvoUxa8j8rNcwzU5P4VC1Zo9ckjdjeuuc03dPPrvYe9jXzID1jFbqvvsVOwc374QY5oIEY6Ju82M+iOf+68okQMV6P/EPZLtOeCGD69Dm10+A8E+enI0WKeLBHRfLY8aS8HulEi0/3FYNpXW1h95FIErfpnG/t8/hfl8MlLFg3AYTOcEbZ2sx6nj25lE5v/5a4QQ7oOEti9X125GtwIcmIwL7rbQa/GLlOLR6qMdTjPAenRPWyUNS+3L2wRprRYZKlCFrlLlpKHBI0sUdItQHFxe5PZt5mP6KrnAZih2WlgtX9RUTIERzRrFENSlm1eEW2wcSVQPZks+DB0s1QORf2xhrEiOnVKszJ9ynJxx5YdOFelTsxhz4kp59+UkMMbCp3y9qTg83+j9XgUilyIu67yo70LeBIATpluVz5gfJ3D25qAPhqVJKIArf1bq8aXK3DHx7xmNcL1j0jggcqorD1i46gv3uHsaIZ2pHXZwuTpIGBsw0d3114xiwoIIz5IYLMcJQx6Lc2W+2z3GV5FAstx42MZ0NavkZ4gvstcq4antpo2crSoquJ6fyoMgPsAdgATaDpVw9Jk0ocKE6zpzWSmKWF+wWgr5eT5WWGBrUNWeLbdgJ3QU1x7YpRyhvPldaWL/kppjk8Wi2C118xmJzt/vqFtsn2ufuWbsdNP+tCVmJczixvRvYIrtyg83C6++nGx55FwrZmBriBVKCkulyw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(46966006)(36840700001)(103116003)(36756003)(86362001)(356005)(2906002)(82310400005)(7416002)(41300700001)(5660300002)(8936002)(83380400001)(81166007)(82740400003)(36860700001)(478600001)(186003)(26005)(40480700001)(40460700003)(316002)(336012)(70586007)(1076003)(6666004)(8676002)(6916009)(54906003)(70206006)(426003)(4326008)(47076005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:01.5942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1095b2-76eb-4466-6ea2-08db09ccd8af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4945

io_base and io_size represent physical addresses. So they should use
paddr_t (instead of u64).

However in future, paddr_t may be defined as u32. So when typecasting
values from u64 to paddr_t, one should always check for any possible
truncation. If any truncation is discovered, Xen needs to raise a BUG
for this (as the address is provided either by reading the PCIE registers
or parsing parameters from string, so the error is unrecoverable).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -
v1 - NA

v2 - 1. Extracted the patch from "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
into a separate patch of its own.


 xen/drivers/char/ns16550.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 092f6b9c4b..2aee5642f9 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -42,8 +42,8 @@
 
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
-    u64 io_base;   /* I/O port or memory-mapped I/O address. */
-    u64 io_size;
+    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
+    paddr_t io_size;
     int reg_shift; /* Bits to shift register offset by */
     int reg_width; /* Size of access to use, the registers
                     * themselves are still bytes */
@@ -1166,8 +1166,9 @@ static const struct ns16550_config __initconst uart_config[] =
 static int __init
 pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
 {
-    u64 orig_base = uart->io_base;
+    paddr_t orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
+    u64 pci_uart_io_base;
 
     /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
     for ( b = skip_amt ? 1 : 0; b < 0x100; b++ )
@@ -1259,8 +1260,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                     else
                         size = len & PCI_BASE_ADDRESS_MEM_MASK;
 
-                    uart->io_base = ((u64)bar_64 << 32) |
-                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
+                    pci_uart_io_base = ((u64)bar_64 << 32) |
+                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
+
+                    /* Truncation detected while converting to paddr_t */
+                    BUG_ON((pci_uart_io_base >> (PADDR_SHIFT - 1)) > 1);
+
+                    uart->io_base = pci_uart_io_base;
                 }
                 /* IO based */
                 else if ( !param->mmio && (bar & PCI_BASE_ADDRESS_SPACE_IO) )
@@ -1468,6 +1474,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
     int baud;
     const char *conf;
     char *name_val_pos;
+    u64 uart_io_base;
 
     conf = *str;
     name_val_pos = strchr(conf, '=');
@@ -1532,7 +1539,12 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         else
 #endif
         {
-            uart->io_base = simple_strtoull(conf, &conf, 0);
+            uart_io_base = simple_strtoull(conf, &conf, 0);
+
+            /* Truncation detected while converting to paddr_t */
+            BUG_ON((uart_io_base >> (PADDR_SHIFT - 1)) > 1);
+
+            uart->io_base = uart_io_base;
         }
     }
 
-- 
2.17.1


