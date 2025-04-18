Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92FA93F4D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959415.1351797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suV-0005Hj-2B; Fri, 18 Apr 2025 21:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959415.1351797; Fri, 18 Apr 2025 21:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suU-0005GD-VV; Fri, 18 Apr 2025 21:06:06 +0000
Received: by outflank-mailman (input) for mailman id 959415;
 Fri, 18 Apr 2025 21:06:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+zk=XE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5suT-0004mE-21
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 21:06:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2413::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f07361cf-1c98-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 23:06:04 +0200 (CEST)
Received: from SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::15)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 21:05:55 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::4c) by SA1P222CA0167.outlook.office365.com
 (2603:10b6:806:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 21:05:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 21:05:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 16:05:55 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 16:05:54 -0500
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
X-Inumbo-ID: f07361cf-1c98-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSGDG2YDbSaL9inekLO8LBln/ZA9edrIIUDYljVvvm87kxTBAxq2pqLHVxx2GpH6eucwxy8oJDmHyJnyWWMQQOhjnpchgF3RW4LMnHOw6lAltpAyg6b0AfptZhhvAHV51pWBBIdxHdx0CC+xIThgUJuYZiyItbb1U3BGuhELLwTYcByss1ZJtGUi3A0Bkf2ezO+4yf0Jg7fqQNDBGeAME6GgOH8f46bL7ucBvNNVBUKt6aHlhkBOYQgaLXs82zpE+G8PiYOXlYCWansWEKaT4hGNps2M95l9EfcCST5cSGbQk5aliPCx31/84KC6h5jC53lLrlslDl4rUOqeNpYdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSiAkad66EbvqwDivZ4lwYmjerrf0tw+VQwkzIXpkSw=;
 b=baINv0zqDerRjL7dXF++oLSiQHF1Qu3zqVNkC/CiPSiw3S8nlLy3CxadVGha0iVRw2W1uSyE2RX4s/S0PhL+XkpeKA5+L22HOfDgiaN6bZBG4ibqhyhjAgYvQwll/H+6bGU/1VPGxWhadWGBPbXCIjmeHhw0A8q2tTi6928pKwU6xue/GrAX3Tfu8Oh45S7p3uqHc1PW7xOBiqTwW478p6P+JiWzs5VC+H9PnODK2QrPWO0g41/hJNgDw/tZL95/0heOzcCbWfdgi2do2dqWep3Q2mZF178ABGsGNcFfYe/yyWvgGvi+Q115Ib49pCZFyj0mKKvTFWaBMsLE/4HFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSiAkad66EbvqwDivZ4lwYmjerrf0tw+VQwkzIXpkSw=;
 b=jBAKd1CBZ1Jk9Ttk98nklZKc7wyKGJzbCbgd+jk4kJ2PluSQDUfD+OuVZ9bk5hyuwL01fGJz1l0Qa+u4KoQnFoGEIubLKA36cgz+NKluVicJ3W1rj9UMeWrbHwuHDcb4mm5d3vf65mX6X7pYHM9xHseRGf5dDOo2r9IPS2zT/OY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/2] tools/libxl: Switch irq to unsigned int
