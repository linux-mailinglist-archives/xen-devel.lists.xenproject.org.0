Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6A3FE984
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176921.322119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYt-0005d2-8K; Thu, 02 Sep 2021 06:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176921.322119; Thu, 02 Sep 2021 06:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYs-0005LP-Mc; Thu, 02 Sep 2021 06:50:58 +0000
Received: by outflank-mailman (input) for mailman id 176921;
 Thu, 02 Sep 2021 06:07:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsa-0004fO-NW
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.101.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68a4c72f-d06d-41dc-b586-46d6db34e47a;
 Thu, 02 Sep 2021 06:07:13 +0000 (UTC)
Received: from SA0PR11CA0205.namprd11.prod.outlook.com (2603:10b6:806:1bc::30)
 by DM6PR02MB4955.namprd02.prod.outlook.com (2603:10b6:5:11::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:07:11 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::14) by SA0PR11CA0205.outlook.office365.com
 (2603:10b6:806:1bc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:06:58 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:06:58 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsI-000F6q-7C; Wed, 01 Sep 2021 23:06:58 -0700
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
X-Inumbo-ID: 68a4c72f-d06d-41dc-b586-46d6db34e47a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTzketYN7Sz9QYVI5TRbaykYekb6lQdCGNL14wDwjJbJvkqKNVRJCetHXBYkG+hsmyd2Ec8byYIh61Gtd2EfhNv6hb1OZQmxvAJFlVSjrJZkajCzIt1gklA0SW5eD820aD3fY4CFtvmf0mHa94SgyWefsoiIGE2omU+sX7X4WRAdIDIj37C6YiSZNFG4wRBfqpdnLOqg8LqpIaElCJoPa4kc5jt69+btV+7MVARN50Zx3Vu9rB8/QzHdYkNWb1GzlmiZqCF5xKw4iScINXD4X6ROBD6N+iyo4cEObCCVMxtuUlz2qPvNKTSiqusuDCEyPbJEKHNJd6j+Xn2+B36tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odPD3Pqm1GqjPKTu4SCQEahFowuxrRf5d2NDi//Xqhc=;
 b=b7t7Q08EDV9jbIAi9YacfuBNdYe5UT9DpmdR6zksyt/pmhLaGS2kRte8K2x4uJaEm1NWO9Op5HQKZ91pulo2xbQKc2MWcAy0iyGt0rNlJOvfWNZ1gfqN+kcnNhhAQx8niMQQNIUPx8MelvpDp/Fd3bftwrhxpk4quWX3He2RBQ5nXzbYfFQFv9e0fJitZRMvba7N4Y3o7tz2NiL25fwOOuTTo05iHtxSl4xZmQlB3eZTdGSssp9UAawVn9G00bkhmYYy9U/CihHVRADRV0qxkhHQEixrShWiwoU8Yqm8S+8kOvxPM8/FNRzvu7pMOFbq6E8hdCZ68Zl+zjWVxdZn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odPD3Pqm1GqjPKTu4SCQEahFowuxrRf5d2NDi//Xqhc=;
 b=ptPq88z/q1iJFHOMrdxAUhpYrrVwcYiB+PwZY66JsKYHwoqXy9IQ133PTfzXon9J80oEQU/sriailXFqa2EXkeJeejxPwYvTGTU1IemAuXExyfpRgWL+DL4VVKHZNNKqgRhkx+94la5pgFnFq/6i2nBjTrj/mRXo0cPoqY1nW4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH 04/13] libfdt: Copy required libfdt functions from Linux
