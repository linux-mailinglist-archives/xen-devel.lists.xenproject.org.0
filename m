Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6AB3E8EB0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165718.302907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlW7-0005wy-FK; Wed, 11 Aug 2021 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165718.302907; Wed, 11 Aug 2021 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlW6-0005nL-RG; Wed, 11 Aug 2021 10:31:22 +0000
Received: by outflank-mailman (input) for mailman id 165718;
 Wed, 11 Aug 2021 10:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRH-0000BQ-EJ
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbbcb941-dcc2-4247-9607-19b0fc439438;
 Wed, 11 Aug 2021 10:25:34 +0000 (UTC)
Received: from DB8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:110::28)
 by DB9PR08MB6428.eurprd08.prod.outlook.com (2603:10a6:10:263::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:32 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::7d) by DB8PR04CA0018.outlook.office365.com
 (2603:10a6:10:110::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:32 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:32 +0000
Received: from bb46b63f0042.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2D62C8C-EABD-41FC-A6A5-68C19FF45019.1; 
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb46b63f0042.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from DB7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:10:52::27)
 by AM6PR08MB3880.eurprd08.prod.outlook.com (2603:10a6:20b:86::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:24 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::61) by DB7PR02CA0014.outlook.office365.com
 (2603:10a6:10:52::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:15 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:13 +0000
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
X-Inumbo-ID: dbbcb941-dcc2-4247-9607-19b0fc439438
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAb73wtz3fWrvny7PX7rdYo85rQ3rmJfUdReR1U9JWY=;
 b=6/EeWRBO73ccZ2Hv4Rg3kfSaniReks//hRt4UXxGO5+E15NMaJpNM7qlH+e06gsyKrhBXuvVCyVo0aQ0JAy4VtaUFAJUvm7/RvtHQaGDX548tByoDnDPqKS4nqarZZq9kIIX5YYHhg6jKLJkZMgARMCRmTuvg93Z/kknvonIbmk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54924720137e9eb1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGPLVYQUDH+2tN0FDsW1j/wO9jIUte8wpubDFfHTFgDB6WPw0W30oZdw3yjS7AEXg0i/ZAlbazkEtFhOuf6lYZ3pfemHOgOBL+y5xzIU+FGpT2W7tpISwl8Zo2dZU5ct0FLCY1U2RXm96SVAUKik9uFlCOhb+CMfkPDC8esmGYV6YSxXP/H/0CW3e3zaZ6XRwNtJVe6EUDBVLTJOXFgYMi/qBYDNPbfDcDgJ1/hdB0y/Lv5w1XeTu4K0jPIhWyOrcw01DGEgDyjj61uLgebuuSULRbQIp3hfzy4PJpcR2kovP1reUbCPvV9ca+QC0IcDslI0CyJymEBgapa2ggilnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAb73wtz3fWrvny7PX7rdYo85rQ3rmJfUdReR1U9JWY=;
 b=Eswy+Tl9go+3cdhJbjLznjzrt1N8WHdT6lI9jTJao2hVEJI2dQHrJS3OQVT0RkSOey3ZH2yJs8lbfRkPG1C19xyhABqW7kV3OXnpyCO9oQZdSS/gsLDkGWUnq6DVohl3DrJOP3+YpTvP8ww4LiDRg8878tq0ljrkH0f+x2wXZubJiGnMZr8KVYVoVbIWqJW7+29q0dGTqVWk0XBYKkEoXR5d0uhsGdd348v1DZ23J/gft3v60vFXZjbJEK4tB7uOe2WR9Y/sxga/VvcVkn7i6kBm2sc04zU7Riwv03+qV78tjANNBWZBfvfURFF5+4wKyjOzuExadxUIm6IPXG354Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAb73wtz3fWrvny7PX7rdYo85rQ3rmJfUdReR1U9JWY=;
 b=6/EeWRBO73ccZ2Hv4Rg3kfSaniReks//hRt4UXxGO5+E15NMaJpNM7qlH+e06gsyKrhBXuvVCyVo0aQ0JAy4VtaUFAJUvm7/RvtHQaGDX548tByoDnDPqKS4nqarZZq9kIIX5YYHhg6jKLJkZMgARMCRmTuvg93Z/kknvonIbmk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
Date: Wed, 11 Aug 2021 18:24:01 +0800
Message-ID: <20210811102423.28908-19-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb10df8-21c5-4b73-9be1-08d95cb259a2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3880:|DB9PR08MB6428:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6428E430E0F9830EBA1108BD9EF89@DB9PR08MB6428.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oHj/b4lCy8+f6amO8ACyg847P754dbVpNG9IC7PlmrNI2PE19cqL4mClEqioiqxxbA0oO4s/Bp0OV4+BROK1soQXiCX29vf6RktQUm65amepk3U1NeN3J8bBtB9axg5xDDVpATR/7YeCDUrYULFBr7tIWHgbyGq8yqQDaUJwK1E25JW1eDHlX2wlz/hiA1lc5ixiMu/Qjp5rvTUf+7M73M8atf9WPuO1yFfI6adppARb1vSxZw9TJC1PC40PjbbtSxoehr4+C/hDWT5MC3z5p4w/FghKmNurwC2kqfvzducCeKP5CemoQ1fDt0Z9KLY18jpe2lxhf7J9oi5qglMZ49eExtN0gPDa66frg8Eu55ibrBHZcDNZu4OErcfSjHZNqJtvpNSdm7/YVytrip9GHUaGfdZn9N2XLhkUA19E0lGJKV296C27S6Wj6aBJftY1vWfB5AbgQaq8nIp75hbAaz+8CeHzZP47W06ACUXk/qAqruF9PyL63DKD1KYoS3yN88cd1Jz/vWfT4tfBFOTIZWb91bE7Cz2oEmsQC/ZqCLkKf6ykX3OGx0gKniNoKADXEZarshDbQTFqvfBDFu8Z/3xTYCGgihWwk5a4K2ADc2LClM3YO1hz8hgXGCUueudWgnThl2kSIY8XT/zop0glOS4xKsFcToBcPPJqcUwdDsaIy6aLw/W9qiBBDZi/mBqSJfr0RUHJCHR+4E+ePJYqG8nZxCQm0/wxvZFm07AxLBsV3nnA8S1o4jdxdVjnMYM+jArwlw+5Ta5rnNkqArSn/Kt6yIyPzxW18CS67g6ByOE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(8936002)(5660300002)(356005)(8676002)(110136005)(47076005)(34070700002)(6666004)(316002)(36756003)(81166007)(36860700001)(86362001)(70586007)(426003)(83380400001)(2906002)(478600001)(82310400003)(7696005)(26005)(82740400003)(1076003)(44832011)(186003)(2616005)(70206006)(336012)(4326008)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3880
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7fdace4b-3074-4875-041d-08d95cb2545c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mquuhGLu44v6Kbc0+QdgAOwjJ9ihYI0myf2WCdNxs9iWWfeEMc0OZTeq0oLK/veSEJU6to3PlgRd8LV3jyOT+tDOZ2EXGhFrbTFUzj0tzu+Bg0cz48GvpepnZf2KsMgMVtoIG915tPhnq+VN27MkUSBYonT+HTubt7syLYTtrcSCUDoskvrf+M19zGA/G3a82nmgO2OxkpROKoAZHHDIZE2hQXHFpNwwGEcUxYyro2YpnsynyU53d344ZZMV3ZpVDXj1136byQk1CkIXdBB6qKcAYI7KKDDdRRxOLEHrh+js1Q33bhE/pxji6J8QPCWe073gwXXgreCtz1izQgkC3VQ7nepXFddo3eLzTaT/o1o0QUBoy7T4tWdUbcgY5YpM9/KhINgXD7Ul0qmA9bxiEidul+gHQqZDmD3atKPzQCXdA8v9SP9lnbgf1UJ3XS/FAU0gcvvsoTN+BclCifPLIgDoHeJS5chjqoufUPdwBJhuBiwZiQa4RcdfxyLdJKsiJd6g/yfZ26m2sU+JIt0fzxTb7HBTejWF+LWzJK2vLMenf7WpYPcWZbsisSXyNdAzvhV4kH+JV4/vsZBHWUvtpmNuYBgzsyPaRVwb8Lev5WlFPBJd0ZBi8nowX260ss6nDnARG5yhnwqaXzEILLaML8O1NkdOoSU3bOnwfyhLfTCdcPlyEJhZWaz+ggJxiWJhiWMUGdR67h6FzDvhvnK5SoOMm67cKYXFjyhNoizll/g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(36840700001)(46966006)(110136005)(426003)(86362001)(7696005)(36756003)(316002)(2906002)(4326008)(44832011)(82310400003)(336012)(2616005)(8676002)(1076003)(36860700001)(8936002)(83380400001)(82740400003)(70586007)(5660300002)(70206006)(478600001)(81166007)(6666004)(186003)(26005)(47076005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:32.7328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb10df8-21c5-4b73-9be1-08d95cb259a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6428

EFI can get memory map from EFI system table. But EFI system
table doesn't contain memory NUMA information, EFI depends on
ACPI SRAT or device tree memory node to parse memory blocks'
NUMA mapping.

But in current code, when Xen is booting from EFI, it will
delete all memory nodes in device tree. So in UEFI + DTB
boot, we don't have numa-node-id for memory blocks any more.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prvent early_scan_node to
parse memory nodes in EFI boot.

As EFI APIs only can be used in Arm64, so we introduced a wrapper
in header file to prevent #ifdef CONFIG_ARM_64/32 in code block.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 xen/include/asm-arm/setup.h |  6 ++++++
 3 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 476e32e0f5..7df149dbca 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -335,7 +336,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If system boot from EFI, bootinfo.mem has been set by EFI,
+     * so we don't need to parse memory node from DTB.
+     */
+    if ( device_tree_node_matches(fdt, node, "memory") &&
+         !arch_efi_enabled(EFI_BOOT) )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index cf9c37153f..d0a9987fa4 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -197,33 +197,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..e4fb5f0d49 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -123,6 +123,12 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+#if defined(CONFIG_ARM_64)
+#define arch_efi_enabled(x) efi_enabled(x)
+#else
+#define arch_efi_enabled(x) (0)
+#endif
+
 #endif
 /*
  * Local variables:
-- 
2.25.1


