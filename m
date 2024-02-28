Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D986A63B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 02:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686371.1068302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9Dg-00074h-HG; Wed, 28 Feb 2024 01:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686371.1068302; Wed, 28 Feb 2024 01:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9Dg-00072A-EB; Wed, 28 Feb 2024 01:58:52 +0000
Received: by outflank-mailman (input) for mailman id 686371;
 Wed, 28 Feb 2024 01:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gbmv=KF=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rf9De-000724-Py
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 01:58:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e936becd-d5dc-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 02:58:49 +0100 (CET)
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 01:58:43 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::15) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Wed, 28 Feb 2024 01:58:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 01:58:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 19:58:41 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 19:58:39 -0600
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
X-Inumbo-ID: e936becd-d5dc-11ee-afd7-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6H+WbmxVg3p/IEnPkklGZ2IpZZy2Nces89eg20oviLGWv6opACTRzh2fN3Sa1oFgAmO1L4yH6VGgXINsPI4AA+O4mEpI4jLU5y0sbZk8ThTeeturMf/R5ioxF44y6Sjtg4QYW7cuZRVr1k4Af5jlkTPKBSCeaFHZ//Pi+A6ROb2IZqOvNM0z49OD/VwuA8bJFilkIpChQ9z/9Jf9xHtqsgxlOtlGQEtOimur6emVoCMF6IkwrX7lbLFtOeYpIiG4Ke0G8F+5vkBEJXhTn7W19y98+9okJA04sGX5qRzItX/nPdz0yexT+jsith1SDmZZ4J0NR96kRjnpTfp8GNaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7st0nfvYqfoUDlhUdhHj6eV1a5dpb/v+ibFIxsOD8gg=;
 b=nHJa4MeMmjA2/OEv736MOubOOqWEwPPRfVsnghcPZjzeReQz05Hp/gAOuYflQuwRD9NYGmIP6QYtTJF1Kp04+NSo61uuUcyImgk2wZASVnMxyDC54f15Ek5DCJCDtqJxusTioRwnUgfdNoKOV3mPGDdnfsPNwZnd9Vn0GMtxHrQ0yAz0l29F9dnSDtw3N4EvKq31iyDmHfs7EwRQ/m8ZHrWNzdyatyXD73W9UzKXM+h/jZkqaSjw7jF2m8dFLiB7FMnJoEQIJsEh2TQaqpFr5pz4MkJTqysHrUJDbxqEx9wLs2ldItN+wB9F8Xj82/tXSWJKCpTnjgCZVexxvQspjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7st0nfvYqfoUDlhUdhHj6eV1a5dpb/v+ibFIxsOD8gg=;
 b=oO8LAzeeI3TOnkXGBH342y/ddQ0Z5F/BIsC0xXm+PVGJyj44iQyK0VB1mqLiWDvozDgEU7PMbZs/HYzsa2mDkwk63ZKziWuthyC9R3kyQ6VhLSekV8zauCMbDC3C1FKKgwFAzpX6XaSYOcpzucnEFwcJW+gwSjQL3S6kp8koE1A=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
Date: Wed, 28 Feb 2024 09:58:22 +0800
Message-ID: <20240228015822.56108-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BY5PR12MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f777dd-2c20-4af4-3de7-08dc3800ca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h0uB01p654lLevUXFjF2SYWz1p05XSx98E7ANH+bjkAQztnYzmiFBnr26sQVOKp5VNgX6daSE+tHoSxJq96U9XGpe1xpZo5uGwHe6Y9aBGqYgNGLYFPTbDDZBdbya0J2bZaaNAtot5AZr/3IOse5+gzt5rvTIsOf5gOMJYmt5MmDLZQvn9wRTRRIqJo4FJng203EVYJ7KCO+1CBHuAidL8rsqvoQq/OarG45lbgfJXMssuZK94feD55Dulskaim4JXfnRoJ/LQe+ewgET6fXfKDrYqx945s70A05qIJ04VPXymwAviatZKDWMHIokwwWHQx+ntn0l8x0RiKC2WD808rSp9QxeZngMUfdzwwL9gikHzrCMs5A5S+GnXrZzaCb45EHlO8xpsDjIHPRHdVQd8Y3epw4bqs4u0B85w9AKO3nt9EV7aZybdCrRQAhbvRUJ0Xji+7FH83ls8kkLeIgZ0w9oJC2LjzcPvtHRKxwweuEtH5cTo3CusZ1yXJHCRM0qc8OwDHQzhPO8sWN/o0fLc39ZfKeqj6txpgDWj36tPO3vWI000r7OcxJQe7FZQmu5Kfg+hvLYzE+QreHBV2NxDH7+i56jCYHfFgf7FEqFDABqRmgiKHVzsfVzfb8CL7D3Zi7xEDlRPBDC0IAV0z7csSTBFHqOHu7/gCheM4ZEYghlbv1m8jBlRruRGKMPL1h9+JTOElUXgDSY7FB+xxwsXBSRDKzSKlVxBbdbWNum6HGOqt1dlo84QCMfhCNPkcq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 01:58:42.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f777dd-2c20-4af4-3de7-08dc3800ca35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292

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
accordingly. Drop the in-code comment which seems to be outdated.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Do not do the multithread check.
---
 xen/arch/arm/smpboot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a84e706d77..d9ebd55d4a 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -66,7 +66,6 @@ static bool cpu_is_dead;
 
 /* ID of the PCPU we're running on */
 DEFINE_PER_CPU(unsigned int, cpu_id);
-/* XXX these seem awfully x86ish... */
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
 /* representing HT and core siblings of each logical CPU */
@@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
 
+    /* Currently we assume there is no multithread. */
+    cpumask_or(per_cpu(cpu_core_mask, cpu),
+               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+
     return 0;
 }
 
-- 
2.34.1


