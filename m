Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00C6F3925
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528289.821249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptaAi-0004Id-Q5; Mon, 01 May 2023 20:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528289.821249; Mon, 01 May 2023 20:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptaAi-0004GP-N7; Mon, 01 May 2023 20:30:56 +0000
Received: by outflank-mailman (input) for mailman id 528289;
 Mon, 01 May 2023 20:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptaAh-0004GJ-DN
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:30:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c6ba00-e85f-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:30:53 +0200 (CEST)
Received: from DS7PR05CA0077.namprd05.prod.outlook.com (2603:10b6:8:57::17) by
 SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:30:50 +0000
Received: from DS1PEPF0000E649.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::8f) by DS7PR05CA0077.outlook.office365.com
 (2603:10b6:8:57::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20 via Frontend
 Transport; Mon, 1 May 2023 20:30:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E649.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.16 via Frontend Transport; Mon, 1 May 2023 20:30:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:30:48 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:30:48 -0500
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
X-Inumbo-ID: 10c6ba00-e85f-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdMwMeBAzJ0YwgoD90WE9JrbR91We36xi7QeZHVwiTKiWY7A5Khhoc6nxeuWihek56vzUcJ4DYkKLLzo+5NjJzHfrKOBzkwl/OZCzsEo69HEpT7pOMq8zsGZq7G/QMStnhSt0IIZsYOqxvyH93aiZ9uYxH+vTry9AV0SzEpYpnOM4Sw5YN7vFcPeATrl5XHbglJP6134JQJB1/Un9urouybQ+u4i/59HhF3U0GKL0Ladsck8qt4oS8/nSIt/DsxwGICZPvkIevoZntQskET84Yi/uMHDRpnwZZoY3KKmYKunJ0H6Lt35aAwg15DNw4I65z2vW/zLWO1x7pzihh+AbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSFUIv+vA4xvYLSDbnANA0FJUUKynik5M6lLpry0LHk=;
 b=Wtg8XHCEFG0n5SqdcJqZqvWykMifHxVRV8SzZ2zrQnrZ1rgOMJLeyOZmVxhk98oWI7HSmsAkaRpNjogWAwshBJgiDQRS6n2o8YyxljzVzLJaVuw7h1LqgnQ2nfctTxMcuJOHLVDdP8UpPs0881sIvUZpd5q6nGa3BoDyLxFy4yDo/rBWjqlWsEE/gS0Z93Iu7ftVBVYh4SttaJFB19LJpuhjZOUcUbGpexwqGJJ1qUGvSruhSXxcZpj+AQrUZtFXjDzcx/oMhxP3hR87Tp1aYeraWnlO+5igDc2o/mvS/GWPZhf3diisk7jSYmnK+Jn/til7tVSYhCpwhipAau+bEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSFUIv+vA4xvYLSDbnANA0FJUUKynik5M6lLpry0LHk=;
 b=BUhgGeyjVq9n2YOjlMMUkiY94U8LkxXF2vt1Gl8le2Gmj5XQ8qU8R4ahXKwGNO39SHPC+QkcoLIdeHdwczECLuXGUS4yjwu05hY+7qUk1qnaAIlXNPqsBU+R8KH2OrGKegyHY3kTrHjt8KB3Mmirdk940T/Xjr2gThhp63wq+K8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v1] xen/sched/null: avoid crash after failed domU creation
