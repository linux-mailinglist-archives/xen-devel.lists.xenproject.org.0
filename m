Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777BFB1881A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 22:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067537.1432239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhwIt-0004OK-I1; Fri, 01 Aug 2025 20:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067537.1432239; Fri, 01 Aug 2025 20:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhwIt-0004Mq-F4; Fri, 01 Aug 2025 20:24:35 +0000
Received: by outflank-mailman (input) for mailman id 1067537;
 Fri, 01 Aug 2025 20:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=maRn=2N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uhwIr-0004Mk-NT
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 20:24:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8586a991-6f15-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 22:24:28 +0200 (CEST)
Received: from BL1P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::23)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 20:24:23 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:2c7:cafe::9a) by BL1P222CA0018.outlook.office365.com
 (2603:10b6:208:2c7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Fri,
 1 Aug 2025 20:24:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 20:24:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 15:24:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 15:24:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 15:24:18 -0500
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
X-Inumbo-ID: 8586a991-6f15-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG0Ps1IRCqOZ1Hp4ytJx0np1v4O8IXHTR5yfEIftIGcHO4Lio3Za1Rb/B4UoP07fUoyX4XRe/dT7Fau59RLctAE/pAvMQYwR50mODVr46UCV4sB4UW42DMnpEzYVW4inQxmZg9bzPISy+ttYs5WhhX6OR2Ph+GhHwe4MVZKLUllJOTyHYcSFGInp24hEIciTi6kH1doTxWPgkMfE06ogy04nkfEHA4ygua1nG11hcviCw9wxsaz3eMsp8fJM0/NK1ZlE57aaDCfI1XfRqxJRACJu1kzMcu8Mi65W3sUW0mE9vkKccoas90hfYm1BuOKdsyltT+whyQ0K2BH46LdQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuuNhzl+CLRgolTrlm0kKbEa3pU9+4fwb6K6xxKAvbo=;
 b=MFvpX9Qqa2n5udP2/WW7Ioc35EgpmJpUN2ktCbHulmh2iZ5Jc6lDVjN55pb/2AbUmlzf0xZ+vC2ujcXypG1jCmqBzdBzvP0MBqZOL9yYuXnffGDsbTEaGc/eOwsb0w+X0UUfOFpQgR5CXK3eBt7ANcHUQyK3/HoaB4sQi21AIRWzLDGzJdNaBYLjEVngdCZoj5gAytRM9NlVSyux9/BaMWGlxLhcWGW/yokwk6fUWrLBS8j7/MJPfItOoARv9BbhsaKZxyYLnj3chYkR6sPKUTa0rvmG2gcoXXUUt0HGXapRiiGfiztqG30vW+d6d1Mh1FOxLCSzPvKUGJRQCDeVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuuNhzl+CLRgolTrlm0kKbEa3pU9+4fwb6K6xxKAvbo=;
 b=k2bhBdIL6cire2Ers4IIgdJOQzwzmj8ehEgQkqu0EQSLJtSH3Kwv8TrrakK9gqZr87HUsa8T5W7MNelphpGYTlI4qbHcn7rdk1TlzcBCAiq3zClowi9nd6HoOtr7mbhacd0uMRFDwytHy8LjbTUvU2/O6r1Y8smCKg74DnIjr2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <gwd@xenproject.org>
Subject: [PATCH v2] xen: rework error handling in vcpu_create
Date: Fri, 1 Aug 2025 16:24:16 -0400
Message-ID: <20250801202418.38977-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a08fdf-99db-4fa3-35c7-08ddd139669f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+FCbhjffFNRkxTYAbFN5M0zZYd0VxapA6Ac8uei/n5+v8NBEIH1EjJhptaIz?=
 =?us-ascii?Q?xDztuFOTrQ0rZH3FeigTuaVtKhGz5TzZdIoO1iWF85nf6sOSCowMvoDjVVjU?=
 =?us-ascii?Q?qKkNT3sA01GoN2/o4QS0kma6M6prL3tZ78BmiEeef9HtnLXdMQc/+zSvdcx8?=
 =?us-ascii?Q?vkZqMbL9W6XLHl+r+gLB4RNkDxNbxErtxQDq8c8vJmTOYCHBb9EttOLo9nAR?=
 =?us-ascii?Q?ATEt15U23k6/X8ZjBkWkVDewb8i8izBSKUFoxKyWGLVxTR86001E6SyoS/t5?=
 =?us-ascii?Q?RluHMaZ4SGKiO3Zj3G97fmO81XnP4PSXVP1P/SZd0D2iFgZfkvdwWq88gc0w?=
 =?us-ascii?Q?nCNZBHoJ8LYjIMQOi8fDR5VWcm6oWpfqHHgJWCSyp60o672qHBMh+N2GH5uh?=
 =?us-ascii?Q?e3F2d85IAQfZztImJMTBX9RjcecC2JkU2YDOq4gqiT32e8deR+BpGMuiqGH3?=
 =?us-ascii?Q?U9OK0tHxb4kRuGhkk2hf2O2hcQjZ9WuDqdjiBFQK24kfQHuB58Hl4hC0PhHh?=
 =?us-ascii?Q?jjKKUP/SzRGKo+oBXzg7zGXlBvB/VwStWhDWNCVvuxlY8Z25ZCoQ+IZIq16y?=
 =?us-ascii?Q?zw+t/sqYlEgftPje3dyiFDxFK1ksXJFVSwBX5lB3P2OpoBhzgLivm99JLk6r?=
 =?us-ascii?Q?Wls1E12dovw8Ho6dcrisWpWZwFWdTzd06lots8MrFYpkW7iGZAq1RR5y4m6e?=
 =?us-ascii?Q?wzsF9/oDAmS9hLr2zC32jq1nuuVA9MYP7LwJsvuUZkyNMWQFjILgqIBMx/Rf?=
 =?us-ascii?Q?6NInpjQCWG6NwniqjH2zBfLY1YeLd3DCTe9+yos6Zp2NpB6pEw/5CX+SfsUn?=
 =?us-ascii?Q?BblFGj/+gnl73PGLjRE+v6sLqbBAQU+9IFZuCdLSpyJVRIVzKtnUQJG+5XE8?=
 =?us-ascii?Q?7D3yPGfQihhMHFWeKf03jN1BldS0VbCLHg0PJQvlujUXCm9Ewu7EzXCMOjad?=
 =?us-ascii?Q?T0yoCgiuHv6vemhsgPfxTHhfNronJKLG3XP/27A9zm7Rn/YczRKOVzERhZue?=
 =?us-ascii?Q?DvJmHvSmPglTNwhFa/SDEYTk90GgzQM5RacOprxv7TysbIWPfX1NVLG7ljmh?=
 =?us-ascii?Q?8EhNpYAzmejjSO8p1ZM2fBlKI0S+x17mKf11z4mbXol2xA/ooTiFnNpPW4Sk?=
 =?us-ascii?Q?jWiDif5DIR3RfqYHMrih9E+IDtQTcXwG7YnHFmfbvUjkJT1F6dd78Y7ZtRm3?=
 =?us-ascii?Q?u9aeykCXBo5M8tXpTDODP8ZmWFxq9enXAJUHHPKqih+HjABjNqCegSJ/A/i1?=
 =?us-ascii?Q?KLLBJ+hThi7u7GnWdlzigvB+wCI9O2B0fSyXmarQ1cbs2v+eUZ+hj/uzjsf3?=
 =?us-ascii?Q?8VDYoFFLQzqr0wL6KrMEFnzBMO6shKbpbqaCkApoTL8vCjra5ybBtJq13JRB?=
 =?us-ascii?Q?5mr1KyB/bQtnZGE/KrJrMTNIn+WwHpj/xJCfElTez4CfWX/fQsQRvtyBMkEQ?=
 =?us-ascii?Q?MXPubzsl290lNPiiz0lch5Wf9lB6J5XjE6CzjRXq5cFzLKzQ7xvgfOzNC37w?=
 =?us-ascii?Q?NMNgeAFbxmXvLBScrEogB/N49Zw8Dd2w4LeR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:24:22.1103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a08fdf-99db-4fa3-35c7-08ddd139669f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

In vcpu_create after scheduler data is allocated, if
vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
resulting in a memory leak.

Move sched_destroy_vcpu and destroy_waitqueue_vcpu to vcpu_teardown.
Make vcpu_teardown idempotent: deal with NULL unit.

Fix vcpu_runstate_get (called during XEN_SYSCTL_getdomaininfolist post
vcpu_teardown) when v->sched_unit is NULL.

Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* move cleanup functions to vcpu_teardown
* renamed, was ("xen: fix memory leak on error in vcpu_create")
---
 xen/common/domain.c     | 14 ++++++--------
 xen/common/sched/core.c |  5 ++++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629eeb..9c65c2974ea3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -388,6 +388,8 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
 static int vcpu_teardown(struct vcpu *v)
 {
     vmtrace_free_buffer(v);
+    sched_destroy_vcpu(v);
+    destroy_waitqueue_vcpu(v);
 
     return 0;
 }
@@ -448,13 +450,13 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     }
 
     if ( sched_init_vcpu(v) != 0 )
