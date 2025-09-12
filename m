Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CABB55544
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 19:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122363.1466110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux79I-0004mw-6Z; Fri, 12 Sep 2025 17:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122363.1466110; Fri, 12 Sep 2025 17:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux79I-0004kF-3P; Fri, 12 Sep 2025 17:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1122363;
 Fri, 12 Sep 2025 17:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Blw0=3X=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ux79G-0004k9-V9
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 17:01:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2417::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18682c2d-8ffa-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 19:01:17 +0200 (CEST)
Received: from BYAPR07CA0072.namprd07.prod.outlook.com (2603:10b6:a03:60::49)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 17:01:13 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::fc) by BYAPR07CA0072.outlook.office365.com
 (2603:10b6:a03:60::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 17:01:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 17:01:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 12 Sep
 2025 10:01:12 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Sep
 2025 12:01:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Fri, 12 Sep 2025 10:01:08 -0700
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
X-Inumbo-ID: 18682c2d-8ffa-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czQP1mDVyw//DwTw0gsdKPcX/M8VueT06XAsl58hWm/ccwnNczArLR9fIhE+AI/HoZ4hls/q5Rzz2TfGfXR+8NZ6G/mRAhu8HElatXMQORPw7emA5USN7pmeJNsYU1KtkNjI/4ye4nBwFkso/fljeRYo3t/8usuSEsZiWbbEKh8FqZ94N9d2LUwqRtClU6RvL4HXTra4Mnh9KO+I4G+VDysIhDYLSlsVgHVIp2jKOEmfdA6c4poomALbfjqCqvS1sJHlwhglchXvnKeeC0h06VvvyDFCtuwjwTa/YoFmK03ePoctIO9q2KVyrcdVS2o9Skwtb5vo/TKrEhQocxiBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27DHt0J20Pg2g97L+tvBsc3Z3ZrT3sGO/+bEzgDSuu0=;
 b=BXCMxPegprTnkbJbnijbQuUQLElrFdI+7vyzjCqgbq4AjDu5cv0H6duG0tGDs9x+F3sg8sJwwpAVHTPw7Kz/cjJ8p7R3QTQuD95LhHF2wT59quT7PJk8QZirc2zPjuTL4DbmVY+9bL6TJ9wcfHhEr7AyKYYxWCnpfR2x5emHrKwqNjrJxzSM4trL2uhUs41Vfz2VPREHGjMDpyAY7AyZTjYoFkcbw0ishHpqkqDtQOhaE6YoNMObxjl2l6gDKuiYM9LydDJv0rW5WspoDAJ+4rQ61utP++6xcohXT3gmzbs0Mp6QuhOPAxp7+J4FySU03/m4xMlflx8Md31zBZQHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27DHt0J20Pg2g97L+tvBsc3Z3ZrT3sGO/+bEzgDSuu0=;
 b=OgpIuw9CThUbwvkOmQg3Qjki6FErwFqL1FhOP1V1TTV9yfdjnRJHPZOmNQcRK1jOhyHxZ7ckii8gH13b5a31qMBkpI19BO1S5NnaXCqsAQLsAzOjhfYJ0GLLLD4RIkwVHetXSlSikMMd6Ds2vWNe68jegM83tLOfSYrWDK1bzrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
Date: Fri, 12 Sep 2025 18:00:55 +0100
Message-ID: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|SJ5PPFABE38415D:EE_
X-MS-Office365-Filtering-Correlation-Id: f37914e5-8547-4824-6da1-08ddf21dfab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXbOJodezbuQVtmM8LOgO3tveVoqKNwpK5pZJqc5V/rCH8vqCh6++7Feym70?=
 =?us-ascii?Q?lcxMaNW9X1xUaiXGmC5P/5GRCbhH834Cj+HdSeN3vkxuKgs+Xs6lDcm7kGpM?=
 =?us-ascii?Q?8m4wggzGUgX9i355rncAZDiO2aCEiT1ZmYjPZMXKvsr3Cr8auoT9sfg8tDX1?=
 =?us-ascii?Q?gAiJVH9Nbiel68xuw85trIjgB2IgShFT947653p/fniNWRXp7TKIU+sbKieK?=
 =?us-ascii?Q?GGZM6VkQcu2Yc98RRX7AqJYXTw9HewE7iBjj2jfUIoci91iR7efFqQxySQq6?=
 =?us-ascii?Q?64RdPSX/c9ezFg7z3WW3Mc5cbDXTV1hr/Qu/T6IoPJOmDibXY45/osqazeCU?=
 =?us-ascii?Q?xdzkYnkUvEVy+sosoJII5w48ru9ANU/yWCMy8+uv0EtVCvwX2P21V9c/TZbk?=
 =?us-ascii?Q?+ZtrssrJ7L2ADtk/4YZPHJe0RqXPzc1daoUVBCBxCbLgARov1MVhStZ67Opn?=
 =?us-ascii?Q?1ZlYk6aDLgjbgIgqkyBCT0WUcHUWYyFqV/iFOEGWbZZOdlSpS267/8RvnX8b?=
 =?us-ascii?Q?RQBv49r+yiSh+l6rOhAc/9BQdDhabOvz+UI9TgzvR/m7ebmYNogEuLb9jjAH?=
 =?us-ascii?Q?PTJxhrjcZHjhSm+GE/IWmWK5u9Kd+0CFph37mohC/DHaxqSvJ3nQIW2f4S8r?=
 =?us-ascii?Q?kGMIvjXPsTM/l9ZNaJJlsez8+ik3Te6pHFFaXarezJ1D129XPsR0gvzWNSHh?=
 =?us-ascii?Q?Xc6oCKwAa8V3G8AWAwGrUzIn2LVBonL2oIc+K7cK9M1jlwrOoAi0VadJjFT2?=
 =?us-ascii?Q?SHgoSLJJ4xR9ygv8mWC+Yvbfk5u3j5lRNN9OGS8SvQhpyBZR8snFjYvx0fxZ?=
 =?us-ascii?Q?SnkANXXMncs+TTHCj4NtraFNqDvPL53Rk0SwRtvlEG/OpGM78BqQAtQYkTHV?=
 =?us-ascii?Q?ZBKOVzVGqPnUIFWmKy/6ENGCpSP8X77L80njkjjHavDKCfcnEDrbmp8mAbtA?=
 =?us-ascii?Q?yqn6yXODN2oHc+BO6FYw5Jv0BF67Qd9rI2pEAcHMqcMIu60RbswjQK7PVXwb?=
 =?us-ascii?Q?8nN56oYxIFeZHfZ/WsrWEMw1D5yZHD/RUh6G9rm4lJzbM+TEsWRzxHZQtF5a?=
 =?us-ascii?Q?IRrh82teenvYZpd39uFPtCUY6k5Qy7pjXJEufeYmdYpicrb/1oQkhu+jiQZz?=
 =?us-ascii?Q?KgcKiQTRyo6mah5O91t9+ElHKkC3aRcOYByalknCYsouJMsewo+daSOrITND?=
 =?us-ascii?Q?/nqlwx3V/75uDsqbdKLkT6fvyZa+AH2XIiZqATV++2EnTAnW9Vz+z0AUnAHk?=
 =?us-ascii?Q?oZ7e36bXYbNxvXCoXmbCE2up/SN9XRJQ5/6l/4DMf91AoV5HjqVYdeCDKScA?=
 =?us-ascii?Q?oqR6Q6OMNWRxMBdefJvpXDMkxnnIu5K1grxFXDmr5RjTJpAbcjsL0K2U0XRb?=
 =?us-ascii?Q?e0AFg+bnR6Tu/ggd9jTOv4BldVWFs+DarOD/Y+xDG5Q0r7EI8zA8si+OcbiO?=
 =?us-ascii?Q?VqPBYVGCSyxma0KK8My2V1NIFvjCmhpYFi0o8CfGFOr3YbNlg+YT7u98KKLN?=
 =?us-ascii?Q?5tFsY10Y8bmMSi3fIP45WZ7nWyXiz1r/jqRi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 17:01:12.9171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37914e5-8547-4824-6da1-08ddf21dfab3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D

Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
Test that Xen is able to generate SGIs.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
One of the aim of functional safety is to test hw/sw interface. This means that
Xen is able to configure the hardware correctly for the desired functionalities.

Normally this is tested from the VMs. For eg if a VM is able to receive irq, this
implies that Xen has configured the GICv3 interface 'correctly'. However this is
a high level (or integration) test which uses not only the GICv3 interface
between Xen and VM, but the interrupt injection code for Xen to VMs.

We want to have some kind of unit tests to check that Xen is able to receive
various interrupts, set priorities, etc. Here, we have written unit tests for
software generated interrupts (SGIs) as example.

These tests are expected to be triggered as Xen boots (right after Xen has
initialised the GICv3 interface ie gicv3_init(). The aim of this test is to
check whether Xen can trigger SGIs after gicv3_init() is invoked. If so, we can
claim that gicv3_init() was done properly to be able to trigger SGIs. Likewise
we will have tests to check for priorities, SPIs, etc.

A script will parse the logs and claim that Xen is able to trigger SGIs.

 xen/arch/arm/Kconfig  |  8 ++++++++
 xen/arch/arm/gic-v3.c |  7 +++++++
 xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 950e4452c1..739f99eaa9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -73,6 +73,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
 
+config GICV3_SELFTEST
+    bool "GICv3 driver self test"
+    default n
+    depends on GICV3
+    ---help---
+
+      Self tests to validate GICV3 driver.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 4e6c98bada..eb0c05231c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_GICV3_SELFTEST
+    send_SGI_self(GIC_SGI_EVENT_CHECK);
+    send_SGI_self(GIC_SGI_DUMP_STATE);
+    send_SGI_self(GIC_SGI_CALL_FUNCTION);
+    send_SGI_self(GIC_SGI_MAX);
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index d922ea67aa..5cb58cdb92 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -346,6 +346,26 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
      */
     smp_rmb();
 
+#ifdef CONFIG_GICV3_SELFTEST
+    switch (sgi)
+    {
+    case GIC_SGI_EVENT_CHECK:
+        printk("GIC_SGI_EVENT_CHECK received\n");
+        break;
+    case GIC_SGI_DUMP_STATE:
+        printk("GIC_SGI_DUMP_STATE received\n");
+        break;
+    case GIC_SGI_CALL_FUNCTION:
+        printk("GIC_SGI_CALL_FUNCTION received\n");
+        break;
+    case GIC_SGI_MAX:
+        printk("GIC_SGI_MAX received\n");
+        break;
+    default:
+        panic("Unknown SGI triggered\n");
+        break;
+    }
+#else
     switch (sgi)
     {
     case GIC_SGI_EVENT_CHECK:
@@ -361,6 +381,7 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
         panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
         break;
     }
+#endif
 
     /* Deactivate */
     gic_hw_ops->deactivate_irq(desc);
-- 
2.25.1


