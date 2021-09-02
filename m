Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BC3FE977
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176917.322099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYr-0005Bn-S4; Thu, 02 Sep 2021 06:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176917.322099; Thu, 02 Sep 2021 06:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYr-0004z1-F0; Thu, 02 Sep 2021 06:50:57 +0000
Received: by outflank-mailman (input) for mailman id 176917;
 Thu, 02 Sep 2021 06:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsU-0004aK-4w
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.223.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b740e9e-d45e-48aa-a9e2-50634644e3d4;
 Thu, 02 Sep 2021 06:07:07 +0000 (UTC)
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 SN1PR02MB3678.namprd02.prod.outlook.com (2603:10b6:802:24::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Thu, 2 Sep 2021 06:07:05 +0000
Received: from DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::6f) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:05 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT042.mail.protection.outlook.com (10.13.4.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:03 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:03 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsN-000F6q-2G; Wed, 01 Sep 2021 23:07:03 -0700
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
X-Inumbo-ID: 6b740e9e-d45e-48aa-a9e2-50634644e3d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl4T92K7Fut2IIfUEKMpAEcvU69Hlgw4vqQXXLOgTc3QCZhwAtKznHM+TT77SjKpL+8iKTZV2if0Bq/ogNoqrBwsnX7T+oOrGxG1rbCro0PrhpjawwTpzdeBpYxyF8pFoSA8bhG6RNxLmNgcHcJqhwUOHtpXYTE5d7BEcp/IB/yk86gbUorlTmdYZOlojDET28UlZT690kpdDD3VfYUij/LnPcb8jzDYxm0DRKGaLQ+7rAt4fbjbDLdxSer+q2udMdkxk2XMxpKZ3MBC96zMq02TYTMLr+lB8uCgdSpxM/OMIzc6Gr/KGn2/sYQdAt/r7Cx334uckbIt9vi7ng5kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=98AtMQVzaAHOwKKFvylID8GyFmwvLo9S59QnYCd+rzM=;
 b=G5j+giD11VwxA/+WjkeuVgz1IKhyT5QrsNZcBBg+HfzHOPGvK/TD4n7zzgbwieSfiw4kuHNN9SSUShmjvL3fFvF/XTkyFEh77acor6VGTtm+4yrkk9YtndmWIsmziVD+9N0h2HJBuY+blFa+BaC+pRWxKsXIqLopX95qgKk18I30pa0cVtKvhdm9TJRtFqr0KO3pWnGFshhN+8GaNrCrygYYZ3vzjyJVHUu/+i3ToFA5NZCr2QPw75PVVdPZpmBrGCZbFdh3Cxr6vb7zaM4pFOlh67bWMwgl9hjzGVGvELRG7XKcoh2R3/F0r7t6A26MW0VFDRWh6yIborcIqxESXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98AtMQVzaAHOwKKFvylID8GyFmwvLo9S59QnYCd+rzM=;
 b=fEWmNfRVw1Iw8SEg1ZJOVObVMv/9iTTh6owNYcdnonI8ZYPCJGVNVTb8SUJJmGVD8VH+egahPgwdubShCsrwZwyHUKeYy87EnMpegIxRJW4PJxce9p3oQh06ta2cXK5iJUM+w4SRa5AFroCrtqfEIv2zBOn67BqTh1F8aoAkQkE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH 05/13] libfdt: Change overlay_get_target() type
Date: Wed, 1 Sep 2021 23:05:55 -0700
Message-ID: <1630562763-390068-6-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f9a09cc-64e5-4749-23cf-08d96dd7e370
X-MS-TrafficTypeDiagnostic: SN1PR02MB3678:
X-Microsoft-Antispam-PRVS:
	<SN1PR02MB3678E7AD48A1587026BC4B29BCCE9@SN1PR02MB3678.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ckx58VpUs6M3WyHg9+f3TqPbipbP2X8Vt1GQIVqSNAERsgzKnshwp3cxb9Nns37n+s5ns0VbNIB544kPvP5jy0tLHvh7SMNMggeLtvftBKBZBqEEL5SJ1yi/CKgXDuQjuzekuB5+fr+LKGPVnlNhcBmRU+bl7V69dfXqFUkzjXp6ic0Znws3VNTV3NYqcXatPYo4s472WDu/hQXjofqak6d22e/tgeFGX4el0eIRH9Z8+pADwfxVXpkrXQpCQfWN47nPcFQrIKTN+ItqgIHv7VSpvr7cNvns4K7tPEXVAVZbIlvLO+6QEv+4qsSZdQ0IWrW53dOZuxPBTNGOulf/EoITBmfrO7n7nC42oqCU8HCFwCiqEjI8r25ATcrhSvAG69J6Ro9sOfLlueIHT+8BoFWHaHR4yjbC+F+8DzwQefiGtc1bhE9a9X0ysfRYHDxzY2qNzyUyf+PBvut6oMDmfQZndm5O5UaijpHnCzB0lXwW0fMJpUCQzedaNBHmHypWBwhYibwKLQbVbfdYS93wbc+iNOfWJeTmX8533vx+SRAz1bLSlbLCMiQmYjyZCAydXqcrK+ckVgopGap6iDzd7kwuBW3Mlu8RWa1cnsXeYmBXsiJKDdl+/gdKBYoqT9cHy3NYUUAUBsZfSJgcTCFg5JCtdgKL2f1PBl6vrsJmSnrvH9/Yrhwjxke23jXA6uUY/evD5iFC2yvEpoT/aHEF4c1sSn7IAYVKKzyvtNZsb0A=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(82310400003)(47076005)(36756003)(70586007)(2616005)(336012)(6666004)(426003)(186003)(26005)(478600001)(2906002)(83380400001)(8936002)(316002)(70206006)(9786002)(8676002)(7696005)(5660300002)(36906005)(82740400003)(7636003)(356005)(54906003)(36860700001)(4326008)(107886003)(6916009)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:04.9759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9a09cc-64e5-4749-23cf-08d96dd7e370
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3678

Remove static function type from overlay_get_target().

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/fdt_overlay.c | 2 +-
 xen/include/xen/libfdt/libfdt.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
index 15a8cdb..1ffb669 100644
--- a/xen/common/libfdt/fdt_overlay.c
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -56,7 +56,7 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
  *      the targeted node offset in the base device tree
  *      Negative error code on error
  */
-static int overlay_get_target(const void *fdt, const void *fdto,
+int overlay_get_target(const void *fdt, const void *fdto,
 			      int fragment, char const **pathp)
 {
 	uint32_t phandle;
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index b6c8b67..e1cc6f2 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -1737,4 +1737,6 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 
 const char *fdt_strerror(int errval);
 
+int overlay_get_target(const void *fdt, const void *fdto, int fragment,
+                       char const **pathp);
 #endif /* _LIBFDT_H */
-- 
2.7.4


