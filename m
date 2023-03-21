Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D66C33A4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512673.792770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecbk-00069a-Sn; Tue, 21 Mar 2023 14:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512673.792770; Tue, 21 Mar 2023 14:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecbk-00066R-Pa; Tue, 21 Mar 2023 14:05:00 +0000
Received: by outflank-mailman (input) for mailman id 512673;
 Tue, 21 Mar 2023 14:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pecbj-0005Xe-Lf
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:04:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e83::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccc47e3-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:04:58 +0100 (CET)
Received: from DS7PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:3bb::20)
 by DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:04:54 +0000
Received: from DS1PEPF0000B079.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::fa) by DS7PR03CA0075.outlook.office365.com
 (2603:10b6:5:3bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:04:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B079.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:04:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:04:53 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:04:52 -0500
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
X-Inumbo-ID: 5ccc47e3-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5/UsR0OMTH63kOPTxAUoORbsZmfimCJPslFN577hC1u2F+UoB9mkF7d0kAiNqOlz/5iJTNC6zaxin4h5dUi4G4sB77zI+vRMtqXiWygwr052bCKY6PA53VbjjCaPF0933NYlfWTJzawkWldIFoNLEgF3tq78JT4Ud6npDvNN0ZM707jiBokjmMcuSo8qmB6U2VjnpHuZ32GN5TZtya08gTNVEWRu958Hq0/i9p4wty287jp8i9ATokrN/Ud6mevwqldoN1f0pTMLfJve5kzhvElUugkzMvjDRhejVX2kAljHMggPLmVrS2v0YUj3UFilWadLZZ5ARJW/JSKrGO30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdACvSYIwIHbjiq6l1EcIfjcW/2ojwnGS2SvBnGV5RE=;
 b=W01jNm0s2iNjU7PePfqaIgFGWMSdJtpyfDmz5rTOph/9ZGwdA5V+z8L74WTDNV7ll3bNeaiFXuqoqp7PyOITqlYsJAmFitbWGGT3lZ/woHBw2U00EmHs8r3kVe3XL/7ioe98aqlGBv1a4hqSNDx73XEAJosF4u1In6l0s+Fp7kqxdmF6IHihlyUJdmFCgZNqitGbpkq0Dwnem4lJ2y96nYMcqxw+chc5MjIi40MRcMx0eJiLlx7Fke1QpoOvnHtii7sMiGg95ayr+vYLV7HUDo1QiMBHoIy5bpoFlq2y4xMot2oNwSJsv0MfgUbc2DNNWjYYvIpMVwTZNWauWQO7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdACvSYIwIHbjiq6l1EcIfjcW/2ojwnGS2SvBnGV5RE=;
 b=k4xPp/rRgWWRo4gg1BIqmoYxP8R9q2JENzfgvuLIATwbtMDR7bTWst6cAeDk+iozTtZxuleDJeUiCMMvblA+nFBwze9MNuAOcj4Wh9jVmqc2JTyOYkYD3CkYX6U3EqPQQPJiirexY7rkIBMz155MoLfvoKJ+HRPMhrKpZqQA1BE=
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
Subject: [XEN v4 04/11] xen/drivers: ns16550: Use paddr_t for io_base/io_size
Date: Tue, 21 Mar 2023 14:03:50 +0000
Message-ID: <20230321140357.24094-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B079:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 949069a3-f7ed-4abb-0902-08db2a153f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IDnR5HwcKAwQLqka5JAFJ0CpHFBemdfa6np4LpRSa11VQbqOCBaNZz9i48fmGcVl4Midp38qFfQquTq7JMTYuWn9oGX270/D2QLMJ8sEUUEKYxMQJYy06Wc994H83xuL2N6LJyAKJMYAW8r5S2r1SN/a56oH6tSwjI0xHXtDn6iiCvRH/zheHnO1qYBUUimBX9aaFSTDomg5dFthEGbkxUcgX/G6eWYG8N94E5LkZJlCK5IOfKflWSaZCr91ap1pgxnuWPh/UeDR/n3xaJSfzPUuAWIM3s+5Z55ZBDkZ8kzHD/glTC0fyISc3wI1I48Tre8auRtLj7JC3rAwu4PeI3EakISmKSCsjzzzE3aEzm+ZZfh8bRyV/CFJEvCr9HulkrQ/ueoYWe+8i7g3IQfwWz9qwStq19Ka0jkbZPvgnxSvTla/XXXVDWLr1cJ+vDSwXzj6ZBtYRxQz80E8/8H2skouJ6b8N4B/685vKZ/iIdeAj+k2tQI9GwejlNK6YJZWWS+XIeRXwY+WHuDfJ8isZ2X0F8f66/bUU0vdKjh7mdwZnjAmjurJZECWk+F2b6B029ygYDXxhTDfX/CaDwCe+wbTr2Uo+ZMziSvZaJmmVm/59PzadqVYwLl15nH2RE79lihWyP+PKiW2xfaXIqBdToyOP2vmsqp1VIXI8e/xAefWKxS5V2Sk8jcYTPfrzQ8SXu30NMWCD5Ram83M0rTkk9cQVQA5ptvGKhBksyR22IA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(86362001)(82310400005)(40460700003)(103116003)(36756003)(40480700001)(70206006)(83380400001)(6916009)(316002)(4326008)(478600001)(70586007)(8676002)(186003)(54906003)(26005)(336012)(2616005)(426003)(47076005)(1076003)(356005)(8936002)(5660300002)(7416002)(36860700001)(41300700001)(81166007)(2906002)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:04:54.5789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 949069a3-f7ed-4abb-0902-08db2a153f3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B079.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109

io_base and io_size represent physical addresses. So they should use
paddr_t (instead of u64).

However in future, paddr_t may be defined as u32. So when typecasting
values from u64 to paddr_t, one should always check for any possible
truncation. If any truncation is discovered, Xen needs to return an
appropriate an error message for this.

Also moved the definition of PARSE_ERR_RET before its first usage.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -
v1 - NA

v2 - 1. Extracted the patch from "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
into a separate patch of its own.

v3 - 1. Reduced the scope of pci_uart_io_base and uart_io_base definitions.
2. Instead of crashing, invoke PARSE_ERR_RET().
3. Moved PARSE_ERR_RET() so that it is defined before its first use.

 xen/drivers/char/ns16550.c | 41 ++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 092f6b9c4b..2e8a9cfb24 100644
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
@@ -1163,10 +1163,16 @@ static const struct ns16550_config __initconst uart_config[] =
     },
 };
 
