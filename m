Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D73B324AD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 23:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090518.1447689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXI-0003vU-Ed; Fri, 22 Aug 2025 21:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090518.1447689; Fri, 22 Aug 2025 21:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXI-0003t0-Be; Fri, 22 Aug 2025 21:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1090518;
 Fri, 22 Aug 2025 21:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21kD=3C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1upZXG-0003pV-U3
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 21:42:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f699ef56-7fa0-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 23:42:56 +0200 (CEST)
Received: from BYAPR08CA0057.namprd08.prod.outlook.com (2603:10b6:a03:117::34)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 21:42:51 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::3e) by BYAPR08CA0057.outlook.office365.com
 (2603:10b6:a03:117::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 21:42:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:42:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:42:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 22 Aug
 2025 14:42:49 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:42:49 -0500
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
X-Inumbo-ID: f699ef56-7fa0-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nb/7RLwVwqO6YBNUJ5zwAwEVm89SVXtNijqxNy9K0jA1pxvI5f7T9ZpjU2DHcCu2MRQrteS6ajgj/P917mJ4RNPKggrfnF6BHEKevvY+Am5O08VkKLJqW7Oo1LG8HfMaMn3LW1D7SUyEJ4s3fd+j0J87azWgH3x4MFkcWVmd/ejuVM7q+U0cc2qf6uxg1uLGe4HfdfoeF41dztBTPC77DeakFoJM6WXD54/ehUpQ7PKykcxW+9b2KGM8rTk/e2yXZ1YUrMnYripRb7ChGgAzAYIq8wI/LMPKdnmGIn527bwp4CszLnVfExpt12Dc0BiNYGui8Bbhcb0X/mvcMX3R4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/N6nFU6nO7Za+gT5fLChF8mvH6ExfkAwTdc63kbBaU=;
 b=sfOrAugjxVTkBifNNNTMxYHlZ4ZStZBrlPxIQTudwKfvoqTlCHa+K/qWE4mqcJNK/5D7pVVmg5zhhWnVkyaMV6QTQyIkdLYupqfRgNx+EmtAOR0mVbPiiJfN7X+v2OIdRYgn55si+Kh05+Vxmr+NYJww7s0/hbxut9NjrGuwg01GMYrlI5hd5ZVngHNp0l8m/7wE9iqU3whMBPBYKzXTj7N/JXfDVCkjKtxMFv/sYtgXSveS8v8sS20Siu0eMptRmTtJuOO7JUDtmLLA1CsMbD/l5kwENCFF9YXwQ+DJt4b03ypSz/pcDWf6qJyIu+O86MG14lRpmsa/UU4EqGD1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/N6nFU6nO7Za+gT5fLChF8mvH6ExfkAwTdc63kbBaU=;
 b=3YF51P2sxyt37/CM/ypUXyKJm/y49M/HmKB+FdhkMB2FKIc9sgWAiT/WWWL430t4c7fYX7Rk4l20XNBgC1yL5E+ILkBcCnfVryOgfFf5hLLznJNSweg9qZKrSQ6D7Dxzdmv5ouih8JKOAlVC7AQwzl9Tu3at3QzyEoBtCGTpS7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 1/3] xenconsole: Add connection flag
