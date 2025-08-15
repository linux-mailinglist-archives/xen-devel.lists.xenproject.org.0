Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5536B287C5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084089.1443557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25q-0006r8-3K; Fri, 15 Aug 2025 21:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084089.1443557; Fri, 15 Aug 2025 21:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25p-0006nb-Ub; Fri, 15 Aug 2025 21:36:09 +0000
Received: by outflank-mailman (input) for mailman id 1084089;
 Fri, 15 Aug 2025 21:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25n-0005Bt-Ul
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:07 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [2a01:111:f403:2409::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c9aca6-7a1f-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 23:36:07 +0200 (CEST)
Received: from BY3PR10CA0009.namprd10.prod.outlook.com (2603:10b6:a03:255::14)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:36:01 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::c1) by BY3PR10CA0009.outlook.office365.com
 (2603:10b6:a03:255::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:36:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:36:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:36:00 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:59 -0500
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
X-Inumbo-ID: d9c9aca6-7a1f-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgrSNPaEKBw0Zz8vvdp5zm6E446U3Kjcme/EK2Xv3lG+/0GF8kQSHtMOjEPMUpmvlrjDzg6ZIk/bmjtvic410Qmz5d901vGo4gF38xIDO5iYstMHGEKAesV5LliwhpwmCLNDF9pT+9D5YLsneBAu0wGn+piJeEZoeq1TE67BbjOA7HuDK6+Q/S3FPHOqoRvNwLZDUkEINR2qzmfTWIHg9cbmjGJ3hAfyayixGPBkyI7QeAYH6Ce+LhAFHf3OEMicHO1lBfNwIhjJ4Efdv0oYK9hXhHcwUyKSKmCjn3S1dBLy9M0NhcqLTH03s064jnqHtRZ1b4IfbjXaIrQtGsonxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew1kABlxkh9uuRA1y1N6NUP22h+9pypvGUCR2HNQr2Q=;
 b=BwScjzo6So78v0yW06DXXh4ulV+V58a0t3JHUMXg/7SrYbsTMSAOFDx6RKo2aH2SxHPD/0zE7GexW0Sj1oDgvWQL8b7qDx3LhY2VF5Vwgx5l+YaAU6Mw8ZLs6jAeTwJ04+d6u4xFNjZ/S6kW8Eivjmtfi4o6psFPeTUPHby/xcEoqYAH0dqzBytX/QIZMgm7SL0D7xDZ80xr5y9Q2hVYJXm1DP2Ct/VS5FHfbZLgehN56d6rHxBIJ3rieS7hTpOj7Q11pAg3RbN+6EJgwHMYN0CrSJR5mt4Gmx8+MC3oM1To0qZks6dBgiF7du7BNP0R/nn08HArCsqO2h5TuqckwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ew1kABlxkh9uuRA1y1N6NUP22h+9pypvGUCR2HNQr2Q=;
 b=zNN8+L/l5caYJvYrW0zsO+a4EGYlSasCQfGZ2sxSHnvh4VZwCw4aiMrnXPQfa0dB9QM4lpfP+7Y0NqVdqrwX6YMwk+rAdxeFwWDovkBKxPH30I4Z29GjPRu4A5nckhenxojqlhsS/t2Bvos953Vv4JHzWDOriZleJo9ZPLv1jwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 7/8] tools/xenstored: Remove stubdom special casing
