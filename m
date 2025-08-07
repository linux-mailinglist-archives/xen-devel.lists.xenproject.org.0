Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C40B1D0C3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 03:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072402.1435543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujprk-0001lO-Ur; Thu, 07 Aug 2025 01:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072402.1435543; Thu, 07 Aug 2025 01:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujprk-0001iH-Rc; Thu, 07 Aug 2025 01:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1072402;
 Thu, 07 Aug 2025 01:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7F5=2T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujprj-0001iB-BV
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 01:56:23 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2405::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b621f2fa-7331-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 03:56:20 +0200 (CEST)
Received: from SA9PR13CA0127.namprd13.prod.outlook.com (2603:10b6:806:27::12)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 01:56:13 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::d7) by SA9PR13CA0127.outlook.office365.com
 (2603:10b6:806:27::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.6 via Frontend Transport; Thu, 7
 Aug 2025 01:56:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 01:56:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 20:56:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 20:56:12 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 20:56:11 -0500
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
X-Inumbo-ID: b621f2fa-7331-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik5gGOBehugU6kvMLG+raKnnmzIG9+Fs31rExHMWtN+ZXRZfgi3hxagcAOqHUuKM2Zg/PIpOX6s614onqGfu17n3ky0rkIKhwXSHgaIh6MGbnIiogRWn+L5jF2hQ4NznbIMY9OecaKDHaMSYL8MyYAy8WJOykO2ZX5779PN/GhMEf0FzF/TSrU4JxxGpWb3vBi4eiXJC7DiLoDajbmiNNJUW+hyyyp7okIC7WVB51Nb31xKfN8y9ZGq05FCZLElLT0nHOhmIdGXoday4Kbh/0AZZ3PTdfC5UVfWvywfna7i+FB8qKPg2fs/mH+Gqg8j6X061gOr+Eo7xdXwjcv4VnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+GUBK3BGoBiOj1Bx6ic5xRAMlb6UmFSa3eF+ZUiJZc=;
 b=jJ5bHj/MQRqPZU436Ojj9aQoRqbhqxndthmPe2KOkvycFqN8KeII0+o/LDC6zvRm3SuoqHQTmyYTJy7Oh9zsW4kHZn9TW1OXbYEENa6fqCeIAIoksQEaqRrVkO88q32WVfqfw7U+X+BikMzsxcfrIF4dpwgHw1Rxhy7UWBDAKcsE5Q1umg5W0LGLBkKOdpGq19kyt/U2a8Ho5muaIJz7ZP9Po8GFl/mst3NwDzR97VajGNT9lPQvof9GWLKm/0GyYr/DQKJrNgfJRl/eE14U5sbs1JgVku7SOr78xYyIiMyqBF4iLg78+cL7fe36SAvFZEX6qnl2j7k/gH3FmDx/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+GUBK3BGoBiOj1Bx6ic5xRAMlb6UmFSa3eF+ZUiJZc=;
 b=EfEG0ZG3CRK0IZRk4hY7iBBuDe+MIr8M/PzLy8VwnBn9y9gK1KCLpWQLZ4ghX6q9DEdqYrvHtLSJ3HT9TJyrT6JmfuNZz/8EWe3RTcZWH4flc1dUmqWsWgky1hL8wfXV1py8mYrOjnOQC1h/nyqkBB28kJLA+qGTTuCzRcV71nk=
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
Subject: [PATCH v1] xenconsole: Add connected flag
Date: Wed, 6 Aug 2025 21:56:06 -0400
Message-ID: <20250807015606.4427-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SA3PR12MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 550dc3a1-fa46-4a3a-f4a7-08ddd5559688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TLHdM7ZTyNtwuxH+E6RmsfxJnTCZeg81L1/DwyW8beHZiLMNhmyV2l2wI9kd?=
 =?us-ascii?Q?WgK8pxStSfT2Xs86Qub+gmtg048Y4K7+6g5IpDJ13eFZKan+tgTwQmb3xZpp?=
 =?us-ascii?Q?YlmWcG9ETyBR7ZTmd4XGpaIy1AuMV6nCcAoHeXz7yyCrT2x3FnK3yOF+Xlan?=
 =?us-ascii?Q?Gy0qS7L6MSFFdCgXqgnYgov7vYW+9MGRKoXeIz8v6OiuzS9tLQMEywJy/Cbn?=
 =?us-ascii?Q?r6dzZBCAjr5dUK91unirkQ0qaYdKPslm6Y9iFt54p9rHsOhPiwfM5ZfKhQIz?=
 =?us-ascii?Q?TUnCi+UMzISDBm3lqKhyTB0xpaiOZj/ibqT3hKROApLS9W14+vVYka+/0WbK?=
 =?us-ascii?Q?xO055wgk6Qpmgenr5AZKlA8J5tNffACM2AiGdzLe9APY+bzvChywl5YQDTC/?=
 =?us-ascii?Q?0pSSO5zBrjaOGqkD0XBbbRvGC6fYT/Pafc3DrQ5EJmnheil0cIeBT/ngZSkP?=
 =?us-ascii?Q?0Cvcmm3+XsYtZYUEeO/rb0Zchz3Wkxi8zZS1TA7EM4XGcBdOhDACz7RbVuEy?=
 =?us-ascii?Q?YKPMcfpwsE7VQbgreApzGCVJ8LLVvhkdk/2KIhj/pp7pZ9XdnayaNRBrvSTA?=
 =?us-ascii?Q?b490YkbFuwRQ83ZG2jjmPgdhFn3+FxE/Jws89hqQg35ZJ0ZW81xeo+b+NJqw?=
 =?us-ascii?Q?XmBgKEmdX8gUhyxNByFoemrhvfexBZVNN4PKnJdLoKruCAMsrY+qRGshASQN?=
 =?us-ascii?Q?2Y6A3RWUxeLqhMpaG82Wvzv4rdD3Dpl+esEwXaNz0JuBBFOb1Lf2xyRlaVpQ?=
 =?us-ascii?Q?i1U353bZNdL9FhcBOkmLhqCai5zaXTXSqU+DbRNmZ0o9Go39TgyFbw81iILB?=
 =?us-ascii?Q?+YeLuX0BIXxEMafosFqRu9/QEwiXwIwtLREvG+K/60kXDXRrJhMb23INNJTZ?=
 =?us-ascii?Q?WduxnpJOnIX8U+0+JvI1v7+LbApZTtSfFO4V/jSlz7Hv0s8GUlqaYRby9mk9?=
 =?us-ascii?Q?BAp43p+C8ern1soolEWnke70QdjqoI+28Hjdb9x27zhKsk0YpCZ5eOnMTqxp?=
 =?us-ascii?Q?q8Z/R8RYTZ53qNGPOFUEI07GxShQtLB5BucZJfUrIaA7PiX090DMdiTY0cki?=
 =?us-ascii?Q?ZhRcSIJSWKivT4Tk/vkbZHJgaTJMxaf2RhWcFLtEgFF0Y4E+GxvQzom4JrFY?=
 =?us-ascii?Q?4xcqevhaQ57X4PPutocMQNhwvgJ+hXyo4DC0/TCKSNCPelypWOoLDs7W/MWo?=
 =?us-ascii?Q?gLZ/MEg2LolwdJ7SCyJu/Z6VZfJVgPaiUiaNbJqJWigIS6rW0aR2uVpYtR+T?=
 =?us-ascii?Q?xCsydPHJgpOPX6k2VJdTGmzG5MjHLiXPhuRFGeUf7UVhrbx9vFN3Ig2uoVnZ?=
 =?us-ascii?Q?qZHY5hSOxN1R7WI/gVcbg/bpoTpdrrnFKV4yoS+npNJtaZtwlTU0TIBxabBC?=
 =?us-ascii?Q?5LHGLJZCkIrpdwb3Ddh+ChwXHoAh70EjKNqAxUJmL5AcUnHQw6KORhMHMcjG?=
 =?us-ascii?Q?xLXVfFateHp61cnzJ6I/H8sLSCAkVnwO6MQbuHKJjkanwyB4BedFrCMXlTi9?=
 =?us-ascii?Q?ZL3QIs7NjrfH8B4fo++9ABldRGaPOrxKSG1W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 01:56:13.0241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 550dc3a1-fa46-4a3a-f4a7-08ddd5559688
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802

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

Removed idea:
Send an event channel notification to let the domU know that xenconsoled
is connected.  Xenstored does similar, but for xenstore, the xenstore
driver owns the event channel/irq and can rebind it.  For hvc_xen, the
hvc subsystem owns the irq, so it isn't readily available for rebinding.
This is not implemented.

I had the idea for the kernel to use a static key and switch writing
from the hypercall to the PV ring once connected.  It didn't actually
work in my short attempt - I think changing the static key from within
an interupt was wrong.  I fell back to just checking the flag directly
without an optimization.  That would work and would make the event
channel notification unnecessary.
---
 tools/console/daemon/io.c       |  4 ++++
 xen/include/public/io/console.h | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index bb739bdb8c..c278752ff1 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -781,6 +781,10 @@ static int console_create_ring(struct console *con)
 		con->log_fd = create_console_log(con);
 
  out:
+	/* Mark the console connected. */
+	if (!err && con->interface)
+		con->interface->flag = XENCONSOLE_CONNECTED;
+
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
2.50.1