Date: Fri, 22 Aug 2025 17:39:43 -0400
Message-ID: <20250822213946.245307-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822213946.245307-1-jason.andryuk@amd.com>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc0d4bb-f572-4067-020c-08dde1c4d7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KBsnoz4eL6xv1gKeeJgs14HklczMCdmqq97vealbXmWxFGZorKUBTwXWj7Yt?=
 =?us-ascii?Q?2wL+nWX78bFNpAYa/qAncmq1Ti0O80IUPtj8pVTdNF6uC19V7jnHQJZfqqY6?=
 =?us-ascii?Q?Zk1eufr2sK/wdD/YdIz3HXitrk6p6YOdSQavQfvbcEBCLDUq8HeWytdTBR0F?=
 =?us-ascii?Q?UnSPlw/x76cknqXRkZOKvj8mCqJhBNl/6aHTJY4OAZUB8fS+jywjbLSqFpY+?=
 =?us-ascii?Q?qwueghwtIe6XnLFvc5rGgVsspTKJZrSABvNiRVCSfUJSwO00la2gz6tL9X3f?=
 =?us-ascii?Q?TYUfZrJsrw5mz+w/UAP2VrC6cNQ8aZwO1R6cXbWJcJD73CDPquxjK19q6MOw?=
 =?us-ascii?Q?cKguH5UYHPHDSVZaR4NtbbMTmsw9763SD6vHsA1s7LaHPEsHvosjjmniNqsd?=
 =?us-ascii?Q?aVwf79qb0Bw2FF72TuL7+7EImN0eZ1pq6NDXZ0p/QDqwGhbleOze5O7zMZ4u?=
 =?us-ascii?Q?mKWbQHQCeO/DYW9u0++PUXqROkwhO9cMQvMg135pb1ijWYrGL3oCkJ6traq9?=
 =?us-ascii?Q?ZZjvHW4Yy44uJTAZ/UauWhalDnMnaenMaO/Y2zwhDcyDYssr50MGy/0sfJ+q?=
 =?us-ascii?Q?ouaw6j/anMn+XJRsHRVjqy4ERe9hxIANKEvxfaLDkq+mT3Qgz5c236UW30M9?=
 =?us-ascii?Q?D5el7YjjFBvdtj1TBJHpLeAEocfskReEZsWJrvW7Q/zr7rFZ4XJwcv2ks6Yk?=
 =?us-ascii?Q?pqc3+zL5iUZXmtFMXzTguP1qqVO4tZSH5MmRuSK4gXZV7uJuWAydMkyL3E6m?=
 =?us-ascii?Q?wFGLwUWJ3naP/DrI6OxeDyRPAmrC4v7OuAhyLf9Dz8SaImLi+Ff570z287A0?=
 =?us-ascii?Q?f6RGyPXTyvv++owL1+OUStID8BQ/n0AlA0ZmGu/MjSsLkbhG+xT23peXMte9?=
 =?us-ascii?Q?zeFLdV3ZFPpcVIB8UEe6cfCxQZN/TW8hgU5jUObbYy7xNYoQzfYXpx8PULpR?=
 =?us-ascii?Q?YiNGfodYTfGn/agS7usMIl5CTrrfCxhGKLtFwpEKl+gmPteJS1ELjE9zH2Pm?=
 =?us-ascii?Q?2jLuliLJxxLhzj6Y67tAMKKGQpKZjRoN7HAYSOiAiIVBU2zpq1B33b1+ATmO?=
 =?us-ascii?Q?kQQR1zI9jRzTk+Uvj1UipfxYfZEyoCdJltTF6eTGtXKhhvC7P8AGezhPvfDa?=
 =?us-ascii?Q?Rc25QfVaim7B/mKgW7fkSyxTxrMJ/Cfo4iExbk18QRWUNu9pOfWBIQ8hIqXM?=
 =?us-ascii?Q?h//iqk5PF483L6mIIy/hh4udltf1nwoZo1hghLFsg4isnHqdEztdKwkPJypC?=
 =?us-ascii?Q?Dad9ZZUWFlHUfvLCa/uaxlHbsfeXUas5tVeCIfaei8s6jE+3VWzTy6ms5SFP?=
 =?us-ascii?Q?nx3ZaIm6P1hHdwhK69bi/D1iHjpHHaWh/vQO9oGzW0FgZOxXB35HM1V3AsaW?=
 =?us-ascii?Q?WXVfNdMhGS0+DBLwRzqq1cHBvNcShYGC+W3AVbU1c73I6cCOPMMOFCHuHOkx?=
 =?us-ascii?Q?SubdaF8pu8V0gbT7Giauu3Fha99EYZTVQfCtJkuwxOXX/Tman2gne0GQX/lP?=
 =?us-ascii?Q?NeCqc+kPHa99jqLN8ldg3bgAumP5Hy52JagR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:42:50.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc0d4bb-f572-4067-020c-08dde1c4d7cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181

