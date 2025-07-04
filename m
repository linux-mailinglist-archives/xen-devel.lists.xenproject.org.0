Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A4AF8E9B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033086.1406517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckV-0007RM-04; Fri, 04 Jul 2025 09:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033086.1406517; Fri, 04 Jul 2025 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckU-0007PF-TQ; Fri, 04 Jul 2025 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1033086;
 Fri, 04 Jul 2025 09:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckT-0006x0-3z
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8254f656-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:24 +0200 (CEST)
Received: from BN9PR03CA0404.namprd03.prod.outlook.com (2603:10b6:408:111::19)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Fri, 4 Jul
 2025 09:30:16 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::9d) by BN9PR03CA0404.outlook.office365.com
 (2603:10b6:408:111::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:13 -0500
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
X-Inumbo-ID: 8254f656-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMJfShWI0mR6bigPyBWDfa+QBMSwPio1tb9XjDH0FQxrV4IRu63eWkSqricpHwPA3prXWrrOigP3/OxUpSOq/V10HhggduCbRyM0XJfNXpImQzWvQsisY6OgdNNz52cuaNl4fQ8lA7Vjmy6IBwoxyS4yg8xvbU6WLBbIwyoYkas8j6zHSu7MhyhmOpp4o6NKMHfi65fc1+jCCqHoitUjCDxsSF/8/W5uGu2elwLT2l8ZQN6rV595aZGhW8oE2Vr/y68COuVqbIhqfjpOhKaRiQ++R/6yimFb2dwvjIUNWHeFBl5dej9+oD1ndOu8co8ZAmh0hVkPwILSq7Sm2oPmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=lBM1iRgDepHcyKh3jFNzCJ3Y+8ft6WIoz2VlMGkkOc67limhdQDMpZSEMLX7l3RlJbqBNXEiXB7c9GgRJqAU91ztFKk7SAvpI8ynrfXg5FI4F53c1zH83ADFx1v1k0B0dz+6eXKxmr9wIkOJWo2tdsA7fgAxGqXPN5KvcGSf/ldi1STVO+v4nyswlyHSBhH3Lsp4PM2Nu+2vpEFmMS8B/w5oSZ/qLgaHFuNctYMHqa2J/Y5IIIog7uhF6vlG25B1/tb3Eu6NRjGX+1b0qNxJatpDrZ/MjRWXbYvUSJXgeSoUZxlTpYvWRtBcuR2vJTi9072Vd15WTBNd8R7NDbWGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWDCQOD66ZKbLyRJ3ZdoNMgnP/71ZQbglzYq68MUnMQ=;
 b=B4wl8F1GEMGB0cXmpSHQcogMqnSvMNiLdbsT302trCHnw4vk3IxscWC+2eyGbBrijevAjl+/O6+0dMeC35a+XSkaAzcr5+NlzrG2t7JRALy6IDxlcXkKZ5Gyax7FolHTaUvZL6jmmBJd1Q1sJqiHEnzzLx04FWNgRTkvheUPkYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 02/18] xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:36 +0800