Date: Wed, 1 Sep 2021 23:05:54 -0700
Message-ID: <1630562763-390068-5-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8327c211-e114-4ee9-c4a0-08d96dd7e711
X-MS-TrafficTypeDiagnostic: DM6PR02MB4955:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB495574433775A4EC89D28ECDBCCE9@DM6PR02MB4955.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cnMudUiEYwg/DRZQQkVkoNMDqoPlKtpzwpPFJo7zR8JLQKmfQrcYbRsNCvbg5qnJkg+uaCcQwgsriP26Jxf2LXmVRuAYzfbj4Z/29wGNs0lLrQyqoJ+5zzUa693okFFhTgRSmPx3BmfeU14ssAhxNHLtwAzZyG5vLj5xVkiT3SyLaH5Zdhy5V6u+uni9bxXwxgR2RxqhgooqPAjciVrZGBSemg0bOlZyncSpCBfICq5SaIGN9WMJI+Z/GlWCQAgjK4Az3DcemyaqG9+vmIaQdWj4+crR+/P62B8QW58x9pCy2yuyFR647M43LHE6xXMwJDuf306VPsCITNoSYfD1UPK4Tv8wifiCrwDMkIgpVtR6IDJ5W4MOviwPdbQrjRwXOCmm4yWKqRVaZwjt2xGhaqRx2fL1IPLggcodKjr1nUN4IlsvdXPRtHXWubnPufa2NBth9VoYgZfKV/ccIqfqL1xhCePueVMrFBlc3G/EERsFKIqjS0JKygrwHqDCu17zmug8CRjf1/28MPDeO91F9bbAfPgQNxdiXH4yrCUveMJRy9KRCDuwEDd8bh1z+TJfrBsFm5i35botvPmsX3jLVxv7a4EjPNr1YQU1/5TkRbj7HmOOpgh6Ivmu6xQam2X7fAIBmCSUrTmj8S5YbyvBH1ZE5jYHC1gmojKwzCKjy4MB7jkNKU2xVGSKnYnpNIGk551FBZi2fpc28QysuVyu1qmgVEiKnhr11zBwZMf4euM=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(47076005)(426003)(186003)(36756003)(107886003)(6666004)(8676002)(2616005)(7636003)(2906002)(70586007)(6916009)(70206006)(82310400003)(83380400001)(82740400003)(26005)(36906005)(336012)(356005)(316002)(478600001)(5660300002)(7696005)(4326008)(9786002)(54906003)(36860700001)(30864003)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:11.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8327c211-e114-4ee9-c4a0-08d96dd7e711
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4955

fdt_overlay.c uses a number of functions. Below is the list of functions copied
from Linux tree(commid: 6e9c9686d826564f44c93cdd6f111b1c0a9dc224) to compile
the fdt_overlay.c():

libfdt_internal.h: FDT_RO_PROBE() and can_assume().

libfdt.h: fdt_for_each_subnode(), fdt_get_max_phandle(),
    fdt_for_each_property_offset() and fdt_getprop_namelen_w().

fdt.c: fdt_ro_probe_().

fdt_ro.c: fdt_find_max_phandle(), fdt_path_offset_namelen() and
   fdt_path_offset().

fdt_rw.c: fdt_rw_probe_(), FDT_RW_PROBE(), fdt_del_last_string_(),
     fdt_setprop_placeholder() and fdt_setprop().

fdt_wip.c: fdt_setprop_inplace_namelen_partial().

Updated fdt_rw.c: _fdt_find_add_string() with required changes from Linux
    fdt_rw.c:fdt_find_add_string_().
Updated fdt_rw.c: _fdt_add_property() with required changes from Linux
    fdt_rw.c:fdt_find_add_string_().

Replaced strtoul() with simple_strtoull().

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/Makefile.libfdt   |   2 +-
 xen/common/libfdt/fdt.c             |  35 ++++++
 xen/common/libfdt/fdt_overlay.c     |   6 +-
 xen/common/libfdt/fdt_ro.c          |  52 ++++++--
 xen/common/libfdt/fdt_rw.c          |  81 +++++++++++--
 xen/common/libfdt/fdt_wip.c         |  20 ++++
 xen/common/libfdt/libfdt_internal.h | 130 ++++++++++++++++++++
 xen/include/xen/libfdt/libfdt.h     | 230 +++++++++++++++++++++++++++++++++++-
 8 files changed, 536 insertions(+), 20 deletions(-)

diff --git a/xen/common/libfdt/Makefile.libfdt b/xen/common/libfdt/Makefile.libfdt
index 91126c0..aea9d9b 100644
--- a/xen/common/libfdt/Makefile.libfdt
+++ b/xen/common/libfdt/Makefile.libfdt
@@ -6,5 +6,5 @@
 LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
-LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c
+LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c fdt_overlay.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
index bbc7717..55a9de6 100644
--- a/xen/common/libfdt/fdt.c
+++ b/xen/common/libfdt/fdt.c
@@ -53,6 +53,41 @@
 
 #include "libfdt_internal.h"
 