With hyperlaunch, a domU can start before its console ring is connected
by xenconsoled.  With nothing emptying the ring, it can quickly fill
during boot.  In domU_write_console(), __write_console() returns 0 when
the ring is full.  This loops spins until xenconsoled starts emptying
the ring:

        while (len) {
                ssize_t sent = __write_console(cons, data, len);

                if (sent < 0)
                        return sent;

                data += sent;
                len -= sent;

                if (unlikely(len))
                        HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
        }

The goal of this patch is to add a way for the frontend to know when a
console is connected.  This patch adds a new flag to the end of the
console ring structure.  It is used for the backend to indicate that it
has connected and started servicing the page.

The two values are
XENCONSOLE_DISCONNECTED 1
XENCONSOLE_CONNECTED    0

XENCONSOLE_DISCONNECTED indicates to the guest that ring is
disconnected, so it will not be serviced.  The guest can avoid writing
into it in that case.  A domU can use console hypercalls and only
transition to the ring when it is connected and won't fill and block.

Once the backend (xenconsoled) maps and starts servicing the
console, the flag will be set to XENCONSOLE_CONNECTED (0) to indicate
the backend state to the frontend.

The connected value as 0 will be match the default of a zero-ed console
page.  Hyperlaunch can set the flag to XENCONSOLE_DISCONNECTED and let
xenconsoled set to XENCONSOLE_CONNECTED.

Old domU hvc_xen drivers won't check the flag.
New domU hvc_xen running on a new xen/xenconsoled will work properly.
New domU hvc_xen on old xen/xenconsoled should only see a 0 for the flag
and behave as if connected.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Rename "connection"
Use uint8_t

v1:
Remove evtchn notify call
Set connected later when there is no error

RFC v3:
Flip flag values so 0 is connected.

The other option would be to add:
uint32_t features
uint32_t connected

New domUs would check features for a magic value and/or flag to know
they can rely on connected transitioning.

I think making XENCONSOLE_CONNECTED == 0 side steps the need for
an additional features field.  As long as assuming zero-ed memory is
acceptable.  However, this only matters for a hyperlaunched guest -
xenconsoled will normally readily connect the console and set the value.

This assumes that existing frontends are not using the flag space for
some other use.
---
 tools/console/daemon/io.c       |  4 ++++
 xen/include/public/io/console.h | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index bb739bdb8c..43d4973c24 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -781,6 +781,10 @@ static int console_create_ring(struct console *con)
 		con->log_fd = create_console_log(con);
 
  out:
+	/* Mark the console connected. */
+	if (!err && con->interface)
+		con->interface->connection = XENCONSOLE_CONNECTED;
+
 	return err;
 }
 
diff --git a/xen/include/public/io/console.h b/xen/include/public/io/console.h
index 4509b4b689..b9ebfaff3f 100644
--- a/xen/include/public/io/console.h
+++ b/xen/include/public/io/console.h
@@ -19,6 +19,19 @@ struct xencons_interface {
     char out[2048];
     XENCONS_RING_IDX in_cons, in_prod;
     XENCONS_RING_IDX out_cons, out_prod;
+/*
+ * Flag values signaling from backend to frontend whether the console is
+ * connected.  i.e. Whether it will be serviced and emptied.
+ *
+ * The flag starts as disconnected.
+ */
+#define XENCONSOLE_DISCONNECTED 1
+/*
+ * The flag is set to connected when the backend connects and the console
+ * will be serviced.
+ */
+#define XENCONSOLE_CONNECTED    0
+    uint8_t connection;
 };
 
 #ifdef XEN_WANT_FLEX_CONSOLE_RING
-- 
2.50.1