+#define PARSE_ERR_RET(_f, _a...)             \
+    do {                                     \
+        printk( "ERROR: " _f "\n" , ## _a ); \
+        return false;                        \
+    } while ( 0 )
+
 static int __init
 pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
 {
-    u64 orig_base = uart->io_base;
+    paddr_t orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
 
     /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
@@ -1235,6 +1241,8 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                 /* MMIO based */
                 if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
+                    uint64_t pci_uart_io_base;
+
                     pci_conf_write32(PCI_SBDF(0, b, d, f),
                                      PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
                     len = pci_conf_read32(PCI_SBDF(0, b, d, f),
@@ -1259,8 +1267,14 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                     else
                         size = len & PCI_BASE_ADDRESS_MEM_MASK;
 
-                    uart->io_base = ((u64)bar_64 << 32) |
-                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
+                    pci_uart_io_base = ((u64)bar_64 << 32) |
+                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
+
+                    /* Truncation detected while converting to paddr_t */
+                    if ( (pci_uart_io_base >> (PADDR_BITS - 1)) > 1 )
+                        PARSE_ERR_RET("Truncation detected for io_base address");
+
+                    uart->io_base = pci_uart_io_base;
                 }
                 /* IO based */
                 else if ( !param->mmio && (bar & PCI_BASE_ADDRESS_SPACE_IO) )
@@ -1456,13 +1470,6 @@ static enum __init serial_param_type get_token(char *token, char **value)
         return;                              \
     } while ( 0 )
 
-#define PARSE_ERR_RET(_f, _a...)             \
-    do {                                     \
-        printk( "ERROR: " _f "\n" , ## _a ); \
-        return false;                        \
-    } while ( 0 )
-
-
 static bool __init parse_positional(struct ns16550 *uart, char **str)
 {
     int baud;
@@ -1532,7 +1539,15 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         else
 #endif
         {
-            uart->io_base = simple_strtoull(conf, &conf, 0);
+            uint64_t uart_io_base;
+
+            uart_io_base = simple_strtoull(conf, &conf, 0);
+
+            /* Truncation detected while converting to paddr_t */
+            if ( (uart_io_base >> (PADDR_BITS - 1)) > 1 )
+                PARSE_ERR_RET("Truncation detected for uart_io_base address");
+
+            uart->io_base = uart_io_base;
         }
     }
 
-- 
2.17.1


