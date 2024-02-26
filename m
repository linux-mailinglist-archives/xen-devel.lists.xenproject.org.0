Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA8866875
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 04:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685249.1065664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRFh-0008Lb-Kd; Mon, 26 Feb 2024 03:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685249.1065664; Mon, 26 Feb 2024 03:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reRFh-0008Jj-Hu; Mon, 26 Feb 2024 03:02:01 +0000
Received: by outflank-mailman (input) for mailman id 685249;
 Mon, 26 Feb 2024 03:01:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fECz=KD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1reRFf-0008Jd-I9
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 03:01:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6622f974-d453-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 04:01:56 +0100 (CET)
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 03:01:53 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::4b) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22 via Frontend
 Transport; Mon, 26 Feb 2024 03:01:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 03:01:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 25 Feb
 2024 21:01:50 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 25 Feb 2024 21:01:48 -0600
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
X-Inumbo-ID: 6622f974-d453-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLGKUXYMu+28U4BGUOgJ67q9z2lePw+QZx4RmDiLCps4THboznNFCHg3gkJERS2yRdPL060RIKby4QbqgpNNDdA/wfz5kW2r1k0G9SQuxhIf3BVXeRJx57Bju1KjTwSv3orCLq6GQMm0Zmcv/z5YMreo07Alc45NJDS+XPRFWOvHnWPclr3uUX3nW/BSsI+B5pD6juEdjs+zS1Dncrt9hoeLtorNAyO6G3KJEfT266t7JkeMXevg8MKU4Ierx0ymSX4Tcqkcq8aNFt97AfO1MsEuxVbDnnUu4HSR8pNI0Ay7MulfoIXmkeUFwIxqzVWwxKbf/eD2Bm2v3alyS8s+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb+v1j9xyb+ru/VnYV1pVUwgPOA04LuMrPTFdg1rbn4=;
 b=Rw0wdxDknUavq/CDSAYI/tXLdpyd4cNJufEaDiaG3VaDtaw81kprJEY0eS0gnrYIxkp/6uEE8QdDruNqwkXBcNci32Uuu8PP6QoRG0NgFow7tbLhx3hCSYjXScw1bwwPeDz6Zb7l0aaw/yLX7IOVOsWea4cO9LzpJewVrH6ZPP1j+IQAkJQ5firhBmGCMUS1R8mVjgLyDTcgnVwlv4ifTYBLhBC4/Wpv5LCy9eq1r12HmGkR+0dOUQ/pXXQ1itfTbDYJiLXcFW2kLDNvhyLvS8x9zxy9SN0DbHDqrsSfiH5dvJcmAhsClvzr9BBmj/ah7mB2H5ltUZ6JAW1/zG7vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb+v1j9xyb+ru/VnYV1pVUwgPOA04LuMrPTFdg1rbn4=;
 b=EadhCkETQXE065DGOvare7F3O/eoy0I5x82lTMUsNzTovLg97w1viyuqCbVXUy8+2aXoD/VHOa3rFNEJt9raxR8Gy8Lm0uinDBEwpadqsCxPMn1x0cee4SI6YevdKMTSMFQIAgs8OWbS5NvEyalyLBcXLrJRJKHqk3oS0Bm6d9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Date: Mon, 26 Feb 2024 11:01:46 +0800
Message-ID: <20240226030146.179465-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a58300-57cd-4f5c-c4b6-08dc367748bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nxRUaZoVmBj4tGx+iH7zBh5CxNrWO2qDiEYg80ZgzTYWR1oAYHZV2VYuG19MlYvvb6jlE8Tm0y/v9rT85IKz//lfY/BTKSL89kK1LB7jkNnTKC6acKUNElztJbML2UtnYPE+V41YKNcwCQaZLcwdehlQJdLhK7G5qFIUJAyLZDnt9ReOMHgnn67oSKPjN30xn3yy8k61IMtzv1RxbPEL9y4X1OC7iBL+aRdQ+KHfTg5v5YW86ttOIi/DlDDgbVJcNt2a9iHT8Qa8Idpuf7e65Wbt+bD4iUCY7r2C2TTH0TiKu3PDN21nGSFSTS/uyPexkNkoGuRybK1PEbHTA1FXWCqFfl25lhyFxcPq+CYXSgTvqNFwXXz1SMuoZtETbr7KJo6nYJWsMTW7Br/bWT4opxKeYEjRCGD3Y9CzgQpMskUvHkxETl2QzFSK0TCS0lzY4sz74IxgdT0FXmOz2IXd+DRo/LkF7Lpnd7+KWSaMSkqrHj1OaglqPuCetCOCdjxjfMT0ibAn+wHJWdkZVNX3YaCyW61nrQB6ZkV8EY1V7yxc6s4uAYB/2SxPFfcyzt+9mRnFcn0y47N/lDHnkxfGLKDuaSAE8ihxz0t1jgJj3s6dVNFKaf/bnLA+pU7nRZHAnYUeLR4p3gsxIPSwgSZlcwEq9DBI2XfOlVu07/mceMQ90rnV+HQwwnCUas1jhiEnsrQrk0kfdgxu6ER+BluT+m0byfys+SC3VuZUj15A7Ls0njHCbzQDY8hoDXZUx3K2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:01:52.8078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a58300-57cd-4f5c-c4b6-08dc367748bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678

In the common sysctl command XEN_SYSCTL_physinfo, the value of
cores_per_socket is calculated based on the cpu_core_mask of CPU0.
Currently on Arm this is a fixed value 1 (can be checked via xl info),
which is not correct. This is because during the Arm CPU online
process at boot time, setup_cpu_sibling_map() only sets the per-cpu
cpu_core_mask for itself.

cores_per_socket refers to the number of cores that belong to the same
socket (NUMA node). Currently Xen on Arm does not support physical
CPU hotplug and NUMA. Therefore if the MT bit (bit 24) in MPIDR_EL1
is 0, cores_per_socket means all possible CPUs detected from the device
tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
accordingly. Drop the in-code comment which seems to be outdated.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 xen/arch/arm/smpboot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a84e706d77..d616778655 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -66,7 +66,6 @@ static bool cpu_is_dead;
 
 /* ID of the PCPU we're running on */
 DEFINE_PER_CPU(unsigned int, cpu_id);
-/* XXX these seem awfully x86ish... */
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
 /* representing HT and core siblings of each logical CPU */
@@ -89,6 +88,11 @@ static int setup_cpu_sibling_map(int cpu)
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
 
+    /* PE not implemented using a multithreading type approach. */
+    if ( system_cpuinfo.mpidr.mt == 0 )
+        cpumask_or(per_cpu(cpu_core_mask, cpu),
+                   per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+
     return 0;
 }
 
-- 
2.34.1


