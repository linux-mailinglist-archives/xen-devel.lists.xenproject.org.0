Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF6446853
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 19:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222585.384863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oN-0006BZ-IE; Fri, 05 Nov 2021 18:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222585.384863; Fri, 05 Nov 2021 18:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oN-00069h-Eb; Fri, 05 Nov 2021 18:19:35 +0000
Received: by outflank-mailman (input) for mailman id 222585;
 Fri, 05 Nov 2021 18:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0iX8=PY=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mj3oM-00069X-Ak
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 18:19:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea95c5de-3e64-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 19:19:31 +0100 (CET)
Received: from DM6PR18CA0017.namprd18.prod.outlook.com (2603:10b6:5:15b::30)
 by SN6PR02MB4685.namprd02.prod.outlook.com (2603:10b6:805:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Fri, 5 Nov
 2021 18:19:27 +0000
Received: from DM3NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::c4) by DM6PR18CA0017.outlook.office365.com
 (2603:10b6:5:15b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 18:19:27 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT052.mail.protection.outlook.com (10.13.5.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 18:19:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Nov 2021 11:19:25 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 5 Nov 2021 11:19:25 -0700
Received: from [172.19.2.115] (port=34588 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mj3oD-0006lr-JN; Fri, 05 Nov 2021 11:19:25 -0700
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
X-Inumbo-ID: ea95c5de-3e64-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke9mDQgbgYpcu34owtBJvWOtHxxwtybNKZJFfvP2lCr6DEMPNfNQcB7o2KJCkykSeqDAJ1Zu5huwCY6GLATG1PCgICWKkMdvC4sdZ1SVXxbxYeuaB2SKoqOkiogqnTIvK0lRhr6KJexiLm/i0NG3bpwRXsNRbngl5ZQ0fAEbMhK8OG8w4grSvIGeiFGKaWxFcR2qc4xaiBF4RTJikBIUek9KK4SYh/LEVpudOOKP4zQWkMUrALEsZnyim7HzAyLobEqGDfjK9NdZVLRgqOzEg65cnHGfTaZIsv6F+LsXEW0Hyp2/X+HZDhRNfwxs0VHMhM34SxKD1glW7rE5cCrRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyL1tgGmUEuC7fmcxSVtgNwntAokYloJ8uUCQirAxIQ=;
 b=nLkkG2Fhx1n8bOO8/JNnfvvCCPttdBzKVRYJFYnf89naOoOxOoliio9Z0ccPVb8zE53PObQEutXzAcKms7rN6B3EhlHclUKnEiQUvDW6UGBg5iRhaE5GZl8EjqJAek1JGo5DJZeDs7o7ooN89Am2yoAtNq7g7+jZFNs/LLaf2hvPV4Lt5VyEqneoey9t/HPQFTkU1OTmDQDJsl5G7A+SOYiOMPVTTe38AtBt1PtQLRcJa/XuAQWcSz6CTOp4RKiWNIvovCNYTNejcMvCX87TXUYQnpnvna/z1QXOHOE6YYIDoEcWaRKwDswQJFBdAK2ZO+SB72S0s7qNkkf7B2gsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyL1tgGmUEuC7fmcxSVtgNwntAokYloJ8uUCQirAxIQ=;
 b=lTw5tWyOPv4dk0XQYG5r+reB+yq/zyELC+wgf3U13EIyDf3XXok+dYZ4geXA7/zXp5Ne9+D0Aq6RxzI/gAL+wwKl05Xd9YRr6Hof9OySWS67POxG333qjfLNNolX2JKw2CeMrWbg/ZlYQ6F9cddJdo8kC1fj/QEL0Po/z5AwMGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][PATCH 2/2] xen: libfdt: Changes to make libfdt v1.6.1 compatible with Xen
Date: Fri, 5 Nov 2021 11:19:14 -0700
Message-ID: <1636136354-68413-3-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80af2105-c7cc-42cb-9321-08d9a088cd54
X-MS-TrafficTypeDiagnostic: SN6PR02MB4685:
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB4685ECB7A5EB76C7886F49F1BC8E9@SN6PR02MB4685.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uKZjRGNPBU1eHgTtm5OECa7rBSzGeyTkrfVK7jv1XbPwVTWahMM/DKSj8e99ZDYAKTyTahrz6lBl/fio2EBkSMPswSWiYDM9T/AT6wzHaiCMSsY3BTHqhW0VQ6uWecLPyuO6rBBJqr4KNORdWwr6MCI6jTtZbqAIUIu2OWkG6/ipvlpp88/WxJnZhaZ4QhHYQqNqzlTeq78z7F62VMcz5rJ7M38tMpSQb7TBlZ22L7AiPl+/pLxpEKn8p4r+5hr+qT+3t6kF9DaJWWsc9aNeJDxqg7Ui5qb6Uso8LqjMQy09yXIQ7GROXzYB4gsu3+ROWORg8ZPIXKGNXuUPRGmKQEEeFf/wOSrj10xXKeHWT7KbBuh1pYGHo4oAgLh5TYIf/UFR3WkNCv366V3ppxPcOfSRl0H8Ohw2vSOb9jzzLiooc3IesoBbc1ZI5oCltqRSk54DQxNGPinqYk1koGzx5XGiFV4agsa1a1B55b/5NeMsW2j6F1hhSyS5u7P03owzO3mcxVvFcfGymTfNx4sIYIMjHzqacXArE07t8WT8A5xlswC8x8VRTs9MRLjEj6AFcmd7Er4+OxuKVOmny71CwUZ2qdBut2JNPWGIcUO+whlBt12oYhGA6XbWwhCAJyBTheFUHna76Q1bL3lEp5we13EKun8DONceuzS81ZuQYP6BQ0fF29TPf8cDu7JBRhg31b5TT4UREter4dkDhnkyEyf0iNfhjYrcNiwHYTOo9r4=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(5660300002)(7636003)(36860700001)(26005)(426003)(47076005)(107886003)(8936002)(6666004)(6916009)(83380400001)(82310400003)(336012)(316002)(70206006)(36906005)(36756003)(186003)(7696005)(356005)(508600001)(8676002)(54906003)(2906002)(9786002)(70586007)(2616005)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 18:19:26.9214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80af2105-c7cc-42cb-9321-08d9a088cd54
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4685

A few minor changes are done to make it compatible with Xen:
    fdt_overlay.c: overlay_fixup_phandle()

        Replace strtoul() with simple_strtoul() as strtoul() is not available in
        Xen lib and included lib.h.

        Change char *endptr to const char *endptr.

    libfdt_env.h:
        Changed path for config.h and stdbool.h. Remaining Xen changes to
        libfdt_env.h carried over from existing libfdt (v1.4.0)

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/fdt_overlay.c     |  6 ++++--
 xen/include/xen/libfdt/libfdt.h     |  4 ++--
 xen/include/xen/libfdt/libfdt_env.h | 14 ++++++++------
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
index d217e79..7b95e2b 100644
--- a/xen/common/libfdt/fdt_overlay.c
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -8,6 +8,7 @@
 
 #include <fdt.h>
 #include <libfdt.h>
+#include <xen/lib.h>
 
 #include "libfdt_internal.h"
 
@@ -446,7 +447,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		const char *fixup_str = value;
 		uint32_t path_len, name_len;
 		uint32_t fixup_len;
-		char *sep, *endptr;
+		char *sep;
+		const char *endptr;
 		int poffset, ret;
 
 		fixup_end = memchr(value, '\0', len);
@@ -476,7 +478,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if (!name_len)
 			return -FDT_ERR_BADOVERLAY;
 
-		poffset = strtoul(sep + 1, &endptr, 10);
+		poffset = simple_strtoul(sep + 1, &endptr, 10);
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index 73467f7..c71689e 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  */
 
-#include <libfdt_env.h>
-#include <fdt.h>
+#include <xen/libfdt/libfdt_env.h>
+#include <xen/libfdt/fdt.h>
 
 #ifdef __cplusplus
 extern "C" {
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 73b6d40..03380d5 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -7,12 +7,11 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#include <stdbool.h>
-#include <stddef.h>
-#include <stdint.h>
-#include <stdlib.h>
-#include <string.h>
-#include <limits.h>
+#include <xen/config.h>
+#include <xen/types.h>
+#include <xen/string.h>
+#include <asm/byteorder.h>
+#include <xen/stdbool.h>
 
 #ifdef __CHECKER__
 #define FDT_FORCE __attribute__((force))
@@ -35,6 +34,9 @@ typedef uint64_t FDT_BITWISE fdt64_t;
 			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
 			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
 
+/* Xen-specific libfdt error code. */
+#define FDT_ERR_XEN(err) (FDT_ERR_MAX + (err))
+
 static inline uint16_t fdt16_to_cpu(fdt16_t x)
 {
 	return (FDT_FORCE uint16_t)CPU_TO_FDT16(x);
-- 
2.7.4


