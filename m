Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E73FE976
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176924.322130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYu-0005lP-3Z; Thu, 02 Sep 2021 06:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176924.322130; Thu, 02 Sep 2021 06:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYt-0005aj-7g; Thu, 02 Sep 2021 06:50:59 +0000
Received: by outflank-mailman (input) for mailman id 176924;
 Thu, 02 Sep 2021 06:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsu-0004hL-Fg
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10ba58f3-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:35 +0000 (UTC)
Received: from BN8PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:60::38)
 by MWHPR02MB3245.namprd02.prod.outlook.com (2603:10b6:301:6b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 06:07:31 +0000
Received: from BN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::92) by BN8PR12CA0025.outlook.office365.com
 (2603:10b6:408:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT008.mail.protection.outlook.com (10.13.2.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:08 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:08 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsS-000F6q-2P; Wed, 01 Sep 2021 23:07:08 -0700
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
X-Inumbo-ID: 10ba58f3-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYzw5n/WzHl182B+tAIvwfDyBmQvwX19sQvk72oOM9gOO9pzTW5DcD4zRUZysYkRyMrGBsT0kUqeVsB3T0HQmB/lC8Qnb/7fQNEaeGSQp/Vu5fow0E46fi/E/RWVcs0Us3ArSspm0y5n3+upKgeo4of4OUsGXkJi3tuUfLlaQGwK664iUDUMrdw/71qdgOqYXufRwXESfV2ez7gwnABVT6OmXmucUdzOTYBh54RwWW7lOv2yRXdDhYYz6sA60QIoFna9SS5JmplJ/25wLpAVyAUDsvMNpj0s9B/zH1DlUFpdJyBBV05H1+ipjYqSoz2S9yw6xGkk93Ovg+4P/Ky87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02lvqIFeq5ueMXlcG0MgTjXHnFIspvYKtsnJlaQoi8I=;
 b=VmAPSp6bs7xh91+LR0Ait+pq78OmwpFJ1L1fdgJW39/e4zIba+z+k8HdNdsJ9GCBUOnKnog+A0eu8d0PBf+j9rVpSHpHm/0Orh/PhZkfYSjZf23sLtyW7nRtCuDJmh7UO0P0FHSNVQQyOlnNc3T7MtOXwfrGCjhdoV/MVFSAeyXMlwnqrPRUk4Kse69kEJGk2hETXFH15/JoKZUyhsRcsCjPsiGsM84GgWCVpnADsa7HijwP6nGHmHL8HoJ7OB/LlPGqghRc+b3KOHE9LYQKyqKI63Ldl6j5dObSwLkDmS7ne8nvu3RAgF1E2Pud6Ig1k704DWPyTzc6yfvrirfplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02lvqIFeq5ueMXlcG0MgTjXHnFIspvYKtsnJlaQoi8I=;
 b=lLuKWj6CBelA+oFhxzhOFkaU5QhzYs/lLiXHL53JnI+IJuh6JBqKImZkJ4rUunsLnPKwyxCufvVDnnujlGHT296ZVtj29/KUiy2fwsg/Pn8IrwKZWVjFgLrcl4mH1A3JpSleBEDJbbLB5z5wi7sIEAU2RIHZXy10nlCyE/hz5bs=
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
Subject: [XEN][RFC PATCH 07/13] device tree: Add _dt_find_node_by_path() to find nodes in device tree
Date: Wed, 1 Sep 2021 23:05:57 -0700
Message-ID: <1630562763-390068-8-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d13ac05-bd98-4b27-6ce7-08d96dd7f2d7
X-MS-TrafficTypeDiagnostic: MWHPR02MB3245:
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB3245AFF35E16EA33879237AABCCE9@MWHPR02MB3245.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tIH8MefcwcRpvihGrdXSfRE9v6Hh/IeHlbfK0/zW9GVbZG02tTx7mx2WfKTl1kS27XrYGS++2+AbkpfEUxznalv9QcGNa9Xw4ATLF+8X8eWrrJ6OjM1PzkTMc55rJ2mspgTgI8Abc4Lxf2Z1aba7EgnEzQsF1TzasW/+uW32vq2jDAwJGtOJu2NrVA5TjoehMMc8+xjln7mQKtICIzp/vJLCjNAxpzAOlDcRQDJBLrmUtA6T6IufcGRc0acDgammV7QwrNoK3ZbLRqtUVQJue3Q24ZPpDiB/JrvXLASyaa+tZdK8zBpjLF3Rzf332cZE+5QRPt3uNbnioYymlGJ9iVUExJfYzbBGlCVPsVnwHK5FwHm9h8TSTB9ysGBUYj1VjHfeMI9ARGpgUT/TkVzqqffUf1Xa6MqaX43uEyD6HARRLOiv5/7KzBsxIXZdUJc5OqWWWCJwTxD1JHwh9J+uzsQ0sz3nD32KS8pivxqlIH6Y+oXgsJORcXLmLTYhSelNKaWSgHgPKrnDWFCbi58qM3obS9rrG+apG8PMtYf6147KYreB9Y86VyekTnm875mKseajHfXIaxMHXR4A7j+ZVtnFRYivHOhx0X2HUyT5nTX+hNJuvc34XHaPbD8C2ADR7Sn5urTeU0KSsvb4FKapaph+Tyunhlwu+906YXgP05fzz41bOY8ahI26oXBnVH8l7ZEoV+IKV6IrTDPVEc2DvvK0AcJPXpnbTKWd8V6GguhNBWG9P7kHyZVb9ZmNUJRO
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(26005)(9786002)(426003)(36860700001)(47076005)(478600001)(82310400003)(2616005)(6916009)(70206006)(7696005)(6666004)(7636003)(8676002)(70586007)(186003)(107886003)(8936002)(2906002)(4326008)(54906003)(5660300002)(36756003)(336012)(356005)(316002)(36906005)(82740400003)(83380400001)(102446001)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:30.7817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d13ac05-bd98-4b27-6ce7-08d96dd7f2d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3245

Add _dt_find_by_path() to find a matching node with path for a dt_device_node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      | 10 ++++++++--
 xen/include/xen/device_tree.h |  9 +++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index bfe3191..4946e83 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -297,17 +297,23 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
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
 void dt_print_node_names(struct dt_device_node *dt)
 {
     struct dt_device_node *np;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index dcd96b4..7cc6093 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -469,6 +469,15 @@ struct dt_device_node *dt_find_node_by_alias(const char *alias);
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
2.7.4