+/*
+ * Minimal sanity check for a read-only tree. fdt_ro_probe_() checks
+ * that the given buffer contains what appears to be a flattened
+ * device tree with sane information in its header.
+ */
+int32_t fdt_ro_probe_(const void *fdt)
+{
+	uint32_t totalsize = fdt_totalsize(fdt);
+
+	if (can_assume(VALID_DTB))
+		return totalsize;
+
+	if (fdt_magic(fdt) == FDT_MAGIC) {
+		/* Complete tree */
+		if (!can_assume(LATEST)) {
+			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+			if (fdt_last_comp_version(fdt) >
+					FDT_LAST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+		}
+	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
+		/* Unfinished sequential-write blob */
+		if (!can_assume(VALID_INPUT) && fdt_size_dt_struct(fdt) == 0)
+			return -FDT_ERR_BADSTATE;
+	} else {
+		return -FDT_ERR_BADMAGIC;
+	}
+
+	if (totalsize < INT32_MAX)
+		return totalsize;
+	else
+		return -FDT_ERR_TRUNCATED;
+}
+
 int fdt_check_header(const void *fdt)
 {
 	if (fdt_magic(fdt) == FDT_MAGIC) {
diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
index d217e79..15a8cdb 100644
--- a/xen/common/libfdt/fdt_overlay.c
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -9,6 +9,7 @@
 #include <fdt.h>
 #include <libfdt.h>
 
+#include <xen/lib.h>
 #include "libfdt_internal.h"
 
 /**
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
+		poffset = simple_strtoull(sep + 1, &endptr, 10);
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 36f9b48..383791d 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -86,6 +86,34 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 	return (strlen(p) == len) && (memcmp(p, s, len) == 0);
 }
 
+int fdt_find_max_phandle(const void *fdt, uint32_t *phandle)
+{
+	uint32_t max = 0;
+	int offset = -1;
+
+	while (true) {
+		uint32_t value;
+
+		offset = fdt_next_node(fdt, offset, NULL);
+		if (offset < 0) {
+			if (offset == -FDT_ERR_NOTFOUND)
+				break;
+
+			return offset;
+		}
+
+		value = fdt_get_phandle(fdt, offset);
+
+		if (value > max)
+			max = value;
+	}
+
+	if (phandle)
+		*phandle = max;
+
+	return 0;
+}
+
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
 	FDT_CHECK_HEADER(fdt);
@@ -152,17 +180,17 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name));
 }
 
-int fdt_path_offset(const void *fdt, const char *path)
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
-	const char *end = path + strlen(path);
+	const char *end = path + namelen;
 	const char *p = path;
 	int offset = 0;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = strchr(path, '/');
+		const char *q = memchr(path, '/', end - p);
 
 		if (!q)
 			q = end;
@@ -175,14 +203,15 @@ int fdt_path_offset(const void *fdt, const char *path)
 		p = q;
 	}
 
-	while (*p) {
+	while (p < end) {
 		const char *q;
 
-		while (*p == '/')
+		while (*p == '/') {
 			p++;
-		if (! *p)
-			return offset;
-		q = strchr(p, '/');
+			if (p == end)
+				return offset;
+		}
+		q = memchr(p, '/', end - p);
 		if (! q)
 			q = end;
 
@@ -196,6 +225,11 @@ int fdt_path_offset(const void *fdt, const char *path)
 	return offset;
 }
 
+int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = _fdt_offset_ptr(fdt, nodeoffset);
diff --git a/xen/common/libfdt/fdt_rw.c b/xen/common/libfdt/fdt_rw.c
index 8b8cd25..fc53644 100644
--- a/xen/common/libfdt/fdt_rw.c
+++ b/xen/common/libfdt/fdt_rw.c
@@ -65,6 +65,30 @@ static int _fdt_blocks_misordered(const void *fdt,
 		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
 }
 
+static int fdt_rw_probe_(void *fdt)
+{
+	if (can_assume(VALID_DTB))
+		return 0;
+	FDT_RO_PROBE(fdt);
+
+	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
+		return -FDT_ERR_BADVERSION;
+	if (_fdt_blocks_misordered(fdt, sizeof(struct fdt_reserve_entry),
+				   fdt_size_dt_struct(fdt)))
+		return -FDT_ERR_BADLAYOUT;
+	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
+		fdt_set_version(fdt, 17);
+
+	return 0;
+}
+
+#define FDT_RW_PROBE(fdt) \
+	{ \
+		int err_; \
+		if ((err_ = fdt_rw_probe_(fdt)) != 0) \
+			return err_; \
+	}
+
 static int _fdt_rw_check_header(void *fdt)
 {
 	FDT_CHECK_HEADER(fdt);
@@ -133,6 +157,14 @@ static int _fdt_splice_struct(void *fdt, void *p,
 	return 0;
 }
 
+/* Must only be used to roll back in case of error */
+static void fdt_del_last_string_(void *fdt, const char *s)
+{
+	int newlen = strlen(s) + 1;
+
+	fdt_set_size_dt_strings(fdt, fdt_size_dt_strings(fdt) - newlen);
+}
+
 static int _fdt_splice_string(void *fdt, int newlen)
 {
 	void *p = (char *)fdt
@@ -146,7 +178,16 @@ static int _fdt_splice_string(void *fdt, int newlen)
 	return 0;
 }
 
-static int _fdt_find_add_string(void *fdt, const char *s)
+/**
+ * New _fdt_find_add_string() - Find or allocate a string
+ *
+ * @fdt: pointer to the device tree to check/adjust
+ * @s: string to find/add
+ * @allocated: Set to 0 if the string was found, 1 if not found and so
+ *  allocated. Ignored if can_assume(NO_ROLLBACK)
+ * @return offset of string in the string table (whether found or added)
+ */
+static int _fdt_find_add_string(void *fdt, const char *s, int *allocated)
 {
 	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
 	const char *p;
@@ -154,6 +195,9 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	int len = strlen(s) + 1;
 	int err;
 
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 0;
+
 	p = _fdt_find_string(strtab, fdt_size_dt_strings(fdt), s);
 	if (p)
 		/* found it */
@@ -164,6 +208,9 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	if (err)
 		return err;
 
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 1;
+
 	memcpy(new, s, len);
 	return (new - strtab);
 }
@@ -226,11 +273,12 @@ static int _fdt_add_property(void *fdt, int nodeoffset, const char *name,
 	int nextoffset;
 	int namestroff;
 	int err;
+	int allocated;
 
 	if ((nextoffset = _fdt_check_node_offset(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
-	namestroff = _fdt_find_add_string(fdt, name);
+	namestroff = _fdt_find_add_string(fdt, name, &allocated);
 	if (namestroff < 0)
 		return namestroff;
 
@@ -238,8 +286,12 @@ static int _fdt_add_property(void *fdt, int nodeoffset, const char *name,
 	proplen = sizeof(**prop) + FDT_TAGALIGN(len);
 
 	err = _fdt_splice_struct(fdt, *prop, 0, proplen);
-	if (err)
+	if (err) {
+		/* Delete the string if we failed to add it */
+		if (!can_assume(NO_ROLLBACK) && allocated)
+			fdt_del_last_string_(fdt, name);
 		return err;
+	}
 
 	(*prop)->tag = cpu_to_fdt32(FDT_PROP);
 	(*prop)->nameoff = cpu_to_fdt32(namestroff);
@@ -270,13 +322,13 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 	return 0;
 }
 
-int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-		const void *val, int len)
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+				int len, void **prop_data)
 {
 	struct fdt_property *prop;
 	int err;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	err = _fdt_resize_property(fdt, nodeoffset, name, len, &prop);
 	if (err == -FDT_ERR_NOTFOUND)
@@ -284,7 +336,22 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 	if (err)
 		return err;
 
-	memcpy(prop->data, val, len);
+	*prop_data = prop->data;
+	return 0;
+}
+
+int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+		const void *val, int len)
+{
+	void *prop_data;
+	int err;
+
+	err = fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
+	if (err)
+		return err;
+
+	if (len)
+		memcpy(prop_data, val, len);
 	return 0;
 }
 
diff --git a/xen/common/libfdt/fdt_wip.c b/xen/common/libfdt/fdt_wip.c
index 2d1cac0..3f61085 100644
--- a/xen/common/libfdt/fdt_wip.c
+++ b/xen/common/libfdt/fdt_wip.c
@@ -53,6 +53,26 @@
 
 #include "libfdt_internal.h"
 
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len)
+{
+	void *propval;
+	int proplen;
+
+	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
+					&proplen);
+	if (!propval)
+		return proplen;
+
+	if ((unsigned)proplen < (len + idx))
+		return -FDT_ERR_NOSPACE;
+
+	memcpy((char *)propval + idx, val, len);
+	return 0;
+}
+
 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 			const void *val, int len)
 {
diff --git a/xen/common/libfdt/libfdt_internal.h b/xen/common/libfdt/libfdt_internal.h
index d50c4e1..523bcee 100644
--- a/xen/common/libfdt/libfdt_internal.h
+++ b/xen/common/libfdt/libfdt_internal.h
@@ -60,6 +60,14 @@
 			return err; \
 	}
 
+int32_t fdt_ro_probe_(const void *fdt);
+#define FDT_RO_PROBE(fdt)					\
+	{							\
+		int32_t totalsize_;				\
+		if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
+			return totalsize_;			\
+	}
+
 int _fdt_check_node_offset(const void *fdt, int offset);
 int _fdt_check_prop_offset(const void *fdt, int offset);
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s);
@@ -90,4 +98,126 @@ static inline struct fdt_reserve_entry *_fdt_mem_rsv_w(void *fdt, int n)
 
 #define FDT_SW_MAGIC		(~FDT_MAGIC)
 
