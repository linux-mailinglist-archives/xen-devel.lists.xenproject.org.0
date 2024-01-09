Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1B828F45
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665038.1035243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK2T-0002hJ-Dy; Tue, 09 Jan 2024 21:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665038.1035243; Tue, 09 Jan 2024 21:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK2T-0002dt-A4; Tue, 09 Jan 2024 21:53:37 +0000
Received: by outflank-mailman (input) for mailman id 665038;
 Tue, 09 Jan 2024 21:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK2R-0007gG-KF
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:53:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88364cd0-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:53:33 +0100 (CET)
Received: from BY5PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:1e0::34)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:53:29 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::d0) by BY5PR03CA0024.outlook.office365.com
 (2603:10b6:a03:1e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:53:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:53:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:53:27 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:53:21 -0600
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
X-Inumbo-ID: 88364cd0-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqAc6GkKdA6GodqTHVzOU9FGo71zLMXNd3B5l8OeO/weuDPdB08WgVusoETSjkC/AG2GMSZTKDml4xkT8Rt52PkAPUyDhDDNsXOnBnCqoTGzwyvrIsuIUMQnOVAr9eHCDkDVEhNOweeVY8zBaVsjNEkWSXi4YAa+U+8L5oomJxfAZF95Xumh8KsqER43p+lEoUUJc8YI0EToN+FizBg96fH0CjH2/eV3IeR84n+CWEQZxVCTDid1whp/mgvUcoAxsLv667uRaRYanNqS1EFnT/8juVITD2BpPqqrx2n9oO2H3pXfPgSORZy9OZ5wYkCdXd4De3t5lPFbZ0x2fgzAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqQc6f/gIUwm1XzrHE/xObpB2I0zC8wUwYomXWUX7YU=;
 b=UgJ/TYSOBt/AMeAlbs08A+/uJR6IB7qtNhTlGLMX+VYv6GbBcn/amZHBHGb9FkAnKiJtqTUG4R1b0niNQwQZY3mXPXI6FWLgzDx5+/SXqEH0MYSseg83ELe0LMSVJV0a82jpB0ikb9aSdU+hdZLYOc81mr0uUILuX2zKLeitsmgbF1dKsIwpp+b9VsPsKJU0ursUYpKbT8ZZo+J/GPQBc84+Kyewuob9P+GblytYCc+8AVkayvuWte0nvHuihriS+Me1maCFY378tvO+GASZLSv+BBEKTrF12vwniyA8NG5U8J1iR+3r7LwsXKtMlVLQd4CWgYSM76uB8UxHykNOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqQc6f/gIUwm1XzrHE/xObpB2I0zC8wUwYomXWUX7YU=;
 b=XSPc1GoBid0FI/MPj7zulTa9Ah5xyopFnvsg/pCbESnXyfXU7HwGvoaufJFgbF57uOjTcXiRw101O0n269xFVrITlOjkM0eKXkF9WA+O1GYSi0teCQA6tXJNYdIiAC22ZU73zxkRrVTmE++N6RKz3yIwALlICJWFztqNWQnofyo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v12 07/15] rangeset: add rangeset_purge() function
Date: Tue, 9 Jan 2024 16:51:22 -0500
Message-ID: <20240109215145.430207-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BL0PR12MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 469cb7ec-29f2-4343-69a9-08dc115d6a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q8oMiLfRnHbOKLCfZhqOIxxl8ht/vQuBxOjuWD5VvEKhBXMgmximr6mkE7ffa+TCLBGUu4qEPswvHu208VkUrzDBJwvXS8XogoOUzcMOYqmdbQ7hbtmXXWCIA2PzECyRGSQA93RSnu3C9NJMx45A1w7DXwq5gjOg9FzSgLjfwH1ITtp+0qhOAox/z2R9ERJ0lX13rsBwPqqoVs6BgbZe/0SFD1tn59rgogpyNCXJYwnwNYcl6H4OjsKFvhkoJvB0fZ36VIE/CmJWAJBKXr4XNyYMhqheo02f8zYWbPbIQxyEVRLPTpdiQ0cDu3HLW0vvoiagYOcx8Vum/w01Q3Cy9VQxXaAtM+WcujfR+iWZJcPxhSKGcOzAx3adovA+9nRT+HkH6umh5W+IX0MQXzw3ZeOENwO09E8UGTi3ESqhkkkMI9IlN7ZWbRFR3eBqYNcgdSW8Ep0ink2YQrNtEQo4lixQxozhVxIFbosGIOOo9x0nC0BiAf0hKE0uT/lTrEegQc+edrSfv2Fqph0TvsFM08SPk/7gmrzNLkbVjFhHLhApn16Z0lDdo4Wzp7bt1nVPaBtrPYYuVMJslm5fcxPmfWA2iUF3KCvuR3U6zI7vcu2EThz5hH10uQQRNjTjYgpCoiJKeof0psmbBr/o0RnbiaivLDuoKj/SEQTnoXbNN0dBhuqN6cyaD+9TS5S9vxKtD4JQWl6ohayvGqg+S1S5rSBozzsmKzdLbctShBTYnNcsely9IpeWKEaimayACV94Ui8gBcItggrAYd+V/pDT2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(40470700004)(36840700001)(46966006)(2906002)(82740400003)(5660300002)(86362001)(41300700001)(81166007)(356005)(36756003)(36860700001)(316002)(54906003)(426003)(336012)(8936002)(8676002)(47076005)(2616005)(26005)(70206006)(40460700003)(70586007)(40480700001)(478600001)(1076003)(6916009)(83380400001)(4326008)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:53:29.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 469cb7ec-29f2-4343-69a9-08dc115d6a35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

This function can be used when user wants to remove all rangeset
entries but do not want to destroy rangeset itself.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Changes in v12:
 - s/rangeset_empty/rangeset_purge/
Changes in v11:
 - Now the function only empties rangeset, without removing it from
   domain's list

Changes in v10:
 - New in v10. The function is used in "vpci/header: handle p2m range sets per BAR"
---
 xen/common/rangeset.c      | 16 ++++++++++++----
 xen/include/xen/rangeset.h |  3 ++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0ccd53caac52..b75590f90744 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -448,11 +448,20 @@ struct rangeset *rangeset_new(
     return r;
 }
 
-void rangeset_destroy(
-    struct rangeset *r)
+void rangeset_purge(struct rangeset *r)
 {
     struct range *x;
 
+    if ( r == NULL )
+        return;
+
+    while ( (x = first_range(r)) != NULL )
+        destroy_range(r, x);
+}
+
+void rangeset_destroy(
+    struct rangeset *r)
+{
     if ( r == NULL )
         return;
 
@@ -463,8 +472,7 @@ void rangeset_destroy(
         spin_unlock(&r->domain->rangesets_lock);
     }
 
-    while ( (x = first_range(r)) != NULL )
-        destroy_range(r, x);
+    rangeset_purge(r);
 
     xfree(r);
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 87bd956962b5..96c918082501 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,7 +56,7 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
 
-/* Add/claim/remove/query a numeric range. */
+/* Add/claim/remove/query/purge a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long size,
@@ -70,6 +70,7 @@ bool __must_check rangeset_overlaps_range(
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
     int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
+void rangeset_purge(struct rangeset *r);
 
 /*
  * Note that the consume function can return an error value apart from
-- 
2.43.0