Date: Mon, 1 May 2023 16:30:46 -0400
Message-ID: <20230501203046.168856-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E649:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: d80ca6cd-7382-4db1-4971-08db4a82f387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9rasoY0u2wUFDqhcqLDQc8UUGjWTGuBZITehAW1/NmIt5BgArjh6Rk829Z5ywuuBV8Tg+1Uo2iKcV+B74EwPql8Vj/x1HlIv5ZpSMr9wxcBIRhvOc/JQUr4NJkP9BOphqSrsTQOVI8/p5g2VfDS/N76QwVxeKAnKsalWpfzlS+XZJmGvBfwpT+ZRgyBt4nv3GGujpNxPL1kNJkiIw6CHdTFtEcFOb0JwME6srJSjm4GsJEB9HmnwA8v0gpzilKBMAnmD8Wm3tbvAiqaf+IBUNxYBVd77bBtAk9Di7NW2UdhSbFI9u3hFPg6At1I2SVdGHbsi8oWCSfaGxWQF57ukrFJL0D9XemCGTXTsHLjXohBcw2tbtKU91hbR93u/Sm8S5jeaZ2WWT7TU8brRNDi3LLIay+0xA3zU/0dgpVUaKcqxr2SfA2B4f8iWYeAiJsnUZdOJi5QrCBxYRNUP57rUBtEmG2jZwIGgU0UEQvGnTXsAEHp5FFlLaC2jBiGxqTEE0uTW97Jplj+kk0LMRojLRCpj7KZXYmK7OrZ9c0temJPa17BAXu9DP/bmY2GeJxJVlaqkb2a/NCVzXbxwhdPBvHY/+uQfkoJAIdLuJ5UQdDjTQyXdCpWvh9zRcq4o01EeLUvD4OpzNpMsE2fd94tL26hJPIo2ZRulJSSyy0ta82bMYvmHMeR6GtH7JJ7aBn92psuvWlNFaMuVnbjVievHU0/fZq8gFkfv9YxJ+x6dDDc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(316002)(1076003)(82310400005)(26005)(426003)(336012)(41300700001)(2616005)(47076005)(83380400001)(186003)(478600001)(70206006)(36860700001)(54906003)(70586007)(4326008)(966005)(6916009)(356005)(82740400003)(81166007)(36756003)(2906002)(5660300002)(86362001)(8936002)(8676002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:30:49.4209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d80ca6cd-7382-4db1-4971-08db4a82f387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E649.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784

When creating a domU, but the creation fails, there is a corner case that may
lead to a crash in the null scheduler when running a debug build of Xen.

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
(XEN) ****************************************

The events leading to the crash are:

* null_unit_insert() was invoked with the unit offline. Since the unit was
  offline, unit_assign() was not called, and null_unit_insert() returned.
* Later during domain creation, the unit was onlined
* Eventually, domain creation failed due to bad configuration
* null_unit_remove() was invoked with the unit still online. Since the unit was
  online, it called unit_deassign() and triggered an ASSERT.

To fix this, only call unit_deassign() when npc->unit is non-NULL in
null_unit_remove.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC->v1
* Follow Juergen's suggested fix

Link to RFC [1]

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-04/msg01387.html
---
 xen/common/sched/null.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 65a0a6c5312d..2091337fcd06 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -522,6 +522,8 @@ static void cf_check null_unit_remove(
 {
     struct null_private *prv = null_priv(ops);
     struct null_unit *nvc = null_unit(unit);
+    struct null_pcpu *npc;
+    unsigned int cpu;
     spinlock_t *lock;
 
     ASSERT(!is_idle_unit(unit));
@@ -531,8 +533,6 @@ static void cf_check null_unit_remove(
     /* If offline, the unit shouldn't be assigned, nor in the waitqueue */
     if ( unlikely(!is_unit_online(unit)) )
     {
-        struct null_pcpu *npc;
-
         npc = unit->res->sched_priv;
         ASSERT(npc->unit != unit);
         ASSERT(list_empty(&nvc->waitq_elem));
@@ -549,7 +549,10 @@ static void cf_check null_unit_remove(
         goto out;
     }
 
-    unit_deassign(prv, unit);
+    cpu = sched_unit_master(unit);
+    npc = get_sched_res(cpu)->sched_priv;
+    if ( npc->unit )
+        unit_deassign(prv, unit);
 
  out:
     unit_schedule_unlock_irq(lock, unit);
-- 
2.40.1


