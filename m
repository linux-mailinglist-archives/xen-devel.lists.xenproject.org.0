Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A748CEC84
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729962.1135313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdox-00042D-OC; Fri, 24 May 2024 22:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729962.1135313; Fri, 24 May 2024 22:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdox-0003ys-KY; Fri, 24 May 2024 22:55:31 +0000
Received: by outflank-mailman (input) for mailman id 729962;
 Fri, 24 May 2024 22:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdow-0003hQ-L7
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:55:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b661fd4d-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:55:28 +0200 (CEST)
Received: from BLAPR03CA0088.namprd03.prod.outlook.com (2603:10b6:208:329::33)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 22:55:24 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::14) by BLAPR03CA0088.outlook.office365.com
 (2603:10b6:208:329::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27 via Frontend
 Transport; Fri, 24 May 2024 22:55:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:55:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:23 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:55:22 -0500
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
X-Inumbo-ID: b661fd4d-1a20-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHKRq0WLq+gvjaSBU2cBm+tOtKgFYAloEbDoytH7ShGaisA+nWjqSHfCeR54E9z51o+0otJioyy62fZW4rXxvH/lpNs5lImuQzjkJbETUf0fIr63Nfw5nEqPNXQmEbPgyHjPQksjnVQpFFyEHXukn1PeBXJqzbMPjPcXVgMuxrz1jGWM5pFO1o7X+BI6xLVHu/PjXwdJu/o+9ZtDFEp49cvUNjx8vvVpJcU/1UtP8I4K8AtrpBFkNhl4fva+hg4j2ApAL6KYEwMvYfb1HHNkp/AvjXv6fsB9YkwGuarm1azj2CQKaGmfLoSaG4zFsXGT6+zQLq0ix+qKrC4PISoPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzV5nEyCRZZ9wvgQ5/ihrFl2ogjKMReVCJclNQHfPF0=;
 b=GhCUGIJsy+h6Eb2FQ9I//g+AqcFCWpvi7j0oR5TtapXwYD85Et/JA2s15vhOtA3+UzpdzqIScMYZMIojxo2PhzhtJXEnWUZlyJGT43KNwmFyVgPNHLxTFc+/rgCwuTJ+ZnWhn/+eaztYCKb0zTgQP+ZRj4blkXK6clOvgzjsL0yjRLnSzOTLy6FVMxeXp8VK9EBJaD71sAXHODeLah9ScqJYNycLz2gtEgJ85tzrCPSDUiA8kq81JH2HzjNFJUPstMIO8uENgU6IN7QmCfZTfGF1cPFkrra3D+a/NpkNi82Y8r8EJlsAgRRlS2THFI5RRWES+K0UvcOz41621+znig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzV5nEyCRZZ9wvgQ5/ihrFl2ogjKMReVCJclNQHfPF0=;
 b=Lr3XcTWlRaOLU2k/CYK7CGyJJuzf+av0wIXQUNYkNc0Y47kDqDnMeap1EfWmPqrzyEMff8fR5kgPFXvkwsaOrkPwa9xhsFls14jfA7l49un8LixuCTTXkwqVupkwgiGw9UHbwwpSZra5BwdtwNi92XFBnK/MPN/zKNXG1dSS1+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v4 1/4] xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains
