Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B6AB909B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 22:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985966.1371730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFews-0000RA-Iz; Thu, 15 May 2025 20:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985966.1371730; Thu, 15 May 2025 20:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFews-0000OW-GG; Thu, 15 May 2025 20:12:58 +0000
Received: by outflank-mailman (input) for mailman id 985966;
 Thu, 15 May 2025 20:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBoN=X7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uFewq-0000ON-U3
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 20:12:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2405::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faca22a6-31c8-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 22:12:54 +0200 (CEST)
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 20:12:49 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::d0) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Thu,
 15 May 2025 20:12:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 20:12:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 15:12:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 15:12:47 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 15 May 2025 15:12:47 -0500
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
X-Inumbo-ID: faca22a6-31c8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tk66sZPBRraqtp+2D0sUrsgGQR0/cKRqlI69sfiXH/Pz0dujCOjdc/HIswhvbCqHUsPqOWl3ssJ1JTJMC+A32BfuAgKWCTqW6orG6brWnamJK7sNWQw6N90CIgZbHho7glShs+5gZuVT4c9RA53p2HFttccaVfWScG6Zhty4UfviGYeveknCNZ8G/MKRIbzRES/2TT3+WqIRNhEntUrFj6sIY2KjpYRoBh/mVB9JkEGfAqtLGJUXEaoiL7ZLUa6sponMEDI+2IdXzyyMjRLp6Srhy/MwZq3a6Mdl2pxaGP1zx71/ihviAkMNyeRFIJpyp/lQT6wkL9x2w4Zep2QSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbjAW9090cd/bjSRbjftgw3ADh8FbS19dgg6yyE6XXs=;
 b=Shl/YlGbOIkcMm902EsFnjpxmO22G2wROc3i8TgIg/Qo21+LEqGrNqQk0IvfMHAPgHOeLXbFDy3kSTktllDRbDz5oJ7Hj/Htstu3je1dHP17tHfls9uobVb1WhNEu+t/eeeFmckrhIFS9TFG7+fXj5r+hdSYviFPMGs0KFc7s3st7IvfIVUHooq5c2+DTOcpHetaIFHSqEaRV9Hf6pUhysauBL/Kb8HRfB3cMOnAlR4aXDFL0DxyZlqxxq7ad2EUZ5xUNdTcYemKLXxuRhJ2oPkSktYccJkJyE3ZWz7DnbTkxnzgdjH4cQODOXTQ1G+MJzZSWfc2+ECrdAsk3XCA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbjAW9090cd/bjSRbjftgw3ADh8FbS19dgg6yyE6XXs=;
 b=gkn4UQjtDD8xRU0dv5bQD5qLU3W+NRgQEWsFrzlAEZ8LeCJwLMiFdzO2saThboeQ9uTM2DYJ8SbcgEGNl83/VdqrTkplwoXhj1sdm18kFz2ZtJ8hmr2X4/cBkkcw/lcDJFABRXat9eVh3BHVCyTTpLKKcdvR4dc4FCmHKCqsCZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3] xenconsole: Add connected flag
