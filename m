Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE47B127C9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 02:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058774.1426330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSLY-0006oh-Ba; Sat, 26 Jul 2025 00:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058774.1426330; Sat, 26 Jul 2025 00:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSLY-0006lK-76; Sat, 26 Jul 2025 00:01:04 +0000
Received: by outflank-mailman (input) for mailman id 1058774;
 Sat, 26 Jul 2025 00:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKM-0007YZ-2C
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2009::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70b47ba6-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:47 +0200 (CEST)
Received: from BY5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:a03:167::28)
 by PH7PR12MB8795.namprd12.prod.outlook.com (2603:10b6:510:275::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 23:59:41 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::a3) by BY5PR17CA0051.outlook.office365.com
 (2603:10b6:a03:167::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 23:59:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:40 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:40 -0500
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
X-Inumbo-ID: 70b47ba6-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlrYDzRUVd6QyEQqaAchGjRjBkrEAV9D2Efq+D5ZT2bEcrbBn4uIY787LdM71COj+RSROb9PnKRhUYVfxYkWb6gZYMNh3p7YV1Jbz5bK0Xt8OeyS+ze12Xwly5VpDGVxol+HFLLjGshXL/IBuomdsLWwgIjgE0uSaPaIzvXadXkEuSuo3NBM+hHf7ku9+tOLBlf6q02WR2+AH3vqbSQTLwTrNtnqkxSPlUC1Jq5GKRhIfbScDCuaNnNE+G/Wr1tH12hDSNojnTRQ/j52s9EtQa2veKyo8tyRDlf/HorQaWcIXBtMOym+PaFxp+auhP8OvLonMyuyAvU5zF42AsdH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMb+CZpB0PdG90Nd9aOEvc5avbnSZpQyX1THv7zdhO4=;
 b=tj0CwMmRCtIM/QKpEKsQ/PGBHWKX3w8/Ikr64WuRmRtymngCIIB7NkBXDDCmPxcS/xXAe3yDSyLaFd11ArSmQN5ghJ99bhKaQqbIf3Q1SfTrwR6FkY9o9Hya/T5XD5pSzv6zHh81RCPtr2vHzu+9sxUnGWOKThNQ+KJJHeqf3QAugwOZ3Ys8fzwjrEnMpYABy/36SHm4+41Cs9LE4NCnfvq9hT0MLW0tu3jjql2f+HBzCxZBc1bmtfgZnWwLDINi4KA4j2UW11KEQm3rm/FbDrEpCuLN5QKjUuJ1IsUFq7ZRNlH9SrcG2ij3cYeDp6NvqJj5lPzrlwSVg7pimaFKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMb+CZpB0PdG90Nd9aOEvc5avbnSZpQyX1THv7zdhO4=;
 b=Z49SpROP3Avy85THy6IWuMmtTUTZ3M1moLVzXIZ+JBPLiouAmsu4rHlljx+oEuFXcODVRq+3jj8m5DzGm+EBESu8QQ/ePNXo/RZHVZSjhdA53FD0g7MDR21/6eE1898lcbx9llRKBfeEL9Txt7Z/X7Pj/VH1NGnfRHcSJXzr/0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 11/11] tools/xenstored: Remove hardcoded implicit path