+/**********************************************************************/
+/* Checking controls                                                  */
+/**********************************************************************/
+
+#ifndef FDT_ASSUME_MASK
+#define FDT_ASSUME_MASK 0
+#endif
+
+/*
+ * Defines assumptions which can be enabled. Each of these can be enabled
+ * individually. For maximum safety, don't enable any assumptions!
+ *
+ * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
+ * You should have another method of validating the device tree, such as a
+ * signature or hash check before using libfdt.
+ *
+ * For situations where security is not a concern it may be safe to enable
+ * ASSUME_SANE.
+ */
+enum {
+	/*
+	 * This does essentially no checks. Only the latest device-tree
+	 * version is correctly handled. Inconsistencies or errors in the device
+	 * tree may cause undefined behaviour or crashes. Invalid parameters
+	 * passed to libfdt may do the same.
+	 *
+	 * If an error occurs when modifying the tree it may leave the tree in
+	 * an intermediate (but valid) state. As an example, adding a property
+	 * where there is insufficient space may result in the property name
+	 * being added to the string table even though the property itself is
+	 * not added to the struct section.
+	 *
+	 * Only use this if you have a fully validated device tree with
+	 * the latest supported version and wish to minimise code size.
+	 */
+	ASSUME_PERFECT		= 0xff,
+
+	/*
+	 * This assumes that the device tree is sane. i.e. header metadata
+	 * and basic hierarchy are correct.
+	 *
+	 * With this assumption enabled, normal device trees produced by libfdt
+	 * and the compiler should be handled safely. Malicious device trees and
+	 * complete garbage may cause libfdt to behave badly or crash. Truncated
+	 * device trees (e.g. those only partially loaded) can also cause
+	 * problems.
+	 *
+	 * Note: Only checks that relate exclusively to the device tree itself
+	 * (not the parameters passed to libfdt) are disabled by this
+	 * assumption. This includes checking headers, tags and the like.
+	 */
+	ASSUME_VALID_DTB	= 1 << 0,
+
+	/*
+	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
+	 * functions are called with valid parameters, i.e. not trigger
+	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables any
+	 * extensive checking of parameters and the device tree, making various
+	 * assumptions about correctness.
+	 *
+	 * It doesn't make sense to enable this assumption unless
+	 * ASSUME_VALID_DTB is also enabled.
+	 */
+	ASSUME_VALID_INPUT	= 1 << 1,
+
+	/*
+	 * This disables checks for device-tree version and removes all code
+	 * which handles older versions.
+	 *
+	 * Only enable this if you know you have a device tree with the latest
+	 * version.
+	 */
+	ASSUME_LATEST		= 1 << 2,
+
+	/*
+	 * This assumes that it is OK for a failed addition to the device tree,
+	 * due to lack of space or some other problem, to skip any rollback
+	 * steps (such as dropping the property name from the string table).
+	 * This is safe to enable in most circumstances, even though it may
+	 * leave the tree in a sub-optimal state.
+	 */
+	ASSUME_NO_ROLLBACK	= 1 << 3,
+
+	/*
+	 * This assumes that the device tree components appear in a 'convenient'
+	 * order, i.e. the memory reservation block first, then the structure
+	 * block and finally the string block.
+	 *
+	 * This order is not specified by the device-tree specification,
+	 * but is expected by libfdt. The device-tree compiler always created
+	 * device trees with this order.
+	 *
+	 * This assumption disables a check in fdt_open_into() and removes the
+	 * ability to fix the problem there. This is safe if you know that the
+	 * device tree is correctly ordered. See fdt_blocks_misordered_().
+	 */
+	ASSUME_LIBFDT_ORDER	= 1 << 4,
+
+	/*
+	 * This assumes that libfdt itself does not have any internal bugs. It
+	 * drops certain checks that should never be needed unless libfdt has an
+	 * undiscovered bug.
+	 *
+	 * This can generally be considered safe to enable.
+	 */
+	ASSUME_LIBFDT_FLAWLESS	= 1 << 5,
+};
+
+/**
+ * can_assume_() - check if a particular assumption is enabled
+ *
+ * @mask: Mask to check (ASSUME_...)
+ * @return true if that assumption is enabled, else false
+ */
+static inline bool can_assume_(int mask)
+{
+	return FDT_ASSUME_MASK & mask;
+}
+
+/** helper macros for checking assumptions */
+#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
+
 #endif /* _LIBFDT_INTERNAL_H */
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index 7c75688..b6c8b67 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -114,7 +114,30 @@
 	 * Should never be returned, if it is, it indicates a bug in
 	 * libfdt itself. */
 