-        goto fail_wq;
+        goto fail;
 
     if ( vmtrace_alloc_buffer(v) != 0 )
-        goto fail_wq;
+        goto fail;
 
     if ( arch_vcpu_create(v) != 0 )
-        goto fail_sched;
+        goto fail;
 
     d->vcpu[vcpu_id] = v;
     if ( vcpu_id != 0 )
@@ -472,11 +474,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
 
     return v;
 
- fail_sched:
-    sched_destroy_vcpu(v);
- fail_wq:
-    destroy_waitqueue_vcpu(v);
-
+ fail:
     /* Must not hit a continuation in this context. */
     if ( vcpu_teardown(v) )
         ASSERT_UNREACHABLE();
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 2ab4313517c3..fb7c99b05360 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -321,7 +321,7 @@ void vcpu_runstate_get(const struct vcpu *v,
      */
     unit = is_idle_vcpu(v) ? get_sched_res(v->processor)->sched_unit_idle
                            : v->sched_unit;
-    lock = likely(v == current) ? NULL : unit_schedule_lock_irq(unit);
+    lock = likely(v == current || !unit) ? NULL : unit_schedule_lock_irq(unit);
     memcpy(runstate, &v->runstate, sizeof(*runstate));
     delta = NOW() - runstate->state_entry_time;
     if ( delta > 0 )
@@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
 {
     struct sched_unit *unit = v->sched_unit;
 
+    if ( !unit )
+        return;
+
     kill_timer(&v->periodic_timer);
     kill_timer(&v->singleshot_timer);
     kill_timer(&v->poll_timer);

base-commit: f6c990ac3cddc2d1965a7ab09324d821b05e4b6c
-- 
2.50.1