Date: Fri, 15 Aug 2025 17:35:55 -0400
Message-ID: <20250815213556.90068-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f751c741-02a8-4471-054d-08dddc43ba9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A6/ZpUxuB9jyBR5zSp8pkhSaIWhwJvCjWv9bW0dj3l+WEPE3f5y+thUGtL8l?=
 =?us-ascii?Q?MtBEd0SlMri618J3wHAuDbh1SrtFWBlEWmNHgmJ4MPPSJIn0nVXZb4IeyZwa?=
 =?us-ascii?Q?5RY2S8Mvvw2uO7kubzUzO3+bvQtNb1xHW/hQBsXyAy4gM0MUIloNyDdCDgJ+?=
 =?us-ascii?Q?83S/9hEeiiS13vUV2AIezC4JWHkhhMFu9L/VN2CYrIKf8al3UNdsT1T6LIr+?=
 =?us-ascii?Q?TH+pbb153APjmBBLrNFSTx1xIdM7Y9AbReAzrq0nRf3CQTbwFsBbUXJyQwiW?=
 =?us-ascii?Q?IokOC5Wg1gV2JVUo2q141xkYZHYz2tYj3XChWttgCWnYiCyOK44D64Yu/aSZ?=
 =?us-ascii?Q?/Mcd3+e6f+oxzyBLRiz/7KVyTZw4SQoKMzI30/IdZxtwmRo+T/zgasF6n0qU?=
 =?us-ascii?Q?FvsZ1dTG5Vh2t3ZZLFqBPVU1/aRWVFfo0g7gq2EYqa8hv05GlMKKtngN19bk?=
 =?us-ascii?Q?P8WT/FsAs8hHupgj/ON2PyV11M2CNkNPz3QIOAZPlBidGwa/++nE/Go55Jbv?=
 =?us-ascii?Q?CNfYWG6P2Ud5IR8fmNCBpolW+0PdUuheWeUM7bK1hlnyUcmxyjcMokhuFjY4?=
 =?us-ascii?Q?AEo8CjvSAphhOeMusUn8cPSzWsVMBQUe/e5hywE3ZkyRbEx+/6ihROg12YaE?=
 =?us-ascii?Q?bJH5HsftBy8AVh82///G6T8uEPZI6kh4jAoKWqpd9qqb80KjCFhabfFimkJ+?=
 =?us-ascii?Q?tFQLdxMbKzbAN/rBifm25bPPVPmGVvTjXMhnSpQXtJe08uWk+wQSMdrdJIl1?=
 =?us-ascii?Q?FsXLUO4RiYe0SKNPfLQMJiEK0XmJo3XrzvE0oeEgRclRO0uYVdR8527nrJgl?=
 =?us-ascii?Q?yNVcDkSXUNPeLNxBheb4pyICjxAGZLeOLFicrfnGTeCkwisW4oGzZCbZZeA9?=
 =?us-ascii?Q?EanNygmJbeO01H/99ykPgXMNtCHtYVOXJhAASh5HavRYu/FVjoLZZLEtiPzz?=
 =?us-ascii?Q?dhSoJQ6MqjsBvjldnqLMKBpgflihVW1bhdLVbZEGTula5cUYi7eE75eZNdnN?=
 =?us-ascii?Q?uLe+IGGJ9TfZHdDZVCn9zjfkCD2Hro/DmTPG7imTm6Q6rMWuLQn0CsoslTfg?=
 =?us-ascii?Q?/kcFHVTUPYfgiOypZvq7I3EZ2SNUO9DcMn8EZvi3eZRWn1yKcb6mSUbW3RJ3?=
 =?us-ascii?Q?+whD/LjeMCIjpGk+1voqvjL6nSfSaG6037vvWtV+78vU2r5jS/V7DB6VylzC?=
 =?us-ascii?Q?6ii+1s52Orw5sa+Olni92ddZPrS6m60do7MW1rwR849wTIlntGSMJ+HX17Gr?=
 =?us-ascii?Q?WrMTjfkrFTv9UloV+r0jkEym8QZf0hK1blYjy/cagtdH0n9mQqFXb4lIHlFT?=
 =?us-ascii?Q?4QPqafusJD2ybjl9mhRLdPzPzKO9Bhn5lRLcKBldP3T40jX5iAcCOypuutgK?=
 =?us-ascii?Q?NZlk7WIrVuQfaRm/bkKHSiwy+XVJyrhLTp9cyOcq4+bVpWSRgP7yznr419z3?=
 =?us-ascii?Q?mEJEpQrhit8FT/Rkhl8+YJ5mHG/grStcPOJN9DTEJ2EK4yieKdl1N0aS4dfk?=
 =?us-ascii?Q?NT8CNCpx1Y0U/kCJSZc8xG0JhKqejQhKx1vc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:36:00.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f751c741-02a8-4471-054d-08dddc43ba9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483

posix.c and minios.c implement the same named functions serving slightly
different purposes.

For xenbus_map()
posix.c maps the local /dev/xen/xsd_kva
minios.c maps dom0 via grant and there is open coding for stub_domid in
map_interface.

Change xenbus_map() to map the local domain's interface.  The default
grant table mapping is performed otherwise.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v6:
R-b: Juergen

v5:
Re-order later
---
 tools/xenstored/domain.c | 5 -----
 tools/xenstored/minios.c | 4 +---
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e282b5c5ed..cf5a54965a 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -512,11 +512,6 @@ static void *map_interface(domid_t domid)
 	if (domid == store_domid)
 		return xenbus_map();
 
-#ifdef __MINIOS__
-	if (domid == stub_domid)
-		return xenstore_buf;
-#endif
-
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 60d921cf01..a214e23907 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -61,13 +61,11 @@ evtchn_port_t get_domain_evtchn(unsigned int domid)
 
 void *xenbus_map(void)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, xenbus_master_domid(),
-			GNTTAB_RESERVED_XENSTORE, PROT_READ|PROT_WRITE);
+	return xenstore_buf;
 }
 
 void unmap_xenbus(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
 void early_init(bool live_update, bool dofork, const char *pidfile)
-- 
2.50.1