-#define FDT_ERR_MAX		13
+/* Errors in device tree content */
+#define FDT_ERR_BADNCELLS	14
+	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
+	 * or similar property with a bad format or value */
+
+#define FDT_ERR_BADVALUE	15
+	/* FDT_ERR_BADVALUE: Device tree has a property with an unexpected
+	 * value. For example: a property expected to contain a string list
+	 * is not NUL-terminated within the length of its value. */
+
+#define FDT_ERR_BADOVERLAY	16
+	/* FDT_ERR_BADOVERLAY: The device tree overlay, while
+	 * correctly structured, cannot be applied due to some
+	 * unexpected or missing value, property or node. */
+
+#define FDT_ERR_NOPHANDLES	17
+	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
+	 * phandle available anymore without causing an overflow */
+
+#define FDT_ERR_BADFLAGS	18
+	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
+	 * contains invalid flags or an invalid combination of flags. */
+
+#define FDT_ERR_MAX		18
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -156,6 +179,33 @@ int fdt_first_subnode(const void *fdt, int offset);
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_subnode - iterate over all subnodes of a parent
+ *
+ * @node:	child node (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @parent:	parent node (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_subnode(node, fdt, parent) {
+ *		Use node
+ *		...
+ *	}
+ *
+ *	if ((node < 0) && (node != -FDT_ERR_NOTFOUND)) {
+ *		Error handling
+ *	}
+ *
+ * Note that this is implemented as a macro and @node is used as
+ * iterator in the loop. The parent variable be constant or even a
+ * literal.
+ */
+#define fdt_for_each_subnode(node, fdt, parent)		\
+	for (node = fdt_first_subnode(fdt, parent);	\
+	     node >= 0;					\
+	     node = fdt_next_subnode(fdt, node))
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
@@ -247,6 +297,47 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
 const char *fdt_string(const void *fdt, int stroffset);
 
 /**
+ * fdt_find_max_phandle - find and return the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ * @phandle: return location for the highest phandle value found in the tree
+ *
+ * fdt_find_max_phandle() finds the highest phandle value in the given device
+ * tree. The value returned in @phandle is only valid if the function returns
+ * success.
+ *
+ * returns:
+ *     0 on success or a negative error code on failure
+ */
+int fdt_find_max_phandle(const void *fdt, uint32_t *phandle);
+
+/**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandle in the given
+ * device tree. This will ignore badly formatted phandles, or phandles
+ * with a value of 0 or -1.
+ *
+ * This function is deprecated in favour of fdt_find_max_phandle().
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if no phandle was found in the device tree
+ *      -1, if an error occurred
+ */
+static inline uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t phandle;
+	int err;
+
+	err = fdt_find_max_phandle(fdt, &phandle);
+	if (err < 0)
+		return (uint32_t)-1;
+
+	return phandle;
+}
+
+/**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
  *
@@ -316,6 +407,21 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
 
 /**
+ * fdt_path_offset_namelen - find a tree node by its full path
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @namelen: number of characters of path to consider
+ *
+ * Identical to fdt_path_offset(), but only consider the first namelen
+ * characters of path as the path name.
+ *
+ * Return: offset of the node or negative libfdt error value otherwise
+ */
+#ifndef SWIG /* Not available in Python */
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
+#endif
+
+/**
  * fdt_path_offset - find a tree node by its full path
  * @fdt: pointer to the device tree blob
  * @path: full path of the node to locate
@@ -404,6 +510,33 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
 int fdt_next_property_offset(const void *fdt, int offset);
 
 /**
+ * fdt_for_each_property_offset - iterate over all properties of a node
+ *
+ * @property:	property offset (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @node:	node offset (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_property_offset(property, fdt, node) {
+ *		Use property
+ *		...
+ *	}
+ *
+ *	if ((property < 0) && (property != -FDT_ERR_NOTFOUND)) {
+ *		Error handling
+ *	}
+ *
+ * Note that this is implemented as a macro and property is used as
+ * iterator in the loop. The node variable can be constant or even a
+ * literal.
+ */
+#define fdt_for_each_property_offset(property, fdt, node)	\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
+/**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
  * @offset: offset of the property to retrieve
@@ -532,6 +665,14 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp);
 
+static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
+					  const char *name, int namelen,
+					  int *lenp)
+{
+	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
+							  namelen, lenp);
+}
+
 /**
  * fdt_getprop - retrieve the value of a given property
  * @fdt: pointer to the device tree blob
@@ -993,6 +1134,31 @@ static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
 int fdt_nop_property(void *fdt, int nodeoffset, const char *name);
 
 /**
+ * fdt_setprop_inplace_namelen_partial - change a property's value,
+ *                                       but not its size
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: number of characters of name to consider
+ * @idx: index of the property to change in the array
+ * @val: pointer to data to replace the property value with
+ * @len: length of the property value
+ *
+ * Identical to fdt_setprop_inplace(), but modifies the given property
+ * starting from the given index, and using only the first characters
+ * of the name. It is useful when you want to manipulate only one value of
+ * an array and you have a string that doesn't end with \0.
+ *
+ * Return: 0 on success, negative libfdt error value otherwise
+ */
+#ifndef SWIG /* Not available in Python */
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len);
+#endif
+
+/**
  * fdt_nop_node - replace a node (subtree) with nop tags
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node to nop
@@ -1158,6 +1324,37 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 		const void *val, int len);
 
 /**
+ * fdt_setprop_placeholder - allocate space for a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @len: length of the property value
+ * @prop_data: return pointer to property data
+ *
+ * fdt_setprop_placeholer() allocates the named property in the given node.
+ * If the property exists it is resized. In either case a pointer to the
+ * property data is returned.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+			    int len, void **prop_data);
+
+/**
  * fdt_setprop_u32 - set a property to a 32-bit integer
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to change
@@ -1503,6 +1700,37 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
  */
 int fdt_del_node(void *fdt, int nodeoffset);
 
+/**
+ * fdt_overlay_apply - Applies a DT overlay on a base DT
+ * @fdt: pointer to the base device tree blob
+ * @fdto: pointer to the device tree overlay blob
+ *
+ * fdt_overlay_apply() will apply the given device tree overlay on the
+ * given base device tree.
+ *
+ * Expect the base device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
+ *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
+ *		properties in the base DT
+ *	-FDT_ERR_BADPHANDLE,
+ *	-FDT_ERR_BADOVERLAY,
+ *	-FDT_ERR_NOPHANDLES,
+ *	-FDT_ERR_INTERNAL,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET,
+ *	-FDT_ERR_BADPATH,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_overlay_apply(void *fdt, void *fdto);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
-- 
2.7.4