Message-ID: <20250704092952.822578-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c11d256-ec0a-482b-fb4c-08ddbadd6279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hQsTPiyE3WzYJGxpSaFKb7ZLNzBhQEXjKt25QUWFlb4cFwhef/Z/5lyQgZt1?=
 =?us-ascii?Q?GBpRzCtgtfCWoyb3SO8f3xvCIgQm1aXlVUvtMIvf7WPczsDtyUveny8CUvpN?=
 =?us-ascii?Q?ERGSK4ikExMuxUJl/Q2EJ4tziRJ6ICFsby0O/2yqhw9KGxV/3WAUDzAfCcDv?=
 =?us-ascii?Q?P2JMxnS57mTAuBKciBV9G/kRCxcerZPZUzV9TOQf8uzBS+n3to5oET2HqrYO?=
 =?us-ascii?Q?77/aFz2H1Rwadg3L47YiGc2FPl4dbQz3JV1HpnMGjj7wvvCzyzyGr4AixrPs?=
 =?us-ascii?Q?QQO9qVWO21Wp5uI4smd64B+7Fn5o5KotEzXmLd6Cb8yRM6UZpXXidUtQ/RaN?=
 =?us-ascii?Q?FNYwvf6SahrEHgsDrfxViydNXEnPZ0Swgabuh/2WhgIK+G+PA1oQ8YZNi5X/?=
 =?us-ascii?Q?dC7ddjNP6JIaYDbXKdnp46vxJV+0csCW12cwDNp4zjxZV6WVG/8uLJb5LYVC?=
 =?us-ascii?Q?iueVR9hPhGy0ySBuLWlFU4I0EVLefAaQrwo7u6s3tuC6u4dK8K+5k86IdB3N?=
 =?us-ascii?Q?0dXppm3jiQEvwWiA22wxfA2+Qqk70373zVhPmOj43fDzMQwlqfmhWeGsy0RV?=
 =?us-ascii?Q?uIMNEj8+hM1Kw2xXrvmoPFFn3RTiUqsq09OjB8x9DnoxaklSMplc3VWWOM95?=
 =?us-ascii?Q?Z9jRD1ZkHxBe50tYIvadVuaB7yGXnceAx9VfYVb6rFwJV2X+7kB2hLG9Oc4R?=
 =?us-ascii?Q?nktRxp2/d3ktjZJIkPJRDCZhqXI7iR6Cxq8tS/pReTkvc0zO8d2xaD+dH3t5?=
 =?us-ascii?Q?zNyctDmwJje5afFpCI/rVfqoxa3f95VIRFPVisQLxteb+fIscW2108Ik7iMD?=
 =?us-ascii?Q?T6owpFfm1/rPVnUrsJZb+j9UA0KAZJQvWX4egtOV4T5chGzCT2K/ZMpy2JEb?=
 =?us-ascii?Q?5DSQ0alBDXvCwNwNP9rV2kODagbilD/jCIPiRM1W1NcnO2VnJfm9wSsFYCEp?=
 =?us-ascii?Q?FQWhQnlQ6a3zFBQ4SmALSQXDfaciONcVnVFPQBhOynx4YpWEJrwMmO6VnFlz?=
 =?us-ascii?Q?0tCRG5MhI2Nzc7/e1KuHSf/tKJL2Z2UIJipOFlclPzqXooFHKD3Zb4bpJUhu?=
 =?us-ascii?Q?VCKBt6b+3w0OBlGfJT6n1cMFcIzfHkBreUNKZUtc0++fquBN9uzKDtVtMzEC?=
 =?us-ascii?Q?wAgYN02gyPkAkvdcp2YGnriZOnE2q8dZifqHRo6SDf0E6Tvy4JHPkgntLEFi?=
 =?us-ascii?Q?baKt9O10s2uv4pqpKd1ytCTedjcVYg3RsYgJM4GbKADLi2x+3w5LYikXTgUE?=
 =?us-ascii?Q?cjeLpc4uhdwpdOd0NBkDO5Rt2UzDM/oRx3j842jQXZLTvaIV8WH31sJDb9uT?=
 =?us-ascii?Q?mYODmCfnHbDOXdG6D2m+kdchwdPW5WLayUELYnqJussoSE6bJyOyHQW7xzN1?=
 =?us-ascii?Q?k325V7LV4dGrbkym+S0scVu1CkpkriLBw0s0lcbPUBMbuK+U0OuXy0XwdW6h?=
 =?us-ascii?Q?s4Qtn0y26Gzm+LaYxTa2E8wRQCrDvPAFXFvmBKqG3FHQEsQyXl0tVJuRzfZv?=
 =?us-ascii?Q?WXxtRPZvRYcahJ4NK7VOL/DM1W5JcOLvEY8k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:15.8765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11d256-ec0a-482b-fb4c-08ddbadd6279
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

As function xsm_sysctl() is solely invoked in sysctl.c, we need to
wrap around it with CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xsm/xsm.h | 4 ++++
 xen/xsm/dummy.c       | 2 ++
 xen/xsm/flask/hooks.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..22e2429f52 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -261,7 +261,11 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..93a0665ecc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -22,7 +22,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
+#endif
     .readconsole                   = xsm_readconsole,
 
     .evtchn_unbound                = xsm_evtchn_unbound,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..3a43e5a1d6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -856,6 +856,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -933,6 +934,7 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
+#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -1884,7 +1886,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
     .set_target = flask_set_target,
     .domctl = flask_domctl,
+#ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
+#endif
     .readconsole = flask_readconsole,
 
     .evtchn_unbound = flask_evtchn_unbound,
-- 
2.34.1