Date: Fri, 24 May 2024 15:55:19 -0700
Message-ID: <20240524225522.2878481-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be1aaed-b1e3-49ab-7fd0-08dc7c4498bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKxoSez6zEGXESf2xzEkSlkhtrjlI6zvRjKJYtL8eGwP0v6qqkZKAGzs6Ys5?=
 =?us-ascii?Q?2zcXcYWc5qresS26+ofH7GV4O9vn/upHrWsS+/Xd9JF/fVC7ziLH1rxJnfHb?=
 =?us-ascii?Q?4d2IZNNFZkYJWDRWn+l2zUWr1VYS1owaKF9SyQ+DSmXKDil6VVEi8glSxByF?=
 =?us-ascii?Q?sxy03qaif6k0OiYEcFsWw4rbI4X46IdaxPD18oQVou8UNSw6g9kk9UV4vWLL?=
 =?us-ascii?Q?rNFRvR4GUmvn5LCGXMFSLI+un0Y5stMgTrgznUUzZdtMxtPnBgN03GHsRwhN?=
 =?us-ascii?Q?Q1cu/w8zK+xa82hVILrqVLh8xYoR4j5Til655Cr45JqhM2wtqFkcMMPTqn0Y?=
 =?us-ascii?Q?tzHxeJAc3RYpkn9Wrh6MEO1F8I1MxX9gG/F43BKTOFVJGDABF9wLm9LTJ3vA?=
 =?us-ascii?Q?+FOEP5n5AmhdsLyWmaHIjbTid/o1URydnIH4lcpjk/OX5T3yPpXg2vGnf0kA?=
 =?us-ascii?Q?Psf1Hy3p6+wmNQaC/KXjy9Ye/mPwNGAsvmybVvVCcuwHulxQqUyrFDwMqHnS?=
 =?us-ascii?Q?ZMtVT3iiJsW3U/Y1rEGONxjU5tBl6BCbqCSfhIqlB/DO89wUP+wr8ZuAxqty?=
 =?us-ascii?Q?TQ/Nd4bp/Q+D6h+hn3b1ipHAPDhZpDlvuemZZTplHl+LQVmLeMkcBJq3hsTZ?=
 =?us-ascii?Q?5vDgmNbldgAijnhx1lfPYaOXmy0tQZxwImskua2FvwLF28sS5BCzIqGAxNlH?=
 =?us-ascii?Q?YZG8te5lf36YMnKBXD1FYx/3IrMHIFvUu06woQD8sxYXLXlzlPrriGu+CG1o?=
 =?us-ascii?Q?pY5W6ZmUYKRFmaRVJF460Z0KQ+0HmfaxO2V56uBB7La9kYQFl5BmPReLWMfh?=
 =?us-ascii?Q?NGmQHelKF8NatsFEILBsubdc4Zv8MMYhyL00xGRRKe+jtO8uGYRttolp/fgH?=
 =?us-ascii?Q?tmj/VmwS+gvIEson5Vl5gCpiKZCGuV8sGi2erPVWtqhOBGvciqPoHxbwFwCW?=
 =?us-ascii?Q?W4fegxvZUzcpM43FQ3cpkUl6BZ65eY/+1SgeUC+Ne+XBKTikD2I8sKmhJuiV?=
 =?us-ascii?Q?vKUMNb6f1gg6yzL31qktbT7YBZNQuPkyUEKrBT2YU2W2SwXjzSBPicl+WrOM?=
 =?us-ascii?Q?XxfHORJWceML6j5G/daih+HEVUA73DO6v9Eh31qLFbiAfz++Wv8Zf6dZmaag?=
 =?us-ascii?Q?LBpZE6ef95uG7VoDeXpfZdeaILE1+eJ0OEJ96UhQDP2Iq+QyUWrCoXg71o99?=
 =?us-ascii?Q?VExruOf/gNJPNNyiTWrpkuuYtDnh3xO461SilVw/6TJ85vng/KDba4CFdR4i?=
 =?us-ascii?Q?HM/2KRPlC1JcgtiIIkZN5x85UgRAHAGXOYjweV82J5oJL4Q4N1GJvSf/YhHc?=
 =?us-ascii?Q?rYydJArzOyCXEX1ydqjpXh+MLAUVRatdYnLQaky5nm4KBdJzjqhP+Mt8OQZf?=
 =?us-ascii?Q?byLolmwvURxK3f9Y4EDI8vSGecqw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:55:24.1344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be1aaed-b1e3-49ab-7fd0-08dc7c4498bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177

From: Henry Wang <xin.wang2@amd.com>

Currently, users are allowed to map static shared memory in a
non-direct-mapped way for direct-mapped domains. This can lead to
clashing of guest memory spaces. Also, the current extended region
finding logic only removes the host physical addresses of the
static shared memory areas for direct-mapped domains, which may be
inconsistent with the guest memory map if users map the static
shared memory in a non-direct-mapped way. This will lead to incorrect
extended region calculation results.

To make things easier, add restriction that static shared memory
should also be direct-mapped for direct-mapped domains. Check the
host physical address to be matched with guest physical address when
parsing the device tree. Document this restriction in the doc.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 3 +++
 xen/arch/arm/static-shmem.c           | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..c994e48391 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -591,6 +591,9 @@ communication.
     shared memory region in host physical address space, a size, and a guest
     physical address, as the target address of the mapping.
     e.g. xen,shared-mem = < [host physical address] [guest address] [size] >
+    Note that if a domain is direct-mapped, i.e. the Dom0 and the Dom0less
+    DomUs with `direct-map` device tree property, the static shared memory
+    should also be direct-mapped (host physical address == guest address).
 
     It shall also meet the following criteria:
     1) If the SHM ID matches with an existing region, the address range of the
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 78881dd1d3..5bf1916e5e 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -235,6 +235,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                    d, psize);
             return -EINVAL;
         }
+        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
+        {
+            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
+                   d, pbase, gbase);
+            return -EINVAL;
+        }
 
         for ( i = 0; i < PFN_DOWN(psize); i++ )
             if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
-- 
2.25.1


