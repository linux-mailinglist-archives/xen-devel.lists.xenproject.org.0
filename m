Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F79F597C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 23:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859913.1272002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNfzr-0000ti-Qx; Tue, 17 Dec 2024 22:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859913.1272002; Tue, 17 Dec 2024 22:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNfzr-0000rD-O8; Tue, 17 Dec 2024 22:24:55 +0000
Received: by outflank-mailman (input) for mailman id 859913;
 Tue, 17 Dec 2024 22:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sBm5=TK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tNfzq-0000r6-0L
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 22:24:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2416::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bafbf2e5-bcc5-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 23:24:52 +0100 (CET)
Received: from BN1PR14CA0004.namprd14.prod.outlook.com (2603:10b6:408:e3::9)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 22:24:44 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::e9) by BN1PR14CA0004.outlook.office365.com
 (2603:10b6:408:e3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Tue,
 17 Dec 2024 22:24:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 22:24:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 16:24:43 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 17 Dec 2024 16:24:42 -0600
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
X-Inumbo-ID: bafbf2e5-bcc5-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJthO2heabp6ruxHX3uxtScD71O0mcMnc4ky6o7UfG0y/bip+7NHFdaNQto9d9/iiupH1PARUvNU87AlewG5qLcjxGKO4VDqYI6/jvmGAafVlybmmTJtVIuWipySkMVLkk1BBA3bc11YhqJeUzcF2dCs7lFFhQxZ6TWqLE6V/Cg5aamfjSue0RUoh/wZ0csD+vQq8WErVYQ6ZX65KZxNRtCVSkvucUR1TPC+TQddPFpUgIFysX/WxsunK8Q0YnHh9Wh7LJbi7Sz8hSH9s7mMxlzMo/ZW0Y0AmswZ11LqUsQ3YhdAtzRvG3bqXQJkFH7CzmPu3cNP1220pgzMyHCSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8xuwI0/yejCLIWz0+Qwjv4SG6qlHBSVP/vH0Ki1GMQ=;
 b=o1OsAFj71hsGW7QcXlLRZmIB4yGeS0MD0or7ECPyzxlCox9fedJ4+FrWhP6Gl4/T4plFOFBHP0lJAzZsWMo7E4cpVN5TBV2Fv66Z58PG4Y/uKTCjrQ2z9R6IxDI0GW3GbX1p5pVSHfAxvpHL2+2ZrVbI3q2JT7AmYLwHz4oxM+k6Pl5iY77kQxPfXyrFMNndbuGAU01iioS3htoeT/L575Mq07I3yhCxjCEcJ54hWLjjUisAJn+3TH2PpVMrOWRESpUFNyzs8qRIf96hIg4ENNuV3dG+O5xAcHoWHuNHEFN5mBxgPMH6j2gM3GgZlb4Ti3FRqziYNKs9UtSzadxG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8xuwI0/yejCLIWz0+Qwjv4SG6qlHBSVP/vH0Ki1GMQ=;
 b=i97GbPu2l/fO/rXCM8vLFcZeL7wtRbwRilMClpJnFyAbxHYgj01hzCOi0amamttkkelwH8R5SVBHwQXdZppfWd0opabYzGr/v4gZ1n+Re/FcrWZd4iKs8hfx7MmDJjHnaGOQ0F0sGQbTvC3FG2q0DLUylCCuul4q/oT1XGNlRvA=
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
Subject: [RFC PATCH Hyperlaunch] xenconsole: Add connected flag
Date: Tue, 17 Dec 2024 17:24:24 -0500
Message-ID: <20241217222424.7632-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 9467866e-feb6-4b2b-eec9-08dd1ee99b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JIxnA1Jwk7vnRyvyrAvEQB4vyF0hsUUeTr05VihN/x4Vkx88M8fmD92qW7nh?=
 =?us-ascii?Q?eVfpzW7yR/B3QBsSI4M9aDc8uZAPXLdjrQ/T3yWMkz+KcnAeC0tcwibY02t8?=
 =?us-ascii?Q?EIj7l0FJcW9tlXsi6O7yBsrTGZKwJhuqgk9kkQsGce0LiqFlIUtZL9Ry8PMm?=
 =?us-ascii?Q?P2ez2YkFRyv+1wVj1+DbvVldBl1qY1HimIYmmHIYrIvHghRCdS+n70HHw6Ai?=
 =?us-ascii?Q?x+8AVZaq7g6Hzy3elvWsyF0OcQyKviIiN0t1P5jqs4nnYNGigK9rsaW8/WWp?=
 =?us-ascii?Q?CebfPwcpfzMgtLJX/NjTp9A9obSIRu4SWaQHmI5YmPJnF6XOVVS0RWIU58jJ?=
 =?us-ascii?Q?zrPvaCVR3fR3zmeXrdPKh9Fh1qJHUTs3JgduksWAn05YIkHdnxctiCA2K1KW?=
 =?us-ascii?Q?/3Rc5vUns44DgSDQC5RuVz1MCZXtAJ6AwhbIyDrB5PcPv1JY99s8B+6NMKpz?=
 =?us-ascii?Q?o8HvLmcNh3CoaT9k6MvoQ/rxxHSigKIoIKYIPK4hy3d3nKwpY1n57pC0kcdI?=
 =?us-ascii?Q?LJHBBaZx8PPMU/CfZEBZIO/nCXrtSbpTRqsq9r2X9V9u9sAwKMW6uDv1PDDn?=
 =?us-ascii?Q?X0mAody8FJ2GsIYVvg1PLssWT5UbIVp8rkwLTsNy2INYQUtlqHFa/zyOigh2?=
 =?us-ascii?Q?OlsUL86fJqm28nFxdf2mJA9x9cwQZM0+Q8LHHvZQs+yPx0yf9Fh6pz34bkp6?=
 =?us-ascii?Q?e9avIX3au9ROB9qH+ZCI+pewECTa/nDUxMQUA7Q219RgzsN86ZdmnGFgq8c8?=
 =?us-ascii?Q?GRlEoLjvTvQRtyvhqkUcZxOMCmJFKb1peQqFjGinJrMIMAteS3QfDHhE4bZB?=
 =?us-ascii?Q?mOtQB1a+2mfwR7gmH7AnQi9Ifyz+P1bc9bmSpD0SVvd6XdnSi8b5Dgau4oPG?=
 =?us-ascii?Q?F5LiUC3FHRShodVDDgqu/Jwu4n6AxMHjc39Gvt5haOIPvKq0CM0VPshQA/Be?=
 =?us-ascii?Q?zmvZkgrBLOORkCIzVU2Lfs1x4n2ObUQiWxBiSzw/DegL3guOEZDmeCRLuzbf?=
 =?us-ascii?Q?Q7CL1MdLtPFqLbu+75Q1lR6ER2wsKf2T2PRaDzNf25EE22HVRFU6Yr8OZkIz?=
 =?us-ascii?Q?dsi4ocbP7gik7GzZBM52ialOQ8oDIk2fbid+BzCHEVIdaAx+nCuzzJka7sbG?=
 =?us-ascii?Q?578bq9VSR5YnnjEQF/0h1nobo5r2ImlDX9IVAAed6IITdP3pnjNISRgcAIP4?=
 =?us-ascii?Q?Nq99XBpyfE4bCi38HofSyLK2rzlbVvb4eYYT1vStpl6hDwHYHuoIxopy8NtQ?=
 =?us-ascii?Q?5/NxOU86ftBPpyNERu7yj7iiR+oKT6OJqL7IUmpmU1XdxLfnDIK4/Z8g1rk+?=
 =?us-ascii?Q?jqn6C5dtETmoLvow95v1mTQNEfgnMPkpv1RJbd/6Jwpb42UlCwdiEbidCqHW?=
 =?us-ascii?Q?iy4QOJ1VnA6u8xqNnyN017ImwRFbs+4HRhQQcJ6vn2WedRyQMiLV7WEYh1ep?=
 =?us-ascii?Q?/RmcUJK7osEx+urjl4Z4m6trfNyg0a9laTEi7moiYbI5rqKmkTxvEfMC1xl2?=
 =?us-ascii?Q?M+dpupDaoIt8saA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 22:24:44.2492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9467866e-feb6-4b2b-eec9-08dd1ee99b97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

Linux will spin in hvc_xen.c:domU_write_console() when it fills its
console ring.  This blocks hyperlaunch parallel boot since the domU
won't progress until dom0 sets up xenconsoled and starts draining the
ring.

Add a flag to the console ring page.  zero-initialized, have xenconsoled
set to 1 when it connects.  Also send an event channel notification.

The linux domU side can keep using the console hypercalls and only
transition to the ring when it is connected and won't fill and block.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
In domU_write_console(), __write_console returns 0 when the ring is
full.  This loops spins until xenconsoled starts emptying the ring: 

        while (len) {
                ssize_t sent = __write_console(cons, data, len);

                if (sent < 0)
                        return sent;

                data += sent;
                len -= sent;

                if (unlikely(len))
                        HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
        }

This patch is similar to the xenstore late init (though the flag is
reversed).

The idea of the event channel notification is to let the domU receive an
indication that xenconsoled is connected.  For xenstore, the xenstore
driver owns the event channel/irq and can rebind it.  For hvc_xen, the
hvc subsystem owns the irq, so it isn't readily available for rebinding.

I had the idea for the kernel to use a static key and switch writing
from the hypercall to the PV ring once connected.  It didn't actually
work in my short attempt - I think changing the static key from within
an interupt was wrong.  I fell back to just checking the flag directly
without an optimization.  That would work and would make the event
channel notification unnecessary.

 tools/console/daemon/io.c       | 6 ++++++
 xen/include/public/io/console.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index bb739bdb8c..2a7ecc6369 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -731,6 +731,9 @@ static int console_create_ring(struct console *con)
 		con->ring_ref = ring_ref;
 	}
 
+	/* Mark the console as connected */
+	con->interface->flag = XENCONSOLE_CONNECTED;
+
 	/* Go no further if port has not changed and we are still bound. */
 	if (remote_port == con->remote_port) {
 		xc_evtchn_status_t status = {
@@ -780,6 +783,9 @@ static int console_create_ring(struct console *con)
 	if (log_guest && (con->log_fd == -1))
 		con->log_fd = create_console_log(con);
 
+	/* spurious notify to check flags field */
+	xenevtchn_notify(con->xce_handle, con->local_port);
+
  out:
 	return err;
 }
diff --git a/xen/include/public/io/console.h b/xen/include/public/io/console.h
index 4509b4b689..2b408f92a3 100644
--- a/xen/include/public/io/console.h
+++ b/xen/include/public/io/console.h
@@ -19,6 +19,8 @@ struct xencons_interface {
     char out[2048];
     XENCONS_RING_IDX in_cons, in_prod;
     XENCONS_RING_IDX out_cons, out_prod;
+    #define XENCONSOLE_CONNECTED 1
+    uint32_t flag;
 };
 
 #ifdef XEN_WANT_FLEX_CONSOLE_RING
-- 
2.34.1


