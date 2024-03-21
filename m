Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57F881BB7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 04:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696186.1086890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn9YW-0003x1-3r; Thu, 21 Mar 2024 03:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696186.1086890; Thu, 21 Mar 2024 03:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn9YW-0003v9-0r; Thu, 21 Mar 2024 03:57:28 +0000
Received: by outflank-mailman (input) for mailman id 696186;
 Thu, 21 Mar 2024 03:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n22p=K3=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rn9YU-0003v3-Fo
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 03:57:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e37527d-e737-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 04:57:22 +0100 (CET)
Received: from SJ0PR03CA0352.namprd03.prod.outlook.com (2603:10b6:a03:39c::27)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Thu, 21 Mar
 2024 03:57:18 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::7c) by SJ0PR03CA0352.outlook.office365.com
 (2603:10b6:a03:39c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 03:57:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 03:57:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 22:57:15 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Mar 2024 22:57:13 -0500
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
X-Inumbo-ID: 1e37527d-e737-11ee-afe0-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f19+KbauiRVrpvQQMFPvEDWCJo6yynx6E2amGzvcSwpP4Y0c0ez/tYeOUZMvIghYM8bUUq8Ln2nFGPU4u05a+TJ2RLifdhnFCF15QbZ8ZPJcZ436cJkDDDENazicED2buu/fm4rYrXH0DEPZLtI3NupmjvCceYBQzzShxH1aYoOWo4AqJCAKNNWgB/IcIOnYDO2WUK8EKNaXwwJb0eFFR/32z9j671t25FFf29ZbsySa2yZEnhnGxWmOctEGU/0yozerjSBeqL4EerMz0UFYAcnu16FMx9NFf2dJ1yH/kpUTT3dBBLRWJB63TnLsUfiHUL2D7UO4zkcPNWxCFwS/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8hfISM2XkM3r0lcEr4nkF80dF0hOzqCEh+8aGyArzc=;
 b=j+luvLJGN13XfrE94y4un7LdmcGINw1wjCnka/ZmsLJxFaOzNPKHxeUVlkvT4pwDi/PY7xVFxUbT9yl9o2s01FpXKgk6hVZ1u/AGXXjIziRqfI6bxqn9/zO4xNgBlifL/wCzvcLynZfg3sSMJkkw5kgIjMnYgbkB9uJHtsqUlRD5J4GB/l70cNhbzdLQGuiLtk7Tr3WgxAiH0wQ+FwIZdGrcqJtqRJ029s/lEWigykEC0M3Pk8p8kwCajZ8bWuzYrqTlmgXIlbe4rMsMQGcyDZJc7lf94tpzISPA6jkVBX7tuoLjusdTdAET38h7lqdPQlaAP432GrBhOD4nDrGOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8hfISM2XkM3r0lcEr4nkF80dF0hOzqCEh+8aGyArzc=;
 b=SxLPGRPnVOxu09w5PymSraZpCFQ74MrcmcyHHKKfL8zHuixTJsCSI4YwE20Wu6wQQGZ7ooscxkpvKgfXYbUvQAqOHCg7HMEw28t29Lv+KVeSAXFDIMbziJeVP5iCaYPmPP9KM4ScRVIKkwH2Ox5C7alGYy2jUaQMgZbZY9IdwuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
Date: Thu, 21 Mar 2024 11:57:06 +0800
Message-ID: <20240321035706.165253-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e88845-359b-4406-fe50-08dc495b0095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	soWUyJKT8cmj8zW135jvEDfOJ6Kp0fCNrV1Zlr+EHtNAuV3dTkUo9NFzkc4YLOuhsoXZlEYf4FHkTgbBE0vCbN7Wp6cvB2AiFgLDqf2q7agpLRW3c+D+bUXH1vaNoIw+Nk1ZpOy6hVFZW4YC2FiZLqN75U80O68zKvHjjFg+UxmRfGRRUbu81oHZZnruTqAlw2/dCthCniK9z2XA+eUlaUtwanbbSMJEyQHOTxUlvrf7hRPvPVzYKF0r6l5RNjBNkEi2ELCf1vH2FJqKUe4RUii+QQPVsw3D0VsHsJQtUZKypCS3xTmWM1X42TFup20rc3pBxU7iKwSqJ3KwUKeQGkhz9MjMQ2zZW2dCzRPspQVvzdVj8O4TL8wJScRSScaBv73c1ITfVLFifpbPRumTlDNnOU+OJhj1gwImj4ZZ6KwxKC7jMEZVTt9/xvv/UlHBQweLWpEaLSz09QHKXH04LGmGWJnHxkQbe0S5l0YRkYxMQPuAfd/vEDBRQqQGlCs8bZuzbEsOWH8PwxiEvEc8K0LQW/+/GI60G5IMGEq/kpiGtqUXBl7sEP1D/aE4ZKV+XnLMrkPHUDr9PzlDI9aHNV5B6jsy+bL+w9u25afEQuH6eUuN5V9PSfezC8NjmatUOJyqdfskxOfIM4ANTtFOJmc0/o/5gfeEdmNxg0xZqwlt34We7w9PKPmts4oJHoweb0nA75iUJhLt56tan/D1zWGDEL04X8fJfLKvOATnu9tF/3qeseyCfPEBzs56IwME
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 03:57:17.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e88845-359b-4406-fe50-08dc495b0095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147

In the common sysctl command XEN_SYSCTL_physinfo, the value of
cores_per_socket is calculated based on the cpu_core_mask of CPU0.
Currently on Arm this is a fixed value 1 (can be checked via xl info),
which is not correct. This is because during the Arm CPU online
process at boot time, setup_cpu_sibling_map() only sets the per-cpu
cpu_core_mask for itself.

cores_per_socket refers to the number of cores that belong to the same
socket (NUMA node). Currently Xen on Arm does not support physical
CPU hotplug and NUMA, also we assume there is no multithread. Therefore
cores_per_socket means all possible CPUs detected from the device
tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
accordingly. Modify the in-code comment which seems to be outdated. Add
a warning to users if Xen is running on processors with multithread
support.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Use cpumask_copy() to set cpu_core_mask and drop the unnecessary
  cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu)).
- In-code comment adjustments.
- Add a warning for multithread.
v2:
- Do not do the multithread check.
---
 xen/arch/arm/smpboot.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a84e706d77..b6268be27a 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -66,7 +66,11 @@ static bool cpu_is_dead;
 
 /* ID of the PCPU we're running on */
 DEFINE_PER_CPU(unsigned int, cpu_id);
-/* XXX these seem awfully x86ish... */
+/*
+ * Although multithread is part of the Arm spec, there are not many
+ * processors support multithread and current Xen on Arm assumes there
+ * is no multithread.
+ */
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
 /* representing HT and core siblings of each logical CPU */
@@ -85,9 +89,13 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /* A CPU is a sibling with itself and is always on its own core. */
+    /*
+     * Currently we assume there is no multithread and NUMA, so
+     * a CPU is a sibling with itself, and the all possible CPUs
+     * are supposed to belong to the same socket (NUMA node).
+     */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
 
     return 0;
 }
@@ -277,6 +285,10 @@ void __init smp_init_cpus(void)
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
                     "unless the cpu affinity of all domains is specified.\n");
+
+    if ( system_cpuinfo.mpidr.mt == 1 )
+        warning_add("WARNING: MULTITHREADING HAS BEEN DETECTED ON THE PROCESSOR.\n"
+                    "It might impact the security of the system.\n");
 }
 
 unsigned int __init smp_get_max_cpus(void)
-- 
2.34.1


