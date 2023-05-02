Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54DC6F4221
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528490.821717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnjB-0006nk-Pa; Tue, 02 May 2023 10:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528490.821717; Tue, 02 May 2023 10:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnjB-0006lG-M4; Tue, 02 May 2023 10:59:25 +0000
Received: by outflank-mailman (input) for mailman id 528490;
 Tue, 02 May 2023 10:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mRu=AX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ptnjA-0006kf-Fm
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:59:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648248b0-e8d8-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 12:59:22 +0200 (CEST)
Received: from DM6PR05CA0052.namprd05.prod.outlook.com (2603:10b6:5:335::21)
 by PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 10:59:14 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::17) by DM6PR05CA0052.outlook.office365.com
 (2603:10b6:5:335::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20 via Frontend
 Transport; Tue, 2 May 2023 10:59:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 10:59:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 05:59:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 03:59:12 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 2 May 2023 05:59:11 -0500
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
X-Inumbo-ID: 648248b0-e8d8-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzaL5pvSdR6/FWIl5XJrQcaUB9qFlxhr2tzrHUsg/nQ8B3OETwOrH+Ua1y/AUpABhGJ8nDlNnjiY+TvV7RiWPw5aTl9/6YWtupUcilUIvUMVWemXb/6itFUDHI77Nc5QCTi/yif3Mshe5e+187xkpf8RLXRt9Cui1Z0C/qgpeqiikckh77qxZlCRpjtBh7crLOobsLDjIRj0UMX6v7DfS43FfAJPca8tScG8uXY7fwrfxGKt7VM9FPGGhD5PNk/rbTyOzfeWn0J+EkjLd8BcnsEtQsTl1BEYXKOSQk9Pf8Yl+zlmwvKXrR9W7IYkwa/cKCsNbwMbYXL5Hl8hZpwU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PNfiLfJ10whjs+8iQVR/PSPige/chRgA3zDIEpohM0=;
 b=nBJvrYCkscFgGLIrrQkgi2tqczU2DO5vaWGd3uFUTaQdkJSsgAgb0TB+ajpIqtzX1FOQrCN1Km758PrrF9Xf4/i8Kzpd5cjw38NAhe7aGcaPxuU8TBF3V17687rpFnBrD+1IciJeFr45iP46EiaxrwJq1kH5Gq1H/a/lMFO5dHuaPDaWmquvDTtzXtXYbo7wbOg5CKfr3vafN0ffviEKlkvKbMh6I3268NvKc/SEwQddMuFuZ2TPf/hJJE9ky7XlPdsQPM80M0U+6C+KYQmScUSoZcwUwn6u32owXiKKqJxcur/r0CxgtpcPV6qKVQ1UufE5zKwpvPXSZqm27xeShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PNfiLfJ10whjs+8iQVR/PSPige/chRgA3zDIEpohM0=;
 b=z9mGcYRSjjWrIvhFEG2GoM16AhGE/tK0alCTBGkOOp7ROsVx31t+Ru17frXUwHcUMS3Q9JWKRgUuRIeO34eCHN6lHxoLm2lp0ZwdsXU5W4Xqvvmg0qIe9V3vDxH+GMjn+wDya8XZoaLaSy0U+zJSzSGBRQpqJdC4Nz0RorWLHrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
Date: Tue, 2 May 2023 11:58:49 +0100
Message-ID: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT031:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ed3dd7-90c7-42a8-c0e9-08db4afc4417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ktANM2X2wpzfWF7vop5ZDS74ZOsRE8IF8bCVEKyXE0/s+TLLUnKBXSUs2myd2LIpy7N2BcY95ko1FqBRDIUfowqVvKxnvAmJDSYDuZL4SUzvxhDUbJaNQyR+S5AmlMz4O4KSqtmzvGX8Ckw1gE1SCTdBTURnuuDDBv4sFxRI6Z6H8TQe+d/zniawhuqZe5BrqG6ygWi4Sw32mwQ9hu0+58UBwL/hQSgNUWybr8rcNCL9/8os+n2YnyGhTjqibmfOcHm9ab+8MpyQ4mvQp0Kf1pgzpqu1YFckDpF7ZgB90lo7LYFvPfvpCZOPxvChGs2KiyjlWREUriZX/DbhHBVo0ARTos44N0hsc+EGugWjn6gnYjyd2hv1GOkD9w632V5aKr53yDy7MlcccjDqiU6Jj7jgXZyLVv6tG7SuF0I0IXPkKibjJ24X4uMSm9tcHbw9wthwk7H0rYxcAk25CvLzr0vzQpRwaGteOzM0uRyP7cSZd/yToLVBs91JxVTJAz+y0sGb+l/hC/1RxIM3ooiOYw3cxrlyo8DiuTJ2zDX75batf1bFWhAcP/iSxFkP308El3HnSdznD0e09y/T6Gx1yjek160lEbfXdYXIq5ad7GTXu4Ju63JFh1kw6nrlmAtTPmOMnDtneCEjC8pivT7AgdKuTPKNVUOQfocHQZOLZ0yQKgqIjnbqHpkdBOAIUK8VfWBLJmu9WoYq3xXN2cqU/RfjQj4AE6FHJITX+KYF0w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(26005)(1076003)(478600001)(36860700001)(47076005)(2616005)(426003)(336012)(186003)(83380400001)(86362001)(40460700003)(966005)(6666004)(40480700001)(82310400005)(8936002)(316002)(2906002)(54906003)(70586007)(6916009)(103116003)(8676002)(36756003)(356005)(70206006)(82740400003)(81166007)(41300700001)(5660300002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:59:13.6895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ed3dd7-90c7-42a8-c0e9-08db4afc4417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101

On some of the Arm32 based systems (eg Cortex-R52), smpboot is supported.
In these systems PSCI may not always be supported. In case of Cortex-R52, there
is no EL3 or secure mode. Thus, PSCI is not supported as it requires EL3.

Thus, we use 'spin-table' mechanism to boot the secondary cpus. The primary
cpu provides the startup address of the secondary cores. This address is
provided using the 'cpu-release-addr' property.

To support smpboot, we have copied the code from xen/arch/arm/arm64/smpboot.c
with the following changes :-

1. 'enable-method' is an optional property. Refer to the comment in
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
"      # On ARM 32-bit systems this property is optional"

2. psci is not currently supported as a value for 'enable-method'.

3. update_identity_mapping() is not invoked as we are not sure if it is
required.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

The dts snippet with which this has been validated is :-

    cpus {
        #address-cells = <0x02>;
        #size-cells = <0x00>;

        cpu-map {

            cluster0 {

                core0 {

                    thread0 {
                        cpu = <0x02>;
                    };
                };
                core1 {

                    thread0 {
                        cpu = <0x03>;
                    };
                };
            };
        };

        cpu@0 {
            device_type = "cpu";
            compatible = "arm,armv8";
            reg = <0x00 0x00>;
            phandle = <0x02>;
        };

        cpu@1 {
            device_type = "cpu";
            compatible = "arm,armv8";
            reg = <0x00 0x01>;
            enable-method = "spin-table";
            cpu-release-addr = <0xEB58C010>;
            phandle = <0x03>;
        };
    };

Although currently I have tested this on Cortex-R52, I feel this may be helpful
to enable smp on other Arm32 based systems as well. Happy to hear opinions.

 xen/arch/arm/arm32/smpboot.c | 84 ++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
index 518e9f9c7e..feb249d3f8 100644
--- a/xen/arch/arm/arm32/smpboot.c
+++ b/xen/arch/arm/arm32/smpboot.c
@@ -1,24 +1,100 @@
 #include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/smp.h>
+#include <xen/vmap.h>
+#include <asm/io.h>
 #include <asm/platform.h>
 
+struct smp_enable_ops {
+        int             (*prepare_cpu)(int);
+};
+
+static uint32_t cpu_release_addr[NR_CPUS];
+static struct smp_enable_ops smp_enable_ops[NR_CPUS];
+
 int __init arch_smp_init(void)
 {
     return platform_smp_init();
 }
 
-int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
+static int __init smp_spin_table_cpu_up(int cpu)
+{
+    uint32_t __iomem *release;
+
+    if (!cpu_release_addr[cpu])
+    {
+        printk("CPU%d: No release addr\n", cpu);
+        return -ENODEV;
+    }
+
+    release = ioremap_nocache(cpu_release_addr[cpu], 4);
+    if ( !release )
+    {
+        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n", cpu);
+        return -EFAULT;
+    }
+
+    writel(__pa(init_secondary), release);
+
+    iounmap(release);
+
+    sev();
+
+    return 0;
+}
+
+static void __init smp_spin_table_init(int cpu, struct dt_device_node *dn)
 {
-    /* Not needed on ARM32, as there is no relevant information in
-     * the CPU device tree node for ARMv7 CPUs.
+    if ( !dt_property_read_u32(dn, "cpu-release-addr", &cpu_release_addr[cpu]) )
+    {
+        printk("CPU%d has no cpu-release-addr\n", cpu);
+        return;
+    }
+
+    smp_enable_ops[cpu].prepare_cpu = smp_spin_table_cpu_up;
+}
+
+static int __init dt_arch_cpu_init(int cpu, struct dt_device_node *dn)
+{
+    const char *enable_method;
+
+    /*
+     * Refer Documentation/devicetree/bindings/arm/cpus.yaml, it says on
+     * ARM 32-bit systems this property is optional.
      */
+    enable_method = dt_get_property(dn, "enable-method", NULL);
+    if (!enable_method)
+    {
+        return 0;
+    }
+
+    if ( !strcmp(enable_method, "spin-table") )
+        smp_spin_table_init(cpu, dn);
+    else
+    {
+        printk("CPU%d has unknown enable method \"%s\"\n", cpu, enable_method);
+        return -EINVAL;
+    }
+
     return 0;
 }
 
+int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
+{
+    return dt_arch_cpu_init(cpu, dn);
+}
+
 int arch_cpu_up(int cpu)
 {
-    return platform_cpu_up(cpu);
+    int ret = 0;
+
+    if ( smp_enable_ops[cpu].prepare_cpu )
+        ret = smp_enable_ops[cpu].prepare_cpu(cpu);
+
+    if ( !ret )
+        return platform_cpu_up(cpu);
+
+    return ret;
 }
 
 void arch_cpu_up_finish(void)
-- 
2.17.1


