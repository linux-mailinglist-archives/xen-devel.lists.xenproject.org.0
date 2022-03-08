Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEDF4D21E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287465.487528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoA-0006lo-Np; Tue, 08 Mar 2022 19:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287465.487528; Tue, 08 Mar 2022 19:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoA-0006hd-JD; Tue, 08 Mar 2022 19:47:46 +0000
Received: by outflank-mailman (input) for mailman id 287465;
 Tue, 08 Mar 2022 19:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfo8-0004Df-Tb
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e89::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db42aac-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:44 +0100 (CET)
Received: from DS7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:8:54::30) by
 DM6PR02MB5868.namprd02.prod.outlook.com (2603:10b6:5:150::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Tue, 8 Mar 2022 19:47:39 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::83) by DS7PR06CA0052.outlook.office365.com
 (2603:10b6:8:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:20 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:20 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnk-000Cws-DA; Tue, 08 Mar 2022 11:47:20 -0800
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
X-Inumbo-ID: 9db42aac-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckjGEXAKtYf2+ownQ1TlKXrAbMXYFIFMLtaBVqmflU0FaELV47fqPSz4+STLwDge0ub+PpsbfdcLGESMzd2Z2CLAJrdFDx6YNn2vhM3+W5n3FT+Illb7D0unQwxShSv/hnRu+IBc47ZfeMkF4bo5XK/a0a4IhAIXJK1psyROFuqVIiwAVjbQstN/zHiJmCXrG1ja+o+YkNw5KLZCd81O4e8cphv6mjTw2jV25iM1+oxV1tlQ2GkfWvW+IKUnpwWsJnxxFZUs2AxN3nf/t1awa8jo8q8nwEpH023yYxA6Uq0561TLRBMC4lobP29E3PI5qc/wGmA1gk4DLOb6/emUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktbSIbgnDy4Elv8mz8USxfaqVJQB12rlhbrwf9cRzXw=;
 b=iO9sRq5R4pjqDo6w0BLmKxJT/QHUDE0Vo//7Wkq1E7y9LPNOXaeYhHl745j4Fu6GK1OqP/o4FgzGu095AYBPSZkVRxqgaHy0IyIijzIsrs3gQ8HSCY68ZaFMBzAhSopSMU8WWJjvyDEz12zirswoA3qAAHelFdOFshQvMhW9JLcqUyw7D3s4YuTpdDaD1lplVDmwqVnC38AgYxTnAKFPzWq6bTPQ96UPbJRRtiTWWtH3GZU5XJStmauV4WbMyO0pdVJeEZBOBWSXJltidLfNu5cWui5wpY1WRlw6U2udr5CrrF/cd78rNVPSOXO0JX9vZzSQd77zfiEz4LTRa0vQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktbSIbgnDy4Elv8mz8USxfaqVJQB12rlhbrwf9cRzXw=;
 b=I1xz+qdYktOMasdMfGSa63VypE49vBF7oimq0cETEcKTZJxZU2QRxbd3wwX1YSZC7xrBH0xMiX3WuLp7h4DeJMQOGsjoxZwK147BMDp2ih8V3wK8LaBk2CNqwDdaFN+Z2R58L5vRsdg3602wNI2rwHC0tg6tPdvdTC9LBBg7nnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v3 05/14] xen/device-tree: Add _dt_find_node_by_path() to find nodes in device tree
Date: Tue, 8 Mar 2022 11:46:55 -0800
Message-ID: <20220308194704.14061-6-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff52281-8d79-4c1f-13d2-08da013c80a6
X-MS-TrafficTypeDiagnostic: DM6PR02MB5868:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB58680FBA59B5EF703AAFFCC0BC099@DM6PR02MB5868.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMiEKPPpPmLgVBvSeZnPHYKcY6ImqGUhqCq8wwEdO2H1qB4do5N/QkzqwKjdu/cajG31cW7OaQmEDbokCDp9Km/6Qg8KsBv9OVX28AaDf3kYyBnpvW/POAABMBoSkQbp/UC9SfZchpjvv4eUIyyqxn2azMBwFhgZQYzIHg2ntoGrMWvTEcu1yeOhTYukc/arjTMImMiV4MG3Mtwq78ybHfrl3u9cB/cTGyAdYUbWeG8efX8jiS2zdUDN3Q0nbJcIAqk4WAT8vJ08rkFAzVHHjGzSC36LCDZ5wWD5LE+e/RqGzpgSt21yznU969rPcPJhHV4DNGbzPyv8hrjoNbTFgFo1FolYY8CM0t3NrW6pqnK+pLKDnuX/+jE4n0dSR/lBXuy5SLmnW/TwnsMUkBIGO6jxoct6wH0tO12K0KCpXpMBDD4u7LS1+gqeoLgxN8XeDxv1S+9k2HqHBU5vdxyRLO8aov8PWS+Zs9+ATDO9Tm+zUk99c4YOlGmp/wQPwcckU0swuvstdCqJETj92SBHIDmZM6kTgbma+qyUoH5F9XKkzjAsGJl5yR1eVP0TjPD7+HmZLRbX26m+eilWE41tYhL+s/dfho1SOz51Nhd/8OiypH/YiUU0FW+30heDWPoFBLkdbA95ZEmKtB9hGy80cjJe8yWRNFIZlsJAvhCmDqO7QNlOFU+xnZFo1THnstMsOSmoxZ4gMQ53MSIJWamO+gn6zMEWaRyM2jKZvPl5ufM=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(6666004)(356005)(7636003)(26005)(8676002)(40460700003)(2616005)(1076003)(7696005)(5660300002)(508600001)(2906002)(426003)(36860700001)(8936002)(9786002)(70586007)(70206006)(82310400004)(186003)(316002)(47076005)(107886003)(54906003)(36756003)(4326008)(6916009)(83380400001)(102446001)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:39.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff52281-8d79-4c1f-13d2-08da013c80a6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5868

Add _dt_find_by_path() to find a matching node with path for a dt_device_node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      | 10 ++++++++--
 xen/include/xen/device_tree.h |  9 +++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index f43d66a501..2e334f949e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,17 +358,23 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *_dt_find_node_by_path(struct dt_device_node *dt,
+                                             const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
     return np;
 }
 
+struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return _dt_find_node_by_path(dt_host, path);
+}
+
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7866c10..9da32a851e 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -525,6 +525,15 @@ struct dt_device_node *dt_find_node_by_alias(const char *alias);
  */
 struct dt_device_node *dt_find_node_by_path(const char *path);
 
+/**
+ * _dt_find_node_by_path - Find a node matching a full DT path
+ * @dt_node: The device tree to search
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+struct dt_device_node *_dt_find_node_by_path(struct dt_device_node *dt,
+                                             const char *path);
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1


