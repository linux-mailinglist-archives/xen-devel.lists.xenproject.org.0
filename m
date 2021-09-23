Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67614415DE8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193891.345480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNW7-0000Oa-DO; Thu, 23 Sep 2021 12:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193891.345480; Thu, 23 Sep 2021 12:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNW7-0000K3-6w; Thu, 23 Sep 2021 12:07:55 +0000
Received: by outflank-mailman (input) for mailman id 193891;
 Thu, 23 Sep 2021 12:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNUf-0006xV-SO
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6921c873-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:32 +0000 (UTC)
Received: from AM5PR0402CA0010.eurprd04.prod.outlook.com
 (2603:10a6:203:90::20) by PAXPR08MB6765.eurprd08.prod.outlook.com
 (2603:10a6:102:138::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:30 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::6d) by AM5PR0402CA0010.outlook.office365.com
 (2603:10a6:203:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:30 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Thu, 23 Sep 2021 12:04:28 +0000
Received: from 84eaf1236402.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65DBA426-175E-4FCC-8368-5804DC4F84D7.1; 
 Thu, 23 Sep 2021 12:04:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84eaf1236402.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:15 +0000
Received: from AS9PR06CA0167.eurprd06.prod.outlook.com (2603:10a6:20b:45c::19)
 by DB7PR08MB3130.eurprd08.prod.outlook.com (2603:10a6:5:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:12 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::8c) by AS9PR06CA0167.outlook.office365.com
 (2603:10a6:20b:45c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:12 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:48 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:46 +0000
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
X-Inumbo-ID: 6921c873-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrDysX/S2+52U1YehehJRI4UKMo45On8F4OkTenZGx4=;
 b=dPKEVqbVjLK+Dd73OjXKsf1IOfOKtm/C2gsGtefZfDG5EnuHAQv8XsgZPwgr8UDUuSZElpoej2JfimPrX1MUAVMD0yJdRUJeZrvdcZAARwQxqnG4LfnplVI3LNm5iWHdgcUEqHsJaBs3GTQQdxpbTUb4fgHxGCiK8kPkSCI9JaA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55bcb7f56a94619d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnmvMjXtCiJiEa6bRueK6qNZ3qUfzae3nl3YhBZrOheIKbhI0mGws/iuDSj+hIxzahP0+yP63ltrtwvb2v5V8SYJ/82caHPULuWWINghYfsAiuLCb/dGlWR+kB+cIyCo321biOL/N5pWgTbXbLqnefEsDd8CAImGCczHSjuvnTl82nyrC6hf2HzY/th1d8XUl5yHaziQA8B3nX5fUVJP98sYEY2lm+naOwQ52kxjuImL81OmIeynmjo8HtdkzZCpSLkxXq2xSuxC/YtVGxtYmDaKM96tuRqyut1vd3ANJ7scLFZOC9NtexytN7H7uq/dN9BqPvrNDZD2ACFf7M3QXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xrDysX/S2+52U1YehehJRI4UKMo45On8F4OkTenZGx4=;
 b=YLerJfRyvOjaJ9r2bvTF9bFJbEuW8Ea8M0wCXszAErRP1YeXRz8rLJZWOiBlLHwiczGDKt7fD158VYsDTYKnlyV0yzoB6aa/fJuBzoNoym/nG8g7RPOI7LhJxtfecXIDIMvdLK3JV0+wxAw1/nSZulNEra5vUhCAMPJOsFlfsGFEV9KrVvacf8oznuTF8i/pYUV1POanmH1aSNpSSGCokZNPfYZYt2nfKabHno7bHoy9BB94XDZUkxSgo8JB9FYiuyC9xssbTMfmgainF5xHEFLq4CccdZW+yRTKPkv8YmRPmroWpa3SISdpVstI4RHuUY0Z9BbvN8hm/v+CqfHYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrDysX/S2+52U1YehehJRI4UKMo45On8F4OkTenZGx4=;
 b=dPKEVqbVjLK+Dd73OjXKsf1IOfOKtm/C2gsGtefZfDG5EnuHAQv8XsgZPwgr8UDUuSZElpoej2JfimPrX1MUAVMD0yJdRUJeZrvdcZAARwQxqnG4LfnplVI3LNm5iWHdgcUEqHsJaBs3GTQQdxpbTUb4fgHxGCiK8kPkSCI9JaA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 18/37] xen: move NUMA common code from x86 to common
Date: Thu, 23 Sep 2021 20:02:17 +0800
Message-ID: <20210923120236.3692135-19-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e3a1952-bb9c-4e26-fccc-08d97e8a4c7a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3130:|PAXPR08MB6765:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6765FDEB3DFB03D07128ECE89EA39@PAXPR08MB6765.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:126;OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZDoQXjTV40+pt3K4l/xC/9iOrphtf0+TOGro6MlpfwcQSN9yw/HUl0et6vsYJ2RO8TEhCKOAGxU7Tjsfk2F/unyuxUwj0Ykii8RGyzv8Z2X2Em0Xdur9ToORb0Bms2s/awyTFH2br3t/sT85TSNByfXrTHCFNF7dhy5F84XGcbLqDy+4DM9lM0h7w7VqvtMt/tsfwVOjuixQE/rP4TZ6d+8xKQSkkOxaRYLfe28RujCrVJAWhil0zXjkYoV7dtg7XlRcoaEKpHJuilH1d6vDC1onizNBJy2HXy6y6j0IvK6v4AV3G6K5oSF6woFFtgnzgYKH+49R3lR7ECuujCkveG6igtI3J/jQfPYQkN5OOrs0yEAnr+2aO+71HvVzOBRxvJOhTqStCP0o8syY7CTwZOP5BdWMvZApyLALCReMubuKM9cBEHCYkgnTq0ftkT3QLAXKdJJzLzpwvWorJWjf+4DwC7BeKsv+/+o5pf9w1lufZ4tn1acNROMd9zcIZGi1p6TlwlAq1B3nITfcq9cOzwPNE/7LsigJfccKk9c2y6xTWfPmY12gesqBjoMH/DwIk2QxwB67u2BbN7pHO5j4rg7cn5OkgIuHoJsdG7/dvrs5GpOvKxogXQflNoyX3jvJj5dagbBa02cxkjifmjyHNpZEw6/1H1dEpNPhwuaSE36mP9hDY9K0PHTQFxYilu43pbxVUGt4VHHbMuiojoRG8qKaNwBaiGzyzRYdXrv+QS4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(7696005)(36860700001)(82310400003)(6666004)(70206006)(5660300002)(8936002)(1076003)(2906002)(36756003)(47076005)(81166007)(336012)(316002)(186003)(26005)(426003)(110136005)(86362001)(83380400001)(356005)(2616005)(30864003)(70586007)(4326008)(44832011)(8676002)(36900700001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3130
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	289611dc-1bea-4388-dcc4-08d97e8a419a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0vIdfW/KIwPYK1h+64vLB5OVUBWc82zdBTzmjKBPZkSgWXAh55TDOP9wQxLB7simV0iyiTY/N2gJr1VlyCcAxgNVEkcKoDXexfjqrP0WCKF8a6VVrVNXh6a/aul60/Ah9v0IMa6YydLFfvrRgLUN+ybti9vjppKdOljJL6vp2e//LNVHmUPPursQizFxtYZp9eR+4IZiZdRemiW+BaLxyAafEGcH0070DrqhCtLe8+t0w+Op/vDsTDr7X/bC5r3axzPcFU3BZOFV3AdVTgVo2ljC/RCUx5JI1KWCokbgPCecdVlGr8x/7YjoguhmTC1niyD049zgSYEFmIe0n0mJ6WgawpZ1qdVZq+VfnZRPhlAWDgyXw4xQlkFVOZsueqPdKj1UAbvNpWzyQ9wJU8fxIY/3z5/SccnLqMaY4WG1NDgoasDFguEa+z1UUCLYtRnAk5gpq1MGs6DCi53J3soAhUZcfYNb6++FtfGxxJRQGCErD3764lgz/5qqBOyl7ooRyi2nIx9q0/utvHyn+71nUb7W1WBETzFcoRIHV3gIuGCi1krA5ed2aOcfnzzwdlPFMArf+Lvbk2p8Bbq7YUvSMXBuGkGVC5cM2+59QoupJSPm0UxbReEKJhg5Kd/41eXSBZVyDCDg4UDZ1zDV0HgL127s7tSbGEOqG8IoG9L7PhNDN2GY9nvwCd/MYyC/LpzLBDOGimWGzMm4M9UqTMCOrA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(8936002)(81166007)(26005)(316002)(70206006)(47076005)(4326008)(508600001)(83380400001)(70586007)(36756003)(110136005)(6666004)(8676002)(336012)(7696005)(36860700001)(86362001)(30864003)(44832011)(186003)(1076003)(5660300002)(2906002)(2616005)(426003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:30.2651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3a1952-bb9c-4e26-fccc-08d97e8a4c7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6765

Some common code has been decoupled and abstracted from x86 ACPI
based NUMA implementation. In order to make this code can be reused
by other NUMA implementation, we move this code from x86 to common
folder. And this code is gated by CONFIG_NUMA, it only can be used
by those architectures that NUMA is enabled. For those architectures
do not support NUMA, they still can implementation NUMA stub API in
asm/numa.h to make NUMA-aware components happy.

In this patch, we also remove some unused include headers.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c         | 446 +----------------------------------
 xen/arch/x86/srat.c         | 253 +-------------------
 xen/common/Makefile         |   2 +
 xen/common/numa.c           | 450 ++++++++++++++++++++++++++++++++++++
 xen/common/numa_srat.c      | 264 +++++++++++++++++++++
 xen/include/asm-x86/acpi.h  |   4 -
 xen/include/asm-x86/numa.h  |  68 ------
 xen/include/asm-x86/setup.h |   1 -
 xen/include/xen/numa.h      |  82 +++++++
 9 files changed, 802 insertions(+), 768 deletions(-)
 create mode 100644 xen/common/numa.c
 create mode 100644 xen/common/numa_srat.c

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 509d2738c0..92b6bdf7b9 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -3,24 +3,13 @@
  * Copyright 2002,2003 Andi Kleen, SuSE Labs.
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
-
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
-#include <asm/acpi.h>
 #include <xen/sched.h>
-#include <xen/softirq.h>
 
-static int numa_setup(const char *s);
-custom_param("numa", numa_setup);
+#include <asm/acpi.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -29,300 +18,12 @@ custom_param("numa", numa_setup);
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
-
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
-s8 fw_numa = 0;
-
-int srat_disabled(void)
-{
-    return numa_off || fw_numa < 0;
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = paddr_to_pfn(start);
-    end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    u64 sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start, end;
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-    start = pfn_to_paddr(start_pfn);
-    end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA
-    if ( !numa_off && !numa_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %016"PRIpaddr"-%016"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static __init int numa_setup(const char *opt)
-{
-    if ( !strncmp(opt,"off",3) )
-        numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        fw_numa = -1;
-    }
-#endif
-    else
-        return -EINVAL;
-
-    return 0;
-} 
 
 /*
  * Setup early cpu_to_node.
@@ -395,146 +96,3 @@ int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
 
 	return 0;
 }
-
-static void dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static __init int register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 94bd5b34da..44517c7b62 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -10,24 +10,19 @@
  * 
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
-
+#include <xen/acpi.h>
 #include <xen/init.h>
 #include <xen/mm.h>
-#include <xen/inttypes.h>
 #include <xen/nodemask.h>
-#include <xen/acpi.h>
 #include <xen/numa.h>
 #include <xen/pfn.h>
+
 #include <asm/e820.h>
 #include <asm/page.h>
 #include <asm/spec_ctrl.h>
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
@@ -37,11 +32,6 @@ static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 
 static unsigned node_to_pxm(nodeid_t n);
 
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
-static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
-
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -104,65 +94,6 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-void  __init numa_set_processor_nodes_parsed(nodeid_t node)
-{
-	node_set(node, processor_nodes_parsed);
-}
-
-bool __init numa_memblks_available(void)
-{
-	if (num_node_memblks < NR_NODE_MEMBLKS)
-		return true;
-
-	return false;
-}
-
-int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static __init int conflicting_memblks(paddr_t start, paddr_t end)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-		if (nd->start == nd->end)
-			continue;
-		if (nd->end > start && nd->start < end)
-			return i;
-		if (nd->end == end && nd->start == start)
-			return i;
-	}
-	return -1;
-}
-
-static __init void cutoff_node(int i, paddr_t start, paddr_t end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
 __init void bad_srat(void)
 {
 	int i;
@@ -284,97 +215,6 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		       pxm, pa->apic_id, node);
 }
 
-/*
- * Check to see if there are other nodes within this node's range.
- * We just need to check full contains situation. Because overlaps
- * have been checked before by conflicting_memblks.
- */
-static bool __init is_node_memory_continuous(nodeid_t nid,
-    paddr_t start, paddr_t end)
-{
-	nodeid_t i;
-
-	struct node *nd = &nodes[nid];
-	for_each_node_mask(i, memory_nodes_parsed)
-	{
-		/* Skip itself */
-		if (i == nid)
-			continue;
-
-		nd = &nodes[i];
-		if (start < nd->start && nd->end < end)
-		{
-			printk(KERN_ERR
-			       "NODE %u: (%"PRIpaddr"-%"PRIpaddr") intertwine with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
-			       nid, start, end, i, nd->start, nd->end);
-			return false;
-		}
-	}
-
-	return true;
-}
-
-/* Neutral NUMA memory affinity init function for ACPI and DT */
-int __init numa_update_node_memblks(nodeid_t node,
-		paddr_t start, paddr_t size, bool hotplug)
-{
-	paddr_t end = start + size;
-	int i;
-
-	/* It is fine to add this area to the nodes data it will be used later */
-	i = conflicting_memblks(start, end);
-	if (i < 0)
-		/* everything fine */;
-	else if (memblk_nodeid[i] == node) {
-		bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
-
-		printk("%sSRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
-		       mismatch ? KERN_ERR : KERN_WARNING, node, start, end,
-		       node_memblk_range[i].start, node_memblk_range[i].end);
-		if (mismatch) {
-			return -1;
-		}
-	} else {
-		printk(KERN_ERR
-		       "SRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       node, start, end, memblk_nodeid[i],
-		       node_memblk_range[i].start, node_memblk_range[i].end);
-		return -1;
-	}
-
-	if (!hotplug) {
-		struct node *nd = &nodes[node];
-
-		if (!node_test_and_set(node, memory_nodes_parsed)) {
-			nd->start = start;
-			nd->end = end;
-		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
-
-			if (!is_node_memory_continuous(node, nd->start, nd->end))
-				return -1;
-		}
-	}
-
-	printk(KERN_INFO "SRAT: Node %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-	       node, start, end, hotplug ? " (hotplug)" : "");
-
-	node_memblk_range[num_node_memblks].start = start;
-	node_memblk_range[num_node_memblks].end = end;
-	memblk_nodeid[num_node_memblks] = node;
-	if (hotplug) {
-		__set_bit(num_node_memblks, memblk_hotplug);
-		if (end > mem_hotplug_boundary())
-			mem_hotplug_update_boundary(end);
-	}
-	num_node_memblks++;
-
-	return 0;
-}
-
 /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
@@ -419,45 +259,6 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bad_srat();
 }
 
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	int i;
-	uint32_t nr_banks = arch_meminfo_get_nr_bank();
-
-	for (i = 0; i < nr_banks; i++) {
-		int j, found;
-		paddr_t start, end;
-
-		if (arch_meminfo_get_ram_bank_range(i, &start, &end))
-			continue;
-
-		do {
-			found = 0;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = 1;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = 1;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "SRAT: No NODE for memory map range: "
-				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
-			return 0;
-		}
-	}
-	return 1;
-}
-
 void __init acpi_numa_arch_fixup(void) {}
 
 static uint64_t __initdata srat_region_mask;
@@ -511,56 +312,6 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init numa_scan_nodes(paddr_t start, paddr_t end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	if (fw_numa <= 0)
-		return -1;
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		paddr_t size = nodes[i].end - nodes[i].start;
-		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "Firmware Bug or mis-configured hardware?\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
 static unsigned node_to_pxm(nodeid_t n)
 {
 	unsigned i;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d422..90e5bf3efb 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,8 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_NUMA) += numa_srat.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..fc6bba3981
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,450 @@
+/* 
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+static int numa_setup(const char *s);
+custom_param("numa", numa_setup);
+
+struct node_data node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+int memnode_shift;
+static typeof(*memnodemap) _memnodemap[64];
+unsigned long memnodemapsize;
+u8 *memnodemap;
+
+nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool numa_off;
+s8 fw_numa = 0;
+
+int srat_disabled(void)
+{
+    return numa_off || fw_numa < 0;
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      int numnodes, int shift, nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    int i, res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static int __init extract_lsb_from_nodes(const struct node *nodes,
+                                         int numnodes)
+{
+    int i, nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
+    memnodemapsize = (memtop >> i) + 1;
+    return i;
+}
+
+int __init compute_hash_shift(struct node *nodes, int numnodes,
+                              nodeid_t *nodeids)
+{
+    int shift;
+
+    shift = extract_lsb_from_nodes(nodes, numnodes);
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%d\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+/* initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn, end_pfn;
+
+    start_pfn = paddr_to_pfn(start);
+    end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    int rr, i;
+
+    /* There are unfortunately some poorly designed mainboards around
+       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
+       mapping. To avoid this fill in the mapping for all possible
+       CPUs, as the number of CPUs is not known yet.
+       We round robin the existing nodes. */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static int numa_fake __initdata = 0;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    int i;
+    struct node nodes[MAX_NUMNODES];
+    u64 sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        u64 x = 1;
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz/2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes,0,sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i,
+               nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( memnode_shift < 0 )
+    {
+        memnode_shift = 0;
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    int i;
+    paddr_t start, end;
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+    start = pfn_to_paddr(start_pfn);
+    end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_scan_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %016"PRIpaddr"-%016"PRIpaddr"\n",
+           start, end);
+    /* setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+
+/* [numa=off] */
+static __init int numa_setup(const char *opt)
+{
+    if ( !strncmp(opt,"off",3) )
+        numa_off = true;
+    else if ( !strncmp(opt,"on",2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt+5,NULL,0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+#ifdef CONFIG_ACPI_NUMA
+    else if ( !strncmp(opt,"noacpi",6) )
+    {
+        numa_off = false;
+        fw_numa = -1;
+    }
+#endif
+    else
+        return -EINVAL;
+
+    return 0;
+}
+
+
+static void dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each(page, &d->page_list)
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static __init int register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/common/numa_srat.c b/xen/common/numa_srat.c
new file mode 100644
index 0000000000..7bda2ecef6
--- /dev/null
+++ b/xen/common/numa_srat.c
@@ -0,0 +1,264 @@
+/*
+ * ACPI 3.0 based NUMA setup
+ * Copyright 2004 Andi Kleen, SuSE Labs.
+ *
+ * Reads the ACPI SRAT table to figure out what memory belongs to which CPUs.
+ *
+ * Called from acpi_numa_init while reading the SRAT and SLIT tables.
+ * Assumes all memory regions belonging to a single proximity domain
+ * are in one chunk. Holes between them will be included in the node.
+ *
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+static nodemask_t memory_nodes_parsed __initdata;
+static nodemask_t processor_nodes_parsed __initdata;
+static struct node nodes[MAX_NUMNODES] __initdata;
+
+static int num_node_memblks;
+static struct node node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+void  __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+	node_set(node, processor_nodes_parsed);
+}
+
+bool __init numa_memblks_available(void)
+{
+	if (num_node_memblks < NR_NODE_MEMBLKS)
+		return true;
+
+	return false;
+}
+
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+	int i;
+
+	for (i = 0; i < num_node_memblks; i++) {
+		struct node *nd = &node_memblk_range[i];
+
+		if (nd->start <= start && nd->end >= end &&
+			memblk_nodeid[i] == node)
+			return 1;
+	}
+
+	return 0;
+}
+
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
+{
+	int i;
+
+	for (i = 0; i < num_node_memblks; i++) {
+		struct node *nd = &node_memblk_range[i];
+		if (nd->start == nd->end)
+			continue;
+		if (nd->end > start && nd->start < end)
+			return i;
+		if (nd->end == end && nd->start == start)
+			return i;
+	}
+	return -1;
+}
+
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
+{
+	struct node *nd = &nodes[i];
+	if (nd->start < start) {
+		nd->start = start;
+		if (nd->end < nd->start)
+			nd->start = nd->end;
+	}
+	if (nd->end > end) {
+		nd->end = end;
+		if (nd->start > nd->end)
+			nd->start = nd->end;
+	}
+}
+
+/*
+ * Check to see if there are other nodes within this node's range.
+ * We just need to check full contains situation. Because overlaps
+ * have been checked before by conflicting_memblks.
+ */
+static bool __init is_node_memory_continuous(nodeid_t nid,
+    paddr_t start, paddr_t end)
+{
+	nodeid_t i;
+
+	struct node *nd = &nodes[nid];
+	for_each_node_mask(i, memory_nodes_parsed)
+	{
+		/* Skip itself */
+		if (i == nid)
+			continue;
+
+		nd = &nodes[i];
+		if (start < nd->start && nd->end < end)
+		{
+			printk(KERN_ERR
+			       "NODE %u: (%"PRIpaddr"-%"PRIpaddr") intertwine with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
+			       nid, start, end, i, nd->start, nd->end);
+			return false;
+		}
+	}
+
+	return true;
+}
+
+/* Neutral NUMA memory affinity init function for ACPI and DT */
+int __init numa_update_node_memblks(nodeid_t node,
+		paddr_t start, paddr_t size, bool hotplug)
+{
+	paddr_t end = start + size;
+	int i;
+
+	/* It is fine to add this area to the nodes data it will be used later */
+	i = conflicting_memblks(start, end);
+	if (i < 0)
+		/* everything fine */;
+	else if (memblk_nodeid[i] == node) {
+		bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
+
+		printk("%sSRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
+		       mismatch ? KERN_ERR : KERN_WARNING, node, start, end,
+		       node_memblk_range[i].start, node_memblk_range[i].end);
+		if (mismatch) {
+			return -1;
+		}
+	} else {
+		printk(KERN_ERR
+		       "SRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
+		       node, start, end, memblk_nodeid[i],
+		       node_memblk_range[i].start, node_memblk_range[i].end);
+		return -1;
+	}
+
+	if (!hotplug) {
+		struct node *nd = &nodes[node];
+
+		if (!node_test_and_set(node, memory_nodes_parsed)) {
+			nd->start = start;
+			nd->end = end;
+		} else {
+			if (start < nd->start)
+				nd->start = start;
+			if (nd->end < end)
+				nd->end = end;
+
+			if (!is_node_memory_continuous(node, nd->start, nd->end))
+				return -1;
+		}
+	}
+
+	printk(KERN_INFO "SRAT: Node %u %"PRIpaddr"-%"PRIpaddr"%s\n",
+	       node, start, end, hotplug ? " (hotplug)" : "");
+
+	node_memblk_range[num_node_memblks].start = start;
+	node_memblk_range[num_node_memblks].end = end;
+	memblk_nodeid[num_node_memblks] = node;
+	if (hotplug) {
+		__set_bit(num_node_memblks, memblk_hotplug);
+		if (end > mem_hotplug_boundary())
+			mem_hotplug_update_boundary(end);
+	}
+	num_node_memblks++;
+
+	return 0;
+}
+
+/* Sanity check to catch more bad SRATs (they are amazingly common).
+   Make sure the PXMs cover all memory. */
+static int __init nodes_cover_memory(void)
+{
+	int i;
+	uint32_t nr_banks = arch_meminfo_get_nr_bank();
+
+	for (i = 0; i < nr_banks; i++) {
+		int j, found;
+		paddr_t start, end;
+
+		if (arch_meminfo_get_ram_bank_range(i, &start, &end))
+			continue;
+
+		do {
+			found = 0;
+			for_each_node_mask(j, memory_nodes_parsed)
+				if (start < nodes[j].end
+				    && end > nodes[j].start) {
+					if (start >= nodes[j].start) {
+						start = nodes[j].end;
+						found = 1;
+					}
+					if (end <= nodes[j].end) {
+						end = nodes[j].start;
+						found = 1;
+					}
+				}
+		} while (found && start < end);
+
+		if (start < end) {
+			printk(KERN_ERR "SRAT: No NODE for memory map range: "
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
+			return 0;
+		}
+	}
+	return 1;
+}
+
+/* Use the information discovered above to actually set up the nodes. */
+int __init numa_scan_nodes(paddr_t start, paddr_t end)
+{
+	int i;
+	nodemask_t all_nodes_parsed;
+
+	/* First clean up the node list */
+	for (i = 0; i < MAX_NUMNODES; i++)
+		cutoff_node(i, start, end);
+
+	if (fw_numa <= 0)
+		return -1;
+
+	if (!nodes_cover_memory()) {
+		bad_srat();
+		return -1;
+	}
+
+	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
+				memblk_nodeid);
+
+	if (memnode_shift < 0) {
+		printk(KERN_ERR
+		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
+		bad_srat();
+		return -1;
+	}
+
+	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+	/* Finally register nodes */
+	for_each_node_mask(i, all_nodes_parsed)
+	{
+		paddr_t size = nodes[i].end - nodes[i].start;
+		if ( size == 0 )
+			printk(KERN_WARNING "SRAT: Node %u has no memory. "
+			       "Firmware Bug or mis-configured hardware?\n", i);
+
+		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+	}
+	for (i = 0; i < nr_cpu_ids; i++) {
+		if (cpu_to_node[i] == NUMA_NO_NODE)
+			continue;
+		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
+			numa_set_node(i, NUMA_NO_NODE);
+	}
+	numa_init_array();
+	return 0;
+}
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 2add971072..2140461ff3 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -101,10 +101,6 @@ extern unsigned long acpi_wakeup_address;
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern s8 fw_numa;
-extern int numa_scan_nodes(u64 start, u64 end);
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
-
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
 struct xenpf_enter_acpi_sleep;
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index a5690a7098..cd407804c8 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -7,85 +7,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start,end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
-
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
 
-
-extern int srat_disabled(void);
-extern void bad_srat(void);
-extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
-extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
-
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-extern bool numa_memblks_available(void);
-extern int numa_update_node_memblks(nodeid_t node,
-		paddr_t start, paddr_t size, bool hotplug);
-extern void numa_set_processor_nodes_parsed(nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
-extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 unsigned int arch_have_default_dmazone(void);
-extern uint32_t arch_meminfo_get_nr_bank(void);
-extern int arch_meminfo_get_ram_bank_range(uint32_t bank,
-    paddr_t *start, paddr_t *end);
 
 #endif
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 24be46115d..63838ba2d1 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -17,7 +17,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 52950a3150..51391a2440 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -12,10 +12,92 @@
 #define MAX_NUMNODES    1
 #endif
 
+#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
+
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
 #define domain_to_node(d) \
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)		(cpu_to_node[cpu])
+#define parent_node(node)		(node)
+#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
+#define node_to_cpumask(node)    (node_to_cpumask[node])
+
+struct node {
+	paddr_t start,end;
+};
+
+extern int compute_hash_shift(struct node *nodes, int numnodes,
+			      nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern void numa_add_cpu(int cpu);
+extern void numa_init_array(void);
+extern bool numa_off;
+extern s8 fw_numa;
+
+extern int srat_disabled(void);
+extern void srat_detect_node(int cpu);
+extern void bad_srat(void);
+
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern void numa_set_node(int cpu, nodeid_t node);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(int cpu)
+{
+	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern int memnode_shift;
+extern unsigned long memnodemapsize;
+extern u8 *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
+{
+	nodeid_t nid;
+	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+	return nid;
+}
+
+#define NODE_DATA(nid)		(&(node_data[nid]))
+
+#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+				 NODE_DATA(nid)->node_spanned_pages)
+
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern int numa_update_node_memblks(nodeid_t node,
+		paddr_t start, paddr_t size, bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
+extern int numa_scan_nodes(u64 start, u64 end);
+
+extern u8 __node_distance(nodeid_t a, nodeid_t b);
+extern uint32_t arch_meminfo_get_nr_bank(void);
+extern int arch_meminfo_get_ram_bank_range(uint32_t bank,
+    paddr_t *start, paddr_t *end);
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