Date: Fri, 18 Apr 2025 17:05:50 -0400
Message-ID: <20250418210550.542456-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418210550.542456-1-jason.andryuk@amd.com>
References: <20250418210550.542456-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1a9cad-5bed-44e1-fd2c-08dd7ebccf8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tfc1yBylF1Twjtup+DIw5RHeF21vuOMlGmVp4uNwLVe+wxfJHd0/vka6Pwbx?=
 =?us-ascii?Q?1Yjg55fChNFbwgcwAz1KEHIL2qzpSbdWpEXAExyK5jfnR0WsoASLNSINIlYg?=
 =?us-ascii?Q?aIH3gA/6ZRwuurb4ivzV0PzExiojOxCa41u3y7uf1dkpDrC2C8mjYCrnVz4R?=
 =?us-ascii?Q?tj6DHYhhGEGNyayYoGc1ZQrgRUq6m6alfEeQm2uYPys642PfxX85pW7a6JDj?=
 =?us-ascii?Q?91ZVbR56wgZ56M4PWg5MM/IkU9JMgXCSOLJD+xKbxy+H6EEFIS36O/i91hk7?=
 =?us-ascii?Q?+Ms4NRqip29TKvcju4m3S6ziijSYeJbgBt94PHLROKZ8Pt2LOMkiLX1SWjc5?=
 =?us-ascii?Q?M1ZUm7ZmBiLfNmG6ZyvK9r6k9IGQclniyfNgJBGpEHix2BbCS66FCynJiq5z?=
 =?us-ascii?Q?bMwHz1+gfkurNDKXpr0IUP3LyaSbDvLZwrQIcrdkRrWNo6eG+PkAlrmrWUnD?=
 =?us-ascii?Q?rqpe1AmDVek56YqjGImzpajF0EbbjCApe3vGTNh8xNfQH+lfMeQQE/QtSrP3?=
 =?us-ascii?Q?IKZdQV3YjU0TReDba2t9cXFyNsUc2R8A1QO3Sl76W51DHP9jUpmO4ZNQhm0M?=
 =?us-ascii?Q?iDkfeZGB4Zrb+6ZJOBpn4P+OfP5Bh/47SA+5ZZ/6Hks3eP/eYIgJREZ+QkQi?=
 =?us-ascii?Q?0YW+FsP2wFYA2fYJ55BvXetOoHFWmnKtwQj7FA2cx0O6e7wXLVutira0Aoax?=
 =?us-ascii?Q?Ye191XRhTvo9OBEbn5LixPAbfc41TrxvjwzXxnHfHf236PvJ7c/EUQ0cUkL5?=
 =?us-ascii?Q?4F7O723JxR4W+Qyc5c3oXj6QOpKsEoPb/TP+aQuQA6Nf172Ne235UGn4J2vq?=
 =?us-ascii?Q?p/Rjxg7i5VJUS0ZER8oWFMsx+yn9jRQKyL6aY/bmA8jQWiaUOzYnDUWcqrOU?=
 =?us-ascii?Q?EhUNTxIxNHgSHc7qtm9DKr+opqh4dcenE8IVHaYqB8t6fe/QBFF3zkaUgbys?=
 =?us-ascii?Q?W0svx7F384stcv5BW0VMvEGZFVblNX6ITdX3FOiY63pciCsMprV/4+Dl39y3?=
 =?us-ascii?Q?CBkc9XM1vtxl7zrlLpa8fXq0/B+WyRV1VifX8cAEueZq1Y+7+ApaWU+L7tcU?=
 =?us-ascii?Q?csv9CdcK8SxfqW1NDx3sNqKmAm8DdzbsjAtfZU7qhl2g8xog9yKxXfWkKB/l?=
 =?us-ascii?Q?Mw0Po6CDFzqPBaZAdT0Y73z5zSea1N4zpjIgb/oC4AhjL1xKbbkEySdIxYme?=
 =?us-ascii?Q?JVvqnEWXK1jgCgpBFau22P3uqfJEXRzmSeasKs1idoy8seRthmNwIJOI64Lh?=
 =?us-ascii?Q?wC4fyuZYfFHXQlYtYQ6vSnKtDrdkd7wp9F88qy8+DbOfkVUady51B78xJcK1?=
 =?us-ascii?Q?XrDcoVpC6TsWureoWvp/ZajyLDv/47uCpcxbsGV0M1qmcSokMynmae6UArr+?=
 =?us-ascii?Q?SpkVKbPLEMWKiNizXyCE2P+zlbtAPqhAUwPkEvQ+z+eN6R2ziersq7O6nvE2?=
 =?us-ascii?Q?rCKwHOHQhuRYWSsdkSTcfKUSnd5E+Sj4C/88kOVZ8oLu7BemPatA8q4mBB/o?=
 =?us-ascii?Q?c3l5WVvOtEDwa5b94VwIs+RaPjnVVvPMxd9O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 21:05:55.6928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1a9cad-5bed-44e1-fd2c-08dd7ebccf8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754

The PCI device irq is read with fscanf(%u).  Switch the irq variable to
unsigned int to match.

Linux driver/pci/pci-sysfs.c:irq_show() uses %u to print the value.

However, unsigned int irq doesn't compile because of:
error: pointer targets in passing argument 4 of 'xc_physdev_map_pirq' differ in signedness [-Werror=pointer-sign]

Add int pirq to provide the desired type instead of re-using irq.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
New
---
 tools/libs/light/libxl_pci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 6ddcdef6ad..a8460fb3ec 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1420,8 +1420,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     char *sysfs_path;
     FILE *f;
     unsigned long long start, end, flags, size;
-    int irq, i;
-    int r;
+    unsigned int irq;
+    int i, r;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
@@ -1499,7 +1499,9 @@ static void pci_add_dm_done(libxl__egc *egc,
             goto out_no_irq;
         }
         if (fscanf(f, "%u", &irq) == 1 && irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
-            r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
+            int pirq = irq;
+
+            r = xc_physdev_map_pirq(ctx->xch, domid, irq, &pirq);
             if (r < 0) {
                 LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
                     irq, r);
@@ -1507,10 +1509,10 @@ static void pci_add_dm_done(libxl__egc *egc,
                 rc = ERROR_FAIL;
                 goto out;
             }
-            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+            r = xc_domain_irq_permission(ctx->xch, domid, pirq, 1);
             if (r < 0) {
                 LOGED(ERROR, domainid,
-                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+                    "xc_domain_irq_permission irq=%d (error=%d)", pirq, r);
                 fclose(f);
                 rc = ERROR_FAIL;
                 goto out;
@@ -2182,8 +2184,8 @@ static void pci_remove_detached(libxl__egc *egc,
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int start = 0, end = 0, flags = 0, size = 0;
-    int  irq = 0, i, stubdomid = 0;
+    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
+    int i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
     uint32_t domainid = prs->domid;
-- 
2.49.0