Date: Thu, 15 May 2025 16:12:45 -0400
Message-ID: <20250515201245.80612-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SJ0PR12MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ae0ad1-216b-4ad2-fd69-08dd93ecdd61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WHVYJLCNR6zVgP9350kci3qrbzEm2N1cub0Y87IjrE6ueLUx/hxNsbWoLQrY?=
 =?us-ascii?Q?J2lvTZucJfuJb8dkwJEtSwSQpuJF/94t5exSILYHs3ASlc0rbXbqejlDPrzG?=
 =?us-ascii?Q?yaXngYzVINE/6pij1ogjgCYWe9F1WoC0a1fwowIxaCAF7XI7Pa3xHlDcAkJZ?=
 =?us-ascii?Q?I/Dahs1/WbTKgD5L+DuxQI2v8w/sjYtUHKHuv+8HxipSbaLDRjZa7XEhYJfP?=
 =?us-ascii?Q?I4RjsikwkKp9Up6nXT7PXXgzg4FMeiLhFJTxojPow+u3RU2ZZmgIaSelEJF4?=
 =?us-ascii?Q?a4nfgorHkXTCun7q9chPSBTiXR/4K6v740NcVTfcoXOeytdG7bDeHL70/OIa?=
 =?us-ascii?Q?QU4SGW4SPIraNv5qUfbQjie34h8rzfifwK9o/gpmHzO+jr3YXWednxUny8oB?=
 =?us-ascii?Q?1CnRliZ2zO2VG1WtsiNPX24hCItefVKJEW0j36e57C24msL8B8HVThV/MPFm?=
 =?us-ascii?Q?bjS+ay4WILfCRqPaghmowA75EvkMsAhi7CXxYcHyXyCuBWsleHXFUwSHrmER?=
 =?us-ascii?Q?sRalFvFWfsOeWl399b8ZuDwXulxwuTZq4Eo+E6PCztJ90xWkMPBWLQrUUXY5?=
 =?us-ascii?Q?t7pelji/3UnFwEWm/4uflCMvWqvGb9MgdBYD+gdyQecqw4LIvAIBJJjHoVay?=
 =?us-ascii?Q?d6DsVctUKpgcgJ2iuC14T9rZUGV6JAKSIrc/rKN4fOD6NpqwybZ+gFPypB5g?=
 =?us-ascii?Q?aBJwogyTxDGUrogbUfBfLgmvXifMlcgGqvUODz/U7L28AM7wlm15Swuhx3r/?=
 =?us-ascii?Q?FqcmDWtUy5L4P5Vi7IWkd5UXb4CRWV6nbRh2ry3PJ/KewdxQHGYkhyvCIaBy?=
 =?us-ascii?Q?6Unzx8aYIkCCphWX5MY/bSkwQhCvQzSQqh0Y7FmqBau/rNHeAOsCS3/YgUh2?=
 =?us-ascii?Q?qzAKuQ0wDmvhjncSfy/OZlVyLSKHHR/oBLffwTgPzuAF6m2sOaCZwz6iwX6t?=
 =?us-ascii?Q?IgqOLgceNlw33una+3GKicFZNNGESQSe8gCmO29EScGgrXWWl7DrwWNweed0?=
 =?us-ascii?Q?hX5U0CXHRpBij8Xb/AoWTRSw8TNcpDfD5kHEhPL3PQf4zEAb2rRd69PzNoU0?=
 =?us-ascii?Q?WuBaY9+OcYRawEfYJZH6m9EdzfdbGb1mPlNj95dIP3WCq3hDN8cn6TCK+EQk?=
 =?us-ascii?Q?rYquNjmyeiAqKTzjnnpgMi4Ku7/0kPg4va1LJHViFr3kgvY4C0bLjbeySTEw?=
 =?us-ascii?Q?kygJirl8g8jqAzDi8dCMwv4zI9Zx/O4WJBqA/NfJd/KgFPBNNIowif8Gk1bN?=
 =?us-ascii?Q?fNiqVOncaTwu20rbToXPiIvJri1y7GMHAjYvZMRi1np8yH0bh7Gn+bl/kSx7?=
 =?us-ascii?Q?eM/vzUL+wF9W60q1vut7EGryHvHmd+6PJP2e5c1ZxptgmNJEoCdZfefO1FJ4?=
 =?us-ascii?Q?GME9rqEJXecmUQppggMfEYzPE3Yms8XitGw5WVjY4LwgPtlcKYusK5tSkSmG?=
 =?us-ascii?Q?0bvzPmhav4WP5xUqi5kAoQB6v8ifNg5l+g7vXCpZrK1CI3X6L9yTeM0qXfH9?=
 =?us-ascii?Q?zrACeY3HHEGzhvcqN0j+AQJbLsQEKwBX7EOA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 20:12:49.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ae0ad1-216b-4ad2-fd69-08dd93ecdd61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008

Sending again with an expanded description.  RFC to have a discussion
about the approach.

With hyperlaunch, a domU can start before its console ring is connected
by xenconsoled.  With nothing emptying the ring, it can quickly fill
during boot.  In domU_write_console(), __write_console returns 0 when
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

With the flag change, the backend sends an event channel notification so
the frontend can check the state.  Though this is not strictly
necessary.

The connected value as 0 will be match the default of a zero-ed console
page.  Hyperlaunch can set the flag to XENCONSOLE_DISCONNECTED and let
xenconsoled set to XENCONSOLE_CONNECTED.

In terms of compatibility:
Old domU drivers won't check the flag, so no change.
New domU running on a new xen/xenconsoled will wait for the flag.
New domU on an old xen/xenconsoled should only see a 0 for the flag and
behave as if connected.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Flip flag values so 0 is connected.

The other option would be to add distinct features and connected fields:
uint32_t features
uint32_t connected

New domUs would check features for a magic value or flag to then know
they can rely on connected transitioning.

I think making XENCONSOLE_CONNECTED == 0 side steps the need for
an additional features field.  As long as assuming zero-ed memory is
acceptable.  However, this only matters for a hyperlaunched guest -
xenconsoled will normally readily connect the console and set the value.

This assumes that existing frontends are not using the flag space for
some other use.

The idea of the event channel notification is to let the domU receive an
indication that xenconsoled is connected.  For xenstore, the xenstore
driver owns the event channel/irq and can rebind it.  For hvc_xen, the
hvc subsystem owns the irq, so it isn't readily available for rebinding.
Maybe this should just be dropped.

I had the idea for the kernel to use a static key and switch writing
from the hypercall to the PV ring once connected.  It didn't actually
work in my short attempt - I think changing the static key from within
an interupt was wrong.  I fell back to just checking the flag directly
without an optimization.  That would work and would make the event
channel notification unnecessary.
---
 tools/console/daemon/io.c       |  6 ++++++
 xen/include/public/io/console.h | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index bb739bdb8c..10524eead7 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -731,6 +731,9 @@ static int console_create_ring(struct console *con)
 		con->ring_ref = ring_ref;
 	}
 
+	/* Mark the console as connected. */
+	con->interface->flag = XENCONSOLE_CONNECTED;
+
 	/* Go no further if port has not changed and we are still bound. */
 	if (remote_port == con->remote_port) {
 		xc_evtchn_status_t status = {
@@ -780,6 +783,9 @@ static int console_create_ring(struct console *con)
 	if (log_guest && (con->log_fd == -1))
 		con->log_fd = create_console_log(con);
 
+	/* Notify to check flags field. */
+	xenevtchn_notify(con->xce_handle, con->local_port);
+
  out:
 	return err;
 }
diff --git a/xen/include/public/io/console.h b/xen/include/public/io/console.h
index 4509b4b689..c16ef42ef4 100644
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
+    uint32_t flag;
 };
 
 #ifdef XEN_WANT_FLEX_CONSOLE_RING
-- 
2.49.0