Date: Fri, 25 Jul 2025 19:58:58 -0400
Message-ID: <20250725235858.666813-12-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH7PR12MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aee8394-38b4-41b9-7e5f-08ddcbd75274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PyaGs+pDKn28tjTV7gCBunD5JnSuHSd4BoVtN6Xfl36p19W7M6XEsEFKsZYp?=
 =?us-ascii?Q?BofwlvAgGnxKMGynrlJ1FOAJi+q/DrR7diSZ+f7VpoYYPdEb2mCiYBUnv/AD?=
 =?us-ascii?Q?/mWvGerWtH8J/kclhxBqs8w0BUsIomdCaDvqSnhF9geRgBvKGOBjqYwCLf3F?=
 =?us-ascii?Q?3Z4JGy363DyzmAgNfWeb7IFQgDSsW4kwlYP5dKJOf/h2q21LL5Er/6J+i4TO?=
 =?us-ascii?Q?l23DjEZiB8dBYn4S6D5RXm1dI6Y4iEPl/foHbi7r3qKw7+n+Vm3zAFO3iso1?=
 =?us-ascii?Q?eXuFPITGGjCqvwFJjpC0ed7oq0BB4ahvHS4U4a1PniJmJDxV7U6UbpG7yK4d?=
 =?us-ascii?Q?FOu4lKk5HktwwHH/IQXU7VJOL79+prtBibvF32JgzLtLs0kfC2dMFaNAUHfk?=
 =?us-ascii?Q?ekLFzMICcjato7akjFBevc2pZR8OiyVxUcB4nkPPW55qcQdWp7lVWfkFL+in?=
 =?us-ascii?Q?QXMptQTDaFBNAp+kqaqM5Fp4VF62FOQOBOgn0/rdH9JwIX1TUiHd2Zia3J/n?=
 =?us-ascii?Q?wP8tY8hCgQv8+xAuMO54odTuti3rs3p5vxR4iQNveA90zfC3GC8tx58ezgkj?=
 =?us-ascii?Q?daEjVlR+iGVrEGcLqSiuPanJ1trZvyk/YCtarI2mDEWebhAYSNT/v8KkALMD?=
 =?us-ascii?Q?1fZBf2QvZiyrBNV4HOXOXWse4HEfCGk7ddwDc4bAm3lFRGXSXyT8HE9eXtR8?=
 =?us-ascii?Q?q3RBmJ+jluvhT+RI8843pWyLzctLOhRECrg4fzidIev6ysJ8k0egGlG3GkOk?=
 =?us-ascii?Q?104a3kOpgnJ0d4n/VR13PlFtU9DTUzLoiGt1tJRJqMIFnH/6/AqyJ20E4qY9?=
 =?us-ascii?Q?BadZENqU/57NmoMmRohk6tvn3vykfyddcE2SkQ3QxE2CwD3Qp6vsh94gynY0?=
 =?us-ascii?Q?kp4WXVVuYX113s/bZAiAo4ENLt2W3LBJq7uCZnw+cK85RuR+nL75awcxAZVJ?=
 =?us-ascii?Q?jxQAqyaStxVol02OSLqyGON6ntoJfVtHAypHlhLg3gCqTNAr7TV+uGH+QqQO?=
 =?us-ascii?Q?8p+YRLCRpbbejb2UOndHg6/mjzJSkxyyh3NZlqMB4Fa/+1akm7ytY99wCn2p?=
 =?us-ascii?Q?Uro+bTIJfY6YXtROwxobZu62FScDHrnq00Ih++0JCv6y5T8lfBWF8G93AqPM?=
 =?us-ascii?Q?Yrs1Xm/gNS0uVrUu+rspE14qPAeiQn+fgQCnsCSeBx6g9XGtMi152ecGx2of?=
 =?us-ascii?Q?VPqtRDCDPtXcNnzX54f8KAeaXO5F6ED1KGLiF5W3rX9O4fTHFOeEJhFr+wlK?=
 =?us-ascii?Q?2wt7J0K61wHYa6fM9yvVUn+fjTwR0M6CrbEgQ2PBTt5nJBRUkqSNm4GRE5mH?=
 =?us-ascii?Q?aaGO0jKAPZdinBa0MSk4uKVFUVYIRiLrm60+QyBC5V0jnfY5G+xQSUvu3NWo?=
 =?us-ascii?Q?CZg8jWt24wBqSg2++TA5bEKkJXjgswm0jWZQmibR43VDeZbV2y4h9p1kNdh8?=
 =?us-ascii?Q?v7E+GdW+W//GNQnipLW7q3byzv6F2iqjMjVYjoavR759YQAH0uVRu0YxIcLv?=
 =?us-ascii?Q?Yzvp9KnxOlOwLNUTp6PIpOf7C+JWfh8ks6pW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:41.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aee8394-38b4-41b9-7e5f-08ddcbd75274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8795

Update get_implicit_path to return the correct value for a non-dom0
xenstored domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v5:
R-b: Juergen
---
 tools/xenstored/domain.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index be8dd19eb8..d083dfb65e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1238,11 +1238,13 @@ static int close_xgt_handle(void *_handle)
 	return 0;
 }
 
+static char store_domain_path[] = "/local/domain/65535";
+
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn)
 {
 	if (!conn->domain)
-		return "/local/domain/0";
+		return store_domain_path;
 	return conn->domain->path;
 }
 
@@ -1312,6 +1314,9 @@ void init_domains(void)
 	if (priv_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
 
+	snprintf(store_domain_path, sizeof(store_domain_path),
+		 "/local/domain/%u", store_domid);
+
 	/*
 	 * Local domid must be first to setup structures for firing the special
 	 * watches.
-- 
2.50.1


